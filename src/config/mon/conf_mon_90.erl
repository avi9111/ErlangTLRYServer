%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_90
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_90).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(900001) ->
    #mon{
        mid = 900001,
        name = <<"">>,
        boss = 1,
        level = 100,
        attr = #bt_attr{hp_lim = 9999999999, mp_lim = 27, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 100, dodge = 10, crit_hurt = 100, crit_def = 200, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4020,
        args = [],
        exp = 50
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

