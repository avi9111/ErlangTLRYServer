%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     结婚
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_416).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_marriage:do(Cmd, PS, Req).
