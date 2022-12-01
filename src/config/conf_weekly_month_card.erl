%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_weekly_month_card
%% @Brief  : 周月卡
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_weekly_month_card).

-export([
    get/1,
    get_ids/0
]).

get(9) ->
    #{
        type => 9,
        rmb => 12,
        gold => 120,
        last_day => 7,
        daily_reward => 70001    };
get(10) ->
    #{
        type => 10,
        rmb => 30,
        gold => 300,
        last_day => 30,
        daily_reward => 70002    };
get(_ID) ->
    undefined.

get_ids() ->
    [9, 10].
