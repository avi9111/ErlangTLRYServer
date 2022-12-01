%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mon_retrieve
%% @Brief  : 历练补偿
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_mon_retrieve).

-export([
    get/1
]).

get(1) -> 
	#{
		cost_type => 0,
		retrieve_atom => mon_retrieve,
		level => 0	};
get(2) -> 
	#{
		cost_type => 17,
		retrieve_atom => mon_retrieve_by_silver,
		level => 25	};
get(3) -> 
	#{
		cost_type => 13,
		retrieve_atom => mon_retrieve_by_bgold,
		level => 37	};
get(_Type) -> 
	undefined.