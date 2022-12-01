%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     烟花
%%% @end
%%% Created : 27. 二月 2019 19:37
%%%-------------------------------------------------------------------
-module(router_543).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_firework:do(Cmd, PS, Req).
