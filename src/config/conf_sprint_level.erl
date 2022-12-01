%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sprint_level
%% @Brief  : 冲级大赛
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_sprint_level).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        times => 5000,
        lv => 30,
        reward => 300001        
    };
get(2) ->
    #{
        times => 2500,
        lv => 35,
        reward => 300002        
    };
get(3) ->
    #{
        times => 1000,
        lv => 40,
        reward => 300003        
    };
get(4) ->
    #{
        times => 500,
        lv => 43,
        reward => 300004        
    };
get(5) ->
    #{
        times => 200,
        lv => 46,
        reward => 300005        
    };
get(6) ->
    #{
        times => 100,
        lv => 50,
        reward => 300006        
    };
get(7) ->
    #{
        times => 50,
        lv => 55,
        reward => 300007        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7].
