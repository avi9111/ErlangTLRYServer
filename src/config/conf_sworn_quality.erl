%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_quality
%% @Brief  : 结拜品质提升
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_quality).

-export([
    get/1
]).

get(1) ->
    #{
        sworn_value_need => 5000        
    };
get(2) ->
    #{
        sworn_value_need => 10000        
    };
get(3) ->
    #{
        sworn_value_need => 20000        
    };
get(4) ->
    #{
        sworn_value_need => 50000        
    };
get(5) ->
    #{
        sworn_value_need => 100000        
    };
get(_Quality) ->
    undefined.