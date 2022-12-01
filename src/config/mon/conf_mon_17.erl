%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_17
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_17).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(170001) ->
    #mon{
        mid = 170001,
        name = <<"马贼">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 20420, mp_lim = 1219, inner_att = 96, outer_att = 96, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
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
get(170002) ->
    #mon{
        mid = 170002,
        name = <<"马贼">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 22820, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(170003) ->
    #mon{
        mid = 170003,
        name = <<"马贼">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 24900, mp_lim = 1436, inner_att = 112, outer_att = 112, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
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
get(170004) ->
    #mon{
        mid = 170004,
        name = <<"马贼">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 27460, mp_lim = 1547, inner_att = 120, outer_att = 120, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
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
get(170005) ->
    #mon{
        mid = 170005,
        name = <<"马贼">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 29660, mp_lim = 1652, inner_att = 130, outer_att = 130, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
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
get(170006) ->
    #mon{
        mid = 170006,
        name = <<"马贼">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 32360, mp_lim = 1763, inner_att = 138, outer_att = 138, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
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
get(170007) ->
    #mon{
        mid = 170007,
        name = <<"马贼">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 34720, mp_lim = 1869, inner_att = 148, outer_att = 148, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
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
get(170008) ->
    #mon{
        mid = 170008,
        name = <<"马贼">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 37560, mp_lim = 1980, inner_att = 158, outer_att = 158, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
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
get(170009) ->
    #mon{
        mid = 170009,
        name = <<"马贼">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 40060, mp_lim = 2085, inner_att = 168, outer_att = 168, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
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
get(170010) ->
    #mon{
        mid = 170010,
        name = <<"马贼">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 43060, mp_lim = 2196, inner_att = 178, outer_att = 178, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
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
get(170011) ->
    #mon{
        mid = 170011,
        name = <<"马贼">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 46440, mp_lim = 2302, inner_att = 192, outer_att = 192, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
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
get(170012) ->
    #mon{
        mid = 170012,
        name = <<"马贼">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 50440, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(170013) ->
    #mon{
        mid = 170013,
        name = <<"马贼">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 54120, mp_lim = 2518, inner_att = 220, outer_att = 220, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
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
get(170014) ->
    #mon{
        mid = 170014,
        name = <<"马贼">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 58420, mp_lim = 2629, inner_att = 236, outer_att = 236, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
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
get(170015) ->
    #mon{
        mid = 170015,
        name = <<"马贼">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 62360, mp_lim = 2735, inner_att = 250, outer_att = 250, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
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
get(170016) ->
    #mon{
        mid = 170016,
        name = <<"马贼">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 66960, mp_lim = 2846, inner_att = 266, outer_att = 266, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
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
get(170017) ->
    #mon{
        mid = 170017,
        name = <<"马贼">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 71160, mp_lim = 2951, inner_att = 282, outer_att = 282, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
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
get(170018) ->
    #mon{
        mid = 170018,
        name = <<"马贼">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 76080, mp_lim = 3062, inner_att = 300, outer_att = 300, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
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
get(170019) ->
    #mon{
        mid = 170019,
        name = <<"马贼">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 80540, mp_lim = 3168, inner_att = 318, outer_att = 318, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
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
get(170020) ->
    #mon{
        mid = 170020,
        name = <<"马贼">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 85760, mp_lim = 3279, inner_att = 336, outer_att = 336, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
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
get(170021) ->
    #mon{
        mid = 170021,
        name = <<"马贼">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 90500, mp_lim = 3384, inner_att = 354, outer_att = 354, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
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
get(170022) ->
    #mon{
        mid = 170022,
        name = <<"马贼">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 96020, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(170023) ->
    #mon{
        mid = 170023,
        name = <<"马贼">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 101020, mp_lim = 3601, inner_att = 392, outer_att = 392, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
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
get(170024) ->
    #mon{
        mid = 170024,
        name = <<"马贼">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 106840, mp_lim = 3712, inner_att = 414, outer_att = 414, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
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
get(170025) ->
    #mon{
        mid = 170025,
        name = <<"马贼">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 112120, mp_lim = 3817, inner_att = 432, outer_att = 432, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
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
get(170026) ->
    #mon{
        mid = 170026,
        name = <<"马贼">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 118240, mp_lim = 3928, inner_att = 454, outer_att = 454, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
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
get(170027) ->
    #mon{
        mid = 170027,
        name = <<"马贼">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 123800, mp_lim = 4034, inner_att = 476, outer_att = 476, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
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
get(170028) ->
    #mon{
        mid = 170028,
        name = <<"马贼">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 132980, mp_lim = 4145, inner_att = 508, outer_att = 508, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
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
get(170029) ->
    #mon{
        mid = 170029,
        name = <<"马贼">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 141700, mp_lim = 4250, inner_att = 542, outer_att = 542, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
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
get(170030) ->
    #mon{
        mid = 170030,
        name = <<"马贼">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 151500, mp_lim = 4361, inner_att = 578, outer_att = 578, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
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
get(170031) ->
    #mon{
        mid = 170031,
        name = <<"马贼">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 160760, mp_lim = 4467, inner_att = 612, outer_att = 612, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
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
get(170032) ->
    #mon{
        mid = 170032,
        name = <<"马贼">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 171140, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(170033) ->
    #mon{
        mid = 170033,
        name = <<"马贼">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 180940, mp_lim = 4683, inner_att = 686, outer_att = 686, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
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
get(170034) ->
    #mon{
        mid = 170034,
        name = <<"马贼">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 191940, mp_lim = 4794, inner_att = 726, outer_att = 726, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
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
get(170035) ->
    #mon{
        mid = 170035,
        name = <<"马贼">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 202280, mp_lim = 4900, inner_att = 764, outer_att = 764, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
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
get(170036) ->
    #mon{
        mid = 170036,
        name = <<"马贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 213880, mp_lim = 5011, inner_att = 806, outer_att = 806, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(170037) ->
    #mon{
        mid = 170037,
        name = <<"马贼">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 224760, mp_lim = 5116, inner_att = 846, outer_att = 846, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
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
get(170038) ->
    #mon{
        mid = 170038,
        name = <<"马贼">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 236960, mp_lim = 5227, inner_att = 890, outer_att = 890, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
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
get(170039) ->
    #mon{
        mid = 170039,
        name = <<"马贼">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 248380, mp_lim = 5333, inner_att = 932, outer_att = 932, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
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
get(170040) ->
    #mon{
        mid = 170040,
        name = <<"马贼">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 261200, mp_lim = 5444, inner_att = 978, outer_att = 978, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
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
get(170041) ->
    #mon{
        mid = 170041,
        name = <<"马贼">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 273160, mp_lim = 5549, inner_att = 1022, outer_att = 1022, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
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
get(170042) ->
    #mon{
        mid = 170042,
        name = <<"马贼">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 286560, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(170043) ->
    #mon{
        mid = 170043,
        name = <<"马贼">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 299060, mp_lim = 5766, inner_att = 1116, outer_att = 1116, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
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
get(170044) ->
    #mon{
        mid = 170044,
        name = <<"马贼">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 313080, mp_lim = 5877, inner_att = 1166, outer_att = 1166, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
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
get(170045) ->
    #mon{
        mid = 170045,
        name = <<"马贼">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 326120, mp_lim = 5982, inner_att = 1214, outer_att = 1214, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
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
get(170046) ->
    #mon{
        mid = 170046,
        name = <<"马贼">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 340720, mp_lim = 6093, inner_att = 1266, outer_att = 1266, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
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
get(170047) ->
    #mon{
        mid = 170047,
        name = <<"马贼">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 354300, mp_lim = 6199, inner_att = 1316, outer_att = 1316, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
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
get(170048) ->
    #mon{
        mid = 170048,
        name = <<"马贼">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 369520, mp_lim = 6310, inner_att = 1370, outer_att = 1370, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
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
get(170049) ->
    #mon{
        mid = 170049,
        name = <<"马贼">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 383640, mp_lim = 6415, inner_att = 1422, outer_att = 1422, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
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
get(170050) ->
    #mon{
        mid = 170050,
        name = <<"马贼">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 399460, mp_lim = 6526, inner_att = 1476, outer_att = 1476, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(170051) ->
    #mon{
        mid = 170051,
        name = <<"马贼">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 414120, mp_lim = 6632, inner_att = 1530, outer_att = 1530, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
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
get(170052) ->
    #mon{
        mid = 170052,
        name = <<"马贼">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 430540, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(170053) ->
    #mon{
        mid = 170053,
        name = <<"马贼">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 445740, mp_lim = 6848, inner_att = 1644, outer_att = 1644, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
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
get(170054) ->
    #mon{
        mid = 170054,
        name = <<"马贼">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 462780, mp_lim = 6959, inner_att = 1704, outer_att = 1704, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
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
get(170055) ->
    #mon{
        mid = 170055,
        name = <<"马贼">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 478520, mp_lim = 7065, inner_att = 1762, outer_att = 1762, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
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
get(170056) ->
    #mon{
        mid = 170056,
        name = <<"马贼">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 496140, mp_lim = 7176, inner_att = 1824, outer_att = 1824, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
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
get(170057) ->
    #mon{
        mid = 170057,
        name = <<"马贼">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 512420, mp_lim = 7281, inner_att = 1884, outer_att = 1884, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
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
get(170058) ->
    #mon{
        mid = 170058,
        name = <<"马贼">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 530660, mp_lim = 7392, inner_att = 1948, outer_att = 1948, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
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
get(170059) ->
    #mon{
        mid = 170059,
        name = <<"马贼">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 547480, mp_lim = 7498, inner_att = 2010, outer_att = 2010, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
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
get(170060) ->
    #mon{
        mid = 170060,
        name = <<"马贼">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 566300, mp_lim = 7609, inner_att = 2076, outer_att = 2076, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
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
get(170061) ->
    #mon{
        mid = 170061,
        name = <<"马贼">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 583660, mp_lim = 7714, inner_att = 2138, outer_att = 2138, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
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
get(170062) ->
    #mon{
        mid = 170062,
        name = <<"马贼">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 603100, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(170063) ->
    #mon{
        mid = 170063,
        name = <<"马贼">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 621000, mp_lim = 7931, inner_att = 2272, outer_att = 2272, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
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
get(170064) ->
    #mon{
        mid = 170064,
        name = <<"马贼">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 641040, mp_lim = 8042, inner_att = 2342, outer_att = 2342, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
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
get(170065) ->
    #mon{
        mid = 170065,
        name = <<"马贼">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 659480, mp_lim = 8147, inner_att = 2410, outer_att = 2410, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(170066) ->
    #mon{
        mid = 170066,
        name = <<"马贼">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 677380, mp_lim = 8258, inner_att = 2472, outer_att = 2472, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
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
get(170067) ->
    #mon{
        mid = 170067,
        name = <<"马贼">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 693560, mp_lim = 8364, inner_att = 2530, outer_att = 2530, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
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
get(170068) ->
    #mon{
        mid = 170068,
        name = <<"马贼">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 711900, mp_lim = 8475, inner_att = 2594, outer_att = 2594, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
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
get(170069) ->
    #mon{
        mid = 170069,
        name = <<"马贼">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 728500, mp_lim = 8580, inner_att = 2656, outer_att = 2656, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
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
get(170070) ->
    #mon{
        mid = 170070,
        name = <<"马贼">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 747300, mp_lim = 8691, inner_att = 2720, outer_att = 2720, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
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
get(170071) ->
    #mon{
        mid = 170071,
        name = <<"马贼">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 764280, mp_lim = 8797, inner_att = 2782, outer_att = 2782, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
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
get(170072) ->
    #mon{
        mid = 170072,
        name = <<"马贼">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 783540, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(170073) ->
    #mon{
        mid = 170073,
        name = <<"马贼">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 800920, mp_lim = 9013, inner_att = 2912, outer_att = 2912, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
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
get(170074) ->
    #mon{
        mid = 170074,
        name = <<"马贼">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 820640, mp_lim = 9124, inner_att = 2980, outer_att = 2980, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
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
get(170075) ->
    #mon{
        mid = 170075,
        name = <<"马贼">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 838440, mp_lim = 9230, inner_att = 3046, outer_att = 3046, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
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
get(170076) ->
    #mon{
        mid = 170076,
        name = <<"马贼">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 858580, mp_lim = 9341, inner_att = 3114, outer_att = 3114, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
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
get(170077) ->
    #mon{
        mid = 170077,
        name = <<"马贼">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 876800, mp_lim = 9446, inner_att = 3182, outer_att = 3182, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
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
get(170078) ->
    #mon{
        mid = 170078,
        name = <<"马贼">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 897400, mp_lim = 9557, inner_att = 3252, outer_att = 3252, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
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
get(170079) ->
    #mon{
        mid = 170079,
        name = <<"马贼">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 916000, mp_lim = 9663, inner_att = 3320, outer_att = 3320, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
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
get(170080) ->
    #mon{
        mid = 170080,
        name = <<"马贼">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 937060, mp_lim = 9774, inner_att = 3392, outer_att = 3392, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(170081) ->
    #mon{
        mid = 170081,
        name = <<"马贼">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 956080, mp_lim = 9879, inner_att = 3462, outer_att = 3462, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
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
get(170082) ->
    #mon{
        mid = 170082,
        name = <<"马贼">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 980920, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(170083) ->
    #mon{
        mid = 170083,
        name = <<"马贼">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 1003700, mp_lim = 10096, inner_att = 3606, outer_att = 3606, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
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
get(170084) ->
    #mon{
        mid = 170084,
        name = <<"马贼">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 1029140, mp_lim = 10207, inner_att = 3682, outer_att = 3682, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
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
get(170085) ->
    #mon{
        mid = 170085,
        name = <<"马贼">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 1052480, mp_lim = 10312, inner_att = 3754, outer_att = 3754, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
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
get(170086) ->
    #mon{
        mid = 170086,
        name = <<"马贼">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 1078500, mp_lim = 10423, inner_att = 3832, outer_att = 3832, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
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
get(170087) ->
    #mon{
        mid = 170087,
        name = <<"马贼">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 1102380, mp_lim = 10529, inner_att = 3906, outer_att = 3906, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
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
get(170088) ->
    #mon{
        mid = 170088,
        name = <<"马贼">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 1129020, mp_lim = 10640, inner_att = 3984, outer_att = 3984, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
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
get(170089) ->
    #mon{
        mid = 170089,
        name = <<"马贼">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 1153440, mp_lim = 10745, inner_att = 4060, outer_att = 4060, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
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
get(170090) ->
    #mon{
        mid = 170090,
        name = <<"马贼">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 1180680, mp_lim = 10856, inner_att = 4140, outer_att = 4140, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
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
get(170091) ->
    #mon{
        mid = 170091,
        name = <<"马贼">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 1205620, mp_lim = 10962, inner_att = 4216, outer_att = 4216, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
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
get(170101) ->
    #mon{
        mid = 170101,
        name = <<"白马义从">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 22462, mp_lim = 1219, inner_att = 48, outer_att = 48, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
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
get(170102) ->
    #mon{
        mid = 170102,
        name = <<"白马义从">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 25102, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(170103) ->
    #mon{
        mid = 170103,
        name = <<"白马义从">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 27390, mp_lim = 1436, inner_att = 56, outer_att = 56, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
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
get(170104) ->
    #mon{
        mid = 170104,
        name = <<"白马义从">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 30206, mp_lim = 1547, inner_att = 60, outer_att = 60, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
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
get(170105) ->
    #mon{
        mid = 170105,
        name = <<"白马义从">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 32626, mp_lim = 1652, inner_att = 65, outer_att = 65, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
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
get(170106) ->
    #mon{
        mid = 170106,
        name = <<"白马义从">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 35596, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
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
get(170107) ->
    #mon{
        mid = 170107,
        name = <<"白马义从">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 38192, mp_lim = 1869, inner_att = 74, outer_att = 74, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
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
get(170108) ->
    #mon{
        mid = 170108,
        name = <<"白马义从">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 41316, mp_lim = 1980, inner_att = 79, outer_att = 79, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
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
get(170109) ->
    #mon{
        mid = 170109,
        name = <<"白马义从">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 44066, mp_lim = 2085, inner_att = 84, outer_att = 84, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
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
get(170110) ->
    #mon{
        mid = 170110,
        name = <<"白马义从">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 47366, mp_lim = 2196, inner_att = 89, outer_att = 89, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
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
get(170111) ->
    #mon{
        mid = 170111,
        name = <<"白马义从">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 51084, mp_lim = 2302, inner_att = 96, outer_att = 96, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
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
get(170112) ->
    #mon{
        mid = 170112,
        name = <<"白马义从">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 55484, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(170113) ->
    #mon{
        mid = 170113,
        name = <<"白马义从">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 59532, mp_lim = 2518, inner_att = 110, outer_att = 110, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
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
get(170114) ->
    #mon{
        mid = 170114,
        name = <<"白马义从">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 64262, mp_lim = 2629, inner_att = 118, outer_att = 118, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
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
get(170115) ->
    #mon{
        mid = 170115,
        name = <<"白马义从">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 68596, mp_lim = 2735, inner_att = 125, outer_att = 125, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
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
get(170116) ->
    #mon{
        mid = 170116,
        name = <<"白马义从">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 73656, mp_lim = 2846, inner_att = 133, outer_att = 133, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
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
get(170117) ->
    #mon{
        mid = 170117,
        name = <<"白马义从">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 78276, mp_lim = 2951, inner_att = 141, outer_att = 141, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
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
get(170118) ->
    #mon{
        mid = 170118,
        name = <<"白马义从">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 83688, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
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
get(170119) ->
    #mon{
        mid = 170119,
        name = <<"白马义从">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 88594, mp_lim = 3168, inner_att = 159, outer_att = 159, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
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
get(170120) ->
    #mon{
        mid = 170120,
        name = <<"白马义从">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 94336, mp_lim = 3279, inner_att = 168, outer_att = 168, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
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
get(170121) ->
    #mon{
        mid = 170121,
        name = <<"白马义从">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 99550, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
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
get(170122) ->
    #mon{
        mid = 170122,
        name = <<"白马义从">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 105622, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(170123) ->
    #mon{
        mid = 170123,
        name = <<"白马义从">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 111122, mp_lim = 3601, inner_att = 196, outer_att = 196, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
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
get(170124) ->
    #mon{
        mid = 170124,
        name = <<"白马义从">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 117524, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
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
get(170125) ->
    #mon{
        mid = 170125,
        name = <<"白马义从">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 123332, mp_lim = 3817, inner_att = 216, outer_att = 216, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
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
get(170126) ->
    #mon{
        mid = 170126,
        name = <<"白马义从">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 130064, mp_lim = 3928, inner_att = 227, outer_att = 227, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
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
get(170127) ->
    #mon{
        mid = 170127,
        name = <<"白马义从">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 136180, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
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
get(170128) ->
    #mon{
        mid = 170128,
        name = <<"白马义从">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 146278, mp_lim = 4145, inner_att = 254, outer_att = 254, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
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
get(170129) ->
    #mon{
        mid = 170129,
        name = <<"白马义从">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 155870, mp_lim = 4250, inner_att = 271, outer_att = 271, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
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
get(170130) ->
    #mon{
        mid = 170130,
        name = <<"白马义从">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 166650, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
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
get(170131) ->
    #mon{
        mid = 170131,
        name = <<"白马义从">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 176836, mp_lim = 4467, inner_att = 306, outer_att = 306, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
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
get(170132) ->
    #mon{
        mid = 170132,
        name = <<"白马义从">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 188254, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(170133) ->
    #mon{
        mid = 170133,
        name = <<"白马义从">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 199034, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
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
get(170134) ->
    #mon{
        mid = 170134,
        name = <<"白马义从">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 211134, mp_lim = 4794, inner_att = 363, outer_att = 363, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
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
get(170135) ->
    #mon{
        mid = 170135,
        name = <<"白马义从">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 222508, mp_lim = 4900, inner_att = 382, outer_att = 382, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
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
get(170136) ->
    #mon{
        mid = 170136,
        name = <<"白马义从">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 235268, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
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
get(170137) ->
    #mon{
        mid = 170137,
        name = <<"白马义从">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 247236, mp_lim = 5116, inner_att = 423, outer_att = 423, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
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
get(170138) ->
    #mon{
        mid = 170138,
        name = <<"白马义从">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 260656, mp_lim = 5227, inner_att = 445, outer_att = 445, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
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
get(170139) ->
    #mon{
        mid = 170139,
        name = <<"白马义从">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 273218, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
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
get(170140) ->
    #mon{
        mid = 170140,
        name = <<"白马义从">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 287320, mp_lim = 5444, inner_att = 489, outer_att = 489, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
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
get(170141) ->
    #mon{
        mid = 170141,
        name = <<"白马义从">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 300476, mp_lim = 5549, inner_att = 511, outer_att = 511, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
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
get(170142) ->
    #mon{
        mid = 170142,
        name = <<"白马义从">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 315216, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(170143) ->
    #mon{
        mid = 170143,
        name = <<"白马义从">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 328966, mp_lim = 5766, inner_att = 558, outer_att = 558, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
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
get(170144) ->
    #mon{
        mid = 170144,
        name = <<"白马义从">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 344388, mp_lim = 5877, inner_att = 583, outer_att = 583, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
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
get(170145) ->
    #mon{
        mid = 170145,
        name = <<"白马义从">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 358732, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
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
get(170146) ->
    #mon{
        mid = 170146,
        name = <<"白马义从">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 374792, mp_lim = 6093, inner_att = 633, outer_att = 633, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
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
get(170147) ->
    #mon{
        mid = 170147,
        name = <<"白马义从">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 389730, mp_lim = 6199, inner_att = 658, outer_att = 658, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
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
get(170148) ->
    #mon{
        mid = 170148,
        name = <<"白马义从">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 406472, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
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
get(170149) ->
    #mon{
        mid = 170149,
        name = <<"白马义从">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 422004, mp_lim = 6415, inner_att = 711, outer_att = 711, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
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
get(170150) ->
    #mon{
        mid = 170150,
        name = <<"白马义从">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 439406, mp_lim = 6526, inner_att = 738, outer_att = 738, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
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
get(170151) ->
    #mon{
        mid = 170151,
        name = <<"白马义从">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 455532, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
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
get(170152) ->
    #mon{
        mid = 170152,
        name = <<"白马义从">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 473594, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(170153) ->
    #mon{
        mid = 170153,
        name = <<"白马义从">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 490314, mp_lim = 6848, inner_att = 822, outer_att = 822, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
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
get(170154) ->
    #mon{
        mid = 170154,
        name = <<"白马义从">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 509058, mp_lim = 6959, inner_att = 852, outer_att = 852, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
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
get(170155) ->
    #mon{
        mid = 170155,
        name = <<"白马义从">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 526372, mp_lim = 7065, inner_att = 881, outer_att = 881, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
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
get(170156) ->
    #mon{
        mid = 170156,
        name = <<"白马义从">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 545754, mp_lim = 7176, inner_att = 912, outer_att = 912, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
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
get(170157) ->
    #mon{
        mid = 170157,
        name = <<"白马义从">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 563662, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
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
get(170158) ->
    #mon{
        mid = 170158,
        name = <<"白马义从">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 583726, mp_lim = 7392, inner_att = 974, outer_att = 974, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
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
get(170159) ->
    #mon{
        mid = 170159,
        name = <<"白马义从">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 602228, mp_lim = 7498, inner_att = 1005, outer_att = 1005, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
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
get(170160) ->
    #mon{
        mid = 170160,
        name = <<"白马义从">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 622930, mp_lim = 7609, inner_att = 1038, outer_att = 1038, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
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
get(170161) ->
    #mon{
        mid = 170161,
        name = <<"白马义从">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 642026, mp_lim = 7714, inner_att = 1069, outer_att = 1069, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
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
get(170162) ->
    #mon{
        mid = 170162,
        name = <<"白马义从">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 663410, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(170163) ->
    #mon{
        mid = 170163,
        name = <<"白马义从">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 683100, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
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
get(170164) ->
    #mon{
        mid = 170164,
        name = <<"白马义从">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 705144, mp_lim = 8042, inner_att = 1171, outer_att = 1171, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
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
get(170165) ->
    #mon{
        mid = 170165,
        name = <<"白马义从">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 725428, mp_lim = 8147, inner_att = 1205, outer_att = 1205, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
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
get(170166) ->
    #mon{
        mid = 170166,
        name = <<"白马义从">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 745118, mp_lim = 8258, inner_att = 1236, outer_att = 1236, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
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
get(170167) ->
    #mon{
        mid = 170167,
        name = <<"白马义从">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 762916, mp_lim = 8364, inner_att = 1265, outer_att = 1265, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
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
get(170168) ->
    #mon{
        mid = 170168,
        name = <<"白马义从">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 783090, mp_lim = 8475, inner_att = 1297, outer_att = 1297, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
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
get(170169) ->
    #mon{
        mid = 170169,
        name = <<"白马义从">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 801350, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
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
get(170170) ->
    #mon{
        mid = 170170,
        name = <<"白马义从">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 822030, mp_lim = 8691, inner_att = 1360, outer_att = 1360, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
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
get(170171) ->
    #mon{
        mid = 170171,
        name = <<"白马义从">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 840708, mp_lim = 8797, inner_att = 1391, outer_att = 1391, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
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
get(170172) ->
    #mon{
        mid = 170172,
        name = <<"白马义从">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 861894, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(170173) ->
    #mon{
        mid = 170173,
        name = <<"白马义从">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 881012, mp_lim = 9013, inner_att = 1456, outer_att = 1456, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
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
get(170174) ->
    #mon{
        mid = 170174,
        name = <<"白马义从">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 902704, mp_lim = 9124, inner_att = 1490, outer_att = 1490, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
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
get(170175) ->
    #mon{
        mid = 170175,
        name = <<"白马义从">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 922284, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
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
get(170176) ->
    #mon{
        mid = 170176,
        name = <<"白马义从">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 944438, mp_lim = 9341, inner_att = 1557, outer_att = 1557, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
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
get(170177) ->
    #mon{
        mid = 170177,
        name = <<"白马义从">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 964480, mp_lim = 9446, inner_att = 1591, outer_att = 1591, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
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
get(170178) ->
    #mon{
        mid = 170178,
        name = <<"白马义从">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 987140, mp_lim = 9557, inner_att = 1626, outer_att = 1626, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
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
get(170179) ->
    #mon{
        mid = 170179,
        name = <<"白马义从">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 1007600, mp_lim = 9663, inner_att = 1660, outer_att = 1660, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
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
get(170180) ->
    #mon{
        mid = 170180,
        name = <<"白马义从">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1030766, mp_lim = 9774, inner_att = 1696, outer_att = 1696, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
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
get(170181) ->
    #mon{
        mid = 170181,
        name = <<"白马义从">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 1051688, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
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
get(170182) ->
    #mon{
        mid = 170182,
        name = <<"白马义从">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1079012, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(170183) ->
    #mon{
        mid = 170183,
        name = <<"白马义从">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 1104070, mp_lim = 10096, inner_att = 1803, outer_att = 1803, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
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
get(170184) ->
    #mon{
        mid = 170184,
        name = <<"白马义从">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 1132054, mp_lim = 10207, inner_att = 1841, outer_att = 1841, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
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
get(170185) ->
    #mon{
        mid = 170185,
        name = <<"白马义从">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 1157728, mp_lim = 10312, inner_att = 1877, outer_att = 1877, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
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
get(170186) ->
    #mon{
        mid = 170186,
        name = <<"白马义从">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 1186350, mp_lim = 10423, inner_att = 1916, outer_att = 1916, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
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
get(170187) ->
    #mon{
        mid = 170187,
        name = <<"白马义从">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 1212618, mp_lim = 10529, inner_att = 1953, outer_att = 1953, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
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
get(170188) ->
    #mon{
        mid = 170188,
        name = <<"白马义从">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 1241922, mp_lim = 10640, inner_att = 1992, outer_att = 1992, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
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
get(170189) ->
    #mon{
        mid = 170189,
        name = <<"白马义从">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 1268784, mp_lim = 10745, inner_att = 2030, outer_att = 2030, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
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
get(170190) ->
    #mon{
        mid = 170190,
        name = <<"白马义从">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 1298748, mp_lim = 10856, inner_att = 2070, outer_att = 2070, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
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
get(170191) ->
    #mon{
        mid = 170191,
        name = <<"白马义从">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 1326182, mp_lim = 10962, inner_att = 2108, outer_att = 2108, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
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

