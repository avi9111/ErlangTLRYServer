%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_11
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_11).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(110001) ->
    #mon{
        mid = 110001,
        name = <<"花蛇">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 225, mp_lim = 353, inner_att = 5, outer_att = 5, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 5
    };
get(110002) ->
    #mon{
        mid = 110002,
        name = <<"蝶灵">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 301, mp_lim = 464, inner_att = 5, outer_att = 5, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 5
    };
get(110003) ->
    #mon{
        mid = 110003,
        name = <<"蝶灵">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 366, mp_lim = 570, inner_att = 6, outer_att = 6, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 6
    };
get(110004) ->
    #mon{
        mid = 110004,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 447, mp_lim = 681, inner_att = 7, outer_att = 7, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 7
    };
get(110005) ->
    #mon{
        mid = 110005,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 517, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 8
    };
get(110006) ->
    #mon{
        mid = 110006,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 554, mp_lim = 897, inner_att = 9, outer_att = 9, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 8
    };
get(110007) ->
    #mon{
        mid = 110007,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 568, mp_lim = 1003, inner_att = 10, outer_att = 10, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 9
    };
get(110008) ->
    #mon{
        mid = 110008,
        name = <<"狼">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 646, mp_lim = 1114, inner_att = 11, outer_att = 11, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 9
    };
get(110009) ->
    #mon{
        mid = 110009,
        name = <<"鹿">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 714, mp_lim = 1219, inner_att = 12, outer_att = 12, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110010) ->
    #mon{
        mid = 110010,
        name = <<"山猪">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 798, mp_lim = 1330, inner_att = 13, outer_att = 13, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110011) ->
    #mon{
        mid = 110011,
        name = <<"幻蝶">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 871, mp_lim = 1436, inner_att = 14, outer_att = 14, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110012) ->
    #mon{
        mid = 110012,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 961, mp_lim = 1547, inner_att = 15, outer_att = 15, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110013) ->
    #mon{
        mid = 110013,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 1038, mp_lim = 1652, inner_att = 16, outer_att = 16, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110014) ->
    #mon{
        mid = 110014,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 1132, mp_lim = 1763, inner_att = 17, outer_att = 17, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 10
    };
get(110015) ->
    #mon{
        mid = 110015,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 1215, mp_lim = 1869, inner_att = 18, outer_att = 18, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 11
    };
get(110101) ->
    #mon{
        mid = 110101,
        name = <<"狼">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 1736, mp_lim = 1869, inner_att = 59, outer_att = 59, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 11
    };
get(110102) ->
    #mon{
        mid = 110102,
        name = <<"鹿">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 1878, mp_lim = 1980, inner_att = 63, outer_att = 63, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 12
    };
get(110103) ->
    #mon{
        mid = 110103,
        name = <<"山猪">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 2003, mp_lim = 2085, inner_att = 67, outer_att = 67, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 13
    };
get(110104) ->
    #mon{
        mid = 110104,
        name = <<"谭青">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 2153, mp_lim = 2196, inner_att = 71, outer_att = 71, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 13
    };
get(110105) ->
    #mon{
        mid = 110105,
        name = <<"江湖豪杰">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 2322, mp_lim = 2302, inner_att = 76, outer_att = 76, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 14
    };
get(110106) ->
    #mon{
        mid = 110106,
        name = <<"杀手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 2522, mp_lim = 2413, inner_att = 82, outer_att = 82, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 15
    };
get(110107) ->
    #mon{
        mid = 110107,
        name = <<"熊">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 2706, mp_lim = 2518, inner_att = 88, outer_att = 88, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 15
    };
get(110108) ->
    #mon{
        mid = 110108,
        name = <<"黑衣人">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 2921, mp_lim = 2629, inner_att = 94, outer_att = 94, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 16
    };
get(110201) ->
    #mon{
        mid = 110201,
        name = <<"一品堂侍卫">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 3118, mp_lim = 2735, inner_att = 100, outer_att = 100, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 17
    };
get(110202) ->
    #mon{
        mid = 110202,
        name = <<"鹿">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 3348, mp_lim = 2846, inner_att = 106, outer_att = 106, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 18
    };
get(110203) ->
    #mon{
        mid = 110203,
        name = <<"山猪">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 3558, mp_lim = 2951, inner_att = 112, outer_att = 112, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 18
    };
get(110204) ->
    #mon{
        mid = 110204,
        name = <<"一品堂武士">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 3804, mp_lim = 3062, inner_att = 120, outer_att = 120, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 19
    };
get(110205) ->
    #mon{
        mid = 110205,
        name = <<"一品堂精锐">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 4027, mp_lim = 3168, inner_att = 127, outer_att = 127, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 20
    };
get(110206) ->
    #mon{
        mid = 110206,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 4288, mp_lim = 3279, inner_att = 134, outer_att = 134, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 20
    };
get(110207) ->
    #mon{
        mid = 110207,
        name = <<"吐蕃高手">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 4525, mp_lim = 3384, inner_att = 141, outer_att = 141, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 21
    };
get(110208) ->
    #mon{
        mid = 110208,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 4801, mp_lim = 3495, inner_att = 149, outer_att = 149, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 22
    };
get(110301) ->
    #mon{
        mid = 110301,
        name = <<"燕子坞巡守">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 5051, mp_lim = 3601, inner_att = 156, outer_att = 156, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 22
    };
get(110302) ->
    #mon{
        mid = 110302,
        name = <<"燕子坞教头">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 5342, mp_lim = 3712, inner_att = 165, outer_att = 165, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 23
    };
get(110303) ->
    #mon{
        mid = 110303,
        name = <<"燕子坞精锐">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 5606, mp_lim = 3817, inner_att = 172, outer_att = 172, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 24
    };
get(110304) ->
    #mon{
        mid = 110304,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 5912, mp_lim = 3928, inner_att = 181, outer_att = 181, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 25
    };
get(110305) ->
    #mon{
        mid = 110305,
        name = <<"太湖大闸蟹">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 6190, mp_lim = 4034, inner_att = 190, outer_att = 190, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 25
    };
get(110306) ->
    #mon{
        mid = 110306,
        name = <<"太湖大闸蟹">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 6649, mp_lim = 4145, inner_att = 203, outer_att = 203, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 26
    };
get(110307) ->
    #mon{
        mid = 110307,
        name = <<"曼陀山庄侍女">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 7085, mp_lim = 4250, inner_att = 216, outer_att = 216, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 27
    };
get(110308) ->
    #mon{
        mid = 110308,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 7575, mp_lim = 4361, inner_att = 231, outer_att = 231, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 27
    };
get(110401) ->
    #mon{
        mid = 110401,
        name = <<"一品堂武士">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 8038, mp_lim = 4467, inner_att = 244, outer_att = 244, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 28
    };
get(110402) ->
    #mon{
        mid = 110402,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 8557, mp_lim = 4578, inner_att = 260, outer_att = 260, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 29
    };
get(110403) ->
    #mon{
        mid = 110403,
        name = <<"一品堂侍卫">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 9047, mp_lim = 4683, inner_att = 274, outer_att = 274, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 29
    };
get(110404) ->
    #mon{
        mid = 110404,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 9597, mp_lim = 4794, inner_att = 290, outer_att = 290, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 30
    };
get(110405) ->
    #mon{
        mid = 110405,
        name = <<"一品堂侍卫">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 10114, mp_lim = 4900, inner_att = 305, outer_att = 305, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 31
    };
get(110406) ->
    #mon{
        mid = 110406,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 10694, mp_lim = 5011, inner_att = 322, outer_att = 322, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 32
    };
get(110407) ->
    #mon{
        mid = 110407,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 11238, mp_lim = 5116, inner_att = 338, outer_att = 338, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 32
    };
get(110408) ->
    #mon{
        mid = 110408,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 11848, mp_lim = 5227, inner_att = 356, outer_att = 356, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 33
    };
get(110501) ->
    #mon{
        mid = 110501,
        name = <<"一品堂精锐">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 12419, mp_lim = 5333, inner_att = 372, outer_att = 372, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 34
    };
get(110502) ->
    #mon{
        mid = 110502,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 13060, mp_lim = 5444, inner_att = 391, outer_att = 391, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 35
    };
get(110503) ->
    #mon{
        mid = 110503,
        name = <<"星宿派精锐">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 13658, mp_lim = 5549, inner_att = 408, outer_att = 408, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 36
    };
get(110504) ->
    #mon{
        mid = 110504,
        name = <<"幻蝶">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 14328, mp_lim = 5660, inner_att = 428, outer_att = 428, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 38
    };
get(110505) ->
    #mon{
        mid = 110505,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 14953, mp_lim = 5766, inner_att = 446, outer_att = 446, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 39
    };
get(110506) ->
    #mon{
        mid = 110506,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 15654, mp_lim = 5877, inner_att = 466, outer_att = 466, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 41
    };
get(110507) ->
    #mon{
        mid = 110507,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 16306, mp_lim = 5982, inner_att = 485, outer_att = 485, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 43
    };
get(110508) ->
    #mon{
        mid = 110508,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 17036, mp_lim = 6093, inner_att = 506, outer_att = 506, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 45
    };
get(110601) ->
    #mon{
        mid = 110601,
        name = <<"狼">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 17715, mp_lim = 6199, inner_att = 526, outer_att = 526, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 47
    };
get(110602) ->
    #mon{
        mid = 110602,
        name = <<"鹿">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 18476, mp_lim = 6310, inner_att = 548, outer_att = 548, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 49
    };
get(110603) ->
    #mon{
        mid = 110603,
        name = <<"山猪">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 19182, mp_lim = 6415, inner_att = 568, outer_att = 568, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 51
    };
get(110604) ->
    #mon{
        mid = 110604,
        name = <<"幻蝶">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 19973, mp_lim = 6526, inner_att = 590, outer_att = 590, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 53
    };
get(110605) ->
    #mon{
        mid = 110605,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 20706, mp_lim = 6632, inner_att = 612, outer_att = 612, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 55
    };
get(110606) ->
    #mon{
        mid = 110606,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 21527, mp_lim = 6743, inner_att = 636, outer_att = 636, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 57
    };
get(110607) ->
    #mon{
        mid = 110607,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 22287, mp_lim = 6848, inner_att = 657, outer_att = 657, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 60
    };
get(110608) ->
    #mon{
        mid = 110608,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 23139, mp_lim = 6959, inner_att = 681, outer_att = 681, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 62
    };
get(110701) ->
    #mon{
        mid = 110701,
        name = <<"狼">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 23926, mp_lim = 7065, inner_att = 704, outer_att = 704, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 64
    };
get(110702) ->
    #mon{
        mid = 110702,
        name = <<"鹿">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 24807, mp_lim = 7176, inner_att = 729, outer_att = 729, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 66
    };
get(110703) ->
    #mon{
        mid = 110703,
        name = <<"山猪">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 25621, mp_lim = 7281, inner_att = 753, outer_att = 753, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 68
    };
get(110704) ->
    #mon{
        mid = 110704,
        name = <<"幻蝶">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 26533, mp_lim = 7392, inner_att = 779, outer_att = 779, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 70
    };
get(110705) ->
    #mon{
        mid = 110705,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 27374, mp_lim = 7498, inner_att = 804, outer_att = 804, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 72
    };
get(110706) ->
    #mon{
        mid = 110706,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 28315, mp_lim = 7609, inner_att = 830, outer_att = 830, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 74
    };
get(110707) ->
    #mon{
        mid = 110707,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 29183, mp_lim = 7714, inner_att = 855, outer_att = 855, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 76
    };
get(110708) ->
    #mon{
        mid = 110708,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 30155, mp_lim = 7825, inner_att = 883, outer_att = 883, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 86
    };
get(110801) ->
    #mon{
        mid = 110801,
        name = <<"狼">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 31050, mp_lim = 7931, inner_att = 908, outer_att = 908, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 95
    };
get(110802) ->
    #mon{
        mid = 110802,
        name = <<"鹿">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 32052, mp_lim = 8042, inner_att = 936, outer_att = 936, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 102
    };
get(110803) ->
    #mon{
        mid = 110803,
        name = <<"山猪">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 32974, mp_lim = 8147, inner_att = 964, outer_att = 964, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 110
    };
get(110804) ->
    #mon{
        mid = 110804,
        name = <<"幻蝶">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 33869, mp_lim = 8258, inner_att = 988, outer_att = 988, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 118
    };
get(110805) ->
    #mon{
        mid = 110805,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 34678, mp_lim = 8364, inner_att = 1012, outer_att = 1012, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 127
    };
get(110806) ->
    #mon{
        mid = 110806,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 35595, mp_lim = 8475, inner_att = 1037, outer_att = 1037, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 136
    };
get(110807) ->
    #mon{
        mid = 110807,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 36425, mp_lim = 8580, inner_att = 1062, outer_att = 1062, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 145
    };
get(110808) ->
    #mon{
        mid = 110808,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 37365, mp_lim = 8691, inner_att = 1088, outer_att = 1088, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 155
    };
get(110901) ->
    #mon{
        mid = 110901,
        name = <<"狼">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 38214, mp_lim = 8797, inner_att = 1112, outer_att = 1112, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 165
    };
get(110902) ->
    #mon{
        mid = 110902,
        name = <<"鹿">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 39177, mp_lim = 8908, inner_att = 1139, outer_att = 1139, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 171
    };
get(110903) ->
    #mon{
        mid = 110903,
        name = <<"山猪">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 40046, mp_lim = 9013, inner_att = 1164, outer_att = 1164, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 179
    };
get(110904) ->
    #mon{
        mid = 110904,
        name = <<"幻蝶">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 41032, mp_lim = 9124, inner_att = 1192, outer_att = 1192, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 187
    };
get(110905) ->
    #mon{
        mid = 110905,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 41922, mp_lim = 9230, inner_att = 1218, outer_att = 1218, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 195
    };
get(110906) ->
    #mon{
        mid = 110906,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 42929, mp_lim = 9341, inner_att = 1245, outer_att = 1245, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 204
    };
get(110907) ->
    #mon{
        mid = 110907,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 43840, mp_lim = 9446, inner_att = 1272, outer_att = 1272, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 213
    };
get(110908) ->
    #mon{
        mid = 110908,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 44870, mp_lim = 9557, inner_att = 1300, outer_att = 1300, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 225
    };
get(111001) ->
    #mon{
        mid = 111001,
        name = <<"狼">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 45800, mp_lim = 9663, inner_att = 1328, outer_att = 1328, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 237
    };
get(111002) ->
    #mon{
        mid = 111002,
        name = <<"鹿">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 46853, mp_lim = 9774, inner_att = 1356, outer_att = 1356, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 249
    };
get(111003) ->
    #mon{
        mid = 111003,
        name = <<"山猪">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 47804, mp_lim = 9879, inner_att = 1384, outer_att = 1384, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 261
    };
get(111004) ->
    #mon{
        mid = 111004,
        name = <<"幻蝶">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 49046, mp_lim = 9990, inner_att = 1414, outer_att = 1414, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 273
    };
get(111005) ->
    #mon{
        mid = 111005,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 50185, mp_lim = 10096, inner_att = 1442, outer_att = 1442, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 288
    };
get(111006) ->
    #mon{
        mid = 111006,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 51457, mp_lim = 10207, inner_att = 1472, outer_att = 1472, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 303
    };
get(111007) ->
    #mon{
        mid = 111007,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 52624, mp_lim = 10312, inner_att = 1501, outer_att = 1501, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 318
    };
get(111008) ->
    #mon{
        mid = 111008,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 53925, mp_lim = 10423, inner_att = 1532, outer_att = 1532, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 333
    };
get(112001) ->
    #mon{
        mid = 112001,
        name = <<"狼">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 55119, mp_lim = 10529, inner_att = 1562, outer_att = 1562, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 348
    };
get(112002) ->
    #mon{
        mid = 112002,
        name = <<"鹿">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 56451, mp_lim = 10640, inner_att = 1593, outer_att = 1593, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 363
    };
get(112003) ->
    #mon{
        mid = 112003,
        name = <<"山猪">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 57672, mp_lim = 10745, inner_att = 1624, outer_att = 1624, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 380
    };
get(112004) ->
    #mon{
        mid = 112004,
        name = <<"幻蝶">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 59034, mp_lim = 10856, inner_att = 1656, outer_att = 1656, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 397
    };
get(112005) ->
    #mon{
        mid = 112005,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 60281, mp_lim = 10962, inner_att = 1686, outer_att = 1686, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 415
    };
get(112006) ->
    #mon{
        mid = 112006,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 101,
        attr = #bt_attr{hp_lim = 61673, mp_lim = 11073, inner_att = 1719, outer_att = 1719, inner_def = 2411, outer_def = 2411, hit = 23188, dodge = 2160, crit_hurt = 2264, crit_def = 537, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 416
    };
get(112007) ->
    #mon{
        mid = 112007,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 62948, mp_lim = 11178, inner_att = 1750, outer_att = 1750, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 417
    };
get(112008) ->
    #mon{
        mid = 112008,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 103,
        attr = #bt_attr{hp_lim = 64371, mp_lim = 11289, inner_att = 1784, outer_att = 1784, inner_def = 2516, outer_def = 2516, hit = 24187, dodge = 2253, crit_hurt = 2359, crit_def = 559, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 418
    };
get(113001) ->
    #mon{
        mid = 113001,
        name = <<"狼">>,
        boss = 0,
        level = 104,
        attr = #bt_attr{hp_lim = 65672, mp_lim = 11395, inner_att = 1815, outer_att = 1815, inner_def = 2568, outer_def = 2568, hit = 24686, dodge = 2296, crit_hurt = 2401, crit_def = 570, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 419
    };
get(113002) ->
    #mon{
        mid = 113002,
        name = <<"鹿">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 67125, mp_lim = 11506, inner_att = 1849, outer_att = 1849, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 420
    };
get(113003) ->
    #mon{
        mid = 113003,
        name = <<"山猪">>,
        boss = 0,
        level = 106,
        attr = #bt_attr{hp_lim = 68453, mp_lim = 11611, inner_att = 1881, outer_att = 1881, inner_def = 2676, outer_def = 2676, hit = 25716, dodge = 2394, crit_hurt = 2502, crit_def = 592, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 421
    };
get(113004) ->
    #mon{
        mid = 113004,
        name = <<"幻蝶">>,
        boss = 0,
        level = 107,
        attr = #bt_attr{hp_lim = 69936, mp_lim = 11722, inner_att = 1916, outer_att = 1916, inner_def = 2732, outer_def = 2732, hit = 26253, dodge = 2444, crit_hurt = 2559, crit_def = 607, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 422
    };
get(113005) ->
    #mon{
        mid = 113005,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 71292, mp_lim = 11828, inner_att = 1948, outer_att = 1948, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 423
    };
get(113006) ->
    #mon{
        mid = 113006,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 109,
        attr = #bt_attr{hp_lim = 72804, mp_lim = 11939, inner_att = 1984, outer_att = 1984, inner_def = 2844, outer_def = 2844, hit = 27324, dodge = 2548, crit_hurt = 2668, crit_def = 632, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 424
    };
get(113007) ->
    #mon{
        mid = 113007,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 110,
        attr = #bt_attr{hp_lim = 74187, mp_lim = 12044, inner_att = 2017, outer_att = 2017, inner_def = 2899, outer_def = 2899, hit = 27844, dodge = 2594, crit_hurt = 2708, crit_def = 643, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 425
    };
get(113008) ->
    #mon{
        mid = 113008,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 111,
        attr = #bt_attr{hp_lim = 75730, mp_lim = 12155, inner_att = 2053, outer_att = 2053, inner_def = 2958, outer_def = 2958, hit = 28402, dodge = 2648, crit_hurt = 2771, crit_def = 656, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 426
    };
get(114001) ->
    #mon{
        mid = 114001,
        name = <<"狼">>,
        boss = 0,
        level = 112,
        attr = #bt_attr{hp_lim = 77140, mp_lim = 12261, inner_att = 2087, outer_att = 2087, inner_def = 3014, outer_def = 3014, hit = 28941, dodge = 2696, crit_hurt = 2815, crit_def = 669, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 427
    };
get(114002) ->
    #mon{
        mid = 114002,
        name = <<"鹿">>,
        boss = 0,
        level = 113,
        attr = #bt_attr{hp_lim = 78713, mp_lim = 12372, inner_att = 2124, outer_att = 2124, inner_def = 3074, outer_def = 3074, hit = 29515, dodge = 2753, crit_hurt = 2880, crit_def = 682, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 428
    };
get(114003) ->
    #mon{
        mid = 114003,
        name = <<"山猪">>,
        boss = 0,
        level = 114,
        attr = #bt_attr{hp_lim = 80150, mp_lim = 12477, inner_att = 2158, outer_att = 2158, inner_def = 3131, outer_def = 3131, hit = 30060, dodge = 2801, crit_hurt = 2925, crit_def = 693, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 429
    };
get(114004) ->
    #mon{
        mid = 114004,
        name = <<"幻蝶">>,
        boss = 0,
        level = 115,
        attr = #bt_attr{hp_lim = 81753, mp_lim = 12588, inner_att = 2196, outer_att = 2196, inner_def = 3192, outer_def = 3192, hit = 30634, dodge = 2855, crit_hurt = 2987, crit_def = 708, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 430
    };
get(114005) ->
    #mon{
        mid = 114005,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 116,
        attr = #bt_attr{hp_lim = 83217, mp_lim = 12694, inner_att = 2231, outer_att = 2231, inner_def = 3251, outer_def = 3251, hit = 31194, dodge = 2906, crit_hurt = 3037, crit_def = 720, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 431
    };
get(114006) ->
    #mon{
        mid = 114006,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 117,
        attr = #bt_attr{hp_lim = 84850, mp_lim = 12805, inner_att = 2268, outer_att = 2268, inner_def = 3312, outer_def = 3312, hit = 31790, dodge = 2966, crit_hurt = 3104, crit_def = 736, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 432
    };
get(114007) ->
    #mon{
        mid = 114007,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 118,
        attr = #bt_attr{hp_lim = 86341, mp_lim = 12910, inner_att = 2304, outer_att = 2304, inner_def = 3372, outer_def = 3372, hit = 32355, dodge = 3015, crit_hurt = 3147, crit_def = 747, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 433
    };
get(114008) ->
    #mon{
        mid = 114008,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 119,
        attr = #bt_attr{hp_lim = 88004, mp_lim = 13021, inner_att = 2342, outer_att = 2342, inner_def = 3435, outer_def = 3435, hit = 32956, dodge = 3076, crit_hurt = 3215, crit_def = 761, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 434
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

