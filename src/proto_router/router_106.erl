%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     GM
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_106).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_cheat:do(Cmd, PS, Req).
