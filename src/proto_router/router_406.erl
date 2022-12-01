%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     称号
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_406).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_title:do(Cmd, State, MsgRecord).
