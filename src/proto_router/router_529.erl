%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     充值消费相关
%%% @end
%%% Created : 10. 十二月 2018 17:11
%%%-------------------------------------------------------------------
-module(router_529).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_charge_consume:do(Cmd, PS, Req).

