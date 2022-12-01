%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     江湖历练
%%% @end
%%% Created : 27. 十一月 2018 8:50
%%%-------------------------------------------------------------------
-module(lib_role_kill_mon_exp).

-include("role.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("scene_objs.hrl").
-include("vow.hrl").
-include("proto/prot_523.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    use_dl/2,
    use_tl/2,
    cross_day/1,
    send_info/1,
    handle_info/2,
    get_role_data/1,
    dl_dan_addition/3,
    tl_dan_addition/3
]).

-define(TL_DAN, 1).
-define(DL_DAN, 2).

-define(TL_MUL, 1).
-define(DL_MUL, 4).

do(52301, PS, _Req) ->
    send_info(PS);
do(_, _, _) ->
    skip.

handle_info({mon_exp, MID}, PS) ->
    kill_mon_add_exp(PS, MID);
handle_info(_, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {HaveTimes, TlKeepExp, DlKeepExp, LastCheck} = get_role_db_data(RoleID),
    RoleData =
        case time:is_today(LastCheck) of
            true ->
                #{have_times => HaveTimes, keep_exp => TlKeepExp, dl_keep_exp => DlKeepExp, last_check => LastCheck, updated => false};
            _ ->
                #{daily_add_times := AddTimes, max_times := MaxTimes} = conf_kill_mon_exp_info:get(),
                HaveTimesN = min(HaveTimes + AddTimes, MaxTimes),
                #{have_times => HaveTimesN, keep_exp => TlKeepExp, dl_keep_exp => DlKeepExp, last_check => time:unixtime(), updated => true}
        end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    send_info(PS, RoleData).

send_info(PS, RoleData) ->
    #{keep_exp := KeepExp, have_times := HaveTimes, dl_keep_exp := DlKeepExp} = RoleData,
    MsgRecord = #sc_lake_experience_info{
        keep_exp = KeepExp, have_times = HaveTimes, dl_keep_exp = DlKeepExp
    },
    {ok, Bin} = prot_msg:encode_msg(52302, MsgRecord),
    lib_role_send:send_to_role(PS, Bin),
    ok.

%% 使用天灵丹
use_tl(PS, Num) ->
    use_dan(PS, ?TL_DAN, Num).

use_dl(PS, Num) ->
    use_dan(PS, ?DL_DAN, Num).

use_dan(PS, Type, Num) ->
    case catch check_use_dan(PS, Type, Num) of
        {ok, RoleData, KeepExp, AddExp, HaveTimes} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_lake_experience_use{
                type = Type, add_exp = AddExp, keep_exp = KeepExp, have_times = HaveTimes
            },
            {ok, Bin} = prot_msg:encode_msg(52304, MsgRecord),
            lib_role_send:send_to_role(PS, Bin),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_use_dan(PS, Type, Num) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{have_times := HaveTimes, keep_exp := TlKeepExp, dl_keep_exp := DlKeepExp} = RoleData,
    #{tl_dan_exp := TlAddExp, dl_dan_exp := DlAddExp} = conf_level:get(Lv),
    case Type of
        ?TL_DAN ->
            HaveTimes >= Num orelse erlang:throw({error, ?RC_USE_TL_DAN_LIMIT}),
            NewHaveTimes = HaveTimes - Num,
            AddExp = TlAddExp * Num,
            NewKeepExp = AddExp + TlKeepExp,
            NewRoleData = RoleData#{have_times => NewHaveTimes, keep_exp => NewKeepExp};
        ?DL_DAN ->
            NewHaveTimes = 0,
            AddExp = DlAddExp * Num,
            NewKeepExp = AddExp + DlKeepExp,
            NewRoleData = RoleData#{dl_keep_exp => NewKeepExp}
    end,
    {ok, NewRoleData, NewKeepExp, AddExp, NewHaveTimes}.

%% -----------------------------------------------------------------------------

%% 杀怪额外加成or衰减
kill_mon_add_exp(PS, MID) ->
    #mon{level = Lv, exp = Exp} = conf_mon:get(MID),
    lib_role_daily_thief:kill_mon(PS#role_state.id, MID),
    kill_mon_add_exp(PS, MID, Lv, Exp).

kill_mon_add_exp(PS, MonID, MonLv, Exp) when Exp > 0 ->
    #role_state{id = RoleID, role_scene = RoleScene, level = Lv, sid = RoleSid,
        team_id = TeamID, guild_id = GuildID} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    #{kill_num := KillList, level_effect := LvEffect} = conf_kill_mon_exp_info:get(),
    case lib_scene_api:is_normal_scene(SceneID) of
        true ->
            Key = ?KEY_DAILY_OUTSIDE_KILL_MON_COUNTER,
            CounterN = lib_role_daily:add_counter(RoleID, Key, 1),
            CounterN rem 100 =:= 0 andalso router_105:send_commonly_keyvalue(RoleSid, Key, CounterN),
            KillNumPerc = util:get_zone_config(KillList, CounterN),
            TeamAddition = team_addition(TeamID, GuildID),
            AddExp0 = erlang:floor(Exp * (KillNumPerc / 100) * (1 + TeamAddition)),
            lib_role_marriage:part_team_act(RoleID, 1009, ?OPT_KILL_MON_EXP),
            ok;
        _ ->
            AddExp0 = Exp
    end,
    SwornExpAdd = lib_role_sworn:get_kill_mon_exp_add(PS),
    LvDiffPerc = util:get_zone_config(LvEffect, MonLv - Lv),
    AddExp = max(1, erlang:floor(AddExp0 * (LvDiffPerc / 100) * (1 + SwornExpAdd / 100))),
    PS1 = lib_role_assets:add_items_notify(PS, [{?AST_EXP, AddExp}], ?OPT_MON_DROP),
    lib_role_pet:kill_mon_exp(PS1, MonLv, LvEffect, Exp),
    is_gold_chess(MonID) andalso ?TASK_EVENT(PS, 'kill_gold_chess'),
    lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_KILL_MON, 0, 0}),
    PS1;
kill_mon_add_exp(_, _, _, _) ->
    skip.

team_addition(TeamID, GuildID) when TeamID =:= 0 orelse GuildID =:= 0 ->
    0;
team_addition(TeamID, GuildID) when is_integer(TeamID) ->
    TeamInfo = lib_team:get_team_info(TeamID),
    team_addition(TeamInfo, GuildID);
team_addition(#{members := Members}, GuildID) ->
    Num = team_guild_addition(Members, GuildID, 0),
    (Num - 1) * 0.01;
team_addition(_, _GuildID) ->
    0.

team_guild_addition([], _GuildID, Acc) ->
    Acc;
team_guild_addition([RoleID | T], GuildID, Acc) ->
    case lib_guild:get_role_guild_id(RoleID) of
        GuildID -> team_guild_addition(T, GuildID, Acc + 1);
        _ -> team_guild_addition(T, GuildID, Acc)
    end.

is_gold_chess(MonID) when MonID >= 262001 andalso MonID =< 262100 ->
    true;
is_gold_chess(_) ->
    false.

%% -----------------------------------------------------------------------------

%% 天灵丹加成
tl_dan_addition(RoleID, Exp, OpType) ->
    dan_addition(RoleID, ?TL_DAN, Exp, ?TL_MUL, OpType).

dl_dan_addition(RoleID, Exp, OpType) ->
    dan_addition(RoleID, ?DL_DAN, Exp, ?DL_MUL, OpType).

dan_addition(RoleID, Type, Exp, Mul, OpType) when OpType =:= ?OPT_MON_DROP orelse OpType =:= ?OPT_KILL_MON_EXP ->
    KeepExp = get_keep_exp(RoleID, Type),
    AddExpDan = min(KeepExp, Exp * Mul),
    AddExpDan > 0 andalso del_keep_exp(RoleID, Type, AddExpDan),
    AddExpDan;
dan_addition(_, _Exp, _, _, _) ->
    0.

get_keep_exp(RoleID, Type) ->
    RoleData = get_role_data(RoleID),
    maps:get(field(Type), RoleData).

del_keep_exp(_, _, 0) ->
    skip;
del_keep_exp(RoleID, Type, CostExp) ->
    RoleData = get_role_data(RoleID),
    Field = field(Type),
    KeepExp = maps:get(Field, RoleData),
    NewKeepExp = max(0, KeepExp - CostExp),
    NewRoleData = maps:put(Field, NewKeepExp, RoleData),
    update_role_data(RoleID, NewRoleData),
    send_info(RoleID, NewRoleData),
    ok.

field(Type) when Type =:= tl orelse Type =:= ?TL_DAN ->
    keep_exp;
field(Type) when Type =:= dl orelse Type =:= ?DL_DAN ->
    dl_keep_exp.

%% -----------------------------------------------------------------------------

cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{have_times := HaveTimes} = RoleData,
    #{daily_add_times := AddTimes, max_times := MaxTimes} = conf_kill_mon_exp_info:get(),
    HaveTimesN = min(HaveTimes + AddTimes, MaxTimes),
    NewRoleData = RoleData#{have_times => HaveTimesN, last_check => time:unixtime()},
    update_role_data(RoleID, NewRoleData),
    ok.

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#{updated => true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{updated := Updated} = RoleData,
    case Updated of
        true ->
            #{have_times := HaveTimes, keep_exp := TlKeepExp, dl_keep_exp := DlKeepExp, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, HaveTimes, TlKeepExp, DlKeepExp, LastCheck);
        _ ->
            skip
    end.

-define(SQL_GET_ROLE_DATA, <<"select `have_times`, `keep_exp`, `dl_keep_exp`, `last_check` from `role_kill_mon_exp` where `role_id` = ~w">>).

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [HaveTimes, TlKeepExp, DlKeepExp, LastCheck] ->
            {HaveTimes, TlKeepExp, DlKeepExp, LastCheck};
        [] ->
            {0, 0, 0, 0}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into `role_kill_mon_exp`(`role_id`, `have_times`, `keep_exp`, `dl_keep_exp`, `last_check`) values(~w, ~w, ~w, ~w, ~w)">>).

save_role_data(RoleID, HaveTimes, TlKeepExp, DlKeepExp, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, HaveTimes, TlKeepExp, DlKeepExp, LastCheck]),
    ?DB:execute(SQL).
