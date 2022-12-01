%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     活动
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_activity).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").
-include("activity.hrl").
-include("proto/prot_301.hrl").

%% API
-export([
    do/3,
    send_info/1,
    handle_info/2
]).

do(30101, PS, _) ->
    get_flag(PS);
do(_Cmd, _PS, _) ->
    ignore.

%% @doc 推送
send_info(PS) ->
    get_flag(PS).

get_flag(PS) ->
    Flags = lib_activity:get_activity_flag(),
    Rec = #sc_activity_get_flag{flags = Flags},
    {ok, Bin} = prot_msg:encode_msg(30102, Rec),
    lib_role_send:send_to_role(PS, Bin).

handle_info(_Info, _PS) ->
    ok.
