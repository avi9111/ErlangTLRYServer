%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_mark_award
%% @Brief  : 师徒师父成绩奖励
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_mark_award).

-export([
    get/1
]).

get(Mark) when Mark >= 90 ->
    #{
        award => [310315]
        
    };
get(Mark) when Mark >= 70 ->
    #{
        award => [310314]
        
    };
get(Mark) when Mark >= 50 ->
    #{
        award => [310313]
        
    };
get(Mark) when Mark >= 30 ->
    #{
        award => [310312]
        
    };
get(Mark) when Mark >= 0 ->
    #{
        award => [310311]
        
    };
get(_) ->
    undefined.