%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_warrior_soul_index_range
%% @Brief  : 武魂凝魂序号范围
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_warrior_soul_index_range).

-export([
    get/1
]).

get(Range) when Range =< 5 ->
    #{
        index_start => 1,
        index_end => 24        
    };
get(Range) when Range =< 25 ->
    #{
        index_start => 1,
        index_end => 36        
    };
get(Range) when Range =< 50 ->
    #{
        index_start => 3,
        index_end => 36        
    };
get(Range) when Range =< 100 ->
    #{
        index_start => 3,
        index_end => 36        
    };
get(_Range) ->
    undefined.
