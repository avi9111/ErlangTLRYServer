%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_rank
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_rank).

-export([
    get/1,
    get_ids/0
]).

get({1, Rank}) when Rank >= 1 andalso Rank =< 5 ->
    2101;
get({1, Rank}) when Rank >= 6 andalso Rank =< 10 ->
    2102;
get({1, Rank}) when Rank >= 11 andalso Rank =< 15 ->
    2103;
get({1, Rank}) when Rank >= 16 andalso Rank =< 100 ->
    2104;
get({2, Rank}) when Rank >= 1 andalso Rank =< 5 ->
    2101;
get({2, Rank}) when Rank >= 6 andalso Rank =< 10 ->
    2102;
get({2, Rank}) when Rank >= 11 andalso Rank =< 15 ->
    2103;
get({2, Rank}) when Rank >= 16 andalso Rank =< 100 ->
    2104;
get(_ID) ->
    0.

get_ids() ->
    [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {2, 1}, {2, 2}, {2, 3}, {2, 4}].
