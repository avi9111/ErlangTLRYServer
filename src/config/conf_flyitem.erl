%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      飞行道具配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_flyitem).

-include("log.hrl").

-export([
	get/1
]).


%% Apis ------------------------------------------------
%% @doc 获取飞行道具配置
%% @spec get(FlyitemId) -> #{} | undefined.
%% FlyitemId        :: integer()
get(1001) ->
    #{
        id => 1001,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 6000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,10021013}
    };
get(1002) ->
    #{
        id => 1002,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 8000,
        tick_beg => 0,
        tick_gap => 1000,
        tick_act => {-1,10031016}
    };
get(1003) ->
    #{
        id => 1003,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 6000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,10022013}
    };
get(1004) ->
    #{
        id => 1004,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 6000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,10023013}
    };
get(1005) ->
    #{
        id => 1005,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 6000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,10024013}
    };
get(1006) ->
    #{
        id => 1006,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{1,0,0}],
        duration => 8000,
        tick_beg => 7500,
        tick_gap => 3000,
        tick_act => {-1,20021106}
    };
get(1007) ->
    #{
        id => 1007,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{1,0,0}],
        duration => 6000,
        tick_beg => 5500,
        tick_gap => 2000,
        tick_act => {-1,20021403}
    };
get(1011) ->
    #{
        id => 1011,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,4,4},{2,4,-4},{2,-4,-4},{2,-4,4}],
        duration => 26000,
        tick_beg => 15000,
        tick_gap => 2000,
        tick_act => {-1,20021205}
    };
get(1021) ->
    #{
        id => 1021,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,138}],
        duration => 15000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021304}
    };
get(1022) ->
    #{
        id => 1022,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1023) ->
    #{
        id => 1023,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1024) ->
    #{
        id => 1024,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1025) ->
    #{
        id => 1025,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1026) ->
    #{
        id => 1026,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,138}],
        duration => 15000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021304}
    };
get(1027) ->
    #{
        id => 1027,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1028) ->
    #{
        id => 1028,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1029) ->
    #{
        id => 1029,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1030) ->
    #{
        id => 1030,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1031) ->
    #{
        id => 1031,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,110}],
        duration => 15000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021304}
    };
get(1032) ->
    #{
        id => 1032,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1033) ->
    #{
        id => 1033,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1034) ->
    #{
        id => 1034,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,138}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1035) ->
    #{
        id => 1035,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,432,110}],
        duration => 15000,
        tick_beg => 16000,
        tick_gap => 500,
        tick_act => {}
    };
get(1036) ->
    #{
        id => 1036,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,458,110}],
        duration => 15000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021304}
    };
get(1101) ->
    #{
        id => 1101,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,460,255}],
        duration => 20000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(1102) ->
    #{
        id => 1102,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,435,236}],
        duration => 20000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(1103) ->
    #{
        id => 1103,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,487,236}],
        duration => 20000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(1104) ->
    #{
        id => 1104,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,447,208}],
        duration => 20000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(1105) ->
    #{
        id => 1105,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,474,207}],
        duration => 20000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(1111) ->
    #{
        id => 1111,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,460,255}],
        duration => 20000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021406}
    };
get(1112) ->
    #{
        id => 1112,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,435,236}],
        duration => 20000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021406}
    };
get(1113) ->
    #{
        id => 1113,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,487,236}],
        duration => 20000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021406}
    };
get(1114) ->
    #{
        id => 1114,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,447,208}],
        duration => 20000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021406}
    };
get(1115) ->
    #{
        id => 1115,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,474,207}],
        duration => 20000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20021406}
    };
get(1201) ->
    #{
        id => 1201,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{1,0,0}],
        duration => 8000,
        tick_beg => 7500,
        tick_gap => 3000,
        tick_act => {-1,20024304}
    };
get(1202) ->
    #{
        id => 1202,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{1,0,0}],
        duration => 8000,
        tick_beg => 4000,
        tick_gap => 1000,
        tick_act => {-1,20024703}
    };
get(1211) ->
    #{
        id => 1211,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,419,300}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1212) ->
    #{
        id => 1212,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,416,281}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1213) ->
    #{
        id => 1213,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,431,263}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1214) ->
    #{
        id => 1214,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,450,269}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1215) ->
    #{
        id => 1215,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,454,288}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1216) ->
    #{
        id => 1216,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,439,304}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1217) ->
    #{
        id => 1217,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,419,300}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1218) ->
    #{
        id => 1218,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,416,281}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1219) ->
    #{
        id => 1219,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,431,263}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1220) ->
    #{
        id => 1220,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,450,269}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1221) ->
    #{
        id => 1221,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,454,288}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1222) ->
    #{
        id => 1222,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,439,304}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {}
    };
get(1223) ->
    #{
        id => 1223,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,419,300}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1224) ->
    #{
        id => 1224,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,416,281}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1225) ->
    #{
        id => 1225,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,431,263}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1226) ->
    #{
        id => 1226,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,450,269}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1227) ->
    #{
        id => 1227,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,454,288}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1228) ->
    #{
        id => 1228,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{0,439,304}],
        duration => 10000,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20024710}
    };
get(1229) ->
    #{
        id => 1229,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 5000,
        tick_gap => 500,
        tick_act => {-1,20024711}
    };
get(1230) ->
    #{
        id => 1230,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{1,0,0}],
        duration => 4500,
        tick_beg => 0,
        tick_gap => 500,
        tick_act => {-1,20029303}
    };
get(2001) ->
    #{
        id => 2001,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(2002) ->
    #{
        id => 2002,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(2003) ->
    #{
        id => 2003,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(2004) ->
    #{
        id => 2004,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(2005) ->
    #{
        id => 2005,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(2006) ->
    #{
        id => 2006,
        type => 1,
        radii => 0,
        speed => 0,
        begin_pos => [{2,0,0}],
        duration => 10000,
        tick_beg => 21000,
        tick_gap => 500,
        tick_act => {}
    };
get(FlyitemId) ->
    ?ERROR_FUNC_CALL([FlyitemId]),
    undefined.
