%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     周月卡
%%% @end
%%% Created : 08. 十月 2018 20:26
%%%-------------------------------------------------------------------
-module(lib_weekly_month_card).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_506.hrl").
-include("recharge.hrl").
-include("shop.hrl").
-record(wm_card, {
    type = 0,           %% 类型
    expire_time = 0,    %% 过期时间戳
    flag = 0,           %% 今日是否已领
    last_check = 0,     %% 上次检查时间戳
    updated = false     %% 数据是否有更新
}).

%% API
-export([
    handle_info/2,
    do/3,
    init/1,
    reward/2,
    cross_day/1,
    send_info/1,
    save/1
]).

handle_info({buy_card, Type}, PS) ->
    buy_card(PS, Type);
handle_info(_, _) ->
    skip.

do(50601, PS, _Data) ->
    send_info(PS);
do(50604, PS, #cs_card_reward{type = Type}) ->
    reward(PS, Type);
do(50605, PS, #cs_buy_spec_item{type = Type, num = Num}) ->
    buy_card(PS, Type, Num);
do(_, _, _) ->
    skip.

%% 初始化
init(PS) ->
    init_role_data(PS#role_state.id).

init_role_data(RoleID) ->
    DbData = get_role_db_data(RoleID),
    Now = time:unixtime(),
    RoleData =
        lists:map(fun([Type, ExpireTime, Flag, LastCheck]) ->
            Data = #wm_card{
                type = Type,
                expire_time = ExpireTime,
                flag = Flag,
                last_check = LastCheck
            },
            case time:is_today(LastCheck) of
                true ->
                    Data;
                _ ->
                    NewFlag = ?iif(ExpireTime > Now, ?REWARD_STATE_CAN, ?REWARD_STATE_NOT),
                    Data#wm_card{flag = NewFlag, last_check = Now, updated = true}
            end
        end, DbData),
    set_role_data(RoleData),
    ok.

send_info(PS) ->
    RoleData = get_role_data(),
    ClientData = make_client_data(RoleData),
    MsgRecord = #sc_card_info{info = ClientData},
    {ok, Bin} = prot_msg:encode_msg(50602, MsgRecord),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok.

buy_card(PS, Type, Num) ->
    RoleData = get_role_data(),
    case catch check_buy_card(PS, RoleData, Type, Num) of
        {Costs, WmCard, Log} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_SHOP_BUY_ITEM),
            send_change_info(PS#role_state.sid, WmCard),
            ?TASK_EVENT(PS#role_state.id, buy_month_card),
            NewData = lists:keystore(Type, #wm_card.type, RoleData, WmCard),
            set_role_data(NewData),
            ?LOG(io_lib:format(?SQL_LOG_ROLE_SHOP, Log)),
            {ok, PS1};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% 购买
buy_card(PS, Type) ->
    #{last_day := LastDay} = conf_weekly_month_card:get(Type),
    ExpireTime = time:unixdate() + LastDay * ?ONE_DAY_SECONDS - 1,
    RoleData = get_role_data(),
    Data = lists:keyfind(Type, #wm_card.type, RoleData),
    NewFlag = ?iif(Data#wm_card.flag =/= ?REWARD_STATE_NOT, Data#wm_card.flag, ?REWARD_STATE_CAN),
    NewData = Data#wm_card{expire_time = ExpireTime, flag = NewFlag, updated = true},
    NewRoleData = lists:keystore(Type, #wm_card.type, RoleData, NewData),
    set_role_data(NewRoleData),
    send_change_info(PS#role_state.sid, NewData),
    ?TASK_EVENT(PS#role_state.id, buy_month_card),
    ok.




check_buy_card(PS, RoleData, Type, Num) ->
    IsWmCard = lists:member(Type, [?CHARGE_TYPE_MONTH_CARD, ?CHARGE_TYPE_WEEKLY_CARD]),
    is_integer(Num) andalso IsWmCard andalso Num > 0 orelse throw({error, ?RC_CARD_ARGS_ERROR}),
    ConsumeType = ?AST_GOLD,
    #{gold := Gold, last_day := LastDay} = conf_weekly_month_card:get(Type),
    Costs = [{ConsumeType, Gold * Num}],
    lib_role_assets:check_items_enough(PS, Costs),
    #wm_card{expire_time = ExpireTime1, flag = Flag} = WMCard = lists:keyfind(Type, #wm_card.type, RoleData),
    Now = time:unixtime(),
    ExpireTime2 = ?iif(ExpireTime1 < Now, Now, ExpireTime1),
    ExpireTime = ExpireTime2 + (LastDay * ?ONE_DAY_SECONDS - 1) * Num,
    #role_state{id = RoleID} = PS,
    Log = [RoleID, ?CHARGE_SHOP_GWK, Type, LastDay, ConsumeType, Num, time:unixtime()],
    NewFlag = ?iif(Flag =/= ?REWARD_STATE_NOT, Flag, ?REWARD_STATE_CAN),
    {Costs, WMCard#wm_card{expire_time = ExpireTime, flag = NewFlag, updated = true}, Log}.

%% 领奖
reward(PS, Type) ->
    case catch check_reward(Type) of
        {ok, RoleData, Data, DropID} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_WEEKLY_MONTH_CARD),
            set_role_data(RoleData),
            send_change_info(PS#role_state.sid, Data),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_reward(Type) ->
    RoleData = get_role_data(),
    Data = lists:keyfind(Type, #wm_card.type, RoleData),
    #wm_card{expire_time = ExpireTime, flag = Flag} = Data,
    Now = time:unixtime(),
    ExpireTime > Now orelse erlang:throw({error, ?RC_CRAD_NOT_BUY}),
    Flag =:= ?REWARD_STATE_CAN orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_weekly_month_card:get(Type),
    Conf =/= undefiend orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{daily_reward := DropID} = Conf,
    NewData = Data#wm_card{flag = ?REWARD_STATE_GOT, updated = true},
    NewRoleData = lists:keystore(Type, #wm_card.type, RoleData, NewData),
    {ok, NewRoleData, NewData, DropID}.

%% 跨天处理
cross_day(PS) ->
    RoleData = get_role_data(),
    Now = time:unixtime(),
    NewRoleData =
        lists:map(fun(#wm_card{expire_time = ExpireTime, flag = Flag, updated = OldUpdated} = Data) ->
            NewFlag = ?iif(Now >= ExpireTime - 1, ?REWARD_STATE_NOT, ?REWARD_STATE_CAN),
            Updated = (Flag =/= ?REWARD_STATE_NOT),
            NewData = Data#wm_card{flag = NewFlag, updated = (OldUpdated orelse Updated), last_check = Now},
            Updated andalso send_change_info(PS#role_state.sid, NewData),
            NewData
        end, RoleData),
    set_role_data(NewRoleData),
    ok.

send_change_info(RoleSid, Data) ->
    ClientData = make_client_data([Data]),
    MsgRecord = #sc_card_change{info = ClientData},
    {ok, Bin} = prot_msg:encode_msg(50603, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

make_client_data(RoleData) ->
    [{Type, ExpireTime, Flag} ||
        #wm_card{
            type = Type,
            expire_time = ExpireTime,
            flag = Flag
        } <- RoleData].

set_role_data(Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data() ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    RoleData = get_role_data(),
    lists:foreach(fun(Data) ->
        #wm_card{
            type = Type,
            expire_time = ExpireTime,
            flag = Flag,
            last_check = LastCheck,
            updated = Updated
        } = Data,
        ?iif(Updated, save_role_data(PS#role_state.id, Type, ExpireTime, Flag, LastCheck), skip)
    end, RoleData).

-define(SQL_GET_ROLE_DATA, <<"select type, expire_time, flag, last_check from role_weekly_month_card where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_all(SQL) of
        [] -> [[Type, 0, ?REWARD_STATE_NOT, 0] || Type <- [9, 10]];
        List when is_list(List) -> List;
        _ -> [[Type, 0, ?REWARD_STATE_NOT, 0] || Type <- [9, 10]]
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_weekly_month_card(role_id, type, expire_time, flag, last_check) values(~w, ~w, ~w, ~w, ~w)">>).
save_role_data(RoleID, Type, ExpireTime, Flag, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, Type, ExpireTime, Flag, LastCheck]),
    ?DB:execute(SQL).