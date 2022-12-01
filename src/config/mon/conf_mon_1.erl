%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_1
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_1).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(10001) ->
    #mon{
        mid = 10001,
        name = <<"大猿王">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 7147, mp_lim = 1219, inner_att = 24, outer_att = 24, inner_def = 43, outer_def = 43, hit = 464, dodge = 39, crit_hurt = 44, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{20030001,1,100,4},{20030002,1,100,4}],
        ai_group = 4001,
        args = [],
        exp = 50
    };
get(10002) ->
    #mon{
        mid = 10002,
        name = <<"左子穆">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 7987, mp_lim = 1330, inner_att = 26, outer_att = 26, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{20030101,1,100,4},{20030102,1,100,4}],
        ai_group = 4002,
        args = [],
        exp = 60
    };
get(10003) ->
    #mon{
        mid = 10003,
        name = <<"司空玄">>,
        boss = 1,
        level = 12,
        attr = #bt_attr{hp_lim = 8715, mp_lim = 1436, inner_att = 28, outer_att = 28, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{20030201,1,100,4},{20030202,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 70
    };
get(10004) ->
    #mon{
        mid = 10004,
        name = <<"木婉清">>,
        boss = 1,
        level = 14,
        attr = #bt_attr{hp_lim = 10381, mp_lim = 1652, inner_att = 32, outer_att = 32, inner_def = 61, outer_def = 61, hit = 641, dodge = 55, crit_hurt = 61, crit_def = 14, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 279000,
        revive = 2000,
        realm = 0,
        skill_list = [{20030301,1,100,4},{20030302,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 80
    };
get(10005) ->
    #mon{
        mid = 10005,
        name = <<"余毒">>,
        boss = 1,
        level = 8,
        attr = #bt_attr{hp_lim = 5684, mp_lim = 1003, inner_att = 20, outer_att = 20, inner_def = 35, outer_def = 35, hit = 384, dodge = 31, crit_hurt = 36, crit_def = 8, move_speed = 200},
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
get(10006) ->
    #mon{
        mid = 10006,
        name = <<"葛荣">>,
        boss = 1,
        level = 9,
        attr = #bt_attr{hp_lim = 6468, mp_lim = 1114, inner_att = 22, outer_att = 22, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
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
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

