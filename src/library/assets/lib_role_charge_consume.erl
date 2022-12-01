%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     充值消费相关
%%% @end
%%% Created : 10. 十二月 2018 15:09
%%%-------------------------------------------------------------------
-module(lib_role_charge_consume).

-include("common.hrl").
-include("role.hrl").
-include("keyvalue.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("assets.hrl").
-include("proto/prot_529.hrl").

%% API
-export([
    do/3,
    event/2,
    init/1,
    send_info/1,
    save/1,
    cross_day/1
]).

event(PS, {'recharge', _AddRmb}) ->
    handle_charge_event(PS);
event(PS, {'consume', Amount}) ->
    handle_consume_event(PS, Amount);
event(_, _) ->
    skip.

do(52901, PS, _Req) ->
    send_info(PS);
do(52903, PS, #cs_charge_consume_get_charge{id = ID}) ->
    get_charge_reward(PS, ID);
do(52905, PS, #cs_charge_consume_get_consume{id = ID}) ->
    get_consume_reward(PS, ID);
do(52908, PS, _Req) ->
    roraty(PS);
do(52911, PS, _Req) ->
    get_first_reward(PS);
do(52912, PS, _Req) ->
    get_roraty(PS);
do(_, _, _) ->
    skip.

%% 充值
handle_charge_event(PS) ->
    #role_state{id = RoleID, time_data = TimeData, sid = RoleSid} = PS,
    #time_data{first_recharge = FirstRecharge} = TimeData,
    Flag = lib_role_kv:get_kv(RoleID, ?KEY_FIRST_CHARGE_FLAG, 0),
    NewFlag = ?iif(FirstRecharge > 0 andalso Flag =:= 0, 1, Flag),
    Flag =/= NewFlag andalso
        begin
            notify_flag_change(RoleSid, NewFlag),
            lib_role_kv:set_kv(RoleID, ?KEY_FIRST_CHARGE_FLAG, NewFlag)
        end,
    ok.

%% 消费
handle_consume_event(PS, Amount) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{consume := Consume} = RoleData,
    NewConsume = Consume + Amount,
    NewRoleData = RoleData#{consume => NewConsume},
    update_role_data(RoleID, NewRoleData),
    MsgRecord = #sc_charge_consume_change{weekly_consume = NewConsume},
    {ok, Bin} = prot_msg:encode_msg(52907, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {Consume, Guard, GotList, Index, LastCheck} = get_role_db_data(RoleID),
    Now = time:unixtime(),
    RoleData =
        case time:is_same_week(Now, LastCheck) of
            true ->
                #{consume => Consume, guard => Guard, got_list => GotList, index => Index, last_check => LastCheck, updated => false};
            _ ->
                send_reward(RoleID, Consume, GotList),
                #{consume => 0, guard => init_guard(), got_list => [], index => 0, last_check => Now, updated => true}
        end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{consume := WeeklyConsume, got_list := ConsumeGotList, guard := Guard, index := Index} = RoleData,
    ChargeGotList = lib_role_kv:get_kv(RoleID, ?KEY_CHARGE_GIFT_GOT, []),
    Flag = lib_role_kv:get_kv(RoleID, ?KEY_FIRST_CHARGE_FLAG, 0),
    LeaveIds = [ID || {ID, _} <- Guard],
    MsgRecord = #sc_charge_consume_info{
        charge_got_list = ChargeGotList,
        weekly_consume = WeeklyConsume,
        consume_got_list = ConsumeGotList,
        flag = Flag,
        leave_times = length(Guard),
        leave_ids = LeaveIds,
        index = Index
    },
    {ok, Bin} = prot_msg:encode_msg(52902, MsgRecord),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok.

%% 领取首次充值礼包
get_charge_reward(PS, ID) ->
    case catch check_get_charge_reward(PS, ID) of
        {ok, GotList, Reward} ->
            lib_role_kv:set_kv(PS#role_state.id, ?KEY_CHARGE_GIFT_GOT, GotList),
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_CHARGE_GIFT),
            MsgRecord = #sc_charge_consume_get_charge{id = ID},
            {ok, Bin} = prot_msg:encode_msg(52904, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_charge_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    GotList = lib_role_kv:get_kv(RoleID, ?KEY_CHARGE_GIFT_GOT, []),
    not lists:member(ID, GotList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    TotalChargeRMB = lib_role_kv:get_kv(RoleID, ?KEY_TOTAL_RMB, 0),
    Conf = conf_charge_gift:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{charge_gold := NeedCharge, reward := Reward} = Conf,
    TotalChargeRMB * 10 >= NeedCharge orelse erlang:throw({error, ?RC_CHARGE_CONSUME_CHARGE_ACC_NOT}),
    NewGotList = [ID | GotList],
    {ok, NewGotList, Reward}.

%% 领取周消费奖励
get_consume_reward(PS, ID) ->
    case catch check_get_consume_reward(PS, ID) of
        {ok, RoleData, AddItems} ->
            update_role_data(PS#role_state.id, RoleData),
            NewPS = lib_role_assets:add_items_notify(PS, AddItems, ?OPT_WEEKLY_CONSUME),
            MsgRecord = #sc_charge_consume_get_consume{id = ID},
            {ok, Bin} = prot_msg:encode_msg(52906, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_consume_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{consume := Consume, got_list := GotList} = RoleData,
    not lists:member(ID, GotList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_weekly_consume:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{cost_gold := NeedCost, reward := Reward} = Conf,
    Consume >= NeedCost orelse erlang:throw({error, ?RC_CHARGE_CONSUME_WEEKLY_NOT}),
    AddItemsT = lib_drop_base:get_drop_goods(Reward),
    %% 抽奖券设置为下周一过期
    AddItems =
        lists:map(fun({Type, Value} = Goods) ->
            case Type =:= ?AST_ITEM of
                true ->
                    ExpireTime = time:unixdate() + (7 - time:get_day_of_week() + 1) * 86400,
                    ValueN =
                        lists:map(fun(#{id := GID} = Data) ->
                            case GID =:= 16440001 of
                                true ->
                                    Data#{expire => ExpireTime};
                                _ ->
                                    Data
                            end
                        end, Value),
                    {Type, ValueN};
                _ ->
                    Goods
            end
        end, AddItemsT),
    lib_role_assets:check_can_add_items(PS, AddItems),
    NewGotList = [ID | GotList],
    NewRoleData = RoleData#{got_list => NewGotList},
    {ok, NewRoleData, AddItems}.


%% 消费转盘抽出ID
roraty(PS) ->
    case catch check_roraty(PS) of
        {ok, RoleData, Index, GuardN, CostItems} ->
            NewPS = lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_WEEKLY_CONSUME_RORATY),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_charge_consume_roraty{id = Index, leave_times = length(GuardN)},
            {ok, Bin} = prot_msg:encode_msg(52909, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_roraty(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    CostItems = [{?AST_ITEM, [{16440001, 1}]}],
    lib_role_assets:check_items_enough(PS, CostItems),
    #{guard := Guard, index := Index} = RoleData,
    Index =:= 0 orelse erlang:throw({error, ?RC_DAILY_GET_REWARD_SEQUENCE}),
    Guard =/= [] orelse erlang:throw({error, ?RC_CHARGE_CONSUME_RORATY_EMPTY}),
    GuardT = all_add_one_times(Guard),
    IDList = maybe_appear_goods(GuardT),
    #{id := NewIndex} = choose_one(IDList),
    GuardN = lists:keydelete(NewIndex, 1, GuardT),
    NewRoleData = RoleData#{guard => GuardN, index => NewIndex},
    {ok, NewRoleData, NewIndex, GuardN, CostItems}.

%% 消费转盘领奖
get_roraty(PS) ->
    case catch check_get_roraty(PS) of
        {ok, RoleData, ID, Reward} ->
            update_role_data(PS#role_state.id, RoleData),
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_WEEKLY_CONSUME_RORATY),
            MsgRecord = #sc_charge_consume_roraty_get{id = ID},
            {ok, Bin} = prot_msg:encode_msg(52913, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_roraty(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{index := Index} = RoleData,
    Index > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{reward := Reward} = conf_consume_roraty:get(Index),
    NewRoleData = RoleData#{index => 0},
    {ok, NewRoleData, Index, Reward}.

%% 获得首冲奖励
get_first_reward(PS) ->
    case catch check_get_first_reward(PS) of
        {ok, Reward} ->
            lib_role_kv:set_kv(PS#role_state.id, ?KEY_FIRST_CHARGE_FLAG, 2),
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_FIRST_CHARGE_REWARD),
            notify_flag_change(PS#role_state.sid, 2),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_first_reward(PS) ->
    #role_state{id = RoleID} = PS,
    Flag = lib_role_kv:get_kv(RoleID, ?KEY_FIRST_CHARGE_FLAG, 0),
    Flag =:= 1 orelse erlang:throw({error, ?RC_CHARGE_CONSUME_NOT_ACHIEVE_FIRST}),
    Reward = config:get_sys_config(first_charge_reward),
    {ok, Reward}.

%% 跨天处理
cross_day(#role_state{id = RoleID}) ->
    RoleData = get_role_data(RoleID),
    Now = time:unixtime(),
    LastCheck = maps:get(last_check, RoleData),
    NewRoleData =
        case time:is_same_week(Now, LastCheck) of
            true ->
                RoleData;
            _ ->
                #{consume := Consume, got_list := GotList} = RoleData,
                send_reward(RoleID, Consume, GotList),
                RoleData#{consume => 0, guard => init_guard(), got_list => [], index => 0, last_check => Now, updated => true}
        end,
    set_role_data(RoleID, NewRoleData).

%% =======================================private=====================================

send_reward(RoleID, Consume, GotList) ->
    IDs = conf_weekly_consume:get_ids(),
    Rewards = send_reward(Consume, GotList, IDs, []),
    Rewards =/= [] andalso svr_mail:sys2p(RoleID, 1801, Rewards, ?OPT_WEEKLY_CONSUME).

send_reward(_, _, [], Rewards) ->
    Rewards;
send_reward(Consume, GotList, [ID | T], Rewards) ->
    #{cost_gold := NeedCost, reward := Reward} = conf_weekly_consume:get(ID),
    case Consume >= NeedCost andalso (not lists:member(ID, GotList)) of
        true ->
            send_reward(Consume, GotList, T, [Reward | Rewards]);
        _ ->
            send_reward(Consume, GotList, T, Rewards)
    end.

notify_flag_change(RoleSid, Flag) ->
    MsgRecord = #sc_charge_consume_flag_change{flag = Flag},
    {ok, Bin} = prot_msg:encode_msg(52910, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 刷新次数+1
all_add_one_times(Guard) ->
    [{ID, Times + 1} || {ID, Times} <- Guard].

%% 可能出现物品索引列表
maybe_appear_goods(Guard) ->
    lists:foldl(
        fun({ID, Times}, List) ->
            #{min_times := MinTimes} = conf_consume_roraty:get(ID),
            if
                Times >= MinTimes ->
                    [ID | List];
                true ->
                    List
            end
        end, [], Guard).

%% 抽索引ID
choose_one(IDList) ->
    util:rand_by_weight([conf_consume_roraty:get(ID) || ID <- IDList], weight).

init_guard() ->
    IDs = conf_consume_roraty:get_ids(),
    [{ID, 0} || ID <- IDs].

%% ===============================data api================================
update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#{updated => true}).

set_role_data(_RoleId, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

save(#role_state{id = RoleID}) ->
    RoleData = get_role_data(RoleID),
    Updated = maps:get(updated, RoleData),
    case Updated of
        true ->
            #{consume := Consume, guard := Guard, got_list := GotList, index := Index, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, Consume, Guard, GotList, Index, LastCheck);
        _ ->
            skip
    end.

-define(SQL_GET_ROLE_DATA, <<"select `weekly_consume`, `guard`, `got_list`, `index`, `last_check` from `role_weekly_consume` where `role_id` = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Consume, DbGuard, DbGotList, Index, LastCheck] ->
            Guard = type:convert_db_field(list, DbGuard, []),
            GotList = type:convert_db_field(list, DbGotList, []),
            {Consume, Guard, GotList, Index, LastCheck};
        [] ->
            {0, init_guard(), [], 0, time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into `role_weekly_consume`(`role_id`, `weekly_consume`, `guard`, `got_list`, `index`, `last_check`) values(~w, ~w, '~s', '~s', ~w, ~w)">>).
save_role_data(RoleID, Consume, Guard, GotList, Index, LastCheck) ->
    DbGuard = type:term_to_bitstring(Guard),
    DbGotList = type:term_to_bitstring(GotList),
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Consume, DbGuard, DbGotList, Index, LastCheck]),
    ?DB:execute(SQL).
