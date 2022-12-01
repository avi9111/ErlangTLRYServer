%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_252).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_dungeon:do(Cmd, PS, Req).
