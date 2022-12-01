%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_lv_gap
%% @Brief  : 师徒等级差
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_lv_gap).

-export([
    get/1
]).

get(TudiLv) when TudiLv >= 90 ->
    #{
        mentor_lv => 1        
    };
get(TudiLv) when TudiLv >= 80 ->
    #{
        mentor_lv => 2        
    };
get(TudiLv) when TudiLv >= 70 ->
    #{
        mentor_lv => 3        
    };
get(TudiLv) when TudiLv >= 60 ->
    #{
        mentor_lv => 4        
    };
get(TudiLv) when TudiLv >= 1 ->
    #{
        mentor_lv => 5        
    };
get(_TudiLv) ->
    undefined.