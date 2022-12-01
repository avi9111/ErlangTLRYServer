%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wine_act_by_num
%% @Brief  : 帮派行酒令参与人数相关
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_guild_wine_act_by_num).

-export([
    get/1
]).

get(Number) when Number =< 2 ->
    #{
        exp_add_per => 0    };
get(Number) when Number =< 5 ->
    #{
        exp_add_per => 10    };
get(Number) when Number =< 10 ->
    #{
        exp_add_per => 20    };
get(Number) when Number =< 30 ->
    #{
        exp_add_per => 30    };
get(Number) when Number =< 50 ->
    #{
        exp_add_per => 40    };
get(Number) when Number =< 999 ->
    #{
        exp_add_per => 50    };
get(_Number) ->
    undefined.
