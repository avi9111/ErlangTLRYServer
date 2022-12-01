%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_level_box
%% @Brief  : 历练宝箱
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_level_box).

-export([
    get/1,
    get_lvs/0
]).

get(1) ->
    #{
        lv => 69,
        exp => 30000,
        reward => [10001],
        times_per_week => 3        
    };
get(2) ->
    #{
        lv => 79,
        exp => 60000,
        reward => [10002],
        times_per_week => 2        
    };
get(3) ->
    #{
        lv => 89,
        exp => 90000,
        reward => [10003],
        times_per_week => 1        
    };
get(_ID) ->
    undefined.

get_lvs() ->
    [69, 79, 89].