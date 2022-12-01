%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_func
%% @Brief  : 功能开放
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_func).

-export([
    get/1,
    get_ids/0,
    get_init_ids/0
]).

get(100) ->
    #{
        id => 100,
        name => <<"战斗">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(101) ->
    #{
        id => 101,
        name => <<"主城">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(102) ->
    #{
        id => 102,
        name => <<"角色">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(103) ->
    #{
        id => 103,
        name => <<"锻造">>,
        open_cond => [{1,11}],
        quick_cond => []
        
    };
get(104) ->
    #{
        id => 104,
        name => <<"侠客">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(105) ->
    #{
        id => 105,
        name => <<"珍兽">>,
        open_cond => [{1,6}],
        quick_cond => []

    };
get(106) ->
    #{
        id => 106,
        name => <<"设置">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1000) ->
    #{
        id => 1000,
        name => <<"元宝商店">>,
        open_cond => [{2,1}],
        quick_cond => []

    };
get(1001) ->
    #{
        id => 1001,
        name => <<"装备商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1002) ->
    #{
        id => 1002,
        name => <<"装扮商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1003) ->
    #{
        id => 1003,
        name => <<"竞技商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1005) ->
    #{
        id => 1005,
        name => <<"三生三世">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1006) ->
    #{
        id => 1006,
        name => <<"套装">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1007) ->
    #{
        id => 1007,
        name => <<"图腾">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1008) ->
    #{
        id => 1008,
        name => <<"小师妹">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1009) ->
    #{
        id => 1009,
        name => <<"结婚">>,
        open_cond => [{1,38}],
        quick_cond => []

    };
get(1010) ->
    #{
        id => 1010,
        name => <<"英雄谱">>,
        open_cond => [{1,15}],
        quick_cond => []

    };
get(1011) ->
    #{
        id => 1011,
        name => <<"神器">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1012) ->
    #{
        id => 1012,
        name => <<"暗器">>,
        open_cond => [{1,64}],
        quick_cond => []

    };
get(1013) ->
    #{
        id => 1013,
        name => <<"外观">>,
        open_cond => [{1,13}],
        quick_cond => []

    };
get(1014) ->
    #{
        id => 1014,
        name => <<"技能">>,
        open_cond => [{1,2}],
        quick_cond => []

    };
get(1015) ->
    #{
        id => 1015,
        name => <<"武魂">>,
        open_cond => [{1,79}],
        quick_cond => []

    };
get(1016) ->
    #{
        id => 1016,
        name => <<"龙纹">>,
        open_cond => [{1,87}],
        quick_cond => []

    };
get(1100) ->
    #{
        id => 1100,
        name => <<"每日首充">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1101) ->
    #{
        id => 1101,
        name => <<"今日豪礼">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1102) ->
    #{
        id => 1102,
        name => <<"狂欢活动">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1103) ->
    #{
        id => 1103,
        name => <<"节日活动">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1104) ->
    #{
        id => 1104,
        name => <<"精彩活动">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1105) ->
    #{
        id => 1105,
        name => <<"福利大厅">>,
        open_cond => [{1,10}],
        quick_cond => []

    };
get(1106) ->
    #{
        id => 1106,
        name => <<"幸运转盘">>,
        open_cond => [{2,1}],
        quick_cond => []

    };
get(1107) ->
    #{
        id => 1107,
        name => <<"神宠来袭">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1108) ->
    #{
        id => 1108,
        name => <<"幸运好礼">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1109) ->
    #{
        id => 1109,
        name => <<"材料商店">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1110) ->
    #{
        id => 1110,
        name => <<"神兽商店">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1111) ->
    #{
        id => 1111,
        name => <<"夺宝商店">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1112) ->
    #{
        id => 1112,
        name => <<"开服活动">>,
        open_cond => [{2,1}],
        quick_cond => []

    };
get(1113) ->
    #{
        id => 1113,
        name => <<"拍卖行">>,
        open_cond => [{1,22}],
        quick_cond => []

    };
get(1114) ->
    #{
        id => 1114,
        name => <<"随身商店">>,
        open_cond => [{2,1}],
        quick_cond => []

    };
get(1115) ->
    #{
        id => 1115,
        name => <<"江湖历练">>,
        open_cond => [{2,1}],
        quick_cond => []

    };
get(1116) ->
    #{
        id => 1116,
        name => <<"商会">>,
        open_cond => [{1,21}],
        quick_cond => []

    };
get(1117) ->
    #{
        id => 1117,
        name => <<"充值">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1118) ->
    #{
        id => 1118,
        name => <<"首充">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1119) ->
    #{
        id => 1119,
        name => <<"江湖之路">>,
        open_cond => [{1,20}],
        quick_cond => []

    };
get(1120) ->
    #{
        id => 1120,
        name => <<"宋辽商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1121) ->
    #{
        id => 1121,
        name => <<"许愿果商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1122) ->
    #{
        id => 1122,
        name => <<"藏宝阁">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(1123) ->
    #{
        id => 1123,
        name => <<"积分商城">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1124) ->
    #{
        id => 1124,
        name => <<"桃李商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1125) ->
    #{
        id => 1125,
        name => <<"恩爱商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1126) ->
    #{
        id => 1126,
        name => <<"百炼商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1127) ->
    #{
        id => 1127,
        name => <<"侠义商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1128) ->
    #{
        id => 1128,
        name => <<"天命商店">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(1129) ->
    #{
        id => 1129,
        name => <<"神器">>,
        open_cond => [{4,10005}],
        quick_cond => []

    };
get(1200) ->
    #{
        id => 1200,
        name => <<"好友">>,
        open_cond => [{1,9}],
        quick_cond => []

    };
get(1201) ->
    #{
        id => 1201,
        name => <<"邮件">>,
        open_cond => [{1,8}],
        quick_cond => []

    };
get(1300) ->
    #{
        id => 1300,
        name => <<"日常">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(1301) ->
    #{
        id => 1301,
        name => <<"背包">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(1302) ->
    #{
        id => 1302,
        name => <<"邮件">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(1303) ->
    #{
        id => 1303,
        name => <<"周卡">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(1304) ->
    #{
        id => 1304,
        name => <<"月卡">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(1305) ->
    #{
        id => 1305,
        name => <<"首充">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(1306) ->
    #{
        id => 1306,
        name => <<"累充回馈">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(1307) ->
    #{
        id => 1307,
        name => <<"VIP">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(1308) ->
    #{
        id => 1308,
        name => <<"排行榜">>,
        open_cond => [{1,23}],
        quick_cond => []
        
    };
get(1401) ->
    #{
        id => 1401,
        name => <<"副本">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(1402) ->
    #{
        id => 1402,
        name => <<"竞技场">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(1403) ->
    #{
        id => 1403,
        name => <<"帮会">>,
        open_cond => [{1,18}],
        quick_cond => []
        
    };
get(1404) ->
    #{
        id => 1404,
        name => <<"BOSS">>,
        open_cond => [{2,1}],
        quick_cond => []
        
    };
get(1405) ->
    #{
        id => 1405,
        name => <<"活动大厅">>,
        open_cond => [{1,15}],
        quick_cond => []
        
    };
get(1406) ->
    #{
        id => 1406,
        name => <<"意见反馈">>,
        open_cond => [{1,12}],
        quick_cond => []
        
    };
get(2001) ->
    #{
        id => 2001,
        name => <<"坐骑">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2002) ->
    #{
        id => 2002,
        name => <<"翅膀">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2004) ->
    #{
        id => 2004,
        name => <<"附体">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2005) ->
    #{
        id => 2005,
        name => <<"悟性">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2006) ->
    #{
        id => 2006,
        name => <<"珍兽技能">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2007) ->
    #{
        id => 2007,
        name => <<"侠客">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2008) ->
    #{
        id => 2008,
        name => <<"背饰">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2009) ->
    #{
        id => 2009,
        name => <<"名号">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2010) ->
    #{
        id => 2010,
        name => <<"小师妹">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2011) ->
    #{
        id => 2011,
        name => <<"魅力">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2012) ->
    #{
        id => 2012,
        name => <<"灵器">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2013) ->
    #{
        id => 2013,
        name => <<"发簪">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2014) ->
    #{
        id => 2014,
        name => <<"腰佩">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2015) ->
    #{
        id => 2015,
        name => <<"成就">>,
        open_cond => [{1,12}],
        quick_cond => []

    };
get(2101) ->
    #{
        id => 2101,
        name => <<"神兽来袭">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(2102) ->
    #{
        id => 2102,
        name => <<"夺宝奇兵">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(2201) ->
    #{
        id => 2201,
        name => <<"技能">>,
        open_cond => [{1,1}],
        quick_cond => []

    };
get(2301) ->
    #{
        id => 2301,
        name => <<"淬炼">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2302) ->
    #{
        id => 2302,
        name => <<"锻炼">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2303) ->
    #{
        id => 2303,
        name => <<"精炼">>,
        open_cond => [{1,999}],
        quick_cond => []

    };
get(2304) ->
    #{
        id => 2304,
        name => <<"神装">>,
        open_cond => [{1,999}],
        quick_cond => []
        
    };
get(2401) ->
    #{
        id => 2401,
        name => <<"副本-四绝庄">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(2402) ->
    #{
        id => 2402,
        name => <<"材料副本">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(2501) ->
    #{
        id => 2501,
        name => <<"珍珑棋局">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(3001) ->
    #{
        id => 3001,
        name => <<"初次选择珍兽">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(3002) ->
    #{
        id => 3002,
        name => <<"组队">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(3101) ->
    #{
        id => 3101,
        name => <<"珍兽·属性">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(3102) ->
    #{
        id => 3102,
        name => <<"珍兽·培养">>,
        open_cond => [{1,25}],
        quick_cond => []
        
    };
get(3103) ->
    #{
        id => 3103,
        name => <<"珍兽·继承">>,
        open_cond => [{1,25}],
        quick_cond => []
        
    };
get(3104) ->
    #{
        id => 3104,
        name => <<"珍兽·附体">>,
        open_cond => [{1,55}],
        quick_cond => []
        
    };
get(3105) ->
    #{
        id => 3105,
        name => <<"珍兽·图鉴">>,
        open_cond => [{1,1}],
        quick_cond => []
        
    };
get(3201) ->
    #{
        id => 3201,
        name => <<"神器碎片一">>,
        open_cond => [{4,10005}],
        quick_cond => []
        
    };
get(3202) ->
    #{
        id => 3202,
        name => <<"神器碎片二">>,
        open_cond => [{4,1018}],
        quick_cond => []
        
    };
get(3203) ->
    #{
        id => 3203,
        name => <<"神器碎片三">>,
        open_cond => [{4,1038}],
        quick_cond => []
        
    };
get(3204) ->
    #{
        id => 3204,
        name => <<"神器碎片四">>,
        open_cond => [{4,1079}],
        quick_cond => []
        
    };
get(3205) ->
    #{
        id => 3205,
        name => <<"神器碎片五">>,
        open_cond => [{1,32}],
        quick_cond => []
        
    };
get(3301) ->
    #{
        id => 3301,
        name => <<"英雄指点">>,
        open_cond => [{1,44}],
        quick_cond => []
        
    };
get(3302) ->
    #{
        id => 3302,
        name => <<"结拜">>,
        open_cond => [{1,34}],
        quick_cond => []
        
    };
get(3303) ->
    #{
        id => 3303,
        name => <<"师徒">>,
        open_cond => [{1,19}],
        quick_cond => []
        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [100, 101, 102, 103, 104, 105, 1000, 1001, 1002, 1003, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1110, 1111, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1200, 1201, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1401, 1402, 1403, 1404, 1405, 1406, 2001, 2002, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2101, 2102, 2201, 2301, 2302, 2303, 2304, 2401, 2402, 2501, 3001, 3002, 3101, 3102, 3103, 3104, 3105, 3201, 3202, 3203, 3204, 3205, 3301, 3302, 3303].

get_init_ids() ->
    [].
