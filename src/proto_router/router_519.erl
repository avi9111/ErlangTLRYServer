%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. εδΈζ 2018 10:29
%%%-------------------------------------------------------------------
-module(router_519).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_treasure_map:do(Cmd, PS, Req).
