%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_0
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_0).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(1) ->
    #mon{
        mid = 1,
        name = <<"花妖">>,
        boss = 0,
        level = 2,
        attr = #bt_attr{hp_lim = 188, mp_lim = 353, inner_att = 5, outer_att = 5, inner_def = 13, outer_def = 13, hit = 174, dodge = 12, crit_hurt = 16, crit_def = 3, move_speed = 200},
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
get(2) ->
    #mon{
        mid = 2,
        name = <<"狼">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 373, mp_lim = 681, inner_att = 7, outer_att = 7, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
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
get(3) ->
    #mon{
        mid = 3,
        name = <<"青鹰">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(4) ->
    #mon{
        mid = 4,
        name = <<"蝶灵">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(5) ->
    #mon{
        mid = 5,
        name = <<"鹿">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(6) ->
    #mon{
        mid = 6,
        name = <<"山猪">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(7) ->
    #mon{
        mid = 7,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(8) ->
    #mon{
        mid = 8,
        name = <<"无量派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(9) ->
    #mon{
        mid = 9,
        name = <<"神农派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(10) ->
    #mon{
        mid = 10,
        name = <<"灵鹫宫弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 431, mp_lim = 786, inner_att = 8, outer_att = 8, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
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
get(11) ->
    #mon{
        mid = 11,
        name = <<"喽啰">>,
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
        exp = 5
    };
get(1001) ->
    #mon{
        mid = 1001,
        name = <<"箭塔">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 9999999999, mp_lim = 200, mp_rec = 200, inner_att = 9999999999, outer_att = 9999999999, inner_def = 9999999999, outer_def = 9999999999, hit = 9999999999, dodge = 9999999999, crit_hurt = 9999999999, crit_def = 9999999999, aatt_ice = 9999999999, aatt_fire = 9999999999, aatt_dark = 9999999999, aatt_poison = 9999999999, adef_ice = 9999999999, adef_fire = 9999999999, adef_dark = 9999999999, adef_poison = 9999999999, adef_red_ice = 9999999999, adef_red_fire = 9999999999, adef_red_dark = 9999999999, adef_red_poison = 9999999999},
        att_type = 0,
        att_area = 10,
        sight_area = 12,
        trace_area = 10,
        drop = 279000,
        revive = 2000,
        realm = 1,
        skill_list = [{15010002,1,100,10}],
        ai_group = 1011,
        args = [],
        exp = 5
    };
get(1002) ->
    #mon{
        mid = 1002,
        name = <<"箭塔">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 9999999999, mp_lim = 200, mp_rec = 200, inner_att = 9999999999, outer_att = 9999999999, inner_def = 9999999999, outer_def = 9999999999, hit = 9999999999, dodge = 9999999999, crit_hurt = 9999999999, crit_def = 9999999999, aatt_ice = 9999999999, aatt_fire = 9999999999, aatt_dark = 9999999999, aatt_poison = 9999999999, adef_ice = 9999999999, adef_fire = 9999999999, adef_dark = 9999999999, adef_poison = 9999999999, adef_red_ice = 9999999999, adef_red_fire = 9999999999, adef_red_dark = 9999999999, adef_red_poison = 9999999999},
        att_type = 0,
        att_area = 10,
        sight_area = 12,
        trace_area = 10,
        drop = 279000,
        revive = 2000,
        realm = 2,
        skill_list = [{15010002,1,100,10}],
        ai_group = 1011,
        args = [],
        exp = 5
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

