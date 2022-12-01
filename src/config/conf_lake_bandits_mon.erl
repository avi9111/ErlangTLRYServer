%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_lake_bandits_mon
%% @Brief  : 镜湖剿匪怪物
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_lake_bandits_mon).

-export([
    get/1,
    get_dragon_ids/0,
    get_clam_ids/0,
    get_flood_dragon_ids/0,
    get_little_dragon_ids/0
]).

get(WorldLv) when WorldLv =< 50 -> 
	#{
        clam_id => 202001,
        dragon_id => 201001,
        flood_dragon_id => 203001,
        little_dragon_ids => [{205001,3},{205002,3},{205003,3},{205004,2},{205005,2},{205006,2}],
        clam_reward => 150101,
        dragon_reward => 150001,
        flood_dragon_reward => 150101,
        little_dragon_reward => 150201    };
get(WorldLv) when WorldLv =< 55 -> 
	#{
        clam_id => 202002,
        dragon_id => 201002,
        flood_dragon_id => 203002,
        little_dragon_ids => [{205002,3},{205003,3},{205005,3},{205006,2},{205007,2},{205008,2}],
        clam_reward => 150102,
        dragon_reward => 150002,
        flood_dragon_reward => 150102,
        little_dragon_reward => 150202    };
get(WorldLv) when WorldLv =< 60 -> 
	#{
        clam_id => 202003,
        dragon_id => 201003,
        flood_dragon_id => 203003,
        little_dragon_ids => [{205003,3},{205004,3},{205007,3},{205008,2},{205009,2},{205010,2}],
        clam_reward => 150103,
        dragon_reward => 150003,
        flood_dragon_reward => 150103,
        little_dragon_reward => 150203    };
get(WorldLv) when WorldLv =< 70 -> 
	#{
        clam_id => 202004,
        dragon_id => 201004,
        flood_dragon_id => 203004,
        little_dragon_ids => [{205004,3},{205005,3},{205009,3},{205010,2},{205011,2},{205012,2}],
        clam_reward => 150104,
        dragon_reward => 150004,
        flood_dragon_reward => 150104,
        little_dragon_reward => 150204    };
get(WorldLv) when WorldLv =< 75 -> 
	#{
        clam_id => 202005,
        dragon_id => 201005,
        flood_dragon_id => 203005,
        little_dragon_ids => [{205005,3},{205006,3},{205012,3},{205013,2},{205014,2},{205015,2}],
        clam_reward => 150105,
        dragon_reward => 150005,
        flood_dragon_reward => 150105,
        little_dragon_reward => 150205    };
get(WorldLv) when WorldLv =< 80 -> 
	#{
        clam_id => 202006,
        dragon_id => 201006,
        flood_dragon_id => 203006,
        little_dragon_ids => [{205006,3},{205007,3},{205015,3},{205016,2},{205017,2},{205018,2}],
        clam_reward => 150106,
        dragon_reward => 150006,
        flood_dragon_reward => 150106,
        little_dragon_reward => 150206    };
get(WorldLv) when WorldLv =< 85 -> 
	#{
        clam_id => 202007,
        dragon_id => 201007,
        flood_dragon_id => 203007,
        little_dragon_ids => [{205007,3},{205008,3},{205018,3},{205019,2},{205020,2},{205021,2}],
        clam_reward => 150107,
        dragon_reward => 150007,
        flood_dragon_reward => 150107,
        little_dragon_reward => 150207    };
get(WorldLv) when WorldLv =< 90 -> 
	#{
        clam_id => 202008,
        dragon_id => 201008,
        flood_dragon_id => 203008,
        little_dragon_ids => [{205008,3},{205009,3},{205021,3},{205022,2},{205023,2},{205024,2}],
        clam_reward => 150108,
        dragon_reward => 150008,
        flood_dragon_reward => 150108,
        little_dragon_reward => 150208    };
get(WorldLv) when WorldLv =< 95 -> 
	#{
        clam_id => 202009,
        dragon_id => 201009,
        flood_dragon_id => 203009,
        little_dragon_ids => [{205009,3},{205010,3},{205024,3},{205025,2},{205026,2},{205027,2}],
        clam_reward => 150109,
        dragon_reward => 150009,
        flood_dragon_reward => 150109,
        little_dragon_reward => 150209    };
get(WorldLv) when WorldLv =< 999 -> 
	#{
        clam_id => 202010,
        dragon_id => 201010,
        flood_dragon_id => 203010,
        little_dragon_ids => [{205010,3},{205011,3},{205027,3},{205028,2},{205029,2},{205030,2}],
        clam_reward => 150110,
        dragon_reward => 150010,
        flood_dragon_reward => 150110,
        little_dragon_reward => 150210    };
get(_WorldLv) ->
    undefined.

get_dragon_ids() ->
	[201001, 201002, 201003, 201004, 201005, 201006, 201007, 201008, 201009, 201010].

get_clam_ids() ->
	[202001, 202002, 202003, 202004, 202005, 202006, 202007, 202008, 202009, 202010].

get_flood_dragon_ids() ->
	[203001, 203002, 203003, 203004, 203005, 203006, 203007, 203008, 203009, 203010].

get_little_dragon_ids() ->
	[{205001,3},{205002,3},{205003,3},{205004,2},{205005,2},{205006,2}, {205002,3},{205003,3},{205005,3},{205006,2},{205007,2},{205008,2}, {205003,3},{205004,3},{205007,3},{205008,2},{205009,2},{205010,2}, {205004,3},{205005,3},{205009,3},{205010,2},{205011,2},{205012,2}, {205005,3},{205006,3},{205012,3},{205013,2},{205014,2},{205015,2}, {205006,3},{205007,3},{205015,3},{205016,2},{205017,2},{205018,2}, {205007,3},{205008,3},{205018,3},{205019,2},{205020,2},{205021,2}, {205008,3},{205009,3},{205021,3},{205022,2},{205023,2},{205024,2}, {205009,3},{205010,3},{205024,3},{205025,2},{205026,2},{205027,2}, {205010,3},{205011,3},{205027,3},{205028,2},{205029,2},{205030,2}].