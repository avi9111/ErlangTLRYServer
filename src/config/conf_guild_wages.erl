%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wages
%% @Brief  : 帮派工资
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_wages).

-export([
    get/1,
    get_ids/0
]).

get(1002) -> 
	#{
		times => 4,
		bgold => 15	};
get(1003) -> 
	#{
		times => 1,
		bgold => 20	};
get(1004) -> 
	#{
		times => 1,
		bgold => 18	};
get(1005) -> 
	#{
		times => 1,
		bgold => 10	};
get(1006) -> 
	#{
		times => 40,
		bgold => 10	};
get(1007) -> 
	#{
		times => 20,
		bgold => 10	};
get(1008) -> 
	#{
		times => 4,
		bgold => 10	};
get(1009) -> 
	#{
		times => 10,
		bgold => 16	};
get(_ID) -> 
	undefined.

get_ids() ->
	[1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009].