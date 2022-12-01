%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     演武堂拍卖分红
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_jousts_hall_bonus).

-export([
    get/1,
    get_ids/0
]).

get(Rank) when Rank >= 1 andalso Rank =< 1 ->
    1.2;
get(Rank) when Rank >= 2 andalso Rank =< 10 ->
    1;
get(Rank) when Rank >= 11 andalso Rank =< 20 ->
    0.8;
get(Rank) when Rank >= 21 andalso Rank =< 9999 ->
    0.6;
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4].
