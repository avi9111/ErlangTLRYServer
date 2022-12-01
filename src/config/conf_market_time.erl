%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_time
%% @Brief  : 上架时间
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_time).

-export([
    get/1,
    get_ids/0
]).

get(Time) when Time =< 12 ->
    0.4;
get(Time) when Time =< 24 ->
    0.7;
get(Time) when Time =< 36 ->
    1;
get(Time) when Time =< 999 ->
    1.2;
get(_) ->
    0.

get_ids() ->
    [12, 24, 36, 999].
