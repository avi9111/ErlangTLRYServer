%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_30
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_30).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(301001) ->
    #mon{
        mid = 301001,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2587, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 165
    };
get(301002) ->
    #mon{
        mid = 301002,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2069, mp_lim = 49, inner_att = 27, outer_att = 27, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 165
    };
get(301003) ->
    #mon{
        mid = 301003,
        name = <<"小熊">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2587, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301004) ->
    #mon{
        mid = 301004,
        name = <<"鼓手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2587, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301005) ->
    #mon{
        mid = 301005,
        name = <<"余毒">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 12935, mp_lim = 49, inner_att = 102, outer_att = 102, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280201,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1730
    };
get(301006) ->
    #mon{
        mid = 301006,
        name = <<"红熊王">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 16556, mp_lim = 49, inner_att = 119, outer_att = 119, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280301,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 2111,
        args = [],
        exp = 1730
    };
get(301007) ->
    #mon{
        mid = 301007,
        name = <<"葛荣">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 14487, mp_lim = 49, inner_att = 170, outer_att = 170, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 2114,
        args = [],
        exp = 1730
    };
get(301008) ->
    #mon{
        mid = 301008,
        name = <<"小熊">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2587, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301009) ->
    #mon{
        mid = 301009,
        name = <<"鼓手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2587, mp_lim = 49, inner_att = 34, outer_att = 34, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301010) ->
    #mon{
        mid = 301010,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 18626, mp_lim = 49, inner_att = 221, outer_att = 221, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280501,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 2114,
        args = [],
        exp = 2160
    };
get(301101) ->
    #mon{
        mid = 301101,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14833, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 330
    };
get(301102) ->
    #mon{
        mid = 301102,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 11866, mp_lim = 1330, inner_att = 83, outer_att = 83, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 330
    };
get(301103) ->
    #mon{
        mid = 301103,
        name = <<"小熊">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14833, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301104) ->
    #mon{
        mid = 301104,
        name = <<"鼓手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14833, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301105) ->
    #mon{
        mid = 301105,
        name = <<"余毒">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 74165, mp_lim = 1330, inner_att = 312, outer_att = 312, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280201,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3460
    };
get(301106) ->
    #mon{
        mid = 301106,
        name = <<"红熊王">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 94931, mp_lim = 1330, inner_att = 364, outer_att = 364, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280301,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211101,
        args = [],
        exp = 3460
    };
get(301107) ->
    #mon{
        mid = 301107,
        name = <<"葛荣">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 83064, mp_lim = 1330, inner_att = 520, outer_att = 520, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211401,
        args = [],
        exp = 3460
    };
get(301108) ->
    #mon{
        mid = 301108,
        name = <<"小熊">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14833, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301109) ->
    #mon{
        mid = 301109,
        name = <<"鼓手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 14833, mp_lim = 1330, inner_att = 104, outer_att = 104, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301110) ->
    #mon{
        mid = 301110,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 106797, mp_lim = 1330, inner_att = 676, outer_att = 676, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211401,
        args = [],
        exp = 4320
    };
get(301201) ->
    #mon{
        mid = 301201,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 32786, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 495
    };
get(301202) ->
    #mon{
        mid = 301202,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 26228, mp_lim = 2413, inner_att = 164, outer_att = 164, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 495
    };
get(301203) ->
    #mon{
        mid = 301203,
        name = <<"小熊">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 32786, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301204) ->
    #mon{
        mid = 301204,
        name = <<"鼓手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 32786, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301205) ->
    #mon{
        mid = 301205,
        name = <<"余毒">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 163930, mp_lim = 2413, inner_att = 618, outer_att = 618, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280202,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5190
    };
get(301206) ->
    #mon{
        mid = 301206,
        name = <<"红熊王">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 209830, mp_lim = 2413, inner_att = 721, outer_att = 721, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280302,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211102,
        args = [],
        exp = 5190
    };
get(301207) ->
    #mon{
        mid = 301207,
        name = <<"葛荣">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 183601, mp_lim = 2413, inner_att = 1030, outer_att = 1030, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280402,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211402,
        args = [],
        exp = 5190
    };
get(301208) ->
    #mon{
        mid = 301208,
        name = <<"小熊">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 32786, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301209) ->
    #mon{
        mid = 301209,
        name = <<"鼓手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 32786, mp_lim = 2413, inner_att = 206, outer_att = 206, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301210) ->
    #mon{
        mid = 301210,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 236059, mp_lim = 2413, inner_att = 1339, outer_att = 1339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280502,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211402,
        args = [],
        exp = 6480
    };
get(301301) ->
    #mon{
        mid = 301301,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 62413, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 726
    };
get(301302) ->
    #mon{
        mid = 301302,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 49930, mp_lim = 3495, inner_att = 299, outer_att = 299, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 726
    };
get(301303) ->
    #mon{
        mid = 301303,
        name = <<"小熊">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 62413, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301304) ->
    #mon{
        mid = 301304,
        name = <<"鼓手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 62413, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301305) ->
    #mon{
        mid = 301305,
        name = <<"余毒">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 312065, mp_lim = 3495, inner_att = 1122, outer_att = 1122, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280203,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7612
    };
get(301306) ->
    #mon{
        mid = 301306,
        name = <<"红熊王">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 399443, mp_lim = 3495, inner_att = 1309, outer_att = 1309, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280303,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211103,
        args = [],
        exp = 7612
    };
get(301307) ->
    #mon{
        mid = 301307,
        name = <<"葛荣">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 349512, mp_lim = 3495, inner_att = 1870, outer_att = 1870, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280403,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211403,
        args = [],
        exp = 7612
    };
get(301308) ->
    #mon{
        mid = 301308,
        name = <<"小熊">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 62413, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301309) ->
    #mon{
        mid = 301309,
        name = <<"鼓手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 62413, mp_lim = 3495, inner_att = 374, outer_att = 374, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301310) ->
    #mon{
        mid = 301310,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 449373, mp_lim = 3495, inner_att = 2431, outer_att = 2431, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280503,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211403,
        args = [],
        exp = 9504
    };
get(301401) ->
    #mon{
        mid = 301401,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 111241, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 957
    };
get(301402) ->
    #mon{
        mid = 301402,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 88992, mp_lim = 4578, inner_att = 520, outer_att = 520, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 957
    };
get(301403) ->
    #mon{
        mid = 301403,
        name = <<"小熊">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 111241, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301404) ->
    #mon{
        mid = 301404,
        name = <<"鼓手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 111241, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301405) ->
    #mon{
        mid = 301405,
        name = <<"余毒">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 556205, mp_lim = 4578, inner_att = 1950, outer_att = 1950, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280204,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 10034
    };
get(301406) ->
    #mon{
        mid = 301406,
        name = <<"红熊王">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 711942, mp_lim = 4578, inner_att = 2275, outer_att = 2275, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280304,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211104,
        args = [],
        exp = 10034
    };
get(301407) ->
    #mon{
        mid = 301407,
        name = <<"葛荣">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 622949, mp_lim = 4578, inner_att = 3250, outer_att = 3250, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280404,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211404,
        args = [],
        exp = 10034
    };
get(301408) ->
    #mon{
        mid = 301408,
        name = <<"小熊">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 111241, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301409) ->
    #mon{
        mid = 301409,
        name = <<"鼓手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 111241, mp_lim = 4578, inner_att = 650, outer_att = 650, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301410) ->
    #mon{
        mid = 301410,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 800935, mp_lim = 4578, inner_att = 4225, outer_att = 4225, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280504,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211404,
        args = [],
        exp = 12528
    };
get(301501) ->
    #mon{
        mid = 301501,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 186264, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1254
    };
get(301502) ->
    #mon{
        mid = 301502,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 149011, mp_lim = 5660, inner_att = 856, outer_att = 856, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1254
    };
get(301503) ->
    #mon{
        mid = 301503,
        name = <<"小熊">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 186264, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301504) ->
    #mon{
        mid = 301504,
        name = <<"鼓手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 186264, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301505) ->
    #mon{
        mid = 301505,
        name = <<"余毒">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 931320, mp_lim = 5660, inner_att = 3210, outer_att = 3210, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280205,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 13148
    };
get(301506) ->
    #mon{
        mid = 301506,
        name = <<"红熊王">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1192089, mp_lim = 5660, inner_att = 3745, outer_att = 3745, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280305,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211105,
        args = [],
        exp = 13148
    };
get(301507) ->
    #mon{
        mid = 301507,
        name = <<"葛荣">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1043078, mp_lim = 5660, inner_att = 5350, outer_att = 5350, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280405,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211405,
        args = [],
        exp = 13148
    };
get(301508) ->
    #mon{
        mid = 301508,
        name = <<"小熊">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 186264, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301509) ->
    #mon{
        mid = 301509,
        name = <<"鼓手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 186264, mp_lim = 5660, inner_att = 1070, outer_att = 1070, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301510) ->
    #mon{
        mid = 301510,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1341100, mp_lim = 5660, inner_att = 6955, outer_att = 6955, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280505,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211405,
        args = [],
        exp = 16416
    };
get(301601) ->
    #mon{
        mid = 301601,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 279851, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1881
    };
get(301602) ->
    #mon{
        mid = 301602,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 223880, mp_lim = 6743, inner_att = 1272, outer_att = 1272, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1881
    };
get(301603) ->
    #mon{
        mid = 301603,
        name = <<"小熊">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 279851, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301604) ->
    #mon{
        mid = 301604,
        name = <<"鼓手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 279851, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301605) ->
    #mon{
        mid = 301605,
        name = <<"余毒">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1399255, mp_lim = 6743, inner_att = 4770, outer_att = 4770, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280206,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 19722
    };
get(301606) ->
    #mon{
        mid = 301606,
        name = <<"红熊王">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1791046, mp_lim = 6743, inner_att = 5565, outer_att = 5565, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280306,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211106,
        args = [],
        exp = 19722
    };
get(301607) ->
    #mon{
        mid = 301607,
        name = <<"葛荣">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1567165, mp_lim = 6743, inner_att = 7950, outer_att = 7950, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280406,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211406,
        args = [],
        exp = 19722
    };
get(301608) ->
    #mon{
        mid = 301608,
        name = <<"小熊">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 279851, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301609) ->
    #mon{
        mid = 301609,
        name = <<"鼓手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 279851, mp_lim = 6743, inner_att = 1590, outer_att = 1590, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301610) ->
    #mon{
        mid = 301610,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2014927, mp_lim = 6743, inner_att = 10335, outer_att = 10335, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280506,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211406,
        args = [],
        exp = 24624
    };
get(301701) ->
    #mon{
        mid = 301701,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 392015, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2838
    };
get(301702) ->
    #mon{
        mid = 301702,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 313612, mp_lim = 7825, inner_att = 1766, outer_att = 1766, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2838
    };
get(301703) ->
    #mon{
        mid = 301703,
        name = <<"小熊">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 392015, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301704) ->
    #mon{
        mid = 301704,
        name = <<"鼓手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 392015, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301705) ->
    #mon{
        mid = 301705,
        name = <<"余毒">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1960075, mp_lim = 7825, inner_att = 6624, outer_att = 6624, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280207,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 29756
    };
get(301706) ->
    #mon{
        mid = 301706,
        name = <<"红熊王">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2508896, mp_lim = 7825, inner_att = 7728, outer_att = 7728, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280307,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211107,
        args = [],
        exp = 29756
    };
get(301707) ->
    #mon{
        mid = 301707,
        name = <<"葛荣">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2195284, mp_lim = 7825, inner_att = 11040, outer_att = 11040, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280407,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211407,
        args = [],
        exp = 29756
    };
get(301708) ->
    #mon{
        mid = 301708,
        name = <<"小熊">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 392015, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301709) ->
    #mon{
        mid = 301709,
        name = <<"鼓手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 392015, mp_lim = 7825, inner_att = 2208, outer_att = 2208, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301710) ->
    #mon{
        mid = 301710,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2822508, mp_lim = 7825, inner_att = 14352, outer_att = 14352, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280507,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211407,
        args = [],
        exp = 37152
    };
get(301801) ->
    #mon{
        mid = 301801,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 509301, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5643
    };
get(301802) ->
    #mon{
        mid = 301802,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 407440, mp_lim = 8908, inner_att = 2278, outer_att = 2278, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5643
    };
get(301803) ->
    #mon{
        mid = 301803,
        name = <<"小熊">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 509301, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301804) ->
    #mon{
        mid = 301804,
        name = <<"鼓手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 509301, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301805) ->
    #mon{
        mid = 301805,
        name = <<"余毒">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2546505, mp_lim = 8908, inner_att = 8544, outer_att = 8544, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280208,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 59166
    };
get(301806) ->
    #mon{
        mid = 301806,
        name = <<"红熊王">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3259526, mp_lim = 8908, inner_att = 9968, outer_att = 9968, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280308,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211108,
        args = [],
        exp = 59166
    };
get(301807) ->
    #mon{
        mid = 301807,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2852085, mp_lim = 8908, inner_att = 14240, outer_att = 14240, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280408,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211408,
        args = [],
        exp = 59166
    };
get(301808) ->
    #mon{
        mid = 301808,
        name = <<"小熊">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 509301, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301809) ->
    #mon{
        mid = 301809,
        name = <<"鼓手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 509301, mp_lim = 8908, inner_att = 2848, outer_att = 2848, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301810) ->
    #mon{
        mid = 301810,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3666967, mp_lim = 8908, inner_att = 18512, outer_att = 18512, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280508,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211408,
        args = [],
        exp = 73872
    };
get(301901) ->
    #mon{
        mid = 301901,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 637598, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 9009
    };
get(301902) ->
    #mon{
        mid = 301902,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 510078, mp_lim = 9990, inner_att = 2828, outer_att = 2828, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 9009
    };
get(301903) ->
    #mon{
        mid = 301903,
        name = <<"小熊">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 637598, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2112,
        args = [],
        exp = 0
    };
get(301904) ->
    #mon{
        mid = 301904,
        name = <<"鼓手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 637598, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2115,
        args = [],
        exp = 0
    };
get(301905) ->
    #mon{
        mid = 301905,
        name = <<"余毒">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3187990, mp_lim = 9990, inner_att = 10608, outer_att = 10608, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280209,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 94458
    };
get(301906) ->
    #mon{
        mid = 301906,
        name = <<"红熊王">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4080627, mp_lim = 9990, inner_att = 12376, outer_att = 12376, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280309,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 211109,
        args = [],
        exp = 94458
    };
get(301907) ->
    #mon{
        mid = 301907,
        name = <<"葛荣">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3570548, mp_lim = 9990, inner_att = 17680, outer_att = 17680, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280409,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211409,
        args = [],
        exp = 94458
    };
get(301908) ->
    #mon{
        mid = 301908,
        name = <<"小熊">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 637598, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(301909) ->
    #mon{
        mid = 301909,
        name = <<"鼓手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 637598, mp_lim = 9990, inner_att = 3536, outer_att = 3536, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2113,
        args = [],
        exp = 0
    };
get(301910) ->
    #mon{
        mid = 301910,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4590705, mp_lim = 9990, inner_att = 22984, outer_att = 22984, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280509,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 211409,
        args = [],
        exp = 117936
    };
get(302001) ->
    #mon{
        mid = 302001,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2845, mp_lim = 49, inner_att = 37, outer_att = 37, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302002) ->
    #mon{
        mid = 302002,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2173, mp_lim = 49, inner_att = 29, outer_att = 29, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302003) ->
    #mon{
        mid = 302003,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2173, mp_lim = 49, inner_att = 29, outer_att = 29, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302004) ->
    #mon{
        mid = 302004,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2173, mp_lim = 49, inner_att = 29, outer_att = 29, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302005) ->
    #mon{
        mid = 302005,
        name = <<"岳老三">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 14228, mp_lim = 49, inner_att = 112, outer_att = 112, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 510
    };
get(302006) ->
    #mon{
        mid = 302006,
        name = <<"叶二娘">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 14228, mp_lim = 49, inner_att = 112, outer_att = 112, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 510
    };
get(302007) ->
    #mon{
        mid = 302007,
        name = <<"云中鹤">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 14228, mp_lim = 49, inner_att = 112, outer_att = 112, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 510
    };
get(302008) ->
    #mon{
        mid = 302008,
        name = <<"段延庆">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 17074, mp_lim = 49, inner_att = 130, outer_att = 130, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281101,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 510
    };
get(302009) ->
    #mon{
        mid = 302009,
        name = <<"姚伯当">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2845, mp_lim = 49, inner_att = 37, outer_att = 37, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302010) ->
    #mon{
        mid = 302010,
        name = <<"司马林">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2845, mp_lim = 49, inner_att = 37, outer_att = 37, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 95
    };
get(302011) ->
    #mon{
        mid = 302011,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 17074, mp_lim = 49, inner_att = 130, outer_att = 130, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281201,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 510
    };
get(302012) ->
    #mon{
        mid = 302012,
        name = <<"包不同">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 14228, mp_lim = 49, inner_att = 112, outer_att = 112, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 510
    };
get(302013) ->
    #mon{
        mid = 302013,
        name = <<"风波恶">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 14228, mp_lim = 49, inner_att = 112, outer_att = 112, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 510
    };
get(302014) ->
    #mon{
        mid = 302014,
        name = <<"慕容复">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 20489, mp_lim = 49, inner_att = 187, outer_att = 187, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281301,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 1015
    };
get(302015) ->
    #mon{
        mid = 302015,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 24586, mp_lim = 49, inner_att = 243, outer_att = 243, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281501,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 1270
    };
get(302101) ->
    #mon{
        mid = 302101,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 16316, mp_lim = 1330, inner_att = 114, outer_att = 114, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302102) ->
    #mon{
        mid = 302102,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 12459, mp_lim = 1330, inner_att = 91, outer_att = 91, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302103) ->
    #mon{
        mid = 302103,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 12459, mp_lim = 1330, inner_att = 91, outer_att = 91, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302104) ->
    #mon{
        mid = 302104,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 12459, mp_lim = 1330, inner_att = 91, outer_att = 91, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302105) ->
    #mon{
        mid = 302105,
        name = <<"岳老三">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 81581, mp_lim = 1330, inner_att = 343, outer_att = 343, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1020
    };
get(302106) ->
    #mon{
        mid = 302106,
        name = <<"叶二娘">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 81581, mp_lim = 1330, inner_att = 343, outer_att = 343, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1020
    };
get(302107) ->
    #mon{
        mid = 302107,
        name = <<"云中鹤">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 81581, mp_lim = 1330, inner_att = 343, outer_att = 343, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1020
    };
get(302108) ->
    #mon{
        mid = 302108,
        name = <<"段延庆">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 97897, mp_lim = 1330, inner_att = 400, outer_att = 400, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281101,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 1020
    };
get(302109) ->
    #mon{
        mid = 302109,
        name = <<"姚伯当">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 16316, mp_lim = 1330, inner_att = 114, outer_att = 114, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302110) ->
    #mon{
        mid = 302110,
        name = <<"司马林">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 16316, mp_lim = 1330, inner_att = 114, outer_att = 114, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 190
    };
get(302111) ->
    #mon{
        mid = 302111,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 97897, mp_lim = 1330, inner_att = 400, outer_att = 400, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281201,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 1020
    };
get(302112) ->
    #mon{
        mid = 302112,
        name = <<"包不同">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 81581, mp_lim = 1330, inner_att = 343, outer_att = 343, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1020
    };
get(302113) ->
    #mon{
        mid = 302113,
        name = <<"风波恶">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 81581, mp_lim = 1330, inner_att = 343, outer_att = 343, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281001,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1020
    };
get(302114) ->
    #mon{
        mid = 302114,
        name = <<"慕容复">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 117477, mp_lim = 1330, inner_att = 572, outer_att = 572, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281301,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 2030
    };
get(302115) ->
    #mon{
        mid = 302115,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 140972, mp_lim = 1330, inner_att = 743, outer_att = 743, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281501,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 2540
    };
get(302201) ->
    #mon{
        mid = 302201,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 36064, mp_lim = 2413, inner_att = 226, outer_att = 226, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302202) ->
    #mon{
        mid = 302202,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 27540, mp_lim = 2413, inner_att = 181, outer_att = 181, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302203) ->
    #mon{
        mid = 302203,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 27540, mp_lim = 2413, inner_att = 181, outer_att = 181, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302204) ->
    #mon{
        mid = 302204,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 27540, mp_lim = 2413, inner_att = 181, outer_att = 181, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302205) ->
    #mon{
        mid = 302205,
        name = <<"岳老三">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 180323, mp_lim = 2413, inner_att = 679, outer_att = 679, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281002,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1530
    };
get(302206) ->
    #mon{
        mid = 302206,
        name = <<"叶二娘">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 180323, mp_lim = 2413, inner_att = 679, outer_att = 679, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281002,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1530
    };
get(302207) ->
    #mon{
        mid = 302207,
        name = <<"云中鹤">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 180323, mp_lim = 2413, inner_att = 679, outer_att = 679, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281002,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1530
    };
get(302208) ->
    #mon{
        mid = 302208,
        name = <<"段延庆">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 216387, mp_lim = 2413, inner_att = 793, outer_att = 793, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281102,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 1530
    };
get(302209) ->
    #mon{
        mid = 302209,
        name = <<"姚伯当">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 36064, mp_lim = 2413, inner_att = 226, outer_att = 226, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302210) ->
    #mon{
        mid = 302210,
        name = <<"司马林">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 36064, mp_lim = 2413, inner_att = 226, outer_att = 226, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 285
    };
get(302211) ->
    #mon{
        mid = 302211,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 216387, mp_lim = 2413, inner_att = 793, outer_att = 793, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281202,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 1530
    };
get(302212) ->
    #mon{
        mid = 302212,
        name = <<"包不同">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 180323, mp_lim = 2413, inner_att = 679, outer_att = 679, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281002,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1530
    };
get(302213) ->
    #mon{
        mid = 302213,
        name = <<"风波恶">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 180323, mp_lim = 2413, inner_att = 679, outer_att = 679, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281002,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1530
    };
get(302214) ->
    #mon{
        mid = 302214,
        name = <<"慕容复">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 259665, mp_lim = 2413, inner_att = 1133, outer_att = 1133, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281302,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 3045
    };
get(302215) ->
    #mon{
        mid = 302215,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 311598, mp_lim = 2413, inner_att = 1472, outer_att = 1472, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281502,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 3810
    };
get(302301) ->
    #mon{
        mid = 302301,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 68654, mp_lim = 3495, inner_att = 411, outer_att = 411, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302302) ->
    #mon{
        mid = 302302,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 52426, mp_lim = 3495, inner_att = 329, outer_att = 329, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302303) ->
    #mon{
        mid = 302303,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 52426, mp_lim = 3495, inner_att = 329, outer_att = 329, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302304) ->
    #mon{
        mid = 302304,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 52426, mp_lim = 3495, inner_att = 329, outer_att = 329, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302305) ->
    #mon{
        mid = 302305,
        name = <<"岳老三">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 343271, mp_lim = 3495, inner_att = 1234, outer_att = 1234, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281003,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2244
    };
get(302306) ->
    #mon{
        mid = 302306,
        name = <<"叶二娘">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 343271, mp_lim = 3495, inner_att = 1234, outer_att = 1234, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281003,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2244
    };
get(302307) ->
    #mon{
        mid = 302307,
        name = <<"云中鹤">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 343271, mp_lim = 3495, inner_att = 1234, outer_att = 1234, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281003,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2244
    };
get(302308) ->
    #mon{
        mid = 302308,
        name = <<"段延庆">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 411925, mp_lim = 3495, inner_att = 1439, outer_att = 1439, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281103,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 2244
    };
get(302309) ->
    #mon{
        mid = 302309,
        name = <<"姚伯当">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 68654, mp_lim = 3495, inner_att = 411, outer_att = 411, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302310) ->
    #mon{
        mid = 302310,
        name = <<"司马林">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 68654, mp_lim = 3495, inner_att = 411, outer_att = 411, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 418
    };
get(302311) ->
    #mon{
        mid = 302311,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 411925, mp_lim = 3495, inner_att = 1439, outer_att = 1439, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281203,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 2244
    };
get(302312) ->
    #mon{
        mid = 302312,
        name = <<"包不同">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 343271, mp_lim = 3495, inner_att = 1234, outer_att = 1234, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281003,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2244
    };
get(302313) ->
    #mon{
        mid = 302313,
        name = <<"风波恶">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 343271, mp_lim = 3495, inner_att = 1234, outer_att = 1234, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281003,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2244
    };
get(302314) ->
    #mon{
        mid = 302314,
        name = <<"慕容复">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 494310, mp_lim = 3495, inner_att = 2057, outer_att = 2057, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281303,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 4466
    };
get(302315) ->
    #mon{
        mid = 302315,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 593173, mp_lim = 3495, inner_att = 2674, outer_att = 2674, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281503,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 5588
    };
get(302401) ->
    #mon{
        mid = 302401,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 122365, mp_lim = 4578, inner_att = 715, outer_att = 715, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302402) ->
    #mon{
        mid = 302402,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 93442, mp_lim = 4578, inner_att = 572, outer_att = 572, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302403) ->
    #mon{
        mid = 302403,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 93442, mp_lim = 4578, inner_att = 572, outer_att = 572, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302404) ->
    #mon{
        mid = 302404,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 93442, mp_lim = 4578, inner_att = 572, outer_att = 572, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302405) ->
    #mon{
        mid = 302405,
        name = <<"岳老三">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 611825, mp_lim = 4578, inner_att = 2145, outer_att = 2145, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281004,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2958
    };
get(302406) ->
    #mon{
        mid = 302406,
        name = <<"叶二娘">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 611825, mp_lim = 4578, inner_att = 2145, outer_att = 2145, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281004,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2958
    };
get(302407) ->
    #mon{
        mid = 302407,
        name = <<"云中鹤">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 611825, mp_lim = 4578, inner_att = 2145, outer_att = 2145, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281004,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2958
    };
get(302408) ->
    #mon{
        mid = 302408,
        name = <<"段延庆">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 734190, mp_lim = 4578, inner_att = 2502, outer_att = 2502, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281104,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 2958
    };
get(302409) ->
    #mon{
        mid = 302409,
        name = <<"姚伯当">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 122365, mp_lim = 4578, inner_att = 715, outer_att = 715, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302410) ->
    #mon{
        mid = 302410,
        name = <<"司马林">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 122365, mp_lim = 4578, inner_att = 715, outer_att = 715, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 551
    };
get(302411) ->
    #mon{
        mid = 302411,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 734190, mp_lim = 4578, inner_att = 2502, outer_att = 2502, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281204,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 2958
    };
get(302412) ->
    #mon{
        mid = 302412,
        name = <<"包不同">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 611825, mp_lim = 4578, inner_att = 2145, outer_att = 2145, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281004,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2958
    };
get(302413) ->
    #mon{
        mid = 302413,
        name = <<"风波恶">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 611825, mp_lim = 4578, inner_att = 2145, outer_att = 2145, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281004,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2958
    };
get(302414) ->
    #mon{
        mid = 302414,
        name = <<"慕容复">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 881028, mp_lim = 4578, inner_att = 3575, outer_att = 3575, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281304,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 5887
    };
get(302415) ->
    #mon{
        mid = 302415,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1057234, mp_lim = 4578, inner_att = 4647, outer_att = 4647, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281504,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 7366
    };
get(302501) ->
    #mon{
        mid = 302501,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 204890, mp_lim = 5660, inner_att = 1177, outer_att = 1177, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302502) ->
    #mon{
        mid = 302502,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 156461, mp_lim = 5660, inner_att = 941, outer_att = 941, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302503) ->
    #mon{
        mid = 302503,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 156461, mp_lim = 5660, inner_att = 941, outer_att = 941, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302504) ->
    #mon{
        mid = 302504,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 156461, mp_lim = 5660, inner_att = 941, outer_att = 941, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302505) ->
    #mon{
        mid = 302505,
        name = <<"岳老三">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 1024452, mp_lim = 5660, inner_att = 3531, outer_att = 3531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281005,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3876
    };
get(302506) ->
    #mon{
        mid = 302506,
        name = <<"叶二娘">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 1024452, mp_lim = 5660, inner_att = 3531, outer_att = 3531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281005,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3876
    };
get(302507) ->
    #mon{
        mid = 302507,
        name = <<"云中鹤">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 1024452, mp_lim = 5660, inner_att = 3531, outer_att = 3531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281005,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3876
    };
get(302508) ->
    #mon{
        mid = 302508,
        name = <<"段延庆">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1229342, mp_lim = 5660, inner_att = 4119, outer_att = 4119, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281105,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 3876
    };
get(302509) ->
    #mon{
        mid = 302509,
        name = <<"姚伯当">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 204890, mp_lim = 5660, inner_att = 1177, outer_att = 1177, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302510) ->
    #mon{
        mid = 302510,
        name = <<"司马林">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 204890, mp_lim = 5660, inner_att = 1177, outer_att = 1177, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 722
    };
get(302511) ->
    #mon{
        mid = 302511,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1229342, mp_lim = 5660, inner_att = 4119, outer_att = 4119, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281205,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 3876
    };
get(302512) ->
    #mon{
        mid = 302512,
        name = <<"包不同">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 1024452, mp_lim = 5660, inner_att = 3531, outer_att = 3531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281005,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3876
    };
get(302513) ->
    #mon{
        mid = 302513,
        name = <<"风波恶">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 1024452, mp_lim = 5660, inner_att = 3531, outer_att = 3531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281005,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3876
    };
get(302514) ->
    #mon{
        mid = 302514,
        name = <<"慕容复">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1475210, mp_lim = 5660, inner_att = 5885, outer_att = 5885, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281305,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 7714
    };
get(302515) ->
    #mon{
        mid = 302515,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1770253, mp_lim = 5660, inner_att = 7650, outer_att = 7650, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281505,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 9652
    };
get(302601) ->
    #mon{
        mid = 302601,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 307836, mp_lim = 6743, inner_att = 1749, outer_att = 1749, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302602) ->
    #mon{
        mid = 302602,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 235074, mp_lim = 6743, inner_att = 1399, outer_att = 1399, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302603) ->
    #mon{
        mid = 302603,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 235074, mp_lim = 6743, inner_att = 1399, outer_att = 1399, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302604) ->
    #mon{
        mid = 302604,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 235074, mp_lim = 6743, inner_att = 1399, outer_att = 1399, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302605) ->
    #mon{
        mid = 302605,
        name = <<"岳老三">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 1539180, mp_lim = 6743, inner_att = 5247, outer_att = 5247, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281006,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5814
    };
get(302606) ->
    #mon{
        mid = 302606,
        name = <<"叶二娘">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 1539180, mp_lim = 6743, inner_att = 5247, outer_att = 5247, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281006,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5814
    };
get(302607) ->
    #mon{
        mid = 302607,
        name = <<"云中鹤">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 1539180, mp_lim = 6743, inner_att = 5247, outer_att = 5247, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281006,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5814
    };
get(302608) ->
    #mon{
        mid = 302608,
        name = <<"段延庆">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1847016, mp_lim = 6743, inner_att = 6121, outer_att = 6121, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281106,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 5814
    };
get(302609) ->
    #mon{
        mid = 302609,
        name = <<"姚伯当">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 307836, mp_lim = 6743, inner_att = 1749, outer_att = 1749, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302610) ->
    #mon{
        mid = 302610,
        name = <<"司马林">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 307836, mp_lim = 6743, inner_att = 1749, outer_att = 1749, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1083
    };
get(302611) ->
    #mon{
        mid = 302611,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1847016, mp_lim = 6743, inner_att = 6121, outer_att = 6121, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281206,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 5814
    };
get(302612) ->
    #mon{
        mid = 302612,
        name = <<"包不同">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 1539180, mp_lim = 6743, inner_att = 5247, outer_att = 5247, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281006,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5814
    };
get(302613) ->
    #mon{
        mid = 302613,
        name = <<"风波恶">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 1539180, mp_lim = 6743, inner_att = 5247, outer_att = 5247, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281006,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5814
    };
get(302614) ->
    #mon{
        mid = 302614,
        name = <<"慕容复">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2216419, mp_lim = 6743, inner_att = 8745, outer_att = 8745, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281306,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 11571
    };
get(302615) ->
    #mon{
        mid = 302615,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2659703, mp_lim = 6743, inner_att = 11368, outer_att = 11368, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281506,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 14478
    };
get(302701) ->
    #mon{
        mid = 302701,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 431216, mp_lim = 7825, inner_att = 2428, outer_att = 2428, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302702) ->
    #mon{
        mid = 302702,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 329292, mp_lim = 7825, inner_att = 1943, outer_att = 1943, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302703) ->
    #mon{
        mid = 302703,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 329292, mp_lim = 7825, inner_att = 1943, outer_att = 1943, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302704) ->
    #mon{
        mid = 302704,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 329292, mp_lim = 7825, inner_att = 1943, outer_att = 1943, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302705) ->
    #mon{
        mid = 302705,
        name = <<"岳老三">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 2156082, mp_lim = 7825, inner_att = 7286, outer_att = 7286, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281007,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 8772
    };
get(302706) ->
    #mon{
        mid = 302706,
        name = <<"叶二娘">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 2156082, mp_lim = 7825, inner_att = 7286, outer_att = 7286, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281007,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 8772
    };
get(302707) ->
    #mon{
        mid = 302707,
        name = <<"云中鹤">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 2156082, mp_lim = 7825, inner_att = 7286, outer_att = 7286, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281007,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 8772
    };
get(302708) ->
    #mon{
        mid = 302708,
        name = <<"段延庆">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2587299, mp_lim = 7825, inner_att = 8500, outer_att = 8500, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281107,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 8772
    };
get(302709) ->
    #mon{
        mid = 302709,
        name = <<"姚伯当">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 431216, mp_lim = 7825, inner_att = 2428, outer_att = 2428, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302710) ->
    #mon{
        mid = 302710,
        name = <<"司马林">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 431216, mp_lim = 7825, inner_att = 2428, outer_att = 2428, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1634
    };
get(302711) ->
    #mon{
        mid = 302711,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2587299, mp_lim = 7825, inner_att = 8500, outer_att = 8500, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281207,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 8772
    };
get(302712) ->
    #mon{
        mid = 302712,
        name = <<"包不同">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 2156082, mp_lim = 7825, inner_att = 7286, outer_att = 7286, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281007,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 8772
    };
get(302713) ->
    #mon{
        mid = 302713,
        name = <<"风波恶">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 2156082, mp_lim = 7825, inner_att = 7286, outer_att = 7286, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281007,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 8772
    };
get(302714) ->
    #mon{
        mid = 302714,
        name = <<"慕容复">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3104758, mp_lim = 7825, inner_att = 12144, outer_att = 12144, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281307,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 17458
    };
get(302715) ->
    #mon{
        mid = 302715,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3725710, mp_lim = 7825, inner_att = 15787, outer_att = 15787, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281507,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 21844
    };
get(302801) ->
    #mon{
        mid = 302801,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 560231, mp_lim = 8908, inner_att = 3132, outer_att = 3132, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302802) ->
    #mon{
        mid = 302802,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 427812, mp_lim = 8908, inner_att = 2506, outer_att = 2506, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302803) ->
    #mon{
        mid = 302803,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 427812, mp_lim = 8908, inner_att = 2506, outer_att = 2506, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302804) ->
    #mon{
        mid = 302804,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 427812, mp_lim = 8908, inner_att = 2506, outer_att = 2506, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302805) ->
    #mon{
        mid = 302805,
        name = <<"岳老三">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 2801155, mp_lim = 8908, inner_att = 9398, outer_att = 9398, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281008,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 17442
    };
get(302806) ->
    #mon{
        mid = 302806,
        name = <<"叶二娘">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 2801155, mp_lim = 8908, inner_att = 9398, outer_att = 9398, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281008,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 17442
    };
get(302807) ->
    #mon{
        mid = 302807,
        name = <<"云中鹤">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 2801155, mp_lim = 8908, inner_att = 9398, outer_att = 9398, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281008,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 17442
    };
get(302808) ->
    #mon{
        mid = 302808,
        name = <<"段延庆">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3361386, mp_lim = 8908, inner_att = 10964, outer_att = 10964, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281108,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 17442
    };
get(302809) ->
    #mon{
        mid = 302809,
        name = <<"姚伯当">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 560231, mp_lim = 8908, inner_att = 3132, outer_att = 3132, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302810) ->
    #mon{
        mid = 302810,
        name = <<"司马林">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 560231, mp_lim = 8908, inner_att = 3132, outer_att = 3132, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3249
    };
get(302811) ->
    #mon{
        mid = 302811,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3361386, mp_lim = 8908, inner_att = 10964, outer_att = 10964, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281208,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 17442
    };
get(302812) ->
    #mon{
        mid = 302812,
        name = <<"包不同">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 2801155, mp_lim = 8908, inner_att = 9398, outer_att = 9398, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281008,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 17442
    };
get(302813) ->
    #mon{
        mid = 302813,
        name = <<"风波恶">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 2801155, mp_lim = 8908, inner_att = 9398, outer_att = 9398, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281008,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 17442
    };
get(302814) ->
    #mon{
        mid = 302814,
        name = <<"慕容复">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4033663, mp_lim = 8908, inner_att = 15664, outer_att = 15664, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281308,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 34713
    };
get(302815) ->
    #mon{
        mid = 302815,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4840396, mp_lim = 8908, inner_att = 20363, outer_att = 20363, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281508,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 43434
    };
get(302901) ->
    #mon{
        mid = 302901,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 701357, mp_lim = 9990, inner_att = 3889, outer_att = 3889, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302902) ->
    #mon{
        mid = 302902,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 535582, mp_lim = 9990, inner_att = 3111, outer_att = 3111, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302903) ->
    #mon{
        mid = 302903,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 535582, mp_lim = 9990, inner_att = 3111, outer_att = 3111, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302904) ->
    #mon{
        mid = 302904,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 535582, mp_lim = 9990, inner_att = 3111, outer_att = 3111, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302905) ->
    #mon{
        mid = 302905,
        name = <<"岳老三">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 3506789, mp_lim = 9990, inner_att = 11668, outer_att = 11668, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281009,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,4},{20023102,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27846
    };
get(302906) ->
    #mon{
        mid = 302906,
        name = <<"叶二娘">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 3506789, mp_lim = 9990, inner_att = 11668, outer_att = 11668, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281009,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,4},{20023202,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27846
    };
get(302907) ->
    #mon{
        mid = 302907,
        name = <<"云中鹤">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 3506789, mp_lim = 9990, inner_att = 11668, outer_att = 11668, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281009,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,4},{20023302,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27846
    };
get(302908) ->
    #mon{
        mid = 302908,
        name = <<"段延庆">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4208146, mp_lim = 9990, inner_att = 13613, outer_att = 13613, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281109,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2121,
        args = [],
        exp = 27846
    };
get(302909) ->
    #mon{
        mid = 302909,
        name = <<"姚伯当">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 701357, mp_lim = 9990, inner_att = 3889, outer_att = 3889, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302910) ->
    #mon{
        mid = 302910,
        name = <<"司马林">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 701357, mp_lim = 9990, inner_att = 3889, outer_att = 3889, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5187
    };
get(302911) ->
    #mon{
        mid = 302911,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4208146, mp_lim = 9990, inner_att = 13613, outer_att = 13613, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281209,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2122,
        args = [],
        exp = 27846
    };
get(302912) ->
    #mon{
        mid = 302912,
        name = <<"包不同">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 3506789, mp_lim = 9990, inner_att = 11668, outer_att = 11668, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281009,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27846
    };
get(302913) ->
    #mon{
        mid = 302913,
        name = <<"风波恶">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 3506789, mp_lim = 9990, inner_att = 11668, outer_att = 11668, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281009,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27846
    };
get(302914) ->
    #mon{
        mid = 302914,
        name = <<"慕容复">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 5049776, mp_lim = 9990, inner_att = 19448, outer_att = 19448, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281309,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 55419
    };
get(302915) ->
    #mon{
        mid = 302915,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 6059731, mp_lim = 9990, inner_att = 25282, outer_att = 25282, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281509,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2123,
        args = [],
        exp = 69342
    };
get(303001) ->
    #mon{
        mid = 303001,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 3130, mp_lim = 49, inner_att = 41, outer_att = 41, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 905
    };
get(303002) ->
    #mon{
        mid = 303002,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2390, mp_lim = 49, inner_att = 32, outer_att = 32, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 175
    };
get(303003) ->
    #mon{
        mid = 303003,
        name = <<"闵墨">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 15651, mp_lim = 49, inner_att = 123, outer_att = 123, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282001,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 1800
    };
get(303004) ->
    #mon{
        mid = 303004,
        name = <<"秦韵">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 18781, mp_lim = 49, inner_att = 143, outer_att = 143, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282101,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 1800
    };
get(303005) ->
    #mon{
        mid = 303005,
        name = <<"陶青">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 22537, mp_lim = 49, inner_att = 205, outer_att = 205, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282201,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 2134,
        args = [],
        exp = 1800
    };
get(303006) ->
    #mon{
        mid = 303006,
        name = <<"庞企">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 27045, mp_lim = 49, inner_att = 257, outer_att = 257, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282301,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 2131,
        args = [],
        exp = 1800
    };
get(303007) ->
    #mon{
        mid = 303007,
        name = <<"青鹰">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2390, mp_lim = 49, inner_att = 32, outer_att = 32, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303008) ->
    #mon{
        mid = 303008,
        name = <<"墨虎">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 3130, mp_lim = 49, inner_att = 41, outer_att = 41, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303009) ->
    #mon{
        mid = 303009,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 3130, mp_lim = 49, inner_att = 41, outer_att = 41, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303010) ->
    #mon{
        mid = 303010,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 32454, mp_lim = 49, inner_att = 334, outer_att = 334, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282501,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 2131,
        args = [],
        exp = 2700
    };
get(303101) ->
    #mon{
        mid = 303101,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 17947, mp_lim = 1330, inner_att = 125, outer_att = 125, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1810
    };
get(303102) ->
    #mon{
        mid = 303102,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 13705, mp_lim = 1330, inner_att = 100, outer_att = 100, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 350
    };
get(303103) ->
    #mon{
        mid = 303103,
        name = <<"闵墨">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 89739, mp_lim = 1330, inner_att = 377, outer_att = 377, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282001,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 3600
    };
get(303104) ->
    #mon{
        mid = 303104,
        name = <<"秦韵">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 107687, mp_lim = 1330, inner_att = 440, outer_att = 440, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282101,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 3600
    };
get(303105) ->
    #mon{
        mid = 303105,
        name = <<"陶青">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 129225, mp_lim = 1330, inner_att = 629, outer_att = 629, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282201,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213401,
        args = [],
        exp = 3600
    };
get(303106) ->
    #mon{
        mid = 303106,
        name = <<"庞企">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 155070, mp_lim = 1330, inner_att = 786, outer_att = 786, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282301,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213101,
        args = [],
        exp = 3600
    };
get(303107) ->
    #mon{
        mid = 303107,
        name = <<"青鹰">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 13705, mp_lim = 1330, inner_att = 100, outer_att = 100, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303108) ->
    #mon{
        mid = 303108,
        name = <<"墨虎">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 17947, mp_lim = 1330, inner_att = 125, outer_att = 125, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303109) ->
    #mon{
        mid = 303109,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 17947, mp_lim = 1330, inner_att = 125, outer_att = 125, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303110) ->
    #mon{
        mid = 303110,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 186084, mp_lim = 1330, inner_att = 1022, outer_att = 1022, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282501,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213101,
        args = [],
        exp = 5400
    };
get(303201) ->
    #mon{
        mid = 303201,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 39671, mp_lim = 2413, inner_att = 249, outer_att = 249, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2715
    };
get(303202) ->
    #mon{
        mid = 303202,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 30294, mp_lim = 2413, inner_att = 199, outer_att = 199, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 525
    };
get(303203) ->
    #mon{
        mid = 303203,
        name = <<"闵墨">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 198355, mp_lim = 2413, inner_att = 747, outer_att = 747, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282002,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 5400
    };
get(303204) ->
    #mon{
        mid = 303204,
        name = <<"秦韵">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 238026, mp_lim = 2413, inner_att = 872, outer_att = 872, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282102,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 5400
    };
get(303205) ->
    #mon{
        mid = 303205,
        name = <<"陶青">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 285631, mp_lim = 2413, inner_att = 1246, outer_att = 1246, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282202,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213402,
        args = [],
        exp = 5400
    };
get(303206) ->
    #mon{
        mid = 303206,
        name = <<"庞企">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 342757, mp_lim = 2413, inner_att = 1557, outer_att = 1557, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282302,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213102,
        args = [],
        exp = 5400
    };
get(303207) ->
    #mon{
        mid = 303207,
        name = <<"青鹰">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 30294, mp_lim = 2413, inner_att = 199, outer_att = 199, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303208) ->
    #mon{
        mid = 303208,
        name = <<"墨虎">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 39671, mp_lim = 2413, inner_att = 249, outer_att = 249, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303209) ->
    #mon{
        mid = 303209,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 39671, mp_lim = 2413, inner_att = 249, outer_att = 249, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303210) ->
    #mon{
        mid = 303210,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 411309, mp_lim = 2413, inner_att = 2025, outer_att = 2025, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282502,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213102,
        args = [],
        exp = 8100
    };
get(303301) ->
    #mon{
        mid = 303301,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 75519, mp_lim = 3495, inner_att = 452, outer_att = 452, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3982
    };
get(303302) ->
    #mon{
        mid = 303302,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 57669, mp_lim = 3495, inner_att = 362, outer_att = 362, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 770
    };
get(303303) ->
    #mon{
        mid = 303303,
        name = <<"闵墨">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 377598, mp_lim = 3495, inner_att = 1357, outer_att = 1357, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282003,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 7920
    };
get(303304) ->
    #mon{
        mid = 303304,
        name = <<"秦韵">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 453118, mp_lim = 3495, inner_att = 1583, outer_att = 1583, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282103,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 7920
    };
get(303305) ->
    #mon{
        mid = 303305,
        name = <<"陶青">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 543742, mp_lim = 3495, inner_att = 2262, outer_att = 2262, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282203,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213403,
        args = [],
        exp = 7920
    };
get(303306) ->
    #mon{
        mid = 303306,
        name = <<"庞企">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 652490, mp_lim = 3495, inner_att = 2828, outer_att = 2828, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282303,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213103,
        args = [],
        exp = 7920
    };
get(303307) ->
    #mon{
        mid = 303307,
        name = <<"青鹰">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 57669, mp_lim = 3495, inner_att = 362, outer_att = 362, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303308) ->
    #mon{
        mid = 303308,
        name = <<"墨虎">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 75519, mp_lim = 3495, inner_att = 452, outer_att = 452, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303309) ->
    #mon{
        mid = 303309,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 75519, mp_lim = 3495, inner_att = 452, outer_att = 452, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303310) ->
    #mon{
        mid = 303310,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 782988, mp_lim = 3495, inner_att = 3676, outer_att = 3676, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282503,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213103,
        args = [],
        exp = 11880
    };
get(303401) ->
    #mon{
        mid = 303401,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 134601, mp_lim = 4578, inner_att = 786, outer_att = 786, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5249
    };
get(303402) ->
    #mon{
        mid = 303402,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 102786, mp_lim = 4578, inner_att = 629, outer_att = 629, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1015
    };
get(303403) ->
    #mon{
        mid = 303403,
        name = <<"闵墨">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 673008, mp_lim = 4578, inner_att = 2359, outer_att = 2359, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282004,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 10440
    };
get(303404) ->
    #mon{
        mid = 303404,
        name = <<"秦韵">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 807609, mp_lim = 4578, inner_att = 2752, outer_att = 2752, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282104,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 10440
    };
get(303405) ->
    #mon{
        mid = 303405,
        name = <<"陶青">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 969131, mp_lim = 4578, inner_att = 3932, outer_att = 3932, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282204,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213404,
        args = [],
        exp = 10440
    };
get(303406) ->
    #mon{
        mid = 303406,
        name = <<"庞企">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1162957, mp_lim = 4578, inner_att = 4915, outer_att = 4915, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282304,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213104,
        args = [],
        exp = 10440
    };
get(303407) ->
    #mon{
        mid = 303407,
        name = <<"青鹰">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 102786, mp_lim = 4578, inner_att = 629, outer_att = 629, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303408) ->
    #mon{
        mid = 303408,
        name = <<"墨虎">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 134601, mp_lim = 4578, inner_att = 786, outer_att = 786, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303409) ->
    #mon{
        mid = 303409,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 134601, mp_lim = 4578, inner_att = 786, outer_att = 786, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303410) ->
    #mon{
        mid = 303410,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1395549, mp_lim = 4578, inner_att = 6390, outer_att = 6390, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282504,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213104,
        args = [],
        exp = 15660
    };
get(303501) ->
    #mon{
        mid = 303501,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 225379, mp_lim = 5660, inner_att = 1294, outer_att = 1294, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 6878
    };
get(303502) ->
    #mon{
        mid = 303502,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 172107, mp_lim = 5660, inner_att = 1035, outer_att = 1035, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1330
    };
get(303503) ->
    #mon{
        mid = 303503,
        name = <<"闵墨">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1126897, mp_lim = 5660, inner_att = 3884, outer_att = 3884, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282005,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 13680
    };
get(303504) ->
    #mon{
        mid = 303504,
        name = <<"秦韵">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1352276, mp_lim = 5660, inner_att = 4531, outer_att = 4531, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282105,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 13680
    };
get(303505) ->
    #mon{
        mid = 303505,
        name = <<"陶青">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1622731, mp_lim = 5660, inner_att = 6473, outer_att = 6473, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282205,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213405,
        args = [],
        exp = 13680
    };
get(303506) ->
    #mon{
        mid = 303506,
        name = <<"庞企">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1947278, mp_lim = 5660, inner_att = 8091, outer_att = 8091, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282305,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213105,
        args = [],
        exp = 13680
    };
get(303507) ->
    #mon{
        mid = 303507,
        name = <<"青鹰">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 172107, mp_lim = 5660, inner_att = 1035, outer_att = 1035, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303508) ->
    #mon{
        mid = 303508,
        name = <<"墨虎">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 225379, mp_lim = 5660, inner_att = 1294, outer_att = 1294, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303509) ->
    #mon{
        mid = 303509,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 225379, mp_lim = 5660, inner_att = 1294, outer_att = 1294, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303510) ->
    #mon{
        mid = 303510,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 2336734, mp_lim = 5660, inner_att = 10519, outer_att = 10519, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282505,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213105,
        args = [],
        exp = 20520
    };
get(303601) ->
    #mon{
        mid = 303601,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 338619, mp_lim = 6743, inner_att = 1923, outer_att = 1923, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 10317
    };
get(303602) ->
    #mon{
        mid = 303602,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 258582, mp_lim = 6743, inner_att = 1539, outer_att = 1539, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 1995
    };
get(303603) ->
    #mon{
        mid = 303603,
        name = <<"闵墨">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1693098, mp_lim = 6743, inner_att = 5771, outer_att = 5771, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282006,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 20520
    };
get(303604) ->
    #mon{
        mid = 303604,
        name = <<"秦韵">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2031718, mp_lim = 6743, inner_att = 6733, outer_att = 6733, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282106,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 20520
    };
get(303605) ->
    #mon{
        mid = 303605,
        name = <<"陶青">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2438061, mp_lim = 6743, inner_att = 9619, outer_att = 9619, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282206,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213406,
        args = [],
        exp = 20520
    };
get(303606) ->
    #mon{
        mid = 303606,
        name = <<"庞企">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2925674, mp_lim = 6743, inner_att = 12024, outer_att = 12024, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282306,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213106,
        args = [],
        exp = 20520
    };
get(303607) ->
    #mon{
        mid = 303607,
        name = <<"青鹰">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 258582, mp_lim = 6743, inner_att = 1539, outer_att = 1539, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303608) ->
    #mon{
        mid = 303608,
        name = <<"墨虎">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 338619, mp_lim = 6743, inner_att = 1923, outer_att = 1923, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303609) ->
    #mon{
        mid = 303609,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 338619, mp_lim = 6743, inner_att = 1923, outer_att = 1923, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303610) ->
    #mon{
        mid = 303610,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 3510809, mp_lim = 6743, inner_att = 15631, outer_att = 15631, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282506,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213106,
        args = [],
        exp = 30780
    };
get(303701) ->
    #mon{
        mid = 303701,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 474338, mp_lim = 7825, inner_att = 2671, outer_att = 2671, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 15566
    };
get(303702) ->
    #mon{
        mid = 303702,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 362221, mp_lim = 7825, inner_att = 2137, outer_att = 2137, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 3010
    };
get(303703) ->
    #mon{
        mid = 303703,
        name = <<"闵墨">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2371690, mp_lim = 7825, inner_att = 8015, outer_att = 8015, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282007,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 30960
    };
get(303704) ->
    #mon{
        mid = 303704,
        name = <<"秦韵">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2846028, mp_lim = 7825, inner_att = 9350, outer_att = 9350, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282107,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 30960
    };
get(303705) ->
    #mon{
        mid = 303705,
        name = <<"陶青">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3415234, mp_lim = 7825, inner_att = 13358, outer_att = 13358, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282207,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213407,
        args = [],
        exp = 30960
    };
get(303706) ->
    #mon{
        mid = 303706,
        name = <<"庞企">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 4098281, mp_lim = 7825, inner_att = 16698, outer_att = 16698, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282307,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213107,
        args = [],
        exp = 30960
    };
get(303707) ->
    #mon{
        mid = 303707,
        name = <<"青鹰">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 362221, mp_lim = 7825, inner_att = 2137, outer_att = 2137, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303708) ->
    #mon{
        mid = 303708,
        name = <<"墨虎">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 474338, mp_lim = 7825, inner_att = 2671, outer_att = 2671, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303709) ->
    #mon{
        mid = 303709,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 474338, mp_lim = 7825, inner_att = 2671, outer_att = 2671, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303710) ->
    #mon{
        mid = 303710,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 4917937, mp_lim = 7825, inner_att = 21707, outer_att = 21707, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282507,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213107,
        args = [],
        exp = 46440
    };
get(303801) ->
    #mon{
        mid = 303801,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 616254, mp_lim = 8908, inner_att = 3446, outer_att = 3446, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 30951
    };
get(303802) ->
    #mon{
        mid = 303802,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 470594, mp_lim = 8908, inner_att = 2756, outer_att = 2756, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 5985
    };
get(303803) ->
    #mon{
        mid = 303803,
        name = <<"闵墨">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3081271, mp_lim = 8908, inner_att = 10338, outer_att = 10338, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282008,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 61560
    };
get(303804) ->
    #mon{
        mid = 303804,
        name = <<"秦韵">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3697525, mp_lim = 8908, inner_att = 12061, outer_att = 12061, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282108,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 61560
    };
get(303805) ->
    #mon{
        mid = 303805,
        name = <<"陶青">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4437030, mp_lim = 8908, inner_att = 17230, outer_att = 17230, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282208,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213408,
        args = [],
        exp = 61560
    };
get(303806) ->
    #mon{
        mid = 303806,
        name = <<"庞企">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 5324436, mp_lim = 8908, inner_att = 21538, outer_att = 21538, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282308,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213108,
        args = [],
        exp = 61560
    };
get(303807) ->
    #mon{
        mid = 303807,
        name = <<"青鹰">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 470594, mp_lim = 8908, inner_att = 2756, outer_att = 2756, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303808) ->
    #mon{
        mid = 303808,
        name = <<"墨虎">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 616254, mp_lim = 8908, inner_att = 3446, outer_att = 3446, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303809) ->
    #mon{
        mid = 303809,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 616254, mp_lim = 8908, inner_att = 3446, outer_att = 3446, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303810) ->
    #mon{
        mid = 303810,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 6389323, mp_lim = 8908, inner_att = 27999, outer_att = 27999, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282508,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213108,
        args = [],
        exp = 92340
    };
get(303901) ->
    #mon{
        mid = 303901,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 771493, mp_lim = 9990, inner_att = 4278, outer_att = 4278, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 49413
    };
get(303902) ->
    #mon{
        mid = 303902,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 589140, mp_lim = 9990, inner_att = 3422, outer_att = 3422, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 9555
    };
get(303903) ->
    #mon{
        mid = 303903,
        name = <<"闵墨">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3857467, mp_lim = 9990, inner_att = 12835, outer_att = 12835, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282009,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2132,
        args = [],
        exp = 98280
    };
get(303904) ->
    #mon{
        mid = 303904,
        name = <<"秦韵">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4628961, mp_lim = 9990, inner_att = 14974, outer_att = 14974, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282109,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2133,
        args = [],
        exp = 98280
    };
get(303905) ->
    #mon{
        mid = 303905,
        name = <<"陶青">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 5554753, mp_lim = 9990, inner_att = 21392, outer_att = 21392, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282209,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 213409,
        args = [],
        exp = 98280
    };
get(303906) ->
    #mon{
        mid = 303906,
        name = <<"庞企">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 6665704, mp_lim = 9990, inner_att = 26741, outer_att = 26741, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282309,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213109,
        args = [],
        exp = 98280
    };
get(303907) ->
    #mon{
        mid = 303907,
        name = <<"青鹰">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 589140, mp_lim = 9990, inner_att = 3422, outer_att = 3422, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303908) ->
    #mon{
        mid = 303908,
        name = <<"墨虎">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 771493, mp_lim = 9990, inner_att = 4278, outer_att = 4278, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(303909) ->
    #mon{
        mid = 303909,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 771493, mp_lim = 9990, inner_att = 4278, outer_att = 4278, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2135,
        args = [],
        exp = 0
    };
get(303910) ->
    #mon{
        mid = 303910,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 7998845, mp_lim = 9990, inner_att = 34763, outer_att = 34763, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282509,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 213109,
        args = [],
        exp = 147420
    };
get(304001) ->
    #mon{
        mid = 304001,
        name = <<"僵尸">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 2629, mp_lim = 49, inner_att = 36, outer_att = 36, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304002) ->
    #mon{
        mid = 304002,
        name = <<"哈大霸">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 8608, mp_lim = 49, inner_att = 45, outer_att = 45, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283001,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 905
    };
get(304003) ->
    #mon{
        mid = 304003,
        name = <<"桑土公">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 17216, mp_lim = 49, inner_att = 135, outer_att = 135, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283101,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 2145,
        args = [],
        exp = 2395
    };
get(304004) ->
    #mon{
        mid = 304004,
        name = <<"乌老大">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 20659, mp_lim = 49, inner_att = 158, outer_att = 158, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283201,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 2395
    };
get(304005) ->
    #mon{
        mid = 304005,
        name = <<"卓不凡">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 20659, mp_lim = 49, inner_att = 158, outer_att = 158, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 2143,
        args = [],
        exp = 2395
    };
get(304006) ->
    #mon{
        mid = 304006,
        name = <<"不平道人">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 24791, mp_lim = 49, inner_att = 226, outer_att = 226, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 2144,
        args = [],
        exp = 2395
    };
get(304007) ->
    #mon{
        mid = 304007,
        name = <<"任平生">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 24791, mp_lim = 49, inner_att = 226, outer_att = 226, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283301,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 2395
    };
get(304008) ->
    #mon{
        mid = 304008,
        name = <<"李秋水">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 29750, mp_lim = 49, inner_att = 282, outer_att = 282, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283401,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 2395
    };
get(304009) ->
    #mon{
        mid = 304009,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 35700, mp_lim = 49, inner_att = 367, outer_att = 367, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283501,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 3595
    };
get(304101) ->
    #mon{
        mid = 304101,
        name = <<"僵尸">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 15076, mp_lim = 1330, inner_att = 110, outer_att = 110, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304102) ->
    #mon{
        mid = 304102,
        name = <<"哈大霸">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 49356, mp_lim = 1330, inner_att = 138, outer_att = 138, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283001,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 1810
    };
get(304103) ->
    #mon{
        mid = 304103,
        name = <<"桑土公">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 98713, mp_lim = 1330, inner_att = 415, outer_att = 415, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283101,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214501,
        args = [],
        exp = 4790
    };
get(304104) ->
    #mon{
        mid = 304104,
        name = <<"乌老大">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 118456, mp_lim = 1330, inner_att = 484, outer_att = 484, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283201,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 4790
    };
get(304105) ->
    #mon{
        mid = 304105,
        name = <<"卓不凡">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 118456, mp_lim = 1330, inner_att = 484, outer_att = 484, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214301,
        args = [],
        exp = 4790
    };
get(304106) ->
    #mon{
        mid = 304106,
        name = <<"不平道人">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 142147, mp_lim = 1330, inner_att = 692, outer_att = 692, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214401,
        args = [],
        exp = 4790
    };
get(304107) ->
    #mon{
        mid = 304107,
        name = <<"任平生">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 142147, mp_lim = 1330, inner_att = 692, outer_att = 692, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283301,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 4790
    };
get(304108) ->
    #mon{
        mid = 304108,
        name = <<"李秋水">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 170577, mp_lim = 1330, inner_att = 865, outer_att = 865, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283401,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 4790
    };
get(304109) ->
    #mon{
        mid = 304109,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 204692, mp_lim = 1330, inner_att = 1124, outer_att = 1124, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283501,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 7190
    };
get(304201) ->
    #mon{
        mid = 304201,
        name = <<"僵尸">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 33323, mp_lim = 2413, inner_att = 219, outer_att = 219, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304202) ->
    #mon{
        mid = 304202,
        name = <<"哈大霸">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 109095, mp_lim = 2413, inner_att = 274, outer_att = 274, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283002,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 2715
    };
get(304203) ->
    #mon{
        mid = 304203,
        name = <<"桑土公">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 218190, mp_lim = 2413, inner_att = 822, outer_att = 822, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283102,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214502,
        args = [],
        exp = 7185
    };
get(304204) ->
    #mon{
        mid = 304204,
        name = <<"乌老大">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 261828, mp_lim = 2413, inner_att = 959, outer_att = 959, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283202,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 7185
    };
get(304205) ->
    #mon{
        mid = 304205,
        name = <<"卓不凡">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 261828, mp_lim = 2413, inner_att = 959, outer_att = 959, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214302,
        args = [],
        exp = 7185
    };
get(304206) ->
    #mon{
        mid = 304206,
        name = <<"不平道人">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 314194, mp_lim = 2413, inner_att = 1370, outer_att = 1370, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214402,
        args = [],
        exp = 7185
    };
get(304207) ->
    #mon{
        mid = 304207,
        name = <<"任平生">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 314194, mp_lim = 2413, inner_att = 1370, outer_att = 1370, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283302,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 7185
    };
get(304208) ->
    #mon{
        mid = 304208,
        name = <<"李秋水">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 377033, mp_lim = 2413, inner_att = 1713, outer_att = 1713, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283402,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 7185
    };
get(304209) ->
    #mon{
        mid = 304209,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 452440, mp_lim = 2413, inner_att = 2227, outer_att = 2227, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283502,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 10785
    };
get(304301) ->
    #mon{
        mid = 304301,
        name = <<"僵尸">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 63436, mp_lim = 3495, inner_att = 398, outer_att = 398, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304302) ->
    #mon{
        mid = 304302,
        name = <<"哈大霸">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 207679, mp_lim = 3495, inner_att = 497, outer_att = 497, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283003,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 3982
    };
get(304303) ->
    #mon{
        mid = 304303,
        name = <<"桑土公">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 415358, mp_lim = 3495, inner_att = 1493, outer_att = 1493, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283103,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214503,
        args = [],
        exp = 10538
    };
get(304304) ->
    #mon{
        mid = 304304,
        name = <<"乌老大">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 498430, mp_lim = 3495, inner_att = 1742, outer_att = 1742, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283203,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 10538
    };
get(304305) ->
    #mon{
        mid = 304305,
        name = <<"卓不凡">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 498430, mp_lim = 3495, inner_att = 1742, outer_att = 1742, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214303,
        args = [],
        exp = 10538
    };
get(304306) ->
    #mon{
        mid = 304306,
        name = <<"不平道人">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 598116, mp_lim = 3495, inner_att = 2488, outer_att = 2488, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214403,
        args = [],
        exp = 10538
    };
get(304307) ->
    #mon{
        mid = 304307,
        name = <<"任平生">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 598116, mp_lim = 3495, inner_att = 2488, outer_att = 2488, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283303,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 10538
    };
get(304308) ->
    #mon{
        mid = 304308,
        name = <<"李秋水">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 717739, mp_lim = 3495, inner_att = 3111, outer_att = 3111, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283403,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 10538
    };
get(304309) ->
    #mon{
        mid = 304309,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 861287, mp_lim = 3495, inner_att = 4044, outer_att = 4044, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283503,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 15818
    };
get(304401) ->
    #mon{
        mid = 304401,
        name = <<"僵尸">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 113065, mp_lim = 4578, inner_att = 692, outer_att = 692, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304402) ->
    #mon{
        mid = 304402,
        name = <<"哈大霸">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 370154, mp_lim = 4578, inner_att = 865, outer_att = 865, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283004,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 5249
    };
get(304403) ->
    #mon{
        mid = 304403,
        name = <<"桑土公">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 740308, mp_lim = 4578, inner_att = 2595, outer_att = 2595, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283104,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214504,
        args = [],
        exp = 13891
    };
get(304404) ->
    #mon{
        mid = 304404,
        name = <<"乌老大">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 888370, mp_lim = 4578, inner_att = 3028, outer_att = 3028, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283204,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 13891
    };
get(304405) ->
    #mon{
        mid = 304405,
        name = <<"卓不凡">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 888370, mp_lim = 4578, inner_att = 3028, outer_att = 3028, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214304,
        args = [],
        exp = 13891
    };
get(304406) ->
    #mon{
        mid = 304406,
        name = <<"不平道人">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1066044, mp_lim = 4578, inner_att = 4325, outer_att = 4325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214404,
        args = [],
        exp = 13891
    };
get(304407) ->
    #mon{
        mid = 304407,
        name = <<"任平生">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1066044, mp_lim = 4578, inner_att = 4325, outer_att = 4325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283304,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 13891
    };
get(304408) ->
    #mon{
        mid = 304408,
        name = <<"李秋水">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1279253, mp_lim = 4578, inner_att = 5407, outer_att = 5407, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283404,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 13891
    };
get(304409) ->
    #mon{
        mid = 304409,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 1535104, mp_lim = 4578, inner_att = 7029, outer_att = 7029, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283504,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 20851
    };
get(304501) ->
    #mon{
        mid = 304501,
        name = <<"僵尸">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 189318, mp_lim = 5660, inner_att = 1139, outer_att = 1139, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304502) ->
    #mon{
        mid = 304502,
        name = <<"哈大霸">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 619793, mp_lim = 5660, inner_att = 1424, outer_att = 1424, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283005,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 6878
    };
get(304503) ->
    #mon{
        mid = 304503,
        name = <<"桑土公">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1239586, mp_lim = 5660, inner_att = 4272, outer_att = 4272, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283105,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214505,
        args = [],
        exp = 18202
    };
get(304504) ->
    #mon{
        mid = 304504,
        name = <<"乌老大">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1487504, mp_lim = 5660, inner_att = 4984, outer_att = 4984, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283205,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 18202
    };
get(304505) ->
    #mon{
        mid = 304505,
        name = <<"卓不凡">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1487504, mp_lim = 5660, inner_att = 4984, outer_att = 4984, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214305,
        args = [],
        exp = 18202
    };
get(304506) ->
    #mon{
        mid = 304506,
        name = <<"不平道人">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1785005, mp_lim = 5660, inner_att = 7120, outer_att = 7120, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214405,
        args = [],
        exp = 18202
    };
get(304507) ->
    #mon{
        mid = 304507,
        name = <<"任平生">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 1785005, mp_lim = 5660, inner_att = 7120, outer_att = 7120, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283305,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 18202
    };
get(304508) ->
    #mon{
        mid = 304508,
        name = <<"李秋水">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 2142006, mp_lim = 5660, inner_att = 8901, outer_att = 8901, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283405,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 18202
    };
get(304509) ->
    #mon{
        mid = 304509,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 2570407, mp_lim = 5660, inner_att = 11571, outer_att = 11571, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283505,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 27322
    };
get(304601) ->
    #mon{
        mid = 304601,
        name = <<"僵尸">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 284440, mp_lim = 6743, inner_att = 1693, outer_att = 1693, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304602) ->
    #mon{
        mid = 304602,
        name = <<"哈大霸">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 931204, mp_lim = 6743, inner_att = 2116, outer_att = 2116, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283006,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 10317
    };
get(304603) ->
    #mon{
        mid = 304603,
        name = <<"桑土公">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1862408, mp_lim = 6743, inner_att = 6348, outer_att = 6348, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283106,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214506,
        args = [],
        exp = 27303
    };
get(304604) ->
    #mon{
        mid = 304604,
        name = <<"乌老大">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2234890, mp_lim = 6743, inner_att = 7407, outer_att = 7407, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283206,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 27303
    };
get(304605) ->
    #mon{
        mid = 304605,
        name = <<"卓不凡">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2234890, mp_lim = 6743, inner_att = 7407, outer_att = 7407, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214306,
        args = [],
        exp = 27303
    };
get(304606) ->
    #mon{
        mid = 304606,
        name = <<"不平道人">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2681868, mp_lim = 6743, inner_att = 10581, outer_att = 10581, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214406,
        args = [],
        exp = 27303
    };
get(304607) ->
    #mon{
        mid = 304607,
        name = <<"任平生">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 2681868, mp_lim = 6743, inner_att = 10581, outer_att = 10581, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283306,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 27303
    };
get(304608) ->
    #mon{
        mid = 304608,
        name = <<"李秋水">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 3218241, mp_lim = 6743, inner_att = 13226, outer_att = 13226, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283406,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 27303
    };
get(304609) ->
    #mon{
        mid = 304609,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 3861890, mp_lim = 6743, inner_att = 17194, outer_att = 17194, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283506,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 40983
    };
get(304701) ->
    #mon{
        mid = 304701,
        name = <<"僵尸">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 398444, mp_lim = 7825, inner_att = 2351, outer_att = 2351, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304702) ->
    #mon{
        mid = 304702,
        name = <<"哈大霸">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1304429, mp_lim = 7825, inner_att = 2938, outer_att = 2938, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283007,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 15566
    };
get(304703) ->
    #mon{
        mid = 304703,
        name = <<"桑土公">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2608859, mp_lim = 7825, inner_att = 8816, outer_att = 8816, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283107,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214507,
        args = [],
        exp = 41194
    };
get(304704) ->
    #mon{
        mid = 304704,
        name = <<"乌老大">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3130631, mp_lim = 7825, inner_att = 10285, outer_att = 10285, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283207,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 41194
    };
get(304705) ->
    #mon{
        mid = 304705,
        name = <<"卓不凡">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3130631, mp_lim = 7825, inner_att = 10285, outer_att = 10285, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214307,
        args = [],
        exp = 41194
    };
get(304706) ->
    #mon{
        mid = 304706,
        name = <<"不平道人">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3756758, mp_lim = 7825, inner_att = 14694, outer_att = 14694, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214407,
        args = [],
        exp = 41194
    };
get(304707) ->
    #mon{
        mid = 304707,
        name = <<"任平生">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 3756758, mp_lim = 7825, inner_att = 14694, outer_att = 14694, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283307,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 41194
    };
get(304708) ->
    #mon{
        mid = 304708,
        name = <<"李秋水">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 4508109, mp_lim = 7825, inner_att = 18367, outer_att = 18367, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283407,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 41194
    };
get(304709) ->
    #mon{
        mid = 304709,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 5409731, mp_lim = 7825, inner_att = 23878, outer_att = 23878, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283507,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 61834
    };
get(304801) ->
    #mon{
        mid = 304801,
        name = <<"僵尸">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 517653, mp_lim = 8908, inner_att = 3032, outer_att = 3032, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304802) ->
    #mon{
        mid = 304802,
        name = <<"哈大霸">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1694699, mp_lim = 8908, inner_att = 3790, outer_att = 3790, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283008,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 30951
    };
get(304803) ->
    #mon{
        mid = 304803,
        name = <<"桑土公">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 3389398, mp_lim = 8908, inner_att = 11372, outer_att = 11372, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283108,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214508,
        args = [],
        exp = 81909
    };
get(304804) ->
    #mon{
        mid = 304804,
        name = <<"乌老大">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4067277, mp_lim = 8908, inner_att = 13267, outer_att = 13267, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283208,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 81909
    };
get(304805) ->
    #mon{
        mid = 304805,
        name = <<"卓不凡">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4067277, mp_lim = 8908, inner_att = 13267, outer_att = 13267, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214308,
        args = [],
        exp = 81909
    };
get(304806) ->
    #mon{
        mid = 304806,
        name = <<"不平道人">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4880733, mp_lim = 8908, inner_att = 18953, outer_att = 18953, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214408,
        args = [],
        exp = 81909
    };
get(304807) ->
    #mon{
        mid = 304807,
        name = <<"任平生">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 4880733, mp_lim = 8908, inner_att = 18953, outer_att = 18953, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283308,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 81909
    };
get(304808) ->
    #mon{
        mid = 304808,
        name = <<"李秋水">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 5856880, mp_lim = 8908, inner_att = 23691, outer_att = 23691, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283408,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 81909
    };
get(304809) ->
    #mon{
        mid = 304809,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 7028256, mp_lim = 8908, inner_att = 30799, outer_att = 30799, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283508,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 122949
    };
get(304901) ->
    #mon{
        mid = 304901,
        name = <<"僵尸">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 648054, mp_lim = 9990, inner_att = 3765, outer_att = 3765, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(304902) ->
    #mon{
        mid = 304902,
        name = <<"哈大霸">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2121607, mp_lim = 9990, inner_att = 4706, outer_att = 4706, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283009,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2141,
        args = [],
        exp = 49413
    };
get(304903) ->
    #mon{
        mid = 304903,
        name = <<"桑土公">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 4243214, mp_lim = 9990, inner_att = 14119, outer_att = 14119, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283109,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 214509,
        args = [],
        exp = 130767
    };
get(304904) ->
    #mon{
        mid = 304904,
        name = <<"乌老大">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 5091857, mp_lim = 9990, inner_att = 16472, outer_att = 16472, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283209,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2142,
        args = [],
        exp = 130767
    };
get(304905) ->
    #mon{
        mid = 304905,
        name = <<"卓不凡">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 5091857, mp_lim = 9990, inner_att = 16472, outer_att = 16472, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 214309,
        args = [],
        exp = 130767
    };
get(304906) ->
    #mon{
        mid = 304906,
        name = <<"不平道人">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 6110229, mp_lim = 9990, inner_att = 23532, outer_att = 23532, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 214409,
        args = [],
        exp = 130767
    };
get(304907) ->
    #mon{
        mid = 304907,
        name = <<"任平生">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 6110229, mp_lim = 9990, inner_att = 23532, outer_att = 23532, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283309,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 2010,
        args = [],
        exp = 130767
    };
get(304908) ->
    #mon{
        mid = 304908,
        name = <<"李秋水">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 7332274, mp_lim = 9990, inner_att = 29415, outer_att = 29415, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283409,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 130767
    };
get(304909) ->
    #mon{
        mid = 304909,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 8798729, mp_lim = 9990, inner_att = 38239, outer_att = 38239, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283509,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2147,
        args = [],
        exp = 196287
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

