%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     马贼任务
%%% @end
%%% Created : 22. 十月 2018 15:03
%%%-------------------------------------------------------------------
-module(router_510).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_daily_thief:do(Cmd, PS, Req).
