%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 十一月 2018 17:02
%%%-------------------------------------------------------------------
-module(router_525).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_exterior:do(Cmd, PS, Req).
