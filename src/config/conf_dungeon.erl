%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dungeon
%% @Brief  : 副本配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dungeon).

-export([
    get/1,
    get_ids/0,
    get_id_by_type/1,
    get_count_dowwn/1
]).

get(100) ->
    #{
        id => 100,
        name => <<"坐骑副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(101) ->
    #{
        id => 101,
        name => <<"珍兽副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(102) ->
    #{
        id => 102,
        name => <<"精炼副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(103) ->
    #{
        id => 103,
        name => <<"英雄副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(104) ->
    #{
        id => 104,
        name => <<"锻炼副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(105) ->
    #{
        id => 105,
        name => <<"淬炼副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(106) ->
    #{
        id => 106,
        name => <<"腰佩副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(107) ->
    #{
        id => 107,
        name => <<"神兵副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(108) ->
    #{
        id => 108,
        name => <<"翅膀副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(109) ->
    #{
        id => 109,
        name => <<"背饰副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(110) ->
    #{
        id => 110,
        name => <<"名号副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(111) ->
    #{
        id => 111,
        name => <<"附体副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(112) ->
    #{
        id => 112,
        name => <<"悟性副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(113) ->
    #{
        id => 113,
        name => <<"房屋副本">>,
        cate => 1,
        type => 1,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [{1,20},{2,20},{3,20}],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(200) ->
    #{
        id => 200,
        name => <<"老三环">>,
        cate => 1,
        type => 2,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(300) ->
    #{
        id => 300,
        name => <<"燕子坞">>,
        cate => 1,
        type => 3,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 1,
        count_down => 0        
    };
get(400) ->
    #{
        id => 400,
        name => <<"四绝庄">>,
        cate => 1,
        type => 4,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 1,
        wipe_lv => 1,
        record_wave => 0,
        count_down => 0        
    };
get(500) ->
    #{
        id => 500,
        name => <<"神兽来袭(30级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 40,
        record_wave => 0,
        count_down => 0        
    };
get(501) ->
    #{
        id => 501,
        name => <<"神兽来袭(40级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 50,
        record_wave => 0,
        count_down => 0        
    };
get(502) ->
    #{
        id => 502,
        name => <<"神兽来袭(50级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 60,
        record_wave => 0,
        count_down => 0        
    };
get(503) ->
    #{
        id => 503,
        name => <<"神兽来袭(60级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 70,
        record_wave => 0,
        count_down => 0        
    };
get(504) ->
    #{
        id => 504,
        name => <<"神兽来袭(70级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 80,
        record_wave => 0,
        count_down => 0        
    };
get(505) ->
    #{
        id => 505,
        name => <<"神兽来袭(80级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 90,
        record_wave => 0,
        count_down => 0        
    };
get(506) ->
    #{
        id => 506,
        name => <<"神兽来袭(90级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 100,
        record_wave => 0,
        count_down => 0        
    };
get(507) ->
    #{
        id => 507,
        name => <<"神兽来袭(100级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 110,
        record_wave => 0,
        count_down => 0        
    };
get(508) ->
    #{
        id => 508,
        name => <<"神兽来袭(110级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 120,
        record_wave => 0,
        count_down => 0        
    };
get(509) ->
    #{
        id => 509,
        name => <<"神兽来袭(120级)">>,
        cate => 1,
        type => 5,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 1,
        wipe_lv => 130,
        record_wave => 0,
        count_down => 0        
    };
get(600) ->
    #{
        id => 600,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(601) ->
    #{
        id => 601,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(602) ->
    #{
        id => 602,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(603) ->
    #{
        id => 603,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(604) ->
    #{
        id => 604,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(605) ->
    #{
        id => 605,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(606) ->
    #{
        id => 606,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(607) ->
    #{
        id => 607,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(608) ->
    #{
        id => 608,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(609) ->
    #{
        id => 609,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(610) ->
    #{
        id => 610,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(611) ->
    #{
        id => 611,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(612) ->
    #{
        id => 612,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(613) ->
    #{
        id => 613,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(614) ->
    #{
        id => 614,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(615) ->
    #{
        id => 615,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(616) ->
    #{
        id => 616,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(617) ->
    #{
        id => 617,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(618) ->
    #{
        id => 618,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(619) ->
    #{
        id => 619,
        name => <<"珍珑棋局(旧)">>,
        cate => 1,
        type => 6,
        npc => 0,
        mem_num => 0,
        enter_lv => 0,
        reset => 0,
        reset_cost => [],
        reset_times => [],
        chal_times => 0,
        assist_times => 9999,
        first_auto => 1,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(550) ->
    #{
        id => 550,
        name => <<"英雄试炼">>,
        cate => 1,
        type => 7,
        npc => 14,
        mem_num => 0,
        enter_lv => 15,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 1,
        wipe_lv => 15,
        record_wave => 0,
        count_down => 5        
    };
get(750) ->
    #{
        id => 750,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3021,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(751) ->
    #{
        id => 751,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3022,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(752) ->
    #{
        id => 752,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3023,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(753) ->
    #{
        id => 753,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3024,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(754) ->
    #{
        id => 754,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3025,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(755) ->
    #{
        id => 755,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3031,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(756) ->
    #{
        id => 756,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3032,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(757) ->
    #{
        id => 757,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3033,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(758) ->
    #{
        id => 758,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3034,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(759) ->
    #{
        id => 759,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3035,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(760) ->
    #{
        id => 760,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3041,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(761) ->
    #{
        id => 761,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3042,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(762) ->
    #{
        id => 762,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3043,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(763) ->
    #{
        id => 763,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3044,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(764) ->
    #{
        id => 764,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3045,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(765) ->
    #{
        id => 765,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3051,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(766) ->
    #{
        id => 766,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3052,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(767) ->
    #{
        id => 767,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3053,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(768) ->
    #{
        id => 768,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3054,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(769) ->
    #{
        id => 769,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 3055,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(770) ->
    #{
        id => 770,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 4006,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(771) ->
    #{
        id => 771,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 4007,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(772) ->
    #{
        id => 772,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 4008,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(773) ->
    #{
        id => 773,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 4009,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(774) ->
    #{
        id => 774,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 4010,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(775) ->
    #{
        id => 775,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(776) ->
    #{
        id => 776,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(777) ->
    #{
        id => 777,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(778) ->
    #{
        id => 778,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(779) ->
    #{
        id => 779,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(780) ->
    #{
        id => 780,
        name => <<"武林悬赏令">>,
        cate => 1,
        type => 8,
        npc => 0,
        mem_num => 0,
        enter_lv => 20,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 10,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(700) ->
    #{
        id => 700,
        name => <<"老三环">>,
        cate => 2,
        type => 51,
        npc => 17,
        mem_num => 3,
        enter_lv => 25,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(800) ->
    #{
        id => 800,
        name => <<"燕子坞">>,
        cate => 2,
        type => 52,
        npc => 18,
        mem_num => 3,
        enter_lv => 32,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(900) ->
    #{
        id => 900,
        name => <<"四绝庄">>,
        cate => 2,
        type => 53,
        npc => 19,
        mem_num => 3,
        enter_lv => 50,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1000) ->
    #{
        id => 1000,
        name => <<"缥缈峰">>,
        cate => 2,
        type => 54,
        npc => 20,
        mem_num => 3,
        enter_lv => 64,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1100) ->
    #{
        id => 1100,
        name => <<"稀世藏宝图">>,
        cate => 2,
        type => 55,
        npc => 0,
        mem_num => 3,
        enter_lv => 15,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 9999,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1150) ->
    #{
        id => 1150,
        name => <<"绝世藏宝图">>,
        cate => 2,
        type => 55,
        npc => 0,
        mem_num => 3,
        enter_lv => 15,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 9999,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1200) ->
    #{
        id => 1200,
        name => <<"珍珑棋局">>,
        cate => 2,
        type => 56,
        npc => 13,
        mem_num => 3,
        enter_lv => 15,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1300) ->
    #{
        id => 1300,
        name => <<"英雄试炼">>,
        cate => 1,
        type => 7,
        npc => 0,
        mem_num => 0,
        enter_lv => 15,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 1,
        wipe_lv => 15,
        record_wave => 0,
        count_down => 0        
    };
get(1400) ->
    #{
        id => 1400,
        name => <<"">>,
        cate => 2,
        type => 57,
        npc => 2014,
        mem_num => 3,
        enter_lv => 79,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 3,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1500) ->
    #{
        id => 1500,
        name => <<"">>,
        cate => 2,
        type => 57,
        npc => 2014,
        mem_num => 3,
        enter_lv => 79,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 3,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1600) ->
    #{
        id => 1600,
        name => <<"">>,
        cate => 2,
        type => 57,
        npc => 2014,
        mem_num => 3,
        enter_lv => 79,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 3,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1700) ->
    #{
        id => 1700,
        name => <<"">>,
        cate => 2,
        type => 57,
        npc => 2014,
        mem_num => 3,
        enter_lv => 79,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 3,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1800) ->
    #{
        id => 1800,
        name => <<"英雄老三环">>,
        cate => 2,
        type => 58,
        npc => 17,
        mem_num => 3,
        enter_lv => 40,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(1900) ->
    #{
        id => 1900,
        name => <<"英雄燕子坞">>,
        cate => 2,
        type => 59,
        npc => 18,
        mem_num => 3,
        enter_lv => 40,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(2000) ->
    #{
        id => 2000,
        name => <<"英雄四绝庄">>,
        cate => 2,
        type => 60,
        npc => 19,
        mem_num => 3,
        enter_lv => 50,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(2100) ->
    #{
        id => 2100,
        name => <<"英雄缥缈峰">>,
        cate => 2,
        type => 61,
        npc => 20,
        mem_num => 3,
        enter_lv => 64,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3000) ->
    #{
        id => 3000,
        name => <<"单人老三环">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3001) ->
    #{
        id => 3001,
        name => <<"单人大猿王">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3002) ->
    #{
        id => 3002,
        name => <<"单人左子穆">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3003) ->
    #{
        id => 3003,
        name => <<"单人司空玄">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3004) ->
    #{
        id => 3004,
        name => <<"单人珍珑棋局">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(3005) ->
    #{
        id => 3005,
        name => <<"单人木婉清">>,
        cate => 1,
        type => 11,
        npc => 0,
        mem_num => 0,
        enter_lv => 1,
        reset => 1,
        reset_cost => [],
        reset_times => [],
        chal_times => 1,
        assist_times => 9999,
        first_auto => 0,
        can_wipe => 0,
        wipe_lv => 9999,
        record_wave => 0,
        count_down => 0        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 200, 300, 400, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 550, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 700, 800, 900, 1000, 1100, 1150, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 3000, 3001, 3002, 3003, 3004, 3005].

get_id_by_type(1) ->
    [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113];
get_id_by_type(2) ->
    [200];
get_id_by_type(3) ->
    [300];
get_id_by_type(4) ->
    [400];
get_id_by_type(5) ->
    [500, 501, 502, 503, 504, 505, 506, 507, 508, 509];
get_id_by_type(6) ->
    [600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619];
get_id_by_type(7) ->
    [550, 1300];
get_id_by_type(8) ->
    [750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780];
get_id_by_type(51) ->
    [700];
get_id_by_type(52) ->
    [800];
get_id_by_type(53) ->
    [900];
get_id_by_type(54) ->
    [1000];
get_id_by_type(55) ->
    [1100, 1150];
get_id_by_type(56) ->
    [1200];
get_id_by_type(57) ->
    [1400, 1500, 1600, 1700];
get_id_by_type(58) ->
    [1800];
get_id_by_type(59) ->
    [1900];
get_id_by_type(60) ->
    [2000];
get_id_by_type(61) ->
    [2100];
get_id_by_type(11) ->
    [3000, 3001, 3002, 3003, 3004, 3005];
get_id_by_type(_) ->
    [].

get_count_dowwn(100) ->
    0;
get_count_dowwn(101) ->
    0;
get_count_dowwn(102) ->
    0;
get_count_dowwn(103) ->
    0;
get_count_dowwn(104) ->
    0;
get_count_dowwn(105) ->
    0;
get_count_dowwn(106) ->
    0;
get_count_dowwn(107) ->
    0;
get_count_dowwn(108) ->
    0;
get_count_dowwn(109) ->
    0;
get_count_dowwn(110) ->
    0;
get_count_dowwn(111) ->
    0;
get_count_dowwn(112) ->
    0;
get_count_dowwn(113) ->
    0;
get_count_dowwn(200) ->
    0;
get_count_dowwn(300) ->
    0;
get_count_dowwn(400) ->
    0;
get_count_dowwn(500) ->
    0;
get_count_dowwn(501) ->
    0;
get_count_dowwn(502) ->
    0;
get_count_dowwn(503) ->
    0;
get_count_dowwn(504) ->
    0;
get_count_dowwn(505) ->
    0;
get_count_dowwn(506) ->
    0;
get_count_dowwn(507) ->
    0;
get_count_dowwn(508) ->
    0;
get_count_dowwn(509) ->
    0;
get_count_dowwn(600) ->
    0;
get_count_dowwn(601) ->
    0;
get_count_dowwn(602) ->
    0;
get_count_dowwn(603) ->
    0;
get_count_dowwn(604) ->
    0;
get_count_dowwn(605) ->
    0;
get_count_dowwn(606) ->
    0;
get_count_dowwn(607) ->
    0;
get_count_dowwn(608) ->
    0;
get_count_dowwn(609) ->
    0;
get_count_dowwn(610) ->
    0;
get_count_dowwn(611) ->
    0;
get_count_dowwn(612) ->
    0;
get_count_dowwn(613) ->
    0;
get_count_dowwn(614) ->
    0;
get_count_dowwn(615) ->
    0;
get_count_dowwn(616) ->
    0;
get_count_dowwn(617) ->
    0;
get_count_dowwn(618) ->
    0;
get_count_dowwn(619) ->
    0;
get_count_dowwn(550) ->
    5;
get_count_dowwn(750) ->
    0;
get_count_dowwn(751) ->
    0;
get_count_dowwn(752) ->
    0;
get_count_dowwn(753) ->
    0;
get_count_dowwn(754) ->
    0;
get_count_dowwn(755) ->
    0;
get_count_dowwn(756) ->
    0;
get_count_dowwn(757) ->
    0;
get_count_dowwn(758) ->
    0;
get_count_dowwn(759) ->
    0;
get_count_dowwn(760) ->
    0;
get_count_dowwn(761) ->
    0;
get_count_dowwn(762) ->
    0;
get_count_dowwn(763) ->
    0;
get_count_dowwn(764) ->
    0;
get_count_dowwn(765) ->
    0;
get_count_dowwn(766) ->
    0;
get_count_dowwn(767) ->
    0;
get_count_dowwn(768) ->
    0;
get_count_dowwn(769) ->
    0;
get_count_dowwn(770) ->
    0;
get_count_dowwn(771) ->
    0;
get_count_dowwn(772) ->
    0;
get_count_dowwn(773) ->
    0;
get_count_dowwn(774) ->
    0;
get_count_dowwn(775) ->
    0;
get_count_dowwn(776) ->
    0;
get_count_dowwn(777) ->
    0;
get_count_dowwn(778) ->
    0;
get_count_dowwn(779) ->
    0;
get_count_dowwn(780) ->
    0;
get_count_dowwn(700) ->
    0;
get_count_dowwn(800) ->
    0;
get_count_dowwn(900) ->
    0;
get_count_dowwn(1000) ->
    0;
get_count_dowwn(1100) ->
    0;
get_count_dowwn(1150) ->
    0;
get_count_dowwn(1200) ->
    0;
get_count_dowwn(1300) ->
    0;
get_count_dowwn(1400) ->
    0;
get_count_dowwn(1500) ->
    0;
get_count_dowwn(1600) ->
    0;
get_count_dowwn(1700) ->
    0;
get_count_dowwn(1800) ->
    0;
get_count_dowwn(1900) ->
    0;
get_count_dowwn(2000) ->
    0;
get_count_dowwn(2100) ->
    0;
get_count_dowwn(3000) ->
    0;
get_count_dowwn(3001) ->
    0;
get_count_dowwn(3002) ->
    0;
get_count_dowwn(3003) ->
    0;
get_count_dowwn(3004) ->
    0;
get_count_dowwn(3005) ->
    0;
get_count_dowwn(_ID) ->
    undefined.
