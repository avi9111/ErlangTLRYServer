%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_weight
%% @Brief  : 上架权重
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_weight).

-export([
    get/1,
    get_ids/0
]).

get(Num) when Num =< 10 ->
    10000;
get(Num) when Num =< 30 ->
    6000;
get(Num) when Num =< 50 ->
    4000;
get(Num) when Num =< 100 ->
    3000;
get(Num) when Num =< 999 ->
    2000;
get(_) ->
    0.

get_ids() ->
    [10, 30, 50, 100, 999].
