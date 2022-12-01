%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_cd
%% @Brief  : 交易限制
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_cd).

-export([
    get/1,
    get_ids/0
]).

get(Time) when Time >= 999 ->
    504;
get(Time) when Time >= 4 ->
    504;
get(Time) when Time >= 3 ->
    504;
get(Time) when Time >= 2 ->
    336;
get(Time) when Time >= 1 ->
    168;
get(_) ->
    0.

get_ids() ->
    [1, 2, 3, 4, 999].
