%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dragon_state
%% @Brief  : 凝元境界
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dragon_state).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        state => 1,
        ratio => 7000,
        drop => 306001,
        rumor => 0        
    };
get(2) ->
    #{
        state => 2,
        ratio => 2500,
        drop => 306011,
        rumor => 0        
    };
get(3) ->
    #{
        state => 3,
        ratio => 1200,
        drop => 306021,
        rumor => 0        
    };
get(4) ->
    #{
        state => 4,
        ratio => 600,
        drop => 306031,
        rumor => 0        
    };
get(5) ->
    #{
        state => 5,
        ratio => 0,
        drop => 306041,
        rumor => 1        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].
