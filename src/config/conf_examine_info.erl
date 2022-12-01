%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_examine_info
%% @Brief  : 科举考试信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_examine_info).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 20,
        question_num => 10,
        help_times => 5,
        help_reward_times => 5    }.
