%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dragon_pos
%% @Brief  : 龙元位置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dragon_pos).

-export([
    get/1,
    get_ids/0,
    get_by_type/1
]).

get(1) ->
    #{
        pos => 1,
        type => 1,
        unlock => 10        
    };
get(2) ->
    #{
        pos => 2,
        type => 2,
        unlock => 10        
    };
get(3) ->
    #{
        pos => 3,
        type => 2,
        unlock => 10        
    };
get(4) ->
    #{
        pos => 4,
        type => 2,
        unlock => 10        
    };
get(5) ->
    #{
        pos => 5,
        type => 1,
        unlock => 30        
    };
get(6) ->
    #{
        pos => 6,
        type => 2,
        unlock => 30        
    };
get(7) ->
    #{
        pos => 7,
        type => 2,
        unlock => 30        
    };
get(8) ->
    #{
        pos => 8,
        type => 2,
        unlock => 30        
    };
get(9) ->
    #{
        pos => 9,
        type => 1,
        unlock => 50        
    };
get(10) ->
    #{
        pos => 10,
        type => 2,
        unlock => 50        
    };
get(11) ->
    #{
        pos => 11,
        type => 2,
        unlock => 50        
    };
get(12) ->
    #{
        pos => 12,
        type => 2,
        unlock => 50        
    };
get(13) ->
    #{
        pos => 13,
        type => 1,
        unlock => 70        
    };
get(14) ->
    #{
        pos => 14,
        type => 2,
        unlock => 70        
    };
get(15) ->
    #{
        pos => 15,
        type => 2,
        unlock => 70        
    };
get(16) ->
    #{
        pos => 16,
        type => 2,
        unlock => 70        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16].

get_by_type(1) ->
    [1, 5, 9, 13];
get_by_type(2) ->
    [2, 3, 4, 6, 7, 8, 10, 11, 12, 14, 15, 16];
get_by_type(_) ->
    [].
