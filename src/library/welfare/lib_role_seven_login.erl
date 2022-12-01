%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     七天登录
%%% @end
%%% Created : 14. 一月 2019 16:51
%%%-------------------------------------------------------------------
-module(lib_role_seven_login).

-include("common.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("proto/prot_536.hrl").

%% API
-export([
    do/3,
    init/1,
    send_info/1,
    get_reward/2,
    cross_day/1,
    save/1
]).

-export([
    gm_add_login_day/1
]).

do(53601, PS, _) ->
    send_info(PS);
do(53603, PS, #cs_seven_login_get{day = Day}) ->
    get_reward(PS, Day);
do(_, _, _) ->
    skip.

init(PS) ->
    #role_state{id = RoleID} = PS,
    {LoginDay, List, LastCheck} = get_role_db_data(RoleID),
    RoleData =
    case time:is_today(LastCheck) of
        true ->
            #{login_day => LoginDay, list => List, last_check => LastCheck, updated => false};
        _ ->
            {NewLoginDay, Updated} = ?iif(LoginDay >= 7, {LoginDay, false}, {LoginDay + 1, true}),
            #{login_day => NewLoginDay, list => List, last_check => time:unixtime(), updated => Updated}
    end,
    set_role_data(RoleID, RoleData),
    ok.

send_info(PS) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(RoleID),
    #{login_day := LoginDay, list := List} = RoleData,
    MsgRecord = #sc_seven_login_info{login_day = LoginDay, list = List},
    {ok, Bin} = prot_msg:encode_msg(53602, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 领取奖励
get_reward(PS, Day) ->
    case catch check_get_reward(PS, Day) of
        {ok, RoleData, Reward} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, Reward, ?OPT_SEVEN_LOGIN),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_seven_login_get{day = Day},
            {ok, Bin} = prot_msg:encode_msg(53604, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, Day) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{login_day := LoginDay, list := List} = RoleData,
    LoginDay >= Day orelse erlang:throw({error, ?RC_SEVEN_LOGIN_NOT_LOGIN_ENOUGH}),
    not lists:member(Day, List) orelse erlang:throw({error, ?RC_CHANNEL_DRAW_ALREADY_GOT}),
    Reward = conf_seven_login:get(Day),
    Reward =/= undefined orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    NewList = [Day | List],
    NewRoleData = RoleData#{list => NewList},
    {ok, NewRoleData, Reward}.

cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{login_day := LoginDay, updated := Updated} = RoleData,
    {NewLoginDay, NewUpdated} = ?iif(LoginDay >= 7, {LoginDay, (Updated orelse false)}, {LoginDay + 1, true}),
    NewRoleData = RoleData#{login_day => NewLoginDay, last_check => time:unixtime(), updated => NewUpdated},
    set_role_data(RoleID, NewRoleData),
    ok.

set_role_data(_RoleId, Data) ->
    erlang:put({?MODULE, role_data}, Data).

update_role_data(RoleId, Data) ->
    NewData = Data#{updated => true},
    set_role_data(RoleId, NewData).

get_role_data(_RoleID) ->
    erlang:get({?MODULE, role_data}).

%% 下线保存
save(PS) ->
    RoleData = get_role_data(PS#role_state.id),
    #{updated := Updated} = RoleData,
    ?iif(Updated, save_data(PS#role_state.id, RoleData), skip).

save_data(RoleID, RoleData) ->
    #{login_day := LoginDay, list := List, last_check := LastCheck} = RoleData,
    save_role_data(RoleID, LoginDay, List, LastCheck).

-define(SQL_GET_ROLE_DATA, <<"select login_day, list, last_check from role_seven_login where role_id = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [LoginDay, DbList, LastCheck] ->
            List = type:convert_db_field(list, DbList, []),
            {LoginDay, List, LastCheck};
        [] ->
            {1, [], time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into role_seven_login(role_id, login_day, list, last_check) values(~w, ~w, '~s', ~w)">>).
save_role_data(RoleID, LoginDay, List, LastCheck) ->
    DbList = type:term_to_bitstring(List),
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, LoginDay, DbList, LastCheck]),
    ?DB:execute(SQL).

gm_add_login_day(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{login_day := LoginDay, list := List} = RoleData,
    NewLoginDay = min(LoginDay + 1, 7),
    NewRoleData = RoleData#{login_day => NewLoginDay},
    update_role_data(RoleID, NewRoleData),
    MsgRecord = #sc_seven_login_info{login_day = NewLoginDay, list = List},
    {ok, Bin} = prot_msg:encode_msg(53602, MsgRecord),
    lib_role_send:send_to_role(RoleID, Bin),
    ok.