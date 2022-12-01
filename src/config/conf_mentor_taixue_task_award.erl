%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_taixue_task_award
%% @Brief  : 师徒太学册任务奖励
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_taixue_task_award).

-export([
    get/2
]).

get(3, Lv) when Lv >= 75 ->
    #{
        mentor_award => [310618],
        tudi_award => [310609]
        
    };
get(3, Lv) when Lv >= 60 ->
    #{
        mentor_award => [310618],
        tudi_award => [310608]
        
    };
get(3, Lv) when Lv >= 1 ->
    #{
        mentor_award => [310618],
        tudi_award => [310607]
        
    };
get(6, Lv) when Lv >= 75 ->
    #{
        mentor_award => [310618],
        tudi_award => [310606]
        
    };
get(6, Lv) when Lv >= 60 ->
    #{
        mentor_award => [310618],
        tudi_award => [310605]
        
    };
get(6, Lv) when Lv >= 1 ->
    #{
        mentor_award => [310618],
        tudi_award => [310604]
        
    };
get(10, Lv) when Lv >= 75 ->
    #{
        mentor_award => [310618],
        tudi_award => [310603]
        
    };
get(10, Lv) when Lv >= 60 ->
    #{
        mentor_award => [310618],
        tudi_award => [310602]
        
    };
get(10, Lv) when Lv >= 1 ->
    #{
        mentor_award => [310618],
        tudi_award => [310601]
        
    };
get(_, _) ->
    undefined.