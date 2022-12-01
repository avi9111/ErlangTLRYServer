%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_draw_acc
%% @Brief  : 经脉夺宝累计
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_draw_acc).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        drop => 220011,
        times => 10        
    };
get(2) ->
    #{
        id => 2,
        drop => 220012,
        times => 20        
    };
get(3) ->
    #{
        id => 3,
        drop => 220013,
        times => 40        
    };
get(4) ->
    #{
        id => 4,
        drop => 220014,
        times => 60        
    };
get(5) ->
    #{
        id => 5,
        drop => 220015,
        times => 80        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].
