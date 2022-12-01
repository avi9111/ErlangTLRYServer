%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     开服红利
%%% @end
%%% Created : 24. 一月 2019 10:06
%%%-------------------------------------------------------------------
-module(router_538).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_dividend:do(Cmd, PS, Req).