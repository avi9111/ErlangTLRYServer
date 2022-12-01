%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     帮派工资
%%% @end
%%% Created : 25. 十二月 2018 15:41
%%%-------------------------------------------------------------------
-module(router_534).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_guild_wages:do(Cmd, PS, Req).
