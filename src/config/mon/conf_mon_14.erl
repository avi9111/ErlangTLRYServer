%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_14
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_14).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(140101) ->
    #mon{
        mid = 140101,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140102) ->
    #mon{
        mid = 140102,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140103) ->
    #mon{
        mid = 140103,
        name = <<"陶青">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140104) ->
    #mon{
        mid = 140104,
        name = <<"庞企">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140105) ->
    #mon{
        mid = 140105,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140106) ->
    #mon{
        mid = 140106,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140107) ->
    #mon{
        mid = 140107,
        name = <<"陶青">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140108) ->
    #mon{
        mid = 140108,
        name = <<"庞企">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140109) ->
    #mon{
        mid = 140109,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140110) ->
    #mon{
        mid = 140110,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140201) ->
    #mon{
        mid = 140201,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140202) ->
    #mon{
        mid = 140202,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140203) ->
    #mon{
        mid = 140203,
        name = <<"陶青">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140204) ->
    #mon{
        mid = 140204,
        name = <<"庞企">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140205) ->
    #mon{
        mid = 140205,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140206) ->
    #mon{
        mid = 140206,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140207) ->
    #mon{
        mid = 140207,
        name = <<"陶青">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140208) ->
    #mon{
        mid = 140208,
        name = <<"庞企">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140209) ->
    #mon{
        mid = 140209,
        name = <<"闵墨">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(140210) ->
    #mon{
        mid = 140210,
        name = <<"秦韵">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, outer_def = 1000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

