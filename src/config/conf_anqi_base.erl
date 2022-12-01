%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_anqi_base
%% @Brief  : 暗器
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_anqi_base).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 64,
        skill_num => 3,
        practice_cost => [{16420001,1}],
        practice_get => 10,
        init_level => 100,
        up_level_cost => [{16420002,1}],
        level_get => [{1,1000},{2,1000},{3,1000},{4,1000},{5,1000},{6,1000},{7,1000},{8,1000},{9,1000},{10,1000}],
        unlock_skill => [{1,20},{2,40},{3,60}],
        skill_set_open => [{1,{0,0}},{2,{17,20000}},{3,{3,1000}},{4,{3,1000}}],
        switch_cd => 5,
        refresh_skill_cost => [{16420003,1}],
        poison_open_lv => 100,
        unlock_poison_cost => [{16420001,100}],
        execute_poison_cost => [{16420001,5}],
        poison_exp_get => 5        
    }.
