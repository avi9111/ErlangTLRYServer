%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_26
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_26).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(260001) ->
    #mon{
        mid = 260001,
        name = <<"白棋">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 8, outer_att = 8, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 187
    };
get(260002) ->
    #mon{
        mid = 260002,
        name = <<"白棋">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 1345, mp_lim = 353, inner_att = 10, outer_att = 10, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 280
    };
get(260003) ->
    #mon{
        mid = 260003,
        name = <<"白棋">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1795, mp_lim = 464, inner_att = 11, outer_att = 11, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 374
    };
get(260004) ->
    #mon{
        mid = 260004,
        name = <<"白棋">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 2180, mp_lim = 570, inner_att = 13, outer_att = 13, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 467
    };
get(260005) ->
    #mon{
        mid = 260005,
        name = <<"白棋">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 2665, mp_lim = 681, inner_att = 14, outer_att = 14, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 560
    };
get(260006) ->
    #mon{
        mid = 260006,
        name = <<"白棋">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 3085, mp_lim = 786, inner_att = 16, outer_att = 16, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 654
    };
get(260007) ->
    #mon{
        mid = 260007,
        name = <<"白棋">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 3605, mp_lim = 897, inner_att = 18, outer_att = 18, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 747
    };
get(260008) ->
    #mon{
        mid = 260008,
        name = <<"白棋">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 4060, mp_lim = 1003, inner_att = 20, outer_att = 20, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 840
    };
get(260009) ->
    #mon{
        mid = 260009,
        name = <<"白棋">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 4620, mp_lim = 1114, inner_att = 22, outer_att = 22, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 934
    };
get(260010) ->
    #mon{
        mid = 260010,
        name = <<"白棋">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 5105, mp_lim = 1219, inner_att = 24, outer_att = 24, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1107
    };
get(260011) ->
    #mon{
        mid = 260011,
        name = <<"白棋">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 26, outer_att = 26, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1112
    };
get(260012) ->
    #mon{
        mid = 260012,
        name = <<"白棋">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 6225, mp_lim = 1436, inner_att = 28, outer_att = 28, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1116
    };
get(260013) ->
    #mon{
        mid = 260013,
        name = <<"白棋">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 6865, mp_lim = 1547, inner_att = 30, outer_att = 30, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1120
    };
get(260014) ->
    #mon{
        mid = 260014,
        name = <<"白棋">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 7415, mp_lim = 1652, inner_att = 32, outer_att = 32, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1125
    };
get(260015) ->
    #mon{
        mid = 260015,
        name = <<"白棋">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 8090, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1129
    };
get(260016) ->
    #mon{
        mid = 260016,
        name = <<"白棋">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 8680, mp_lim = 1869, inner_att = 37, outer_att = 37, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1133
    };
get(260017) ->
    #mon{
        mid = 260017,
        name = <<"白棋">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 9390, mp_lim = 1980, inner_att = 39, outer_att = 39, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1137
    };
get(260018) ->
    #mon{
        mid = 260018,
        name = <<"白棋">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 10015, mp_lim = 2085, inner_att = 42, outer_att = 42, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1142
    };
get(260019) ->
    #mon{
        mid = 260019,
        name = <<"白棋">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 10765, mp_lim = 2196, inner_att = 44, outer_att = 44, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1146
    };
get(260020) ->
    #mon{
        mid = 260020,
        name = <<"白棋">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 11610, mp_lim = 2302, inner_att = 48, outer_att = 48, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1150
    };
get(260021) ->
    #mon{
        mid = 260021,
        name = <<"白棋">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 51, outer_att = 51, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1154
    };
get(260022) ->
    #mon{
        mid = 260022,
        name = <<"白棋">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 13530, mp_lim = 2518, inner_att = 55, outer_att = 55, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1159
    };
get(260023) ->
    #mon{
        mid = 260023,
        name = <<"白棋">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 14605, mp_lim = 2629, inner_att = 59, outer_att = 59, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1163
    };
get(260024) ->
    #mon{
        mid = 260024,
        name = <<"白棋">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 15590, mp_lim = 2735, inner_att = 62, outer_att = 62, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1167
    };
get(260025) ->
    #mon{
        mid = 260025,
        name = <<"白棋">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 16740, mp_lim = 2846, inner_att = 66, outer_att = 66, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1172
    };
get(260026) ->
    #mon{
        mid = 260026,
        name = <<"白棋">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 17790, mp_lim = 2951, inner_att = 70, outer_att = 70, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1176
    };
get(260027) ->
    #mon{
        mid = 260027,
        name = <<"白棋">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 19020, mp_lim = 3062, inner_att = 75, outer_att = 75, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1180
    };
get(260028) ->
    #mon{
        mid = 260028,
        name = <<"白棋">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 20135, mp_lim = 3168, inner_att = 79, outer_att = 79, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1184
    };
get(260029) ->
    #mon{
        mid = 260029,
        name = <<"白棋">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 21440, mp_lim = 3279, inner_att = 84, outer_att = 84, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1189
    };
get(260030) ->
    #mon{
        mid = 260030,
        name = <<"白棋">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 22625, mp_lim = 3384, inner_att = 88, outer_att = 88, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1197
    };
get(260031) ->
    #mon{
        mid = 260031,
        name = <<"白棋">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 93, outer_att = 93, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1205
    };
get(260032) ->
    #mon{
        mid = 260032,
        name = <<"白棋">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 25255, mp_lim = 3601, inner_att = 98, outer_att = 98, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1213
    };
get(260033) ->
    #mon{
        mid = 260033,
        name = <<"白棋">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 26710, mp_lim = 3712, inner_att = 103, outer_att = 103, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1222
    };
get(260034) ->
    #mon{
        mid = 260034,
        name = <<"白棋">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 28030, mp_lim = 3817, inner_att = 108, outer_att = 108, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1230
    };
get(260035) ->
    #mon{
        mid = 260035,
        name = <<"白棋">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 29560, mp_lim = 3928, inner_att = 113, outer_att = 113, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1243
    };
get(260036) ->
    #mon{
        mid = 260036,
        name = <<"白棋">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 30950, mp_lim = 4034, inner_att = 119, outer_att = 119, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1255
    };
get(260037) ->
    #mon{
        mid = 260037,
        name = <<"白棋">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 33245, mp_lim = 4145, inner_att = 127, outer_att = 127, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1268
    };
get(260038) ->
    #mon{
        mid = 260038,
        name = <<"白棋">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 35425, mp_lim = 4250, inner_att = 135, outer_att = 135, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1280
    };
get(260039) ->
    #mon{
        mid = 260039,
        name = <<"白棋">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 37875, mp_lim = 4361, inner_att = 144, outer_att = 144, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1293
    };
get(260040) ->
    #mon{
        mid = 260040,
        name = <<"白棋">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 40190, mp_lim = 4467, inner_att = 153, outer_att = 153, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1309
    };
get(260041) ->
    #mon{
        mid = 260041,
        name = <<"白棋">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 162, outer_att = 162, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1326
    };
get(260042) ->
    #mon{
        mid = 260042,
        name = <<"白棋">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 45235, mp_lim = 4683, inner_att = 171, outer_att = 171, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1343
    };
get(260043) ->
    #mon{
        mid = 260043,
        name = <<"白棋">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 47985, mp_lim = 4794, inner_att = 181, outer_att = 181, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1360
    };
get(260044) ->
    #mon{
        mid = 260044,
        name = <<"白棋">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 50570, mp_lim = 4900, inner_att = 191, outer_att = 191, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1377
    };
get(260045) ->
    #mon{
        mid = 260045,
        name = <<"白棋">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 53470, mp_lim = 5011, inner_att = 201, outer_att = 201, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1400
    };
get(260046) ->
    #mon{
        mid = 260046,
        name = <<"白棋">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 56190, mp_lim = 5116, inner_att = 211, outer_att = 211, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1423
    };
get(260047) ->
    #mon{
        mid = 260047,
        name = <<"白棋">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 59240, mp_lim = 5227, inner_att = 222, outer_att = 222, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1446
    };
get(260048) ->
    #mon{
        mid = 260048,
        name = <<"白棋">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 62095, mp_lim = 5333, inner_att = 233, outer_att = 233, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1470
    };
get(260049) ->
    #mon{
        mid = 260049,
        name = <<"白棋">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 65300, mp_lim = 5444, inner_att = 244, outer_att = 244, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1493
    };
get(260050) ->
    #mon{
        mid = 260050,
        name = <<"白棋">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 68290, mp_lim = 5549, inner_att = 255, outer_att = 255, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1522
    };
get(260051) ->
    #mon{
        mid = 260051,
        name = <<"白棋">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 267, outer_att = 267, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1552
    };
get(260052) ->
    #mon{
        mid = 260052,
        name = <<"白棋">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 74765, mp_lim = 5766, inner_att = 279, outer_att = 279, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1582
    };
get(260053) ->
    #mon{
        mid = 260053,
        name = <<"白棋">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 78270, mp_lim = 5877, inner_att = 291, outer_att = 291, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1611
    };
get(260054) ->
    #mon{
        mid = 260054,
        name = <<"白棋">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 81530, mp_lim = 5982, inner_att = 303, outer_att = 303, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1641
    };
get(260055) ->
    #mon{
        mid = 260055,
        name = <<"白棋">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 85180, mp_lim = 6093, inner_att = 316, outer_att = 316, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1677
    };
get(260056) ->
    #mon{
        mid = 260056,
        name = <<"白棋">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 88575, mp_lim = 6199, inner_att = 329, outer_att = 329, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1713
    };
get(260057) ->
    #mon{
        mid = 260057,
        name = <<"白棋">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 92380, mp_lim = 6310, inner_att = 342, outer_att = 342, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1749
    };
get(260058) ->
    #mon{
        mid = 260058,
        name = <<"白棋">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 95910, mp_lim = 6415, inner_att = 355, outer_att = 355, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1785
    };
get(260059) ->
    #mon{
        mid = 260059,
        name = <<"白棋">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 99865, mp_lim = 6526, inner_att = 369, outer_att = 369, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1821
    };
get(260060) ->
    #mon{
        mid = 260060,
        name = <<"白棋">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 103530, mp_lim = 6632, inner_att = 382, outer_att = 382, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1867
    };
get(260061) ->
    #mon{
        mid = 260061,
        name = <<"白棋">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 397, outer_att = 397, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1912
    };
get(260062) ->
    #mon{
        mid = 260062,
        name = <<"白棋">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 111435, mp_lim = 6848, inner_att = 411, outer_att = 411, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1958
    };
get(260063) ->
    #mon{
        mid = 260063,
        name = <<"白棋">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 115695, mp_lim = 6959, inner_att = 426, outer_att = 426, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2004
    };
get(260064) ->
    #mon{
        mid = 260064,
        name = <<"白棋">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 119630, mp_lim = 7065, inner_att = 440, outer_att = 440, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2049
    };
get(260065) ->
    #mon{
        mid = 260065,
        name = <<"白棋">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 124035, mp_lim = 7176, inner_att = 456, outer_att = 456, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2104
    };
get(260066) ->
    #mon{
        mid = 260066,
        name = <<"白棋">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 128105, mp_lim = 7281, inner_att = 471, outer_att = 471, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2160
    };
get(260067) ->
    #mon{
        mid = 260067,
        name = <<"白棋">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 132665, mp_lim = 7392, inner_att = 487, outer_att = 487, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2215
    };
get(260068) ->
    #mon{
        mid = 260068,
        name = <<"白棋">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 136870, mp_lim = 7498, inner_att = 502, outer_att = 502, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2270
    };
get(260069) ->
    #mon{
        mid = 260069,
        name = <<"白棋">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 141575, mp_lim = 7609, inner_att = 519, outer_att = 519, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2325
    };
get(260070) ->
    #mon{
        mid = 260070,
        name = <<"白棋">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 145915, mp_lim = 7714, inner_att = 534, outer_att = 534, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2394
    };
get(260071) ->
    #mon{
        mid = 260071,
        name = <<"白棋">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 552, outer_att = 552, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2462
    };
get(260072) ->
    #mon{
        mid = 260072,
        name = <<"白棋">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 155250, mp_lim = 7931, inner_att = 568, outer_att = 568, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2530
    };
get(260073) ->
    #mon{
        mid = 260073,
        name = <<"白棋">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 160260, mp_lim = 8042, inner_att = 585, outer_att = 585, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2599
    };
get(260074) ->
    #mon{
        mid = 260074,
        name = <<"白棋">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 164870, mp_lim = 8147, inner_att = 602, outer_att = 602, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2667
    };
get(260075) ->
    #mon{
        mid = 260075,
        name = <<"白棋">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 169345, mp_lim = 8258, inner_att = 618, outer_att = 618, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2748
    };
get(260076) ->
    #mon{
        mid = 260076,
        name = <<"白棋">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 173390, mp_lim = 8364, inner_att = 632, outer_att = 632, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2830
    };
get(260077) ->
    #mon{
        mid = 260077,
        name = <<"白棋">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 177975, mp_lim = 8475, inner_att = 648, outer_att = 648, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2911
    };
get(260078) ->
    #mon{
        mid = 260078,
        name = <<"白棋">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 182125, mp_lim = 8580, inner_att = 664, outer_att = 664, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2993
    };
get(260079) ->
    #mon{
        mid = 260079,
        name = <<"白棋">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 186825, mp_lim = 8691, inner_att = 680, outer_att = 680, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3074
    };
get(260080) ->
    #mon{
        mid = 260080,
        name = <<"白棋">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 191070, mp_lim = 8797, inner_att = 695, outer_att = 695, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3184
    };
get(260081) ->
    #mon{
        mid = 260081,
        name = <<"白棋">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 712, outer_att = 712, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3295
    };
get(260082) ->
    #mon{
        mid = 260082,
        name = <<"白棋">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 200230, mp_lim = 9013, inner_att = 728, outer_att = 728, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3405
    };
get(260083) ->
    #mon{
        mid = 260083,
        name = <<"白棋">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 205160, mp_lim = 9124, inner_att = 745, outer_att = 745, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3516
    };
get(260084) ->
    #mon{
        mid = 260084,
        name = <<"白棋">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 209610, mp_lim = 9230, inner_att = 761, outer_att = 761, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3626
    };
get(260085) ->
    #mon{
        mid = 260085,
        name = <<"白棋">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 214645, mp_lim = 9341, inner_att = 778, outer_att = 778, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3766
    };
get(260086) ->
    #mon{
        mid = 260086,
        name = <<"白棋">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 219200, mp_lim = 9446, inner_att = 795, outer_att = 795, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3905
    };
get(260087) ->
    #mon{
        mid = 260087,
        name = <<"白棋">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 224350, mp_lim = 9557, inner_att = 813, outer_att = 813, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4045
    };
get(260088) ->
    #mon{
        mid = 260088,
        name = <<"白棋">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 229000, mp_lim = 9663, inner_att = 830, outer_att = 830, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4185
    };
get(260089) ->
    #mon{
        mid = 260089,
        name = <<"白棋">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 234265, mp_lim = 9774, inner_att = 848, outer_att = 848, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4324
    };
get(260090) ->
    #mon{
        mid = 260090,
        name = <<"白棋">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 239020, mp_lim = 9879, inner_att = 865, outer_att = 865, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4504
    };
get(260091) ->
    #mon{
        mid = 260091,
        name = <<"白棋">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 884, outer_att = 884, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4683
    };
get(260092) ->
    #mon{
        mid = 260092,
        name = <<"白棋">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 250925, mp_lim = 10096, inner_att = 901, outer_att = 901, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4862
    };
get(260093) ->
    #mon{
        mid = 260093,
        name = <<"白棋">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 257285, mp_lim = 10207, inner_att = 920, outer_att = 920, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5042
    };
get(260094) ->
    #mon{
        mid = 260094,
        name = <<"白棋">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 263120, mp_lim = 10312, inner_att = 938, outer_att = 938, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5221
    };
get(260095) ->
    #mon{
        mid = 260095,
        name = <<"白棋">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 269625, mp_lim = 10423, inner_att = 958, outer_att = 958, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5442
    };
get(260096) ->
    #mon{
        mid = 260096,
        name = <<"白棋">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 275595, mp_lim = 10529, inner_att = 976, outer_att = 976, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5664
    };
get(260097) ->
    #mon{
        mid = 260097,
        name = <<"白棋">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 282255, mp_lim = 10640, inner_att = 996, outer_att = 996, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5885
    };
get(260098) ->
    #mon{
        mid = 260098,
        name = <<"白棋">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 288360, mp_lim = 10745, inner_att = 1015, outer_att = 1015, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6107
    };
get(260099) ->
    #mon{
        mid = 260099,
        name = <<"白棋">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 295170, mp_lim = 10856, inner_att = 1035, outer_att = 1035, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6328
    };
get(260100) ->
    #mon{
        mid = 260100,
        name = <<"白棋">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 301405, mp_lim = 10962, inner_att = 1054, outer_att = 1054, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6328
    };
get(261001) ->
    #mon{
        mid = 261001,
        name = <<"黑棋">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 8, outer_att = 8, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 187
    };
get(261002) ->
    #mon{
        mid = 261002,
        name = <<"黑棋">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 1345, mp_lim = 353, inner_att = 10, outer_att = 10, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 280
    };
get(261003) ->
    #mon{
        mid = 261003,
        name = <<"黑棋">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1795, mp_lim = 464, inner_att = 11, outer_att = 11, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 374
    };
get(261004) ->
    #mon{
        mid = 261004,
        name = <<"黑棋">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 2180, mp_lim = 570, inner_att = 13, outer_att = 13, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 467
    };
get(261005) ->
    #mon{
        mid = 261005,
        name = <<"黑棋">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 2665, mp_lim = 681, inner_att = 14, outer_att = 14, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 560
    };
get(261006) ->
    #mon{
        mid = 261006,
        name = <<"黑棋">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 3085, mp_lim = 786, inner_att = 16, outer_att = 16, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 654
    };
get(261007) ->
    #mon{
        mid = 261007,
        name = <<"黑棋">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 3605, mp_lim = 897, inner_att = 18, outer_att = 18, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 747
    };
get(261008) ->
    #mon{
        mid = 261008,
        name = <<"黑棋">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 4060, mp_lim = 1003, inner_att = 20, outer_att = 20, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 840
    };
get(261009) ->
    #mon{
        mid = 261009,
        name = <<"黑棋">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 4620, mp_lim = 1114, inner_att = 22, outer_att = 22, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 934
    };
get(261010) ->
    #mon{
        mid = 261010,
        name = <<"黑棋">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 5105, mp_lim = 1219, inner_att = 24, outer_att = 24, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1107
    };
get(261011) ->
    #mon{
        mid = 261011,
        name = <<"黑棋">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 26, outer_att = 26, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1112
    };
get(261012) ->
    #mon{
        mid = 261012,
        name = <<"黑棋">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 6225, mp_lim = 1436, inner_att = 28, outer_att = 28, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1116
    };
get(261013) ->
    #mon{
        mid = 261013,
        name = <<"黑棋">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 6865, mp_lim = 1547, inner_att = 30, outer_att = 30, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1120
    };
get(261014) ->
    #mon{
        mid = 261014,
        name = <<"黑棋">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 7415, mp_lim = 1652, inner_att = 32, outer_att = 32, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1125
    };
get(261015) ->
    #mon{
        mid = 261015,
        name = <<"黑棋">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 8090, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1129
    };
get(261016) ->
    #mon{
        mid = 261016,
        name = <<"黑棋">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 8680, mp_lim = 1869, inner_att = 37, outer_att = 37, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1133
    };
get(261017) ->
    #mon{
        mid = 261017,
        name = <<"黑棋">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 9390, mp_lim = 1980, inner_att = 39, outer_att = 39, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1137
    };
get(261018) ->
    #mon{
        mid = 261018,
        name = <<"黑棋">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 10015, mp_lim = 2085, inner_att = 42, outer_att = 42, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1142
    };
get(261019) ->
    #mon{
        mid = 261019,
        name = <<"黑棋">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 10765, mp_lim = 2196, inner_att = 44, outer_att = 44, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1146
    };
get(261020) ->
    #mon{
        mid = 261020,
        name = <<"黑棋">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 11610, mp_lim = 2302, inner_att = 48, outer_att = 48, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1150
    };
get(261021) ->
    #mon{
        mid = 261021,
        name = <<"黑棋">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 51, outer_att = 51, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1154
    };
get(261022) ->
    #mon{
        mid = 261022,
        name = <<"黑棋">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 13530, mp_lim = 2518, inner_att = 55, outer_att = 55, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1159
    };
get(261023) ->
    #mon{
        mid = 261023,
        name = <<"黑棋">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 14605, mp_lim = 2629, inner_att = 59, outer_att = 59, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1163
    };
get(261024) ->
    #mon{
        mid = 261024,
        name = <<"黑棋">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 15590, mp_lim = 2735, inner_att = 62, outer_att = 62, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1167
    };
get(261025) ->
    #mon{
        mid = 261025,
        name = <<"黑棋">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 16740, mp_lim = 2846, inner_att = 66, outer_att = 66, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1172
    };
get(261026) ->
    #mon{
        mid = 261026,
        name = <<"黑棋">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 17790, mp_lim = 2951, inner_att = 70, outer_att = 70, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1176
    };
get(261027) ->
    #mon{
        mid = 261027,
        name = <<"黑棋">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 19020, mp_lim = 3062, inner_att = 75, outer_att = 75, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1180
    };
get(261028) ->
    #mon{
        mid = 261028,
        name = <<"黑棋">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 20135, mp_lim = 3168, inner_att = 79, outer_att = 79, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1184
    };
get(261029) ->
    #mon{
        mid = 261029,
        name = <<"黑棋">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 21440, mp_lim = 3279, inner_att = 84, outer_att = 84, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1189
    };
get(261030) ->
    #mon{
        mid = 261030,
        name = <<"黑棋">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 22625, mp_lim = 3384, inner_att = 88, outer_att = 88, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1197
    };
get(261031) ->
    #mon{
        mid = 261031,
        name = <<"黑棋">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 93, outer_att = 93, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1205
    };
get(261032) ->
    #mon{
        mid = 261032,
        name = <<"黑棋">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 25255, mp_lim = 3601, inner_att = 98, outer_att = 98, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1213
    };
get(261033) ->
    #mon{
        mid = 261033,
        name = <<"黑棋">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 26710, mp_lim = 3712, inner_att = 103, outer_att = 103, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1222
    };
get(261034) ->
    #mon{
        mid = 261034,
        name = <<"黑棋">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 28030, mp_lim = 3817, inner_att = 108, outer_att = 108, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1230
    };
get(261035) ->
    #mon{
        mid = 261035,
        name = <<"黑棋">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 29560, mp_lim = 3928, inner_att = 113, outer_att = 113, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1243
    };
get(261036) ->
    #mon{
        mid = 261036,
        name = <<"黑棋">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 30950, mp_lim = 4034, inner_att = 119, outer_att = 119, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1255
    };
get(261037) ->
    #mon{
        mid = 261037,
        name = <<"黑棋">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 33245, mp_lim = 4145, inner_att = 127, outer_att = 127, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1268
    };
get(261038) ->
    #mon{
        mid = 261038,
        name = <<"黑棋">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 35425, mp_lim = 4250, inner_att = 135, outer_att = 135, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1280
    };
get(261039) ->
    #mon{
        mid = 261039,
        name = <<"黑棋">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 37875, mp_lim = 4361, inner_att = 144, outer_att = 144, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1293
    };
get(261040) ->
    #mon{
        mid = 261040,
        name = <<"黑棋">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 40190, mp_lim = 4467, inner_att = 153, outer_att = 153, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1309
    };
get(261041) ->
    #mon{
        mid = 261041,
        name = <<"黑棋">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 162, outer_att = 162, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1326
    };
get(261042) ->
    #mon{
        mid = 261042,
        name = <<"黑棋">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 45235, mp_lim = 4683, inner_att = 171, outer_att = 171, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1343
    };
get(261043) ->
    #mon{
        mid = 261043,
        name = <<"黑棋">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 47985, mp_lim = 4794, inner_att = 181, outer_att = 181, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1360
    };
get(261044) ->
    #mon{
        mid = 261044,
        name = <<"黑棋">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 50570, mp_lim = 4900, inner_att = 191, outer_att = 191, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1377
    };
get(261045) ->
    #mon{
        mid = 261045,
        name = <<"黑棋">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 53470, mp_lim = 5011, inner_att = 201, outer_att = 201, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1400
    };
get(261046) ->
    #mon{
        mid = 261046,
        name = <<"黑棋">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 56190, mp_lim = 5116, inner_att = 211, outer_att = 211, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1423
    };
get(261047) ->
    #mon{
        mid = 261047,
        name = <<"黑棋">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 59240, mp_lim = 5227, inner_att = 222, outer_att = 222, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1446
    };
get(261048) ->
    #mon{
        mid = 261048,
        name = <<"黑棋">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 62095, mp_lim = 5333, inner_att = 233, outer_att = 233, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1470
    };
get(261049) ->
    #mon{
        mid = 261049,
        name = <<"黑棋">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 65300, mp_lim = 5444, inner_att = 244, outer_att = 244, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1493
    };
get(261050) ->
    #mon{
        mid = 261050,
        name = <<"黑棋">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 68290, mp_lim = 5549, inner_att = 255, outer_att = 255, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1522
    };
get(261051) ->
    #mon{
        mid = 261051,
        name = <<"黑棋">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 267, outer_att = 267, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1552
    };
get(261052) ->
    #mon{
        mid = 261052,
        name = <<"黑棋">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 74765, mp_lim = 5766, inner_att = 279, outer_att = 279, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1582
    };
get(261053) ->
    #mon{
        mid = 261053,
        name = <<"黑棋">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 78270, mp_lim = 5877, inner_att = 291, outer_att = 291, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1611
    };
get(261054) ->
    #mon{
        mid = 261054,
        name = <<"黑棋">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 81530, mp_lim = 5982, inner_att = 303, outer_att = 303, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1641
    };
get(261055) ->
    #mon{
        mid = 261055,
        name = <<"黑棋">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 85180, mp_lim = 6093, inner_att = 316, outer_att = 316, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1677
    };
get(261056) ->
    #mon{
        mid = 261056,
        name = <<"黑棋">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 88575, mp_lim = 6199, inner_att = 329, outer_att = 329, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1713
    };
get(261057) ->
    #mon{
        mid = 261057,
        name = <<"黑棋">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 92380, mp_lim = 6310, inner_att = 342, outer_att = 342, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1749
    };
get(261058) ->
    #mon{
        mid = 261058,
        name = <<"黑棋">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 95910, mp_lim = 6415, inner_att = 355, outer_att = 355, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1785
    };
get(261059) ->
    #mon{
        mid = 261059,
        name = <<"黑棋">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 99865, mp_lim = 6526, inner_att = 369, outer_att = 369, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1821
    };
get(261060) ->
    #mon{
        mid = 261060,
        name = <<"黑棋">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 103530, mp_lim = 6632, inner_att = 382, outer_att = 382, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1867
    };
get(261061) ->
    #mon{
        mid = 261061,
        name = <<"黑棋">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 397, outer_att = 397, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1912
    };
get(261062) ->
    #mon{
        mid = 261062,
        name = <<"黑棋">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 111435, mp_lim = 6848, inner_att = 411, outer_att = 411, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1958
    };
get(261063) ->
    #mon{
        mid = 261063,
        name = <<"黑棋">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 115695, mp_lim = 6959, inner_att = 426, outer_att = 426, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2004
    };
get(261064) ->
    #mon{
        mid = 261064,
        name = <<"黑棋">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 119630, mp_lim = 7065, inner_att = 440, outer_att = 440, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2049
    };
get(261065) ->
    #mon{
        mid = 261065,
        name = <<"黑棋">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 124035, mp_lim = 7176, inner_att = 456, outer_att = 456, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2104
    };
get(261066) ->
    #mon{
        mid = 261066,
        name = <<"黑棋">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 128105, mp_lim = 7281, inner_att = 471, outer_att = 471, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2160
    };
get(261067) ->
    #mon{
        mid = 261067,
        name = <<"黑棋">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 132665, mp_lim = 7392, inner_att = 487, outer_att = 487, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2215
    };
get(261068) ->
    #mon{
        mid = 261068,
        name = <<"黑棋">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 136870, mp_lim = 7498, inner_att = 502, outer_att = 502, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2270
    };
get(261069) ->
    #mon{
        mid = 261069,
        name = <<"黑棋">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 141575, mp_lim = 7609, inner_att = 519, outer_att = 519, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2325
    };
get(261070) ->
    #mon{
        mid = 261070,
        name = <<"黑棋">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 145915, mp_lim = 7714, inner_att = 534, outer_att = 534, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2394
    };
get(261071) ->
    #mon{
        mid = 261071,
        name = <<"黑棋">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 552, outer_att = 552, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2462
    };
get(261072) ->
    #mon{
        mid = 261072,
        name = <<"黑棋">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 155250, mp_lim = 7931, inner_att = 568, outer_att = 568, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2530
    };
get(261073) ->
    #mon{
        mid = 261073,
        name = <<"黑棋">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 160260, mp_lim = 8042, inner_att = 585, outer_att = 585, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2599
    };
get(261074) ->
    #mon{
        mid = 261074,
        name = <<"黑棋">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 164870, mp_lim = 8147, inner_att = 602, outer_att = 602, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2667
    };
get(261075) ->
    #mon{
        mid = 261075,
        name = <<"黑棋">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 169345, mp_lim = 8258, inner_att = 618, outer_att = 618, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2748
    };
get(261076) ->
    #mon{
        mid = 261076,
        name = <<"黑棋">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 173390, mp_lim = 8364, inner_att = 632, outer_att = 632, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2830
    };
get(261077) ->
    #mon{
        mid = 261077,
        name = <<"黑棋">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 177975, mp_lim = 8475, inner_att = 648, outer_att = 648, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2911
    };
get(261078) ->
    #mon{
        mid = 261078,
        name = <<"黑棋">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 182125, mp_lim = 8580, inner_att = 664, outer_att = 664, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2993
    };
get(261079) ->
    #mon{
        mid = 261079,
        name = <<"黑棋">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 186825, mp_lim = 8691, inner_att = 680, outer_att = 680, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3074
    };
get(261080) ->
    #mon{
        mid = 261080,
        name = <<"黑棋">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 191070, mp_lim = 8797, inner_att = 695, outer_att = 695, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3184
    };
get(261081) ->
    #mon{
        mid = 261081,
        name = <<"黑棋">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 712, outer_att = 712, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3295
    };
get(261082) ->
    #mon{
        mid = 261082,
        name = <<"黑棋">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 200230, mp_lim = 9013, inner_att = 728, outer_att = 728, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3405
    };
get(261083) ->
    #mon{
        mid = 261083,
        name = <<"黑棋">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 205160, mp_lim = 9124, inner_att = 745, outer_att = 745, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3516
    };
get(261084) ->
    #mon{
        mid = 261084,
        name = <<"黑棋">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 209610, mp_lim = 9230, inner_att = 761, outer_att = 761, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3626
    };
get(261085) ->
    #mon{
        mid = 261085,
        name = <<"黑棋">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 214645, mp_lim = 9341, inner_att = 778, outer_att = 778, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3766
    };
get(261086) ->
    #mon{
        mid = 261086,
        name = <<"黑棋">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 219200, mp_lim = 9446, inner_att = 795, outer_att = 795, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3905
    };
get(261087) ->
    #mon{
        mid = 261087,
        name = <<"黑棋">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 224350, mp_lim = 9557, inner_att = 813, outer_att = 813, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4045
    };
get(261088) ->
    #mon{
        mid = 261088,
        name = <<"黑棋">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 229000, mp_lim = 9663, inner_att = 830, outer_att = 830, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4185
    };
get(261089) ->
    #mon{
        mid = 261089,
        name = <<"黑棋">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 234265, mp_lim = 9774, inner_att = 848, outer_att = 848, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4324
    };
get(261090) ->
    #mon{
        mid = 261090,
        name = <<"黑棋">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 239020, mp_lim = 9879, inner_att = 865, outer_att = 865, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4504
    };
get(261091) ->
    #mon{
        mid = 261091,
        name = <<"黑棋">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 884, outer_att = 884, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4683
    };
get(261092) ->
    #mon{
        mid = 261092,
        name = <<"黑棋">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 250925, mp_lim = 10096, inner_att = 901, outer_att = 901, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4862
    };
get(261093) ->
    #mon{
        mid = 261093,
        name = <<"黑棋">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 257285, mp_lim = 10207, inner_att = 920, outer_att = 920, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5042
    };
get(261094) ->
    #mon{
        mid = 261094,
        name = <<"黑棋">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 263120, mp_lim = 10312, inner_att = 938, outer_att = 938, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5221
    };
get(261095) ->
    #mon{
        mid = 261095,
        name = <<"黑棋">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 269625, mp_lim = 10423, inner_att = 958, outer_att = 958, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5442
    };
get(261096) ->
    #mon{
        mid = 261096,
        name = <<"黑棋">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 275595, mp_lim = 10529, inner_att = 976, outer_att = 976, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5664
    };
get(261097) ->
    #mon{
        mid = 261097,
        name = <<"黑棋">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 282255, mp_lim = 10640, inner_att = 996, outer_att = 996, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5885
    };
get(261098) ->
    #mon{
        mid = 261098,
        name = <<"黑棋">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 288360, mp_lim = 10745, inner_att = 1015, outer_att = 1015, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6107
    };
get(261099) ->
    #mon{
        mid = 261099,
        name = <<"黑棋">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 295170, mp_lim = 10856, inner_att = 1035, outer_att = 1035, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6328
    };
get(261100) ->
    #mon{
        mid = 261100,
        name = <<"黑棋">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 301405, mp_lim = 10962, inner_att = 1054, outer_att = 1054, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6328
    };
get(262001) ->
    #mon{
        mid = 262001,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 3184, mp_lim = 49, inner_att = 11, outer_att = 11, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 1868
    };
get(262002) ->
    #mon{
        mid = 262002,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 4304, mp_lim = 353, inner_att = 14, outer_att = 14, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 2801
    };
get(262003) ->
    #mon{
        mid = 262003,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 5744, mp_lim = 464, inner_att = 16, outer_att = 16, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 3735
    };
get(262004) ->
    #mon{
        mid = 262004,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 6976, mp_lim = 570, inner_att = 18, outer_att = 18, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 4669
    };
get(262005) ->
    #mon{
        mid = 262005,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 8528, mp_lim = 681, inner_att = 20, outer_att = 20, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 5603
    };
get(262006) ->
    #mon{
        mid = 262006,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 9872, mp_lim = 786, inner_att = 23, outer_att = 23, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 6537
    };
get(262007) ->
    #mon{
        mid = 262007,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 11536, mp_lim = 897, inner_att = 25, outer_att = 25, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 7470
    };
get(262008) ->
    #mon{
        mid = 262008,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 12992, mp_lim = 1003, inner_att = 28, outer_att = 28, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 8404
    };
get(262009) ->
    #mon{
        mid = 262009,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 14784, mp_lim = 1114, inner_att = 30, outer_att = 30, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 9338
    };
get(262010) ->
    #mon{
        mid = 262010,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 16336, mp_lim = 1219, inner_att = 33, outer_att = 33, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11075
    };
get(262011) ->
    #mon{
        mid = 262011,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 18256, mp_lim = 1330, inner_att = 36, outer_att = 36, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11117
    };
get(262012) ->
    #mon{
        mid = 262012,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 19920, mp_lim = 1436, inner_att = 39, outer_att = 39, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11160
    };
get(262013) ->
    #mon{
        mid = 262013,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 21968, mp_lim = 1547, inner_att = 42, outer_att = 42, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11203
    };
get(262014) ->
    #mon{
        mid = 262014,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 23728, mp_lim = 1652, inner_att = 45, outer_att = 45, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11245
    };
get(262015) ->
    #mon{
        mid = 262015,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 25888, mp_lim = 1763, inner_att = 48, outer_att = 48, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11288
    };
get(262016) ->
    #mon{
        mid = 262016,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 27776, mp_lim = 1869, inner_att = 51, outer_att = 51, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11331
    };
get(262017) ->
    #mon{
        mid = 262017,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 30048, mp_lim = 1980, inner_att = 55, outer_att = 55, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11373
    };
get(262018) ->
    #mon{
        mid = 262018,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 32048, mp_lim = 2085, inner_att = 58, outer_att = 58, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11416
    };
get(262019) ->
    #mon{
        mid = 262019,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 34448, mp_lim = 2196, inner_att = 62, outer_att = 62, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11459
    };
get(262020) ->
    #mon{
        mid = 262020,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 37152, mp_lim = 2302, inner_att = 67, outer_att = 67, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11502
    };
get(262021) ->
    #mon{
        mid = 262021,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 40352, mp_lim = 2413, inner_att = 72, outer_att = 72, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11544
    };
get(262022) ->
    #mon{
        mid = 262022,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 43296, mp_lim = 2518, inner_att = 77, outer_att = 77, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11587
    };
get(262023) ->
    #mon{
        mid = 262023,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 46736, mp_lim = 2629, inner_att = 82, outer_att = 82, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11630
    };
get(262024) ->
    #mon{
        mid = 262024,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 49888, mp_lim = 2735, inner_att = 87, outer_att = 87, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11672
    };
get(262025) ->
    #mon{
        mid = 262025,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 53568, mp_lim = 2846, inner_att = 93, outer_att = 93, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11715
    };
get(262026) ->
    #mon{
        mid = 262026,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 56928, mp_lim = 2951, inner_att = 98, outer_att = 98, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11758
    };
get(262027) ->
    #mon{
        mid = 262027,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 60864, mp_lim = 3062, inner_att = 105, outer_att = 105, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11801
    };
get(262028) ->
    #mon{
        mid = 262028,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 64432, mp_lim = 3168, inner_att = 111, outer_att = 111, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11843
    };
get(262029) ->
    #mon{
        mid = 262029,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 68608, mp_lim = 3279, inner_att = 117, outer_att = 117, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11886
    };
get(262030) ->
    #mon{
        mid = 262030,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 72400, mp_lim = 3384, inner_att = 123, outer_att = 123, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 11969
    };
get(262031) ->
    #mon{
        mid = 262031,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 76816, mp_lim = 3495, inner_att = 130, outer_att = 130, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12051
    };
get(262032) ->
    #mon{
        mid = 262032,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 80816, mp_lim = 3601, inner_att = 137, outer_att = 137, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12134
    };
get(262033) ->
    #mon{
        mid = 262033,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 85472, mp_lim = 3712, inner_att = 144, outer_att = 144, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12217
    };
get(262034) ->
    #mon{
        mid = 262034,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 89696, mp_lim = 3817, inner_att = 151, outer_att = 151, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12300
    };
get(262035) ->
    #mon{
        mid = 262035,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 94592, mp_lim = 3928, inner_att = 158, outer_att = 158, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12425
    };
get(262036) ->
    #mon{
        mid = 262036,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 99040, mp_lim = 4034, inner_att = 166, outer_att = 166, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12550
    };
get(262037) ->
    #mon{
        mid = 262037,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 106384, mp_lim = 4145, inner_att = 177, outer_att = 177, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12676
    };
get(262038) ->
    #mon{
        mid = 262038,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 113360, mp_lim = 4250, inner_att = 189, outer_att = 189, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12801
    };
get(262039) ->
    #mon{
        mid = 262039,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 121200, mp_lim = 4361, inner_att = 202, outer_att = 202, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 12927
    };
get(262040) ->
    #mon{
        mid = 262040,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 128608, mp_lim = 4467, inner_att = 214, outer_att = 214, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13095
    };
get(262041) ->
    #mon{
        mid = 262041,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 136912, mp_lim = 4578, inner_att = 227, outer_att = 227, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13263
    };
get(262042) ->
    #mon{
        mid = 262042,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 144752, mp_lim = 4683, inner_att = 240, outer_att = 240, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13431
    };
get(262043) ->
    #mon{
        mid = 262043,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 153552, mp_lim = 4794, inner_att = 254, outer_att = 254, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13599
    };
get(262044) ->
    #mon{
        mid = 262044,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 161824, mp_lim = 4900, inner_att = 267, outer_att = 267, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13767
    };
get(262045) ->
    #mon{
        mid = 262045,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 171104, mp_lim = 5011, inner_att = 282, outer_att = 282, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 13999
    };
get(262046) ->
    #mon{
        mid = 262046,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 179808, mp_lim = 5116, inner_att = 296, outer_att = 296, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 14232
    };
get(262047) ->
    #mon{
        mid = 262047,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 189568, mp_lim = 5227, inner_att = 311, outer_att = 311, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 14464
    };
get(262048) ->
    #mon{
        mid = 262048,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 198704, mp_lim = 5333, inner_att = 326, outer_att = 326, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 14696
    };
get(262049) ->
    #mon{
        mid = 262049,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 208960, mp_lim = 5444, inner_att = 342, outer_att = 342, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 14928
    };
get(262050) ->
    #mon{
        mid = 262050,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 218528, mp_lim = 5549, inner_att = 357, outer_att = 357, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 15224
    };
get(262051) ->
    #mon{
        mid = 262051,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 229248, mp_lim = 5660, inner_att = 374, outer_att = 374, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 15520
    };
get(262052) ->
    #mon{
        mid = 262052,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 239248, mp_lim = 5766, inner_att = 390, outer_att = 390, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 15817
    };
get(262053) ->
    #mon{
        mid = 262053,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 250464, mp_lim = 5877, inner_att = 408, outer_att = 408, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 16113
    };
get(262054) ->
    #mon{
        mid = 262054,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 260896, mp_lim = 5982, inner_att = 424, outer_att = 424, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 16409
    };
get(262055) ->
    #mon{
        mid = 262055,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 272576, mp_lim = 6093, inner_att = 443, outer_att = 443, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 16770
    };
get(262056) ->
    #mon{
        mid = 262056,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 283440, mp_lim = 6199, inner_att = 460, outer_att = 460, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 17130
    };
get(262057) ->
    #mon{
        mid = 262057,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 295616, mp_lim = 6310, inner_att = 479, outer_att = 479, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 17490
    };
get(262058) ->
    #mon{
        mid = 262058,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 306912, mp_lim = 6415, inner_att = 497, outer_att = 497, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 17850
    };
get(262059) ->
    #mon{
        mid = 262059,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 319568, mp_lim = 6526, inner_att = 516, outer_att = 516, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 18211
    };
get(262060) ->
    #mon{
        mid = 262060,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 331296, mp_lim = 6632, inner_att = 535, outer_att = 535, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 18667
    };
get(262061) ->
    #mon{
        mid = 262061,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 344432, mp_lim = 6743, inner_att = 556, outer_att = 556, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 19123
    };
get(262062) ->
    #mon{
        mid = 262062,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 356592, mp_lim = 6848, inner_att = 575, outer_att = 575, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 19580
    };
get(262063) ->
    #mon{
        mid = 262063,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 370224, mp_lim = 6959, inner_att = 596, outer_att = 596, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 20036
    };
get(262064) ->
    #mon{
        mid = 262064,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 382816, mp_lim = 7065, inner_att = 616, outer_att = 616, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 20492
    };
get(262065) ->
    #mon{
        mid = 262065,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 396912, mp_lim = 7176, inner_att = 638, outer_att = 638, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 21044
    };
get(262066) ->
    #mon{
        mid = 262066,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 409936, mp_lim = 7281, inner_att = 659, outer_att = 659, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 21597
    };
get(262067) ->
    #mon{
        mid = 262067,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 424528, mp_lim = 7392, inner_att = 681, outer_att = 681, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 22149
    };
get(262068) ->
    #mon{
        mid = 262068,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 437984, mp_lim = 7498, inner_att = 703, outer_att = 703, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 22702
    };
get(262069) ->
    #mon{
        mid = 262069,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 453040, mp_lim = 7609, inner_att = 726, outer_att = 726, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 23254
    };
get(262070) ->
    #mon{
        mid = 262070,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 466928, mp_lim = 7714, inner_att = 748, outer_att = 748, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 23937
    };
get(262071) ->
    #mon{
        mid = 262071,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 482480, mp_lim = 7825, inner_att = 772, outer_att = 772, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 24620
    };
get(262072) ->
    #mon{
        mid = 262072,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 496800, mp_lim = 7931, inner_att = 795, outer_att = 795, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 25304
    };
get(262073) ->
    #mon{
        mid = 262073,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 512832, mp_lim = 8042, inner_att = 819, outer_att = 819, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 25987
    };
get(262074) ->
    #mon{
        mid = 262074,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 527584, mp_lim = 8147, inner_att = 843, outer_att = 843, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 26670
    };
get(262075) ->
    #mon{
        mid = 262075,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 541904, mp_lim = 8258, inner_att = 865, outer_att = 865, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 27484
    };
get(262076) ->
    #mon{
        mid = 262076,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 554848, mp_lim = 8364, inner_att = 885, outer_att = 885, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 28298
    };
get(262077) ->
    #mon{
        mid = 262077,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 569520, mp_lim = 8475, inner_att = 907, outer_att = 907, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 29112
    };
get(262078) ->
    #mon{
        mid = 262078,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 582800, mp_lim = 8580, inner_att = 929, outer_att = 929, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 29926
    };
get(262079) ->
    #mon{
        mid = 262079,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 597840, mp_lim = 8691, inner_att = 952, outer_att = 952, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 30740
    };
get(262080) ->
    #mon{
        mid = 262080,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 611424, mp_lim = 8797, inner_att = 973, outer_att = 973, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 31844
    };
get(262081) ->
    #mon{
        mid = 262081,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 626832, mp_lim = 8908, inner_att = 996, outer_att = 996, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 32949
    };
get(262082) ->
    #mon{
        mid = 262082,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 640736, mp_lim = 9013, inner_att = 1019, outer_att = 1019, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 34054
    };
get(262083) ->
    #mon{
        mid = 262083,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 656512, mp_lim = 9124, inner_att = 1043, outer_att = 1043, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 35159
    };
get(262084) ->
    #mon{
        mid = 262084,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 670752, mp_lim = 9230, inner_att = 1066, outer_att = 1066, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 36264
    };
get(262085) ->
    #mon{
        mid = 262085,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 686864, mp_lim = 9341, inner_att = 1089, outer_att = 1089, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 37659
    };
get(262086) ->
    #mon{
        mid = 262086,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 701440, mp_lim = 9446, inner_att = 1113, outer_att = 1113, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 39055
    };
get(262087) ->
    #mon{
        mid = 262087,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 717920, mp_lim = 9557, inner_att = 1138, outer_att = 1138, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 40451
    };
get(262088) ->
    #mon{
        mid = 262088,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 732800, mp_lim = 9663, inner_att = 1162, outer_att = 1162, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 41846
    };
get(262089) ->
    #mon{
        mid = 262089,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 749648, mp_lim = 9774, inner_att = 1187, outer_att = 1187, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 43242
    };
get(262090) ->
    #mon{
        mid = 262090,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 764864, mp_lim = 9879, inner_att = 1211, outer_att = 1211, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 45035
    };
get(262091) ->
    #mon{
        mid = 262091,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 784736, mp_lim = 9990, inner_att = 1237, outer_att = 1237, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 46829
    };
get(262092) ->
    #mon{
        mid = 262092,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 802960, mp_lim = 10096, inner_att = 1262, outer_att = 1262, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 48622
    };
get(262093) ->
    #mon{
        mid = 262093,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 823312, mp_lim = 10207, inner_att = 1288, outer_att = 1288, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 50415
    };
get(262094) ->
    #mon{
        mid = 262094,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 841984, mp_lim = 10312, inner_att = 1313, outer_att = 1313, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 52209
    };
get(262095) ->
    #mon{
        mid = 262095,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 862800, mp_lim = 10423, inner_att = 1341, outer_att = 1341, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 54424
    };
get(262096) ->
    #mon{
        mid = 262096,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 881904, mp_lim = 10529, inner_att = 1367, outer_att = 1367, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 56638
    };
get(262097) ->
    #mon{
        mid = 262097,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 903216, mp_lim = 10640, inner_att = 1394, outer_att = 1394, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 58853
    };
get(262098) ->
    #mon{
        mid = 262098,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 922752, mp_lim = 10745, inner_att = 1421, outer_att = 1421, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 61068
    };
get(262099) ->
    #mon{
        mid = 262099,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 944544, mp_lim = 10856, inner_att = 1449, outer_att = 1449, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 63283
    };
get(262100) ->
    #mon{
        mid = 262100,
        name = <<"黄金棋子">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 964496, mp_lim = 10962, inner_att = 1475, outer_att = 1475, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 63283
    };
get(263001) ->
    #mon{
        mid = 263001,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5572, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 1868
    };
get(263002) ->
    #mon{
        mid = 263002,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 7532, mp_lim = 353, inner_att = 40, outer_att = 40, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 2801
    };
get(263003) ->
    #mon{
        mid = 263003,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 10052, mp_lim = 464, inner_att = 46, outer_att = 46, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 3735
    };
get(263004) ->
    #mon{
        mid = 263004,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 4,
        attr = #bt_attr{hp_lim = 12208, mp_lim = 570, inner_att = 52, outer_att = 52, inner_def = 20, outer_def = 20, hit = 239, dodge = 18, crit_hurt = 22, crit_def = 5, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 4669
    };
get(263005) ->
    #mon{
        mid = 263005,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 14924, mp_lim = 681, inner_att = 58, outer_att = 58, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 5603
    };
get(263006) ->
    #mon{
        mid = 263006,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 17276, mp_lim = 786, inner_att = 66, outer_att = 66, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 6537
    };
get(263007) ->
    #mon{
        mid = 263007,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 20188, mp_lim = 897, inner_att = 72, outer_att = 72, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 7470
    };
get(263008) ->
    #mon{
        mid = 263008,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 22736, mp_lim = 1003, inner_att = 80, outer_att = 80, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 8404
    };
get(263009) ->
    #mon{
        mid = 263009,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 25872, mp_lim = 1114, inner_att = 88, outer_att = 88, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 9338
    };
get(263010) ->
    #mon{
        mid = 263010,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 28588, mp_lim = 1219, inner_att = 96, outer_att = 96, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11075
    };
get(263011) ->
    #mon{
        mid = 263011,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31948, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11117
    };
get(263012) ->
    #mon{
        mid = 263012,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 34860, mp_lim = 1436, inner_att = 112, outer_att = 112, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11160
    };
get(263013) ->
    #mon{
        mid = 263013,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 38444, mp_lim = 1547, inner_att = 120, outer_att = 120, inner_def = 57, outer_def = 57, hit = 597, dodge = 51, crit_hurt = 58, crit_def = 13, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11203
    };
get(263014) ->
    #mon{
        mid = 263014,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 41524, mp_lim = 1652, inner_att = 130, outer_att = 130, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11245
    };
get(263015) ->
    #mon{
        mid = 263015,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 45304, mp_lim = 1763, inner_att = 138, outer_att = 138, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11288
    };
get(263016) ->
    #mon{
        mid = 263016,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 48608, mp_lim = 1869, inner_att = 148, outer_att = 148, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11331
    };
get(263017) ->
    #mon{
        mid = 263017,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 52584, mp_lim = 1980, inner_att = 158, outer_att = 158, inner_def = 76, outer_def = 76, hit = 789, dodge = 69, crit_hurt = 77, crit_def = 18, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11373
    };
get(263018) ->
    #mon{
        mid = 263018,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 56084, mp_lim = 2085, inner_att = 168, outer_att = 168, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11416
    };
get(263019) ->
    #mon{
        mid = 263019,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 19,
        attr = #bt_attr{hp_lim = 60284, mp_lim = 2196, inner_att = 178, outer_att = 178, inner_def = 87, outer_def = 87, hit = 893, dodge = 78, crit_hurt = 87, crit_def = 20, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11459
    };
get(263020) ->
    #mon{
        mid = 263020,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 65016, mp_lim = 2302, inner_att = 192, outer_att = 192, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11502
    };
get(263021) ->
    #mon{
        mid = 263021,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 70616, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11544
    };
get(263022) ->
    #mon{
        mid = 263022,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 75768, mp_lim = 2518, inner_att = 220, outer_att = 220, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11587
    };
get(263023) ->
    #mon{
        mid = 263023,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 23,
        attr = #bt_attr{hp_lim = 81788, mp_lim = 2629, inner_att = 236, outer_att = 236, inner_def = 118, outer_def = 118, hit = 1188, dodge = 106, crit_hurt = 116, crit_def = 27, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11630
    };
get(263024) ->
    #mon{
        mid = 263024,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 87304, mp_lim = 2735, inner_att = 250, outer_att = 250, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11672
    };
get(263025) ->
    #mon{
        mid = 263025,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 93744, mp_lim = 2846, inner_att = 266, outer_att = 266, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11715
    };
get(263026) ->
    #mon{
        mid = 263026,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 99624, mp_lim = 2951, inner_att = 282, outer_att = 282, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11758
    };
get(263027) ->
    #mon{
        mid = 263027,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 106512, mp_lim = 3062, inner_att = 300, outer_att = 300, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11801
    };
get(263028) ->
    #mon{
        mid = 263028,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 112756, mp_lim = 3168, inner_att = 318, outer_att = 318, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11843
    };
get(263029) ->
    #mon{
        mid = 263029,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 120064, mp_lim = 3279, inner_att = 336, outer_att = 336, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11886
    };
get(263030) ->
    #mon{
        mid = 263030,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 126700, mp_lim = 3384, inner_att = 354, outer_att = 354, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 11969
    };
get(263031) ->
    #mon{
        mid = 263031,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 134428, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12051
    };
get(263032) ->
    #mon{
        mid = 263032,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 141428, mp_lim = 3601, inner_att = 392, outer_att = 392, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12134
    };
get(263033) ->
    #mon{
        mid = 263033,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 149576, mp_lim = 3712, inner_att = 414, outer_att = 414, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12217
    };
get(263034) ->
    #mon{
        mid = 263034,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 156968, mp_lim = 3817, inner_att = 432, outer_att = 432, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12300
    };
get(263035) ->
    #mon{
        mid = 263035,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 165536, mp_lim = 3928, inner_att = 454, outer_att = 454, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12425
    };
get(263036) ->
    #mon{
        mid = 263036,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 173320, mp_lim = 4034, inner_att = 476, outer_att = 476, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12550
    };
get(263037) ->
    #mon{
        mid = 263037,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 186172, mp_lim = 4145, inner_att = 508, outer_att = 508, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12676
    };
get(263038) ->
    #mon{
        mid = 263038,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 198380, mp_lim = 4250, inner_att = 542, outer_att = 542, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12801
    };
get(263039) ->
    #mon{
        mid = 263039,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 212100, mp_lim = 4361, inner_att = 578, outer_att = 578, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 12927
    };
get(263040) ->
    #mon{
        mid = 263040,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 225064, mp_lim = 4467, inner_att = 612, outer_att = 612, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13095
    };
get(263041) ->
    #mon{
        mid = 263041,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 239596, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13263
    };
get(263042) ->
    #mon{
        mid = 263042,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 253316, mp_lim = 4683, inner_att = 686, outer_att = 686, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13431
    };
get(263043) ->
    #mon{
        mid = 263043,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 268716, mp_lim = 4794, inner_att = 726, outer_att = 726, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13599
    };
get(263044) ->
    #mon{
        mid = 263044,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 283192, mp_lim = 4900, inner_att = 764, outer_att = 764, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13767
    };
get(263045) ->
    #mon{
        mid = 263045,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 299432, mp_lim = 5011, inner_att = 806, outer_att = 806, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 13999
    };
get(263046) ->
    #mon{
        mid = 263046,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 314664, mp_lim = 5116, inner_att = 846, outer_att = 846, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 14232
    };
get(263047) ->
    #mon{
        mid = 263047,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 331744, mp_lim = 5227, inner_att = 890, outer_att = 890, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 14464
    };
get(263048) ->
    #mon{
        mid = 263048,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 347732, mp_lim = 5333, inner_att = 932, outer_att = 932, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 14696
    };
get(263049) ->
    #mon{
        mid = 263049,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 365680, mp_lim = 5444, inner_att = 978, outer_att = 978, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 14928
    };
get(263050) ->
    #mon{
        mid = 263050,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 382424, mp_lim = 5549, inner_att = 1022, outer_att = 1022, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 15224
    };
get(263051) ->
    #mon{
        mid = 263051,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 401184, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 15520
    };
get(263052) ->
    #mon{
        mid = 263052,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 418684, mp_lim = 5766, inner_att = 1116, outer_att = 1116, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 15817
    };
get(263053) ->
    #mon{
        mid = 263053,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 438312, mp_lim = 5877, inner_att = 1166, outer_att = 1166, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 16113
    };
get(263054) ->
    #mon{
        mid = 263054,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 456568, mp_lim = 5982, inner_att = 1214, outer_att = 1214, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 16409
    };
get(263055) ->
    #mon{
        mid = 263055,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 477008, mp_lim = 6093, inner_att = 1266, outer_att = 1266, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 16770
    };
get(263056) ->
    #mon{
        mid = 263056,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 496020, mp_lim = 6199, inner_att = 1316, outer_att = 1316, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 17130
    };
get(263057) ->
    #mon{
        mid = 263057,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 517328, mp_lim = 6310, inner_att = 1370, outer_att = 1370, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 17490
    };
get(263058) ->
    #mon{
        mid = 263058,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 537096, mp_lim = 6415, inner_att = 1422, outer_att = 1422, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 17850
    };
get(263059) ->
    #mon{
        mid = 263059,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 559244, mp_lim = 6526, inner_att = 1476, outer_att = 1476, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 18211
    };
get(263060) ->
    #mon{
        mid = 263060,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 579768, mp_lim = 6632, inner_att = 1530, outer_att = 1530, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 18667
    };
get(263061) ->
    #mon{
        mid = 263061,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 602756, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 19123
    };
get(263062) ->
    #mon{
        mid = 263062,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 624036, mp_lim = 6848, inner_att = 1644, outer_att = 1644, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 19580
    };
get(263063) ->
    #mon{
        mid = 263063,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 647892, mp_lim = 6959, inner_att = 1704, outer_att = 1704, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 20036
    };
get(263064) ->
    #mon{
        mid = 263064,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 669928, mp_lim = 7065, inner_att = 1762, outer_att = 1762, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 20492
    };
get(263065) ->
    #mon{
        mid = 263065,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 694596, mp_lim = 7176, inner_att = 1824, outer_att = 1824, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 21044
    };
get(263066) ->
    #mon{
        mid = 263066,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 717388, mp_lim = 7281, inner_att = 1884, outer_att = 1884, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 21597
    };
get(263067) ->
    #mon{
        mid = 263067,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 742924, mp_lim = 7392, inner_att = 1948, outer_att = 1948, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 22149
    };
get(263068) ->
    #mon{
        mid = 263068,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 766472, mp_lim = 7498, inner_att = 2010, outer_att = 2010, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 22702
    };
get(263069) ->
    #mon{
        mid = 263069,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 792820, mp_lim = 7609, inner_att = 2076, outer_att = 2076, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 23254
    };
get(263070) ->
    #mon{
        mid = 263070,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 817124, mp_lim = 7714, inner_att = 2138, outer_att = 2138, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 23937
    };
get(263071) ->
    #mon{
        mid = 263071,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 844340, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 24620
    };
get(263072) ->
    #mon{
        mid = 263072,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 869400, mp_lim = 7931, inner_att = 2272, outer_att = 2272, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 25304
    };
get(263073) ->
    #mon{
        mid = 263073,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 897456, mp_lim = 8042, inner_att = 2342, outer_att = 2342, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 25987
    };
get(263074) ->
    #mon{
        mid = 263074,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 923272, mp_lim = 8147, inner_att = 2410, outer_att = 2410, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 26670
    };
get(263075) ->
    #mon{
        mid = 263075,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 948332, mp_lim = 8258, inner_att = 2472, outer_att = 2472, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 27484
    };
get(263076) ->
    #mon{
        mid = 263076,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 970984, mp_lim = 8364, inner_att = 2530, outer_att = 2530, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 28298
    };
get(263077) ->
    #mon{
        mid = 263077,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 996660, mp_lim = 8475, inner_att = 2594, outer_att = 2594, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 29112
    };
get(263078) ->
    #mon{
        mid = 263078,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 1019900, mp_lim = 8580, inner_att = 2656, outer_att = 2656, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 29926
    };
get(263079) ->
    #mon{
        mid = 263079,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 1046220, mp_lim = 8691, inner_att = 2720, outer_att = 2720, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 30740
    };
get(263080) ->
    #mon{
        mid = 263080,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 1069992, mp_lim = 8797, inner_att = 2782, outer_att = 2782, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 31844
    };
get(263081) ->
    #mon{
        mid = 263081,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1096956, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 32949
    };
get(263082) ->
    #mon{
        mid = 263082,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 1121288, mp_lim = 9013, inner_att = 2912, outer_att = 2912, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 34054
    };
get(263083) ->
    #mon{
        mid = 263083,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 1148896, mp_lim = 9124, inner_att = 2980, outer_att = 2980, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 35159
    };
get(263084) ->
    #mon{
        mid = 263084,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 1173816, mp_lim = 9230, inner_att = 3046, outer_att = 3046, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 36264
    };
get(263085) ->
    #mon{
        mid = 263085,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 1202012, mp_lim = 9341, inner_att = 3114, outer_att = 3114, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 37659
    };
get(263086) ->
    #mon{
        mid = 263086,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 1227520, mp_lim = 9446, inner_att = 3182, outer_att = 3182, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 39055
    };
get(263087) ->
    #mon{
        mid = 263087,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 1256360, mp_lim = 9557, inner_att = 3252, outer_att = 3252, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 40451
    };
get(263088) ->
    #mon{
        mid = 263088,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 1282400, mp_lim = 9663, inner_att = 3320, outer_att = 3320, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 41846
    };
get(263089) ->
    #mon{
        mid = 263089,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1311884, mp_lim = 9774, inner_att = 3392, outer_att = 3392, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 43242
    };
get(263090) ->
    #mon{
        mid = 263090,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 1338512, mp_lim = 9879, inner_att = 3462, outer_att = 3462, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 45035
    };
get(263091) ->
    #mon{
        mid = 263091,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1373288, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 46829
    };
get(263092) ->
    #mon{
        mid = 263092,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 1405180, mp_lim = 10096, inner_att = 3606, outer_att = 3606, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 48622
    };
get(263093) ->
    #mon{
        mid = 263093,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 1440796, mp_lim = 10207, inner_att = 3682, outer_att = 3682, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 50415
    };
get(263094) ->
    #mon{
        mid = 263094,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 1473472, mp_lim = 10312, inner_att = 3754, outer_att = 3754, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 52209
    };
get(263095) ->
    #mon{
        mid = 263095,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 1509900, mp_lim = 10423, inner_att = 3832, outer_att = 3832, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 54424
    };
get(263096) ->
    #mon{
        mid = 263096,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 1543332, mp_lim = 10529, inner_att = 3906, outer_att = 3906, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 56638
    };
get(263097) ->
    #mon{
        mid = 263097,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 1580628, mp_lim = 10640, inner_att = 3984, outer_att = 3984, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 58853
    };
get(263098) ->
    #mon{
        mid = 263098,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 1614816, mp_lim = 10745, inner_att = 4060, outer_att = 4060, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 61068
    };
get(263099) ->
    #mon{
        mid = 263099,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 1652952, mp_lim = 10856, inner_att = 4140, outer_att = 4140, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 63283
    };
get(263100) ->
    #mon{
        mid = 263100,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 1687868, mp_lim = 10962, inner_att = 4216, outer_att = 4216, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 284101,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 2010,
        args = [],
        exp = 63283
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

