%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_192
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_192).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(1920001) ->
    #mon{
        mid = 1920001,
        name = <<"天元鼎">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 100000, inner_att = 60, outer_att = 60, hit = 110, dodge = 110, crit_hurt = 6, crit_def = 10},
        att_type = 0,
        att_area = 0,
        sight_area = 5,
        trace_area = 0,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3014,
        args = [],
        exp = 0
    };
get(1920101) ->
    #mon{
        mid = 1920101,
        name = <<"日曜鼎">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 100000, inner_att = 60, outer_att = 60, hit = 110, dodge = 110, crit_hurt = 6, crit_def = 10},
        att_type = 0,
        att_area = 0,
        sight_area = 5,
        trace_area = 0,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3014,
        args = [],
        exp = 0
    };
get(1920201) ->
    #mon{
        mid = 1920201,
        name = <<"月曜鼎">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 100000, inner_att = 60, outer_att = 60, hit = 110, dodge = 110, crit_hurt = 6, crit_def = 10},
        att_type = 0,
        att_area = 0,
        sight_area = 5,
        trace_area = 0,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3014,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

