%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_24
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_24).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(240001) ->
    #mon{
        mid = 240001,
        name = <<"小狗">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 373, mp_lim = 681, inner_att = 5, outer_att = 5, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 5000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240002) ->
    #mon{
        mid = 240002,
        name = <<"乌龟">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 373, mp_lim = 681, inner_att = 5, outer_att = 5, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240003) ->
    #mon{
        mid = 240003,
        name = <<"松鼠">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 2343, mp_lim = 2846, inner_att = 26, outer_att = 26, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240004) ->
    #mon{
        mid = 240004,
        name = <<"刺猬">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 2343, mp_lim = 2846, inner_att = 26, outer_att = 26, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240005) ->
    #mon{
        mid = 240005,
        name = <<"螳螂">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 2343, mp_lim = 2846, inner_att = 26, outer_att = 26, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240006) ->
    #mon{
        mid = 240006,
        name = <<"鳄鱼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 7485, mp_lim = 5011, inner_att = 80, outer_att = 80, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240007) ->
    #mon{
        mid = 240007,
        name = <<"鹰">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 7485, mp_lim = 5011, inner_att = 80, outer_att = 80, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240008) ->
    #mon{
        mid = 240008,
        name = <<"豹子">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 7485, mp_lim = 5011, inner_att = 80, outer_att = 80, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240009) ->
    #mon{
        mid = 240009,
        name = <<"熊">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 17364, mp_lim = 7176, inner_att = 182, outer_att = 182, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240010) ->
    #mon{
        mid = 240010,
        name = <<"猩猩">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 17364, mp_lim = 7176, inner_att = 182, outer_att = 182, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(240011) ->
    #mon{
        mid = 240011,
        name = <<"駮马">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 17364, mp_lim = 7176, inner_att = 182, outer_att = 182, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 10000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

