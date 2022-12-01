%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     每日任务
%%% @end
%%% Created : 20. 十二月 2018 9:01
%%%-------------------------------------------------------------------
-module(router_532).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_daily_task:do(Cmd, PS, Req).