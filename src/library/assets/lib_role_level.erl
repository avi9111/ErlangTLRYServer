%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     等级、经验
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_level).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_205.hrl").

%% API
-export([
    do/3,
    event/2,
    add_exp/3,
    cost_exp/3,
    is_exp_enough/2,
    gm_set_level/2,
    handle_info/2
]).

-define(exp_log, #{
    old_level => 0,
    old_exp => 0,
    amount => 0,
    new_level => 0,
    new_exp => 0,
    opt => 0
}).

do(20501, PS, #cs_level_exchange_box{id = Id}) ->
    exchange_box(PS, Id);
do(20502, PS, _Req) ->
    lib_role_guild:level_up_prac_max_lv(PS);
do(20503, PS, _Req) ->
    level_up(PS);
do(_Cmd, _PS, _Req) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(_PS, _) ->
    ignore.

handle_info({'set_role_lv', Lv}, PS) ->
    gm_set_level(PS, Lv);
handle_info(_, _) ->
    skip.

save(PS) ->
%%    lib_role_db:save_role_basic_data(PS);
    #role_state{id = RoleID, level = Level, exp = Exp} = PS,
    lib_role_db:save_role_level(RoleID, Level, Exp).

exchange_box(PS, Id) ->
    case catch check_exchange_box(PS, Id) of
        {ok, RoleID, Costs, RewardList, BoxWeekLimitNew} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_LEVEL_EXCH_BOX),
            lib_drop_api:give_drop_asyn(RoleID, RewardList, ?OPT_LEVEL_EXCH_BOX),
            lib_role_kv:set_kv(RoleID, ?KEY_EXH_BOX_WEEK_LIMIT, BoxWeekLimitNew),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_exchange_box(PS, Id) ->
    #role_state{id = RoleId, level = Lv, exp = Exp} = PS,
    Lvs = conf_level_box:get_lvs(),
    lists:member(Lv, Lvs) orelse erlang:throw({error, ?RC_LEVEL_CANT_EXCHANGE_BOX}),
    Conf = conf_level_box:get(Id),
    Conf =/= undefined orelse erlang:throw({error, ?RC_LEVEL_BOX_NOT_EXIST}),
    #{lv := NeedLv, exp := NeedExp, reward := RewardList, times_per_week := TimesLimit} = Conf,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_CANT_EXCHANGE_BOX}),
    Exp >= NeedExp orelse erlang:throw({error, ?RC_EXP_LIMIT}),
    BoxWeekLimit = check_refresh_week_limit(RoleId, Id),
    {_BoxId, _ExchTime, Num} = util:list_find(Id, 1, BoxWeekLimit, {Id, 0, 0}),
    Num < TimesLimit orelse erlang:throw({error, ?RC_LEVEL_BOX_EXH_OVER_WEEK_LIMIT}),
    BoxWeekLimitNew = lists:keystore(Id, 1, BoxWeekLimit, {Id, time:unixtime(), Num + 1}),
    Costs = [{?AST_EXP, NeedExp}],
    {ok, RoleId, Costs, RewardList, BoxWeekLimitNew}.

check_refresh_week_limit(RoleId, Id) ->
    BoxWeekLimit = lib_role_kv:get_kv(RoleId, ?KEY_EXH_BOX_WEEK_LIMIT, []),
    case length(BoxWeekLimit) =/= 0 of
        true ->
            {_BoxId, ExchTime, _Num} = util:list_find(Id, 1, BoxWeekLimit, {Id, 0, 0}),
            {WeekBeginTime, _} = time:get_week_unixtime(),
            BoxWeekLimitNew = ?iif(ExchTime < WeekBeginTime, lists:keystore(Id, 1, BoxWeekLimit, {Id, WeekBeginTime, 0}), BoxWeekLimit),
            lib_role_kv:set_kv(RoleId, ?KEY_EXH_BOX_WEEK_LIMIT, BoxWeekLimitNew),
            BoxWeekLimitNew;
        false ->
            BoxWeekLimit
    end.

%% @doc 手动升级
level_up(PS) ->
    case catch check_level_up(PS) of
        ok ->
            PS1 = add_exp(PS, 0, ?OPT_ACC_LV_UP),
            Rec = #sc_level_up{level = PS1#role_state.level},
            {ok, Bin} = prot_msg:encode_msg(20504, Rec),
            lib_role_send:send_to_role(PS1, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_level_up(PS) ->
    #role_state{level = OLv, exp = OExp, id = RoleID} = PS,
    NLv = OLv + 1,
    Conf = conf_level:get(OLv),
    #{exp := NeedExp, is_need_practice := NeedPLv} = Conf,
    NeedExp =/= 0 orelse erlang:throw({error, ?RC_LEVEL_MAX_LEVEL}),
    ConfNext = conf_level:get(NLv),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_LEVEL_MAX_LEVEL}),
    OExp >= NeedExp orelse erlang:throw({error, ?RC_LEVEL_EXP_NOT_ENOUGH}),
    ?iif(NeedPLv > 0, practice_is_satisfy(NeedPLv, RoleID), true) orelse erlang:throw({error, ?RC_GUILD_PRACTICE_NOT_ENOUGH}),
    ok.

%% -----------------------------------------------------------------------------

%% @doc 加经验
add_exp(PS, AExp, OpType) ->
    #role_state{id = RoleID, exp = CExp, level = CLv} = PS,
    if
        AExp =:= 0 orelse OpType =:= ?OPT_GM ->
            Exp = AExp;
        true -> %% world lv & pioneer lv
            WorldLv = util_svr:get_world_lv(),
            WorldRatio = conf_world_lv_decay:get_ratio(CLv - WorldLv),
            PioneerLv = util_svr:get_pioneer_lv(),
            TmpLv = actual_lv(CLv, CExp),
            PioneerRatio = conf_pioneer_lv_add:get({TmpLv, PioneerLv - TmpLv}),
            Exp0 = erlang:floor(AExp * WorldRatio * (1 + PioneerRatio)),
            TlExp = lib_role_kill_mon_exp:tl_dan_addition(RoleID, Exp0, OpType),
            Exp = TlExp + Exp0
    end,
    {NLv, NExp} = add_exp_(RoleID, CExp + Exp, CLv, OpType),
    PS1 = PS#role_state{level = NLv, exp = NExp},
    Log = ?exp_log#{
        old_level => CLv, old_exp => CExp, amount => Exp,
        new_level => NLv, new_exp => NExp, opt => OpType
    },
    refresh_level(PS1, CLv, Log, OpType).

add_exp_(RoleID, Exp, LvAcc, OpType) ->
    case conf_level:get(LvAcc) of
        #{exp := NeedExp, auto := Auto, is_need_practice := NeedPLv} when Auto =:= 1, NeedExp > 0, Exp >= NeedExp, NeedPLv =:= 0 ->
            add_exp_(RoleID, Exp - NeedExp, LvAcc + 1, OpType);
        #{exp := NeedExp, auto := Auto, is_need_practice := NeedPLv, is_keep := IsKeep, keep_mul := KeepMul} when NeedExp > 0, Exp >= NeedExp, NeedPLv > 0 ->
            IsSatisfy = practice_is_satisfy(NeedPLv, RoleID),
            if
                IsSatisfy andalso (Auto =:= 1 orelse OpType =:= ?OPT_ACC_LV_UP) ->
                    add_exp_(RoleID, Exp - NeedExp, LvAcc + 1, OpType);
                IsKeep =:= 0 ->
                    {LvAcc, NeedExp};
                true ->
                    CanStoreExp = NeedExp * KeepMul,
                    {LvAcc, ?iif(Exp >= CanStoreExp, CanStoreExp, Exp)}
            end;
        _ ->
            {LvAcc, erlang:floor(Exp)}
    end.

actual_lv(Lv, Exp) ->
    case conf_level:get(Lv) of
        #{exp := NExp} when Exp >= NExp, NExp > 0 ->
            actual_lv(Lv + 1, Exp - NExp);
        _ ->
            Lv
    end.

is_exp_enough(PS, Amount) ->
    #role_state{exp = Exp} = PS,
    Exp >= Amount.

%% @doc 扣经验之前要先做判断，不能导致降级
cost_exp(PS, CostExp, OpType) ->
    #role_state{exp = Exp0, level = Lv} = PS,
    Exp1 = max(Exp0 - CostExp, 0),
    Log = ?exp_log#{
        old_level => Lv, old_exp => Exp0, amount => 0,
        new_level => Lv, new_exp => Exp1, opt => ?OPT_LEVEL_EXCH_BOX
    },
    PS1 = PS#role_state{exp = Exp1},
    refresh_level(PS1, Lv, Log, OpType).

practice_is_satisfy(NeedPLv, RoleID) ->
    PracticeSkill = lib_role_guild:get_practice_skill(RoleID),
    lists:all(fun({_, Lv}) -> Lv >= NeedPLv end, PracticeSkill).

%% @doc 刷新等级、属性等
refresh_level(PS, OldLv, Log, OpType) ->
    #role_state{id = RoleID, exp = NewExp, level = NewLv} = PS,
    Rec = #sc_level_change{level = NewLv, exp = NewExp, op_type = OpType},
    {ok, Bin} = prot_msg:encode_msg(20505, Rec),
    lib_role_send:send_to_role(PS, Bin),
    case OldLv =/= NewLv of
        true ->
            sys_log:log_level_op(RoleID, Log),
            ?EVENT(RoleID, 'level_up'),
            lib_role_attr:refresh_combat_power(PS);
        _ ->
            PS
    end.

%% GM设置等级
gm_set_level(PS, Lv) ->
    #role_state{exp = OldExp, level = OldLv} = PS,
    NewPS = PS#role_state{level = Lv},
    Log = ?exp_log#{
        old_level => OldLv, old_exp => OldExp, amount => 0,
        new_level => Lv, new_exp => OldExp, opt => ?OPT_GM
    },
    refresh_level(NewPS, OldLv, Log, ?OPT_GM).