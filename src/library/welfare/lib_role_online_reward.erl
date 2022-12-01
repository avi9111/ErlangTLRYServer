%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     在线奖励
%%% @end
%%% Created : 12. 十二月 2018 10:05
%%%-------------------------------------------------------------------
-module(lib_role_online_reward).

-include("common.hrl").
-include("keyvalue.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("welfare.hrl").
-include("proto/prot_531.hrl").

%% API
-export([
    init/1,
    send_info/1,
    pray/1,
    save/1,
    cross_day/1,
    get_reward/2
]).

init(PS) ->
    #role_state{id = RoleID} = PS,
    {Times, List, LastCheck} = get_role_db_data(RoleID),
    RoleData =
        case time:is_today(LastCheck) of
            true ->
                #{times => Times, list => List, last_check => LastCheck, updated => false};
            _ ->
                #{times => 0, list => [], last_check => time:unixtime(), updated => true}
        end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, list := List} = RoleData,
    MsgRecord = #sc_online_reward_info{times = Times, list = List},
    {ok, Bin} = prot_msg:encode_msg(53102, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

pray(PS) ->
    case catch check_pray(PS) of
        {ok, RoleData, Times, ChooseID} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_online_reward_pary{times = Times, id = ChooseID},
            {ok, Bin} = prot_msg:encode_msg(53104, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_pray(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{times := Times, list := List} = RoleData,
    #{max_times := MaxTimes, online_time := TimesList, reward := Reward} = conf_online_reward:get(),
    Times < MaxTimes orelse erlang:throw({error, ?RC_ONLINE_REWARD_MAX_TIMES}),
    length(List) < length(Reward) orelse erlang:throw({error, ?RC_ONLINE_REWARD_NOT_REWARD}),
    OnlineTime = lib_role:get_today_online(PS),
    HaveTimes = have_times(OnlineTime, TimesList, 0),
    Times < HaveTimes orelse erlang:throw({error, ?RC_ONLINE_REWARD_NOT_ENOUGH_TIMES}),
    LeaveList =
        lists:filter(fun({ID, _}) ->
            not lists:keymember(ID, 1, List)
        end, Reward),
    {ChooseID, _} = util:list_rand(LeaveList),
    NewTimes = Times + 1,
    NewList = [{ChooseID, ?REWARD_STATE_CAN} | List],
    NewRoleData = RoleData#{times => NewTimes, list => NewList},
    {ok, NewRoleData, NewTimes, ChooseID}.

get_reward(PS, ID) ->
    case catch check_get_reward(PS, ID) of
        {ok, RoleData, DropID} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_ONLINE_REWARD),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_online_reward_get{id = ID},
            {ok, Bin} = prot_msg:encode_msg(53106, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, ID) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{list := List} = RoleData,
    State = util:prop_get_value(ID, List, ?REWARD_STATE_NOT),
    State =:= ?REWARD_STATE_CAN orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{reward := Reward} = conf_online_reward:get(),
    DropID = util:prop_get_value(ID, Reward),
    DropID =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    NewList = util:prop_store(ID, ?REWARD_STATE_GOT, List),
    NewRoleData = RoleData#{list => NewList},
    {ok, NewRoleData, DropID}.

have_times(_, [], HaveTimes) -> HaveTimes;
have_times(OnlineTime, [{Times, NeedTime} | T], HaveTimes) ->
    case OnlineTime >= NeedTime of
        true ->
            have_times(OnlineTime, T, Times);
        _ ->
            HaveTimes
    end.

cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = #{times => 0, list => [], last_check => time:unixtime()},
    update_role_data(RoleID, RoleData),
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
            #{times := Times, list := List, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, Times, List, LastCheck);
        _ ->
            skip
    end.


get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ONLINE_REWARD_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Times, DbList, LastCheck] ->
            List = type:convert_db_field(list, DbList, []),
            {Times, List, LastCheck};
        [] ->
            {0, [], time:unixtime()}
    end.


save_role_data(RoleID, Times, List, LastCheck) ->
    DbList = type:term_to_bitstring(List),
    SQL = io_lib:format(?SQL_SET_ONLINE_REWARD_ROLE_DATA, [RoleID, Times, DbList, LastCheck]),
    ?DB:execute(SQL).