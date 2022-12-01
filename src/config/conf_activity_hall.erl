%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_activity_hall
%% @Brief  : 活跃大厅
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_activity_hall).

-export([
    get/1,
    get_ids/0,
    get_id_exp/1,
    get_open_lv/1
]).

get(1) ->
    #{
        name => <<"武林禁地">>,
        times => 1,
        add_exp => 0,
        level => 99        
    };
get(2) ->
    #{
        name => <<"宋辽战争">>,
        times => 1,
        add_exp => 15,
        level => 35        
    };
get(3) ->
    #{
        name => <<"武林盟主">>,
        times => 1,
        add_exp => 0,
        level => 99        
    };
get(4) ->
    #{
        name => <<"帮会守卫战">>,
        times => 1,
        add_exp => 20,
        level => 40        
    };
get(5) ->
    #{
        name => <<"门派竞技">>,
        times => 1,
        add_exp => 0,
        level => 55        
    };
get(6) ->
    #{
        name => <<"镜湖剿匪">>,
        times => 0,
        add_exp => 0,
        level => 40        
    };
get(7) ->
    #{
        name => <<"行酒令">>,
        times => 1,
        add_exp => 10,
        level => 18        
    };
get(8) ->
    #{
        name => <<"演武堂">>,
        times => 1,
        add_exp => 0,
        level => 40        
    };
get(9) ->
    #{
        name => <<"帮会练功">>,
        times => 1,
        add_exp => 10,
        level => 18        
    };
get(10) ->
    #{
        name => <<"珍珑棋局">>,
        times => 1,
        add_exp => 15,
        level => 20        
    };
get(11) ->
    #{
        name => <<"帮会运镖">>,
        times => 3,
        add_exp => 0,
        level => 30        
    };
get(12) ->
    #{
        name => <<"领地战">>,
        times => 0,
        add_exp => 0,
        level => 40
    };
get(1001) ->
    #{
        name => <<"老三环">>,
        times => 1,
        add_exp => 10,
        level => 25        
    };
get(1002) ->
    #{
        name => <<"燕子坞">>,
        times => 1,
        add_exp => 10,
        level => 32        
    };
get(1003) ->
    #{
        name => <<"四绝庄">>,
        times => 1,
        add_exp => 10,
        level => 50        
    };
get(1004) ->
    #{
        name => <<"缥缈峰">>,
        times => 1,
        add_exp => 10,
        level => 64        
    };
get(1005) ->
    #{
        name => <<"帮会任务">>,
        times => 10,
        add_exp => 2,
        level => 26        
    };
get(1006) ->
    #{
        name => <<"科举考试">>,
        times => 10,
        add_exp => 1,
        level => 20        
    };
get(1007) ->
    #{
        name => <<"惩凶打图">>,
        times => 10,
        add_exp => 1,
        level => 25        
    };
get(1008) ->
    #{
        name => <<"分金定穴">>,
        times => 1,
        add_exp => 10,
        level => 25        
    };
get(1009) ->
    #{
        name => <<"江湖历练">>,
        times => 0,
        add_exp => 0,
        level => 20        
    };
get(1010) ->
    #{
        name => <<"英雄试炼">>,
        times => 0,
        add_exp => 0,
        level => 15        
    };
get(1011) ->
    #{
        name => <<"夺宝马贼">>,
        times => 10,
        add_exp => 1,
        level => 20        
    };
get(1012) ->
    #{
        name => <<"每日任务">>,
        times => 10,
        add_exp => 2,
        level => 15        
    };
get(1013) ->
    #{
        name => <<"武林悬赏令">>,
        times => 5,
        add_exp => 2,
        level => 26        
    };
get(1014) ->
    #{
        name => <<"帮会炼金">>,
        times => 0,
        add_exp => 0,
        level => 26        
    };
get(1015) ->
    #{
        name => <<"少室山">>,
        times => 1,
        add_exp => 0,
        level => 79
    };
get(1016) ->
    #{
        name => <<"跑环任务">>,
        times => 3,
        add_exp => 0,
        level => 47        
    };
get(1017) ->
    #{
        name => <<"众里寻卿">>,
        times => 1,
        add_exp => 0,
        level => 0
    };
get(1018) ->
    #{
        name => <<"英雄老三环">>,
        times => 1,
        add_exp => 20,
        level => 40        
    };
get(1019) ->
    #{
        name => <<"英雄燕子坞">>,
        times => 1,
        add_exp => 20,
        level => 40        
    };
get(1020) ->
    #{
        name => <<"英雄四绝庄">>,
        times => 1,
        add_exp => 20,
        level => 50        
    };
get(1021) ->
    #{
        name => <<"英雄缥缈峰">>,
        times => 1,
        add_exp => 20,
        level => 64        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021].

get_id_exp(1) ->
    0;
get_id_exp(2) ->
    15;
get_id_exp(3) ->
    0;
get_id_exp(4) ->
    20;
get_id_exp(5) ->
    0;
get_id_exp(6) ->
    0;
get_id_exp(7) ->
    10;
get_id_exp(8) ->
    0;
get_id_exp(9) ->
    10;
get_id_exp(10) ->
    15;
get_id_exp(11) ->
    0;
get_id_exp(12) ->
    0;
get_id_exp(1001) ->
    10;
get_id_exp(1002) ->
    10;
get_id_exp(1003) ->
    10;
get_id_exp(1004) ->
    10;
get_id_exp(1005) ->
    2;
get_id_exp(1006) ->
    1;
get_id_exp(1007) ->
    1;
get_id_exp(1008) ->
    10;
get_id_exp(1009) ->
    0;
get_id_exp(1010) ->
    0;
get_id_exp(1011) ->
    1;
get_id_exp(1012) ->
    2;
get_id_exp(1013) ->
    2;
get_id_exp(1014) ->
    0;
get_id_exp(1015) ->
    0;
get_id_exp(1016) ->
    0;
get_id_exp(1017) ->
    0;
get_id_exp(1018) ->
    20;
get_id_exp(1019) ->
    20;
get_id_exp(1020) ->
    20;
get_id_exp(1021) ->
    20;
get_id_exp(_ID) ->
    0.

get_open_lv(1) ->
    99;
get_open_lv(2) ->
    35;
get_open_lv(3) ->
    99;
get_open_lv(4) ->
    40;
get_open_lv(5) ->
    55;
get_open_lv(6) ->
    40;
get_open_lv(7) ->
    18;
get_open_lv(8) ->
    40;
get_open_lv(9) ->
    18;
get_open_lv(10) ->
    20;
get_open_lv(11) ->
    30;
get_open_lv(12) ->
    99;
get_open_lv(1001) ->
    25;
get_open_lv(1002) ->
    32;
get_open_lv(1003) ->
    50;
get_open_lv(1004) ->
    64;
get_open_lv(1005) ->
    26;
get_open_lv(1006) ->
    20;
get_open_lv(1007) ->
    25;
get_open_lv(1008) ->
    25;
get_open_lv(1009) ->
    20;
get_open_lv(1010) ->
    15;
get_open_lv(1011) ->
    20;
get_open_lv(1012) ->
    15;
get_open_lv(1013) ->
    26;
get_open_lv(1014) ->
    26;
get_open_lv(1015) ->
    99;
get_open_lv(1016) ->
    47;
get_open_lv(1017) ->
    99;
get_open_lv(1018) ->
    40;
get_open_lv(1019) ->
    40;
get_open_lv(1020) ->
    50;
get_open_lv(1021) ->
    64;
get_open_lv(_ID) ->
    0.
