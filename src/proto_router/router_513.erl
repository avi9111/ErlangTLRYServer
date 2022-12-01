%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     镜湖剿匪
%%% @end
%%% Created : 06. 十一月 2018 11:51
%%%-------------------------------------------------------------------
-module(router_513).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_lake_bandits:do(Cmd, PS, Req).
