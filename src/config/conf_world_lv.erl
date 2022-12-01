%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_world_lv
%% @Brief  : 世界等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_world_lv).

-export([
    get/1,
    get_lv/1,
    get_ids/0
]).

get(Day) when Day >= 999 ->
    #{
        day => 999,
        level => 70        
    };
get(Day) when Day >= 31 ->
    #{
        day => 31,
        level => 70        
    };
get(Day) when Day >= 15 ->
    #{
        day => 15,
        level => 70        
    };
get(Day) when Day >= 1 ->
    #{
        day => 1,
        level => 60        
    };
get(_ID) ->
    undefined.

get_lv(Day) when Day >= 999 ->
    70;
get_lv(Day) when Day >= 31 ->
    70;
get_lv(Day) when Day >= 15 ->
    70;
get_lv(Day) when Day >= 1 ->
    60;
get_lv(_ID) ->
    0.

get_ids() ->
    [1, 15, 31, 999].
