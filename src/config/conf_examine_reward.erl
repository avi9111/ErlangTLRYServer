%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_examine_reward
%% @Brief  : 科举考试奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_examine_reward).

-export([
    get/1
]).

get(Lv) when Lv =< 10 -> 
	#{
        right_answer => [{1,5030},{4,1290}],
        wrong_answer => [{1,2515},{4,645}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 11 -> 
	#{
        right_answer => [{1,5050},{4,1295}],
        wrong_answer => [{1,2525},{4,647}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 12 -> 
	#{
        right_answer => [{1,5069},{4,1300}],
        wrong_answer => [{1,2535},{4,650}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 13 -> 
	#{
        right_answer => [{1,5088},{4,1305}],
        wrong_answer => [{1,2544},{4,652}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 14 -> 
	#{
        right_answer => [{1,5108},{4,1310}],
        wrong_answer => [{1,2554},{4,655}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 15 -> 
	#{
        right_answer => [{1,5127},{4,1315}],
        wrong_answer => [{1,2564},{4,657}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 16 -> 
	#{
        right_answer => [{1,5147},{4,1320}],
        wrong_answer => [{1,2573},{4,660}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 17 -> 
	#{
        right_answer => [{1,5166},{4,1325}],
        wrong_answer => [{1,2583},{4,662}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 18 -> 
	#{
        right_answer => [{1,5185},{4,1330}],
        wrong_answer => [{1,2593},{4,665}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 19 -> 
	#{
        right_answer => [{1,5205},{4,1335}],
        wrong_answer => [{1,2602},{4,667}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 20 -> 
	#{
        right_answer => [{1,5224},{4,1340}],
        wrong_answer => [{1,2612},{4,670}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 21 -> 
	#{
        right_answer => [{1,5244},{4,1345}],
        wrong_answer => [{1,2622},{4,672}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 22 -> 
	#{
        right_answer => [{1,5263},{4,1349}],
        wrong_answer => [{1,2631},{4,675}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 23 -> 
	#{
        right_answer => [{1,5282},{4,1354}],
        wrong_answer => [{1,2641},{4,677}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 24 -> 
	#{
        right_answer => [{1,5302},{4,1359}],
        wrong_answer => [{1,2651},{4,680}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 25 -> 
	#{
        right_answer => [{1,5321},{4,1364}],
        wrong_answer => [{1,2661},{4,682}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 26 -> 
	#{
        right_answer => [{1,5341},{4,1369}],
        wrong_answer => [{1,2670},{4,685}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 27 -> 
	#{
        right_answer => [{1,5360},{4,1374}],
        wrong_answer => [{1,2680},{4,687}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 28 -> 
	#{
        right_answer => [{1,5379},{4,1379}],
        wrong_answer => [{1,2690},{4,690}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 29 -> 
	#{
        right_answer => [{1,5399},{4,1384}],
        wrong_answer => [{1,2699},{4,692}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 30 -> 
	#{
        right_answer => [{1,5436},{4,1394}],
        wrong_answer => [{1,2718},{4,697}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 31 -> 
	#{
        right_answer => [{1,5474},{4,1404}],
        wrong_answer => [{1,2737},{4,702}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 32 -> 
	#{
        right_answer => [{1,5512},{4,1413}],
        wrong_answer => [{1,2756},{4,707}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 33 -> 
	#{
        right_answer => [{1,5549},{4,1423}],
        wrong_answer => [{1,2775},{4,711}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 34 -> 
	#{
        right_answer => [{1,5587},{4,1432}],
        wrong_answer => [{1,2793},{4,716}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 35 -> 
	#{
        right_answer => [{1,5644},{4,1447}],
        wrong_answer => [{1,2822},{4,724}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 36 -> 
	#{
        right_answer => [{1,5701},{4,1462}],
        wrong_answer => [{1,2850},{4,731}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 37 -> 
	#{
        right_answer => [{1,5758},{4,1476}],
        wrong_answer => [{1,2879},{4,738}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 38 -> 
	#{
        right_answer => [{1,5815},{4,1491}],
        wrong_answer => [{1,2907},{4,745}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 39 -> 
	#{
        right_answer => [{1,5872},{4,1506}],
        wrong_answer => [{1,2936},{4,753}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 40 -> 
	#{
        right_answer => [{1,5948},{4,1525}],
        wrong_answer => [{1,2974},{4,763}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 41 -> 
	#{
        right_answer => [{1,6024},{4,1545}],
        wrong_answer => [{1,3012},{4,772}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 42 -> 
	#{
        right_answer => [{1,6101},{4,1564}],
        wrong_answer => [{1,3050},{4,782}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 43 -> 
	#{
        right_answer => [{1,6177},{4,1584}],
        wrong_answer => [{1,3089},{4,792}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 44 -> 
	#{
        right_answer => [{1,6253},{4,1603}],
        wrong_answer => [{1,3127},{4,802}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 45 -> 
	#{
        right_answer => [{1,6359},{4,1630}],
        wrong_answer => [{1,3179},{4,815}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 46 -> 
	#{
        right_answer => [{1,6464},{4,1657}],
        wrong_answer => [{1,3232},{4,829}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 47 -> 
	#{
        right_answer => [{1,6570},{4,1685}],
        wrong_answer => [{1,3285},{4,842}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 48 -> 
	#{
        right_answer => [{1,6675},{4,1712}],
        wrong_answer => [{1,3338},{4,856}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 49 -> 
	#{
        right_answer => [{1,6781},{4,1739}],
        wrong_answer => [{1,3390},{4,869}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 50 -> 
	#{
        right_answer => [{1,6915},{4,1773}],
        wrong_answer => [{1,3458},{4,887}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 51 -> 
	#{
        right_answer => [{1,7050},{4,1808}],
        wrong_answer => [{1,3525},{4,904}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 52 -> 
	#{
        right_answer => [{1,7184},{4,1842}],
        wrong_answer => [{1,3592},{4,921}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 53 -> 
	#{
        right_answer => [{1,7319},{4,1877}],
        wrong_answer => [{1,3659},{4,938}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 54 -> 
	#{
        right_answer => [{1,7453},{4,1911}],
        wrong_answer => [{1,3727},{4,956}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 55 -> 
	#{
        right_answer => [{1,7617},{4,1953}],
        wrong_answer => [{1,3809},{4,977}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 56 -> 
	#{
        right_answer => [{1,7781},{4,1995}],
        wrong_answer => [{1,3890},{4,998}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 57 -> 
	#{
        right_answer => [{1,7944},{4,2037}],
        wrong_answer => [{1,3972},{4,1018}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 58 -> 
	#{
        right_answer => [{1,8108},{4,2079}],
        wrong_answer => [{1,4054},{4,1039}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 59 -> 
	#{
        right_answer => [{1,8272},{4,2121}],
        wrong_answer => [{1,4136},{4,1060}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 60 -> 
	#{
        right_answer => [{1,8479},{4,2174}],
        wrong_answer => [{1,4239},{4,1087}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 61 -> 
	#{
        right_answer => [{1,8686},{4,2227}],
        wrong_answer => [{1,4343},{4,1114}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 62 -> 
	#{
        right_answer => [{1,8893},{4,2280}],
        wrong_answer => [{1,4447},{4,1140}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 63 -> 
	#{
        right_answer => [{1,9101},{4,2333}],
        wrong_answer => [{1,4550},{4,1167}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 64 -> 
	#{
        right_answer => [{1,9308},{4,2387}],
        wrong_answer => [{1,4654},{4,1193}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 65 -> 
	#{
        right_answer => [{1,9559},{4,2451}],
        wrong_answer => [{1,4779},{4,1225}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 66 -> 
	#{
        right_answer => [{1,9810},{4,2515}],
        wrong_answer => [{1,4905},{4,1258}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 67 -> 
	#{
        right_answer => [{1,10061},{4,2580}],
        wrong_answer => [{1,5030},{4,1290}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 68 -> 
	#{
        right_answer => [{1,10312},{4,2644}],
        wrong_answer => [{1,5156},{4,1322}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 69 -> 
	#{
        right_answer => [{1,10562},{4,2708}],
        wrong_answer => [{1,5281},{4,1354}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 70 -> 
	#{
        right_answer => [{1,10873},{4,2788}],
        wrong_answer => [{1,5436},{4,1394}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 71 -> 
	#{
        right_answer => [{1,11183},{4,2867}],
        wrong_answer => [{1,5591},{4,1434}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 72 -> 
	#{
        right_answer => [{1,11493},{4,2947}],
        wrong_answer => [{1,5747},{4,1474}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 73 -> 
	#{
        right_answer => [{1,11804},{4,3027}],
        wrong_answer => [{1,5902},{4,1513}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 74 -> 
	#{
        right_answer => [{1,12114},{4,3106}],
        wrong_answer => [{1,6057},{4,1553}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 75 -> 
	#{
        right_answer => [{1,12484},{4,3201}],
        wrong_answer => [{1,6242},{4,1600}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 76 -> 
	#{
        right_answer => [{1,12853},{4,3296}],
        wrong_answer => [{1,6427},{4,1648}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 77 -> 
	#{
        right_answer => [{1,13223},{4,3390}],
        wrong_answer => [{1,6611},{4,1695}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 78 -> 
	#{
        right_answer => [{1,13593},{4,3485}],
        wrong_answer => [{1,6796},{4,1743}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 79 -> 
	#{
        right_answer => [{1,13962},{4,3580}],
        wrong_answer => [{1,6981},{4,1790}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 80 -> 
	#{
        right_answer => [{1,14464},{4,3709}],
        wrong_answer => [{1,7232},{4,1854}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 81 -> 
	#{
        right_answer => [{1,14966},{4,3837}],
        wrong_answer => [{1,7483},{4,1919}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 82 -> 
	#{
        right_answer => [{1,15468},{4,3966}],
        wrong_answer => [{1,7734},{4,1983}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 83 -> 
	#{
        right_answer => [{1,15970},{4,4095}],
        wrong_answer => [{1,7985},{4,2047}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 84 -> 
	#{
        right_answer => [{1,16472},{4,4223}],
        wrong_answer => [{1,8236},{4,2112}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 85 -> 
	#{
        right_answer => [{1,17105},{4,4386}],
        wrong_answer => [{1,8553},{4,2193}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 86 -> 
	#{
        right_answer => [{1,17739},{4,4549}],
        wrong_answer => [{1,8870},{4,2274}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 87 -> 
	#{
        right_answer => [{1,18373},{4,4711}],
        wrong_answer => [{1,9187},{4,2356}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 88 -> 
	#{
        right_answer => [{1,19007},{4,4874}],
        wrong_answer => [{1,9504},{4,2437}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 89 -> 
	#{
        right_answer => [{1,19641},{4,5036}],
        wrong_answer => [{1,9821},{4,2518}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 90 -> 
	#{
        right_answer => [{1,20456},{4,5245}],
        wrong_answer => [{1,10228},{4,2623}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 91 -> 
	#{
        right_answer => [{1,21270},{4,5454}],
        wrong_answer => [{1,10635},{4,2727}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 92 -> 
	#{
        right_answer => [{1,22085},{4,5663}],
        wrong_answer => [{1,11042},{4,2831}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 93 -> 
	#{
        right_answer => [{1,22899},{4,5872}],
        wrong_answer => [{1,11450},{4,2936}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 94 -> 
	#{
        right_answer => [{1,23714},{4,6080}],
        wrong_answer => [{1,11857},{4,3040}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 95 -> 
	#{
        right_answer => [{1,24720},{4,6338}],
        wrong_answer => [{1,12360},{4,3169}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 96 -> 
	#{
        right_answer => [{1,25726},{4,6596}],
        wrong_answer => [{1,12863},{4,3298}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 97 -> 
	#{
        right_answer => [{1,26732},{4,6854}],
        wrong_answer => [{1,13366},{4,3427}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 98 -> 
	#{
        right_answer => [{1,27738},{4,7112}],
        wrong_answer => [{1,13869},{4,3556}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(Lv) when Lv =< 999 -> 
	#{
        right_answer => [{1,28744},{4,7370}],
        wrong_answer => [{1,14372},{4,3685}],
        rank_reward => [{1,1,183001},{2,2,183002},{3,3,183003}],
        daily_reward => 183010    };
get(_Lv) ->
    undefined.