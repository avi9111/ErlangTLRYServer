%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_13
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_13).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(131001) ->
    #mon{
        mid = 131001,
        name = <<"巨猿">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 50, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131002) ->
    #mon{
        mid = 131002,
        name = <<"杀手">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 6000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 50, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131003) ->
    #mon{
        mid = 131003,
        name = <<"术士">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 8000, mp_lim = 400, mp_rec = 400, inner_att = 150, outer_att = 150, inner_def = 75, outer_def = 150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131004) ->
    #mon{
        mid = 131004,
        name = <<"神秘剑客">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 10000, mp_lim = 400, mp_rec = 400, inner_att = 200, outer_att = 200, inner_def = 100, outer_def = 200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131005) ->
    #mon{
        mid = 131005,
        name = <<"巨猿">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 250, outer_att = 250, inner_def = 125, outer_def = 250, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131006) ->
    #mon{
        mid = 131006,
        name = <<"杀手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 150, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131007) ->
    #mon{
        mid = 131007,
        name = <<"术士">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 16000, mp_lim = 400, mp_rec = 400, inner_att = 350, outer_att = 350, inner_def = 175, outer_def = 350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131008) ->
    #mon{
        mid = 131008,
        name = <<"神秘剑客">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 18000, mp_lim = 400, mp_rec = 400, inner_att = 400, outer_att = 400, inner_def = 200, outer_def = 400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131009) ->
    #mon{
        mid = 131009,
        name = <<"巨猿">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 20000, mp_lim = 400, mp_rec = 400, inner_att = 450, outer_att = 450, inner_def = 225, outer_def = 450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131010) ->
    #mon{
        mid = 131010,
        name = <<"杀手">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 22000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 250, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131011) ->
    #mon{
        mid = 131011,
        name = <<"术士">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 24000, mp_lim = 400, mp_rec = 400, inner_att = 550, outer_att = 550, inner_def = 275, outer_def = 550, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131012) ->
    #mon{
        mid = 131012,
        name = <<"神秘剑客">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 26000, mp_lim = 400, mp_rec = 400, inner_att = 600, outer_att = 600, inner_def = 300, outer_def = 600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(131013) ->
    #mon{
        mid = 131013,
        name = <<"巨猿">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 28000, mp_lim = 400, mp_rec = 400, inner_att = 650, outer_att = 650, inner_def = 325, outer_def = 650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131014) ->
    #mon{
        mid = 131014,
        name = <<"杀手">>,
        boss = 1,
        level = 19,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 400, mp_rec = 400, inner_att = 700, outer_att = 700, inner_def = 350, outer_def = 700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131015) ->
    #mon{
        mid = 131015,
        name = <<"术士">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 32000, mp_lim = 400, mp_rec = 400, inner_att = 750, outer_att = 750, inner_def = 375, outer_def = 750, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131016) ->
    #mon{
        mid = 131016,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 34000, mp_lim = 400, mp_rec = 400, inner_att = 800, outer_att = 800, inner_def = 400, outer_def = 800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131017) ->
    #mon{
        mid = 131017,
        name = <<"巨猿">>,
        boss = 1,
        level = 22,
        attr = #bt_attr{hp_lim = 36000, mp_lim = 400, mp_rec = 400, inner_att = 850, outer_att = 850, inner_def = 425, outer_def = 850, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131018) ->
    #mon{
        mid = 131018,
        name = <<"杀手">>,
        boss = 1,
        level = 23,
        attr = #bt_attr{hp_lim = 38000, mp_lim = 400, mp_rec = 400, inner_att = 900, outer_att = 900, inner_def = 450, outer_def = 900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131019) ->
    #mon{
        mid = 131019,
        name = <<"术士">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 40000, mp_lim = 400, mp_rec = 400, inner_att = 950, outer_att = 950, inner_def = 475, outer_def = 950, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131020) ->
    #mon{
        mid = 131020,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 25,
        attr = #bt_attr{hp_lim = 42000, mp_lim = 400, mp_rec = 400, inner_att = 1000, outer_att = 1000, inner_def = 500, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131021) ->
    #mon{
        mid = 131021,
        name = <<"巨猿">>,
        boss = 1,
        level = 26,
        attr = #bt_attr{hp_lim = 44000, mp_lim = 400, mp_rec = 400, inner_att = 1050, outer_att = 1050, inner_def = 525, outer_def = 1050, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131022) ->
    #mon{
        mid = 131022,
        name = <<"杀手">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 46000, mp_lim = 400, mp_rec = 400, inner_att = 1100, outer_att = 1100, inner_def = 550, outer_def = 1100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131023) ->
    #mon{
        mid = 131023,
        name = <<"术士">>,
        boss = 1,
        level = 28,
        attr = #bt_attr{hp_lim = 48000, mp_lim = 400, mp_rec = 400, inner_att = 1150, outer_att = 1150, inner_def = 575, outer_def = 1150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131024) ->
    #mon{
        mid = 131024,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 29,
        attr = #bt_attr{hp_lim = 50000, mp_lim = 400, mp_rec = 400, inner_att = 1200, outer_att = 1200, inner_def = 600, outer_def = 1200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131025) ->
    #mon{
        mid = 131025,
        name = <<"巨猿">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 52000, mp_lim = 400, mp_rec = 400, inner_att = 1250, outer_att = 1250, inner_def = 625, outer_def = 1250, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131026) ->
    #mon{
        mid = 131026,
        name = <<"杀手">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 54000, mp_lim = 400, mp_rec = 400, inner_att = 1300, outer_att = 1300, inner_def = 650, outer_def = 1300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131027) ->
    #mon{
        mid = 131027,
        name = <<"术士">>,
        boss = 1,
        level = 32,
        attr = #bt_attr{hp_lim = 56000, mp_lim = 400, mp_rec = 400, inner_att = 1350, outer_att = 1350, inner_def = 675, outer_def = 1350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131028) ->
    #mon{
        mid = 131028,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 58000, mp_lim = 400, mp_rec = 400, inner_att = 1400, outer_att = 1400, inner_def = 700, outer_def = 1400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131029) ->
    #mon{
        mid = 131029,
        name = <<"巨猿">>,
        boss = 1,
        level = 34,
        attr = #bt_attr{hp_lim = 60000, mp_lim = 400, mp_rec = 400, inner_att = 1450, outer_att = 1450, inner_def = 725, outer_def = 1450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131030) ->
    #mon{
        mid = 131030,
        name = <<"杀手">>,
        boss = 1,
        level = 35,
        attr = #bt_attr{hp_lim = 62000, mp_lim = 400, mp_rec = 400, inner_att = 1500, outer_att = 1500, inner_def = 750, outer_def = 1500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131031) ->
    #mon{
        mid = 131031,
        name = <<"术士">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 64000, mp_lim = 400, mp_rec = 400, inner_att = 1550, outer_att = 1550, inner_def = 775, outer_def = 1550, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131032) ->
    #mon{
        mid = 131032,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 37,
        attr = #bt_attr{hp_lim = 66000, mp_lim = 400, mp_rec = 400, inner_att = 1600, outer_att = 1600, inner_def = 800, outer_def = 1600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131033) ->
    #mon{
        mid = 131033,
        name = <<"巨猿">>,
        boss = 1,
        level = 38,
        attr = #bt_attr{hp_lim = 68000, mp_lim = 400, mp_rec = 400, inner_att = 1650, outer_att = 1650, inner_def = 825, outer_def = 1650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131034) ->
    #mon{
        mid = 131034,
        name = <<"杀手">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 70000, mp_lim = 400, mp_rec = 400, inner_att = 1700, outer_att = 1700, inner_def = 850, outer_def = 1700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131035) ->
    #mon{
        mid = 131035,
        name = <<"术士">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 80000, mp_lim = 400, mp_rec = 400, inner_att = 1800, outer_att = 1800, inner_def = 900, outer_def = 1800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131036) ->
    #mon{
        mid = 131036,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 90000, mp_lim = 400, mp_rec = 400, inner_att = 1900, outer_att = 1900, inner_def = 950, outer_def = 1900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131037) ->
    #mon{
        mid = 131037,
        name = <<"巨猿">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 100000, mp_lim = 400, mp_rec = 400, inner_att = 2000, outer_att = 2000, inner_def = 1000, outer_def = 2000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131038) ->
    #mon{
        mid = 131038,
        name = <<"杀手">>,
        boss = 1,
        level = 43,
        attr = #bt_attr{hp_lim = 110000, mp_lim = 400, mp_rec = 400, inner_att = 2100, outer_att = 2100, inner_def = 1050, outer_def = 2100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131039) ->
    #mon{
        mid = 131039,
        name = <<"术士">>,
        boss = 1,
        level = 44,
        attr = #bt_attr{hp_lim = 120000, mp_lim = 400, mp_rec = 400, inner_att = 2200, outer_att = 2200, inner_def = 1100, outer_def = 2200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131040) ->
    #mon{
        mid = 131040,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 130000, mp_lim = 400, mp_rec = 400, inner_att = 2300, outer_att = 2300, inner_def = 1150, outer_def = 2300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131041) ->
    #mon{
        mid = 131041,
        name = <<"巨猿">>,
        boss = 1,
        level = 46,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 2400, outer_att = 2400, inner_def = 1200, outer_def = 2400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131042) ->
    #mon{
        mid = 131042,
        name = <<"杀手">>,
        boss = 1,
        level = 47,
        attr = #bt_attr{hp_lim = 150000, mp_lim = 400, mp_rec = 400, inner_att = 2500, outer_att = 2500, inner_def = 1250, outer_def = 2500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131043) ->
    #mon{
        mid = 131043,
        name = <<"术士">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 160000, mp_lim = 400, mp_rec = 400, inner_att = 2600, outer_att = 2600, inner_def = 1300, outer_def = 2600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131044) ->
    #mon{
        mid = 131044,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 49,
        attr = #bt_attr{hp_lim = 170000, mp_lim = 400, mp_rec = 400, inner_att = 2700, outer_att = 2700, inner_def = 1350, outer_def = 2700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131045) ->
    #mon{
        mid = 131045,
        name = <<"巨猿">>,
        boss = 1,
        level = 50,
        attr = #bt_attr{hp_lim = 180000, mp_lim = 400, mp_rec = 400, inner_att = 2800, outer_att = 2800, inner_def = 1400, outer_def = 2800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131046) ->
    #mon{
        mid = 131046,
        name = <<"杀手">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 190000, mp_lim = 400, mp_rec = 400, inner_att = 2900, outer_att = 2900, inner_def = 1450, outer_def = 2900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131047) ->
    #mon{
        mid = 131047,
        name = <<"术士">>,
        boss = 1,
        level = 52,
        attr = #bt_attr{hp_lim = 200000, mp_lim = 400, mp_rec = 400, inner_att = 3000, outer_att = 3000, inner_def = 1500, outer_def = 3000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131048) ->
    #mon{
        mid = 131048,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 53,
        attr = #bt_attr{hp_lim = 210000, mp_lim = 400, mp_rec = 400, inner_att = 3100, outer_att = 3100, inner_def = 1550, outer_def = 3100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131049) ->
    #mon{
        mid = 131049,
        name = <<"巨猿">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 220000, mp_lim = 400, mp_rec = 400, inner_att = 3200, outer_att = 3200, inner_def = 1600, outer_def = 3200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131050) ->
    #mon{
        mid = 131050,
        name = <<"杀手">>,
        boss = 1,
        level = 55,
        attr = #bt_attr{hp_lim = 230000, mp_lim = 400, mp_rec = 400, inner_att = 3300, outer_att = 3300, inner_def = 1650, outer_def = 3300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131051) ->
    #mon{
        mid = 131051,
        name = <<"术士">>,
        boss = 1,
        level = 56,
        attr = #bt_attr{hp_lim = 240000, mp_lim = 400, mp_rec = 400, inner_att = 3400, outer_att = 3400, inner_def = 1700, outer_def = 3400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131052) ->
    #mon{
        mid = 131052,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 250000, mp_lim = 400, mp_rec = 400, inner_att = 3500, outer_att = 3500, inner_def = 1750, outer_def = 3500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131053) ->
    #mon{
        mid = 131053,
        name = <<"巨猿">>,
        boss = 1,
        level = 58,
        attr = #bt_attr{hp_lim = 260000, mp_lim = 400, mp_rec = 400, inner_att = 3600, outer_att = 3600, inner_def = 1800, outer_def = 3600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131054) ->
    #mon{
        mid = 131054,
        name = <<"杀手">>,
        boss = 1,
        level = 59,
        attr = #bt_attr{hp_lim = 270000, mp_lim = 400, mp_rec = 400, inner_att = 3700, outer_att = 3700, inner_def = 1850, outer_def = 3700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131055) ->
    #mon{
        mid = 131055,
        name = <<"术士">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 280000, mp_lim = 400, mp_rec = 400, inner_att = 3800, outer_att = 3800, inner_def = 1900, outer_def = 3800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131056) ->
    #mon{
        mid = 131056,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 290000, mp_lim = 400, mp_rec = 400, inner_att = 3900, outer_att = 3900, inner_def = 1950, outer_def = 3900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131057) ->
    #mon{
        mid = 131057,
        name = <<"巨猿">>,
        boss = 1,
        level = 62,
        attr = #bt_attr{hp_lim = 300000, mp_lim = 400, mp_rec = 400, inner_att = 4000, outer_att = 4000, inner_def = 2000, outer_def = 4000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131058) ->
    #mon{
        mid = 131058,
        name = <<"杀手">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 330000, mp_lim = 400, mp_rec = 400, inner_att = 4300, outer_att = 4300, inner_def = 2150, outer_def = 4300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131059) ->
    #mon{
        mid = 131059,
        name = <<"术士">>,
        boss = 1,
        level = 64,
        attr = #bt_attr{hp_lim = 360000, mp_lim = 400, mp_rec = 400, inner_att = 4600, outer_att = 4600, inner_def = 2300, outer_def = 4600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131060) ->
    #mon{
        mid = 131060,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 65,
        attr = #bt_attr{hp_lim = 390000, mp_lim = 400, mp_rec = 400, inner_att = 4900, outer_att = 4900, inner_def = 2450, outer_def = 4900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131061) ->
    #mon{
        mid = 131061,
        name = <<"巨猿">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 420000, mp_lim = 400, mp_rec = 400, inner_att = 5200, outer_att = 5200, inner_def = 2600, outer_def = 5200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131062) ->
    #mon{
        mid = 131062,
        name = <<"杀手">>,
        boss = 1,
        level = 67,
        attr = #bt_attr{hp_lim = 450000, mp_lim = 400, mp_rec = 400, inner_att = 5500, outer_att = 5500, inner_def = 2750, outer_def = 5500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131063) ->
    #mon{
        mid = 131063,
        name = <<"术士">>,
        boss = 1,
        level = 68,
        attr = #bt_attr{hp_lim = 480000, mp_lim = 400, mp_rec = 400, inner_att = 5800, outer_att = 5800, inner_def = 2900, outer_def = 5800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131064) ->
    #mon{
        mid = 131064,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 510000, mp_lim = 400, mp_rec = 400, inner_att = 6100, outer_att = 6100, inner_def = 3050, outer_def = 6100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131065) ->
    #mon{
        mid = 131065,
        name = <<"巨猿">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 540000, mp_lim = 400, mp_rec = 400, inner_att = 6400, outer_att = 6400, inner_def = 3200, outer_def = 6400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131066) ->
    #mon{
        mid = 131066,
        name = <<"杀手">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 570000, mp_lim = 400, mp_rec = 400, inner_att = 6700, outer_att = 6700, inner_def = 3350, outer_def = 6700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131067) ->
    #mon{
        mid = 131067,
        name = <<"术士">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 600000, mp_lim = 400, mp_rec = 400, inner_att = 7000, outer_att = 7000, inner_def = 3500, outer_def = 7000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131068) ->
    #mon{
        mid = 131068,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 73,
        attr = #bt_attr{hp_lim = 630000, mp_lim = 400, mp_rec = 400, inner_att = 7300, outer_att = 7300, inner_def = 3650, outer_def = 7300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131069) ->
    #mon{
        mid = 131069,
        name = <<"巨猿">>,
        boss = 1,
        level = 74,
        attr = #bt_attr{hp_lim = 660000, mp_lim = 400, mp_rec = 400, inner_att = 7600, outer_att = 7600, inner_def = 3800, outer_def = 7600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(131070) ->
    #mon{
        mid = 131070,
        name = <<"杀手">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 690000, mp_lim = 400, mp_rec = 400, inner_att = 7900, outer_att = 7900, inner_def = 3950, outer_def = 7900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131071) ->
    #mon{
        mid = 131071,
        name = <<"术士">>,
        boss = 1,
        level = 76,
        attr = #bt_attr{hp_lim = 800000, mp_lim = 400, mp_rec = 400, inner_att = 9000, outer_att = 9000, inner_def = 4500, outer_def = 9000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131072) ->
    #mon{
        mid = 131072,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 77,
        attr = #bt_attr{hp_lim = 910000, mp_lim = 400, mp_rec = 400, inner_att = 10100, outer_att = 10100, inner_def = 5050, outer_def = 10100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131073) ->
    #mon{
        mid = 131073,
        name = <<"巨猿">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1020000, mp_lim = 400, mp_rec = 400, inner_att = 11200, outer_att = 11200, inner_def = 5600, outer_def = 11200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131074) ->
    #mon{
        mid = 131074,
        name = <<"杀手">>,
        boss = 1,
        level = 79,
        attr = #bt_attr{hp_lim = 1130000, mp_lim = 400, mp_rec = 400, inner_att = 12300, outer_att = 12300, inner_def = 6150, outer_def = 12300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131075) ->
    #mon{
        mid = 131075,
        name = <<"术士">>,
        boss = 1,
        level = 80,
        attr = #bt_attr{hp_lim = 1240000, mp_lim = 400, mp_rec = 400, inner_att = 13400, outer_att = 13400, inner_def = 6700, outer_def = 13400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131076) ->
    #mon{
        mid = 131076,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1350000, mp_lim = 400, mp_rec = 400, inner_att = 14500, outer_att = 14500, inner_def = 7250, outer_def = 14500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131077) ->
    #mon{
        mid = 131077,
        name = <<"巨猿">>,
        boss = 1,
        level = 82,
        attr = #bt_attr{hp_lim = 1460000, mp_lim = 400, mp_rec = 400, inner_att = 15600, outer_att = 15600, inner_def = 7800, outer_def = 15600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131078) ->
    #mon{
        mid = 131078,
        name = <<"杀手">>,
        boss = 1,
        level = 83,
        attr = #bt_attr{hp_lim = 1570000, mp_lim = 400, mp_rec = 400, inner_att = 16700, outer_att = 16700, inner_def = 8350, outer_def = 16700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131079) ->
    #mon{
        mid = 131079,
        name = <<"术士">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1680000, mp_lim = 400, mp_rec = 400, inner_att = 17800, outer_att = 17800, inner_def = 8900, outer_def = 17800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131080) ->
    #mon{
        mid = 131080,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 85,
        attr = #bt_attr{hp_lim = 1790000, mp_lim = 400, mp_rec = 400, inner_att = 18900, outer_att = 18900, inner_def = 9450, outer_def = 18900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131081) ->
    #mon{
        mid = 131081,
        name = <<"巨猿">>,
        boss = 1,
        level = 86,
        attr = #bt_attr{hp_lim = 1900000, mp_lim = 400, mp_rec = 400, inner_att = 20000, outer_att = 20000, inner_def = 10000, outer_def = 20000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131082) ->
    #mon{
        mid = 131082,
        name = <<"杀手">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 2010000, mp_lim = 400, mp_rec = 400, inner_att = 21100, outer_att = 21100, inner_def = 10550, outer_def = 21100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131083) ->
    #mon{
        mid = 131083,
        name = <<"术士">>,
        boss = 1,
        level = 88,
        attr = #bt_attr{hp_lim = 2120000, mp_lim = 400, mp_rec = 400, inner_att = 22200, outer_att = 22200, inner_def = 11100, outer_def = 22200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131084) ->
    #mon{
        mid = 131084,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 89,
        attr = #bt_attr{hp_lim = 2230000, mp_lim = 400, mp_rec = 400, inner_att = 23300, outer_att = 23300, inner_def = 11650, outer_def = 23300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131085) ->
    #mon{
        mid = 131085,
        name = <<"巨猿">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 2340000, mp_lim = 400, mp_rec = 400, inner_att = 24400, outer_att = 24400, inner_def = 12200, outer_def = 24400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131086) ->
    #mon{
        mid = 131086,
        name = <<"杀手">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2450000, mp_lim = 400, mp_rec = 400, inner_att = 25500, outer_att = 25500, inner_def = 12750, outer_def = 25500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131087) ->
    #mon{
        mid = 131087,
        name = <<"术士">>,
        boss = 1,
        level = 92,
        attr = #bt_attr{hp_lim = 2560000, mp_lim = 400, mp_rec = 400, inner_att = 26600, outer_att = 26600, inner_def = 13300, outer_def = 26600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131088) ->
    #mon{
        mid = 131088,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 2670000, mp_lim = 400, mp_rec = 400, inner_att = 27700, outer_att = 27700, inner_def = 13850, outer_def = 27700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131089) ->
    #mon{
        mid = 131089,
        name = <<"巨猿">>,
        boss = 1,
        level = 94,
        attr = #bt_attr{hp_lim = 2780000, mp_lim = 400, mp_rec = 400, inner_att = 28800, outer_att = 28800, inner_def = 14400, outer_def = 28800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131090) ->
    #mon{
        mid = 131090,
        name = <<"杀手">>,
        boss = 1,
        level = 95,
        attr = #bt_attr{hp_lim = 2890000, mp_lim = 400, mp_rec = 400, inner_att = 29900, outer_att = 29900, inner_def = 14950, outer_def = 29900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(131091) ->
    #mon{
        mid = 131091,
        name = <<"术士">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 3000000, mp_lim = 400, mp_rec = 400, inner_att = 31000, outer_att = 31000, inner_def = 15500, outer_def = 31000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(131092) ->
    #mon{
        mid = 131092,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 97,
        attr = #bt_attr{hp_lim = 3110000, mp_lim = 400, mp_rec = 400, inner_att = 32100, outer_att = 32100, inner_def = 16050, outer_def = 32100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(131093) ->
    #mon{
        mid = 131093,
        name = <<"巨猿">>,
        boss = 1,
        level = 98,
        attr = #bt_attr{hp_lim = 3220000, mp_lim = 400, mp_rec = 400, inner_att = 33200, outer_att = 33200, inner_def = 16600, outer_def = 33200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(131094) ->
    #mon{
        mid = 131094,
        name = <<"杀手">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 3330000, mp_lim = 400, mp_rec = 400, inner_att = 34300, outer_att = 34300, inner_def = 17150, outer_def = 34300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(131095) ->
    #mon{
        mid = 131095,
        name = <<"术士">>,
        boss = 1,
        level = 100,
        attr = #bt_attr{hp_lim = 3440000, mp_lim = 400, mp_rec = 400, inner_att = 35400, outer_att = 35400, inner_def = 17700, outer_def = 35400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(131096) ->
    #mon{
        mid = 131096,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 101,
        attr = #bt_attr{hp_lim = 3550000, mp_lim = 400, mp_rec = 400, inner_att = 36500, outer_att = 36500, inner_def = 18250, outer_def = 36500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(131097) ->
    #mon{
        mid = 131097,
        name = <<"巨猿">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 3660000, mp_lim = 400, mp_rec = 400, inner_att = 37600, outer_att = 37600, inner_def = 18800, outer_def = 37600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(131098) ->
    #mon{
        mid = 131098,
        name = <<"杀手">>,
        boss = 1,
        level = 103,
        attr = #bt_attr{hp_lim = 3770000, mp_lim = 400, mp_rec = 400, inner_att = 38700, outer_att = 38700, inner_def = 19350, outer_def = 38700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(131099) ->
    #mon{
        mid = 131099,
        name = <<"术士">>,
        boss = 1,
        level = 104,
        attr = #bt_attr{hp_lim = 3880000, mp_lim = 400, mp_rec = 400, inner_att = 39800, outer_att = 39800, inner_def = 19900, outer_def = 39800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(131100) ->
    #mon{
        mid = 131100,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 3990000, mp_lim = 400, mp_rec = 400, inner_att = 40900, outer_att = 40900, inner_def = 20450, outer_def = 40900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(131101) ->
    #mon{
        mid = 131101,
        name = <<"巨猿">>,
        boss = 1,
        level = 106,
        attr = #bt_attr{hp_lim = 4100000, mp_lim = 400, mp_rec = 400, inner_att = 42000, outer_att = 42000, inner_def = 21000, outer_def = 42000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(131102) ->
    #mon{
        mid = 131102,
        name = <<"杀手">>,
        boss = 1,
        level = 107,
        attr = #bt_attr{hp_lim = 4210000, mp_lim = 400, mp_rec = 400, inner_att = 31000, outer_att = 31000, inner_def = 15500, outer_def = 31000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(131103) ->
    #mon{
        mid = 131103,
        name = <<"术士">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 4320000, mp_lim = 400, mp_rec = 400, inner_att = 32100, outer_att = 32100, inner_def = 16050, outer_def = 32100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(131104) ->
    #mon{
        mid = 131104,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 109,
        attr = #bt_attr{hp_lim = 4430000, mp_lim = 400, mp_rec = 400, inner_att = 33200, outer_att = 33200, inner_def = 16600, outer_def = 33200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(131105) ->
    #mon{
        mid = 131105,
        name = <<"巨猿">>,
        boss = 1,
        level = 110,
        attr = #bt_attr{hp_lim = 4540000, mp_lim = 400, mp_rec = 400, inner_att = 34300, outer_att = 34300, inner_def = 17150, outer_def = 34300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(131106) ->
    #mon{
        mid = 131106,
        name = <<"杀手">>,
        boss = 1,
        level = 111,
        attr = #bt_attr{hp_lim = 4650000, mp_lim = 400, mp_rec = 400, inner_att = 35400, outer_att = 35400, inner_def = 17700, outer_def = 35400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(131107) ->
    #mon{
        mid = 131107,
        name = <<"术士">>,
        boss = 1,
        level = 112,
        attr = #bt_attr{hp_lim = 4760000, mp_lim = 400, mp_rec = 400, inner_att = 36500, outer_att = 36500, inner_def = 18250, outer_def = 36500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(131108) ->
    #mon{
        mid = 131108,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 113,
        attr = #bt_attr{hp_lim = 4870000, mp_lim = 400, mp_rec = 400, inner_att = 37600, outer_att = 37600, inner_def = 18800, outer_def = 37600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(131109) ->
    #mon{
        mid = 131109,
        name = <<"巨猿">>,
        boss = 1,
        level = 114,
        attr = #bt_attr{hp_lim = 4980000, mp_lim = 400, mp_rec = 400, inner_att = 38700, outer_att = 38700, inner_def = 19350, outer_def = 38700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(131110) ->
    #mon{
        mid = 131110,
        name = <<"杀手">>,
        boss = 1,
        level = 115,
        attr = #bt_attr{hp_lim = 5090000, mp_lim = 400, mp_rec = 400, inner_att = 39800, outer_att = 39800, inner_def = 19900, outer_def = 39800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(131111) ->
    #mon{
        mid = 131111,
        name = <<"术士">>,
        boss = 1,
        level = 116,
        attr = #bt_attr{hp_lim = 5200000, mp_lim = 400, mp_rec = 400, inner_att = 40900, outer_att = 40900, inner_def = 20450, outer_def = 40900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(131112) ->
    #mon{
        mid = 131112,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 117,
        attr = #bt_attr{hp_lim = 5310000, mp_lim = 400, mp_rec = 400, inner_att = 42000, outer_att = 42000, inner_def = 21000, outer_def = 42000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130101) ->
    #mon{
        mid = 130101,
        name = <<"持剑卫士">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130102) ->
    #mon{
        mid = 130102,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130103) ->
    #mon{
        mid = 130103,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130104) ->
    #mon{
        mid = 130104,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130111) ->
    #mon{
        mid = 130111,
        name = <<"持剑卫士">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130112) ->
    #mon{
        mid = 130112,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130113) ->
    #mon{
        mid = 130113,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130114) ->
    #mon{
        mid = 130114,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130121) ->
    #mon{
        mid = 130121,
        name = <<"持剑卫士">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 200, mp_rec = 200, inner_att = 10000, outer_att = 10000, inner_def = 10000, outer_def = 10000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130122) ->
    #mon{
        mid = 130122,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 200, mp_rec = 200, inner_att = 10000, outer_att = 10000, inner_def = 10000, outer_def = 10000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130123) ->
    #mon{
        mid = 130123,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 200, mp_rec = 200, inner_att = 10000, outer_att = 10000, inner_def = 10000, outer_def = 10000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130124) ->
    #mon{
        mid = 130124,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 200, mp_rec = 200, inner_att = 10000, outer_att = 10000, inner_def = 10000, outer_def = 10000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130201) ->
    #mon{
        mid = 130201,
        name = <<"闵墨">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 6000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130202) ->
    #mon{
        mid = 130202,
        name = <<"秦韵">>,
        boss = 1,
        level = 19,
        attr = #bt_attr{hp_lim = 8000, mp_lim = 400, mp_rec = 400, inner_att = 150, outer_att = 150, inner_def = 150, outer_def = 150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130203) ->
    #mon{
        mid = 130203,
        name = <<"陶青">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 10000, mp_lim = 400, mp_rec = 400, inner_att = 200, outer_att = 200, inner_def = 200, outer_def = 200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130204) ->
    #mon{
        mid = 130204,
        name = <<"庞企">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 250, outer_att = 250, inner_def = 250, outer_def = 250, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130205) ->
    #mon{
        mid = 130205,
        name = <<"闵墨">>,
        boss = 1,
        level = 22,
        attr = #bt_attr{hp_lim = 14000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130206) ->
    #mon{
        mid = 130206,
        name = <<"秦韵">>,
        boss = 1,
        level = 23,
        attr = #bt_attr{hp_lim = 16000, mp_lim = 400, mp_rec = 400, inner_att = 350, outer_att = 350, inner_def = 350, outer_def = 350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130207) ->
    #mon{
        mid = 130207,
        name = <<"陶青">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 18000, mp_lim = 400, mp_rec = 400, inner_att = 400, outer_att = 400, inner_def = 400, outer_def = 400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130208) ->
    #mon{
        mid = 130208,
        name = <<"庞企">>,
        boss = 1,
        level = 25,
        attr = #bt_attr{hp_lim = 20000, mp_lim = 400, mp_rec = 400, inner_att = 450, outer_att = 450, inner_def = 450, outer_def = 450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 1005,
        revive = 2000,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(130209) ->
    #mon{
        mid = 130209,
        name = <<"闵墨">>,
        boss = 1,
        level = 26,
        attr = #bt_attr{hp_lim = 22000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130210) ->
    #mon{
        mid = 130210,
        name = <<"秦韵">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 24000, mp_lim = 400, mp_rec = 400, inner_att = 550, outer_att = 550, inner_def = 550, outer_def = 550, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130211) ->
    #mon{
        mid = 130211,
        name = <<"陶青">>,
        boss = 1,
        level = 28,
        attr = #bt_attr{hp_lim = 26000, mp_lim = 400, mp_rec = 400, inner_att = 600, outer_att = 600, inner_def = 600, outer_def = 600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130212) ->
    #mon{
        mid = 130212,
        name = <<"庞企">>,
        boss = 1,
        level = 29,
        attr = #bt_attr{hp_lim = 28000, mp_lim = 400, mp_rec = 400, inner_att = 650, outer_att = 650, inner_def = 650, outer_def = 650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130213) ->
    #mon{
        mid = 130213,
        name = <<"闵墨">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 400, mp_rec = 400, inner_att = 700, outer_att = 700, inner_def = 700, outer_def = 700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130214) ->
    #mon{
        mid = 130214,
        name = <<"秦韵">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 32000, mp_lim = 400, mp_rec = 400, inner_att = 750, outer_att = 750, inner_def = 750, outer_def = 750, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130215) ->
    #mon{
        mid = 130215,
        name = <<"陶青">>,
        boss = 1,
        level = 32,
        attr = #bt_attr{hp_lim = 34000, mp_lim = 400, mp_rec = 400, inner_att = 800, outer_att = 800, inner_def = 800, outer_def = 800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130216) ->
    #mon{
        mid = 130216,
        name = <<"庞企">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 36000, mp_lim = 400, mp_rec = 400, inner_att = 850, outer_att = 850, inner_def = 850, outer_def = 850, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130217) ->
    #mon{
        mid = 130217,
        name = <<"闵墨">>,
        boss = 1,
        level = 34,
        attr = #bt_attr{hp_lim = 38000, mp_lim = 400, mp_rec = 400, inner_att = 900, outer_att = 900, inner_def = 900, outer_def = 900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130218) ->
    #mon{
        mid = 130218,
        name = <<"秦韵">>,
        boss = 1,
        level = 35,
        attr = #bt_attr{hp_lim = 40000, mp_lim = 400, mp_rec = 400, inner_att = 950, outer_att = 950, inner_def = 950, outer_def = 950, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130219) ->
    #mon{
        mid = 130219,
        name = <<"陶青">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 42000, mp_lim = 400, mp_rec = 400, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130220) ->
    #mon{
        mid = 130220,
        name = <<"庞企">>,
        boss = 1,
        level = 37,
        attr = #bt_attr{hp_lim = 44000, mp_lim = 400, mp_rec = 400, inner_att = 1050, outer_att = 1050, inner_def = 1050, outer_def = 1050, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130221) ->
    #mon{
        mid = 130221,
        name = <<"闵墨">>,
        boss = 1,
        level = 38,
        attr = #bt_attr{hp_lim = 46000, mp_lim = 400, mp_rec = 400, inner_att = 1100, outer_att = 1100, inner_def = 1100, outer_def = 1100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130222) ->
    #mon{
        mid = 130222,
        name = <<"秦韵">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 48000, mp_lim = 400, mp_rec = 400, inner_att = 1150, outer_att = 1150, inner_def = 1150, outer_def = 1150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130223) ->
    #mon{
        mid = 130223,
        name = <<"陶青">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 50000, mp_lim = 400, mp_rec = 400, inner_att = 1200, outer_att = 1200, inner_def = 1200, outer_def = 1200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130224) ->
    #mon{
        mid = 130224,
        name = <<"庞企">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 52000, mp_lim = 400, mp_rec = 400, inner_att = 1250, outer_att = 1250, inner_def = 1250, outer_def = 1250, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130225) ->
    #mon{
        mid = 130225,
        name = <<"闵墨">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 54000, mp_lim = 400, mp_rec = 400, inner_att = 1300, outer_att = 1300, inner_def = 1300, outer_def = 1300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130226) ->
    #mon{
        mid = 130226,
        name = <<"秦韵">>,
        boss = 1,
        level = 43,
        attr = #bt_attr{hp_lim = 56000, mp_lim = 400, mp_rec = 400, inner_att = 1350, outer_att = 1350, inner_def = 1350, outer_def = 1350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130227) ->
    #mon{
        mid = 130227,
        name = <<"陶青">>,
        boss = 1,
        level = 44,
        attr = #bt_attr{hp_lim = 58000, mp_lim = 400, mp_rec = 400, inner_att = 1400, outer_att = 1400, inner_def = 1400, outer_def = 1400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130228) ->
    #mon{
        mid = 130228,
        name = <<"庞企">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 60000, mp_lim = 400, mp_rec = 400, inner_att = 1450, outer_att = 1450, inner_def = 1450, outer_def = 1450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130229) ->
    #mon{
        mid = 130229,
        name = <<"闵墨">>,
        boss = 1,
        level = 46,
        attr = #bt_attr{hp_lim = 62000, mp_lim = 400, mp_rec = 400, inner_att = 1500, outer_att = 1500, inner_def = 1500, outer_def = 1500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130230) ->
    #mon{
        mid = 130230,
        name = <<"秦韵">>,
        boss = 1,
        level = 47,
        attr = #bt_attr{hp_lim = 64000, mp_lim = 400, mp_rec = 400, inner_att = 1550, outer_att = 1550, inner_def = 1550, outer_def = 1550, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130231) ->
    #mon{
        mid = 130231,
        name = <<"陶青">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 66000, mp_lim = 400, mp_rec = 400, inner_att = 1600, outer_att = 1600, inner_def = 1600, outer_def = 1600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130232) ->
    #mon{
        mid = 130232,
        name = <<"庞企">>,
        boss = 1,
        level = 49,
        attr = #bt_attr{hp_lim = 68000, mp_lim = 400, mp_rec = 400, inner_att = 1650, outer_att = 1650, inner_def = 1650, outer_def = 1650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130233) ->
    #mon{
        mid = 130233,
        name = <<"闵墨">>,
        boss = 1,
        level = 50,
        attr = #bt_attr{hp_lim = 70000, mp_lim = 400, mp_rec = 400, inner_att = 1700, outer_att = 1700, inner_def = 1700, outer_def = 1700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130234) ->
    #mon{
        mid = 130234,
        name = <<"秦韵">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 80000, mp_lim = 400, mp_rec = 400, inner_att = 1800, outer_att = 1800, inner_def = 1800, outer_def = 1800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130235) ->
    #mon{
        mid = 130235,
        name = <<"陶青">>,
        boss = 1,
        level = 52,
        attr = #bt_attr{hp_lim = 90000, mp_lim = 400, mp_rec = 400, inner_att = 1900, outer_att = 1900, inner_def = 1900, outer_def = 1900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130236) ->
    #mon{
        mid = 130236,
        name = <<"庞企">>,
        boss = 1,
        level = 53,
        attr = #bt_attr{hp_lim = 100000, mp_lim = 400, mp_rec = 400, inner_att = 2000, outer_att = 2000, inner_def = 2000, outer_def = 2000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130237) ->
    #mon{
        mid = 130237,
        name = <<"闵墨">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 110000, mp_lim = 400, mp_rec = 400, inner_att = 2100, outer_att = 2100, inner_def = 2100, outer_def = 2100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130238) ->
    #mon{
        mid = 130238,
        name = <<"秦韵">>,
        boss = 1,
        level = 55,
        attr = #bt_attr{hp_lim = 120000, mp_lim = 400, mp_rec = 400, inner_att = 2200, outer_att = 2200, inner_def = 2200, outer_def = 2200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130239) ->
    #mon{
        mid = 130239,
        name = <<"陶青">>,
        boss = 1,
        level = 56,
        attr = #bt_attr{hp_lim = 130000, mp_lim = 400, mp_rec = 400, inner_att = 2300, outer_att = 2300, inner_def = 2300, outer_def = 2300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130240) ->
    #mon{
        mid = 130240,
        name = <<"庞企">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 2400, outer_att = 2400, inner_def = 2400, outer_def = 2400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130241) ->
    #mon{
        mid = 130241,
        name = <<"闵墨">>,
        boss = 1,
        level = 58,
        attr = #bt_attr{hp_lim = 150000, mp_lim = 400, mp_rec = 400, inner_att = 2500, outer_att = 2500, inner_def = 2500, outer_def = 2500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130242) ->
    #mon{
        mid = 130242,
        name = <<"秦韵">>,
        boss = 1,
        level = 59,
        attr = #bt_attr{hp_lim = 160000, mp_lim = 400, mp_rec = 400, inner_att = 2600, outer_att = 2600, inner_def = 2600, outer_def = 2600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130243) ->
    #mon{
        mid = 130243,
        name = <<"陶青">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 170000, mp_lim = 400, mp_rec = 400, inner_att = 2700, outer_att = 2700, inner_def = 2700, outer_def = 2700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130244) ->
    #mon{
        mid = 130244,
        name = <<"庞企">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 180000, mp_lim = 400, mp_rec = 400, inner_att = 2800, outer_att = 2800, inner_def = 2800, outer_def = 2800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130245) ->
    #mon{
        mid = 130245,
        name = <<"闵墨">>,
        boss = 1,
        level = 62,
        attr = #bt_attr{hp_lim = 190000, mp_lim = 400, mp_rec = 400, inner_att = 2900, outer_att = 2900, inner_def = 2900, outer_def = 2900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130246) ->
    #mon{
        mid = 130246,
        name = <<"秦韵">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 200000, mp_lim = 400, mp_rec = 400, inner_att = 3000, outer_att = 3000, inner_def = 3000, outer_def = 3000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130247) ->
    #mon{
        mid = 130247,
        name = <<"陶青">>,
        boss = 1,
        level = 64,
        attr = #bt_attr{hp_lim = 210000, mp_lim = 400, mp_rec = 400, inner_att = 3100, outer_att = 3100, inner_def = 3100, outer_def = 3100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130248) ->
    #mon{
        mid = 130248,
        name = <<"庞企">>,
        boss = 1,
        level = 65,
        attr = #bt_attr{hp_lim = 220000, mp_lim = 400, mp_rec = 400, inner_att = 3200, outer_att = 3200, inner_def = 3200, outer_def = 3200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130249) ->
    #mon{
        mid = 130249,
        name = <<"闵墨">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 230000, mp_lim = 400, mp_rec = 400, inner_att = 3300, outer_att = 3300, inner_def = 3300, outer_def = 3300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130250) ->
    #mon{
        mid = 130250,
        name = <<"秦韵">>,
        boss = 1,
        level = 67,
        attr = #bt_attr{hp_lim = 240000, mp_lim = 400, mp_rec = 400, inner_att = 3400, outer_att = 3400, inner_def = 3400, outer_def = 3400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130251) ->
    #mon{
        mid = 130251,
        name = <<"陶青">>,
        boss = 1,
        level = 68,
        attr = #bt_attr{hp_lim = 250000, mp_lim = 400, mp_rec = 400, inner_att = 3500, outer_att = 3500, inner_def = 3500, outer_def = 3500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130252) ->
    #mon{
        mid = 130252,
        name = <<"庞企">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 260000, mp_lim = 400, mp_rec = 400, inner_att = 3600, outer_att = 3600, inner_def = 3600, outer_def = 3600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130253) ->
    #mon{
        mid = 130253,
        name = <<"闵墨">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 270000, mp_lim = 400, mp_rec = 400, inner_att = 3700, outer_att = 3700, inner_def = 3700, outer_def = 3700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130254) ->
    #mon{
        mid = 130254,
        name = <<"秦韵">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 280000, mp_lim = 400, mp_rec = 400, inner_att = 3800, outer_att = 3800, inner_def = 3800, outer_def = 3800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130255) ->
    #mon{
        mid = 130255,
        name = <<"陶青">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 290000, mp_lim = 400, mp_rec = 400, inner_att = 3900, outer_att = 3900, inner_def = 3900, outer_def = 3900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130256) ->
    #mon{
        mid = 130256,
        name = <<"庞企">>,
        boss = 1,
        level = 73,
        attr = #bt_attr{hp_lim = 300000, mp_lim = 400, mp_rec = 400, inner_att = 4000, outer_att = 4000, inner_def = 4000, outer_def = 4000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130257) ->
    #mon{
        mid = 130257,
        name = <<"闵墨">>,
        boss = 1,
        level = 74,
        attr = #bt_attr{hp_lim = 330000, mp_lim = 400, mp_rec = 400, inner_att = 4300, outer_att = 4300, inner_def = 4300, outer_def = 4300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(130258) ->
    #mon{
        mid = 130258,
        name = <<"秦韵">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 360000, mp_lim = 400, mp_rec = 400, inner_att = 4600, outer_att = 4600, inner_def = 4600, outer_def = 4600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130259) ->
    #mon{
        mid = 130259,
        name = <<"陶青">>,
        boss = 1,
        level = 76,
        attr = #bt_attr{hp_lim = 390000, mp_lim = 400, mp_rec = 400, inner_att = 4900, outer_att = 4900, inner_def = 4900, outer_def = 4900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130260) ->
    #mon{
        mid = 130260,
        name = <<"庞企">>,
        boss = 1,
        level = 77,
        attr = #bt_attr{hp_lim = 420000, mp_lim = 400, mp_rec = 400, inner_att = 5200, outer_att = 5200, inner_def = 5200, outer_def = 5200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130261) ->
    #mon{
        mid = 130261,
        name = <<"闵墨">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 450000, mp_lim = 400, mp_rec = 400, inner_att = 5500, outer_att = 5500, inner_def = 5500, outer_def = 5500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130262) ->
    #mon{
        mid = 130262,
        name = <<"秦韵">>,
        boss = 1,
        level = 79,
        attr = #bt_attr{hp_lim = 480000, mp_lim = 400, mp_rec = 400, inner_att = 5800, outer_att = 5800, inner_def = 5800, outer_def = 5800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130263) ->
    #mon{
        mid = 130263,
        name = <<"陶青">>,
        boss = 1,
        level = 80,
        attr = #bt_attr{hp_lim = 510000, mp_lim = 400, mp_rec = 400, inner_att = 6100, outer_att = 6100, inner_def = 6100, outer_def = 6100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130264) ->
    #mon{
        mid = 130264,
        name = <<"庞企">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 540000, mp_lim = 400, mp_rec = 400, inner_att = 6400, outer_att = 6400, inner_def = 6400, outer_def = 6400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130265) ->
    #mon{
        mid = 130265,
        name = <<"闵墨">>,
        boss = 1,
        level = 82,
        attr = #bt_attr{hp_lim = 570000, mp_lim = 400, mp_rec = 400, inner_att = 6700, outer_att = 6700, inner_def = 6700, outer_def = 6700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130266) ->
    #mon{
        mid = 130266,
        name = <<"秦韵">>,
        boss = 1,
        level = 83,
        attr = #bt_attr{hp_lim = 600000, mp_lim = 400, mp_rec = 400, inner_att = 7000, outer_att = 7000, inner_def = 7000, outer_def = 7000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130267) ->
    #mon{
        mid = 130267,
        name = <<"陶青">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 630000, mp_lim = 400, mp_rec = 400, inner_att = 7300, outer_att = 7300, inner_def = 7300, outer_def = 7300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130268) ->
    #mon{
        mid = 130268,
        name = <<"庞企">>,
        boss = 1,
        level = 85,
        attr = #bt_attr{hp_lim = 660000, mp_lim = 400, mp_rec = 400, inner_att = 7600, outer_att = 7600, inner_def = 7600, outer_def = 7600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130269) ->
    #mon{
        mid = 130269,
        name = <<"庞企">>,
        boss = 1,
        level = 86,
        attr = #bt_attr{hp_lim = 690000, mp_lim = 400, mp_rec = 400, inner_att = 7900, outer_att = 7900, inner_def = 7900, outer_def = 7900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130270) ->
    #mon{
        mid = 130270,
        name = <<"闵墨">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 800000, mp_lim = 400, mp_rec = 400, inner_att = 9000, outer_att = 9000, inner_def = 9000, outer_def = 9000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130271) ->
    #mon{
        mid = 130271,
        name = <<"秦韵">>,
        boss = 1,
        level = 88,
        attr = #bt_attr{hp_lim = 910000, mp_lim = 400, mp_rec = 400, inner_att = 10100, outer_att = 10100, inner_def = 10100, outer_def = 10100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130272) ->
    #mon{
        mid = 130272,
        name = <<"陶青">>,
        boss = 1,
        level = 89,
        attr = #bt_attr{hp_lim = 1020000, mp_lim = 400, mp_rec = 400, inner_att = 11200, outer_att = 11200, inner_def = 11200, outer_def = 11200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130273) ->
    #mon{
        mid = 130273,
        name = <<"庞企">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1130000, mp_lim = 400, mp_rec = 400, inner_att = 12300, outer_att = 12300, inner_def = 12300, outer_def = 12300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130274) ->
    #mon{
        mid = 130274,
        name = <<"闵墨">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1240000, mp_lim = 400, mp_rec = 400, inner_att = 13400, outer_att = 13400, inner_def = 13400, outer_def = 13400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130275) ->
    #mon{
        mid = 130275,
        name = <<"秦韵">>,
        boss = 1,
        level = 92,
        attr = #bt_attr{hp_lim = 1350000, mp_lim = 400, mp_rec = 400, inner_att = 14500, outer_att = 14500, inner_def = 14500, outer_def = 14500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130276) ->
    #mon{
        mid = 130276,
        name = <<"陶青">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 1460000, mp_lim = 400, mp_rec = 400, inner_att = 15600, outer_att = 15600, inner_def = 15600, outer_def = 15600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130277) ->
    #mon{
        mid = 130277,
        name = <<"庞企">>,
        boss = 1,
        level = 94,
        attr = #bt_attr{hp_lim = 1570000, mp_lim = 400, mp_rec = 400, inner_att = 16700, outer_att = 16700, inner_def = 16700, outer_def = 16700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130278) ->
    #mon{
        mid = 130278,
        name = <<"闵墨">>,
        boss = 1,
        level = 95,
        attr = #bt_attr{hp_lim = 1680000, mp_lim = 400, mp_rec = 400, inner_att = 17800, outer_att = 17800, inner_def = 17800, outer_def = 17800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(130279) ->
    #mon{
        mid = 130279,
        name = <<"秦韵">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 1790000, mp_lim = 400, mp_rec = 400, inner_att = 18900, outer_att = 18900, inner_def = 18900, outer_def = 18900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(130280) ->
    #mon{
        mid = 130280,
        name = <<"陶青">>,
        boss = 1,
        level = 97,
        attr = #bt_attr{hp_lim = 1900000, mp_lim = 400, mp_rec = 400, inner_att = 20000, outer_att = 20000, inner_def = 20000, outer_def = 20000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(130281) ->
    #mon{
        mid = 130281,
        name = <<"庞企">>,
        boss = 1,
        level = 98,
        attr = #bt_attr{hp_lim = 2010000, mp_lim = 400, mp_rec = 400, inner_att = 21100, outer_att = 21100, inner_def = 21100, outer_def = 21100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(130282) ->
    #mon{
        mid = 130282,
        name = <<"闵墨">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 2120000, mp_lim = 400, mp_rec = 400, inner_att = 22200, outer_att = 22200, inner_def = 22200, outer_def = 22200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130283) ->
    #mon{
        mid = 130283,
        name = <<"秦韵">>,
        boss = 1,
        level = 100,
        attr = #bt_attr{hp_lim = 2230000, mp_lim = 400, mp_rec = 400, inner_att = 23300, outer_att = 23300, inner_def = 23300, outer_def = 23300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130284) ->
    #mon{
        mid = 130284,
        name = <<"陶青">>,
        boss = 1,
        level = 101,
        attr = #bt_attr{hp_lim = 2340000, mp_lim = 400, mp_rec = 400, inner_att = 24400, outer_att = 24400, inner_def = 24400, outer_def = 24400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130285) ->
    #mon{
        mid = 130285,
        name = <<"庞企">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 2450000, mp_lim = 400, mp_rec = 400, inner_att = 25500, outer_att = 25500, inner_def = 25500, outer_def = 25500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130286) ->
    #mon{
        mid = 130286,
        name = <<"闵墨">>,
        boss = 1,
        level = 103,
        attr = #bt_attr{hp_lim = 2560000, mp_lim = 400, mp_rec = 400, inner_att = 26600, outer_att = 26600, inner_def = 26600, outer_def = 26600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130287) ->
    #mon{
        mid = 130287,
        name = <<"秦韵">>,
        boss = 1,
        level = 104,
        attr = #bt_attr{hp_lim = 2670000, mp_lim = 400, mp_rec = 400, inner_att = 27700, outer_att = 27700, inner_def = 27700, outer_def = 27700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130288) ->
    #mon{
        mid = 130288,
        name = <<"陶青">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 2780000, mp_lim = 400, mp_rec = 400, inner_att = 28800, outer_att = 28800, inner_def = 28800, outer_def = 28800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130289) ->
    #mon{
        mid = 130289,
        name = <<"庞企">>,
        boss = 1,
        level = 106,
        attr = #bt_attr{hp_lim = 2890000, mp_lim = 400, mp_rec = 400, inner_att = 29900, outer_att = 29900, inner_def = 29900, outer_def = 29900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130290) ->
    #mon{
        mid = 130290,
        name = <<"闵墨">>,
        boss = 1,
        level = 107,
        attr = #bt_attr{hp_lim = 3000000, mp_lim = 400, mp_rec = 400, inner_att = 31000, outer_att = 31000, inner_def = 31000, outer_def = 31000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130291) ->
    #mon{
        mid = 130291,
        name = <<"秦韵">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 3300000, mp_lim = 400, mp_rec = 400, inner_att = 42000, outer_att = 42000, inner_def = 32100, outer_def = 32100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130292) ->
    #mon{
        mid = 130292,
        name = <<"陶青">>,
        boss = 1,
        level = 109,
        attr = #bt_attr{hp_lim = 3600000, mp_lim = 400, mp_rec = 400, inner_att = 53000, outer_att = 53000, inner_def = 33200, outer_def = 33200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130293) ->
    #mon{
        mid = 130293,
        name = <<"庞企">>,
        boss = 1,
        level = 110,
        attr = #bt_attr{hp_lim = 3900000, mp_lim = 400, mp_rec = 400, inner_att = 64000, outer_att = 64000, inner_def = 34300, outer_def = 34300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130294) ->
    #mon{
        mid = 130294,
        name = <<"闵墨">>,
        boss = 1,
        level = 111,
        attr = #bt_attr{hp_lim = 4200000, mp_lim = 400, mp_rec = 400, inner_att = 75000, outer_att = 75000, inner_def = 35400, outer_def = 35400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130295) ->
    #mon{
        mid = 130295,
        name = <<"秦韵">>,
        boss = 1,
        level = 112,
        attr = #bt_attr{hp_lim = 4500000, mp_lim = 400, mp_rec = 400, inner_att = 86000, outer_att = 86000, inner_def = 36500, outer_def = 36500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130296) ->
    #mon{
        mid = 130296,
        name = <<"陶青">>,
        boss = 1,
        level = 113,
        attr = #bt_attr{hp_lim = 4800000, mp_lim = 400, mp_rec = 400, inner_att = 97000, outer_att = 97000, inner_def = 37600, outer_def = 37600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130297) ->
    #mon{
        mid = 130297,
        name = <<"庞企">>,
        boss = 1,
        level = 114,
        attr = #bt_attr{hp_lim = 5100000, mp_lim = 400, mp_rec = 400, inner_att = 108000, outer_att = 108000, inner_def = 38700, outer_def = 38700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130298) ->
    #mon{
        mid = 130298,
        name = <<"闵墨">>,
        boss = 1,
        level = 115,
        attr = #bt_attr{hp_lim = 5400000, mp_lim = 400, mp_rec = 400, inner_att = 119000, outer_att = 119000, inner_def = 39800, outer_def = 39800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130299) ->
    #mon{
        mid = 130299,
        name = <<"秦韵">>,
        boss = 1,
        level = 116,
        attr = #bt_attr{hp_lim = 5700000, mp_lim = 400, mp_rec = 400, inner_att = 130000, outer_att = 130000, inner_def = 40900, outer_def = 40900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130300) ->
    #mon{
        mid = 130300,
        name = <<"陶青">>,
        boss = 1,
        level = 117,
        attr = #bt_attr{hp_lim = 6000000, mp_lim = 400, mp_rec = 400, inner_att = 141000, outer_att = 141000, inner_def = 42000, outer_def = 42000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130301) ->
    #mon{
        mid = 130301,
        name = <<"庞企">>,
        boss = 1,
        level = 118,
        attr = #bt_attr{hp_lim = 6300000, mp_lim = 400, mp_rec = 400, inner_att = 152000, outer_att = 152000, inner_def = 48000, outer_def = 48000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130302) ->
    #mon{
        mid = 130302,
        name = <<"闵墨">>,
        boss = 1,
        level = 119,
        attr = #bt_attr{hp_lim = 6600000, mp_lim = 400, mp_rec = 400, inner_att = 163000, outer_att = 163000, inner_def = 54000, outer_def = 54000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130303) ->
    #mon{
        mid = 130303,
        name = <<"秦韵">>,
        boss = 1,
        level = 120,
        attr = #bt_attr{hp_lim = 6900000, mp_lim = 400, mp_rec = 400, inner_att = 174000, outer_att = 174000, inner_def = 60000, outer_def = 60000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130304) ->
    #mon{
        mid = 130304,
        name = <<"陶青">>,
        boss = 1,
        level = 121,
        attr = #bt_attr{hp_lim = 7200000, mp_lim = 400, mp_rec = 400, inner_att = 185000, outer_att = 185000, inner_def = 66000, outer_def = 66000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(130305) ->
    #mon{
        mid = 130305,
        name = <<"庞企">>,
        boss = 1,
        level = 122,
        attr = #bt_attr{hp_lim = 7500000, mp_lim = 400, mp_rec = 400, inner_att = 196000, outer_att = 196000, inner_def = 72000, outer_def = 72000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(130306) ->
    #mon{
        mid = 130306,
        name = <<"闵墨">>,
        boss = 1,
        level = 123,
        attr = #bt_attr{hp_lim = 7800000, mp_lim = 400, mp_rec = 400, inner_att = 207000, outer_att = 207000, inner_def = 78000, outer_def = 78000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(130307) ->
    #mon{
        mid = 130307,
        name = <<"秦韵">>,
        boss = 1,
        level = 124,
        attr = #bt_attr{hp_lim = 8100000, mp_lim = 400, mp_rec = 400, inner_att = 218000, outer_att = 218000, inner_def = 84000, outer_def = 84000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(130308) ->
    #mon{
        mid = 130308,
        name = <<"陶青">>,
        boss = 1,
        level = 125,
        attr = #bt_attr{hp_lim = 8400000, mp_lim = 400, mp_rec = 400, inner_att = 229000, outer_att = 229000, inner_def = 90000, outer_def = 90000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(132001) ->
    #mon{
        mid = 132001,
        name = <<"墨虎">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132002) ->
    #mon{
        mid = 132002,
        name = <<"妖女">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 6000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132003) ->
    #mon{
        mid = 132003,
        name = <<"魔君">>,
        boss = 0,
        level = 8,
        attr = #bt_attr{hp_lim = 8000, mp_lim = 400, mp_rec = 400, inner_att = 150, outer_att = 150, inner_def = 150, outer_def = 75, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132004) ->
    #mon{
        mid = 132004,
        name = <<"摘星子">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 10000, mp_lim = 400, mp_rec = 400, inner_att = 200, outer_att = 200, inner_def = 200, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132005) ->
    #mon{
        mid = 132005,
        name = <<"神秘剑客">>,
        boss = 0,
        level = 10,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 250, outer_att = 250, inner_def = 250, outer_def = 125, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132006) ->
    #mon{
        mid = 132006,
        name = <<"墨虎">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132007) ->
    #mon{
        mid = 132007,
        name = <<"妖女">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 16000, mp_lim = 400, mp_rec = 400, inner_att = 350, outer_att = 350, inner_def = 350, outer_def = 175, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132008) ->
    #mon{
        mid = 132008,
        name = <<"魔君">>,
        boss = 0,
        level = 13,
        attr = #bt_attr{hp_lim = 18000, mp_lim = 400, mp_rec = 400, inner_att = 400, outer_att = 400, inner_def = 400, outer_def = 200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132009) ->
    #mon{
        mid = 132009,
        name = <<"摘星子">>,
        boss = 0,
        level = 14,
        attr = #bt_attr{hp_lim = 20000, mp_lim = 400, mp_rec = 400, inner_att = 450, outer_att = 450, inner_def = 450, outer_def = 225, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132010) ->
    #mon{
        mid = 132010,
        name = <<"神秘剑客">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 22000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132011) ->
    #mon{
        mid = 132011,
        name = <<"墨虎">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 24000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132012) ->
    #mon{
        mid = 132012,
        name = <<"妖女">>,
        boss = 0,
        level = 17,
        attr = #bt_attr{hp_lim = 26000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 2000,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(132013) ->
    #mon{
        mid = 132013,
        name = <<"魔君">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 28000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132014) ->
    #mon{
        mid = 132014,
        name = <<"摘星子">>,
        boss = 1,
        level = 19,
        attr = #bt_attr{hp_lim = 30000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132015) ->
    #mon{
        mid = 132015,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 32000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132016) ->
    #mon{
        mid = 132016,
        name = <<"墨虎">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 34000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132017) ->
    #mon{
        mid = 132017,
        name = <<"妖女">>,
        boss = 1,
        level = 22,
        attr = #bt_attr{hp_lim = 36000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132018) ->
    #mon{
        mid = 132018,
        name = <<"魔君">>,
        boss = 1,
        level = 23,
        attr = #bt_attr{hp_lim = 38000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132019) ->
    #mon{
        mid = 132019,
        name = <<"摘星子">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 40000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132020) ->
    #mon{
        mid = 132020,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 25,
        attr = #bt_attr{hp_lim = 42000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132021) ->
    #mon{
        mid = 132021,
        name = <<"墨虎">>,
        boss = 1,
        level = 26,
        attr = #bt_attr{hp_lim = 44000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132022) ->
    #mon{
        mid = 132022,
        name = <<"妖女">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 46000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132023) ->
    #mon{
        mid = 132023,
        name = <<"魔君">>,
        boss = 1,
        level = 28,
        attr = #bt_attr{hp_lim = 48000, mp_lim = 400, mp_rec = 400, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132024) ->
    #mon{
        mid = 132024,
        name = <<"摘星子">>,
        boss = 1,
        level = 29,
        attr = #bt_attr{hp_lim = 50000, mp_lim = 400, mp_rec = 400, inner_att = 1200, outer_att = 1200, inner_def = 1200, outer_def = 600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132025) ->
    #mon{
        mid = 132025,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 52000, mp_lim = 400, mp_rec = 400, inner_att = 1250, outer_att = 1250, inner_def = 1250, outer_def = 625, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132026) ->
    #mon{
        mid = 132026,
        name = <<"墨虎">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 54000, mp_lim = 400, mp_rec = 400, inner_att = 1300, outer_att = 1300, inner_def = 1300, outer_def = 650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132027) ->
    #mon{
        mid = 132027,
        name = <<"妖女">>,
        boss = 1,
        level = 32,
        attr = #bt_attr{hp_lim = 56000, mp_lim = 400, mp_rec = 400, inner_att = 1350, outer_att = 1350, inner_def = 1350, outer_def = 675, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132028) ->
    #mon{
        mid = 132028,
        name = <<"魔君">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 58000, mp_lim = 400, mp_rec = 400, inner_att = 1400, outer_att = 1400, inner_def = 1400, outer_def = 700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132029) ->
    #mon{
        mid = 132029,
        name = <<"摘星子">>,
        boss = 1,
        level = 34,
        attr = #bt_attr{hp_lim = 60000, mp_lim = 400, mp_rec = 400, inner_att = 1450, outer_att = 1450, inner_def = 1450, outer_def = 725, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132030) ->
    #mon{
        mid = 132030,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 35,
        attr = #bt_attr{hp_lim = 62000, mp_lim = 400, mp_rec = 400, inner_att = 1500, outer_att = 1500, inner_def = 1500, outer_def = 750, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132031) ->
    #mon{
        mid = 132031,
        name = <<"墨虎">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 64000, mp_lim = 400, mp_rec = 400, inner_att = 1550, outer_att = 1550, inner_def = 1550, outer_def = 775, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132032) ->
    #mon{
        mid = 132032,
        name = <<"妖女">>,
        boss = 1,
        level = 37,
        attr = #bt_attr{hp_lim = 66000, mp_lim = 400, mp_rec = 400, inner_att = 1600, outer_att = 1600, inner_def = 1600, outer_def = 800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132033) ->
    #mon{
        mid = 132033,
        name = <<"魔君">>,
        boss = 1,
        level = 38,
        attr = #bt_attr{hp_lim = 68000, mp_lim = 400, mp_rec = 400, inner_att = 1650, outer_att = 1650, inner_def = 1650, outer_def = 825, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132034) ->
    #mon{
        mid = 132034,
        name = <<"摘星子">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 70000, mp_lim = 400, mp_rec = 400, inner_att = 1700, outer_att = 1700, inner_def = 1700, outer_def = 850, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132035) ->
    #mon{
        mid = 132035,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 80000, mp_lim = 400, mp_rec = 400, inner_att = 1800, outer_att = 1800, inner_def = 1800, outer_def = 900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132036) ->
    #mon{
        mid = 132036,
        name = <<"墨虎">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 90000, mp_lim = 400, mp_rec = 400, inner_att = 1900, outer_att = 1900, inner_def = 1900, outer_def = 950, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132037) ->
    #mon{
        mid = 132037,
        name = <<"妖女">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 100000, mp_lim = 400, mp_rec = 400, inner_att = 2000, outer_att = 2000, inner_def = 2000, outer_def = 1000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132038) ->
    #mon{
        mid = 132038,
        name = <<"魔君">>,
        boss = 1,
        level = 43,
        attr = #bt_attr{hp_lim = 110000, mp_lim = 400, mp_rec = 400, inner_att = 2100, outer_att = 2100, inner_def = 2100, outer_def = 1050, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132039) ->
    #mon{
        mid = 132039,
        name = <<"摘星子">>,
        boss = 1,
        level = 44,
        attr = #bt_attr{hp_lim = 120000, mp_lim = 400, mp_rec = 400, inner_att = 2200, outer_att = 2200, inner_def = 2200, outer_def = 1100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132040) ->
    #mon{
        mid = 132040,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 130000, mp_lim = 400, mp_rec = 400, inner_att = 2300, outer_att = 2300, inner_def = 2300, outer_def = 1150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132041) ->
    #mon{
        mid = 132041,
        name = <<"墨虎">>,
        boss = 1,
        level = 46,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 2400, outer_att = 2400, inner_def = 2400, outer_def = 1200, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132042) ->
    #mon{
        mid = 132042,
        name = <<"妖女">>,
        boss = 1,
        level = 47,
        attr = #bt_attr{hp_lim = 150000, mp_lim = 400, mp_rec = 400, inner_att = 2500, outer_att = 2500, inner_def = 2500, outer_def = 1250, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132043) ->
    #mon{
        mid = 132043,
        name = <<"魔君">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 160000, mp_lim = 400, mp_rec = 400, inner_att = 2600, outer_att = 2600, inner_def = 2600, outer_def = 1300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132044) ->
    #mon{
        mid = 132044,
        name = <<"摘星子">>,
        boss = 1,
        level = 49,
        attr = #bt_attr{hp_lim = 170000, mp_lim = 400, mp_rec = 400, inner_att = 2700, outer_att = 2700, inner_def = 2700, outer_def = 1350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132045) ->
    #mon{
        mid = 132045,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 50,
        attr = #bt_attr{hp_lim = 180000, mp_lim = 400, mp_rec = 400, inner_att = 2800, outer_att = 2800, inner_def = 2800, outer_def = 1400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132046) ->
    #mon{
        mid = 132046,
        name = <<"墨虎">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 190000, mp_lim = 400, mp_rec = 400, inner_att = 2900, outer_att = 2900, inner_def = 2900, outer_def = 1450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132047) ->
    #mon{
        mid = 132047,
        name = <<"妖女">>,
        boss = 1,
        level = 52,
        attr = #bt_attr{hp_lim = 200000, mp_lim = 400, mp_rec = 400, inner_att = 3000, outer_att = 3000, inner_def = 3000, outer_def = 1500, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132048) ->
    #mon{
        mid = 132048,
        name = <<"魔君">>,
        boss = 1,
        level = 53,
        attr = #bt_attr{hp_lim = 210000, mp_lim = 400, mp_rec = 400, inner_att = 3100, outer_att = 3100, inner_def = 3100, outer_def = 1550, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132049) ->
    #mon{
        mid = 132049,
        name = <<"摘星子">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 220000, mp_lim = 400, mp_rec = 400, inner_att = 3200, outer_att = 3200, inner_def = 3200, outer_def = 1600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132050) ->
    #mon{
        mid = 132050,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 55,
        attr = #bt_attr{hp_lim = 230000, mp_lim = 400, mp_rec = 400, inner_att = 3300, outer_att = 3300, inner_def = 3300, outer_def = 1650, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132051) ->
    #mon{
        mid = 132051,
        name = <<"墨虎">>,
        boss = 1,
        level = 56,
        attr = #bt_attr{hp_lim = 240000, mp_lim = 400, mp_rec = 400, inner_att = 3400, outer_att = 3400, inner_def = 3400, outer_def = 1700, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132052) ->
    #mon{
        mid = 132052,
        name = <<"妖女">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 250000, mp_lim = 400, mp_rec = 400, inner_att = 3500, outer_att = 3500, inner_def = 3500, outer_def = 1750, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132053) ->
    #mon{
        mid = 132053,
        name = <<"魔君">>,
        boss = 1,
        level = 58,
        attr = #bt_attr{hp_lim = 260000, mp_lim = 400, mp_rec = 400, inner_att = 3600, outer_att = 3600, inner_def = 3600, outer_def = 1800, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132054) ->
    #mon{
        mid = 132054,
        name = <<"摘星子">>,
        boss = 1,
        level = 59,
        attr = #bt_attr{hp_lim = 270000, mp_lim = 400, mp_rec = 400, inner_att = 3700, outer_att = 3700, inner_def = 3700, outer_def = 1850, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132055) ->
    #mon{
        mid = 132055,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 280000, mp_lim = 400, mp_rec = 400, inner_att = 3800, outer_att = 3800, inner_def = 3800, outer_def = 1900, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132056) ->
    #mon{
        mid = 132056,
        name = <<"墨虎">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 290000, mp_lim = 400, mp_rec = 400, inner_att = 3900, outer_att = 3900, inner_def = 3900, outer_def = 1950, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132057) ->
    #mon{
        mid = 132057,
        name = <<"妖女">>,
        boss = 1,
        level = 62,
        attr = #bt_attr{hp_lim = 300000, mp_lim = 400, mp_rec = 400, inner_att = 4000, outer_att = 4000, inner_def = 4000, outer_def = 2000, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132058) ->
    #mon{
        mid = 132058,
        name = <<"魔君">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 330000, mp_lim = 400, mp_rec = 400, inner_att = 4300, outer_att = 4300, inner_def = 4300, outer_def = 2150, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132059) ->
    #mon{
        mid = 132059,
        name = <<"摘星子">>,
        boss = 1,
        level = 64,
        attr = #bt_attr{hp_lim = 360000, mp_lim = 400, mp_rec = 400, inner_att = 4600, outer_att = 4600, inner_def = 4600, outer_def = 2300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132060) ->
    #mon{
        mid = 132060,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 65,
        attr = #bt_attr{hp_lim = 390000, mp_lim = 400, mp_rec = 400, inner_att = 4900, outer_att = 4900, inner_def = 4900, outer_def = 2450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132061) ->
    #mon{
        mid = 132061,
        name = <<"墨虎">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 420000, mp_lim = 400, mp_rec = 400, inner_att = 5200, outer_att = 5200, inner_def = 5200, outer_def = 2600, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132062) ->
    #mon{
        mid = 132062,
        name = <<"妖女">>,
        boss = 1,
        level = 67,
        attr = #bt_attr{hp_lim = 450000, mp_lim = 400, mp_rec = 400, inner_att = 5500, outer_att = 5500, inner_def = 5500, outer_def = 2750, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132063) ->
    #mon{
        mid = 132063,
        name = <<"魔君">>,
        boss = 1,
        level = 68,
        attr = #bt_attr{hp_lim = 480000, mp_lim = 400, mp_rec = 400, inner_att = 5800, outer_att = 5800, inner_def = 5800, outer_def = 2900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132064) ->
    #mon{
        mid = 132064,
        name = <<"摘星子">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 510000, mp_lim = 400, mp_rec = 400, inner_att = 6100, outer_att = 6100, inner_def = 6100, outer_def = 3050, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132065) ->
    #mon{
        mid = 132065,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 540000, mp_lim = 400, mp_rec = 400, inner_att = 6400, outer_att = 6400, inner_def = 6400, outer_def = 3200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132066) ->
    #mon{
        mid = 132066,
        name = <<"墨虎">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 570000, mp_lim = 400, mp_rec = 400, inner_att = 6700, outer_att = 6700, inner_def = 6700, outer_def = 3350, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132067) ->
    #mon{
        mid = 132067,
        name = <<"妖女">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 600000, mp_lim = 400, mp_rec = 400, inner_att = 7000, outer_att = 7000, inner_def = 7000, outer_def = 3500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132068) ->
    #mon{
        mid = 132068,
        name = <<"魔君">>,
        boss = 1,
        level = 73,
        attr = #bt_attr{hp_lim = 630000, mp_lim = 400, mp_rec = 400, inner_att = 7300, outer_att = 7300, inner_def = 7300, outer_def = 3650, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132069) ->
    #mon{
        mid = 132069,
        name = <<"摘星子">>,
        boss = 1,
        level = 74,
        attr = #bt_attr{hp_lim = 660000, mp_lim = 400, mp_rec = 400, inner_att = 7600, outer_att = 7600, inner_def = 7600, outer_def = 3800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(132070) ->
    #mon{
        mid = 132070,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 690000, mp_lim = 400, mp_rec = 400, inner_att = 7900, outer_att = 7900, inner_def = 7900, outer_def = 3950, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132071) ->
    #mon{
        mid = 132071,
        name = <<"墨虎">>,
        boss = 1,
        level = 76,
        attr = #bt_attr{hp_lim = 800000, mp_lim = 400, mp_rec = 400, inner_att = 9000, outer_att = 9000, inner_def = 9000, outer_def = 4500, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132072) ->
    #mon{
        mid = 132072,
        name = <<"妖女">>,
        boss = 1,
        level = 77,
        attr = #bt_attr{hp_lim = 910000, mp_lim = 400, mp_rec = 400, inner_att = 10100, outer_att = 10100, inner_def = 10100, outer_def = 5050, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132073) ->
    #mon{
        mid = 132073,
        name = <<"魔君">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1020000, mp_lim = 400, mp_rec = 400, inner_att = 11200, outer_att = 11200, inner_def = 11200, outer_def = 5600, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132074) ->
    #mon{
        mid = 132074,
        name = <<"摘星子">>,
        boss = 1,
        level = 79,
        attr = #bt_attr{hp_lim = 1130000, mp_lim = 400, mp_rec = 400, inner_att = 12300, outer_att = 12300, inner_def = 12300, outer_def = 6150, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132075) ->
    #mon{
        mid = 132075,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 80,
        attr = #bt_attr{hp_lim = 1240000, mp_lim = 400, mp_rec = 400, inner_att = 13400, outer_att = 13400, inner_def = 13400, outer_def = 6700, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132076) ->
    #mon{
        mid = 132076,
        name = <<"墨虎">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1350000, mp_lim = 400, mp_rec = 400, inner_att = 14500, outer_att = 14500, inner_def = 14500, outer_def = 7250, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132077) ->
    #mon{
        mid = 132077,
        name = <<"妖女">>,
        boss = 1,
        level = 82,
        attr = #bt_attr{hp_lim = 1460000, mp_lim = 400, mp_rec = 400, inner_att = 15600, outer_att = 15600, inner_def = 15600, outer_def = 7800, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132078) ->
    #mon{
        mid = 132078,
        name = <<"魔君">>,
        boss = 1,
        level = 83,
        attr = #bt_attr{hp_lim = 1570000, mp_lim = 400, mp_rec = 400, inner_att = 16700, outer_att = 16700, inner_def = 16700, outer_def = 8350, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132079) ->
    #mon{
        mid = 132079,
        name = <<"摘星子">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1680000, mp_lim = 400, mp_rec = 400, inner_att = 17800, outer_att = 17800, inner_def = 17800, outer_def = 8900, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132080) ->
    #mon{
        mid = 132080,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 85,
        attr = #bt_attr{hp_lim = 1790000, mp_lim = 400, mp_rec = 400, inner_att = 18900, outer_att = 18900, inner_def = 18900, outer_def = 9450, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132081) ->
    #mon{
        mid = 132081,
        name = <<"墨虎">>,
        boss = 1,
        level = 86,
        attr = #bt_attr{hp_lim = 1900000, mp_lim = 400, mp_rec = 400, inner_att = 20000, outer_att = 20000, inner_def = 20000, outer_def = 10000, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132082) ->
    #mon{
        mid = 132082,
        name = <<"妖女">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 2300000, mp_lim = 400, mp_rec = 400, inner_att = 21100, outer_att = 21100, inner_def = 21100, outer_def = 10550, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132083) ->
    #mon{
        mid = 132083,
        name = <<"魔君">>,
        boss = 1,
        level = 88,
        attr = #bt_attr{hp_lim = 2700000, mp_lim = 400, mp_rec = 400, inner_att = 22200, outer_att = 22200, inner_def = 22200, outer_def = 11100, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132084) ->
    #mon{
        mid = 132084,
        name = <<"摘星子">>,
        boss = 1,
        level = 89,
        attr = #bt_attr{hp_lim = 3100000, mp_lim = 400, mp_rec = 400, inner_att = 23300, outer_att = 23300, inner_def = 23300, outer_def = 11650, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132085) ->
    #mon{
        mid = 132085,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 3500000, mp_lim = 400, mp_rec = 400, inner_att = 24400, outer_att = 24400, inner_def = 24400, outer_def = 12200, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132086) ->
    #mon{
        mid = 132086,
        name = <<"墨虎">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3900000, mp_lim = 400, mp_rec = 400, inner_att = 25500, outer_att = 25500, inner_def = 25500, outer_def = 12750, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132087) ->
    #mon{
        mid = 132087,
        name = <<"妖女">>,
        boss = 1,
        level = 92,
        attr = #bt_attr{hp_lim = 4300000, mp_lim = 400, mp_rec = 400, inner_att = 26600, outer_att = 26600, inner_def = 26600, outer_def = 13300, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132088) ->
    #mon{
        mid = 132088,
        name = <<"魔君">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 4700000, mp_lim = 400, mp_rec = 400, inner_att = 27700, outer_att = 27700, inner_def = 27700, outer_def = 13850, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132089) ->
    #mon{
        mid = 132089,
        name = <<"摘星子">>,
        boss = 1,
        level = 94,
        attr = #bt_attr{hp_lim = 5100000, mp_lim = 400, mp_rec = 400, inner_att = 28800, outer_att = 28800, inner_def = 28800, outer_def = 14400, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132090) ->
    #mon{
        mid = 132090,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 95,
        attr = #bt_attr{hp_lim = 5500000, mp_lim = 400, mp_rec = 400, inner_att = 29900, outer_att = 29900, inner_def = 29900, outer_def = 14950, hit = 1500, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 100},
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
get(132091) ->
    #mon{
        mid = 132091,
        name = <<"墨虎">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 5900000, mp_lim = 400, mp_rec = 400, inner_att = 31000, outer_att = 31000, inner_def = 31000, outer_def = 15500, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 100},
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
get(132092) ->
    #mon{
        mid = 132092,
        name = <<"妖女">>,
        boss = 1,
        level = 97,
        attr = #bt_attr{hp_lim = 6300000, mp_lim = 400, mp_rec = 400, inner_att = 35000, outer_att = 35000, inner_def = 35000, outer_def = 16050, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 100},
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
get(132093) ->
    #mon{
        mid = 132093,
        name = <<"魔君">>,
        boss = 1,
        level = 98,
        attr = #bt_attr{hp_lim = 6700000, mp_lim = 400, mp_rec = 400, inner_att = 39000, outer_att = 39000, inner_def = 39000, outer_def = 16600, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 100},
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
get(132094) ->
    #mon{
        mid = 132094,
        name = <<"摘星子">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 7100000, mp_lim = 400, mp_rec = 400, inner_att = 43000, outer_att = 43000, inner_def = 43000, outer_def = 17150, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(132095) ->
    #mon{
        mid = 132095,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 100,
        attr = #bt_attr{hp_lim = 7500000, mp_lim = 400, mp_rec = 400, inner_att = 47000, outer_att = 47000, inner_def = 47000, outer_def = 17700, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(132096) ->
    #mon{
        mid = 132096,
        name = <<"墨虎">>,
        boss = 1,
        level = 101,
        attr = #bt_attr{hp_lim = 7900000, mp_lim = 400, mp_rec = 400, inner_att = 51000, outer_att = 51000, inner_def = 51000, outer_def = 18250, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(132097) ->
    #mon{
        mid = 132097,
        name = <<"妖女">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 8300000, mp_lim = 400, mp_rec = 400, inner_att = 55000, outer_att = 55000, inner_def = 55000, outer_def = 18800, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(132098) ->
    #mon{
        mid = 132098,
        name = <<"魔君">>,
        boss = 1,
        level = 103,
        attr = #bt_attr{hp_lim = 8700000, mp_lim = 400, mp_rec = 400, inner_att = 59000, outer_att = 59000, inner_def = 59000, outer_def = 19350, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(132099) ->
    #mon{
        mid = 132099,
        name = <<"摘星子">>,
        boss = 1,
        level = 104,
        attr = #bt_attr{hp_lim = 9100000, mp_lim = 400, mp_rec = 400, inner_att = 63000, outer_att = 63000, inner_def = 63000, outer_def = 19900, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(132100) ->
    #mon{
        mid = 132100,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 9500000, mp_lim = 400, mp_rec = 400, inner_att = 67000, outer_att = 67000, inner_def = 67000, outer_def = 20450, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(132101) ->
    #mon{
        mid = 132101,
        name = <<"墨虎">>,
        boss = 1,
        level = 106,
        attr = #bt_attr{hp_lim = 9900000, mp_lim = 400, mp_rec = 400, inner_att = 71000, outer_att = 71000, inner_def = 71000, outer_def = 21000, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(132102) ->
    #mon{
        mid = 132102,
        name = <<"妖女">>,
        boss = 1,
        level = 107,
        attr = #bt_attr{hp_lim = 10300000, mp_lim = 400, mp_rec = 400, inner_att = 75000, outer_att = 75000, inner_def = 75000, outer_def = 15500, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(132103) ->
    #mon{
        mid = 132103,
        name = <<"魔君">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 10700000, mp_lim = 400, mp_rec = 400, inner_att = 79000, outer_att = 79000, inner_def = 79000, outer_def = 16050, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(132104) ->
    #mon{
        mid = 132104,
        name = <<"摘星子">>,
        boss = 1,
        level = 109,
        attr = #bt_attr{hp_lim = 11100000, mp_lim = 400, mp_rec = 400, inner_att = 83000, outer_att = 83000, inner_def = 83000, outer_def = 16600, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(132105) ->
    #mon{
        mid = 132105,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 110,
        attr = #bt_attr{hp_lim = 11500000, mp_lim = 400, mp_rec = 400, inner_att = 87000, outer_att = 87000, inner_def = 87000, outer_def = 17150, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(132106) ->
    #mon{
        mid = 132106,
        name = <<"墨虎">>,
        boss = 1,
        level = 111,
        attr = #bt_attr{hp_lim = 11900000, mp_lim = 400, mp_rec = 400, inner_att = 91000, outer_att = 91000, inner_def = 91000, outer_def = 17700, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(132107) ->
    #mon{
        mid = 132107,
        name = <<"妖女">>,
        boss = 1,
        level = 112,
        attr = #bt_attr{hp_lim = 12300000, mp_lim = 400, mp_rec = 400, inner_att = 95000, outer_att = 95000, inner_def = 95000, outer_def = 18250, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(132108) ->
    #mon{
        mid = 132108,
        name = <<"魔君">>,
        boss = 1,
        level = 113,
        attr = #bt_attr{hp_lim = 12700000, mp_lim = 400, mp_rec = 400, inner_att = 99000, outer_att = 99000, inner_def = 99000, outer_def = 18800, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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
get(132109) ->
    #mon{
        mid = 132109,
        name = <<"摘星子">>,
        boss = 1,
        level = 114,
        attr = #bt_attr{hp_lim = 13100000, mp_lim = 400, mp_rec = 400, inner_att = 103000, outer_att = 103000, inner_def = 103000, outer_def = 19350, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_poison = 500},
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
get(132110) ->
    #mon{
        mid = 132110,
        name = <<"神秘剑客">>,
        boss = 1,
        level = 115,
        attr = #bt_attr{hp_lim = 13500000, mp_lim = 400, mp_rec = 400, inner_att = 107000, outer_att = 107000, inner_def = 107000, outer_def = 19900, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_ice = 500},
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
get(132111) ->
    #mon{
        mid = 132111,
        name = <<"墨虎">>,
        boss = 1,
        level = 116,
        attr = #bt_attr{hp_lim = 13900000, mp_lim = 400, mp_rec = 400, inner_att = 111000, outer_att = 111000, inner_def = 111000, outer_def = 20450, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_fire = 500},
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
get(132112) ->
    #mon{
        mid = 132112,
        name = <<"妖女">>,
        boss = 1,
        level = 117,
        attr = #bt_attr{hp_lim = 14300000, mp_lim = 400, mp_rec = 400, inner_att = 115000, outer_att = 115000, inner_def = 115000, outer_def = 21000, hit = 4500, dodge = 3000, crit_hurt = 6, crit_def = 10, move_speed = 200, aatt_dark = 500},
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

