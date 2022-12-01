%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : auction_boss_decay
%% @Brief  : 世界Boss拍卖衰减
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_auction_boss_decay).

-export([
    get/1,
    get_ids/0
]).

get(Pert) when Pert >= 700 ->
    0;
get(Pert) when Pert >= 500 ->
    0.2;
get(Pert) when Pert >= 400 ->
    0.4;
get(Pert) when Pert >= 300 ->
    0.6;
get(Pert) when Pert >= 200 ->
    0.8;
get(Pert) when Pert >= 100 ->
    1;
get(Pert) when Pert >= 0 ->
    1;
get(_ID) ->
    0.

get_ids() ->
    [].
