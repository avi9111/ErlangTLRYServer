%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十月 2018 14:41
%%%-------------------------------------------------------------------
-module(router_511).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_guild_defend:do(Cmd, PS, Req).
