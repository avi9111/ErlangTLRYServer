%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_20
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_20).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(201001) ->
    #mon{
        mid = 201001,
        name = <<"混江龙">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 643040, mp_lim = 4467, inner_att = 1530, outer_att = 1530, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201002) ->
    #mon{
        mid = 201002,
        name = <<"混江龙">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 855520, mp_lim = 5011, inner_att = 2015, outer_att = 2015, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201003) ->
    #mon{
        mid = 201003,
        name = <<"混江龙">>,
        boss = 1,
        level = 50,
        attr = #bt_attr{hp_lim = 1092640, mp_lim = 5549, inner_att = 2555, outer_att = 2555, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201004) ->
    #mon{
        mid = 201004,
        name = <<"混江龙">>,
        boss = 1,
        level = 55,
        attr = #bt_attr{hp_lim = 1362880, mp_lim = 6093, inner_att = 3165, outer_att = 3165, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201005) ->
    #mon{
        mid = 201005,
        name = <<"混江龙">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 1656480, mp_lim = 6632, inner_att = 3825, outer_att = 3825, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201006) ->
    #mon{
        mid = 201006,
        name = <<"混江龙">>,
        boss = 1,
        level = 65,
        attr = #bt_attr{hp_lim = 1984560, mp_lim = 7176, inner_att = 4560, outer_att = 4560, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201007) ->
    #mon{
        mid = 201007,
        name = <<"混江龙">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 2334640, mp_lim = 7714, inner_att = 5345, outer_att = 5345, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201008) ->
    #mon{
        mid = 201008,
        name = <<"混江龙">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 2709520, mp_lim = 8258, inner_att = 6180, outer_att = 6180, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201009) ->
    #mon{
        mid = 201009,
        name = <<"混江龙">>,
        boss = 1,
        level = 80,
        attr = #bt_attr{hp_lim = 3057120, mp_lim = 8797, inner_att = 6955, outer_att = 6955, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(201010) ->
    #mon{
        mid = 201010,
        name = <<"混江龙">>,
        boss = 1,
        level = 85,
        attr = #bt_attr{hp_lim = 3434320, mp_lim = 9341, inner_att = 7785, outer_att = 7785, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 3033,
        args = [],
        exp = 0
    };
get(202001) ->
    #mon{
        mid = 202001,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 160760, mp_lim = 4467, inner_att = 612, outer_att = 612, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202002) ->
    #mon{
        mid = 202002,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 213880, mp_lim = 5011, inner_att = 806, outer_att = 806, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202003) ->
    #mon{
        mid = 202003,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 273160, mp_lim = 5549, inner_att = 1022, outer_att = 1022, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202004) ->
    #mon{
        mid = 202004,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 340720, mp_lim = 6093, inner_att = 1266, outer_att = 1266, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202005) ->
    #mon{
        mid = 202005,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 414120, mp_lim = 6632, inner_att = 1530, outer_att = 1530, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202006) ->
    #mon{
        mid = 202006,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 496140, mp_lim = 7176, inner_att = 1824, outer_att = 1824, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202007) ->
    #mon{
        mid = 202007,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 583660, mp_lim = 7714, inner_att = 2138, outer_att = 2138, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202008) ->
    #mon{
        mid = 202008,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 677380, mp_lim = 8258, inner_att = 2472, outer_att = 2472, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202009) ->
    #mon{
        mid = 202009,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 764280, mp_lim = 8797, inner_att = 2782, outer_att = 2782, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(202010) ->
    #mon{
        mid = 202010,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 858580, mp_lim = 9341, inner_att = 3114, outer_att = 3114, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 3034,
        args = [],
        exp = 0
    };
get(203001) ->
    #mon{
        mid = 203001,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 160760, mp_lim = 4467, inner_att = 612, outer_att = 612, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203002) ->
    #mon{
        mid = 203002,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 213880, mp_lim = 5011, inner_att = 806, outer_att = 806, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203003) ->
    #mon{
        mid = 203003,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 273160, mp_lim = 5549, inner_att = 1022, outer_att = 1022, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203004) ->
    #mon{
        mid = 203004,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 340720, mp_lim = 6093, inner_att = 1266, outer_att = 1266, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203005) ->
    #mon{
        mid = 203005,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 414120, mp_lim = 6632, inner_att = 1530, outer_att = 1530, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203006) ->
    #mon{
        mid = 203006,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 496140, mp_lim = 7176, inner_att = 1824, outer_att = 1824, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203007) ->
    #mon{
        mid = 203007,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 583660, mp_lim = 7714, inner_att = 2138, outer_att = 2138, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203008) ->
    #mon{
        mid = 203008,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 677380, mp_lim = 8258, inner_att = 2472, outer_att = 2472, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203009) ->
    #mon{
        mid = 203009,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 764280, mp_lim = 8797, inner_att = 2782, outer_att = 2782, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(203010) ->
    #mon{
        mid = 203010,
        name = <<"出洞蛟">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 858580, mp_lim = 9341, inner_att = 3114, outer_att = 3114, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 3035,
        args = [],
        exp = 0
    };
get(205001) ->
    #mon{
        mid = 205001,
        name = <<"混江小龙">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 45459, mp_lim = 3601, inner_att = 196, outer_att = 196, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205002) ->
    #mon{
        mid = 205002,
        name = <<"混江小龙">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 50454, mp_lim = 3817, inner_att = 216, outer_att = 216, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205003) ->
    #mon{
        mid = 205003,
        name = <<"混江小龙">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 55710, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205004) ->
    #mon{
        mid = 205004,
        name = <<"混江小龙">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 63765, mp_lim = 4250, inner_att = 271, outer_att = 271, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205005) ->
    #mon{
        mid = 205005,
        name = <<"混江小龙">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 72342, mp_lim = 4467, inner_att = 306, outer_att = 306, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205006) ->
    #mon{
        mid = 205006,
        name = <<"混江小龙">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 81423, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205007) ->
    #mon{
        mid = 205007,
        name = <<"混江小龙">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 91026, mp_lim = 4900, inner_att = 382, outer_att = 382, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205008) ->
    #mon{
        mid = 205008,
        name = <<"混江小龙">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 101142, mp_lim = 5116, inner_att = 423, outer_att = 423, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205009) ->
    #mon{
        mid = 205009,
        name = <<"混江小龙">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 111771, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205010) ->
    #mon{
        mid = 205010,
        name = <<"混江小龙">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 122922, mp_lim = 5549, inner_att = 511, outer_att = 511, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205011) ->
    #mon{
        mid = 205011,
        name = <<"混江小龙">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 134577, mp_lim = 5766, inner_att = 558, outer_att = 558, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205012) ->
    #mon{
        mid = 205012,
        name = <<"混江小龙">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 146754, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205013) ->
    #mon{
        mid = 205013,
        name = <<"混江小龙">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 159435, mp_lim = 6199, inner_att = 658, outer_att = 658, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205014) ->
    #mon{
        mid = 205014,
        name = <<"混江小龙">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 172638, mp_lim = 6415, inner_att = 711, outer_att = 711, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205015) ->
    #mon{
        mid = 205015,
        name = <<"混江小龙">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 186354, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205016) ->
    #mon{
        mid = 205016,
        name = <<"混江小龙">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 200583, mp_lim = 6848, inner_att = 822, outer_att = 822, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205017) ->
    #mon{
        mid = 205017,
        name = <<"混江小龙">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 215334, mp_lim = 7065, inner_att = 881, outer_att = 881, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205018) ->
    #mon{
        mid = 205018,
        name = <<"混江小龙">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 230589, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205019) ->
    #mon{
        mid = 205019,
        name = <<"混江小龙">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 246366, mp_lim = 7498, inner_att = 1005, outer_att = 1005, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205020) ->
    #mon{
        mid = 205020,
        name = <<"混江小龙">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 262647, mp_lim = 7714, inner_att = 1069, outer_att = 1069, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205021) ->
    #mon{
        mid = 205021,
        name = <<"混江小龙">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 279450, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205022) ->
    #mon{
        mid = 205022,
        name = <<"混江小龙">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 296766, mp_lim = 8147, inner_att = 1205, outer_att = 1205, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205023) ->
    #mon{
        mid = 205023,
        name = <<"混江小龙">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 312102, mp_lim = 8364, inner_att = 1265, outer_att = 1265, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205024) ->
    #mon{
        mid = 205024,
        name = <<"混江小龙">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 327825, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205025) ->
    #mon{
        mid = 205025,
        name = <<"混江小龙">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 343926, mp_lim = 8797, inner_att = 1391, outer_att = 1391, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205026) ->
    #mon{
        mid = 205026,
        name = <<"混江小龙">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 360414, mp_lim = 9013, inner_att = 1456, outer_att = 1456, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205027) ->
    #mon{
        mid = 205027,
        name = <<"混江小龙">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 377298, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205028) ->
    #mon{
        mid = 205028,
        name = <<"混江小龙">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 394560, mp_lim = 9446, inner_att = 1591, outer_att = 1591, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205029) ->
    #mon{
        mid = 205029,
        name = <<"混江小龙">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 412200, mp_lim = 9663, inner_att = 1660, outer_att = 1660, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(205030) ->
    #mon{
        mid = 205030,
        name = <<"混江小龙">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 430236, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 20,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 3036,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

