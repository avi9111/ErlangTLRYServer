%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_27
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_27).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(270001) ->
    #mon{
        mid = 270001,
        name = <<"普通怪物1">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 199, mp_lim = 49, inner_att = 13, outer_att = 13, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 5
    };
get(270002) ->
    #mon{
        mid = 270002,
        name = <<"普通怪物2">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 269, mp_lim = 353, inner_att = 16, outer_att = 16, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 5
    };
get(270003) ->
    #mon{
        mid = 270003,
        name = <<"普通怪物3">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 359, mp_lim = 464, inner_att = 18, outer_att = 18, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 6
    };
get(270004) ->
    #mon{
        mid = 270004,
        name = <<"普通怪物4">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 436, mp_lim = 570, inner_att = 20, outer_att = 20, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 7
    };
get(270005) ->
    #mon{
        mid = 270005,
        name = <<"普通怪物5">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 533, mp_lim = 681, inner_att = 23, outer_att = 23, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 8
    };
get(270006) ->
    #mon{
        mid = 270006,
        name = <<"普通怪物6">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 617, mp_lim = 786, inner_att = 26, outer_att = 26, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 8
    };
get(270007) ->
    #mon{
        mid = 270007,
        name = <<"普通怪物7">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 721, mp_lim = 897, inner_att = 28, outer_att = 28, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 9
    };
get(270008) ->
    #mon{
        mid = 270008,
        name = <<"普通怪物8">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 812, mp_lim = 1003, inner_att = 32, outer_att = 32, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 9
    };
get(270009) ->
    #mon{
        mid = 270009,
        name = <<"普通怪物9">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 924, mp_lim = 1114, inner_att = 35, outer_att = 35, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270010) ->
    #mon{
        mid = 270010,
        name = <<"普通怪物10">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 1021, mp_lim = 1219, inner_att = 38, outer_att = 38, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270011) ->
    #mon{
        mid = 270011,
        name = <<"普通怪物11">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 1141, mp_lim = 1330, inner_att = 41, outer_att = 41, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270012) ->
    #mon{
        mid = 270012,
        name = <<"普通怪物12">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 1245, mp_lim = 1436, inner_att = 44, outer_att = 44, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270013) ->
    #mon{
        mid = 270013,
        name = <<"普通怪物13">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 1373, mp_lim = 1547, inner_att = 48, outer_att = 48, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270014) ->
    #mon{
        mid = 270014,
        name = <<"普通怪物14">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 1483, mp_lim = 1652, inner_att = 52, outer_att = 52, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 10
    };
get(270015) ->
    #mon{
        mid = 270015,
        name = <<"普通怪物15">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 1618, mp_lim = 1763, inner_att = 55, outer_att = 55, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 11
    };
get(270016) ->
    #mon{
        mid = 270016,
        name = <<"普通怪物16">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 1736, mp_lim = 1869, inner_att = 59, outer_att = 59, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 11
    };
get(270017) ->
    #mon{
        mid = 270017,
        name = <<"普通怪物17">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 1878, mp_lim = 1980, inner_att = 63, outer_att = 63, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 12
    };
get(270018) ->
    #mon{
        mid = 270018,
        name = <<"普通怪物18">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 2003, mp_lim = 2085, inner_att = 67, outer_att = 67, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 13
    };
get(270019) ->
    #mon{
        mid = 270019,
        name = <<"普通怪物19">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 2153, mp_lim = 2196, inner_att = 71, outer_att = 71, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 13
    };
get(270020) ->
    #mon{
        mid = 270020,
        name = <<"普通怪物20">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 2322, mp_lim = 2302, inner_att = 76, outer_att = 76, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 14
    };
get(270021) ->
    #mon{
        mid = 270021,
        name = <<"普通怪物21">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 2522, mp_lim = 2413, inner_att = 82, outer_att = 82, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 15
    };
get(270022) ->
    #mon{
        mid = 270022,
        name = <<"普通怪物22">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 2706, mp_lim = 2518, inner_att = 88, outer_att = 88, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 15
    };
get(270023) ->
    #mon{
        mid = 270023,
        name = <<"普通怪物23">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 2921, mp_lim = 2629, inner_att = 94, outer_att = 94, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 16
    };
get(270024) ->
    #mon{
        mid = 270024,
        name = <<"普通怪物24">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 3118, mp_lim = 2735, inner_att = 100, outer_att = 100, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 17
    };
get(270025) ->
    #mon{
        mid = 270025,
        name = <<"普通怪物25">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 3348, mp_lim = 2846, inner_att = 106, outer_att = 106, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 18
    };
get(270026) ->
    #mon{
        mid = 270026,
        name = <<"普通怪物26">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 3558, mp_lim = 2951, inner_att = 112, outer_att = 112, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 18
    };
get(270027) ->
    #mon{
        mid = 270027,
        name = <<"普通怪物27">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 3804, mp_lim = 3062, inner_att = 120, outer_att = 120, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 19
    };
get(270028) ->
    #mon{
        mid = 270028,
        name = <<"普通怪物28">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 4027, mp_lim = 3168, inner_att = 127, outer_att = 127, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 20
    };
get(270029) ->
    #mon{
        mid = 270029,
        name = <<"普通怪物29">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 4288, mp_lim = 3279, inner_att = 134, outer_att = 134, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 20
    };
get(270030) ->
    #mon{
        mid = 270030,
        name = <<"普通怪物30">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 4525, mp_lim = 3384, inner_att = 141, outer_att = 141, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 21
    };
get(270031) ->
    #mon{
        mid = 270031,
        name = <<"普通怪物31">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 4801, mp_lim = 3495, inner_att = 149, outer_att = 149, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 22
    };
get(270032) ->
    #mon{
        mid = 270032,
        name = <<"普通怪物32">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 5051, mp_lim = 3601, inner_att = 156, outer_att = 156, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 22
    };
get(270033) ->
    #mon{
        mid = 270033,
        name = <<"普通怪物33">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 5342, mp_lim = 3712, inner_att = 165, outer_att = 165, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 23
    };
get(270034) ->
    #mon{
        mid = 270034,
        name = <<"普通怪物34">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 5606, mp_lim = 3817, inner_att = 172, outer_att = 172, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 24
    };
get(270035) ->
    #mon{
        mid = 270035,
        name = <<"普通怪物35">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 5912, mp_lim = 3928, inner_att = 181, outer_att = 181, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 25
    };
get(270036) ->
    #mon{
        mid = 270036,
        name = <<"普通怪物36">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 6190, mp_lim = 4034, inner_att = 190, outer_att = 190, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 25
    };
get(270037) ->
    #mon{
        mid = 270037,
        name = <<"普通怪物37">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 6649, mp_lim = 4145, inner_att = 203, outer_att = 203, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 26
    };
get(270038) ->
    #mon{
        mid = 270038,
        name = <<"普通怪物38">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 7085, mp_lim = 4250, inner_att = 216, outer_att = 216, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 27
    };
get(270039) ->
    #mon{
        mid = 270039,
        name = <<"普通怪物39">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 7575, mp_lim = 4361, inner_att = 231, outer_att = 231, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 27
    };
get(270040) ->
    #mon{
        mid = 270040,
        name = <<"普通怪物40">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 8038, mp_lim = 4467, inner_att = 244, outer_att = 244, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 28
    };
get(270041) ->
    #mon{
        mid = 270041,
        name = <<"普通怪物41">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 8557, mp_lim = 4578, inner_att = 260, outer_att = 260, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 29
    };
get(270042) ->
    #mon{
        mid = 270042,
        name = <<"普通怪物42">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 9047, mp_lim = 4683, inner_att = 274, outer_att = 274, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 29
    };
get(270043) ->
    #mon{
        mid = 270043,
        name = <<"普通怪物43">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 9597, mp_lim = 4794, inner_att = 290, outer_att = 290, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 30
    };
get(270044) ->
    #mon{
        mid = 270044,
        name = <<"普通怪物44">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 10114, mp_lim = 4900, inner_att = 305, outer_att = 305, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 31
    };
get(270045) ->
    #mon{
        mid = 270045,
        name = <<"普通怪物45">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 10694, mp_lim = 5011, inner_att = 322, outer_att = 322, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 32
    };
get(270046) ->
    #mon{
        mid = 270046,
        name = <<"普通怪物46">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 11238, mp_lim = 5116, inner_att = 338, outer_att = 338, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 32
    };
get(270047) ->
    #mon{
        mid = 270047,
        name = <<"普通怪物47">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 11848, mp_lim = 5227, inner_att = 356, outer_att = 356, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 33
    };
get(270048) ->
    #mon{
        mid = 270048,
        name = <<"普通怪物48">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 12419, mp_lim = 5333, inner_att = 372, outer_att = 372, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 34
    };
get(270049) ->
    #mon{
        mid = 270049,
        name = <<"普通怪物49">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 13060, mp_lim = 5444, inner_att = 391, outer_att = 391, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 35
    };
get(270050) ->
    #mon{
        mid = 270050,
        name = <<"普通怪物50">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 13658, mp_lim = 5549, inner_att = 408, outer_att = 408, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 36
    };
get(270051) ->
    #mon{
        mid = 270051,
        name = <<"普通怪物51">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 14328, mp_lim = 5660, inner_att = 428, outer_att = 428, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 38
    };
get(270052) ->
    #mon{
        mid = 270052,
        name = <<"普通怪物52">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 14953, mp_lim = 5766, inner_att = 446, outer_att = 446, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 39
    };
get(270053) ->
    #mon{
        mid = 270053,
        name = <<"普通怪物53">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 15654, mp_lim = 5877, inner_att = 466, outer_att = 466, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 41
    };
get(270054) ->
    #mon{
        mid = 270054,
        name = <<"普通怪物54">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 16306, mp_lim = 5982, inner_att = 485, outer_att = 485, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 43
    };
get(270055) ->
    #mon{
        mid = 270055,
        name = <<"普通怪物55">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 17036, mp_lim = 6093, inner_att = 506, outer_att = 506, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 45
    };
get(270056) ->
    #mon{
        mid = 270056,
        name = <<"普通怪物56">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 17715, mp_lim = 6199, inner_att = 526, outer_att = 526, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 47
    };
get(270057) ->
    #mon{
        mid = 270057,
        name = <<"普通怪物57">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 18476, mp_lim = 6310, inner_att = 548, outer_att = 548, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 49
    };
get(270058) ->
    #mon{
        mid = 270058,
        name = <<"普通怪物58">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 19182, mp_lim = 6415, inner_att = 568, outer_att = 568, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 51
    };
get(270059) ->
    #mon{
        mid = 270059,
        name = <<"普通怪物59">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 19973, mp_lim = 6526, inner_att = 590, outer_att = 590, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 53
    };
get(270060) ->
    #mon{
        mid = 270060,
        name = <<"普通怪物60">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 20706, mp_lim = 6632, inner_att = 612, outer_att = 612, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 55
    };
get(270061) ->
    #mon{
        mid = 270061,
        name = <<"普通怪物61">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 21527, mp_lim = 6743, inner_att = 636, outer_att = 636, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 57
    };
get(270062) ->
    #mon{
        mid = 270062,
        name = <<"普通怪物62">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 22287, mp_lim = 6848, inner_att = 657, outer_att = 657, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 60
    };
get(270063) ->
    #mon{
        mid = 270063,
        name = <<"普通怪物63">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 23139, mp_lim = 6959, inner_att = 681, outer_att = 681, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 62
    };
get(270064) ->
    #mon{
        mid = 270064,
        name = <<"普通怪物64">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 23926, mp_lim = 7065, inner_att = 704, outer_att = 704, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 64
    };
get(270065) ->
    #mon{
        mid = 270065,
        name = <<"普通怪物65">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 24807, mp_lim = 7176, inner_att = 729, outer_att = 729, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 66
    };
get(270066) ->
    #mon{
        mid = 270066,
        name = <<"普通怪物66">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 25621, mp_lim = 7281, inner_att = 753, outer_att = 753, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 68
    };
get(270067) ->
    #mon{
        mid = 270067,
        name = <<"普通怪物67">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 26533, mp_lim = 7392, inner_att = 779, outer_att = 779, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 70
    };
get(270068) ->
    #mon{
        mid = 270068,
        name = <<"普通怪物68">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 27374, mp_lim = 7498, inner_att = 804, outer_att = 804, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 72
    };
get(270069) ->
    #mon{
        mid = 270069,
        name = <<"普通怪物69">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 28315, mp_lim = 7609, inner_att = 830, outer_att = 830, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 74
    };
get(270070) ->
    #mon{
        mid = 270070,
        name = <<"普通怪物70">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 29183, mp_lim = 7714, inner_att = 855, outer_att = 855, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 76
    };
get(270071) ->
    #mon{
        mid = 270071,
        name = <<"普通怪物71">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 30155, mp_lim = 7825, inner_att = 883, outer_att = 883, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 86
    };
get(270072) ->
    #mon{
        mid = 270072,
        name = <<"普通怪物72">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 31050, mp_lim = 7931, inner_att = 908, outer_att = 908, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 95
    };
get(270073) ->
    #mon{
        mid = 270073,
        name = <<"普通怪物73">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 32052, mp_lim = 8042, inner_att = 936, outer_att = 936, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 102
    };
get(270074) ->
    #mon{
        mid = 270074,
        name = <<"普通怪物74">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 32974, mp_lim = 8147, inner_att = 964, outer_att = 964, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 110
    };
get(270075) ->
    #mon{
        mid = 270075,
        name = <<"普通怪物75">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 33869, mp_lim = 8258, inner_att = 988, outer_att = 988, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 118
    };
get(270076) ->
    #mon{
        mid = 270076,
        name = <<"普通怪物76">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 34678, mp_lim = 8364, inner_att = 1012, outer_att = 1012, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 127
    };
get(270077) ->
    #mon{
        mid = 270077,
        name = <<"普通怪物77">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 35595, mp_lim = 8475, inner_att = 1037, outer_att = 1037, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 136
    };
get(270078) ->
    #mon{
        mid = 270078,
        name = <<"普通怪物78">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 36425, mp_lim = 8580, inner_att = 1062, outer_att = 1062, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 145
    };
get(270079) ->
    #mon{
        mid = 270079,
        name = <<"普通怪物79">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 37365, mp_lim = 8691, inner_att = 1088, outer_att = 1088, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 155
    };
get(270080) ->
    #mon{
        mid = 270080,
        name = <<"普通怪物80">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 38214, mp_lim = 8797, inner_att = 1112, outer_att = 1112, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 165
    };
get(270081) ->
    #mon{
        mid = 270081,
        name = <<"普通怪物81">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 39177, mp_lim = 8908, inner_att = 1139, outer_att = 1139, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 171
    };
get(270082) ->
    #mon{
        mid = 270082,
        name = <<"普通怪物82">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 40046, mp_lim = 9013, inner_att = 1164, outer_att = 1164, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 179
    };
get(270083) ->
    #mon{
        mid = 270083,
        name = <<"普通怪物83">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 41032, mp_lim = 9124, inner_att = 1192, outer_att = 1192, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 187
    };
get(270084) ->
    #mon{
        mid = 270084,
        name = <<"普通怪物84">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 41922, mp_lim = 9230, inner_att = 1218, outer_att = 1218, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 195
    };
get(270085) ->
    #mon{
        mid = 270085,
        name = <<"普通怪物85">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 42929, mp_lim = 9341, inner_att = 1245, outer_att = 1245, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 204
    };
get(270086) ->
    #mon{
        mid = 270086,
        name = <<"普通怪物86">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 43840, mp_lim = 9446, inner_att = 1272, outer_att = 1272, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 213
    };
get(270087) ->
    #mon{
        mid = 270087,
        name = <<"普通怪物87">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 44870, mp_lim = 9557, inner_att = 1300, outer_att = 1300, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 225
    };
get(270088) ->
    #mon{
        mid = 270088,
        name = <<"普通怪物88">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 45800, mp_lim = 9663, inner_att = 1328, outer_att = 1328, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 237
    };
get(270089) ->
    #mon{
        mid = 270089,
        name = <<"普通怪物89">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 46853, mp_lim = 9774, inner_att = 1356, outer_att = 1356, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 249
    };
get(270090) ->
    #mon{
        mid = 270090,
        name = <<"普通怪物90">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 47804, mp_lim = 9879, inner_att = 1384, outer_att = 1384, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 261
    };
get(270091) ->
    #mon{
        mid = 270091,
        name = <<"普通怪物91">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 49046, mp_lim = 9990, inner_att = 1414, outer_att = 1414, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 273
    };
get(270092) ->
    #mon{
        mid = 270092,
        name = <<"普通怪物92">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 50185, mp_lim = 10096, inner_att = 1442, outer_att = 1442, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 288
    };
get(270093) ->
    #mon{
        mid = 270093,
        name = <<"普通怪物93">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 51457, mp_lim = 10207, inner_att = 1472, outer_att = 1472, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 303
    };
get(270094) ->
    #mon{
        mid = 270094,
        name = <<"普通怪物94">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 52624, mp_lim = 10312, inner_att = 1501, outer_att = 1501, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 318
    };
get(270095) ->
    #mon{
        mid = 270095,
        name = <<"普通怪物95">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 53925, mp_lim = 10423, inner_att = 1532, outer_att = 1532, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 333
    };
get(270096) ->
    #mon{
        mid = 270096,
        name = <<"普通怪物96">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 55119, mp_lim = 10529, inner_att = 1562, outer_att = 1562, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 348
    };
get(270097) ->
    #mon{
        mid = 270097,
        name = <<"普通怪物97">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 56451, mp_lim = 10640, inner_att = 1593, outer_att = 1593, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 363
    };
get(270098) ->
    #mon{
        mid = 270098,
        name = <<"普通怪物98">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 57672, mp_lim = 10745, inner_att = 1624, outer_att = 1624, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 380
    };
get(270099) ->
    #mon{
        mid = 270099,
        name = <<"普通怪物99">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 59034, mp_lim = 10856, inner_att = 1656, outer_att = 1656, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 397
    };
get(270100) ->
    #mon{
        mid = 270100,
        name = <<"普通怪物100">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 60281, mp_lim = 10962, inner_att = 1686, outer_att = 1686, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 415
    };
get(271001) ->
    #mon{
        mid = 271001,
        name = <<"古墓怪物1">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 477, mp_lim = 49, inner_att = 22, outer_att = 22, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 100
    };
get(271002) ->
    #mon{
        mid = 271002,
        name = <<"古墓怪物2">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 645, mp_lim = 353, inner_att = 26, outer_att = 26, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 100
    };
get(271003) ->
    #mon{
        mid = 271003,
        name = <<"古墓怪物3">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 861, mp_lim = 464, inner_att = 29, outer_att = 29, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 100
    };
get(271101) ->
    #mon{
        mid = 271101,
        name = <<"猎人">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 8035, mp_lim = 2846, inner_att = 172, outer_att = 172, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 63
    };
get(271102) ->
    #mon{
        mid = 271102,
        name = <<"猎人">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 9129, mp_lim = 3062, inner_att = 195, outer_att = 195, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 68
    };
get(271103) ->
    #mon{
        mid = 271103,
        name = <<"偃师">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 10860, mp_lim = 3384, inner_att = 230, outer_att = 230, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 75
    };
get(271104) ->
    #mon{
        mid = 271104,
        name = <<"偃师">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 12122, mp_lim = 3601, inner_att = 254, outer_att = 254, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 80
    };
get(271105) ->
    #mon{
        mid = 271105,
        name = <<"猎人">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 14188, mp_lim = 3928, inner_att = 295, outer_att = 295, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 88
    };
get(271106) ->
    #mon{
        mid = 271106,
        name = <<"猎人">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 15957, mp_lim = 4145, inner_att = 330, outer_att = 330, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 93
    };
get(271107) ->
    #mon{
        mid = 271107,
        name = <<"偃师">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 19291, mp_lim = 4467, inner_att = 397, outer_att = 397, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 100
    };
get(271108) ->
    #mon{
        mid = 271108,
        name = <<"偃师">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 21712, mp_lim = 4683, inner_att = 445, outer_att = 445, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 105
    };
get(271109) ->
    #mon{
        mid = 271109,
        name = <<"偃师">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 23032, mp_lim = 4794, inner_att = 471, outer_att = 471, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 108
    };
get(271110) ->
    #mon{
        mid = 271110,
        name = <<"偃师">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 25665, mp_lim = 5011, inner_att = 523, outer_att = 523, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 113
    };
get(271201) ->
    #mon{
        mid = 271201,
        name = <<"古墓灵蛇">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 25665, mp_lim = 5011, inner_att = 523, outer_att = 523, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 113
    };
get(271202) ->
    #mon{
        mid = 271202,
        name = <<"古墓灵蛇">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 28435, mp_lim = 5227, inner_att = 578, outer_att = 578, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 118
    };
get(271203) ->
    #mon{
        mid = 271203,
        name = <<"古墓魔貂">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 32779, mp_lim = 5549, inner_att = 664, outer_att = 664, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 130
    };
get(271204) ->
    #mon{
        mid = 271204,
        name = <<"古墓魔貂">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 35887, mp_lim = 5766, inner_att = 725, outer_att = 725, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 140
    };
get(271205) ->
    #mon{
        mid = 271205,
        name = <<"帝魂">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 40886, mp_lim = 6093, inner_att = 822, outer_att = 822, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 160
    };
get(271206) ->
    #mon{
        mid = 271206,
        name = <<"帝魂">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 44342, mp_lim = 6310, inner_att = 890, outer_att = 890, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 175
    };
get(271207) ->
    #mon{
        mid = 271207,
        name = <<"帝魂">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 46036, mp_lim = 6415, inner_att = 924, outer_att = 924, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 183
    };
get(271208) ->
    #mon{
        mid = 271208,
        name = <<"帝魂">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 47935, mp_lim = 6526, inner_att = 959, outer_att = 959, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 190
    };
get(271209) ->
    #mon{
        mid = 271209,
        name = <<"帝魂">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 49694, mp_lim = 6632, inner_att = 994, outer_att = 994, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 198
    };
get(271210) ->
    #mon{
        mid = 271210,
        name = <<"葬妃">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 49694, mp_lim = 6632, inner_att = 994, outer_att = 994, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 198
    };
get(271301) ->
    #mon{
        mid = 271301,
        name = <<"葬妃">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 49694, mp_lim = 6632, inner_att = 994, outer_att = 994, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 198
    };
get(271302) ->
    #mon{
        mid = 271302,
        name = <<"古墓方士">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 53488, mp_lim = 6848, inner_att = 1068, outer_att = 1068, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 213
    };
get(271303) ->
    #mon{
        mid = 271303,
        name = <<"古墓方士">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 59536, mp_lim = 7176, inner_att = 1185, outer_att = 1185, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 235
    };
get(271304) ->
    #mon{
        mid = 271304,
        name = <<"葬妃">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 63679, mp_lim = 7392, inner_att = 1266, outer_att = 1266, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 250
    };
get(271305) ->
    #mon{
        mid = 271305,
        name = <<"葬妃">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 70039, mp_lim = 7714, inner_att = 1389, outer_att = 1389, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 273
    };
get(271306) ->
    #mon{
        mid = 271306,
        name = <<"葬妃">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 74520, mp_lim = 7931, inner_att = 1476, outer_att = 1476, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 298
    };
get(271307) ->
    #mon{
        mid = 271307,
        name = <<"葬妃">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 76924, mp_lim = 8042, inner_att = 1522, outer_att = 1522, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 310
    };
get(271308) ->
    #mon{
        mid = 271308,
        name = <<"葬妃">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 79137, mp_lim = 8147, inner_att = 1566, outer_att = 1566, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 323
    };
get(271309) ->
    #mon{
        mid = 271309,
        name = <<"葬妃">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 81285, mp_lim = 8258, inner_att = 1606, outer_att = 1606, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 338
    };
get(271310) ->
    #mon{
        mid = 271310,
        name = <<"駮马">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 81285, mp_lim = 8258, inner_att = 1606, outer_att = 1606, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 338
    };
get(271401) ->
    #mon{
        mid = 271401,
        name = <<"駮马">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 81285, mp_lim = 8258, inner_att = 1606, outer_att = 1606, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 338
    };
get(271402) ->
    #mon{
        mid = 271402,
        name = <<"駮马">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 85428, mp_lim = 8475, inner_att = 1686, outer_att = 1686, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 368
    };
get(271403) ->
    #mon{
        mid = 271403,
        name = <<"駮马">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 91713, mp_lim = 8797, inner_att = 1808, outer_att = 1808, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 413
    };
get(271404) ->
    #mon{
        mid = 271404,
        name = <<"古墓术士">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 96110, mp_lim = 9013, inner_att = 1892, outer_att = 1892, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 448
    };
get(271405) ->
    #mon{
        mid = 271405,
        name = <<"古墓术士">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 103029, mp_lim = 9341, inner_att = 2024, outer_att = 2024, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 510
    };
get(271406) ->
    #mon{
        mid = 271406,
        name = <<"古墓术士">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 107688, mp_lim = 9557, inner_att = 2113, outer_att = 2113, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 563
    };
get(271407) ->
    #mon{
        mid = 271407,
        name = <<"古墓术士">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 109920, mp_lim = 9663, inner_att = 2158, outer_att = 2158, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 593
    };
get(271408) ->
    #mon{
        mid = 271408,
        name = <<"古墓术士">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 112447, mp_lim = 9774, inner_att = 2204, outer_att = 2204, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 623
    };
get(271409) ->
    #mon{
        mid = 271409,
        name = <<"古墓术士">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 114729, mp_lim = 9879, inner_att = 2250, outer_att = 2250, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 653
    };
get(271410) ->
    #mon{
        mid = 271410,
        name = <<"穷奇">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 114729, mp_lim = 9879, inner_att = 2250, outer_att = 2250, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 653
    };
get(271501) ->
    #mon{
        mid = 271501,
        name = <<"穷奇">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 114729, mp_lim = 9879, inner_att = 2250, outer_att = 2250, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 653
    };
get(271502) ->
    #mon{
        mid = 271502,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 117710, mp_lim = 9990, inner_att = 2298, outer_att = 2298, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 683
    };
get(271503) ->
    #mon{
        mid = 271503,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 123496, mp_lim = 10207, inner_att = 2393, outer_att = 2393, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 758
    };
get(271504) ->
    #mon{
        mid = 271504,
        name = <<"穷奇">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 126297, mp_lim = 10312, inner_att = 2440, outer_att = 2440, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 795
    };
get(271505) ->
    #mon{
        mid = 271505,
        name = <<"穷奇">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 129420, mp_lim = 10423, inner_att = 2490, outer_att = 2490, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 833
    };
get(271506) ->
    #mon{
        mid = 271506,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 132285, mp_lim = 10529, inner_att = 2538, outer_att = 2538, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 870
    };
get(271507) ->
    #mon{
        mid = 271507,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 135482, mp_lim = 10640, inner_att = 2589, outer_att = 2589, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 908
    };
get(271508) ->
    #mon{
        mid = 271508,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 138412, mp_lim = 10745, inner_att = 2639, outer_att = 2639, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 950
    };
get(271509) ->
    #mon{
        mid = 271509,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 141681, mp_lim = 10856, inner_att = 2691, outer_att = 2691, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 993
    };
get(271510) ->
    #mon{
        mid = 271510,
        name = <<"古墓将灵">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 144674, mp_lim = 10962, inner_att = 2740, outer_att = 2740, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1038
    };
get(272101) ->
    #mon{
        mid = 272101,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 21941, mp_lim = 4145, inner_att = 457, outer_att = 457, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 111
    };
get(272102) ->
    #mon{
        mid = 272102,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 23380, mp_lim = 4250, inner_att = 487, outer_att = 487, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 114
    };
get(272103) ->
    #mon{
        mid = 272103,
        name = <<"墨虎">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 24997, mp_lim = 4361, inner_att = 520, outer_att = 520, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 117
    };
get(272104) ->
    #mon{
        mid = 272104,
        name = <<"墨虎">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 26525, mp_lim = 4467, inner_att = 550, outer_att = 550, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 120
    };
get(272105) ->
    #mon{
        mid = 272105,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 28238, mp_lim = 4578, inner_att = 585, outer_att = 585, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 123
    };
get(272106) ->
    #mon{
        mid = 272106,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 29855, mp_lim = 4683, inner_att = 617, outer_att = 617, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 126
    };
get(272107) ->
    #mon{
        mid = 272107,
        name = <<"墨虎">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 31670, mp_lim = 4794, inner_att = 653, outer_att = 653, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 129
    };
get(272108) ->
    #mon{
        mid = 272108,
        name = <<"墨虎">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 33376, mp_lim = 4900, inner_att = 687, outer_att = 687, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 132
    };
get(272109) ->
    #mon{
        mid = 272109,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272110) ->
    #mon{
        mid = 272110,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272111) ->
    #mon{
        mid = 272111,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272112) ->
    #mon{
        mid = 272112,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272113) ->
    #mon{
        mid = 272113,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272114) ->
    #mon{
        mid = 272114,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272115) ->
    #mon{
        mid = 272115,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272116) ->
    #mon{
        mid = 272116,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272117) ->
    #mon{
        mid = 272117,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272118) ->
    #mon{
        mid = 272118,
        name = <<"盗墓贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272119) ->
    #mon{
        mid = 272119,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272120) ->
    #mon{
        mid = 272120,
        name = <<"墨虎">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272201) ->
    #mon{
        mid = 272201,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 35290, mp_lim = 5011, inner_att = 725, outer_att = 725, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 135
    };
get(272202) ->
    #mon{
        mid = 272202,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 39098, mp_lim = 5227, inner_att = 801, outer_att = 801, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 141
    };
get(272203) ->
    #mon{
        mid = 272203,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 43098, mp_lim = 5444, inner_att = 880, outer_att = 880, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 150
    };
get(272204) ->
    #mon{
        mid = 272204,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 47282, mp_lim = 5660, inner_att = 963, outer_att = 963, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 162
    };
get(272205) ->
    #mon{
        mid = 272205,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 51658, mp_lim = 5877, inner_att = 1049, outer_att = 1049, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 174
    };
get(272206) ->
    #mon{
        mid = 272206,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 56218, mp_lim = 6093, inner_att = 1139, outer_att = 1139, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 192
    };
get(272207) ->
    #mon{
        mid = 272207,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 60970, mp_lim = 6310, inner_att = 1233, outer_att = 1233, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 210
    };
get(272208) ->
    #mon{
        mid = 272208,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272209) ->
    #mon{
        mid = 272209,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272210) ->
    #mon{
        mid = 272210,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272211) ->
    #mon{
        mid = 272211,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272212) ->
    #mon{
        mid = 272212,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272213) ->
    #mon{
        mid = 272213,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272214) ->
    #mon{
        mid = 272214,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272215) ->
    #mon{
        mid = 272215,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272216) ->
    #mon{
        mid = 272216,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272217) ->
    #mon{
        mid = 272217,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272218) ->
    #mon{
        mid = 272218,
        name = <<"大秦卫士">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272219) ->
    #mon{
        mid = 272219,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272220) ->
    #mon{
        mid = 272220,
        name = <<"皇陵工匠">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 65910, mp_lim = 6526, inner_att = 1328, outer_att = 1328, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 228
    };
get(272301) ->
    #mon{
        mid = 272301,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 68329, mp_lim = 6632, inner_att = 1377, outer_att = 1377, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 237
    };
get(272302) ->
    #mon{
        mid = 272302,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 73547, mp_lim = 6848, inner_att = 1479, outer_att = 1479, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 255
    };
get(272303) ->
    #mon{
        mid = 272303,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 78955, mp_lim = 7065, inner_att = 1585, outer_att = 1585, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 273
    };
get(272304) ->
    #mon{
        mid = 272304,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 84549, mp_lim = 7281, inner_att = 1695, outer_att = 1695, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 291
    };
get(272305) ->
    #mon{
        mid = 272305,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 90334, mp_lim = 7498, inner_att = 1809, outer_att = 1809, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 309
    };
get(272306) ->
    #mon{
        mid = 272306,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 96303, mp_lim = 7714, inner_att = 1924, outer_att = 1924, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 327
    };
get(272307) ->
    #mon{
        mid = 272307,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 102465, mp_lim = 7931, inner_att = 2044, outer_att = 2044, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 357
    };
get(272308) ->
    #mon{
        mid = 272308,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272309) ->
    #mon{
        mid = 272309,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272310) ->
    #mon{
        mid = 272310,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272311) ->
    #mon{
        mid = 272311,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272312) ->
    #mon{
        mid = 272312,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272313) ->
    #mon{
        mid = 272313,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272314) ->
    #mon{
        mid = 272314,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272315) ->
    #mon{
        mid = 272315,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272316) ->
    #mon{
        mid = 272316,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272317) ->
    #mon{
        mid = 272317,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272318) ->
    #mon{
        mid = 272318,
        name = <<"大秦护卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272319) ->
    #mon{
        mid = 272319,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272320) ->
    #mon{
        mid = 272320,
        name = <<"大秦侍卫">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 108814, mp_lim = 8147, inner_att = 2169, outer_att = 2169, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 387
    };
get(272401) ->
    #mon{
        mid = 272401,
        name = <<"秦姬">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 111767, mp_lim = 8258, inner_att = 2224, outer_att = 2224, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 405
    };
get(272402) ->
    #mon{
        mid = 272402,
        name = <<"秦姬">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 117463, mp_lim = 8475, inner_att = 2334, outer_att = 2334, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 441
    };
get(272403) ->
    #mon{
        mid = 272403,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 123304, mp_lim = 8691, inner_att = 2448, outer_att = 2448, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 477
    };
get(272404) ->
    #mon{
        mid = 272404,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 129284, mp_lim = 8908, inner_att = 2563, outer_att = 2563, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 513
    };
get(272405) ->
    #mon{
        mid = 272405,
        name = <<"秦姬">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 135405, mp_lim = 9124, inner_att = 2682, outer_att = 2682, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 561
    };
get(272406) ->
    #mon{
        mid = 272406,
        name = <<"秦姬">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 141665, mp_lim = 9341, inner_att = 2802, outer_att = 2802, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 612
    };
get(272407) ->
    #mon{
        mid = 272407,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 148071, mp_lim = 9557, inner_att = 2926, outer_att = 2926, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 675
    };
get(272408) ->
    #mon{
        mid = 272408,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272409) ->
    #mon{
        mid = 272409,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272410) ->
    #mon{
        mid = 272410,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272411) ->
    #mon{
        mid = 272411,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272412) ->
    #mon{
        mid = 272412,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272413) ->
    #mon{
        mid = 272413,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272414) ->
    #mon{
        mid = 272414,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272415) ->
    #mon{
        mid = 272415,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272416) ->
    #mon{
        mid = 272416,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272417) ->
    #mon{
        mid = 272417,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272418) ->
    #mon{
        mid = 272418,
        name = <<"秦姬">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272419) ->
    #mon{
        mid = 272419,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272420) ->
    #mon{
        mid = 272420,
        name = <<"秦宫守卫">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 154614, mp_lim = 9774, inner_att = 3052, outer_att = 3052, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 747
    };
get(272501) ->
    #mon{
        mid = 272501,
        name = <<"龙灵">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 157753, mp_lim = 9879, inner_att = 3115, outer_att = 3115, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 783
    };
get(272502) ->
    #mon{
        mid = 272502,
        name = <<"龙灵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 161851, mp_lim = 9990, inner_att = 3182, outer_att = 3182, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 819
    };
get(272503) ->
    #mon{
        mid = 272503,
        name = <<"大秦战将">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 165610, mp_lim = 10096, inner_att = 3245, outer_att = 3245, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 864
    };
get(272504) ->
    #mon{
        mid = 272504,
        name = <<"大秦战将">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 169808, mp_lim = 10207, inner_att = 3313, outer_att = 3313, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 909
    };
get(272505) ->
    #mon{
        mid = 272505,
        name = <<"龙灵">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 173659, mp_lim = 10312, inner_att = 3378, outer_att = 3378, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 954
    };
get(272506) ->
    #mon{
        mid = 272506,
        name = <<"龙灵">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 177952, mp_lim = 10423, inner_att = 3448, outer_att = 3448, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 999
    };
get(272507) ->
    #mon{
        mid = 272507,
        name = <<"大秦战将">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 181892, mp_lim = 10529, inner_att = 3515, outer_att = 3515, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1044
    };
get(272508) ->
    #mon{
        mid = 272508,
        name = <<"大秦战将">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 186288, mp_lim = 10640, inner_att = 3585, outer_att = 3585, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1089
    };
get(272509) ->
    #mon{
        mid = 272509,
        name = <<"龙灵">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 190317, mp_lim = 10745, inner_att = 3654, outer_att = 3654, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1140
    };
get(272510) ->
    #mon{
        mid = 272510,
        name = <<"龙灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272511) ->
    #mon{
        mid = 272511,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272512) ->
    #mon{
        mid = 272512,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272513) ->
    #mon{
        mid = 272513,
        name = <<"龙灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272514) ->
    #mon{
        mid = 272514,
        name = <<"龙灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272515) ->
    #mon{
        mid = 272515,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272516) ->
    #mon{
        mid = 272516,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272517) ->
    #mon{
        mid = 272517,
        name = <<"龙灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272518) ->
    #mon{
        mid = 272518,
        name = <<"龙灵">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272519) ->
    #mon{
        mid = 272519,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(272520) ->
    #mon{
        mid = 272520,
        name = <<"大秦战将">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 194812, mp_lim = 10856, inner_att = 3726, outer_att = 3726, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 20,
        trace_area = 50,
        drop = 279000,
        revive = 15000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 1191
    };
get(275001) ->
    #mon{
        mid = 275001,
        name = <<"守卫战怪物1">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 10044, mp_lim = 2846, inner_att = 133, outer_att = 133, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
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
get(275002) ->
    #mon{
        mid = 275002,
        name = <<"守卫战怪物2">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 10674, mp_lim = 2951, inner_att = 141, outer_att = 141, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
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
get(275003) ->
    #mon{
        mid = 275003,
        name = <<"守卫战怪物3">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 10674, mp_lim = 2951, inner_att = 141, outer_att = 141, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
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
get(275004) ->
    #mon{
        mid = 275004,
        name = <<"守卫战怪物4">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
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
get(275005) ->
    #mon{
        mid = 275005,
        name = <<"守卫战怪物5">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
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
get(275006) ->
    #mon{
        mid = 275006,
        name = <<"守卫战怪物6">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 12081, mp_lim = 3168, inner_att = 159, outer_att = 159, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
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
get(275007) ->
    #mon{
        mid = 275007,
        name = <<"守卫战怪物7">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 12081, mp_lim = 3168, inner_att = 159, outer_att = 159, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
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
get(275008) ->
    #mon{
        mid = 275008,
        name = <<"守卫战怪物8">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 12864, mp_lim = 3279, inner_att = 168, outer_att = 168, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
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
get(275009) ->
    #mon{
        mid = 275009,
        name = <<"守卫战怪物9">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 12864, mp_lim = 3279, inner_att = 168, outer_att = 168, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
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
get(275010) ->
    #mon{
        mid = 275010,
        name = <<"守卫战怪物10">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
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
get(275011) ->
    #mon{
        mid = 275011,
        name = <<"守卫战怪物11">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
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
get(275012) ->
    #mon{
        mid = 275012,
        name = <<"守卫战怪物12">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 14403, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(275013) ->
    #mon{
        mid = 275013,
        name = <<"守卫战怪物13">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 14403, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(275014) ->
    #mon{
        mid = 275014,
        name = <<"守卫战怪物14">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 15153, mp_lim = 3601, inner_att = 196, outer_att = 196, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
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
get(275015) ->
    #mon{
        mid = 275015,
        name = <<"守卫战怪物15">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 15153, mp_lim = 3601, inner_att = 196, outer_att = 196, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
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
get(275016) ->
    #mon{
        mid = 275016,
        name = <<"守卫战怪物16">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
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
get(275017) ->
    #mon{
        mid = 275017,
        name = <<"守卫战怪物17">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
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
get(275018) ->
    #mon{
        mid = 275018,
        name = <<"守卫战怪物18">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 16818, mp_lim = 3817, inner_att = 216, outer_att = 216, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
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
get(275019) ->
    #mon{
        mid = 275019,
        name = <<"守卫战怪物19">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 16818, mp_lim = 3817, inner_att = 216, outer_att = 216, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
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
get(275020) ->
    #mon{
        mid = 275020,
        name = <<"守卫战怪物20">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 17736, mp_lim = 3928, inner_att = 227, outer_att = 227, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
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
get(275021) ->
    #mon{
        mid = 275021,
        name = <<"守卫战怪物21">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 17736, mp_lim = 3928, inner_att = 227, outer_att = 227, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
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
get(275022) ->
    #mon{
        mid = 275022,
        name = <<"守卫战怪物22">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
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
get(275023) ->
    #mon{
        mid = 275023,
        name = <<"守卫战怪物23">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
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
get(275024) ->
    #mon{
        mid = 275024,
        name = <<"守卫战怪物24">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 19947, mp_lim = 4145, inner_att = 254, outer_att = 254, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
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
get(275025) ->
    #mon{
        mid = 275025,
        name = <<"守卫战怪物25">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 19947, mp_lim = 4145, inner_att = 254, outer_att = 254, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
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
get(275026) ->
    #mon{
        mid = 275026,
        name = <<"守卫战怪物26">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 21255, mp_lim = 4250, inner_att = 271, outer_att = 271, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
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
get(275027) ->
    #mon{
        mid = 275027,
        name = <<"守卫战怪物27">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 21255, mp_lim = 4250, inner_att = 271, outer_att = 271, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
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
get(275028) ->
    #mon{
        mid = 275028,
        name = <<"守卫战怪物28">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
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
get(275029) ->
    #mon{
        mid = 275029,
        name = <<"守卫战怪物29">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
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
get(275030) ->
    #mon{
        mid = 275030,
        name = <<"守卫战怪物30">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 24114, mp_lim = 4467, inner_att = 306, outer_att = 306, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
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
get(275031) ->
    #mon{
        mid = 275031,
        name = <<"守卫战怪物31">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 24114, mp_lim = 4467, inner_att = 306, outer_att = 306, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
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
get(275032) ->
    #mon{
        mid = 275032,
        name = <<"守卫战怪物32">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 25671, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(275033) ->
    #mon{
        mid = 275033,
        name = <<"守卫战怪物33">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 25671, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(275034) ->
    #mon{
        mid = 275034,
        name = <<"守卫战怪物34">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
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
get(275035) ->
    #mon{
        mid = 275035,
        name = <<"守卫战怪物35">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
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
get(275036) ->
    #mon{
        mid = 275036,
        name = <<"守卫战怪物36">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 28791, mp_lim = 4794, inner_att = 363, outer_att = 363, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
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
get(275037) ->
    #mon{
        mid = 275037,
        name = <<"守卫战怪物37">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 28791, mp_lim = 4794, inner_att = 363, outer_att = 363, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
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
get(275038) ->
    #mon{
        mid = 275038,
        name = <<"守卫战怪物38">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 30342, mp_lim = 4900, inner_att = 382, outer_att = 382, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
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
get(275039) ->
    #mon{
        mid = 275039,
        name = <<"守卫战怪物39">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 30342, mp_lim = 4900, inner_att = 382, outer_att = 382, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
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
get(275040) ->
    #mon{
        mid = 275040,
        name = <<"守卫战怪物40">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(275041) ->
    #mon{
        mid = 275041,
        name = <<"守卫战怪物41">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(275042) ->
    #mon{
        mid = 275042,
        name = <<"守卫战怪物42">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 33714, mp_lim = 5116, inner_att = 423, outer_att = 423, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
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
get(275043) ->
    #mon{
        mid = 275043,
        name = <<"守卫战怪物43">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 33714, mp_lim = 5116, inner_att = 423, outer_att = 423, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
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
get(275044) ->
    #mon{
        mid = 275044,
        name = <<"守卫战怪物44">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 35544, mp_lim = 5227, inner_att = 445, outer_att = 445, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
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
get(275045) ->
    #mon{
        mid = 275045,
        name = <<"守卫战怪物45">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 35544, mp_lim = 5227, inner_att = 445, outer_att = 445, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
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
get(275046) ->
    #mon{
        mid = 275046,
        name = <<"守卫战怪物46">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
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
get(275047) ->
    #mon{
        mid = 275047,
        name = <<"守卫战怪物47">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
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
get(275048) ->
    #mon{
        mid = 275048,
        name = <<"守卫战怪物48">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 39180, mp_lim = 5444, inner_att = 489, outer_att = 489, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
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
get(275049) ->
    #mon{
        mid = 275049,
        name = <<"守卫战怪物49">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 39180, mp_lim = 5444, inner_att = 489, outer_att = 489, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
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
get(275050) ->
    #mon{
        mid = 275050,
        name = <<"守卫战怪物50">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 40974, mp_lim = 5549, inner_att = 511, outer_att = 511, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
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
get(275051) ->
    #mon{
        mid = 275051,
        name = <<"守卫战怪物51">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 40974, mp_lim = 5549, inner_att = 511, outer_att = 511, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
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
get(275052) ->
    #mon{
        mid = 275052,
        name = <<"守卫战怪物52">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(275053) ->
    #mon{
        mid = 275053,
        name = <<"守卫战怪物53">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(275054) ->
    #mon{
        mid = 275054,
        name = <<"守卫战怪物54">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 44859, mp_lim = 5766, inner_att = 558, outer_att = 558, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
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
get(275055) ->
    #mon{
        mid = 275055,
        name = <<"守卫战怪物55">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 44859, mp_lim = 5766, inner_att = 558, outer_att = 558, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
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
get(275056) ->
    #mon{
        mid = 275056,
        name = <<"守卫战怪物56">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 46962, mp_lim = 5877, inner_att = 583, outer_att = 583, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
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
get(275057) ->
    #mon{
        mid = 275057,
        name = <<"守卫战怪物57">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 46962, mp_lim = 5877, inner_att = 583, outer_att = 583, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
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
get(275058) ->
    #mon{
        mid = 275058,
        name = <<"守卫战怪物58">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
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
get(275059) ->
    #mon{
        mid = 275059,
        name = <<"守卫战怪物59">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
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
get(275060) ->
    #mon{
        mid = 275060,
        name = <<"守卫战怪物60">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 51108, mp_lim = 6093, inner_att = 633, outer_att = 633, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
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
get(275061) ->
    #mon{
        mid = 275061,
        name = <<"守卫战怪物61">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 51108, mp_lim = 6093, inner_att = 633, outer_att = 633, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
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
get(275062) ->
    #mon{
        mid = 275062,
        name = <<"守卫战怪物62">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 53145, mp_lim = 6199, inner_att = 658, outer_att = 658, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
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
get(275063) ->
    #mon{
        mid = 275063,
        name = <<"守卫战怪物63">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 53145, mp_lim = 6199, inner_att = 658, outer_att = 658, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
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
get(275064) ->
    #mon{
        mid = 275064,
        name = <<"守卫战怪物64">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
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
get(275065) ->
    #mon{
        mid = 275065,
        name = <<"守卫战怪物65">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
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
get(275066) ->
    #mon{
        mid = 275066,
        name = <<"守卫战怪物66">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 57546, mp_lim = 6415, inner_att = 711, outer_att = 711, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
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
get(275067) ->
    #mon{
        mid = 275067,
        name = <<"守卫战怪物67">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 57546, mp_lim = 6415, inner_att = 711, outer_att = 711, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
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
get(275068) ->
    #mon{
        mid = 275068,
        name = <<"守卫战怪物68">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 59919, mp_lim = 6526, inner_att = 738, outer_att = 738, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(275069) ->
    #mon{
        mid = 275069,
        name = <<"守卫战怪物69">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 59919, mp_lim = 6526, inner_att = 738, outer_att = 738, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(275070) ->
    #mon{
        mid = 275070,
        name = <<"守卫战怪物70">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
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
get(275071) ->
    #mon{
        mid = 275071,
        name = <<"守卫战怪物71">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
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
get(275072) ->
    #mon{
        mid = 275072,
        name = <<"守卫战怪物72">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 64581, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(276001) ->
    #mon{
        mid = 276001,
        name = <<"守卫战BOSS1">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 212768, mp_lim = 4145, inner_att = 1016, outer_att = 1016, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
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
get(276002) ->
    #mon{
        mid = 276002,
        name = <<"守卫战BOSS2">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 226720, mp_lim = 4250, inner_att = 1084, outer_att = 1084, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
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
get(276003) ->
    #mon{
        mid = 276003,
        name = <<"守卫战BOSS3">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 242400, mp_lim = 4361, inner_att = 1156, outer_att = 1156, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
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
get(276004) ->
    #mon{
        mid = 276004,
        name = <<"守卫战BOSS4">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 257216, mp_lim = 4467, inner_att = 1224, outer_att = 1224, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
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
get(276005) ->
    #mon{
        mid = 276005,
        name = <<"守卫战BOSS5">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 273824, mp_lim = 4578, inner_att = 1300, outer_att = 1300, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(276006) ->
    #mon{
        mid = 276006,
        name = <<"守卫战BOSS6">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 289504, mp_lim = 4683, inner_att = 1372, outer_att = 1372, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
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
get(276007) ->
    #mon{
        mid = 276007,
        name = <<"守卫战BOSS7">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 307104, mp_lim = 4794, inner_att = 1452, outer_att = 1452, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
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
get(276008) ->
    #mon{
        mid = 276008,
        name = <<"守卫战BOSS8">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 323648, mp_lim = 4900, inner_att = 1528, outer_att = 1528, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
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
get(276009) ->
    #mon{
        mid = 276009,
        name = <<"守卫战BOSS9">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276010) ->
    #mon{
        mid = 276010,
        name = <<"守卫战BOSS10">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276011) ->
    #mon{
        mid = 276011,
        name = <<"守卫战BOSS11">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276012) ->
    #mon{
        mid = 276012,
        name = <<"守卫战BOSS12">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276013) ->
    #mon{
        mid = 276013,
        name = <<"守卫战BOSS13">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276014) ->
    #mon{
        mid = 276014,
        name = <<"守卫战BOSS14">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276015) ->
    #mon{
        mid = 276015,
        name = <<"守卫战BOSS15">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276016) ->
    #mon{
        mid = 276016,
        name = <<"守卫战BOSS16">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276017) ->
    #mon{
        mid = 276017,
        name = <<"守卫战BOSS17">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276018) ->
    #mon{
        mid = 276018,
        name = <<"守卫战BOSS18">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276019) ->
    #mon{
        mid = 276019,
        name = <<"守卫战BOSS19">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276020) ->
    #mon{
        mid = 276020,
        name = <<"守卫战BOSS20">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276021) ->
    #mon{
        mid = 276021,
        name = <<"守卫战BOSS21">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(276022) ->
    #mon{
        mid = 276022,
        name = <<"守卫战BOSS22">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 379136, mp_lim = 5227, inner_att = 1780, outer_att = 1780, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
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
get(276023) ->
    #mon{
        mid = 276023,
        name = <<"守卫战BOSS23">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 417920, mp_lim = 5444, inner_att = 1956, outer_att = 1956, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
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
get(276024) ->
    #mon{
        mid = 276024,
        name = <<"守卫战BOSS24">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 2140, outer_att = 2140, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(276025) ->
    #mon{
        mid = 276025,
        name = <<"守卫战BOSS25">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 500928, mp_lim = 5877, inner_att = 2332, outer_att = 2332, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
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
get(276026) ->
    #mon{
        mid = 276026,
        name = <<"守卫战BOSS26">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 545152, mp_lim = 6093, inner_att = 2532, outer_att = 2532, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
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
get(276027) ->
    #mon{
        mid = 276027,
        name = <<"守卫战BOSS27">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 591232, mp_lim = 6310, inner_att = 2740, outer_att = 2740, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
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
get(276028) ->
    #mon{
        mid = 276028,
        name = <<"守卫战BOSS28">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276029) ->
    #mon{
        mid = 276029,
        name = <<"守卫战BOSS29">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276030) ->
    #mon{
        mid = 276030,
        name = <<"守卫战BOSS30">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276031) ->
    #mon{
        mid = 276031,
        name = <<"守卫战BOSS31">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276032) ->
    #mon{
        mid = 276032,
        name = <<"守卫战BOSS32">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276033) ->
    #mon{
        mid = 276033,
        name = <<"守卫战BOSS33">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276034) ->
    #mon{
        mid = 276034,
        name = <<"守卫战BOSS34">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276035) ->
    #mon{
        mid = 276035,
        name = <<"守卫战BOSS35">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276036) ->
    #mon{
        mid = 276036,
        name = <<"守卫战BOSS36">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276037) ->
    #mon{
        mid = 276037,
        name = <<"守卫战BOSS37">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276038) ->
    #mon{
        mid = 276038,
        name = <<"守卫战BOSS38">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276039) ->
    #mon{
        mid = 276039,
        name = <<"守卫战BOSS39">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276040) ->
    #mon{
        mid = 276040,
        name = <<"守卫战BOSS40">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 639136, mp_lim = 6526, inner_att = 2952, outer_att = 2952, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(276041) ->
    #mon{
        mid = 276041,
        name = <<"守卫战BOSS41">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 662592, mp_lim = 6632, inner_att = 3060, outer_att = 3060, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
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
get(276042) ->
    #mon{
        mid = 276042,
        name = <<"守卫战BOSS42">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 713184, mp_lim = 6848, inner_att = 3288, outer_att = 3288, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
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
get(276043) ->
    #mon{
        mid = 276043,
        name = <<"守卫战BOSS43">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 765632, mp_lim = 7065, inner_att = 3524, outer_att = 3524, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
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
get(276044) ->
    #mon{
        mid = 276044,
        name = <<"守卫战BOSS44">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 819872, mp_lim = 7281, inner_att = 3768, outer_att = 3768, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
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
get(276045) ->
    #mon{
        mid = 276045,
        name = <<"守卫战BOSS45">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 875968, mp_lim = 7498, inner_att = 4020, outer_att = 4020, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
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
get(276046) ->
    #mon{
        mid = 276046,
        name = <<"守卫战BOSS46">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 933856, mp_lim = 7714, inner_att = 4276, outer_att = 4276, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
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
get(276047) ->
    #mon{
        mid = 276047,
        name = <<"守卫战BOSS47">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 993600, mp_lim = 7931, inner_att = 4544, outer_att = 4544, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
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
get(276048) ->
    #mon{
        mid = 276048,
        name = <<"守卫战BOSS48">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 1055168, mp_lim = 8147, inner_att = 4820, outer_att = 4820, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(276049) ->
    #mon{
        mid = 276049,
        name = <<"守卫战BOSS49">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 1055168, mp_lim = 8147, inner_att = 4820, outer_att = 4820, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(276050) ->
    #mon{
        mid = 276050,
        name = <<"守卫战BOSS50">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 1055168, mp_lim = 8147, inner_att = 4820, outer_att = 4820, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(276051) ->
    #mon{
        mid = 276051,
        name = <<"守卫战BOSS51">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 1055168, mp_lim = 8147, inner_att = 4820, outer_att = 4820, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(276052) ->
    #mon{
        mid = 276052,
        name = <<"守卫战BOSS52">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 1055168, mp_lim = 8147, inner_att = 4820, outer_att = 4820, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(276053) ->
    #mon{
        mid = 276053,
        name = <<"守卫战BOSS53">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 408660, mp_lim = 8147, inner_att = 6220, outer_att = 6220, inner_def = 1337, outer_def = 1337, hit = 12933, dodge = 1197, crit_hurt = 1257, crit_def = 297, move_speed = 200},
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
get(276054) ->
    #mon{
        mid = 276054,
        name = <<"守卫战BOSS54">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276055) ->
    #mon{
        mid = 276055,
        name = <<"守卫战BOSS55">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276056) ->
    #mon{
        mid = 276056,
        name = <<"守卫战BOSS56">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276057) ->
    #mon{
        mid = 276057,
        name = <<"守卫战BOSS57">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276058) ->
    #mon{
        mid = 276058,
        name = <<"守卫战BOSS58">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276059) ->
    #mon{
        mid = 276059,
        name = <<"守卫战BOSS59">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276060) ->
    #mon{
        mid = 276060,
        name = <<"守卫战BOSS60">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 345420, mp_lim = 1402, inner_att = 7010, outer_att = 7010, inner_def = 1507, outer_def = 1507, hit = 14576, dodge = 1349, crit_hurt = 1417, crit_def = 335, move_speed = 200},
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
get(276061) ->
    #mon{
        mid = 276061,
        name = <<"守卫战BOSS61">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 354186, mp_lim = 1436, inner_att = 7180, outer_att = 7180, inner_def = 1544, outer_def = 1544, hit = 14924, dodge = 1381, crit_hurt = 1455, crit_def = 345, move_speed = 200},
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
get(276062) ->
    #mon{
        mid = 276062,
        name = <<"守卫战BOSS62">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 1139040, mp_lim = 8475, inner_att = 5188, outer_att = 5188, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
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
get(276063) ->
    #mon{
        mid = 276063,
        name = <<"守卫战BOSS63">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 1195680, mp_lim = 8691, inner_att = 5440, outer_att = 5440, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
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
get(276064) ->
    #mon{
        mid = 276064,
        name = <<"守卫战BOSS64">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 5696, outer_att = 5696, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(276065) ->
    #mon{
        mid = 276065,
        name = <<"守卫战BOSS65">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 1313024, mp_lim = 9124, inner_att = 5960, outer_att = 5960, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
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
get(276066) ->
    #mon{
        mid = 276066,
        name = <<"守卫战BOSS66">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 1373728, mp_lim = 9341, inner_att = 6228, outer_att = 6228, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
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
get(276067) ->
    #mon{
        mid = 276067,
        name = <<"守卫战BOSS67">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 1435840, mp_lim = 9557, inner_att = 6504, outer_att = 6504, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
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
get(276068) ->
    #mon{
        mid = 276068,
        name = <<"守卫战BOSS68">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1499296, mp_lim = 9774, inner_att = 6784, outer_att = 6784, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(276069) ->
    #mon{
        mid = 276069,
        name = <<"守卫战BOSS69">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1499296, mp_lim = 9774, inner_att = 6784, outer_att = 6784, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(276070) ->
    #mon{
        mid = 276070,
        name = <<"守卫战BOSS70">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1499296, mp_lim = 9774, inner_att = 6784, outer_att = 6784, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(276071) ->
    #mon{
        mid = 276071,
        name = <<"守卫战BOSS71">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1499296, mp_lim = 9774, inner_att = 6784, outer_att = 6784, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(276072) ->
    #mon{
        mid = 276072,
        name = <<"守卫战BOSS72">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1499296, mp_lim = 9774, inner_att = 6784, outer_att = 6784, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

