%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     聊天
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_402).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_chat:do(Cmd, State, MsgRecord).
