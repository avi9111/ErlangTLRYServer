%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_daily_lively
%% @Brief  : 活跃值
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_daily_lively).

-export([
    get/1
]).

get(1) ->
    #{
        times => 10,
        add_exp => 2    };    
get(2) ->
    #{
        times => 10,
        add_exp => 1    };    
get(3) ->
    #{
        times => 10,
        add_exp => 1    };    
get(4) ->
    #{
        times => 10,
        add_exp => 1    };    
get(5) ->
    #{
        times => 1,
        add_exp => 10    };    
get(6) ->
    #{
        times => 1,
        add_exp => 10    };    
get(7) ->
    #{
        times => 1,
        add_exp => 10    };    
get(8) ->
    #{
        times => 1,
        add_exp => 10    };    
get(9) ->
    #{
        times => 1,
        add_exp => 10    };    
get(10) ->
    #{
        times => 1,
        add_exp => 15    };    
get(11) ->
    #{
        times => 1,
        add_exp => 20    };    
get(_ID) ->
	undefined.