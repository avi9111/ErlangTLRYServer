%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_lucky_rotary_info
%% @Brief  : 领地任务
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_lucky_rotary_info).

-export([
    get/1
]).

get(2) ->
    #{
        one_cost => 100,
        ten_cost => 900,
        one_get => 10000,
        ten_get => 100000    };
get(3) ->
    #{
        one_cost => 100,
        ten_cost => 900,
        one_get => 10000,
        ten_get => 100000    };
get(_Type) ->
    undefined.
