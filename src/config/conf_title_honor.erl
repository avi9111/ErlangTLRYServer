%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_title_honor
%% @Brief  : 头衔
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_title_honor).

-export([
    get/1,
    get_ids/0,
    get_id_level/1
]).

get(1001) -> 
	#{
		id => 1001,
		level => 1,
		desc => <<"江湖新秀-10">>,
		condition => 10,
		cost_item => 0,
		cost_num => 0,
		attr => [{103,20},{9,75},{10,18}],
		addition => 0,
		attr_by_career => [{1,24,31},{2,22,31},{3,23,31},{4,21,31}]
	};
get(1002) -> 
	#{
		id => 1002,
		level => 2,
		desc => <<"青衫磊落-10">>,
		condition => 30,
		cost_item => 0,
		cost_num => 0,
		attr => [{103,36},{9,132},{10,33}],
		addition => 0,
		attr_by_career => [{1,24,54},{2,22,54},{3,23,54},{4,21,54}]
	};
get(1003) -> 
	#{
		id => 1003,
		level => 3,
		desc => <<"侠骨丹心-10">>,
		condition => 50,
		cost_item => 0,
		cost_num => 0,
		attr => [{103,51},{9,189},{10,47}],
		addition => 0,
		attr_by_career => [{1,24,77},{2,22,77},{3,23,77},{4,21,77}]
	};
get(1004) -> 
	#{
		id => 1004,
		level => 4,
		desc => <<"英雄豪杰-10">>,
		condition => 70,
		cost_item => 16450001,
		cost_num => 5,
		attr => [{103,102},{9,379},{10,94}],
		addition => 0,
		attr_by_career => [{1,24,155},{2,22,155},{3,23,155},{4,21,155}]
	};
get(1005) -> 
	#{
		id => 1005,
		level => 5,
		desc => <<"一代宗师-10">>,
		condition => 90,
		cost_item => 16450001,
		cost_num => 10,
		attr => [{103,154},{9,569},{10,142}],
		addition => 0,
		attr_by_career => [{1,24,233},{2,22,233},{3,23,233},{4,21,233}]
	};
get(1006) -> 
	#{
		id => 1006,
		level => 6,
		desc => <<"武林泰斗-10">>,
		condition => 110,
		cost_item => 16450001,
		cost_num => 20,
		attr => [{103,205},{9,758},{10,189}],
		addition => 0,
		attr_by_career => [{1,24,311},{2,22,311},{3,23,311},{4,21,311}]
	};
get(1007) -> 
	#{
		id => 1007,
		level => 7,
		desc => <<"雄霸一方-10">>,
		condition => 130,
		cost_item => 16450002,
		cost_num => 8,
		attr => [{103,282},{9,1043},{10,260}],
		addition => 10,
		attr_by_career => [{1,24,427},{2,22,427},{3,23,427},{4,21,427}]
	};
get(1008) -> 
	#{
		id => 1008,
		level => 8,
		desc => <<"出神入化-10">>,
		condition => 140,
		cost_item => 16450002,
		cost_num => 8,
		attr => [{103,321},{9,1185},{10,296}],
		addition => 10,
		attr_by_career => [{1,24,486},{2,22,486},{3,23,486},{4,21,486}]
	};
get(1009) -> 
	#{
		id => 1009,
		level => 9,
		desc => <<"举世无双-10">>,
		condition => 150,
		cost_item => 16450002,
		cost_num => 8,
		attr => [{103,360},{9,1327},{10,331}],
		addition => 10,
		attr_by_career => [{1,24,544},{2,22,544},{3,23,544},{4,21,544}]
	};
get(1010) -> 
	#{
		id => 1010,
		level => 10,
		desc => <<"震古烁今-10">>,
		condition => 160,
		cost_item => 16450003,
		cost_num => 6,
		attr => [{103,398},{9,1470},{10,367}],
		addition => 10,
		attr_by_career => [{1,24,602},{2,22,602},{3,23,602},{4,21,602}]
	};
get(1011) -> 
	#{
		id => 1011,
		level => 11,
		desc => <<"超凡入圣-10">>,
		condition => 170,
		cost_item => 16450003,
		cost_num => 10,
		attr => [{103,436},{9,1613},{10,403}],
		addition => 10,
		attr_by_career => [{1,24,660},{2,22,660},{3,23,660},{4,21,660}]
	};
get(1012) -> 
	#{
		id => 1012,
		level => 12,
		desc => <<"天人合一-10">>,
		condition => 180,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,475},{9,1754},{10,438}],
		addition => 10,
		attr_by_career => [{1,24,719},{2,22,719},{3,23,719},{4,21,719}]
	};
get(1013) -> 
	#{
		id => 1013,
		level => 13,
		desc => <<"返璞归真-10">>,
		condition => 200,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,514},{9,1897},{10,474}],
		addition => 10,
		attr_by_career => [{1,24,777},{2,22,777},{3,23,777},{4,21,777}]
	};
get(1014) -> 
	#{
		id => 1014,
		level => 14,
		desc => <<"大智若愚-10">>,
		condition => 210,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,553},{9,2039},{10,510}],
		addition => 10,
		attr_by_career => [{1,24,835},{2,22,835},{3,23,835},{4,21,835}]
	};
get(1015) -> 
	#{
		id => 1015,
		level => 15,
		desc => <<"虚怀若谷-10">>,
		condition => 230,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,592},{9,2181},{10,546}],
		addition => 10,
		attr_by_career => [{1,24,893},{2,22,893},{3,23,893},{4,21,893}]
	};
get(1016) -> 
	#{
		id => 1016,
		level => 16,
		desc => <<"逆转乾坤-10">>,
		condition => 250,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,631},{9,2323},{10,582}],
		addition => 10,
		attr_by_career => [{1,24,951},{2,22,951},{3,23,951},{4,21,951}]
	};
get(1017) -> 
	#{
		id => 1017,
		level => 17,
		desc => <<"">>,
		condition => 250,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,669},{9,2465},{10,617}],
		addition => 10,
		attr_by_career => [{1,24,1010},{2,22,1010},{3,23,1010},{4,21,1010}]
	};
get(1018) -> 
	#{
		id => 1018,
		level => 18,
		desc => <<"">>,
		condition => 260,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,707},{9,2608},{10,652}],
		addition => 10,
		attr_by_career => [{1,24,1069},{2,22,1069},{3,23,1069},{4,21,1069}]
	};
get(1019) -> 
	#{
		id => 1019,
		level => 19,
		desc => <<"">>,
		condition => 270,
		cost_item => 16450003,
		cost_num => 16,
		attr => [{103,739},{9,2726},{10,681}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1020) -> 
	#{
		id => 1020,
		level => 20,
		desc => <<"">>,
		condition => 280,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,553},{9,2039},{10,510}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1021) -> 
	#{
		id => 1021,
		level => 21,
		desc => <<"">>,
		condition => 290,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,592},{9,2181},{10,546}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1022) -> 
	#{
		id => 1022,
		level => 22,
		desc => <<"">>,
		condition => 300,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,631},{9,2323},{10,582}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1023) -> 
	#{
		id => 1023,
		level => 23,
		desc => <<"">>,
		condition => 310,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,669},{9,2465},{10,617}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1024) -> 
	#{
		id => 1024,
		level => 24,
		desc => <<"">>,
		condition => 320,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,707},{9,2608},{10,652}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(1025) -> 
	#{
		id => 1025,
		level => 25,
		desc => <<"">>,
		condition => 330,
		cost_item => 16450004,
		cost_num => 16,
		attr => [{103,739},{9,2726},{10,681}],
		addition => 10,
		attr_by_career => [{1,24,1118},{2,22,1118},{3,23,1118},{4,21,1118}]
	};
get(_ID) -> 
	undefined.

get_ids() ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 1022, 1023, 1024, 1025].

get_id_level(1001) ->
    1;
get_id_level(1002) ->
    2;
get_id_level(1003) ->
    3;
get_id_level(1004) ->
    4;
get_id_level(1005) ->
    5;
get_id_level(1006) ->
    6;
get_id_level(1007) ->
    7;
get_id_level(1008) ->
    8;
get_id_level(1009) ->
    9;
get_id_level(1010) ->
    10;
get_id_level(1011) ->
    11;
get_id_level(1012) ->
    12;
get_id_level(1013) ->
    13;
get_id_level(1014) ->
    14;
get_id_level(1015) ->
    15;
get_id_level(1016) ->
    16;
get_id_level(1017) ->
    17;
get_id_level(1018) ->
    18;
get_id_level(1019) ->
    19;
get_id_level(1020) ->
    20;
get_id_level(1021) ->
    21;
get_id_level(1022) ->
    22;
get_id_level(1023) ->
    23;
get_id_level(1024) ->
    24;
get_id_level(1025) ->
    25;
get_id_level(_ID) ->
    0.
