%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_world_lv_decay
%% @Brief  : 世界等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_world_lv_decay).

-export([
    get/1,
    get_ids/0,
    get_ratio/1
]).

get(0) ->
    #{
        level => 0,
        ratio => 1        
    };
get(1) ->
    #{
        level => 1,
        ratio => 0.75        
    };
get(2) ->
    #{
        level => 2,
        ratio => 0.5        
    };
get(3) ->
    #{
        level => 3,
        ratio => 0.25        
    };
get(4) ->
    #{
        level => 4,
        ratio => 0.1        
    };
get(999) ->
    #{
        level => 999,
        ratio => 0.1        
    };
get(_ID) ->
    undefined.

get_ratio(Level) when Level =< 0 ->
    1;
get_ratio(Level) when Level =< 1 ->
    0.75;
get_ratio(Level) when Level =< 2 ->
    0.5;
get_ratio(Level) when Level =< 3 ->
    0.25;
get_ratio(Level) when Level =< 4 ->
    0.1;
get_ratio(Level) when Level =< 999 ->
    0.1;
get_ratio(_ID) ->
    0.

get_ids() ->
    [0, 1, 2, 3, 4, 999].
