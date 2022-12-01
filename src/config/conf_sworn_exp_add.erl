%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_exp_add
%% @Brief  : 结拜金兰值经验加成
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_exp_add).

-export([
    get/1
]).

get(SwornValue) when SwornValue >= 50000 ->
    #{
        exp_add => 12        
    };
get(SwornValue) when SwornValue >= 40000 ->
    #{
        exp_add => 11        
    };
get(SwornValue) when SwornValue >= 32000 ->
    #{
        exp_add => 10        
    };
get(SwornValue) when SwornValue >= 24000 ->
    #{
        exp_add => 9        
    };
get(SwornValue) when SwornValue >= 18000 ->
    #{
        exp_add => 8        
    };
get(SwornValue) when SwornValue >= 12000 ->
    #{
        exp_add => 7        
    };
get(SwornValue) when SwornValue >= 8000 ->
    #{
        exp_add => 6        
    };
get(SwornValue) when SwornValue >= 4000 ->
    #{
        exp_add => 5        
    };
get(SwornValue) when SwornValue >= 2000 ->
    #{
        exp_add => 4        
    };
get(SwornValue) when SwornValue >= 0 ->
    #{
        exp_add => 3        
    };
get(_SwornValue) ->
    undefined.