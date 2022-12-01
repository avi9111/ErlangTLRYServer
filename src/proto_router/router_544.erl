%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     结婚礼堂
%%% @end
%%% Created : 04. 三月 2019 14:47
%%%-------------------------------------------------------------------
-module(router_544).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_marry_rite:do(Cmd, PS, Req).