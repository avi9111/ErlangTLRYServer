%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     历练补偿
%%% @end
%%% Created : 13. 十二月 2018 16:14
%%%-------------------------------------------------------------------
-module(lib_role_kill_mon_retrieve).

-include("common.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("welfare.hrl").
-include("proto/prot_531.hrl").

%% API
-export([
    event/2,
    init/1,
    send_info/1,
    get_retrieve/2,
    save/1,
    cross_day/1
]).

event(PS, {'kill_mon', _}) ->
    kill_mon(PS);
event(_, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {Num, LeaveNum, Flag, LastCheck, Updated} = get_role_db_data(RoleID),
    RoleData =
        case time:is_today(LastCheck) of
            true ->
                #{num => Num, leave_num => LeaveNum, flag => Flag, last_check => LastCheck, updated => Updated};
            _ ->
                LeaveNumN = max(0, 3000 - Num),
                #{num => 0, leave_num => LeaveNumN, flag => 0, last_check => time:unixtime(), updated => true}
        end,
    set_role_data(RoleID, RoleData).

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{leave_num := LeaveNum, flag := Flag} = RoleData,
    MsgRecord = #sc_mon_retrieve_info{leave_num = LeaveNum, type = Flag},
    {ok, Bin} = prot_msg:encode_msg(53131, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 历练补偿
get_retrieve(PS, Type) ->
    case catch check_get_retrieve(PS, Type) of
        {ok, RoleData, CostItems, GetItems} ->
            NewPS = ?iif(CostItems =/= [], lib_role_assets:cost_items_notify(PS, CostItems, ?OPT_MON_RETRIEVE), PS),
            NewPS2 = lib_role_assets:add_items_notify(NewPS, GetItems, ?OPT_MON_RETRIEVE),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_mon_retrieve_get{type = Type},
            {ok, Bin} = prot_msg:encode_msg(53133, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS2};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_retrieve(PS, Type) ->
    #role_state{id = RoleID, level = Lv} = PS,
    RoleData = get_role_data(RoleID),
    #{leave_num := LeaveNum, flag := Flag} = RoleData,
    LeaveNum > 0 orelse erlang:throw({error, ?RC_MON_RETRIEVE_NOT_NUM}),
    Flag =:= 0 orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    Conf = conf_mon_retrieve:get(Type),
    Conf =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    #{cost_type := CostType, retrieve_atom := Atom, level := NeedLv} = Conf,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_PET_ROLE_LEVEL_LMT}),
    CostNum =
        if
            Type =:= 2 ->
                erlang:ceil(15000 * LeaveNum / 3000);
            Type =:= 3 ->
                erlang:ceil(200 * LeaveNum / 3000);
            true ->
                0
        end,
    CostItems = ?iif(CostNum > 0, [{CostType, CostNum}], []),
    ?iif(CostNum > 0, lib_role_assets:check_items_enough(PS, CostItems), skip),
    LvConf = conf_level:get(Lv),
    AddExp = maps:get(Atom, LvConf, 0),
    NewRoleData = RoleData#{flag => Type},
    GetItems = [{?AST_EXP, AddExp}],
    {ok, NewRoleData, CostItems, GetItems}.

kill_mon(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    OldNum = maps:get(num, RoleData, 0),
    NewNum = OldNum + 1,
    NewRoleData = maps:put(num, NewNum, RoleData),
    update_role_data(RoleID, NewRoleData),
    ok.

cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{num := Num} = RoleData,
    LeaveNum = max(0, 3000 - Num),
    NewRoleData = RoleData#{num => 0, leave_num => LeaveNum, flag => 0, last_check => time:unixtime()},
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
            #{num := Num, leave_num := LeaveNum, flag := Flag, last_check := LastCheck} = RoleData,
            save_role_data(RoleID, Num, LeaveNum, Flag, LastCheck);
        _ ->
            skip
    end.

get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_MON_RETRIEVE_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [Num, LeaveNum, Flag, LastCheck] ->
            {Num, LeaveNum, Flag, LastCheck, false};
        [] ->
            {0, 0, 0, time:unixtime(), true}
    end.

save_role_data(RoleID, Num, LeaveNum, Flag, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_MON_RETRIEVE_ROLE_DATA, [RoleID, Num, LeaveNum, Flag, LastCheck]),
    ?DB:execute(SQL).