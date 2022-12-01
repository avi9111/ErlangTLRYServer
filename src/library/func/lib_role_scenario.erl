%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     剧情邮件
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_scenario).
-author("Ryuu").

-include("role.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").

%% API
-export([
    refresh/1,
    get_role_data/1
]).

-define(role_scenario, #{
    version => 1,
    scenario => []
}).

refresh(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{scenario := Scenario} = RoleData,
    IDList = conf_scenario:get_ids(),
    NewList = lib_func_util:open_list(IDList, PS, sets:from_list(Scenario), conf_scenario, []),
    send_mails(NewList, RoleID),
    NewData = RoleData#{scenario => NewList ++ Scenario},
    set_role_data(RoleID, NewData).

send_mails([], _RoleID) ->
    ok;
send_mails([ID | T], RoleID) ->
    Conf = conf_scenario:get(ID),
    #{mail := MailID, reward := DropID} = Conf,
    svr_mail:sys2p(RoleID, MailID, DropID, ?OPT_SCENARIO),
    send_mails(T, RoleID).

get_role_data(RoleID) ->
    case lib_role_kv:get_kv(RoleID, ?KEY_SCENARIO) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_scenario
    end.

set_role_data(RoleID, RoleData) ->
    lib_role_kv:set_kv(RoleID, ?KEY_SCENARIO, RoleData).
