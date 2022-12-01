%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂
%%% @end
%%% Created : 17. 十一月 2018 11:33
%%%-------------------------------------------------------------------
-module(router_517).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_jousts_hall:do(Cmd, PS, Req).
