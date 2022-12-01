%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_society_star
%% @Brief  : 江湖之路星数
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_society_star).

-export([
    get/1,
    get_ids/0
]).

get(10) ->
    #{
        star => 10,
        reward => 295001        
    };
get(20) ->
    #{
        star => 20,
        reward => 295002        
    };
get(40) ->
    #{
        star => 40,
        reward => 295003        
    };
get(60) ->
    #{
        star => 60,
        reward => 295004        
    };
get(80) ->
    #{
        star => 80,
        reward => 295005        
    };
get(100) ->
    #{
        star => 100,
        reward => 295006        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [10, 20, 40, 60, 80, 100].
