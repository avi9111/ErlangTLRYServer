%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     行酒令答题
%%% @end
%%% Created : 18. 九月 2018 15:33
%%%-------------------------------------------------------------------
-module(router_501).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_guild_question:do(Cmd, PS, Req).
