%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wine_practice_by_gap
%% @Brief  : 帮派练功等级差加成
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_guild_wine_practice_by_gap).

-export([
    get/1
]).

get(LvGap) when LvGap =< 1 ->
    #{
        exp_add_per => 20    };
get(LvGap) when LvGap =< 2 ->
    #{
        exp_add_per => 40    };
get(LvGap) when LvGap =< 3 ->
    #{
        exp_add_per => 60    };
get(LvGap) when LvGap =< 4 ->
    #{
        exp_add_per => 80    };
get(LvGap) when LvGap =< 5 ->
    #{
        exp_add_per => 100    };
get(LvGap) when LvGap =< 999 ->
    #{
        exp_add_per => 100    };
get(_LvGap) ->
    undefined.
