%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_auction_ratio
%% @Brief  : 拍卖系数
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_auction_ratio).

-export([
    get/1,
    get_ids/0
]).

get(Ratio) when Ratio >= 0 ->
    1;
get(Ratio) when Ratio >= 0.3 ->
    1;
get(Ratio) when Ratio >= 0.5 ->
    1;
get(Ratio) when Ratio >= 0.7 ->
    1;
get(Ratio) when Ratio >= 0.9 ->
    1;
get(Ratio) when Ratio >= 1 ->
    1;
get(_ID) ->
    undefined.

get_ids() ->
    [0, 0.3, 0.5, 0.7, 0.9, 1].
