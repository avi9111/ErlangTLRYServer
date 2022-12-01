%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_50
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_50).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(500101) ->
    #mon{
        mid = 500101,
        name = <<"丐帮机器人10">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 9504, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10010001,1,100,6},{10010002,1,100,6},{10010003,1,100,6},{10010011,1,100,6},{10010012,1,100,6},{10010013,1,100,6},{10010014,1,100,6},{10010015,1,100,6},{10010016,1,100,6},{10010017,1,100,6},{10010018,1,100,6},{10010099,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500102) ->
    #mon{
        mid = 500102,
        name = <<"丐帮机器人20">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 21056, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10010001,10,100,6},{10010002,10,100,6},{10010003,10,100,6},{10010011,10,100,6},{10010012,10,100,6},{10010013,10,100,6},{10010014,10,100,6},{10010015,10,100,6},{10010016,10,100,6},{10010017,10,100,6},{10010018,10,100,6},{10010099,10,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500103) ->
    #mon{
        mid = 500103,
        name = <<"丐帮机器人40">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 69064, mp_lim = 4467, inner_att = 1316, outer_att = 1316, inner_def = 343, outer_def = 343, hit = 3374, dodge = 307, crit_hurt = 327, crit_def = 78, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10010001,30,100,6},{10010002,30,100,6},{10010003,30,100,6},{10010011,30,100,6},{10010012,30,100,6},{10010013,30,100,6},{10010014,30,100,6},{10010015,30,100,6},{10010016,30,100,6},{10010017,30,100,6},{10010018,30,100,6},{10010099,30,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500104) ->
    #mon{
        mid = 500104,
        name = <<"丐帮机器人70">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 241656, mp_lim = 7714, inner_att = 4428, outer_att = 4428, inner_def = 1187, outer_def = 1187, hit = 11493, dodge = 1063, crit_hurt = 1116, crit_def = 265, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10010001,60,100,6},{10010002,60,100,6},{10010003,60,100,6},{10010011,60,100,6},{10010012,60,100,6},{10010013,60,100,6},{10010014,60,100,6},{10010015,60,100,6},{10010016,60,100,6},{10010017,60,100,6},{10010018,60,100,6},{10010099,60,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500201) ->
    #mon{
        mid = 500201,
        name = <<"逍遥机器人10">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 9504, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10020001,1,100,6},{10020002,1,100,6},{10020003,1,100,6},{10020011,1,100,6},{10020012,1,100,6},{10020013,1,100,6},{10020014,1,100,6},{10020015,1,100,6},{10020016,1,100,6},{10020017,1,100,6},{10020018,1,100,6},{10020099,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500202) ->
    #mon{
        mid = 500202,
        name = <<"逍遥机器人20">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 21056, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10020001,10,100,6},{10020002,10,100,6},{10020003,10,100,6},{10020011,10,100,6},{10020012,10,100,6},{10020013,10,100,6},{10020014,10,100,6},{10020015,10,100,6},{10020016,10,100,6},{10020017,10,100,6},{10020018,10,100,6},{10020099,10,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500203) ->
    #mon{
        mid = 500203,
        name = <<"逍遥机器人40">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 69064, mp_lim = 4467, inner_att = 1316, outer_att = 1316, inner_def = 343, outer_def = 343, hit = 3374, dodge = 307, crit_hurt = 327, crit_def = 78, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10020001,30,100,6},{10020002,30,100,6},{10020003,30,100,6},{10020011,30,100,6},{10020012,30,100,6},{10020013,30,100,6},{10020014,30,100,6},{10020015,30,100,6},{10020016,30,100,6},{10020017,30,100,6},{10020018,30,100,6},{10020099,30,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500204) ->
    #mon{
        mid = 500204,
        name = <<"逍遥机器人70">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 241656, mp_lim = 7714, inner_att = 4428, outer_att = 4428, inner_def = 1187, outer_def = 1187, hit = 11493, dodge = 1063, crit_hurt = 1116, crit_def = 265, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10020001,60,100,6},{10020002,60,100,6},{10020003,60,100,6},{10020011,60,100,6},{10020012,60,100,6},{10020013,60,100,6},{10020014,60,100,6},{10020015,60,100,6},{10020016,60,100,6},{10020017,60,100,6},{10020018,60,100,6},{10020099,60,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500301) ->
    #mon{
        mid = 500301,
        name = <<"峨眉机器人10">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 9504, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10030001,1,100,6},{10030002,1,100,6},{10030003,1,100,6},{10030011,1,100,6},{10030012,1,100,6},{10030013,1,100,6},{10030014,1,100,6},{10030015,1,100,6},{10030016,1,100,6},{10030017,1,100,6},{10030018,1,100,6},{10030099,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500302) ->
    #mon{
        mid = 500302,
        name = <<"峨眉机器人20">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 21056, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10030001,10,100,6},{10030002,10,100,6},{10030003,10,100,6},{10030011,10,100,6},{10030012,10,100,6},{10030013,10,100,6},{10030014,10,100,6},{10030015,10,100,6},{10030016,10,100,6},{10030017,10,100,6},{10030018,10,100,6},{10030099,10,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500303) ->
    #mon{
        mid = 500303,
        name = <<"峨眉机器人40">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 69064, mp_lim = 4467, inner_att = 1316, outer_att = 1316, inner_def = 343, outer_def = 343, hit = 3374, dodge = 307, crit_hurt = 327, crit_def = 78, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10030001,30,100,6},{10030002,30,100,6},{10030003,30,100,6},{10030011,30,100,6},{10030012,30,100,6},{10030013,30,100,6},{10030014,30,100,6},{10030015,30,100,6},{10030016,30,100,6},{10030017,30,100,6},{10030018,30,100,6},{10030099,30,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500304) ->
    #mon{
        mid = 500304,
        name = <<"峨眉机器人70">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 241656, mp_lim = 7714, inner_att = 4428, outer_att = 4428, inner_def = 1187, outer_def = 1187, hit = 11493, dodge = 1063, crit_hurt = 1116, crit_def = 265, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10030001,60,100,6},{10030002,60,100,6},{10030003,60,100,6},{10030011,60,100,6},{10030012,60,100,6},{10030013,60,100,6},{10030014,60,100,6},{10030015,60,100,6},{10030016,60,100,6},{10030017,60,100,6},{10030018,60,100,6},{10030099,60,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500401) ->
    #mon{
        mid = 500401,
        name = <<"天山机器人10">>,
        boss = 1,
        level = 10,
        attr = #bt_attr{hp_lim = 9504, mp_lim = 1219, inner_att = 220, outer_att = 220, inner_def = 50, outer_def = 50, hit = 540, dodge = 45, crit_hurt = 51, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10040001,1,100,6},{10040002,1,100,6},{10040003,1,100,6},{10040011,1,100,6},{10040012,1,100,6},{10040013,1,100,6},{10040014,1,100,6},{10040015,1,100,6},{10040016,1,100,6},{10040017,1,100,6},{10040018,1,100,6},{10040099,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500402) ->
    #mon{
        mid = 500402,
        name = <<"天山机器人20">>,
        boss = 1,
        level = 20,
        attr = #bt_attr{hp_lim = 21056, mp_lim = 2302, inner_att = 432, outer_att = 432, inner_def = 107, outer_def = 107, hit = 1088, dodge = 96, crit_hurt = 105, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10040001,10,100,6},{10040002,10,100,6},{10040003,10,100,6},{10040011,10,100,6},{10040012,10,100,6},{10040013,10,100,6},{10040014,10,100,6},{10040015,10,100,6},{10040016,10,100,6},{10040017,10,100,6},{10040018,10,100,6},{10040099,10,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500403) ->
    #mon{
        mid = 500403,
        name = <<"天山机器人40">>,
        boss = 1,
        level = 40,
        attr = #bt_attr{hp_lim = 69064, mp_lim = 4467, inner_att = 1316, outer_att = 1316, inner_def = 343, outer_def = 343, hit = 3374, dodge = 307, crit_hurt = 327, crit_def = 78, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10040001,30,100,6},{10040002,30,100,6},{10040003,30,100,6},{10040011,30,100,6},{10040012,30,100,6},{10040013,30,100,6},{10040014,30,100,6},{10040015,30,100,6},{10040016,30,100,6},{10040017,30,100,6},{10040018,30,100,6},{10040099,30,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(500404) ->
    #mon{
        mid = 500404,
        name = <<"天山机器人70">>,
        boss = 1,
        level = 70,
        attr = #bt_attr{hp_lim = 241656, mp_lim = 7714, inner_att = 4428, outer_att = 4428, inner_def = 1187, outer_def = 1187, hit = 11493, dodge = 1063, crit_hurt = 1116, crit_def = 265, move_speed = 200},
        att_type = 0,
        att_area = 10,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{10040001,60,100,6},{10040002,60,100,6},{10040003,60,100,6},{10040011,60,100,6},{10040012,60,100,6},{10040013,60,100,6},{10040014,60,100,6},{10040015,60,100,6},{10040016,60,100,6},{10040017,60,100,6},{10040018,60,100,6},{10040099,60,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

