%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_charge_gift
%% @Brief  : 充值礼包
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_charge_gift).

-export([
    get/1,
    get_ids/0
]).

get(1) -> 
	#{
		charge_gold => 500,
		reward => 250001	};
get(2) -> 
	#{
		charge_gold => 1000,
		reward => 250002	};
get(3) -> 
	#{
		charge_gold => 2000,
		reward => 250003	};
get(4) -> 
	#{
		charge_gold => 3000,
		reward => 250004	};
get(5) -> 
	#{
		charge_gold => 5000,
		reward => 250005	};
get(6) -> 
	#{
		charge_gold => 10000,
		reward => 250006	};
get(7) -> 
	#{
		charge_gold => 20000,
		reward => 250007	};
get(8) -> 
	#{
		charge_gold => 50000,
		reward => 250008	};
get(_ID) -> 
	undefined.


get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8].