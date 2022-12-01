%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_21
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_21).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(210001) ->
    #mon{
        mid = 210001,
        name = <<"强盗">>,
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
get(210002) ->
    #mon{
        mid = 210002,
        name = <<"强盗">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 11385, mp_lim = 2951, inner_att = 42, outer_att = 42, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210003) ->
    #mon{
        mid = 210003,
        name = <<"强盗">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 12172, mp_lim = 3062, inner_att = 45, outer_att = 45, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210004) ->
    #mon{
        mid = 210004,
        name = <<"强盗">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 12886, mp_lim = 3168, inner_att = 47, outer_att = 47, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210005) ->
    #mon{
        mid = 210005,
        name = <<"强盗">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 13721, mp_lim = 3279, inner_att = 50, outer_att = 50, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210006) ->
    #mon{
        mid = 210006,
        name = <<"强盗">>,
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
get(210007) ->
    #mon{
        mid = 210007,
        name = <<"强盗">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 15363, mp_lim = 3495, inner_att = 56, outer_att = 56, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210008) ->
    #mon{
        mid = 210008,
        name = <<"强盗">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 16163, mp_lim = 3601, inner_att = 58, outer_att = 58, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210009) ->
    #mon{
        mid = 210009,
        name = <<"强盗">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 17094, mp_lim = 3712, inner_att = 62, outer_att = 62, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210010) ->
    #mon{
        mid = 210010,
        name = <<"强盗">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 17939, mp_lim = 3817, inner_att = 64, outer_att = 64, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210011) ->
    #mon{
        mid = 210011,
        name = <<"强盗">>,
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
get(210012) ->
    #mon{
        mid = 210012,
        name = <<"强盗">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 19808, mp_lim = 4034, inner_att = 71, outer_att = 71, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210013) ->
    #mon{
        mid = 210013,
        name = <<"强盗">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 21276, mp_lim = 4145, inner_att = 76, outer_att = 76, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210014) ->
    #mon{
        mid = 210014,
        name = <<"强盗">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 22672, mp_lim = 4250, inner_att = 81, outer_att = 81, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210015) ->
    #mon{
        mid = 210015,
        name = <<"强盗">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 24240, mp_lim = 4361, inner_att = 86, outer_att = 86, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210016) ->
    #mon{
        mid = 210016,
        name = <<"强盗">>,
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
get(210017) ->
    #mon{
        mid = 210017,
        name = <<"强盗">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 27382, mp_lim = 4578, inner_att = 97, outer_att = 97, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210018) ->
    #mon{
        mid = 210018,
        name = <<"强盗">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 28950, mp_lim = 4683, inner_att = 102, outer_att = 102, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210019) ->
    #mon{
        mid = 210019,
        name = <<"强盗">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 30710, mp_lim = 4794, inner_att = 108, outer_att = 108, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210020) ->
    #mon{
        mid = 210020,
        name = <<"强盗">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 32364, mp_lim = 4900, inner_att = 114, outer_att = 114, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210021) ->
    #mon{
        mid = 210021,
        name = <<"强盗">>,
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
get(210022) ->
    #mon{
        mid = 210022,
        name = <<"强盗">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 35961, mp_lim = 5116, inner_att = 126, outer_att = 126, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210023) ->
    #mon{
        mid = 210023,
        name = <<"强盗">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 37913, mp_lim = 5227, inner_att = 133, outer_att = 133, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210024) ->
    #mon{
        mid = 210024,
        name = <<"强盗">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 39740, mp_lim = 5333, inner_att = 139, outer_att = 139, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210025) ->
    #mon{
        mid = 210025,
        name = <<"强盗">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 41792, mp_lim = 5444, inner_att = 146, outer_att = 146, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210026) ->
    #mon{
        mid = 210026,
        name = <<"强盗">>,
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
get(210027) ->
    #mon{
        mid = 210027,
        name = <<"强盗">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 45849, mp_lim = 5660, inner_att = 160, outer_att = 160, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210028) ->
    #mon{
        mid = 210028,
        name = <<"强盗">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 47849, mp_lim = 5766, inner_att = 167, outer_att = 167, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210029) ->
    #mon{
        mid = 210029,
        name = <<"强盗">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 50092, mp_lim = 5877, inner_att = 174, outer_att = 174, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210030) ->
    #mon{
        mid = 210030,
        name = <<"强盗">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 52179, mp_lim = 5982, inner_att = 182, outer_att = 182, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210031) ->
    #mon{
        mid = 210031,
        name = <<"强盗">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 54515, mp_lim = 6093, inner_att = 189, outer_att = 189, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210032) ->
    #mon{
        mid = 210032,
        name = <<"强盗">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 56688, mp_lim = 6199, inner_att = 197, outer_att = 197, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210033) ->
    #mon{
        mid = 210033,
        name = <<"强盗">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 59123, mp_lim = 6310, inner_att = 205, outer_att = 205, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210034) ->
    #mon{
        mid = 210034,
        name = <<"强盗">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 61382, mp_lim = 6415, inner_att = 213, outer_att = 213, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210035) ->
    #mon{
        mid = 210035,
        name = <<"强盗">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 63913, mp_lim = 6526, inner_att = 221, outer_att = 221, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210036) ->
    #mon{
        mid = 210036,
        name = <<"强盗">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 66259, mp_lim = 6632, inner_att = 229, outer_att = 229, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210037) ->
    #mon{
        mid = 210037,
        name = <<"强盗">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 68886, mp_lim = 6743, inner_att = 238, outer_att = 238, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210038) ->
    #mon{
        mid = 210038,
        name = <<"强盗">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 71318, mp_lim = 6848, inner_att = 246, outer_att = 246, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210039) ->
    #mon{
        mid = 210039,
        name = <<"强盗">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 74044, mp_lim = 6959, inner_att = 255, outer_att = 255, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210040) ->
    #mon{
        mid = 210040,
        name = <<"强盗">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 76563, mp_lim = 7065, inner_att = 264, outer_att = 264, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210041) ->
    #mon{
        mid = 210041,
        name = <<"强盗">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 79382, mp_lim = 7176, inner_att = 273, outer_att = 273, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210042) ->
    #mon{
        mid = 210042,
        name = <<"强盗">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 81987, mp_lim = 7281, inner_att = 282, outer_att = 282, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210043) ->
    #mon{
        mid = 210043,
        name = <<"强盗">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 84905, mp_lim = 7392, inner_att = 292, outer_att = 292, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210044) ->
    #mon{
        mid = 210044,
        name = <<"强盗">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 87596, mp_lim = 7498, inner_att = 301, outer_att = 301, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210045) ->
    #mon{
        mid = 210045,
        name = <<"强盗">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 90608, mp_lim = 7609, inner_att = 311, outer_att = 311, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210046) ->
    #mon{
        mid = 210046,
        name = <<"强盗">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 93385, mp_lim = 7714, inner_att = 320, outer_att = 320, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210047) ->
    #mon{
        mid = 210047,
        name = <<"强盗">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 96496, mp_lim = 7825, inner_att = 331, outer_att = 331, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210048) ->
    #mon{
        mid = 210048,
        name = <<"强盗">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 99360, mp_lim = 7931, inner_att = 340, outer_att = 340, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210049) ->
    #mon{
        mid = 210049,
        name = <<"强盗">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 102566, mp_lim = 8042, inner_att = 351, outer_att = 351, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210050) ->
    #mon{
        mid = 210050,
        name = <<"强盗">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 105516, mp_lim = 8147, inner_att = 361, outer_att = 361, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210051) ->
    #mon{
        mid = 210051,
        name = <<"强盗">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 108380, mp_lim = 8258, inner_att = 370, outer_att = 370, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210052) ->
    #mon{
        mid = 210052,
        name = <<"强盗">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 110969, mp_lim = 8364, inner_att = 379, outer_att = 379, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210053) ->
    #mon{
        mid = 210053,
        name = <<"强盗">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 113904, mp_lim = 8475, inner_att = 389, outer_att = 389, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210054) ->
    #mon{
        mid = 210054,
        name = <<"强盗">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 116560, mp_lim = 8580, inner_att = 398, outer_att = 398, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210055) ->
    #mon{
        mid = 210055,
        name = <<"强盗">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 119568, mp_lim = 8691, inner_att = 408, outer_att = 408, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210056) ->
    #mon{
        mid = 210056,
        name = <<"强盗">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 122284, mp_lim = 8797, inner_att = 417, outer_att = 417, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210057) ->
    #mon{
        mid = 210057,
        name = <<"强盗">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 125366, mp_lim = 8908, inner_att = 427, outer_att = 427, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210058) ->
    #mon{
        mid = 210058,
        name = <<"强盗">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 128147, mp_lim = 9013, inner_att = 436, outer_att = 436, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210059) ->
    #mon{
        mid = 210059,
        name = <<"强盗">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 131302, mp_lim = 9124, inner_att = 447, outer_att = 447, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210060) ->
    #mon{
        mid = 210060,
        name = <<"强盗">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 134150, mp_lim = 9230, inner_att = 456, outer_att = 456, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210061) ->
    #mon{
        mid = 210061,
        name = <<"强盗">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 137372, mp_lim = 9341, inner_att = 467, outer_att = 467, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210062) ->
    #mon{
        mid = 210062,
        name = <<"强盗">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 140288, mp_lim = 9446, inner_att = 477, outer_att = 477, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210063) ->
    #mon{
        mid = 210063,
        name = <<"强盗">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 143584, mp_lim = 9557, inner_att = 487, outer_att = 487, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210064) ->
    #mon{
        mid = 210064,
        name = <<"强盗">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 146560, mp_lim = 9663, inner_att = 498, outer_att = 498, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210065) ->
    #mon{
        mid = 210065,
        name = <<"强盗">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 149929, mp_lim = 9774, inner_att = 508, outer_att = 508, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210066) ->
    #mon{
        mid = 210066,
        name = <<"强盗">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 152972, mp_lim = 9879, inner_att = 519, outer_att = 519, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210067) ->
    #mon{
        mid = 210067,
        name = <<"强盗">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 156947, mp_lim = 9990, inner_att = 530, outer_att = 530, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210068) ->
    #mon{
        mid = 210068,
        name = <<"强盗">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 160592, mp_lim = 10096, inner_att = 540, outer_att = 540, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210069) ->
    #mon{
        mid = 210069,
        name = <<"强盗">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 164662, mp_lim = 10207, inner_att = 552, outer_att = 552, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210070) ->
    #mon{
        mid = 210070,
        name = <<"强盗">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 168396, mp_lim = 10312, inner_att = 563, outer_att = 563, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210071) ->
    #mon{
        mid = 210071,
        name = <<"强盗">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 172560, mp_lim = 10423, inner_att = 574, outer_att = 574, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210072) ->
    #mon{
        mid = 210072,
        name = <<"强盗">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 176380, mp_lim = 10529, inner_att = 585, outer_att = 585, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210073) ->
    #mon{
        mid = 210073,
        name = <<"强盗">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 180643, mp_lim = 10640, inner_att = 597, outer_att = 597, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210074) ->
    #mon{
        mid = 210074,
        name = <<"强盗">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 184550, mp_lim = 10745, inner_att = 609, outer_att = 609, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(210075) ->
    #mon{
        mid = 210075,
        name = <<"强盗">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 188908, mp_lim = 10856, inner_att = 621, outer_att = 621, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
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

