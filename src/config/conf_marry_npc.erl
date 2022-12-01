%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_marry_npc
%% @Brief  : 结婚NPC
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_marry_npc).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        type => 1,
        id => 1        
    };
get(2) ->
    #{
        type => 2,
        id => 46        
    };
get(3) ->
    #{
        type => 3,
        id => 47        
    };
get(4) ->
    #{
        type => 4,
        id => 2        
    };
get(5) ->
    #{
        type => 5,
        id => 3        
    };
get(6) ->
    #{
        type => 6,
        id => 2101        
    };
get(7) ->
    #{
        type => 7,
        id => 2102        
    };
get(8) ->
    #{
        type => 8,
        id => 2103        
    };
get(9) ->
    #{
        type => 9,
        id => 2104        
    };
get(10) ->
    #{
        type => 10,
        id => 2105        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
