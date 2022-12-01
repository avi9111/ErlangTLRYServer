%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     每日活跃
%%% @end
%%% Created : 27. 十一月 2018 11:11
%%%-------------------------------------------------------------------
-module(router_524).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_daily_lively:do(Cmd, PS, Req).
