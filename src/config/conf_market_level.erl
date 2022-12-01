%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_level
%% @Brief  : 商会等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_level).

-export([
    get/1,
    get_ids/0,
    get_level/1,
    get_limit/1
]).

get(1) ->
    #{
        level => 1,
        name => <<"普通">>,
        turnover => 0,
        volume => 0,
        num => 10        
    };
get(2) ->
    #{
        level => 2,
        name => <<"白钻">>,
        turnover => 1000000,
        volume => 100,
        num => 15        
    };
get(3) ->
    #{
        level => 3,
        name => <<"蓝钻">>,
        turnover => 5000000,
        volume => 500,
        num => 20        
    };
get(4) ->
    #{
        level => 4,
        name => <<"黄钻">>,
        turnover => 10000000,
        volume => 1000,
        num => 25        
    };
get(5) ->
    #{
        level => 5,
        name => <<"红钻">>,
        turnover => 50000000,
        volume => 5000,
        num => 30        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].

get_level({Turnover, Volume}) when Turnover >= 50000000, Volume >= 5000 ->
    5;
get_level({Turnover, Volume}) when Turnover >= 10000000, Volume >= 1000 ->
    4;
get_level({Turnover, Volume}) when Turnover >= 5000000, Volume >= 500 ->
    3;
get_level({Turnover, Volume}) when Turnover >= 1000000, Volume >= 100 ->
    2;
get_level({Turnover, Volume}) when Turnover >= 0, Volume >= 0 ->
    1;
get_level(_) ->
    1.

get_limit({Turnover, Volume}) when Turnover >= 50000000, Volume >= 5000 ->
    30;
get_limit({Turnover, Volume}) when Turnover >= 10000000, Volume >= 1000 ->
    25;
get_limit({Turnover, Volume}) when Turnover >= 5000000, Volume >= 500 ->
    20;
get_limit({Turnover, Volume}) when Turnover >= 1000000, Volume >= 100 ->
    15;
get_limit({Turnover, Volume}) when Turnover >= 0, Volume >= 0 ->
    10;
get_limit(_) ->
    0.
