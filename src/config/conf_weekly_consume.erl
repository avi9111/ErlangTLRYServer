%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_weekly_consume
%% @Brief  : 每周反馈
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_weekly_consume).

-export([
    get/1,
    get_ids/0
]).

get(1) -> 
	#{
		cost_gold => 60,
		reward => 251001	};
get(2) -> 
	#{
		cost_gold => 500,
		reward => 251002	};
get(3) -> 
	#{
		cost_gold => 1000,
		reward => 251003	};
get(4) -> 
	#{
		cost_gold => 2000,
		reward => 251004	};
get(5) -> 
	#{
		cost_gold => 4000,
		reward => 251005	};
get(6) -> 
	#{
		cost_gold => 6000,
		reward => 251006	};
get(7) -> 
	#{
		cost_gold => 10000,
		reward => 251007	};
get(8) -> 
	#{
		cost_gold => 20000,
		reward => 251008	};
get(9) -> 
	#{
		cost_gold => 50000,
		reward => 251009	};
get(_ID) -> 
	undefined.


get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9].