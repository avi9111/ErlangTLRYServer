%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     七天登录
%%% @end
%%% Created : 18. 一月 2019 16:45
%%%-------------------------------------------------------------------
-module(router_536).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_seven_login:do(Cmd, PS, Req).