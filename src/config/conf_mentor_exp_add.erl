%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_exp_add
%% @Brief  : 师徒加成传功经验
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_exp_add).

-export([
    get/1
]).

get(LvGap) when LvGap >= 5 ->
    #{
        add_per => 0        
    };
get(LvGap) when LvGap >= 4 ->
    #{
        add_per => 0        
    };
get(LvGap) when LvGap >= 3 ->
    #{
        add_per => 0        
    };
get(LvGap) when LvGap >= 2 ->
    #{
        add_per => 0        
    };
get(LvGap) when LvGap >= 1 ->
    #{
        add_per => 0        
    };
get(_) ->
    undefined.