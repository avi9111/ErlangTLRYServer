%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : auction_boss_bonus
%% @Brief  : 世界Boss拍卖分红
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_auction_boss_bonus).

-export([
    get/1,
    get_ids/0
]).

get(Rank) when Rank >= 1 andalso Rank =< 1 ->
    1.5;
get(Rank) when Rank >= 2 andalso Rank =< 2 ->
    1.35;
get(Rank) when Rank >= 3 andalso Rank =< 3 ->
    1.2;
get(Rank) when Rank >= 4 andalso Rank =< 10 ->
    1;
get(Rank) when Rank >= 11 andalso Rank =< 20 ->
    0.7;
get(Rank) when Rank >= 21 andalso Rank =< 40 ->
    0.5;
get(Rank) when Rank >= 41 andalso Rank =< 999 ->
    0.4;
get(_ID) ->
    0.

get_ids() ->
    [].
