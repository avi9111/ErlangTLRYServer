%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     江湖历练
%%% @end
%%% Created : 27. 十一月 2018 11:11
%%%-------------------------------------------------------------------
-module(router_523).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_kill_mon_exp:do(Cmd, PS, Req).

