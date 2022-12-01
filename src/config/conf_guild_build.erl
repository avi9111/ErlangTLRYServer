%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_build
%% @Brief  : 帮派建筑
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_build).

-export([
    get/2,
    get_ids/0,
    get_id_lvs/1
]).

get(1001, 1) -> 
	#{
		effect => 0,
		cost_funds => 0,
		denf_funds => 150000	};
get(1001, 2) -> 
	#{
		effect => 0,
		cost_funds => 872500,
		denf_funds => 325000	};
get(1001, 3) -> 
	#{
		effect => 0,
		cost_funds => 3779200,
		denf_funds => 720000	};
get(1001, 4) -> 
	#{
		effect => 0,
		cost_funds => 13593000,
		denf_funds => 1430000	};
get(1001, 5) -> 
	#{
		effect => 0,
		cost_funds => 37797000,
		denf_funds => 2820000	};
get(1002, 1) -> 
	#{
		effect => 50,
		cost_funds => 0,
		denf_funds => 0	};
get(1002, 2) -> 
	#{
		effect => 100,
		cost_funds => 458000,
		denf_funds => 20500	};
get(1002, 3) -> 
	#{
		effect => 150,
		cost_funds => 2273700,
		denf_funds => 62500	};
get(1002, 4) -> 
	#{
		effect => 180,
		cost_funds => 8154000,
		denf_funds => 125000	};
get(1002, 5) -> 
	#{
		effect => 200,
		cost_funds => 22914000,
		denf_funds => 396000	};
get(1003, 1) -> 
	#{
		effect => 10000000,
		cost_funds => 0,
		denf_funds => 0	};
get(1003, 2) -> 
	#{
		effect => 30000000,
		cost_funds => 662000,
		denf_funds => 24600	};
get(1003, 3) -> 
	#{
		effect => 50000000,
		cost_funds => 2669700,
		denf_funds => 75000	};
get(1003, 4) -> 
	#{
		effect => 70000000,
		cost_funds => 9574100,
		denf_funds => 150000	};
get(1003, 5) -> 
	#{
		effect => 90000000,
		cost_funds => 26904700,
		denf_funds => 475200	};
get(1004, 1) -> 
	#{
		effect => 1,
		cost_funds => 0,
		denf_funds => 0	};
get(1004, 2) -> 
	#{
		effect => 2,
		cost_funds => 407000,
		denf_funds => 16400	};
get(1004, 3) -> 
	#{
		effect => 3,
		cost_funds => 1994700,
		denf_funds => 50000	};
get(1004, 4) -> 
	#{
		effect => 4,
		cost_funds => 7153400,
		denf_funds => 100000	};
get(1004, 5) -> 
	#{
		effect => 5,
		cost_funds => 19426000,
		denf_funds => 316800	};
get(1005, 1) -> 
	#{
		effect => 0,
		cost_funds => 0,
		denf_funds => 0	};
get(1005, 2) -> 
	#{
		effect => 1,
		cost_funds => 355000,
		denf_funds => 14350	};
get(1005, 3) -> 
	#{
		effect => 2,
		cost_funds => 1716700,
		denf_funds => 43750	};
get(1005, 4) -> 
	#{
		effect => 3,
		cost_funds => 6156400,
		denf_funds => 87500	};
get(1005, 5) -> 
	#{
		effect => 4,
		cost_funds => 15939000,
		denf_funds => 277200	};
get(1006, 1) -> 
	#{
		effect => 0,
		cost_funds => 0,
		denf_funds => 0	};
get(1006, 2) -> 
	#{
		effect => 200,
		cost_funds => 355000,
		denf_funds => 12300	};
get(1006, 3) -> 
	#{
		effect => 400,
		cost_funds => 1716700,
		denf_funds => 37500	};
get(1006, 4) -> 
	#{
		effect => 600,
		cost_funds => 6156400,
		denf_funds => 75000	};
get(1006, 5) -> 
	#{
		effect => 800,
		cost_funds => 15939000,
		denf_funds => 237600	};
get(_ID, _Lv) -> 
	undefined.

get_ids() ->
	[1001, 1002, 1003, 1004, 1005, 1006].

get_id_lvs(1001) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1002) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1003) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1004) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1005) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1006) ->
    [1, 2, 3, 4, 5];
get_id_lvs(_) ->
    [].