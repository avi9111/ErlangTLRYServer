%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技
%%% @end
%%% Created : 02. 十一月 2018 9:21
%%%-------------------------------------------------------------------
-module(router_512).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_career_battle:do(Cmd, PS, Req).
