%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_base
%% @Brief  : 结拜基础配置
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_base).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 34,
        num_limit => 5,
        confirm_cd1 => 30,
        confirm_cd2 => 60,
        sworn_value_cost => {10000,1000},
        vote_cd => 30,
        fix_word => <<"之">>,
        daily_sworn_value => 1000,
		sworn_word_limit => 20,
		gather_cd => 1800,
		daily_greet_num => 10,
		modify_name_coin_cost => 1000,
		wangfuzi_pos => {10000,192,389},
		duanfuzi_pos => {10000,199,389},
		dungeon_id_list => [30001,30002,30003,30004,30005]
		
    }.
