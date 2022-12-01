%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_29
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_29).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(290001) ->
    #mon{
        mid = 290001,
        name = <<"大宋士兵">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 50, outer_att = 50, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2024,
        args = [],
        exp = 1881
    };
get(290002) ->
    #mon{
        mid = 290002,
        name = <<"钟灵儿">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 50, outer_att = 50, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040021,1,100,12},{20040022,1,100,12},{20040023,1,100,12},{20040024,1,100,12}],
        ai_group = 4008,
        args = [],
        exp = 4971
    };
get(290003) ->
    #mon{
        mid = 290003,
        name = <<"段誉">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 50, outer_att = 50, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040011,1,100,12},{20040012,1,100,12},{20040013,1,100,12},{20040014,1,100,12}],
        ai_group = 4007,
        args = [],
        exp = 4971
    };
get(290004) ->
    #mon{
        mid = 290004,
        name = <<"乔峰">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 300, outer_att = 300, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040001,1,100,4},{20040002,1,100,4},{20040003,1,100,4},{20040004,1,100,4}],
        ai_group = 4010,
        args = [],
        exp = 4971
    };
get(290005) ->
    #mon{
        mid = 290005,
        name = <<"段誉">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 300, outer_att = 300, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040011,1,100,12},{20040012,1,100,12},{20040013,1,100,12},{20040014,1,100,12}],
        ai_group = 4021,
        args = [],
        exp = 4971
    };
get(290006) ->
    #mon{
        mid = 290006,
        name = <<"段誉">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 100, outer_att = 100, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040011,1,100,12},{20040012,1,100,12},{20040013,1,100,12},{20040014,1,100,12}],
        ai_group = 4016,
        args = [],
        exp = 4971
    };
get(290007) ->
    #mon{
        mid = 290007,
        name = <<"钟灵儿">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 100, outer_att = 100, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040021,1,100,12},{20040022,1,100,12},{20040023,1,100,12},{20040024,1,100,12}],
        ai_group = 4016,
        args = [],
        exp = 4971
    };
get(290008) ->
    #mon{
        mid = 290008,
        name = <<"段誉">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 100, outer_att = 100, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 12,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040011,1,100,12},{20040012,1,100,12},{20040013,1,100,12},{20040014,1,100,12}],
        ai_group = 4016,
        args = [],
        exp = 7457
    };
get(290009) ->
    #mon{
        mid = 290009,
        name = <<"乔峰">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 148000000, inner_att = 300, outer_att = 300, inner_def = 99999, outer_def = 99999, hit = 72, dodge = 5, crit_hurt = 7, crit_def = 1, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 1,
        skill_list = [{20040001,1,100,4},{20040002,1,100,4},{20040003,1,100,4},{20040004,1,100,4}],
        ai_group = 4018,
        args = [],
        exp = 365
    };
get(291001) ->
    #mon{
        mid = 291001,
        name = <<"白棋">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 1941, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 122
    };
get(291002) ->
    #mon{
        mid = 291002,
        name = <<"黑棋">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 1941, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1013,
        args = [],
        exp = 122
    };
get(291003) ->
    #mon{
        mid = 291003,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 14562, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 12,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20030601,1,100,12},{20030602,1,100,12}],
        ai_group = 4011,
        args = [],
        exp = 1221
    };
get(291011) ->
    #mon{
        mid = 291011,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4003,
        args = [],
        exp = 4
    };
get(291012) ->
    #mon{
        mid = 291012,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4004,
        args = [],
        exp = 4
    };
get(291013) ->
    #mon{
        mid = 291013,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 568, mp_lim = 1003, inner_att = 10, outer_att = 10, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4005,
        args = [],
        exp = 4
    };
get(291014) ->
    #mon{
        mid = 291014,
        name = <<"大猿王">>,
        boss = 1,
        level = 7,
        attr = #bt_attr{hp_lim = 6056, mp_lim = 897, inner_att = 18, outer_att = 18, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 8,
        sight_area = 12,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20030001,1,100,9},{20030002,1,100,9}],
        ai_group = 4001,
        args = [],
        exp = 90
    };
get(291015) ->
    #mon{
        mid = 291015,
        name = <<"左子穆">>,
        boss = 1,
        level = 8,
        attr = #bt_attr{hp_lim = 6252, mp_lim = 1003, inner_att = 20, outer_att = 20, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 8,
        sight_area = 12,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20030101,1,100,9},{20030102,1,100,9}],
        ai_group = 4002,
        args = [],
        exp = 90
    };
get(291021) ->
    #mon{
        mid = 291021,
        name = <<"喽啰">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 568, mp_lim = 1003, inner_att = 10, outer_att = 10, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 4
    };
get(291022) ->
    #mon{
        mid = 291022,
        name = <<"司空玄">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 7987, mp_lim = 1330, inner_att = 26, outer_att = 26, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 8,
        sight_area = 12,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20030201,1,100,9},{20030202,1,100,9}],
        ai_group = 4006,
        args = [],
        exp = 100
    };
get(291023) ->
    #mon{
        mid = 291023,
        name = <<"木婉清">>,
        boss = 1,
        level = 14,
        attr = #bt_attr{hp_lim = 11419, mp_lim = 1652, inner_att = 32, outer_att = 32, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 8,
        sight_area = 12,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20030301,1,100,9},{20030302,1,100,9}],
        ai_group = 4009,
        args = [],
        exp = 100
    };
get(292001) ->
    #mon{
        mid = 292001,
        name = <<"鸠摩智">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 1167320, mp_lim = 7714, inner_att = 7483, outer_att = 7483, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7600
    };
get(292002) ->
    #mon{
        mid = 292002,
        name = <<"鸠摩智">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 1719630, mp_lim = 8797, inner_att = 10432, outer_att = 10432, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 18150
    };
get(292003) ->
    #mon{
        mid = 292003,
        name = <<"鸠摩智">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 2390200, mp_lim = 9879, inner_att = 13848, outer_att = 13848, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 31320
    };
get(292101) ->
    #mon{
        mid = 292101,
        name = <<"庄聚贤">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 1167320, mp_lim = 7714, inner_att = 7483, outer_att = 7483, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7600
    };
get(292102) ->
    #mon{
        mid = 292102,
        name = <<"庄聚贤">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 1719630, mp_lim = 8797, inner_att = 10432, outer_att = 10432, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 18150
    };
get(292103) ->
    #mon{
        mid = 292103,
        name = <<"庄聚贤">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 2390200, mp_lim = 9879, inner_att = 13848, outer_att = 13848, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 31320
    };
get(292201) ->
    #mon{
        mid = 292201,
        name = <<"慕容复">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 1167320, mp_lim = 7714, inner_att = 7483, outer_att = 7483, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7600
    };
get(292202) ->
    #mon{
        mid = 292202,
        name = <<"慕容复">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 1719630, mp_lim = 8797, inner_att = 10432, outer_att = 10432, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 18150
    };
get(292203) ->
    #mon{
        mid = 292203,
        name = <<"慕容复">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 2390200, mp_lim = 9879, inner_att = 13848, outer_att = 13848, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 31320
    };
get(292301) ->
    #mon{
        mid = 292301,
        name = <<"丁春秋">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 1167320, mp_lim = 7714, inner_att = 7483, outer_att = 7483, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7600
    };
get(292302) ->
    #mon{
        mid = 292302,
        name = <<"丁春秋">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 1719630, mp_lim = 8797, inner_att = 10432, outer_att = 10432, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 18150
    };
get(292303) ->
    #mon{
        mid = 292303,
        name = <<"丁春秋">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 2390200, mp_lim = 9879, inner_att = 13848, outer_att = 13848, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 308001,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 31320
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

