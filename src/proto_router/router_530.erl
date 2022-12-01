%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     头衔
%%% @end
%%% Created : 11. 十二月 2018 15:57
%%%-------------------------------------------------------------------
-module(router_530).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_title_honor:do(Cmd, PS, Req).
