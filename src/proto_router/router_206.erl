%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     商店
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_206).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_shop:do(Cmd, PS, Req).
