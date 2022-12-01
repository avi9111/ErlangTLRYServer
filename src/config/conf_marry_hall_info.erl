%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_marry_hall_info
%% @Brief  : 结婚礼堂信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_marry_hall_info).

-export([
    get/0
]).

get() -> 
	#{
		last_time => 1800,
		role_limit => 100,
		tran_weight => 100,
		tran_last_time => 20,
		tran_id_list => [1001,1002,1003,1004,1005,1006],
		npc_id => 1,
		noisy_cost => {4,2000},
		noisy_info_key => [naodongfang1,naodongfang2,naodongfang3,naodongfang4],
		open_hall_cost => {17,52199},
		baitang_use_id => 201,
		parade_gift => [{1,3003,1,[{119,273}]}],
		parade_firework => [{1,2001,119,373},{2,2001,105,273},{3,2001,105,219}]	}.
