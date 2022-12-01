%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主 - 拍卖分红
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_master_bonus).
-author("Ryuu").

-export([
    get/1,
    get_ids/0
]).

get(Rank) when Rank >= 1 andalso Rank =< 1 ->
    1.2;
get(Rank) when Rank >= 2 andalso Rank =< 10 ->
    1.1000000000000001;
get(Rank) when Rank >= 11 andalso Rank =< 20 ->
    1;
get(Rank) when Rank >= 21 andalso Rank =< 9999 ->
    0.8;
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4].
