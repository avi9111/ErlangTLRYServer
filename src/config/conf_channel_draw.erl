%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_draw
%% @Brief  : 经脉夺宝
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_draw).

-export([
    get/1,
    get_ids/0,
    get_weight/1
]).

get(1) ->
    #{
        id => 1,
        drop => 220001,
        weight => 10000,
        weight_ten => 0,
        rumor => 0        
    };
get(2) ->
    #{
        id => 2,
        drop => 220002,
        weight => 10000,
        weight_ten => 0,
        rumor => 0        
    };
get(3) ->
    #{
        id => 3,
        drop => 220003,
        weight => 10000,
        weight_ten => 0,
        rumor => 0        
    };
get(4) ->
    #{
        id => 4,
        drop => 220004,
        weight => 10000,
        weight_ten => 0,
        rumor => 0        
    };
get(5) ->
    #{
        id => 5,
        drop => 220005,
        weight => 1000,
        weight_ten => 1000,
        rumor => 1        
    };
get(6) ->
    #{
        id => 6,
        drop => 220006,
        weight => 1000,
        weight_ten => 1000,
        rumor => 1        
    };
get(7) ->
    #{
        id => 7,
        drop => 220007,
        weight => 1000,
        weight_ten => 1000,
        rumor => 1        
    };
get(8) ->
    #{
        id => 8,
        drop => 220008,
        weight => 1000,
        weight_ten => 1000,
        rumor => 1        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8].

get_weight(Times) when Times rem 10 =:= 0 ->
    [{1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 1000}, {6, 1000}, {7, 1000}, {8, 1000}];
get_weight(_) ->
    [{1, 10000}, {2, 10000}, {3, 10000}, {4, 10000}, {5, 1000}, {6, 1000}, {7, 1000}, {8, 1000}].
