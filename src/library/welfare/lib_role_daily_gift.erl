%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     每日礼包
%%% @end
%%% Created : 13. 十二月 2018 14:47
%%%-------------------------------------------------------------------
-module(lib_role_daily_gift).

-include("common.hrl").
-include("keyvalue.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("welfare.hrl").
-include("proto/prot_531.hrl").

%% API
-export([
    handle_info/2,
    init/1,
    send_info/1,
    get_reward/3,
    save/1,
    cross_day/1,
    buy/2
]).

handle_info({buy_gift, Type}, PS) ->
    buy(PS, Type);
handle_info(_, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    {List, LastCheck} = get_role_db_data(RoleID),
    RoleData =
    case time:is_today(LastCheck) of
        true ->
            #{list => List, last_check => LastCheck, updated => false};
        _ ->
            refresh(RoleID, Lv, List)
    end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{list := List} = RoleData,
    MsgRecord = #sc_daily_gift_info{reward_list = List},
    {ok, Bin} = prot_msg:encode_msg(53121, MsgRecord),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok.

%% 购买礼包
buy(PS, Grade) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{list := List} = RoleData,
    case util:prop_get_value(Grade, List) of
        ?REWARD_STATE_NOT ->
            NewList = util:prop_store(Grade, ?REWARD_STATE_CAN, List),
            NewRoleData = RoleData#{list => NewList},
            update_role_data(RoleID, NewRoleData),
            MsgRecord = #sc_daily_gift_info{reward_list = NewList},
            {ok, Bin} = prot_msg:encode_msg(53121, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            ?TASK_EVENT(RoleID, {daily_gift, Grade}),
            ok;
        Error ->
            ?ERROR("daily_gift error buy: ~p, id: ~p", [Error, RoleID])
    end.

%% 获得奖励
get_reward(PS, Grade, ID) ->
    case catch check_get_reward(PS, Grade, ID) of
        {ok, RoleData, DropID} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_DAILY_GIFT),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_daily_gift_get{grade = Grade},
            {ok, Bin} = prot_msg:encode_msg(53123, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, Grade, ID) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{list := List} = RoleData,
    State = util:prop_get_value(Grade, List, 0),
    State =:= ?REWARD_STATE_CAN orelse erlang:throw({error, ?RC_DAILY_GIFT_BUY_FIRST}),
    Conf = conf_daily_gift:get(Grade),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{reward := RewardList} = Conf,
    Tuple = lists:keyfind(ID, 1, RewardList),
    Tuple =/= false orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    {_, NeedLv, DropID} = Tuple,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    NewList = util:prop_store(Grade, ?REWARD_STATE_GOT, List),
    NewRoleData = RoleData#{list => NewList},
    {ok, NewRoleData, DropID}.

cross_day(PS) ->
    #role_state{id = RoleID, level = Lv} = PS,
    #{list := List} = get_role_data(RoleID),
    RoleData = refresh(RoleID, Lv, List),
    update_role_data(RoleID, RoleData),
    ok.

init_list() ->
    Grades = conf_daily_gift:get_grades(),
    [{Grade, ?REWARD_STATE_NOT} || Grade <- Grades].

refresh(RoleID, Lv, List) ->
    lists:foreach(fun({Grade, State}) ->
        case State =:= ?REWARD_STATE_CAN of
            true ->
                #{reward := RewardList} = conf_daily_gift:get(Grade),
                DropID = util:get_zone_config(RewardList, Lv),
                svr_mail:sys2p(RoleID, 1901, DropID, ?OPT_DAILY_GIFT);
            _ ->
                skip
        end
    end, List),
    #{list => init_list(), last_check => time:unixtime(), updated => true}.

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
            #{list := List, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, List, LastCheck);
        _ ->
            skip
    end.

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_DAILY_GIFT_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbList, LastCheck] ->
            List = type:convert_db_field(list, DbList, []),
            {List, LastCheck};
        [] ->
            {init_list(), time:unixtime()}
    end.


save_role_data(RoleID, List, LastCheck) ->
    DbList = type:term_to_bitstring(List),
    SQL = io_lib:format(?SQL_SET_DAILY_GIFT_ROLE_DATA, [RoleID, DbList, LastCheck]),
    ?DB:execute(SQL).