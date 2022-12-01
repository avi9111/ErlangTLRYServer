%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_value_get
%% @Brief  : 结拜金兰值获得
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_value_get).

-export([
    get/1
]).

get(2) ->
    #{
        sworn_value => 2        
    };
get(3) ->
    #{
        sworn_value => 3        
    };
get(4) ->
    #{
        sworn_value => 4        
    };
get(5) ->
    #{
        sworn_value => 5        
    };
get(_TeamNum) ->
    undefined.