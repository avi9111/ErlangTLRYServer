%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_research
%% @Brief  : 帮派研究
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_research).

-export([
    get/2,
    get_ids/0,
    get_id_lvs/1
]).

get(1001, 1) -> 
	#{
		effect => 4,
		cost => 40000	};
get(1001, 2) -> 
	#{
		effect => 8,
		cost => 70000	};
get(1001, 3) -> 
	#{
		effect => 12,
		cost => 100000	};
get(1001, 4) -> 
	#{
		effect => 16,
		cost => 130000	};
get(1001, 5) -> 
	#{
		effect => 20,
		cost => 160000	};
get(1002, 1) -> 
	#{
		effect => 2,
		cost => 40000	};
get(1002, 2) -> 
	#{
		effect => 4,
		cost => 70000	};
get(1002, 3) -> 
	#{
		effect => 6,
		cost => 100000	};
get(1002, 4) -> 
	#{
		effect => 8,
		cost => 130000	};
get(1002, 5) -> 
	#{
		effect => 10,
		cost => 160000	};
get(1003, 1) -> 
	#{
		effect => 1,
		cost => 40000	};
get(1003, 2) -> 
	#{
		effect => 2,
		cost => 70000	};
get(1003, 3) -> 
	#{
		effect => 3,
		cost => 100000	};
get(1003, 4) -> 
	#{
		effect => 4,
		cost => 130000	};
get(1003, 5) -> 
	#{
		effect => 5,
		cost => 160000	};
get(1004, 1) -> 
	#{
		effect => 1,
		cost => 40000	};
get(1004, 2) -> 
	#{
		effect => 2,
		cost => 70000	};
get(1004, 3) -> 
	#{
		effect => 3,
		cost => 100000	};
get(1004, 4) -> 
	#{
		effect => 4,
		cost => 130000	};
get(1004, 5) -> 
	#{
		effect => 5,
		cost => 160000	};
get(1005, 1) -> 
	#{
		effect => 1,
		cost => 170000	};
get(1005, 2) -> 
	#{
		effect => 2,
		cost => 300000	};
get(1005, 3) -> 
	#{
		effect => 3,
		cost => 420000	};
get(1005, 4) -> 
	#{
		effect => 4,
		cost => 550000	};
get(1005, 5) -> 
	#{
		effect => 5,
		cost => 690000	};
get(1006, 1) -> 
	#{
		effect => 1,
		cost => 170000	};
get(1006, 2) -> 
	#{
		effect => 2,
		cost => 300000	};
get(1006, 3) -> 
	#{
		effect => 3,
		cost => 420000	};
get(1006, 4) -> 
	#{
		effect => 4,
		cost => 550000	};
get(1006, 5) -> 
	#{
		effect => 5,
		cost => 690000	};
get(1007, 1) -> 
	#{
		effect => 20,
		cost => 170000	};
get(1007, 2) -> 
	#{
		effect => 40,
		cost => 300000	};
get(1007, 3) -> 
	#{
		effect => 60,
		cost => 420000	};
get(1007, 4) -> 
	#{
		effect => 80,
		cost => 550000	};
get(1007, 5) -> 
	#{
		effect => 100,
		cost => 690000	};
get(1008, 1) -> 
	#{
		effect => 40,
		cost => 170000	};
get(1008, 2) -> 
	#{
		effect => 80,
		cost => 300000	};
get(1008, 3) -> 
	#{
		effect => 120,
		cost => 420000	};
get(1008, 4) -> 
	#{
		effect => 160,
		cost => 550000	};
get(1008, 5) -> 
	#{
		effect => 200,
		cost => 690000	};
get(1009, 1) -> 
	#{
		effect => 40,
		cost => 400000	};
get(1009, 2) -> 
	#{
		effect => 80,
		cost => 700000	};
get(1009, 3) -> 
	#{
		effect => 120,
		cost => 1000000	};
get(1009, 4) -> 
	#{
		effect => 160,
		cost => 1300000	};
get(1009, 5) -> 
	#{
		effect => 200,
		cost => 1600000	};
get(1010, 1) -> 
	#{
		effect => 20,
		cost => 400000	};
get(1010, 2) -> 
	#{
		effect => 40,
		cost => 700000	};
get(1010, 3) -> 
	#{
		effect => 60,
		cost => 1000000	};
get(1010, 4) -> 
	#{
		effect => 80,
		cost => 1300000	};
get(1010, 5) -> 
	#{
		effect => 100,
		cost => 1600000	};
get(2001, 1) -> 
	#{
		effect => 5,
		cost => 40000	};
get(2001, 2) -> 
	#{
		effect => 10,
		cost => 70000	};
get(2001, 3) -> 
	#{
		effect => 15,
		cost => 100000	};
get(2001, 4) -> 
	#{
		effect => 20,
		cost => 130000	};
get(2001, 5) -> 
	#{
		effect => 25,
		cost => 160000	};
get(2002, 1) -> 
	#{
		effect => 6,
		cost => 40000	};
get(2002, 2) -> 
	#{
		effect => 12,
		cost => 70000	};
get(2002, 3) -> 
	#{
		effect => 18,
		cost => 100000	};
get(2002, 4) -> 
	#{
		effect => 24,
		cost => 130000	};
get(2002, 5) -> 
	#{
		effect => 30,
		cost => 160000	};
get(2003, 1) -> 
	#{
		effect => 1,
		cost => 40000	};
get(2003, 2) -> 
	#{
		effect => 2,
		cost => 70000	};
get(2003, 3) -> 
	#{
		effect => 3,
		cost => 100000	};
get(2003, 4) -> 
	#{
		effect => 4,
		cost => 130000	};
get(2003, 5) -> 
	#{
		effect => 5,
		cost => 160000	};
get(2004, 1) -> 
	#{
		effect => 4,
		cost => 40000	};
get(2004, 2) -> 
	#{
		effect => 8,
		cost => 70000	};
get(2004, 3) -> 
	#{
		effect => 12,
		cost => 100000	};
get(2004, 4) -> 
	#{
		effect => 16,
		cost => 130000	};
get(2004, 5) -> 
	#{
		effect => 20,
		cost => 160000	};
get(2005, 1) -> 
	#{
		effect => 5,
		cost => 170000	};
get(2005, 2) -> 
	#{
		effect => 10,
		cost => 300000	};
get(2005, 3) -> 
	#{
		effect => 15,
		cost => 420000	};
get(2005, 4) -> 
	#{
		effect => 20,
		cost => 550000	};
get(2005, 5) -> 
	#{
		effect => 25,
		cost => 690000	};
get(2006, 1) -> 
	#{
		effect => 5,
		cost => 170000	};
get(2006, 2) -> 
	#{
		effect => 10,
		cost => 300000	};
get(2006, 3) -> 
	#{
		effect => 15,
		cost => 420000	};
get(2006, 4) -> 
	#{
		effect => 20,
		cost => 550000	};
get(2006, 5) -> 
	#{
		effect => 25,
		cost => 690000	};
get(2007, 1) -> 
	#{
		effect => 6,
		cost => 170000	};
get(2007, 2) -> 
	#{
		effect => 12,
		cost => 300000	};
get(2007, 3) -> 
	#{
		effect => 18,
		cost => 420000	};
get(2007, 4) -> 
	#{
		effect => 24,
		cost => 550000	};
get(2007, 5) -> 
	#{
		effect => 30,
		cost => 690000	};
get(2008, 1) -> 
	#{
		effect => 10,
		cost => 170000	};
get(2008, 2) -> 
	#{
		effect => 20,
		cost => 300000	};
get(2008, 3) -> 
	#{
		effect => 30,
		cost => 420000	};
get(2008, 4) -> 
	#{
		effect => 40,
		cost => 550000	};
get(2008, 5) -> 
	#{
		effect => 50,
		cost => 690000	};
get(2009, 1) -> 
	#{
		effect => 3,
		cost => 400000	};
get(2009, 2) -> 
	#{
		effect => 6,
		cost => 700000	};
get(2009, 3) -> 
	#{
		effect => 9,
		cost => 1000000	};
get(2009, 4) -> 
	#{
		effect => 12,
		cost => 1300000	};
get(2009, 5) -> 
	#{
		effect => 15,
		cost => 1600000	};
get(2010, 1) -> 
	#{
		effect => 6,
		cost => 400000	};
get(2010, 2) -> 
	#{
		effect => 12,
		cost => 700000	};
get(2010, 3) -> 
	#{
		effect => 18,
		cost => 1000000	};
get(2010, 4) -> 
	#{
		effect => 24,
		cost => 1300000	};
get(2010, 5) -> 
	#{
		effect => 30,
		cost => 1600000	};
get(_ID, _Lv) -> 
	undefined.

get_ids() ->
	[1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010].

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
get_id_lvs(1007) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1008) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1009) ->
    [1, 2, 3, 4, 5];
get_id_lvs(1010) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2001) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2002) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2003) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2004) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2005) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2006) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2007) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2008) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2009) ->
    [1, 2, 3, 4, 5];
get_id_lvs(2010) ->
    [1, 2, 3, 4, 5];
get_id_lvs(_) ->
    [].