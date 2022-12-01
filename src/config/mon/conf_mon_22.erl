%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_22
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_22).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(220001) ->
    #mon{
        mid = 220001,
        name = <<"演武守卫">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 796, mp_lim = 49, inner_att = 8, outer_att = 8, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220002) ->
    #mon{
        mid = 220002,
        name = <<"演武守卫">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 4084, mp_lim = 1219, inner_att = 24, outer_att = 24, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220003) ->
    #mon{
        mid = 220003,
        name = <<"演武守卫">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 9288, mp_lim = 2302, inner_att = 48, outer_att = 48, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220004) ->
    #mon{
        mid = 220004,
        name = <<"演武守卫">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 18100, mp_lim = 3384, inner_att = 88, outer_att = 88, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220005) ->
    #mon{
        mid = 220005,
        name = <<"演武守卫">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 32152, mp_lim = 4467, inner_att = 153, outer_att = 153, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220006) ->
    #mon{
        mid = 220006,
        name = <<"演武守卫">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 54632, mp_lim = 5549, inner_att = 255, outer_att = 255, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220007) ->
    #mon{
        mid = 220007,
        name = <<"演武守卫">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 82824, mp_lim = 6632, inner_att = 382, outer_att = 382, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220008) ->
    #mon{
        mid = 220008,
        name = <<"演武守卫">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 116732, mp_lim = 7714, inner_att = 534, outer_att = 534, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220009) ->
    #mon{
        mid = 220009,
        name = <<"演武守卫">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 152856, mp_lim = 8797, inner_att = 695, outer_att = 695, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220010) ->
    #mon{
        mid = 220010,
        name = <<"演武守卫">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 191216, mp_lim = 9879, inner_att = 865, outer_att = 865, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220011) ->
    #mon{
        mid = 220011,
        name = <<"演武守卫">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 241124, mp_lim = 10962, inner_att = 1054, outer_att = 1054, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220101) ->
    #mon{
        mid = 220101,
        name = <<"演武守将">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6567, mp_lim = 49, inner_att = 51, outer_att = 51, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220102) ->
    #mon{
        mid = 220102,
        name = <<"演武守将">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 33693, mp_lim = 1219, inner_att = 144, outer_att = 144, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220103) ->
    #mon{
        mid = 220103,
        name = <<"演武守将">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 76626, mp_lim = 2302, inner_att = 288, outer_att = 288, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220104) ->
    #mon{
        mid = 220104,
        name = <<"演武守将">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 149325, mp_lim = 3384, inner_att = 531, outer_att = 531, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220105) ->
    #mon{
        mid = 220105,
        name = <<"演武守将">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 265254, mp_lim = 4467, inner_att = 918, outer_att = 918, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220106) ->
    #mon{
        mid = 220106,
        name = <<"演武守将">>,
        boss = 1,
        level = 50,
        attr = #bt_attr{hp_lim = 450714, mp_lim = 5549, inner_att = 1533, outer_att = 1533, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220107) ->
    #mon{
        mid = 220107,
        name = <<"演武守将">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 683298, mp_lim = 6632, inner_att = 2295, outer_att = 2295, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220108) ->
    #mon{
        mid = 220108,
        name = <<"演武守将">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 963039, mp_lim = 7714, inner_att = 3207, outer_att = 3207, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220109) ->
    #mon{
        mid = 220109,
        name = <<"演武守将">>,
        boss = 1,
        level = 80,
        attr = #bt_attr{hp_lim = 1261062, mp_lim = 8797, inner_att = 4173, outer_att = 4173, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220110) ->
    #mon{
        mid = 220110,
        name = <<"演武守将">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1577532, mp_lim = 9879, inner_att = 5193, outer_att = 5193, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(220111) ->
    #mon{
        mid = 220111,
        name = <<"演武守将">>,
        boss = 1,
        level = 100,
        attr = #bt_attr{hp_lim = 1989273, mp_lim = 10962, inner_att = 6324, outer_att = 6324, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

