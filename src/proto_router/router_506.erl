%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     周月卡
%%% @end
%%% Created : 09. 十月 2018 11:06
%%%-------------------------------------------------------------------
-module(router_506).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_weekly_month_card:do(Cmd, PS, Req).