%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     游戏设置
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_setting).
-author("Ryuu").

-include("role.hrl").
-include("keyvalue.hrl").
-include("proto/prot_110.hrl").

%% API
-export([
    do/3,
    send_info/1
]).

-define(VALID_RANGE(Key), (Key >= ?KEY_SETTABLE_BEG andalso Key =< ?KEY_SETTABLE_END)).

do(11001, PS, _Req) ->
    send_info(PS);
do(11003, PS, #cs_setting_get{key = Key}) ->
    get_conf(PS, Key);
do(11005, PS, #cs_setting_get_int{key = Key}) ->
    get_conf(PS, Key);
do(11007, PS, #cs_setting_get_string{key = Key}) ->
    get_conf(PS, Key);
do(11009, PS, #cs_setting_set_int{key = Key, val = Val}) ->
    set_int(PS, Key, Val);
do(11011, PS, #cs_setting_set_string{key = Key, val = Val}) ->
    set_string(PS, Key, Val);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    {IList, SList} = collect_setting(?KEY_SETTABLE_BEG, RoleID, [], []),
    Rec = #sc_setting_get_all{
        ints = IList, strings = SList
    },
    {ok, Bin} = prot_msg:encode_msg(11002, Rec),
    lib_role_send:send_to_role(PS, Bin).

collect_setting(?KEY_SETTABLE_END, _RoleID, IAcc, LAcc) ->
    {IAcc, LAcc};
collect_setting(Key, RoleID, IAcc, LAcc) ->
    case lib_role_kv:get_kv(RoleID, Key) of
        Val when is_integer(Val) ->
            collect_setting(Key + 1, RoleID, [{Key, Val} | IAcc], LAcc);
        Val when is_binary(Val) ->
            collect_setting(Key + 1, RoleID, IAcc, [{Key, Val} | LAcc]);
        _ ->
            collect_setting(Key + 1, RoleID, IAcc, LAcc)
    end.

get_conf(PS, Key) ->
    case lib_role_kv:get_kv(PS#role_state.id, Key) of
        Val when is_integer(Val) ->
            Rec = #sc_setting_get_int{key = Key, val = Val},
            {ok, Bin} = prot_msg:encode_msg(11006, Rec),
            lib_role_send:send_to_role(PS, Bin);
        Val when is_binary(Val) ->
            Rec = #sc_setting_get_string{key = Key, val = Val},
            {ok, Bin} = prot_msg:encode_msg(11008, Rec),
            lib_role_send:send_to_role(PS, Bin);
        _ ->
            ignore
    end.

set_int(PS, Key, Val) when ?VALID_RANGE(Key) ->
    lib_role_kv:set_kv(PS#role_state.id, Key, Val),
    Rec = #sc_setting_set_int{key = Key, val = Val},
    {ok, Bin} = prot_msg:encode_msg(11010, Rec),
    lib_role_send:send_to_role(PS, Bin);
set_int(_, _, _) ->
    ignore.

set_string(PS, Key, Val) when ?VALID_RANGE(Key) ->
    lib_role_kv:set_kv(PS#role_state.id, Key, list_to_binary(Val)),
    Rec = #sc_setting_set_string{key = Key, val = Val},
    {ok, Bin} = prot_msg:encode_msg(11012, Rec),
    lib_role_send:send_to_role(PS, Bin);
set_string(_, _, _) ->
    ignore.
