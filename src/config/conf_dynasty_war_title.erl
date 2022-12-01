%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dynasty_war_title
%% @Brief  : 宋辽战争称号
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dynasty_war_title).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        item => 30010601,
        score => 1000,
        win_times => 0        
    };
get(2) ->
    #{
        id => 2,
        item => 30010602,
        score => 3000,
        win_times => 0        
    };
get(3) ->
    #{
        id => 3,
        item => 30010603,
        score => 8000,
        win_times => 0        
    };
get(4) ->
    #{
        id => 4,
        item => 30010604,
        score => 20000,
        win_times => 0        
    };
get(5) ->
    #{
        id => 5,
        item => 30010605,
        score => 50000,
        win_times => 0        
    };
get(6) ->
    #{
        id => 6,
        item => 30010606,
        score => 100000,
        win_times => 1        
    };
get(7) ->
    #{
        id => 7,
        item => 30010607,
        score => 200000,
        win_times => 20        
    };
get(8) ->
    #{
        id => 8,
        item => 30010608,
        score => 500000,
        win_times => 100        
    };
get(_Score) ->
    0.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8].
