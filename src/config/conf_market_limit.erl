%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_limit
%% @Brief  : 交易限制
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_limit).

-export([
    get/1,
    get_ids/0
]).

get(Gold) when Gold >= 9999999 ->
    999999;
get(Gold) when Gold >= 8000 ->
    500000;
get(Gold) when Gold >= 6000 ->
    100000;
get(Gold) when Gold >= 4000 ->
    50000;
get(Gold) when Gold >= 2000 ->
    20000;
get(Gold) when Gold >= 0 ->
    10000;
get(_) ->
    0.

get_ids() ->
    [0, 2000, 4000, 6000, 8000, 9999999].
