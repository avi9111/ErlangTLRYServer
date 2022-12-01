%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_31
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_31).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(310001) ->
    #mon{
        mid = 310001,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 11880, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(310002) ->
    #mon{
        mid = 310002,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 26320, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(310003) ->
    #mon{
        mid = 310003,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 114610, mp_lim = 4467, inner_att = 1744, outer_att = 1744, inner_def = 455, outer_def = 455, hit = 4479, dodge = 408, crit_hurt = 434, crit_def = 103, move_speed = 200},
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
get(310004) ->
    #mon{
        mid = 310004,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 427510, mp_lim = 7714, inner_att = 6268, outer_att = 6268, inner_def = 1680, outer_def = 1680, hit = 16265, dodge = 1504, crit_hurt = 1579, crit_def = 375, move_speed = 200},
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
get(310101) ->
    #mon{
        mid = 310101,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 11880, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(310102) ->
    #mon{
        mid = 310102,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 26320, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(310103) ->
    #mon{
        mid = 310103,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 114610, mp_lim = 4467, inner_att = 1744, outer_att = 1744, inner_def = 455, outer_def = 455, hit = 4479, dodge = 408, crit_hurt = 434, crit_def = 103, move_speed = 200},
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
get(310104) ->
    #mon{
        mid = 310104,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 427510, mp_lim = 7714, inner_att = 6268, outer_att = 6268, inner_def = 1680, outer_def = 1680, hit = 16265, dodge = 1504, crit_hurt = 1579, crit_def = 375, move_speed = 200},
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
get(310201) ->
    #mon{
        mid = 310201,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 11880, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(310202) ->
    #mon{
        mid = 310202,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 26320, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(310203) ->
    #mon{
        mid = 310203,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 114610, mp_lim = 4467, inner_att = 1744, outer_att = 1744, inner_def = 455, outer_def = 455, hit = 4479, dodge = 408, crit_hurt = 434, crit_def = 103, move_speed = 200},
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
get(310204) ->
    #mon{
        mid = 310204,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 427510, mp_lim = 7714, inner_att = 6268, outer_att = 6268, inner_def = 1680, outer_def = 1680, hit = 16265, dodge = 1504, crit_hurt = 1579, crit_def = 375, move_speed = 200},
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
get(310301) ->
    #mon{
        mid = 310301,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 11880, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(310302) ->
    #mon{
        mid = 310302,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 26320, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(310303) ->
    #mon{
        mid = 310303,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 114610, mp_lim = 4467, inner_att = 1744, outer_att = 1744, inner_def = 455, outer_def = 455, hit = 4479, dodge = 408, crit_hurt = 434, crit_def = 103, move_speed = 200},
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
get(310304) ->
    #mon{
        mid = 310304,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 427510, mp_lim = 7714, inner_att = 6268, outer_att = 6268, inner_def = 1680, outer_def = 1680, hit = 16265, dodge = 1504, crit_hurt = 1579, crit_def = 375, move_speed = 200},
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
get(311001) ->
    #mon{
        mid = 311001,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 714, mp_lim = 59, inner_att = 20, outer_att = 20, inner_def = 12, outer_def = 12, hit = 174, dodge = 12, crit_hurt = 17, crit_def = 4, move_speed = 200},
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
get(311002) ->
    #mon{
        mid = 311002,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3564, mp_lim = 1219, inner_att = 55, outer_att = 55, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(311003) ->
    #mon{
        mid = 311003,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 7896, mp_lim = 2302, inner_att = 108, outer_att = 108, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(311004) ->
    #mon{
        mid = 311004,
        name = <<"秦皇陵兵俑">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 14934, mp_lim = 3384, inner_att = 195, outer_att = 195, inner_def = 199, outer_def = 199, hit = 1984, dodge = 179, crit_hurt = 191, crit_def = 45, move_speed = 200},
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
get(311101) ->
    #mon{
        mid = 311101,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 714, mp_lim = 59, inner_att = 20, outer_att = 20, inner_def = 12, outer_def = 12, hit = 174, dodge = 12, crit_hurt = 17, crit_def = 4, move_speed = 200},
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
get(311102) ->
    #mon{
        mid = 311102,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3564, mp_lim = 1219, inner_att = 55, outer_att = 55, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(311103) ->
    #mon{
        mid = 311103,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 7896, mp_lim = 2302, inner_att = 108, outer_att = 108, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(311104) ->
    #mon{
        mid = 311104,
        name = <<"秦皇陵女妖">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 14934, mp_lim = 3384, inner_att = 195, outer_att = 195, inner_def = 199, outer_def = 199, hit = 1984, dodge = 179, crit_hurt = 191, crit_def = 45, move_speed = 200},
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
get(311201) ->
    #mon{
        mid = 311201,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 714, mp_lim = 59, inner_att = 20, outer_att = 20, inner_def = 12, outer_def = 12, hit = 174, dodge = 12, crit_hurt = 17, crit_def = 4, move_speed = 200},
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
get(311202) ->
    #mon{
        mid = 311202,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3564, mp_lim = 1219, inner_att = 55, outer_att = 55, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(311203) ->
    #mon{
        mid = 311203,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 7896, mp_lim = 2302, inner_att = 108, outer_att = 108, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(311204) ->
    #mon{
        mid = 311204,
        name = <<"秦皇陵护卫">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 14934, mp_lim = 3384, inner_att = 195, outer_att = 195, inner_def = 199, outer_def = 199, hit = 1984, dodge = 179, crit_hurt = 191, crit_def = 45, move_speed = 200},
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
get(311301) ->
    #mon{
        mid = 311301,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 714, mp_lim = 59, inner_att = 20, outer_att = 20, inner_def = 12, outer_def = 12, hit = 174, dodge = 12, crit_hurt = 17, crit_def = 4, move_speed = 200},
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
get(311302) ->
    #mon{
        mid = 311302,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3564, mp_lim = 1219, inner_att = 55, outer_att = 55, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
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
get(311303) ->
    #mon{
        mid = 311303,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 7896, mp_lim = 2302, inner_att = 108, outer_att = 108, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
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
get(311304) ->
    #mon{
        mid = 311304,
        name = <<"秦皇陵将领">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 14934, mp_lim = 3384, inner_att = 195, outer_att = 195, inner_def = 199, outer_def = 199, hit = 1984, dodge = 179, crit_hurt = 191, crit_def = 45, move_speed = 200},
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
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

