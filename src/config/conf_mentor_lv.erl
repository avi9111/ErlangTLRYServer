%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_lv
%% @Brief  : 师徒师父等级
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_lv).

-export([
    get/1
]).

get(1) ->
    #{
        morality_value => 0,
        title => 7001        
    };
get(2) ->
    #{
        morality_value => 100,
        title => 7002        
    };
get(3) ->
    #{
        morality_value => 500,
        title => 7003        
    };
get(_) ->
    undefined.