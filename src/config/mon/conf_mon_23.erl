%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_23
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_23).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(230001) ->
    #mon{
        mid = 230001,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 1705, mp_lim = 681, inner_att = 8, outer_att = 8, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230002) ->
    #mon{
        mid = 230002,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3267, mp_lim = 1219, inner_att = 14, outer_att = 14, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230003) ->
    #mon{
        mid = 230003,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 5177, mp_lim = 1763, inner_att = 20, outer_att = 20, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230004) ->
    #mon{
        mid = 230004,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 7430, mp_lim = 2302, inner_att = 28, outer_att = 28, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230005) ->
    #mon{
        mid = 230005,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 10713, mp_lim = 2846, inner_att = 39, outer_att = 39, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230006) ->
    #mon{
        mid = 230006,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 14480, mp_lim = 3384, inner_att = 53, outer_att = 53, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230007) ->
    #mon{
        mid = 230007,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 18918, mp_lim = 3928, inner_att = 68, outer_att = 68, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230008) ->
    #mon{
        mid = 230008,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 25721, mp_lim = 4467, inner_att = 91, outer_att = 91, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230009) ->
    #mon{
        mid = 230009,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 34220, mp_lim = 5011, inner_att = 120, outer_att = 120, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(230010) ->
    #mon{
        mid = 230010,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 43705, mp_lim = 5549, inner_att = 153, outer_att = 153, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(231001) ->
    #mon{
        mid = 231001,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 54515, mp_lim = 6093, inner_att = 189, outer_att = 189, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231002) ->
    #mon{
        mid = 231002,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 66259, mp_lim = 6632, inner_att = 229, outer_att = 229, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231003) ->
    #mon{
        mid = 231003,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 79382, mp_lim = 7176, inner_att = 273, outer_att = 273, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231004) ->
    #mon{
        mid = 231004,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 93385, mp_lim = 7714, inner_att = 320, outer_att = 320, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231005) ->
    #mon{
        mid = 231005,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 108380, mp_lim = 8258, inner_att = 370, outer_att = 370, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231006) ->
    #mon{
        mid = 231006,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 122284, mp_lim = 8797, inner_att = 417, outer_att = 417, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231007) ->
    #mon{
        mid = 231007,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 137372, mp_lim = 9341, inner_att = 467, outer_att = 467, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231008) ->
    #mon{
        mid = 231008,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 152972, mp_lim = 9879, inner_att = 519, outer_att = 519, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231009) ->
    #mon{
        mid = 231009,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 172560, mp_lim = 10423, inner_att = 574, outer_att = 574, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(231010) ->
    #mon{
        mid = 231010,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 192899, mp_lim = 10962, inner_att = 632, outer_att = 632, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210201,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232001) ->
    #mon{
        mid = 232001,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 40886, mp_lim = 6093, inner_att = 126, outer_att = 126, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232002) ->
    #mon{
        mid = 232002,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 49694, mp_lim = 6632, inner_att = 153, outer_att = 153, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232003) ->
    #mon{
        mid = 232003,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 59536, mp_lim = 7176, inner_att = 182, outer_att = 182, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232004) ->
    #mon{
        mid = 232004,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 70039, mp_lim = 7714, inner_att = 213, outer_att = 213, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232005) ->
    #mon{
        mid = 232005,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 81285, mp_lim = 8258, inner_att = 247, outer_att = 247, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232006) ->
    #mon{
        mid = 232006,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 91713, mp_lim = 8797, inner_att = 278, outer_att = 278, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232007) ->
    #mon{
        mid = 232007,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 103029, mp_lim = 9341, inner_att = 311, outer_att = 311, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232008) ->
    #mon{
        mid = 232008,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 114729, mp_lim = 9879, inner_att = 346, outer_att = 346, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232009) ->
    #mon{
        mid = 232009,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 129420, mp_lim = 10423, inner_att = 383, outer_att = 383, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232010) ->
    #mon{
        mid = 232010,
        name = <<"藏宝盗贼">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 144674, mp_lim = 10962, inner_att = 421, outer_att = 421, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210211,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232101) ->
    #mon{
        mid = 232101,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 255540, mp_lim = 6093, inner_att = 316, outer_att = 316, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232102) ->
    #mon{
        mid = 232102,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 310590, mp_lim = 6632, inner_att = 382, outer_att = 382, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232103) ->
    #mon{
        mid = 232103,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 372105, mp_lim = 7176, inner_att = 456, outer_att = 456, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232104) ->
    #mon{
        mid = 232104,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 437745, mp_lim = 7714, inner_att = 534, outer_att = 534, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232105) ->
    #mon{
        mid = 232105,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 508035, mp_lim = 8258, inner_att = 618, outer_att = 618, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232106) ->
    #mon{
        mid = 232106,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 573210, mp_lim = 8797, inner_att = 695, outer_att = 695, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232107) ->
    #mon{
        mid = 232107,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 643935, mp_lim = 9341, inner_att = 778, outer_att = 778, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232108) ->
    #mon{
        mid = 232108,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 717060, mp_lim = 9879, inner_att = 865, outer_att = 865, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232109) ->
    #mon{
        mid = 232109,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 808875, mp_lim = 10423, inner_att = 958, outer_att = 958, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232110) ->
    #mon{
        mid = 232110,
        name = <<"藏宝将领">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 904215, mp_lim = 10962, inner_att = 1054, outer_att = 1054, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210221,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232201) ->
    #mon{
        mid = 232201,
        name = <<"凤凰">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 408864, mp_lim = 6093, inner_att = 443, outer_att = 443, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232202) ->
    #mon{
        mid = 232202,
        name = <<"凤凰">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 496944, mp_lim = 6632, inner_att = 535, outer_att = 535, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232203) ->
    #mon{
        mid = 232203,
        name = <<"凤凰">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 595368, mp_lim = 7176, inner_att = 638, outer_att = 638, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232204) ->
    #mon{
        mid = 232204,
        name = <<"凤凰">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 700392, mp_lim = 7714, inner_att = 748, outer_att = 748, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232205) ->
    #mon{
        mid = 232205,
        name = <<"凤凰">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 812856, mp_lim = 8258, inner_att = 865, outer_att = 865, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232206) ->
    #mon{
        mid = 232206,
        name = <<"凤凰">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 917136, mp_lim = 8797, inner_att = 973, outer_att = 973, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232207) ->
    #mon{
        mid = 232207,
        name = <<"凤凰">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 1030296, mp_lim = 9341, inner_att = 1089, outer_att = 1089, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232208) ->
    #mon{
        mid = 232208,
        name = <<"凤凰">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 1147296, mp_lim = 9879, inner_att = 1211, outer_att = 1211, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232209) ->
    #mon{
        mid = 232209,
        name = <<"凤凰">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 1294200, mp_lim = 10423, inner_att = 1341, outer_att = 1341, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(232210) ->
    #mon{
        mid = 232210,
        name = <<"凤凰">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 1446744, mp_lim = 10962, inner_att = 1475, outer_att = 1475, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 210401,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

