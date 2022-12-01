%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_base
%% @Brief  : 师徒基础配置
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_base).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 19,
        mentor_lv => 50,
        team_num => 2,
        tudi_num => 4,
        senior_lv => 50,
        comment_timing => [40,30],
        tudi_finish_award => [310301],
        mentor_task => {6,3},
        taixue_task_num => 10,
        tudi_practice_num => 1,
        enounce_limit => 50,
        confirm_cd1 => 30,
        confirm_cd2 => 60,
		npc_pos => {10000,266,372},
        practice_pos => {10000,254,360,384}		
    }.
