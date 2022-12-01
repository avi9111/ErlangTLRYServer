%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     时装
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_407).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_fashion:do(Cmd, PS, Req).
