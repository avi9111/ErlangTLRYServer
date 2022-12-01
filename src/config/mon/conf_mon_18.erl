%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_18
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_18).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(180001) ->
    #mon{
        mid = 180001,
        name = <<"武林盟主">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 1200000000, mp_lim = 80000, mp_rec = 80000, inner_att = 244, outer_att = 244, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(180002) ->
    #mon{
        mid = 180002,
        name = <<"武林盟主">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 1200000000, mp_lim = 80000, mp_rec = 80000, inner_att = 244, outer_att = 244, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

