%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     熔炼
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_422).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_smelt:do(Cmd, PS, Req).