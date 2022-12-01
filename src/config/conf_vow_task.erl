%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_vow_task
%% @Brief  : 众里寻卿任务
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_vow_task).

-export([
    get/2,
    get_type/2,
    get_day_ids/1,
    get_days/0
]).

get(1, 1001) -> 
	#{
		deed => 10,
		times => 1,
		arg => 0,
		type => 1	};
get(1, 1002) -> 
	#{
		deed => 15,
		times => 1,
		arg => 0,
		type => 2	};
get(1, 1003) -> 
	#{
		deed => 15,
		times => 1,
		arg => 201,
		type => 7	};
get(1, 1004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 202,
		type => 7	};
get(1, 1005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 0,
		type => 3	};
get(2, 2001) -> 
	#{
		deed => 20,
		times => 1,
		arg => 0,
		type => 3	};
get(2, 2002) -> 
	#{
		deed => 20,
		times => 20,
		arg => 0,
		type => 6	};
get(2, 2003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 201,
		type => 7	};
get(2, 2004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 900,
		type => 4	};
get(2, 2005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 800,
		type => 4	};
get(3, 3001) -> 
	#{
		deed => 20,
		times => 1,
		arg => 0,
		type => 3	};
get(3, 3002) -> 
	#{
		deed => 20,
		times => 20,
		arg => 0,
		type => 6	};
get(3, 3003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 202,
		type => 7	};
get(3, 3004) -> 
	#{
		deed => 10,
		times => 5,
		arg => 0,
		type => 5	};
get(3, 3005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 1200,
		type => 4	};
get(4, 4001) -> 
	#{
		deed => 20,
		times => 1,
		arg => 0,
		type => 3	};
get(4, 4002) -> 
	#{
		deed => 30,
		times => 1,
		arg => 0,
		type => 9	};
get(4, 4003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 202,
		type => 7	};
get(4, 4004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 800,
		type => 4	};
get(4, 4005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 1000,
		type => 4	};
get(5, 5001) -> 
	#{
		deed => 20,
		times => 1,
		arg => 1100,
		type => 4	};
get(5, 5002) -> 
	#{
		deed => 20,
		times => 20,
		arg => 0,
		type => 6	};
get(5, 5003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 201,
		type => 7	};
get(5, 5004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 900,
		type => 4	};
get(5, 5005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 700,
		type => 4	};
get(6, 6001) -> 
	#{
		deed => 35,
		times => 1,
		arg => 0,
		type => 9	};
get(6, 6002) -> 
	#{
		deed => 20,
		times => 1,
		arg => 0,
		type => 3	};
get(6, 6003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 202,
		type => 7	};
get(6, 6004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 900,
		type => 4	};
get(6, 6005) -> 
	#{
		deed => 10,
		times => 10,
		arg => 0,
		type => 5	};
get(7, 7001) -> 
	#{
		deed => 35,
		times => 1,
		arg => 0,
		type => 8	};
get(7, 7002) -> 
	#{
		deed => 20,
		times => 1,
		arg => 1100,
		type => 4	};
get(7, 7003) -> 
	#{
		deed => 10,
		times => 1,
		arg => 202,
		type => 7	};
get(7, 7004) -> 
	#{
		deed => 10,
		times => 1,
		arg => 800,
		type => 4	};
get(7, 7005) -> 
	#{
		deed => 10,
		times => 1,
		arg => 1000,
		type => 4	};
get(_Day, _ID) -> 
	undefined.

get_type(1, 1001) -> 1;
get_type(1, 1002) -> 2;
get_type(1, 1003) -> 7;
get_type(1, 1004) -> 7;
get_type(1, 1005) -> 3;
get_type(2, 2001) -> 3;
get_type(2, 2002) -> 6;
get_type(2, 2003) -> 7;
get_type(2, 2004) -> 4;
get_type(2, 2005) -> 4;
get_type(3, 3001) -> 3;
get_type(3, 3002) -> 6;
get_type(3, 3003) -> 7;
get_type(3, 3004) -> 5;
get_type(3, 3005) -> 4;
get_type(4, 4001) -> 3;
get_type(4, 4002) -> 9;
get_type(4, 4003) -> 7;
get_type(4, 4004) -> 4;
get_type(4, 4005) -> 4;
get_type(5, 5001) -> 4;
get_type(5, 5002) -> 6;
get_type(5, 5003) -> 7;
get_type(5, 5004) -> 4;
get_type(5, 5005) -> 4;
get_type(6, 6001) -> 9;
get_type(6, 6002) -> 3;
get_type(6, 6003) -> 7;
get_type(6, 6004) -> 4;
get_type(6, 6005) -> 5;
get_type(7, 7001) -> 8;
get_type(7, 7002) -> 4;
get_type(7, 7003) -> 7;
get_type(7, 7004) -> 4;
get_type(7, 7005) -> 4;
get_type(_Day, _ID) -> 
	undefined.

get_days() ->
	[1, 2, 3, 4, 5, 6, 7].

get_day_ids(1) ->
    [1001, 1002, 1003, 1004, 1005];
get_day_ids(2) ->
    [2001, 2002, 2003, 2004, 2005];
get_day_ids(3) ->
    [3001, 3002, 3003, 3004, 3005];
get_day_ids(4) ->
    [4001, 4002, 4003, 4004, 4005];
get_day_ids(5) ->
    [5001, 5002, 5003, 5004, 5005];
get_day_ids(6) ->
    [6001, 6002, 6003, 6004, 6005];
get_day_ids(7) ->
    [7001, 7002, 7003, 7004, 7005];
get_day_ids(_) ->
    [].