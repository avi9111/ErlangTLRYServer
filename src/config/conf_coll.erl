%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      采集物配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_coll).

-include("log.hrl").

-export([
    get/1
]).


%% Apis ------------------------------------------------
%% @doc 获取采集物配置
%% @spec get(CollId) -> #{} | undefined.
%% CollId :: integer()
get(1001) ->
    #{
        id => 1001,
        name => <<"塔">>,
        type => 2,
        interruptable => 0,
        disappear => 0,
        duration => 1000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 1001,
        classify => 0,
        survive => 0
    };
get(1002) ->
    #{
        id => 1002,
        name => <<"旗">>,
        type => 2,
        interruptable => 0,
        disappear => 0,
        duration => 2000,
        quick_dur => 2000,
        refresh => 0,
        drop_id => 1001,
        classify => 0,
        survive => 0
    };
get(1003) ->
    #{
        id => 1003,
        name => <<"宝箱">>,
        type => 1,
        interruptable => 1,
        disappear => 1,
        duration => 10000,
        quick_dur => 10000,
        refresh => 1000,
        drop_id => 1001,
        classify => 0,
        survive => 0
    };
get(1004) ->
    #{
        id => 1004,
        name => <<"烧烤大餐">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 298001,
        classify => 0,
        survive => 0
    };
get(1005) ->
    #{
        id => 1005,
        name => <<"领地旗帜">>,
        type => 3,
        interruptable => 1,
        disappear => 0,
        duration => 5000,
        quick_dur => 5000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1101) ->
    #{
        id => 1101,
        name => <<"杂绒棉">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1102) ->
    #{
        id => 1102,
        name => <<"粗绒棉">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1103) ->
    #{
        id => 1103,
        name => <<"长绒棉">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1104) ->
    #{
        id => 1104,
        name => <<"细绒棉">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1105) ->
    #{
        id => 1105,
        name => <<"特绒棉">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1111) ->
    #{
        id => 1111,
        name => <<"劣质兽夹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1112) ->
    #{
        id => 1112,
        name => <<"普通兽夹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1113) ->
    #{
        id => 1113,
        name => <<"精良兽夹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1114) ->
    #{
        id => 1114,
        name => <<"优质兽夹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1115) ->
    #{
        id => 1115,
        name => <<"精致兽夹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1121) ->
    #{
        id => 1121,
        name => <<"碎石矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1122) ->
    #{
        id => 1122,
        name => <<"粗石矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1123) ->
    #{
        id => 1123,
        name => <<"硬石矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1124) ->
    #{
        id => 1124,
        name => <<"富石矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1125) ->
    #{
        id => 1125,
        name => <<"精铁矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1131) ->
    #{
        id => 1131,
        name => <<"小型蚕架">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1132) ->
    #{
        id => 1132,
        name => <<"中型蚕架">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1133) ->
    #{
        id => 1133,
        name => <<"大型蚕架">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1134) ->
    #{
        id => 1134,
        name => <<"组合蚕架">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1135) ->
    #{
        id => 1135,
        name => <<"拼接式蚕架">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1136) ->
    #{
        id => 1136,
        name => <<"优质金矿">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1201) ->
    #{
        id => 1201,
        name => <<"野花蜜">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1202) ->
    #{
        id => 1202,
        name => <<"菖蒲">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1203) ->
    #{
        id => 1203,
        name => <<"疗伤草">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1204) ->
    #{
        id => 1204,
        name => <<"首乌">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1205) ->
    #{
        id => 1205,
        name => <<"决明子">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1206) ->
    #{
        id => 1206,
        name => <<"山茶">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1207) ->
    #{
        id => 1207,
        name => <<"紫苏">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1208) ->
    #{
        id => 1208,
        name => <<"沉香">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1209) ->
    #{
        id => 1209,
        name => <<"薄荷">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1210) ->
    #{
        id => 1210,
        name => <<"辛夷">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1211) ->
    #{
        id => 1211,
        name => <<"白芷">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1212) ->
    #{
        id => 1212,
        name => <<"灵芝">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(1501) ->
    #{
        id => 1501,
        name => <<"小狗宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 30000
    };
get(1502) ->
    #{
        id => 1502,
        name => <<"乌龟宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1503) ->
    #{
        id => 1503,
        name => <<"松鼠宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1504) ->
    #{
        id => 1504,
        name => <<"刺猬宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1505) ->
    #{
        id => 1505,
        name => <<"螳螂宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1506) ->
    #{
        id => 1506,
        name => <<"鳄鱼宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1507) ->
    #{
        id => 1507,
        name => <<"鹰宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1508) ->
    #{
        id => 1508,
        name => <<"豹子宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1509) ->
    #{
        id => 1509,
        name => <<"熊宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1510) ->
    #{
        id => 1510,
        name => <<"猩猩宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(1511) ->
    #{
        id => 1511,
        name => <<"駮马宝宝">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 3000,
        refresh => 0,
        drop_id => 0,
        classify => 1,
        survive => 180000
    };
get(2001) ->
    #{
        id => 2001,
        name => <<"野花蜜">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2002) ->
    #{
        id => 2002,
        name => <<"药篓">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2003) ->
    #{
        id => 2003,
        name => <<"影盅">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2004) ->
    #{
        id => 2004,
        name => <<"斟酒">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2005) ->
    #{
        id => 2005,
        name => <<"散落的经书">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2006) ->
    #{
        id => 2006,
        name => <<"疗伤">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2007) ->
    #{
        id => 2007,
        name => <<"烧毁">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2008) ->
    #{
        id => 2008,
        name => <<"莲蓬">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2009) ->
    #{
        id => 2009,
        name => <<"山茶花">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2010) ->
    #{
        id => 2010,
        name => <<"玉佩">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2011) ->
    #{
        id => 2011,
        name => <<"天星草">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2012) ->
    #{
        id => 2012,
        name => <<"天心葵">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2013) ->
    #{
        id => 2013,
        name => <<"天龙续命丹">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2014) ->
    #{
        id => 2014,
        name => <<"荷叶泥">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2015) ->
    #{
        id => 2015,
        name => <<"树枝">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2016) ->
    #{
        id => 2016,
        name => <<"玉璧">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2017) ->
    #{
        id => 2017,
        name => <<"泉水">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2018) ->
    #{
        id => 2018,
        name => <<"石凳">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2019) ->
    #{
        id => 2019,
        name => <<"雪莲花">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(2020) ->
    #{
        id => 2020,
        name => <<"千山雪莲">>,
        type => 1,
        interruptable => 0,
        disappear => 0,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(3001) ->
    #{
        id => 3001,
        name => <<"银两答谢礼盒">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 330001,
        classify => 0,
        survive => 0
    };
get(3002) ->
    #{
        id => 3002,
        name => <<"元宝答谢礼盒">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 330002,
        classify => 0,
        survive => 0
    };
get(3003) ->
    #{
        id => 3003,
        name => <<"新婚礼盒">>,
        type => 2,
        interruptable => 0,
        disappear => 1,
        duration => 3000,
        quick_dur => 1000,
        refresh => 0,
        drop_id => 330003,
        classify => 0,
        survive => 0
    };
get(4001) ->
    #{
        id => 4001,
        name => <<"宝箱">>,
        type => 1,
        interruptable => 1,
        disappear => 1,
        duration => 5000,
        quick_dur => 5000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(4002) ->
    #{
        id => 4002,
        name => <<"大宝箱">>,
        type => 1,
        interruptable => 1,
        disappear => 1,
        duration => 5000,
        quick_dur => 5000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(4003) ->
    #{
        id => 4003,
        name => <<"宝箱">>,
        type => 1,
        interruptable => 1,
        disappear => 1,
        duration => 5000,
        quick_dur => 5000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(4004) ->
    #{
        id => 4004,
        name => <<"大宝箱">>,
        type => 1,
        interruptable => 1,
        disappear => 1,
        duration => 5000,
        quick_dur => 5000,
        refresh => 0,
        drop_id => 0,
        classify => 0,
        survive => 0
    };
get(CollId) ->
    ?ERROR_FUNC_CALL(CollId),
    undefined.
