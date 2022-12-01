%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_pioneer_lv
%% @Brief  : 先锋等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_pioneer_lv).

-export([
    get/1,
    get_ids/0
]).

get(Level) when Level =< 25 ->
    999;
get(Level) when Level =< 59 ->
    5;
get(Level) when Level =< 69 ->
    4;
get(Level) when Level =< 79 ->
    3;
get(Level) when Level =< 999 ->
    2;
get(_ID) ->
    0.

get_ids() ->
    [25, 59, 69, 79, 999].
