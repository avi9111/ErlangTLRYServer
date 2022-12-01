%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_consume_roraty
%% @Brief  : 消费转盘
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_consume_roraty).

-export([
    get/1,
    get_ids/0
]).

get(1) -> 
	#{
		id => 1,
		weight => 2000,
		min_times => 0,
		reward => 252001	};
get(2) -> 
	#{
		id => 2,
		weight => 1000,
		min_times => 4,
		reward => 252002	};
get(3) -> 
	#{
		id => 3,
		weight => 2500,
		min_times => 0,
		reward => 252003	};
get(4) -> 
	#{
		id => 4,
		weight => 1000,
		min_times => 5,
		reward => 252004	};
get(5) -> 
	#{
		id => 5,
		weight => 2500,
		min_times => 0,
		reward => 252005	};
get(6) -> 
	#{
		id => 6,
		weight => 1000,
		min_times => 6,
		reward => 252006	};
get(7) -> 
	#{
		id => 7,
		weight => 2500,
		min_times => 0,
		reward => 252007	};
get(8) -> 
	#{
		id => 8,
		weight => 1000,
		min_times => 7,
		reward => 252008	};
get(_ID) -> 
	undefined.


get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8].