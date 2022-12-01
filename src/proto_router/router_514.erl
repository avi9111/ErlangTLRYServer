%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派任务
%%% @end
%%% Created : 12. 十一月 2018 9:29
%%%-------------------------------------------------------------------
-module(router_514).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_guild_task:do(Cmd, PS, Req).
