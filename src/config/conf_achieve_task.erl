%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_achieve_task
%% @Brief  : 成就任务
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_achieve_task).

-export([
    get/1,
    get_ids/0,
    get_by_type/1
]).

get(110101) ->
    #{
        id => 110101,
        order => 1,
        name => <<"附近聊天">>,
        type => 11,
        star => 1,
        finish_cond => [{54,1,[3]}],
        reward => 305001,
        title => 0        
    };
get(110102) ->
    #{
        id => 110102,
        order => 2,
        name => <<"帮会聊天">>,
        type => 11,
        star => 1,
        finish_cond => [{54,1,[2]}],
        reward => 305002,
        title => 0        
    };
get(110103) ->
    #{
        id => 110103,
        order => 3,
        name => <<"队伍聊天">>,
        type => 11,
        star => 1,
        finish_cond => [{54,1,[3]}],
        reward => 305003,
        title => 0        
    };
get(110104) ->
    #{
        id => 110104,
        order => 4,
        name => <<"世界聊天">>,
        type => 11,
        star => 1,
        finish_cond => [{54,1,[1]}],
        reward => 305004,
        title => 0        
    };
get(110105) ->
    #{
        id => 110105,
        order => 5,
        name => <<"帮会聊天">>,
        type => 11,
        star => 1,
        finish_cond => [{57,1,[2]}],
        reward => 305005,
        title => 0        
    };
get(110401) ->
    #{
        id => 110401,
        order => 1,
        name => <<"江湖藏宝">>,
        type => 11,
        star => 1,
        finish_cond => [{28,10,[1]}],
        reward => 305101,
        title => 0        
    };
get(110402) ->
    #{
        id => 110402,
        order => 2,
        name => <<"江湖藏宝">>,
        type => 11,
        star => 1,
        finish_cond => [{28,50,[1]}],
        reward => 305102,
        title => 0        
    };
get(110403) ->
    #{
        id => 110403,
        order => 3,
        name => <<"江湖藏宝">>,
        type => 11,
        star => 1,
        finish_cond => [{28,100,[1]}],
        reward => 305103,
        title => 0        
    };
get(110404) ->
    #{
        id => 110404,
        order => 4,
        name => <<"江湖藏宝">>,
        type => 11,
        star => 1,
        finish_cond => [{28,200,[1]}],
        reward => 305104,
        title => 0        
    };
get(110405) ->
    #{
        id => 110405,
        order => 5,
        name => <<"江湖藏宝">>,
        type => 11,
        star => 1,
        finish_cond => [{28,500,[1]}],
        reward => 305105,
        title => 0        
    };
get(110501) ->
    #{
        id => 110501,
        order => 1,
        name => <<"稀世宝图">>,
        type => 11,
        star => 1,
        finish_cond => [{28,1,[2]}],
        reward => 305101,
        title => 0        
    };
get(110502) ->
    #{
        id => 110502,
        order => 2,
        name => <<"稀世宝图">>,
        type => 11,
        star => 1,
        finish_cond => [{28,10,[2]}],
        reward => 305102,
        title => 0        
    };
get(110503) ->
    #{
        id => 110503,
        order => 3,
        name => <<"稀世宝图">>,
        type => 11,
        star => 1,
        finish_cond => [{28,30,[2]}],
        reward => 305006,
        title => 0        
    };
get(110504) ->
    #{
        id => 110504,
        order => 4,
        name => <<"稀世宝图">>,
        type => 11,
        star => 1,
        finish_cond => [{28,60,[2]}],
        reward => 305007,
        title => 0        
    };
get(110505) ->
    #{
        id => 110505,
        order => 5,
        name => <<"稀世宝图">>,
        type => 11,
        star => 1,
        finish_cond => [{28,100,[2]}],
        reward => 305008,
        title => 0        
    };
get(120101) ->
    #{
        id => 120101,
        order => 1,
        name => <<"结拜兄弟">>,
        type => 12,
        star => 1,
        finish_cond => [{60,1000,[]}],
        reward => 305101,
        title => 0        
    };
get(120102) ->
    #{
        id => 120102,
        order => 2,
        name => <<"结拜兄弟">>,
        type => 12,
        star => 1,
        finish_cond => [{60,5000,[]}],
        reward => 305102,
        title => 0        
    };
get(120103) ->
    #{
        id => 120103,
        order => 3,
        name => <<"结拜兄弟">>,
        type => 12,
        star => 1,
        finish_cond => [{60,10000,[]}],
        reward => 305006,
        title => 0        
    };
get(120104) ->
    #{
        id => 120104,
        order => 4,
        name => <<"结拜兄弟">>,
        type => 12,
        star => 1,
        finish_cond => [{60,20000,[]}],
        reward => 305007,
        title => 0        
    };
get(120105) ->
    #{
        id => 120105,
        order => 5,
        name => <<"结拜兄弟">>,
        type => 12,
        star => 1,
        finish_cond => [{60,50000,[]}],
        reward => 305008,
        title => 0        
    };
get(130101) ->
    #{
        id => 130101,
        order => 1,
        name => <<"英雄谱">>,
        type => 13,
        star => 1,
        finish_cond => [{24,4,[]}],
        reward => 305006,
        title => 0        
    };
get(130102) ->
    #{
        id => 130102,
        order => 2,
        name => <<"英雄谱">>,
        type => 13,
        star => 1,
        finish_cond => [{24,8,[]}],
        reward => 305007,
        title => 0        
    };
get(130103) ->
    #{
        id => 130103,
        order => 3,
        name => <<"英雄谱">>,
        type => 13,
        star => 1,
        finish_cond => [{24,18,[]}],
        reward => 305008,
        title => 0        
    };
get(130104) ->
    #{
        id => 130104,
        order => 4,
        name => <<"英雄谱">>,
        type => 13,
        star => 1,
        finish_cond => [{24,24,[]}],
        reward => 305011,
        title => 0        
    };
get(130105) ->
    #{
        id => 130105,
        order => 5,
        name => <<"英雄谱">>,
        type => 13,
        star => 1,
        finish_cond => [{24,32,[]}],
        reward => 305212,
        title => 0        
    };
get(210101) ->
    #{
        id => 210101,
        order => 1,
        name => <<"帮会练功">>,
        type => 21,
        star => 1,
        finish_cond => [{32,1,[]}],
        reward => 305101,
        title => 0        
    };
get(210102) ->
    #{
        id => 210102,
        order => 2,
        name => <<"帮会练功">>,
        type => 21,
        star => 1,
        finish_cond => [{32,10,[]}],
        reward => 305102,
        title => 0        
    };
get(210103) ->
    #{
        id => 210103,
        order => 3,
        name => <<"帮会练功">>,
        type => 21,
        star => 1,
        finish_cond => [{32,20,[]}],
        reward => 305006,
        title => 0        
    };
get(210104) ->
    #{
        id => 210104,
        order => 4,
        name => <<"帮会练功">>,
        type => 21,
        star => 1,
        finish_cond => [{32,60,[]}],
        reward => 305007,
        title => 0        
    };
get(210105) ->
    #{
        id => 210105,
        order => 5,
        name => <<"帮会练功">>,
        type => 21,
        star => 1,
        finish_cond => [{32,100,[]}],
        reward => 305008,
        title => 0        
    };
get(210201) ->
    #{
        id => 210201,
        order => 1,
        name => <<"帮会行酒令">>,
        type => 21,
        star => 1,
        finish_cond => [{61,1,[]}],
        reward => 305101,
        title => 0        
    };
get(210202) ->
    #{
        id => 210202,
        order => 2,
        name => <<"帮会行酒令">>,
        type => 21,
        star => 1,
        finish_cond => [{61,5,[]}],
        reward => 305102,
        title => 0        
    };
get(210203) ->
    #{
        id => 210203,
        order => 3,
        name => <<"帮会行酒令">>,
        type => 21,
        star => 1,
        finish_cond => [{61,20,[]}],
        reward => 305006,
        title => 0        
    };
get(210204) ->
    #{
        id => 210204,
        order => 4,
        name => <<"帮会行酒令">>,
        type => 21,
        star => 1,
        finish_cond => [{61,60,[]}],
        reward => 305007,
        title => 0        
    };
get(210205) ->
    #{
        id => 210205,
        order => 5,
        name => <<"帮会行酒令">>,
        type => 21,
        star => 1,
        finish_cond => [{61,120,[]}],
        reward => 305008,
        title => 0        
    };
get(210301) ->
    #{
        id => 210301,
        order => 1,
        name => <<"帮会炼金">>,
        type => 21,
        star => 1,
        finish_cond => [{48,3,[]}],
        reward => 305101,
        title => 0        
    };
get(210302) ->
    #{
        id => 210302,
        order => 2,
        name => <<"帮会炼金">>,
        type => 21,
        star => 1,
        finish_cond => [{48,15,[]}],
        reward => 305102,
        title => 0        
    };
get(210303) ->
    #{
        id => 210303,
        order => 3,
        name => <<"帮会炼金">>,
        type => 21,
        star => 1,
        finish_cond => [{48,75,[]}],
        reward => 305103,
        title => 0        
    };
get(210304) ->
    #{
        id => 210304,
        order => 4,
        name => <<"帮会炼金">>,
        type => 21,
        star => 1,
        finish_cond => [{48,150,[]}],
        reward => 305104,
        title => 0        
    };
get(210305) ->
    #{
        id => 210305,
        order => 5,
        name => <<"帮会炼金">>,
        type => 21,
        star => 1,
        finish_cond => [{48,250,[]}],
        reward => 305105,
        title => 0        
    };
get(210401) ->
    #{
        id => 210401,
        order => 1,
        name => <<"帮会守卫">>,
        type => 21,
        star => 1,
        finish_cond => [{62,10,[]}],
        reward => 305006,
        title => 0        
    };
get(210402) ->
    #{
        id => 210402,
        order => 2,
        name => <<"帮会守卫">>,
        type => 21,
        star => 1,
        finish_cond => [{62,16,[]}],
        reward => 305007,
        title => 0        
    };
get(210403) ->
    #{
        id => 210403,
        order => 3,
        name => <<"帮会守卫">>,
        type => 21,
        star => 1,
        finish_cond => [{62,24,[]}],
        reward => 305008,
        title => 0        
    };
get(210404) ->
    #{
        id => 210404,
        order => 4,
        name => <<"帮会守卫">>,
        type => 21,
        star => 1,
        finish_cond => [{62,30,[]}],
        reward => 305009,
        title => 0        
    };
get(210405) ->
    #{
        id => 210405,
        order => 5,
        name => <<"帮会守卫">>,
        type => 21,
        star => 1,
        finish_cond => [{62,36,[]}],
        reward => 305010,
        title => 0        
    };
get(210501) ->
    #{
        id => 210501,
        order => 1,
        name => <<"帮会发红包">>,
        type => 21,
        star => 1,
        finish_cond => [{63,5,[]}],
        reward => 305101,
        title => 0        
    };
get(210502) ->
    #{
        id => 210502,
        order => 2,
        name => <<"帮会发红包">>,
        type => 21,
        star => 1,
        finish_cond => [{63,10,[]}],
        reward => 305102,
        title => 0        
    };
get(210503) ->
    #{
        id => 210503,
        order => 3,
        name => <<"帮会发红包">>,
        type => 21,
        star => 1,
        finish_cond => [{63,50,[]}],
        reward => 305006,
        title => 0        
    };
get(210504) ->
    #{
        id => 210504,
        order => 4,
        name => <<"帮会发红包">>,
        type => 21,
        star => 1,
        finish_cond => [{63,150,[]}],
        reward => 305007,
        title => 0        
    };
get(210505) ->
    #{
        id => 210505,
        order => 5,
        name => <<"帮会发红包">>,
        type => 21,
        star => 1,
        finish_cond => [{63,300,[]}],
        reward => 305008,
        title => 0        
    };
get(210601) ->
    #{
        id => 210601,
        order => 1,
        name => <<"帮会抢红包">>,
        type => 21,
        star => 1,
        finish_cond => [{64,10,[]}],
        reward => 305101,
        title => 0        
    };
get(210602) ->
    #{
        id => 210602,
        order => 2,
        name => <<"帮会抢红包">>,
        type => 21,
        star => 1,
        finish_cond => [{64,20,[]}],
        reward => 305102,
        title => 0        
    };
get(210603) ->
    #{
        id => 210603,
        order => 3,
        name => <<"帮会抢红包">>,
        type => 21,
        star => 1,
        finish_cond => [{64,30,[]}],
        reward => 305103,
        title => 0        
    };
get(210604) ->
    #{
        id => 210604,
        order => 4,
        name => <<"帮会抢红包">>,
        type => 21,
        star => 1,
        finish_cond => [{64,40,[]}],
        reward => 305104,
        title => 0        
    };
get(210605) ->
    #{
        id => 210605,
        order => 5,
        name => <<"帮会抢红包">>,
        type => 21,
        star => 1,
        finish_cond => [{64,50,[]}],
        reward => 305106,
        title => 0        
    };
get(310101) ->
    #{
        id => 310101,
        order => 1,
        name => <<"打造装备">>,
        type => 31,
        star => 1,
        finish_cond => [{65,3,[0]}],
        reward => 305101,
        title => 0        
    };
get(310102) ->
    #{
        id => 310102,
        order => 2,
        name => <<"打造装备">>,
        type => 31,
        star => 1,
        finish_cond => [{65,15,[0]}],
        reward => 305102,
        title => 0        
    };
get(310103) ->
    #{
        id => 310103,
        order => 3,
        name => <<"打造装备">>,
        type => 31,
        star => 1,
        finish_cond => [{65,100,[0]}],
        reward => 305103,
        title => 0        
    };
get(310104) ->
    #{
        id => 310104,
        order => 4,
        name => <<"打造装备">>,
        type => 31,
        star => 1,
        finish_cond => [{65,200,[0]}],
        reward => 305104,
        title => 0        
    };
get(310105) ->
    #{
        id => 310105,
        order => 5,
        name => <<"打造装备">>,
        type => 31,
        star => 1,
        finish_cond => [{65,300,[0]}],
        reward => 305105,
        title => 0        
    };
get(310201) ->
    #{
        id => 310201,
        order => 1,
        name => <<"打造入门">>,
        type => 31,
        star => 1,
        finish_cond => [{65,1,[5]}],
        reward => 305006,
        title => 0        
    };
get(310202) ->
    #{
        id => 310202,
        order => 2,
        name => <<"打造入门">>,
        type => 31,
        star => 1,
        finish_cond => [{65,10,[6]}],
        reward => 305213,
        title => 0        
    };
get(310203) ->
    #{
        id => 310203,
        order => 3,
        name => <<"打造入门">>,
        type => 31,
        star => 1,
        finish_cond => [{65,20,[7]}],
        reward => 305214,
        title => 0        
    };
get(310204) ->
    #{
        id => 310204,
        order => 4,
        name => <<"打造入门">>,
        type => 31,
        star => 1,
        finish_cond => [{65,30,[8]}],
        reward => 305215,
        title => 0        
    };
get(310205) ->
    #{
        id => 310205,
        order => 5,
        name => <<"打造入门">>,
        type => 31,
        star => 1,
        finish_cond => [{65,30,[9]}],
        reward => 305216,
        title => 0        
    };
get(310301) ->
    #{
        id => 310301,
        order => 1,
        name => <<"装备强化">>,
        type => 31,
        star => 1,
        finish_cond => [{4,10,[]}],
        reward => 305006,
        title => 0        
    };
get(310302) ->
    #{
        id => 310302,
        order => 2,
        name => <<"装备强化">>,
        type => 31,
        star => 1,
        finish_cond => [{4,100,[]}],
        reward => 305007,
        title => 0        
    };
get(310303) ->
    #{
        id => 310303,
        order => 3,
        name => <<"装备强化">>,
        type => 31,
        star => 1,
        finish_cond => [{4,320,[]}],
        reward => 305008,
        title => 0        
    };
get(310304) ->
    #{
        id => 310304,
        order => 4,
        name => <<"装备强化">>,
        type => 31,
        star => 1,
        finish_cond => [{4,500,[]}],
        reward => 305107,
        title => 0        
    };
get(310305) ->
    #{
        id => 310305,
        order => 5,
        name => <<"装备强化">>,
        type => 31,
        star => 1,
        finish_cond => [{4,800,[]}],
        reward => 305108,
        title => 0        
    };
get(310401) ->
    #{
        id => 310401,
        order => 1,
        name => <<"镶嵌宝石">>,
        type => 31,
        star => 1,
        finish_cond => [{83,8,[1]}],
        reward => 305006,
        title => 0        
    };
get(310402) ->
    #{
        id => 310402,
        order => 2,
        name => <<"镶嵌宝石">>,
        type => 31,
        star => 1,
        finish_cond => [{83,8,[3]}],
        reward => 305217,
        title => 0        
    };
get(310403) ->
    #{
        id => 310403,
        order => 3,
        name => <<"镶嵌宝石">>,
        type => 31,
        star => 1,
        finish_cond => [{83,8,[5]}],
        reward => 305218,
        title => 0        
    };
get(310404) ->
    #{
        id => 310404,
        order => 4,
        name => <<"镶嵌宝石">>,
        type => 31,
        star => 1,
        finish_cond => [{83,8,[6]}],
        reward => 305219,
        title => 0        
    };
get(310405) ->
    #{
        id => 310405,
        order => 5,
        name => <<"镶嵌宝石">>,
        type => 31,
        star => 1,
        finish_cond => [{83,8,[7]}],
        reward => 305220,
        title => 0        
    };
get(310501) ->
    #{
        id => 310501,
        order => 1,
        name => <<"神器神铸">>,
        type => 31,
        star => 1,
        finish_cond => [{66,1,[]}],
        reward => 305006,
        title => 0        
    };
get(310502) ->
    #{
        id => 310502,
        order => 2,
        name => <<"神器神铸">>,
        type => 31,
        star => 1,
        finish_cond => [{66,2,[]}],
        reward => 305006,
        title => 0        
    };
get(310503) ->
    #{
        id => 310503,
        order => 3,
        name => <<"神器神铸">>,
        type => 31,
        star => 1,
        finish_cond => [{66,3,[]}],
        reward => 305007,
        title => 0        
    };
get(310504) ->
    #{
        id => 310504,
        order => 4,
        name => <<"神器神铸">>,
        type => 31,
        star => 1,
        finish_cond => [{66,4,[]}],
        reward => 305007,
        title => 0        
    };
get(310505) ->
    #{
        id => 310505,
        order => 5,
        name => <<"神器神铸">>,
        type => 31,
        star => 1,
        finish_cond => [{66,5,[]}],
        reward => 305008,
        title => 0        
    };
get(310601) ->
    #{
        id => 310601,
        order => 1,
        name => <<"神器突破">>,
        type => 31,
        star => 1,
        finish_cond => [{34,1,[]}],
        reward => 305006,
        title => 0        
    };
get(310602) ->
    #{
        id => 310602,
        order => 2,
        name => <<"神器突破">>,
        type => 31,
        star => 1,
        finish_cond => [{34,2,[]}],
        reward => 305006,
        title => 0        
    };
get(310603) ->
    #{
        id => 310603,
        order => 3,
        name => <<"神器突破">>,
        type => 31,
        star => 1,
        finish_cond => [{34,3,[]}],
        reward => 305007,
        title => 0        
    };
get(310604) ->
    #{
        id => 310604,
        order => 4,
        name => <<"神器突破">>,
        type => 31,
        star => 1,
        finish_cond => [{34,4,[]}],
        reward => 305007,
        title => 0        
    };
get(310605) ->
    #{
        id => 310605,
        order => 5,
        name => <<"神器突破">>,
        type => 31,
        star => 1,
        finish_cond => [{34,5,[]}],
        reward => 305008,
        title => 0        
    };
get(310701) ->
    #{
        id => 310701,
        order => 1,
        name => <<"暗器修炼">>,
        type => 31,
        star => 1,
        finish_cond => [{67,10,[]}],
        reward => 305101,
        title => 0        
    };
get(310702) ->
    #{
        id => 310702,
        order => 2,
        name => <<"暗器修炼">>,
        type => 31,
        star => 1,
        finish_cond => [{67,30,[]}],
        reward => 305102,
        title => 0        
    };
get(310703) ->
    #{
        id => 310703,
        order => 3,
        name => <<"暗器修炼">>,
        type => 31,
        star => 1,
        finish_cond => [{67,50,[]}],
        reward => 305103,
        title => 0        
    };
get(310704) ->
    #{
        id => 310704,
        order => 4,
        name => <<"暗器修炼">>,
        type => 31,
        star => 1,
        finish_cond => [{67,70,[]}],
        reward => 305104,
        title => 0        
    };
get(310705) ->
    #{
        id => 310705,
        order => 5,
        name => <<"暗器修炼">>,
        type => 31,
        star => 1,
        finish_cond => [{67,90,[]}],
        reward => 305106,
        title => 0        
    };
get(310801) ->
    #{
        id => 310801,
        order => 1,
        name => <<"暗器品质">>,
        type => 31,
        star => 1,
        finish_cond => [{68,150,[]}],
        reward => 305006,
        title => 0        
    };
get(310802) ->
    #{
        id => 310802,
        order => 2,
        name => <<"暗器品质">>,
        type => 31,
        star => 1,
        finish_cond => [{68,500,[]}],
        reward => 305007,
        title => 0        
    };
get(310803) ->
    #{
        id => 310803,
        order => 3,
        name => <<"暗器品质">>,
        type => 31,
        star => 1,
        finish_cond => [{68,1000,[]}],
        reward => 305008,
        title => 0        
    };
get(310804) ->
    #{
        id => 310804,
        order => 4,
        name => <<"暗器品质">>,
        type => 31,
        star => 1,
        finish_cond => [{68,1500,[]}],
        reward => 305010,
        title => 0        
    };
get(310805) ->
    #{
        id => 310805,
        order => 5,
        name => <<"暗器品质">>,
        type => 31,
        star => 1,
        finish_cond => [{68,2000,[]}],
        reward => 305012,
        title => 0        
    };
get(320101) ->
    #{
        id => 320101,
        order => 1,
        name => <<"捕捉珍兽">>,
        type => 32,
        star => 1,
        finish_cond => [{79,2,[]}],
        reward => 305101,
        title => 0        
    };
get(320102) ->
    #{
        id => 320102,
        order => 2,
        name => <<"捕捉珍兽">>,
        type => 32,
        star => 1,
        finish_cond => [{79,50,[]}],
        reward => 305102,
        title => 0        
    };
get(320103) ->
    #{
        id => 320103,
        order => 3,
        name => <<"捕捉珍兽">>,
        type => 32,
        star => 1,
        finish_cond => [{79,100,[]}],
        reward => 305006,
        title => 0        
    };
get(320104) ->
    #{
        id => 320104,
        order => 4,
        name => <<"捕捉珍兽">>,
        type => 32,
        star => 1,
        finish_cond => [{79,200,[]}],
        reward => 305007,
        title => 0        
    };
get(320105) ->
    #{
        id => 320105,
        order => 5,
        name => <<"捕捉珍兽">>,
        type => 32,
        star => 1,
        finish_cond => [{79,500,[]}],
        reward => 305009,
        title => 0        
    };
get(320201) ->
    #{
        id => 320201,
        order => 1,
        name => <<"捕兽入门">>,
        type => 32,
        star => 1,
        finish_cond => [{69,10,[25]}],
        reward => 305101,
        title => 0        
    };
get(320202) ->
    #{
        id => 320202,
        order => 2,
        name => <<"捕兽能手">>,
        type => 32,
        star => 1,
        finish_cond => [{69,30,[25]}],
        reward => 305221,
        title => 0        
    };
get(320203) ->
    #{
        id => 320203,
        order => 3,
        name => <<"捕兽达人">>,
        type => 32,
        star => 1,
        finish_cond => [{69,50,[45]}],
        reward => 305222,
        title => 0        
    };
get(320204) ->
    #{
        id => 320204,
        order => 4,
        name => <<"捕兽名家">>,
        type => 32,
        star => 1,
        finish_cond => [{69,80,[65]}],
        reward => 305223,
        title => 0        
    };
get(320205) ->
    #{
        id => 320205,
        order => 5,
        name => <<"捕兽大师">>,
        type => 32,
        star => 1,
        finish_cond => [{69,200,[65]}],
        reward => 305224,
        title => 0        
    };
get(320301) ->
    #{
        id => 320301,
        order => 1,
        name => <<"繁殖入门">>,
        type => 32,
        star => 1,
        finish_cond => [{21,10,[1]}],
        reward => 305101,
        title => 0        
    };
get(320302) ->
    #{
        id => 320302,
        order => 2,
        name => <<"繁殖能手">>,
        type => 32,
        star => 1,
        finish_cond => [{21,20,[6]}],
        reward => 305225,
        title => 0        
    };
get(320303) ->
    #{
        id => 320303,
        order => 3,
        name => <<"繁殖达人">>,
        type => 32,
        star => 1,
        finish_cond => [{21,30,[7]}],
        reward => 305226,
        title => 0        
    };
get(320304) ->
    #{
        id => 320304,
        order => 4,
        name => <<"繁殖名家">>,
        type => 32,
        star => 1,
        finish_cond => [{21,40,[8]}],
        reward => 305227,
        title => 0        
    };
get(320305) ->
    #{
        id => 320305,
        order => 5,
        name => <<"繁殖大师">>,
        type => 32,
        star => 1,
        finish_cond => [{21,50,[9]}],
        reward => 305228,
        title => 0        
    };
get(320401) ->
    #{
        id => 320401,
        order => 1,
        name => <<"珍兽提悟">>,
        type => 32,
        star => 1,
        finish_cond => [{70,10,[]}],
        reward => 305101,
        title => 0        
    };
get(320402) ->
    #{
        id => 320402,
        order => 2,
        name => <<"珍兽提悟">>,
        type => 32,
        star => 1,
        finish_cond => [{70,30,[]}],
        reward => 305102,
        title => 0        
    };
get(320403) ->
    #{
        id => 320403,
        order => 3,
        name => <<"珍兽提悟">>,
        type => 32,
        star => 1,
        finish_cond => [{70,100,[]}],
        reward => 305006,
        title => 0        
    };
get(320404) ->
    #{
        id => 320404,
        order => 4,
        name => <<"珍兽提悟">>,
        type => 32,
        star => 1,
        finish_cond => [{70,200,[]}],
        reward => 305007,
        title => 0        
    };
get(320405) ->
    #{
        id => 320405,
        order => 5,
        name => <<"珍兽提悟">>,
        type => 32,
        star => 1,
        finish_cond => [{70,300,[]}],
        reward => 305008,
        title => 0        
    };
get(410101) ->
    #{
        id => 410101,
        order => 1,
        name => <<"挑战老三环">>,
        type => 41,
        star => 1,
        finish_cond => [{17,1,[700]}],
        reward => 305101,
        title => 0        
    };
get(410102) ->
    #{
        id => 410102,
        order => 2,
        name => <<"挑战老三环">>,
        type => 41,
        star => 1,
        finish_cond => [{17,10,[700]}],
        reward => 305102,
        title => 0        
    };
get(410103) ->
    #{
        id => 410103,
        order => 3,
        name => <<"挑战老三环">>,
        type => 41,
        star => 1,
        finish_cond => [{17,30,[700]}],
        reward => 305103,
        title => 0        
    };
get(410104) ->
    #{
        id => 410104,
        order => 4,
        name => <<"挑战老三环">>,
        type => 41,
        star => 1,
        finish_cond => [{17,100,[700]}],
        reward => 305104,
        title => 0        
    };
get(410105) ->
    #{
        id => 410105,
        order => 5,
        name => <<"挑战老三环">>,
        type => 41,
        star => 1,
        finish_cond => [{17,300,[700]}],
        reward => 305105,
        title => 0        
    };
get(410201) ->
    #{
        id => 410201,
        order => 1,
        name => <<"挑战燕子坞">>,
        type => 41,
        star => 1,
        finish_cond => [{17,1,[800]}],
        reward => 305101,
        title => 0        
    };
get(410202) ->
    #{
        id => 410202,
        order => 2,
        name => <<"挑战燕子坞">>,
        type => 41,
        star => 1,
        finish_cond => [{17,10,[800]}],
        reward => 305102,
        title => 0        
    };
get(410203) ->
    #{
        id => 410203,
        order => 3,
        name => <<"挑战燕子坞">>,
        type => 41,
        star => 1,
        finish_cond => [{17,30,[800]}],
        reward => 305103,
        title => 0        
    };
get(410204) ->
    #{
        id => 410204,
        order => 4,
        name => <<"挑战燕子坞">>,
        type => 41,
        star => 1,
        finish_cond => [{17,100,[800]}],
        reward => 305104,
        title => 0        
    };
get(410205) ->
    #{
        id => 410205,
        order => 5,
        name => <<"挑战燕子坞">>,
        type => 41,
        star => 1,
        finish_cond => [{17,300,[800]}],
        reward => 305105,
        title => 0        
    };
get(410301) ->
    #{
        id => 410301,
        order => 1,
        name => <<"挑战四绝庄">>,
        type => 41,
        star => 1,
        finish_cond => [{17,1,[900]}],
        reward => 305101,
        title => 0        
    };
get(410302) ->
    #{
        id => 410302,
        order => 2,
        name => <<"挑战四绝庄">>,
        type => 41,
        star => 1,
        finish_cond => [{17,10,[900]}],
        reward => 305102,
        title => 0        
    };
get(410303) ->
    #{
        id => 410303,
        order => 3,
        name => <<"挑战四绝庄">>,
        type => 41,
        star => 1,
        finish_cond => [{17,30,[900]}],
        reward => 305103,
        title => 0        
    };
get(410304) ->
    #{
        id => 410304,
        order => 4,
        name => <<"挑战四绝庄">>,
        type => 41,
        star => 1,
        finish_cond => [{17,100,[900]}],
        reward => 305104,
        title => 0        
    };
get(410305) ->
    #{
        id => 410305,
        order => 5,
        name => <<"挑战四绝庄">>,
        type => 41,
        star => 1,
        finish_cond => [{17,300,[900]}],
        reward => 305105,
        title => 0        
    };
get(410401) ->
    #{
        id => 410401,
        order => 1,
        name => <<"挑战缥缈峰">>,
        type => 41,
        star => 1,
        finish_cond => [{17,1,[1000]}],
        reward => 305101,
        title => 0        
    };
get(410402) ->
    #{
        id => 410402,
        order => 2,
        name => <<"挑战缥缈峰">>,
        type => 41,
        star => 1,
        finish_cond => [{17,10,[1000]}],
        reward => 305102,
        title => 0        
    };
get(410403) ->
    #{
        id => 410403,
        order => 3,
        name => <<"挑战缥缈峰">>,
        type => 41,
        star => 1,
        finish_cond => [{17,30,[1000]}],
        reward => 305103,
        title => 0        
    };
get(410404) ->
    #{
        id => 410404,
        order => 4,
        name => <<"挑战缥缈峰">>,
        type => 41,
        star => 1,
        finish_cond => [{17,100,[1000]}],
        reward => 305104,
        title => 0        
    };
get(410405) ->
    #{
        id => 410405,
        order => 5,
        name => <<"挑战缥缈峰">>,
        type => 41,
        star => 1,
        finish_cond => [{17,300,[1000]}],
        reward => 305105,
        title => 0        
    };
get(430101) ->
    #{
        id => 430101,
        order => 1,
        name => <<"常胜将军">>,
        type => 43,
        star => 1,
        finish_cond => [{71,10,[]}],
        reward => 305006,
        title => 0        
    };
get(430102) ->
    #{
        id => 430102,
        order => 2,
        name => <<"常胜将军">>,
        type => 43,
        star => 1,
        finish_cond => [{71,20,[]}],
        reward => 305008,
        title => 0        
    };
get(430103) ->
    #{
        id => 430103,
        order => 3,
        name => <<"常胜将军">>,
        type => 43,
        star => 1,
        finish_cond => [{71,40,[]}],
        reward => 305011,
        title => 0        
    };
get(430104) ->
    #{
        id => 430104,
        order => 4,
        name => <<"常胜将军">>,
        type => 43,
        star => 1,
        finish_cond => [{71,70,[]}],
        reward => 305014,
        title => 0        
    };
get(430105) ->
    #{
        id => 430105,
        order => 5,
        name => <<"常胜将军">>,
        type => 43,
        star => 1,
        finish_cond => [{71,100,[]}],
        reward => 305016,
        title => 0        
    };
get(430201) ->
    #{
        id => 430201,
        order => 1,
        name => <<"超神杀戮">>,
        type => 43,
        star => 1,
        finish_cond => [{72,2,[]}],
        reward => 305010,
        title => 0        
    };
get(430202) ->
    #{
        id => 430202,
        order => 2,
        name => <<"超神杀戮">>,
        type => 43,
        star => 1,
        finish_cond => [{72,4,[]}],
        reward => 305013,
        title => 0        
    };
get(430203) ->
    #{
        id => 430203,
        order => 3,
        name => <<"超神杀戮">>,
        type => 43,
        star => 1,
        finish_cond => [{72,6,[]}],
        reward => 305015,
        title => 0        
    };
get(430204) ->
    #{
        id => 430204,
        order => 4,
        name => <<"超神杀戮">>,
        type => 43,
        star => 1,
        finish_cond => [{72,7,[]}],
        reward => 305016,
        title => 0        
    };
get(430205) ->
    #{
        id => 430205,
        order => 5,
        name => <<"超神杀戮">>,
        type => 43,
        star => 1,
        finish_cond => [{72,8,[]}],
        reward => 305017,
        title => 0        
    };
get(430301) ->
    #{
        id => 430301,
        order => 1,
        name => <<"门派精英">>,
        type => 43,
        star => 1,
        finish_cond => [{73,1,[30]}],
        reward => 305013,
        title => 0        
    };
get(430302) ->
    #{
        id => 430302,
        order => 2,
        name => <<"门派精英">>,
        type => 43,
        star => 1,
        finish_cond => [{73,3,[30]}],
        reward => 305016,
        title => 0        
    };
get(430303) ->
    #{
        id => 430303,
        order => 3,
        name => <<"门派精英">>,
        type => 43,
        star => 1,
        finish_cond => [{73,6,[30]}],
        reward => 305017,
        title => 0        
    };
get(430304) ->
    #{
        id => 430304,
        order => 4,
        name => <<"门派精英">>,
        type => 43,
        star => 1,
        finish_cond => [{73,12,[30]}],
        reward => 305018,
        title => 0        
    };
get(430305) ->
    #{
        id => 430305,
        order => 5,
        name => <<"门派精英">>,
        type => 43,
        star => 1,
        finish_cond => [{73,20,[30]}],
        reward => 305019,
        title => 0        
    };
get(430401) ->
    #{
        id => 430401,
        order => 1,
        name => <<"内战王者">>,
        type => 43,
        star => 1,
        finish_cond => [{73,1,[1]}],
        reward => 305016,
        title => 0        
    };
get(430402) ->
    #{
        id => 430402,
        order => 2,
        name => <<"内战王者">>,
        type => 43,
        star => 1,
        finish_cond => [{73,3,[1]}],
        reward => 305018,
        title => 0        
    };
get(430403) ->
    #{
        id => 430403,
        order => 3,
        name => <<"内战王者">>,
        type => 43,
        star => 1,
        finish_cond => [{73,6,[1]}],
        reward => 305019,
        title => 0        
    };
get(430404) ->
    #{
        id => 430404,
        order => 4,
        name => <<"内战王者">>,
        type => 43,
        star => 1,
        finish_cond => [{73,12,[1]}],
        reward => 305020,
        title => 0        
    };
get(430405) ->
    #{
        id => 430405,
        order => 5,
        name => <<"内战王者">>,
        type => 43,
        star => 1,
        finish_cond => [{73,20,[1]}],
        reward => 305021,
        title => 0        
    };
get(510101) ->
    #{
        id => 510101,
        order => 1,
        name => <<"夺宝马贼">>,
        type => 51,
        star => 1,
        finish_cond => [{81,5,[]}],
        reward => 305101,
        title => 0        
    };
get(510102) ->
    #{
        id => 510102,
        order => 2,
        name => <<"夺宝马贼">>,
        type => 51,
        star => 1,
        finish_cond => [{81,35,[]}],
        reward => 305102,
        title => 0        
    };
get(510103) ->
    #{
        id => 510103,
        order => 3,
        name => <<"夺宝马贼">>,
        type => 51,
        star => 1,
        finish_cond => [{81,100,[]}],
        reward => 305006,
        title => 0        
    };
get(510104) ->
    #{
        id => 510104,
        order => 4,
        name => <<"夺宝马贼">>,
        type => 51,
        star => 1,
        finish_cond => [{81,300,[]}],
        reward => 305007,
        title => 0        
    };
get(510105) ->
    #{
        id => 510105,
        order => 5,
        name => <<"夺宝马贼">>,
        type => 51,
        star => 1,
        finish_cond => [{81,500,[]}],
        reward => 305008,
        title => 0        
    };
get(510201) ->
    #{
        id => 510201,
        order => 1,
        name => <<"杀马队长">>,
        type => 51,
        star => 1,
        finish_cond => [{74,1,[]}],
        reward => 305101,
        title => 0        
    };
get(510202) ->
    #{
        id => 510202,
        order => 2,
        name => <<"杀马队长">>,
        type => 51,
        star => 1,
        finish_cond => [{74,5,[]}],
        reward => 305102,
        title => 0        
    };
get(510203) ->
    #{
        id => 510203,
        order => 3,
        name => <<"杀马队长">>,
        type => 51,
        star => 1,
        finish_cond => [{74,20,[]}],
        reward => 305006,
        title => 0        
    };
get(510204) ->
    #{
        id => 510204,
        order => 4,
        name => <<"杀马队长">>,
        type => 51,
        star => 1,
        finish_cond => [{74,50,[]}],
        reward => 305007,
        title => 0        
    };
get(510205) ->
    #{
        id => 510205,
        order => 5,
        name => <<"杀马队长">>,
        type => 51,
        star => 1,
        finish_cond => [{74,100,[]}],
        reward => 305008,
        title => 0        
    };
get(510401) ->
    #{
        id => 510401,
        order => 1,
        name => <<"科举考试">>,
        type => 51,
        star => 1,
        finish_cond => [{82,1,[]}],
        reward => 305101,
        title => 0        
    };
get(510402) ->
    #{
        id => 510402,
        order => 2,
        name => <<"科举考试">>,
        type => 51,
        star => 1,
        finish_cond => [{82,3,[]}],
        reward => 305102,
        title => 0        
    };
get(510403) ->
    #{
        id => 510403,
        order => 3,
        name => <<"科举考试">>,
        type => 51,
        star => 1,
        finish_cond => [{82,10,[]}],
        reward => 305006,
        title => 0        
    };
get(510404) ->
    #{
        id => 510404,
        order => 4,
        name => <<"科举考试">>,
        type => 51,
        star => 1,
        finish_cond => [{82,30,[]}],
        reward => 305007,
        title => 0        
    };
get(510405) ->
    #{
        id => 510405,
        order => 5,
        name => <<"科举考试">>,
        type => 51,
        star => 1,
        finish_cond => [{82,50,[]}],
        reward => 305008,
        title => 0        
    };
get(510501) ->
    #{
        id => 510501,
        order => 1,
        name => <<"珍珑棋局">>,
        type => 51,
        star => 1,
        finish_cond => [{17,2,[1200]}],
        reward => 305101,
        title => 0        
    };
get(510502) ->
    #{
        id => 510502,
        order => 2,
        name => <<"珍珑棋局">>,
        type => 51,
        star => 1,
        finish_cond => [{17,20,[1200]}],
        reward => 305102,
        title => 0        
    };
get(510503) ->
    #{
        id => 510503,
        order => 3,
        name => <<"珍珑棋局">>,
        type => 51,
        star => 1,
        finish_cond => [{17,100,[1200]}],
        reward => 305006,
        title => 0        
    };
get(510504) ->
    #{
        id => 510504,
        order => 4,
        name => <<"珍珑棋局">>,
        type => 51,
        star => 1,
        finish_cond => [{17,200,[1200]}],
        reward => 305007,
        title => 0        
    };
get(510505) ->
    #{
        id => 510505,
        order => 5,
        name => <<"珍珑棋局">>,
        type => 51,
        star => 1,
        finish_cond => [{17,300,[1200]}],
        reward => 305008,
        title => 0        
    };
get(510601) ->
    #{
        id => 510601,
        order => 1,
        name => <<"黄金棋子">>,
        type => 51,
        star => 1,
        finish_cond => [{77,1,[]}],
        reward => 305101,
        title => 0        
    };
get(510602) ->
    #{
        id => 510602,
        order => 2,
        name => <<"黄金棋子">>,
        type => 51,
        star => 1,
        finish_cond => [{77,10,[]}],
        reward => 305102,
        title => 0        
    };
get(510603) ->
    #{
        id => 510603,
        order => 3,
        name => <<"黄金棋子">>,
        type => 51,
        star => 1,
        finish_cond => [{77,30,[]}],
        reward => 305006,
        title => 0        
    };
get(510604) ->
    #{
        id => 510604,
        order => 4,
        name => <<"黄金棋子">>,
        type => 51,
        star => 1,
        finish_cond => [{77,80,[]}],
        reward => 305007,
        title => 0        
    };
get(510605) ->
    #{
        id => 510605,
        order => 5,
        name => <<"黄金棋子">>,
        type => 51,
        star => 1,
        finish_cond => [{77,150,[]}],
        reward => 305008,
        title => 0        
    };
get(510701) ->
    #{
        id => 510701,
        order => 1,
        name => <<"宋辽大战">>,
        type => 51,
        star => 1,
        finish_cond => [{33,1,[]}],
        reward => 305101,
        title => 0        
    };
get(510702) ->
    #{
        id => 510702,
        order => 2,
        name => <<"宋辽大战">>,
        type => 51,
        star => 1,
        finish_cond => [{33,4,[]}],
        reward => 305102,
        title => 0        
    };
get(510703) ->
    #{
        id => 510703,
        order => 3,
        name => <<"宋辽大战">>,
        type => 51,
        star => 1,
        finish_cond => [{33,50,[]}],
        reward => 305006,
        title => 0        
    };
get(510704) ->
    #{
        id => 510704,
        order => 4,
        name => <<"宋辽大战">>,
        type => 51,
        star => 1,
        finish_cond => [{33,120,[]}],
        reward => 305007,
        title => 0        
    };
get(510705) ->
    #{
        id => 510705,
        order => 5,
        name => <<"宋辽大战">>,
        type => 51,
        star => 1,
        finish_cond => [{33,240,[]}],
        reward => 305008,
        title => 0        
    };
get(510801) ->
    #{
        id => 510801,
        order => 1,
        name => <<"宋辽获胜">>,
        type => 51,
        star => 1,
        finish_cond => [{78,1,[]}],
        reward => 305101,
        title => 0        
    };
get(510802) ->
    #{
        id => 510802,
        order => 2,
        name => <<"宋辽获胜">>,
        type => 51,
        star => 1,
        finish_cond => [{78,3,[]}],
        reward => 305102,
        title => 0        
    };
get(510803) ->
    #{
        id => 510803,
        order => 3,
        name => <<"宋辽获胜">>,
        type => 51,
        star => 1,
        finish_cond => [{78,15,[]}],
        reward => 305006,
        title => 0        
    };
get(510804) ->
    #{
        id => 510804,
        order => 4,
        name => <<"宋辽获胜">>,
        type => 51,
        star => 1,
        finish_cond => [{78,30,[]}],
        reward => 305007,
        title => 0        
    };
get(510805) ->
    #{
        id => 510805,
        order => 5,
        name => <<"宋辽获胜">>,
        type => 51,
        star => 1,
        finish_cond => [{78,60,[]}],
        reward => 305008,
        title => 0        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [110101, 110102, 110103, 110104, 110105, 110401, 110402, 110403, 110404, 110405, 110501, 110502, 110503, 110504, 110505, 120101, 120102, 120103, 120104, 120105, 130101, 130102, 130103, 130104, 130105, 210101, 210102, 210103, 210104, 210105, 210201, 210202, 210203, 210204, 210205, 210301, 210302, 210303, 210304, 210305, 210401, 210402, 210403, 210404, 210405, 210501, 210502, 210503, 210504, 210505, 210601, 210602, 210603, 210604, 210605, 310101, 310102, 310103, 310104, 310105, 310201, 310202, 310203, 310204, 310205, 310301, 310302, 310303, 310304, 310305, 310401, 310402, 310403, 310404, 310405, 310501, 310502, 310503, 310504, 310505, 310601, 310602, 310603, 310604, 310605, 310701, 310702, 310703, 310704, 310705, 310801, 310802, 310803, 310804, 310805, 320101, 320102, 320103, 320104, 320105, 320201, 320202, 320203, 320204, 320205, 320301, 320302, 320303, 320304, 320305, 320401, 320402, 320403, 320404, 320405, 410101, 410102, 410103, 410104, 410105, 410201, 410202, 410203, 410204, 410205, 410301, 410302, 410303, 410304, 410305, 410401, 410402, 410403, 410404, 410405, 430101, 430102, 430103, 430104, 430105, 430201, 430202, 430203, 430204, 430205, 430301, 430302, 430303, 430304, 430305, 430401, 430402, 430403, 430404, 430405, 510101, 510102, 510103, 510104, 510105, 510201, 510202, 510203, 510204, 510205, 510401, 510402, 510403, 510404, 510405, 510501, 510502, 510503, 510504, 510505, 510601, 510602, 510603, 510604, 510605, 510701, 510702, 510703, 510704, 510705, 510801, 510802, 510803, 510804, 510805].

get_by_type(11) ->
    [110101, 110102, 110103, 110104, 110105, 110401, 110402, 110403, 110404, 110405, 110501, 110502, 110503, 110504, 110505];
get_by_type(12) ->
    [120101, 120102, 120103, 120104, 120105];
get_by_type(13) ->
    [130101, 130102, 130103, 130104, 130105];
get_by_type(21) ->
    [210101, 210102, 210103, 210104, 210105, 210201, 210202, 210203, 210204, 210205, 210301, 210302, 210303, 210304, 210305, 210401, 210402, 210403, 210404, 210405, 210501, 210502, 210503, 210504, 210505, 210601, 210602, 210603, 210604, 210605];
get_by_type(31) ->
    [310101, 310102, 310103, 310104, 310105, 310201, 310202, 310203, 310204, 310205, 310301, 310302, 310303, 310304, 310305, 310401, 310402, 310403, 310404, 310405, 310501, 310502, 310503, 310504, 310505, 310601, 310602, 310603, 310604, 310605, 310701, 310702, 310703, 310704, 310705, 310801, 310802, 310803, 310804, 310805];
get_by_type(32) ->
    [320101, 320102, 320103, 320104, 320105, 320201, 320202, 320203, 320204, 320205, 320301, 320302, 320303, 320304, 320305, 320401, 320402, 320403, 320404, 320405];
get_by_type(41) ->
    [410101, 410102, 410103, 410104, 410105, 410201, 410202, 410203, 410204, 410205, 410301, 410302, 410303, 410304, 410305, 410401, 410402, 410403, 410404, 410405];
get_by_type(43) ->
    [430101, 430102, 430103, 430104, 430105, 430201, 430202, 430203, 430204, 430205, 430301, 430302, 430303, 430304, 430305, 430401, 430402, 430403, 430404, 430405];
get_by_type(51) ->
    [510101, 510102, 510103, 510104, 510105, 510201, 510202, 510203, 510204, 510205, 510401, 510402, 510403, 510404, 510405, 510501, 510502, 510503, 510504, 510505, 510601, 510602, 510603, 510604, 510605, 510701, 510702, 510703, 510704, 510705, 510801, 510802, 510803, 510804, 510805];
get_by_type(_) ->
    [].
