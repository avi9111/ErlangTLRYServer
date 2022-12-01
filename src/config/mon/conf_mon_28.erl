%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_28
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_28).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(280001) ->
    #mon{
        mid = 280001,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
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
        exp = 36
    };
get(280002) ->
    #mon{
        mid = 280002,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
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
        exp = 36
    };
get(280003) ->
    #mon{
        mid = 280003,
        name = <<"小熊">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 36
    };
get(280004) ->
    #mon{
        mid = 280004,
        name = <<"鼓手">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 647, mp_lim = 1763, inner_att = 41, outer_att = 41, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 36
    };
get(280005) ->
    #mon{
        mid = 280005,
        name = <<"余毒">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 9708, mp_lim = 1763, inner_att = 48, outer_att = 48, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 321002,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 4015,
        args = [],
        exp = 196
    };
get(280006) ->
    #mon{
        mid = 280006,
        name = <<"红熊王">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 8939, mp_lim = 1763, inner_att = 55, outer_att = 55, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 321003,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 2011,
        args = [],
        exp = 196
    };
get(280007) ->
    #mon{
        mid = 280007,
        name = <<"葛荣">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 15532, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 321004,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4}],
        ai_group = 4017,
        args = [],
        exp = 196
    };
get(280008) ->
    #mon{
        mid = 280008,
        name = <<"小熊">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 647, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
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
        exp = 36
    };
get(280009) ->
    #mon{
        mid = 280009,
        name = <<"鼓手">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 485, mp_lim = 1763, inner_att = 41, outer_att = 41, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 36
    };
get(280010) ->
    #mon{
        mid = 280010,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4012,
        args = [],
        exp = 36
    };
get(280011) ->
    #mon{
        mid = 280011,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4013,
        args = [],
        exp = 36
    };
get(280012) ->
    #mon{
        mid = 280012,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4014,
        args = [],
        exp = 36
    };
get(280013) ->
    #mon{
        mid = 280013,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 776, mp_lim = 1763, inner_att = 34, outer_att = 34, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 4019,
        args = [],
        exp = 0
    };
get(281001) ->
    #mon{
        mid = 281001,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 17, outer_att = 17, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 62
    };
get(281002) ->
    #mon{
        mid = 281002,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 796, mp_lim = 49, inner_att = 13, outer_att = 13, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 62
    };
get(281003) ->
    #mon{
        mid = 281003,
        name = <<"小熊">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 17, outer_att = 17, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281004) ->
    #mon{
        mid = 281004,
        name = <<"鼓手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 17, outer_att = 17, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281005) ->
    #mon{
        mid = 281005,
        name = <<"余毒">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 4975, mp_lim = 49, inner_att = 51, outer_att = 51, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 641
    };
get(281006) ->
    #mon{
        mid = 281006,
        name = <<"红熊王">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6368, mp_lim = 49, inner_att = 59, outer_att = 59, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280301,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 2011,
        args = [],
        exp = 641
    };
get(281007) ->
    #mon{
        mid = 281007,
        name = <<"葛荣">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 5572, mp_lim = 49, inner_att = 85, outer_att = 85, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 2014,
        args = [],
        exp = 641
    };
get(281008) ->
    #mon{
        mid = 281008,
        name = <<"小熊">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 17, outer_att = 17, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
get(281009) ->
    #mon{
        mid = 281009,
        name = <<"鼓手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 995, mp_lim = 49, inner_att = 17, outer_att = 17, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281010) ->
    #mon{
        mid = 281010,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7164, mp_lim = 49, inner_att = 110, outer_att = 110, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280501,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 2014,
        args = [],
        exp = 801
    };
get(281101) ->
    #mon{
        mid = 281101,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 125
    };
get(281102) ->
    #mon{
        mid = 281102,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 4564, mp_lim = 1330, inner_att = 41, outer_att = 41, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 125
    };
get(281103) ->
    #mon{
        mid = 281103,
        name = <<"小熊">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281104) ->
    #mon{
        mid = 281104,
        name = <<"鼓手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281105) ->
    #mon{
        mid = 281105,
        name = <<"余毒">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 28525, mp_lim = 1330, inner_att = 156, outer_att = 156, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 1282
    };
get(281106) ->
    #mon{
        mid = 281106,
        name = <<"红熊王">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 36512, mp_lim = 1330, inner_att = 182, outer_att = 182, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280301,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201101,
        args = [],
        exp = 1282
    };
get(281107) ->
    #mon{
        mid = 281107,
        name = <<"葛荣">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 31948, mp_lim = 1330, inner_att = 260, outer_att = 260, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201401,
        args = [],
        exp = 1282
    };
get(281108) ->
    #mon{
        mid = 281108,
        name = <<"小熊">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(281109) ->
    #mon{
        mid = 281109,
        name = <<"鼓手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5705, mp_lim = 1330, inner_att = 52, outer_att = 52, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281110) ->
    #mon{
        mid = 281110,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 41076, mp_lim = 1330, inner_att = 338, outer_att = 338, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280401,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201401,
        args = [],
        exp = 1603
    };
get(281201) ->
    #mon{
        mid = 281201,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 188
    };
get(281202) ->
    #mon{
        mid = 281202,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 10088, mp_lim = 2413, inner_att = 82, outer_att = 82, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 188
    };
get(281203) ->
    #mon{
        mid = 281203,
        name = <<"小熊">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281204) ->
    #mon{
        mid = 281204,
        name = <<"鼓手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281205) ->
    #mon{
        mid = 281205,
        name = <<"余毒">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 63050, mp_lim = 2413, inner_att = 309, outer_att = 309, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 1924
    };
get(281206) ->
    #mon{
        mid = 281206,
        name = <<"红熊王">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 80704, mp_lim = 2413, inner_att = 360, outer_att = 360, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280302,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201102,
        args = [],
        exp = 1924
    };
get(281207) ->
    #mon{
        mid = 281207,
        name = <<"葛荣">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 70616, mp_lim = 2413, inner_att = 515, outer_att = 515, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280402,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201402,
        args = [],
        exp = 1924
    };
get(281208) ->
    #mon{
        mid = 281208,
        name = <<"小熊">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(281209) ->
    #mon{
        mid = 281209,
        name = <<"鼓手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12610, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281210) ->
    #mon{
        mid = 281210,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 90792, mp_lim = 2413, inner_att = 669, outer_att = 669, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280502,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201402,
        args = [],
        exp = 2405
    };
get(281301) ->
    #mon{
        mid = 281301,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 275
    };
get(281302) ->
    #mon{
        mid = 281302,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 19204, mp_lim = 3495, inner_att = 149, outer_att = 149, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 275
    };
get(281303) ->
    #mon{
        mid = 281303,
        name = <<"小熊">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281304) ->
    #mon{
        mid = 281304,
        name = <<"鼓手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281305) ->
    #mon{
        mid = 281305,
        name = <<"余毒">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 120025, mp_lim = 3495, inner_att = 561, outer_att = 561, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 2822
    };
get(281306) ->
    #mon{
        mid = 281306,
        name = <<"红熊王">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 153632, mp_lim = 3495, inner_att = 654, outer_att = 654, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280303,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201103,
        args = [],
        exp = 2822
    };
get(281307) ->
    #mon{
        mid = 281307,
        name = <<"葛荣">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 134428, mp_lim = 3495, inner_att = 935, outer_att = 935, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280403,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201403,
        args = [],
        exp = 2822
    };
get(281308) ->
    #mon{
        mid = 281308,
        name = <<"小熊">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(281309) ->
    #mon{
        mid = 281309,
        name = <<"鼓手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24005, mp_lim = 3495, inner_att = 187, outer_att = 187, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281310) ->
    #mon{
        mid = 281310,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 172836, mp_lim = 3495, inner_att = 1215, outer_att = 1215, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280503,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201403,
        args = [],
        exp = 3527
    };
get(281401) ->
    #mon{
        mid = 281401,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 363
    };
get(281402) ->
    #mon{
        mid = 281402,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 34228, mp_lim = 4578, inner_att = 260, outer_att = 260, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 363
    };
get(281403) ->
    #mon{
        mid = 281403,
        name = <<"小熊">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281404) ->
    #mon{
        mid = 281404,
        name = <<"鼓手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281405) ->
    #mon{
        mid = 281405,
        name = <<"余毒">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 213925, mp_lim = 4578, inner_att = 975, outer_att = 975, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 3720
    };
get(281406) ->
    #mon{
        mid = 281406,
        name = <<"红熊王">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 273824, mp_lim = 4578, inner_att = 1137, outer_att = 1137, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280304,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201104,
        args = [],
        exp = 3720
    };
get(281407) ->
    #mon{
        mid = 281407,
        name = <<"葛荣">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 239596, mp_lim = 4578, inner_att = 1625, outer_att = 1625, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280404,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201404,
        args = [],
        exp = 3720
    };
get(281408) ->
    #mon{
        mid = 281408,
        name = <<"小熊">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(281409) ->
    #mon{
        mid = 281409,
        name = <<"鼓手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 42785, mp_lim = 4578, inner_att = 325, outer_att = 325, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281410) ->
    #mon{
        mid = 281410,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 308052, mp_lim = 4578, inner_att = 2112, outer_att = 2112, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280504,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201404,
        args = [],
        exp = 4650
    };
get(281501) ->
    #mon{
        mid = 281501,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 476
    };
get(281502) ->
    #mon{
        mid = 281502,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 57312, mp_lim = 5660, inner_att = 428, outer_att = 428, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 476
    };
get(281503) ->
    #mon{
        mid = 281503,
        name = <<"小熊">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281504) ->
    #mon{
        mid = 281504,
        name = <<"鼓手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281505) ->
    #mon{
        mid = 281505,
        name = <<"余毒">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 358200, mp_lim = 5660, inner_att = 1605, outer_att = 1605, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 4874
    };
get(281506) ->
    #mon{
        mid = 281506,
        name = <<"红熊王">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 1872, outer_att = 1872, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280305,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201105,
        args = [],
        exp = 4874
    };
get(281507) ->
    #mon{
        mid = 281507,
        name = <<"葛荣">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 401184, mp_lim = 5660, inner_att = 2675, outer_att = 2675, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280405,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201405,
        args = [],
        exp = 4874
    };
get(281508) ->
    #mon{
        mid = 281508,
        name = <<"小熊">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(281509) ->
    #mon{
        mid = 281509,
        name = <<"鼓手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 71640, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281510) ->
    #mon{
        mid = 281510,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 515808, mp_lim = 5660, inner_att = 3477, outer_att = 3477, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280505,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201405,
        args = [],
        exp = 6093
    };
get(281601) ->
    #mon{
        mid = 281601,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 714
    };
get(281602) ->
    #mon{
        mid = 281602,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 86108, mp_lim = 6743, inner_att = 636, outer_att = 636, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 714
    };
get(281603) ->
    #mon{
        mid = 281603,
        name = <<"小熊">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281604) ->
    #mon{
        mid = 281604,
        name = <<"鼓手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281605) ->
    #mon{
        mid = 281605,
        name = <<"余毒">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 538175, mp_lim = 6743, inner_att = 2385, outer_att = 2385, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 7312
    };
get(281606) ->
    #mon{
        mid = 281606,
        name = <<"红熊王">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 688864, mp_lim = 6743, inner_att = 2782, outer_att = 2782, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280306,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201106,
        args = [],
        exp = 7312
    };
get(281607) ->
    #mon{
        mid = 281607,
        name = <<"葛荣">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 602756, mp_lim = 6743, inner_att = 3975, outer_att = 3975, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280406,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201406,
        args = [],
        exp = 7312
    };
get(281608) ->
    #mon{
        mid = 281608,
        name = <<"小熊">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(281609) ->
    #mon{
        mid = 281609,
        name = <<"鼓手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 107635, mp_lim = 6743, inner_att = 795, outer_att = 795, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281610) ->
    #mon{
        mid = 281610,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 774972, mp_lim = 6743, inner_att = 5167, outer_att = 5167, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280506,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201406,
        args = [],
        exp = 9140
    };
get(281701) ->
    #mon{
        mid = 281701,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 1078
    };
get(281702) ->
    #mon{
        mid = 281702,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 120620, mp_lim = 7825, inner_att = 883, outer_att = 883, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 1078
    };
get(281703) ->
    #mon{
        mid = 281703,
        name = <<"小熊">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281704) ->
    #mon{
        mid = 281704,
        name = <<"鼓手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281705) ->
    #mon{
        mid = 281705,
        name = <<"余毒">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 753875, mp_lim = 7825, inner_att = 3312, outer_att = 3312, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 11032
    };
get(281706) ->
    #mon{
        mid = 281706,
        name = <<"红熊王">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 964960, mp_lim = 7825, inner_att = 3864, outer_att = 3864, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280307,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201107,
        args = [],
        exp = 11032
    };
get(281707) ->
    #mon{
        mid = 281707,
        name = <<"葛荣">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 844340, mp_lim = 7825, inner_att = 5520, outer_att = 5520, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280407,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201407,
        args = [],
        exp = 11032
    };
get(281708) ->
    #mon{
        mid = 281708,
        name = <<"小熊">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(281709) ->
    #mon{
        mid = 281709,
        name = <<"鼓手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 150775, mp_lim = 7825, inner_att = 1104, outer_att = 1104, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281710) ->
    #mon{
        mid = 281710,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1085580, mp_lim = 7825, inner_att = 7176, outer_att = 7176, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280507,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201407,
        args = [],
        exp = 13790
    };
get(281801) ->
    #mon{
        mid = 281801,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 2144
    };
get(281802) ->
    #mon{
        mid = 281802,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 156708, mp_lim = 8908, inner_att = 1139, outer_att = 1139, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 2144
    };
get(281803) ->
    #mon{
        mid = 281803,
        name = <<"小熊">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281804) ->
    #mon{
        mid = 281804,
        name = <<"鼓手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281805) ->
    #mon{
        mid = 281805,
        name = <<"余毒">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 979425, mp_lim = 8908, inner_att = 4272, outer_att = 4272, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 21936
    };
get(281806) ->
    #mon{
        mid = 281806,
        name = <<"红熊王">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 4984, outer_att = 4984, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280308,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201108,
        args = [],
        exp = 21936
    };
get(281807) ->
    #mon{
        mid = 281807,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1096956, mp_lim = 8908, inner_att = 7120, outer_att = 7120, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280408,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201408,
        args = [],
        exp = 21936
    };
get(281808) ->
    #mon{
        mid = 281808,
        name = <<"小熊">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(281809) ->
    #mon{
        mid = 281809,
        name = <<"鼓手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 195885, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281810) ->
    #mon{
        mid = 281810,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1410372, mp_lim = 8908, inner_att = 9256, outer_att = 9256, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280508,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201408,
        args = [],
        exp = 27420
    };
get(281901) ->
    #mon{
        mid = 281901,
        name = <<"伪宋兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 3423
    };
get(281902) ->
    #mon{
        mid = 281902,
        name = <<"逃跑的伪宋兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 196184, mp_lim = 9990, inner_att = 1414, outer_att = 1414, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 3423
    };
get(281903) ->
    #mon{
        mid = 281903,
        name = <<"小熊">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2012,
        args = [],
        exp = 0
    };
get(281904) ->
    #mon{
        mid = 281904,
        name = <<"鼓手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2015,
        args = [],
        exp = 0
    };
get(281905) ->
    #mon{
        mid = 281905,
        name = <<"余毒">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1226150, mp_lim = 9990, inner_att = 5304, outer_att = 5304, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 35021
    };
get(281906) ->
    #mon{
        mid = 281906,
        name = <<"红熊王">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1569472, mp_lim = 9990, inner_att = 6188, outer_att = 6188, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280309,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 201109,
        args = [],
        exp = 35021
    };
get(281907) ->
    #mon{
        mid = 281907,
        name = <<"葛荣">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1373288, mp_lim = 9990, inner_att = 8840, outer_att = 8840, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280409,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201409,
        args = [],
        exp = 35021
    };
get(281908) ->
    #mon{
        mid = 281908,
        name = <<"小熊">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(281909) ->
    #mon{
        mid = 281909,
        name = <<"鼓手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 245230, mp_lim = 9990, inner_att = 1768, outer_att = 1768, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2013,
        args = [],
        exp = 0
    };
get(281910) ->
    #mon{
        mid = 281910,
        name = <<"愤怒的葛荣">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1765656, mp_lim = 9990, inner_att = 11492, outer_att = 11492, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280509,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 201409,
        args = [],
        exp = 43776
    };
get(282001) ->
    #mon{
        mid = 282001,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1094, mp_lim = 49, inner_att = 18, outer_att = 18, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282002) ->
    #mon{
        mid = 282002,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 835, mp_lim = 49, inner_att = 14, outer_att = 14, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282003) ->
    #mon{
        mid = 282003,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 835, mp_lim = 49, inner_att = 14, outer_att = 14, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282004) ->
    #mon{
        mid = 282004,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 835, mp_lim = 49, inner_att = 14, outer_att = 14, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282005) ->
    #mon{
        mid = 282005,
        name = <<"岳老三">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5472, mp_lim = 49, inner_att = 56, outer_att = 56, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 190
    };
get(282006) ->
    #mon{
        mid = 282006,
        name = <<"叶二娘">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5472, mp_lim = 49, inner_att = 56, outer_att = 56, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 190
    };
get(282007) ->
    #mon{
        mid = 282007,
        name = <<"云中鹤">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5472, mp_lim = 49, inner_att = 56, outer_att = 56, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 190
    };
get(282008) ->
    #mon{
        mid = 282008,
        name = <<"段延庆">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6567, mp_lim = 49, inner_att = 65, outer_att = 65, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281101,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 190
    };
get(282009) ->
    #mon{
        mid = 282009,
        name = <<"姚伯当">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1094, mp_lim = 49, inner_att = 18, outer_att = 18, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282010) ->
    #mon{
        mid = 282010,
        name = <<"司马林">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1094, mp_lim = 49, inner_att = 18, outer_att = 18, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 36
    };
get(282011) ->
    #mon{
        mid = 282011,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6567, mp_lim = 49, inner_att = 65, outer_att = 65, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281201,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 190
    };
get(282012) ->
    #mon{
        mid = 282012,
        name = <<"包不同">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5472, mp_lim = 49, inner_att = 56, outer_att = 56, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 190
    };
get(282013) ->
    #mon{
        mid = 282013,
        name = <<"风波恶">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 5472, mp_lim = 49, inner_att = 56, outer_att = 56, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 190
    };
get(282014) ->
    #mon{
        mid = 282014,
        name = <<"慕容复">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7880, mp_lim = 49, inner_att = 93, outer_att = 93, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281301,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 377
    };
get(282015) ->
    #mon{
        mid = 282015,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 9456, mp_lim = 49, inner_att = 121, outer_att = 121, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281501,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 471
    };
get(282101) ->
    #mon{
        mid = 282101,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6275, mp_lim = 1330, inner_att = 57, outer_att = 57, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282102) ->
    #mon{
        mid = 282102,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 4792, mp_lim = 1330, inner_att = 45, outer_att = 45, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282103) ->
    #mon{
        mid = 282103,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 4792, mp_lim = 1330, inner_att = 45, outer_att = 45, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282104) ->
    #mon{
        mid = 282104,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 4792, mp_lim = 1330, inner_att = 45, outer_att = 45, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282105) ->
    #mon{
        mid = 282105,
        name = <<"岳老三">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31377, mp_lim = 1330, inner_att = 171, outer_att = 171, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 380
    };
get(282106) ->
    #mon{
        mid = 282106,
        name = <<"叶二娘">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31377, mp_lim = 1330, inner_att = 171, outer_att = 171, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 380
    };
get(282107) ->
    #mon{
        mid = 282107,
        name = <<"云中鹤">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31377, mp_lim = 1330, inner_att = 171, outer_att = 171, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 380
    };
get(282108) ->
    #mon{
        mid = 282108,
        name = <<"段延庆">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 37653, mp_lim = 1330, inner_att = 200, outer_att = 200, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281101,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 380
    };
get(282109) ->
    #mon{
        mid = 282109,
        name = <<"姚伯当">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6275, mp_lim = 1330, inner_att = 57, outer_att = 57, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282110) ->
    #mon{
        mid = 282110,
        name = <<"司马林">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6275, mp_lim = 1330, inner_att = 57, outer_att = 57, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 73
    };
get(282111) ->
    #mon{
        mid = 282111,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 37653, mp_lim = 1330, inner_att = 200, outer_att = 200, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281201,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 380
    };
get(282112) ->
    #mon{
        mid = 282112,
        name = <<"包不同">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31377, mp_lim = 1330, inner_att = 171, outer_att = 171, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 380
    };
get(282113) ->
    #mon{
        mid = 282113,
        name = <<"风波恶">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 31377, mp_lim = 1330, inner_att = 171, outer_att = 171, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 380
    };
get(282114) ->
    #mon{
        mid = 282114,
        name = <<"慕容复">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 45183, mp_lim = 1330, inner_att = 286, outer_att = 286, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281301,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 754
    };
get(282115) ->
    #mon{
        mid = 282115,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 54220, mp_lim = 1330, inner_att = 371, outer_att = 371, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281501,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 943
    };
get(282201) ->
    #mon{
        mid = 282201,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 13871, mp_lim = 2413, inner_att = 113, outer_att = 113, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282202) ->
    #mon{
        mid = 282202,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 10592, mp_lim = 2413, inner_att = 90, outer_att = 90, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282203) ->
    #mon{
        mid = 282203,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 10592, mp_lim = 2413, inner_att = 90, outer_att = 90, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282204) ->
    #mon{
        mid = 282204,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 10592, mp_lim = 2413, inner_att = 90, outer_att = 90, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282205) ->
    #mon{
        mid = 282205,
        name = <<"岳老三">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 69355, mp_lim = 2413, inner_att = 339, outer_att = 339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 570
    };
get(282206) ->
    #mon{
        mid = 282206,
        name = <<"叶二娘">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 69355, mp_lim = 2413, inner_att = 339, outer_att = 339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 570
    };
get(282207) ->
    #mon{
        mid = 282207,
        name = <<"云中鹤">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 69355, mp_lim = 2413, inner_att = 339, outer_att = 339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 570
    };
get(282208) ->
    #mon{
        mid = 282208,
        name = <<"段延庆">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 83226, mp_lim = 2413, inner_att = 396, outer_att = 396, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281102,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 570
    };
get(282209) ->
    #mon{
        mid = 282209,
        name = <<"姚伯当">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 13871, mp_lim = 2413, inner_att = 113, outer_att = 113, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282210) ->
    #mon{
        mid = 282210,
        name = <<"司马林">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 13871, mp_lim = 2413, inner_att = 113, outer_att = 113, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 110
    };
get(282211) ->
    #mon{
        mid = 282211,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 83226, mp_lim = 2413, inner_att = 396, outer_att = 396, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281202,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 570
    };
get(282212) ->
    #mon{
        mid = 282212,
        name = <<"包不同">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 69355, mp_lim = 2413, inner_att = 339, outer_att = 339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 570
    };
get(282213) ->
    #mon{
        mid = 282213,
        name = <<"风波恶">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 69355, mp_lim = 2413, inner_att = 339, outer_att = 339, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 570
    };
get(282214) ->
    #mon{
        mid = 282214,
        name = <<"慕容复">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 99871, mp_lim = 2413, inner_att = 566, outer_att = 566, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281302,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 1132
    };
get(282215) ->
    #mon{
        mid = 282215,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 119845, mp_lim = 2413, inner_att = 736, outer_att = 736, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281502,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 1415
    };
get(282301) ->
    #mon{
        mid = 282301,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 26405, mp_lim = 3495, inner_att = 205, outer_att = 205, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282302) ->
    #mon{
        mid = 282302,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 20164, mp_lim = 3495, inner_att = 164, outer_att = 164, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282303) ->
    #mon{
        mid = 282303,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 20164, mp_lim = 3495, inner_att = 164, outer_att = 164, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282304) ->
    #mon{
        mid = 282304,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 20164, mp_lim = 3495, inner_att = 164, outer_att = 164, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282305) ->
    #mon{
        mid = 282305,
        name = <<"岳老三">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 132027, mp_lim = 3495, inner_att = 617, outer_att = 617, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 836
    };
get(282306) ->
    #mon{
        mid = 282306,
        name = <<"叶二娘">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 132027, mp_lim = 3495, inner_att = 617, outer_att = 617, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 836
    };
get(282307) ->
    #mon{
        mid = 282307,
        name = <<"云中鹤">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 132027, mp_lim = 3495, inner_att = 617, outer_att = 617, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 836
    };
get(282308) ->
    #mon{
        mid = 282308,
        name = <<"段延庆">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 158433, mp_lim = 3495, inner_att = 719, outer_att = 719, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281103,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 836
    };
get(282309) ->
    #mon{
        mid = 282309,
        name = <<"姚伯当">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 26405, mp_lim = 3495, inner_att = 205, outer_att = 205, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282310) ->
    #mon{
        mid = 282310,
        name = <<"司马林">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 26405, mp_lim = 3495, inner_att = 205, outer_att = 205, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 162
    };
get(282311) ->
    #mon{
        mid = 282311,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 158433, mp_lim = 3495, inner_att = 719, outer_att = 719, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281203,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 836
    };
get(282312) ->
    #mon{
        mid = 282312,
        name = <<"包不同">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 132027, mp_lim = 3495, inner_att = 617, outer_att = 617, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 836
    };
get(282313) ->
    #mon{
        mid = 282313,
        name = <<"风波恶">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 132027, mp_lim = 3495, inner_att = 617, outer_att = 617, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 836
    };
get(282314) ->
    #mon{
        mid = 282314,
        name = <<"慕容复">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 190119, mp_lim = 3495, inner_att = 1028, outer_att = 1028, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281303,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 1660
    };
get(282315) ->
    #mon{
        mid = 282315,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 228143, mp_lim = 3495, inner_att = 1337, outer_att = 1337, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281503,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 2076
    };
get(282401) ->
    #mon{
        mid = 282401,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 47063, mp_lim = 4578, inner_att = 357, outer_att = 357, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282402) ->
    #mon{
        mid = 282402,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 35939, mp_lim = 4578, inner_att = 286, outer_att = 286, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282403) ->
    #mon{
        mid = 282403,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 35939, mp_lim = 4578, inner_att = 286, outer_att = 286, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282404) ->
    #mon{
        mid = 282404,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 35939, mp_lim = 4578, inner_att = 286, outer_att = 286, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282405) ->
    #mon{
        mid = 282405,
        name = <<"岳老三">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 235317, mp_lim = 4578, inner_att = 1072, outer_att = 1072, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1102
    };
get(282406) ->
    #mon{
        mid = 282406,
        name = <<"叶二娘">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 235317, mp_lim = 4578, inner_att = 1072, outer_att = 1072, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1102
    };
get(282407) ->
    #mon{
        mid = 282407,
        name = <<"云中鹤">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 235317, mp_lim = 4578, inner_att = 1072, outer_att = 1072, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1102
    };
get(282408) ->
    #mon{
        mid = 282408,
        name = <<"段延庆">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 282381, mp_lim = 4578, inner_att = 1251, outer_att = 1251, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281104,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 1102
    };
get(282409) ->
    #mon{
        mid = 282409,
        name = <<"姚伯当">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 47063, mp_lim = 4578, inner_att = 357, outer_att = 357, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282410) ->
    #mon{
        mid = 282410,
        name = <<"司马林">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 47063, mp_lim = 4578, inner_att = 357, outer_att = 357, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 214
    };
get(282411) ->
    #mon{
        mid = 282411,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 282381, mp_lim = 4578, inner_att = 1251, outer_att = 1251, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281204,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 1102
    };
get(282412) ->
    #mon{
        mid = 282412,
        name = <<"包不同">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 235317, mp_lim = 4578, inner_att = 1072, outer_att = 1072, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1102
    };
get(282413) ->
    #mon{
        mid = 282413,
        name = <<"风波恶">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 235317, mp_lim = 4578, inner_att = 1072, outer_att = 1072, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1102
    };
get(282414) ->
    #mon{
        mid = 282414,
        name = <<"慕容复">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 338857, mp_lim = 4578, inner_att = 1787, outer_att = 1787, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281304,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 2189
    };
get(282415) ->
    #mon{
        mid = 282415,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 406628, mp_lim = 4578, inner_att = 2323, outer_att = 2323, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281504,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 2736
    };
get(282501) ->
    #mon{
        mid = 282501,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 78804, mp_lim = 5660, inner_att = 588, outer_att = 588, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282502) ->
    #mon{
        mid = 282502,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 60177, mp_lim = 5660, inner_att = 470, outer_att = 470, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282503) ->
    #mon{
        mid = 282503,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 60177, mp_lim = 5660, inner_att = 470, outer_att = 470, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282504) ->
    #mon{
        mid = 282504,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 60177, mp_lim = 5660, inner_att = 470, outer_att = 470, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282505) ->
    #mon{
        mid = 282505,
        name = <<"岳老三">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 394020, mp_lim = 5660, inner_att = 1765, outer_att = 1765, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 1444
    };
get(282506) ->
    #mon{
        mid = 282506,
        name = <<"叶二娘">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 394020, mp_lim = 5660, inner_att = 1765, outer_att = 1765, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 1444
    };
get(282507) ->
    #mon{
        mid = 282507,
        name = <<"云中鹤">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 394020, mp_lim = 5660, inner_att = 1765, outer_att = 1765, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 1444
    };
get(282508) ->
    #mon{
        mid = 282508,
        name = <<"段延庆">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 472824, mp_lim = 5660, inner_att = 2059, outer_att = 2059, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281105,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 1444
    };
get(282509) ->
    #mon{
        mid = 282509,
        name = <<"姚伯当">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 78804, mp_lim = 5660, inner_att = 588, outer_att = 588, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282510) ->
    #mon{
        mid = 282510,
        name = <<"司马林">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 78804, mp_lim = 5660, inner_att = 588, outer_att = 588, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 280
    };
get(282511) ->
    #mon{
        mid = 282511,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 472824, mp_lim = 5660, inner_att = 2059, outer_att = 2059, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281205,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 1444
    };
get(282512) ->
    #mon{
        mid = 282512,
        name = <<"包不同">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 394020, mp_lim = 5660, inner_att = 1765, outer_att = 1765, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 1444
    };
get(282513) ->
    #mon{
        mid = 282513,
        name = <<"风波恶">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 394020, mp_lim = 5660, inner_att = 1765, outer_att = 1765, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 1444
    };
get(282514) ->
    #mon{
        mid = 282514,
        name = <<"慕容复">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 567388, mp_lim = 5660, inner_att = 2942, outer_att = 2942, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281305,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 2868
    };
get(282515) ->
    #mon{
        mid = 282515,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 680866, mp_lim = 5660, inner_att = 3825, outer_att = 3825, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281505,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 3586
    };
get(282601) ->
    #mon{
        mid = 282601,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 118398, mp_lim = 6743, inner_att = 874, outer_att = 874, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282602) ->
    #mon{
        mid = 282602,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 90413, mp_lim = 6743, inner_att = 699, outer_att = 699, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282603) ->
    #mon{
        mid = 282603,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 90413, mp_lim = 6743, inner_att = 699, outer_att = 699, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282604) ->
    #mon{
        mid = 282604,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 90413, mp_lim = 6743, inner_att = 699, outer_att = 699, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282605) ->
    #mon{
        mid = 282605,
        name = <<"岳老三">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 591992, mp_lim = 6743, inner_att = 2623, outer_att = 2623, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 2166
    };
get(282606) ->
    #mon{
        mid = 282606,
        name = <<"叶二娘">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 591992, mp_lim = 6743, inner_att = 2623, outer_att = 2623, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 2166
    };
get(282607) ->
    #mon{
        mid = 282607,
        name = <<"云中鹤">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 591992, mp_lim = 6743, inner_att = 2623, outer_att = 2623, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 2166
    };
get(282608) ->
    #mon{
        mid = 282608,
        name = <<"段延庆">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 710391, mp_lim = 6743, inner_att = 3060, outer_att = 3060, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281106,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 2166
    };
get(282609) ->
    #mon{
        mid = 282609,
        name = <<"姚伯当">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 118398, mp_lim = 6743, inner_att = 874, outer_att = 874, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282610) ->
    #mon{
        mid = 282610,
        name = <<"司马林">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 118398, mp_lim = 6743, inner_att = 874, outer_att = 874, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 420
    };
get(282611) ->
    #mon{
        mid = 282611,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 710391, mp_lim = 6743, inner_att = 3060, outer_att = 3060, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281206,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 2166
    };
get(282612) ->
    #mon{
        mid = 282612,
        name = <<"包不同">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 591992, mp_lim = 6743, inner_att = 2623, outer_att = 2623, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 2166
    };
get(282613) ->
    #mon{
        mid = 282613,
        name = <<"风波恶">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 591992, mp_lim = 6743, inner_att = 2623, outer_att = 2623, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 2166
    };
get(282614) ->
    #mon{
        mid = 282614,
        name = <<"慕容复">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 852469, mp_lim = 6743, inner_att = 4372, outer_att = 4372, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281306,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 4303
    };
get(282615) ->
    #mon{
        mid = 282615,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1022963, mp_lim = 6743, inner_att = 5684, outer_att = 5684, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281506,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 5379
    };
get(282701) ->
    #mon{
        mid = 282701,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 165852, mp_lim = 7825, inner_att = 1214, outer_att = 1214, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282702) ->
    #mon{
        mid = 282702,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 126651, mp_lim = 7825, inner_att = 971, outer_att = 971, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282703) ->
    #mon{
        mid = 282703,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 126651, mp_lim = 7825, inner_att = 971, outer_att = 971, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282704) ->
    #mon{
        mid = 282704,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 126651, mp_lim = 7825, inner_att = 971, outer_att = 971, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282705) ->
    #mon{
        mid = 282705,
        name = <<"岳老三">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 829262, mp_lim = 7825, inner_att = 3643, outer_att = 3643, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 3268
    };
get(282706) ->
    #mon{
        mid = 282706,
        name = <<"叶二娘">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 829262, mp_lim = 7825, inner_att = 3643, outer_att = 3643, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 3268
    };
get(282707) ->
    #mon{
        mid = 282707,
        name = <<"云中鹤">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 829262, mp_lim = 7825, inner_att = 3643, outer_att = 3643, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 3268
    };
get(282708) ->
    #mon{
        mid = 282708,
        name = <<"段延庆">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 995115, mp_lim = 7825, inner_att = 4250, outer_att = 4250, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281107,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 3268
    };
get(282709) ->
    #mon{
        mid = 282709,
        name = <<"姚伯当">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 165852, mp_lim = 7825, inner_att = 1214, outer_att = 1214, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282710) ->
    #mon{
        mid = 282710,
        name = <<"司马林">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 165852, mp_lim = 7825, inner_att = 1214, outer_att = 1214, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 634
    };
get(282711) ->
    #mon{
        mid = 282711,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 995115, mp_lim = 7825, inner_att = 4250, outer_att = 4250, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281207,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 3268
    };
get(282712) ->
    #mon{
        mid = 282712,
        name = <<"包不同">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 829262, mp_lim = 7825, inner_att = 3643, outer_att = 3643, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 3268
    };
get(282713) ->
    #mon{
        mid = 282713,
        name = <<"风波恶">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 829262, mp_lim = 7825, inner_att = 3643, outer_att = 3643, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 3268
    };
get(282714) ->
    #mon{
        mid = 282714,
        name = <<"慕容复">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1194138, mp_lim = 7825, inner_att = 6072, outer_att = 6072, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281307,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 6492
    };
get(282715) ->
    #mon{
        mid = 282715,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1432965, mp_lim = 7825, inner_att = 7893, outer_att = 7893, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281507,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 8115
    };
get(282801) ->
    #mon{
        mid = 282801,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 215473, mp_lim = 8908, inner_att = 1566, outer_att = 1566, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282802) ->
    #mon{
        mid = 282802,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 164543, mp_lim = 8908, inner_att = 1253, outer_att = 1253, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282803) ->
    #mon{
        mid = 282803,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 164543, mp_lim = 8908, inner_att = 1253, outer_att = 1253, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282804) ->
    #mon{
        mid = 282804,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 164543, mp_lim = 8908, inner_att = 1253, outer_att = 1253, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282805) ->
    #mon{
        mid = 282805,
        name = <<"岳老三">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1077367, mp_lim = 8908, inner_att = 4699, outer_att = 4699, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 6499
    };
get(282806) ->
    #mon{
        mid = 282806,
        name = <<"叶二娘">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1077367, mp_lim = 8908, inner_att = 4699, outer_att = 4699, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 6499
    };
get(282807) ->
    #mon{
        mid = 282807,
        name = <<"云中鹤">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1077367, mp_lim = 8908, inner_att = 4699, outer_att = 4699, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 6499
    };
get(282808) ->
    #mon{
        mid = 282808,
        name = <<"段延庆">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1292841, mp_lim = 8908, inner_att = 5482, outer_att = 5482, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281108,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 6499
    };
get(282809) ->
    #mon{
        mid = 282809,
        name = <<"姚伯当">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 215473, mp_lim = 8908, inner_att = 1566, outer_att = 1566, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282810) ->
    #mon{
        mid = 282810,
        name = <<"司马林">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 215473, mp_lim = 8908, inner_att = 1566, outer_att = 1566, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 1261
    };
get(282811) ->
    #mon{
        mid = 282811,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1292841, mp_lim = 8908, inner_att = 5482, outer_att = 5482, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281208,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 6499
    };
get(282812) ->
    #mon{
        mid = 282812,
        name = <<"包不同">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1077367, mp_lim = 8908, inner_att = 4699, outer_att = 4699, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 6499
    };
get(282813) ->
    #mon{
        mid = 282813,
        name = <<"风波恶">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 1077367, mp_lim = 8908, inner_att = 4699, outer_att = 4699, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 6499
    };
get(282814) ->
    #mon{
        mid = 282814,
        name = <<"慕容复">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1551409, mp_lim = 8908, inner_att = 7832, outer_att = 7832, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281308,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 12910
    };
get(282815) ->
    #mon{
        mid = 282815,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1861691, mp_lim = 8908, inner_att = 10181, outer_att = 10181, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281508,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 16137
    };
get(282901) ->
    #mon{
        mid = 282901,
        name = <<"一品堂高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 269753, mp_lim = 9990, inner_att = 1944, outer_att = 1944, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282902) ->
    #mon{
        mid = 282902,
        name = <<"秦家寨亲兵">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 205993, mp_lim = 9990, inner_att = 1555, outer_att = 1555, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282903) ->
    #mon{
        mid = 282903,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 205993, mp_lim = 9990, inner_att = 1555, outer_att = 1555, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282904) ->
    #mon{
        mid = 282904,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 205993, mp_lim = 9990, inner_att = 1555, outer_att = 1555, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282905) ->
    #mon{
        mid = 282905,
        name = <<"岳老三">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1348765, mp_lim = 9990, inner_att = 5834, outer_att = 5834, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 10375
    };
get(282906) ->
    #mon{
        mid = 282906,
        name = <<"叶二娘">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1348765, mp_lim = 9990, inner_att = 5834, outer_att = 5834, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 10375
    };
get(282907) ->
    #mon{
        mid = 282907,
        name = <<"云中鹤">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1348765, mp_lim = 9990, inner_att = 5834, outer_att = 5834, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 10375
    };
get(282908) ->
    #mon{
        mid = 282908,
        name = <<"段延庆">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1618518, mp_lim = 9990, inner_att = 6806, outer_att = 6806, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281109,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,4},{20023402,1,100,4},{20023403,1,100,4}],
        ai_group = 2021,
        args = [],
        exp = 10375
    };
get(282909) ->
    #mon{
        mid = 282909,
        name = <<"姚伯当">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 269753, mp_lim = 9990, inner_att = 1944, outer_att = 1944, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282910) ->
    #mon{
        mid = 282910,
        name = <<"司马林">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 269753, mp_lim = 9990, inner_att = 1944, outer_att = 1944, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 2014
    };
get(282911) ->
    #mon{
        mid = 282911,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1618518, mp_lim = 9990, inner_att = 6806, outer_att = 6806, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281209,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,4},{20023702,1,100,4},{20023703,1,100,4}],
        ai_group = 2022,
        args = [],
        exp = 10375
    };
get(282912) ->
    #mon{
        mid = 282912,
        name = <<"包不同">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1348765, mp_lim = 9990, inner_att = 5834, outer_att = 5834, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 10375
    };
get(282913) ->
    #mon{
        mid = 282913,
        name = <<"风波恶">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1348765, mp_lim = 9990, inner_att = 5834, outer_att = 5834, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 10375
    };
get(282914) ->
    #mon{
        mid = 282914,
        name = <<"慕容复">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1942221, mp_lim = 9990, inner_att = 9724, outer_att = 9724, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281309,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 20610
    };
get(282915) ->
    #mon{
        mid = 282915,
        name = <<"慕容复·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2330665, mp_lim = 9990, inner_att = 12641, outer_att = 12641, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 281509,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,4},{20023902,1,100,4},{20023903,1,100,4}],
        ai_group = 2023,
        args = [],
        exp = 25763
    };
get(283001) ->
    #mon{
        mid = 283001,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1203, mp_lim = 49, inner_att = 20, outer_att = 20, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 335
    };
get(283002) ->
    #mon{
        mid = 283002,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 919, mp_lim = 49, inner_att = 16, outer_att = 16, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 65
    };
get(283003) ->
    #mon{
        mid = 283003,
        name = <<"闵墨">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6019, mp_lim = 49, inner_att = 61, outer_att = 61, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282001,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 667
    };
get(283004) ->
    #mon{
        mid = 283004,
        name = <<"秦韵">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7223, mp_lim = 49, inner_att = 71, outer_att = 71, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282101,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 667
    };
get(283005) ->
    #mon{
        mid = 283005,
        name = <<"陶青">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 8668, mp_lim = 49, inner_att = 102, outer_att = 102, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282201,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 2034,
        args = [],
        exp = 667
    };
get(283006) ->
    #mon{
        mid = 283006,
        name = <<"庞企">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 10402, mp_lim = 49, inner_att = 128, outer_att = 128, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282301,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 2031,
        args = [],
        exp = 667
    };
get(283007) ->
    #mon{
        mid = 283007,
        name = <<"青鹰">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 919, mp_lim = 49, inner_att = 16, outer_att = 16, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
get(283008) ->
    #mon{
        mid = 283008,
        name = <<"墨虎">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1203, mp_lim = 49, inner_att = 20, outer_att = 20, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
get(283009) ->
    #mon{
        mid = 283009,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1203, mp_lim = 49, inner_att = 20, outer_att = 20, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283010) ->
    #mon{
        mid = 283010,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 12482, mp_lim = 49, inner_att = 167, outer_att = 167, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282501,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 2031,
        args = [],
        exp = 1001
    };
get(283101) ->
    #mon{
        mid = 283101,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6903, mp_lim = 1330, inner_att = 62, outer_att = 62, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 671
    };
get(283102) ->
    #mon{
        mid = 283102,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5271, mp_lim = 1330, inner_att = 50, outer_att = 50, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 130
    };
get(283103) ->
    #mon{
        mid = 283103,
        name = <<"闵墨">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 34515, mp_lim = 1330, inner_att = 188, outer_att = 188, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282001,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 1334
    };
get(283104) ->
    #mon{
        mid = 283104,
        name = <<"秦韵">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 41418, mp_lim = 1330, inner_att = 220, outer_att = 220, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282101,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 1334
    };
get(283105) ->
    #mon{
        mid = 283105,
        name = <<"陶青">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 49701, mp_lim = 1330, inner_att = 314, outer_att = 314, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282201,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203401,
        args = [],
        exp = 1334
    };
get(283106) ->
    #mon{
        mid = 283106,
        name = <<"庞企">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 59642, mp_lim = 1330, inner_att = 393, outer_att = 393, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282301,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203101,
        args = [],
        exp = 1334
    };
get(283107) ->
    #mon{
        mid = 283107,
        name = <<"青鹰">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5271, mp_lim = 1330, inner_att = 50, outer_att = 50, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(283108) ->
    #mon{
        mid = 283108,
        name = <<"墨虎">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6903, mp_lim = 1330, inner_att = 62, outer_att = 62, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(283109) ->
    #mon{
        mid = 283109,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 6903, mp_lim = 1330, inner_att = 62, outer_att = 62, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283110) ->
    #mon{
        mid = 283110,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 71570, mp_lim = 1330, inner_att = 511, outer_att = 511, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282501,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203101,
        args = [],
        exp = 2002
    };
get(283201) ->
    #mon{
        mid = 283201,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 15258, mp_lim = 2413, inner_att = 124, outer_att = 124, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 1007
    };
get(283202) ->
    #mon{
        mid = 283202,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 11651, mp_lim = 2413, inner_att = 99, outer_att = 99, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 195
    };
get(283203) ->
    #mon{
        mid = 283203,
        name = <<"闵墨">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 76290, mp_lim = 2413, inner_att = 373, outer_att = 373, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282002,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 2002
    };
get(283204) ->
    #mon{
        mid = 283204,
        name = <<"秦韵">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 91548, mp_lim = 2413, inner_att = 436, outer_att = 436, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282102,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 2002
    };
get(283205) ->
    #mon{
        mid = 283205,
        name = <<"陶青">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 109858, mp_lim = 2413, inner_att = 623, outer_att = 623, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282202,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203402,
        args = [],
        exp = 2002
    };
get(283206) ->
    #mon{
        mid = 283206,
        name = <<"庞企">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 131829, mp_lim = 2413, inner_att = 778, outer_att = 778, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282302,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203102,
        args = [],
        exp = 2002
    };
get(283207) ->
    #mon{
        mid = 283207,
        name = <<"青鹰">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 11651, mp_lim = 2413, inner_att = 99, outer_att = 99, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(283208) ->
    #mon{
        mid = 283208,
        name = <<"墨虎">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 15258, mp_lim = 2413, inner_att = 124, outer_att = 124, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(283209) ->
    #mon{
        mid = 283209,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 15258, mp_lim = 2413, inner_att = 124, outer_att = 124, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283210) ->
    #mon{
        mid = 283210,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 158195, mp_lim = 2413, inner_att = 1012, outer_att = 1012, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282502,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203102,
        args = [],
        exp = 3003
    };
get(283301) ->
    #mon{
        mid = 283301,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 29046, mp_lim = 3495, inner_att = 226, outer_att = 226, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 1478
    };
get(283302) ->
    #mon{
        mid = 283302,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 22180, mp_lim = 3495, inner_att = 181, outer_att = 181, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 287
    };
get(283303) ->
    #mon{
        mid = 283303,
        name = <<"闵墨">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 145230, mp_lim = 3495, inner_att = 678, outer_att = 678, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282003,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 2936
    };
get(283304) ->
    #mon{
        mid = 283304,
        name = <<"秦韵">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 174276, mp_lim = 3495, inner_att = 791, outer_att = 791, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282103,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 2936
    };
get(283305) ->
    #mon{
        mid = 283305,
        name = <<"陶青">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 209131, mp_lim = 3495, inner_att = 1131, outer_att = 1131, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282203,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203403,
        args = [],
        exp = 2936
    };
get(283306) ->
    #mon{
        mid = 283306,
        name = <<"庞企">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 250957, mp_lim = 3495, inner_att = 1414, outer_att = 1414, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282303,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203103,
        args = [],
        exp = 2936
    };
get(283307) ->
    #mon{
        mid = 283307,
        name = <<"青鹰">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 22180, mp_lim = 3495, inner_att = 181, outer_att = 181, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(283308) ->
    #mon{
        mid = 283308,
        name = <<"墨虎">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 29046, mp_lim = 3495, inner_att = 226, outer_att = 226, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(283309) ->
    #mon{
        mid = 283309,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 29046, mp_lim = 3495, inner_att = 226, outer_att = 226, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283310) ->
    #mon{
        mid = 283310,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 301149, mp_lim = 3495, inner_att = 1838, outer_att = 1838, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282503,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203103,
        args = [],
        exp = 4404
    };
get(283401) ->
    #mon{
        mid = 283401,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 51769, mp_lim = 4578, inner_att = 393, outer_att = 393, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 1948
    };
get(283402) ->
    #mon{
        mid = 283402,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 39533, mp_lim = 4578, inner_att = 314, outer_att = 314, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 378
    };
get(283403) ->
    #mon{
        mid = 283403,
        name = <<"闵墨">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 258849, mp_lim = 4578, inner_att = 1179, outer_att = 1179, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282004,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 3870
    };
get(283404) ->
    #mon{
        mid = 283404,
        name = <<"秦韵">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 310619, mp_lim = 4578, inner_att = 1376, outer_att = 1376, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282104,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 3870
    };
get(283405) ->
    #mon{
        mid = 283405,
        name = <<"陶青">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 372742, mp_lim = 4578, inner_att = 1966, outer_att = 1966, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282204,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203404,
        args = [],
        exp = 3870
    };
get(283406) ->
    #mon{
        mid = 283406,
        name = <<"庞企">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 447291, mp_lim = 4578, inner_att = 2457, outer_att = 2457, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282304,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203104,
        args = [],
        exp = 3870
    };
get(283407) ->
    #mon{
        mid = 283407,
        name = <<"青鹰">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 39533, mp_lim = 4578, inner_att = 314, outer_att = 314, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(283408) ->
    #mon{
        mid = 283408,
        name = <<"墨虎">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 51769, mp_lim = 4578, inner_att = 393, outer_att = 393, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(283409) ->
    #mon{
        mid = 283409,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 51769, mp_lim = 4578, inner_att = 393, outer_att = 393, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283410) ->
    #mon{
        mid = 283410,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 536749, mp_lim = 4578, inner_att = 3195, outer_att = 3195, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282504,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203104,
        args = [],
        exp = 5806
    };
get(283501) ->
    #mon{
        mid = 283501,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 86684, mp_lim = 5660, inner_att = 647, outer_att = 647, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 2553
    };
get(283502) ->
    #mon{
        mid = 283502,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 66195, mp_lim = 5660, inner_att = 517, outer_att = 517, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(283503) ->
    #mon{
        mid = 283503,
        name = <<"闵墨">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 433422, mp_lim = 5660, inner_att = 1942, outer_att = 1942, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282005,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 5072
    };
get(283504) ->
    #mon{
        mid = 283504,
        name = <<"秦韵">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 520106, mp_lim = 5660, inner_att = 2265, outer_att = 2265, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282105,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 5072
    };
get(283505) ->
    #mon{
        mid = 283505,
        name = <<"陶青">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 624127, mp_lim = 5660, inner_att = 3236, outer_att = 3236, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282205,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203405,
        args = [],
        exp = 5072
    };
get(283506) ->
    #mon{
        mid = 283506,
        name = <<"庞企">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 748953, mp_lim = 5660, inner_att = 4045, outer_att = 4045, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282305,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203105,
        args = [],
        exp = 5072
    };
get(283507) ->
    #mon{
        mid = 283507,
        name = <<"青鹰">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 66195, mp_lim = 5660, inner_att = 517, outer_att = 517, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(283508) ->
    #mon{
        mid = 283508,
        name = <<"墨虎">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 86684, mp_lim = 5660, inner_att = 647, outer_att = 647, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(283509) ->
    #mon{
        mid = 283509,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 86684, mp_lim = 5660, inner_att = 647, outer_att = 647, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283510) ->
    #mon{
        mid = 283510,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 898743, mp_lim = 5660, inner_att = 5259, outer_att = 5259, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282505,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203105,
        args = [],
        exp = 7608
    };
get(283601) ->
    #mon{
        mid = 283601,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 130238, mp_lim = 6743, inner_att = 961, outer_att = 961, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 3830
    };
get(283602) ->
    #mon{
        mid = 283602,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 99454, mp_lim = 6743, inner_att = 769, outer_att = 769, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 743
    };
get(283603) ->
    #mon{
        mid = 283603,
        name = <<"闵墨">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 651191, mp_lim = 6743, inner_att = 2885, outer_att = 2885, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282006,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 7608
    };
get(283604) ->
    #mon{
        mid = 283604,
        name = <<"秦韵">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 781430, mp_lim = 6743, inner_att = 3366, outer_att = 3366, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282106,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 7608
    };
get(283605) ->
    #mon{
        mid = 283605,
        name = <<"陶青">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 937716, mp_lim = 6743, inner_att = 4809, outer_att = 4809, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282206,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203406,
        args = [],
        exp = 7608
    };
get(283606) ->
    #mon{
        mid = 283606,
        name = <<"庞企">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1125259, mp_lim = 6743, inner_att = 6012, outer_att = 6012, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282306,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203106,
        args = [],
        exp = 7608
    };
get(283607) ->
    #mon{
        mid = 283607,
        name = <<"青鹰">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 99454, mp_lim = 6743, inner_att = 769, outer_att = 769, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(283608) ->
    #mon{
        mid = 283608,
        name = <<"墨虎">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 130238, mp_lim = 6743, inner_att = 961, outer_att = 961, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(283609) ->
    #mon{
        mid = 283609,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 130238, mp_lim = 6743, inner_att = 961, outer_att = 961, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283610) ->
    #mon{
        mid = 283610,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1350311, mp_lim = 6743, inner_att = 7815, outer_att = 7815, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282506,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203106,
        args = [],
        exp = 11412
    };
get(283701) ->
    #mon{
        mid = 283701,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 182437, mp_lim = 7825, inner_att = 1335, outer_att = 1335, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 5778
    };
get(283702) ->
    #mon{
        mid = 283702,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 139316, mp_lim = 7825, inner_att = 1068, outer_att = 1068, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 1122
    };
get(283703) ->
    #mon{
        mid = 283703,
        name = <<"闵墨">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 912188, mp_lim = 7825, inner_att = 4007, outer_att = 4007, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282007,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 11479
    };
get(283704) ->
    #mon{
        mid = 283704,
        name = <<"秦韵">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1094626, mp_lim = 7825, inner_att = 4675, outer_att = 4675, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282107,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 11479
    };
get(283705) ->
    #mon{
        mid = 283705,
        name = <<"陶青">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1313551, mp_lim = 7825, inner_att = 6679, outer_att = 6679, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282207,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203407,
        args = [],
        exp = 11479
    };
get(283706) ->
    #mon{
        mid = 283706,
        name = <<"庞企">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1576262, mp_lim = 7825, inner_att = 8349, outer_att = 8349, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282307,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203107,
        args = [],
        exp = 11479
    };
get(283707) ->
    #mon{
        mid = 283707,
        name = <<"青鹰">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 139316, mp_lim = 7825, inner_att = 1068, outer_att = 1068, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(283708) ->
    #mon{
        mid = 283708,
        name = <<"墨虎">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 182437, mp_lim = 7825, inner_att = 1335, outer_att = 1335, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(283709) ->
    #mon{
        mid = 283709,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 182437, mp_lim = 7825, inner_att = 1335, outer_att = 1335, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283710) ->
    #mon{
        mid = 283710,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1891514, mp_lim = 7825, inner_att = 10853, outer_att = 10853, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282507,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203107,
        args = [],
        exp = 17219
    };
get(283801) ->
    #mon{
        mid = 283801,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 237020, mp_lim = 8908, inner_att = 1723, outer_att = 1723, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 11490
    };
get(283802) ->
    #mon{
        mid = 283802,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 180997, mp_lim = 8908, inner_att = 1378, outer_att = 1378, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 2231
    };
get(283803) ->
    #mon{
        mid = 283803,
        name = <<"闵墨">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1185104, mp_lim = 8908, inner_att = 5169, outer_att = 5169, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282008,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 22825
    };
get(283804) ->
    #mon{
        mid = 283804,
        name = <<"秦韵">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1422125, mp_lim = 8908, inner_att = 6030, outer_att = 6030, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282108,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 22825
    };
get(283805) ->
    #mon{
        mid = 283805,
        name = <<"陶青">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1706550, mp_lim = 8908, inner_att = 8615, outer_att = 8615, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282208,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203408,
        args = [],
        exp = 22825
    };
get(283806) ->
    #mon{
        mid = 283806,
        name = <<"庞企">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2047860, mp_lim = 8908, inner_att = 10769, outer_att = 10769, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282308,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203108,
        args = [],
        exp = 22825
    };
get(283807) ->
    #mon{
        mid = 283807,
        name = <<"青鹰">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 180997, mp_lim = 8908, inner_att = 1378, outer_att = 1378, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(283808) ->
    #mon{
        mid = 283808,
        name = <<"墨虎">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 237020, mp_lim = 8908, inner_att = 1723, outer_att = 1723, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(283809) ->
    #mon{
        mid = 283809,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 237020, mp_lim = 8908, inner_att = 1723, outer_att = 1723, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283810) ->
    #mon{
        mid = 283810,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2457432, mp_lim = 8908, inner_att = 13999, outer_att = 13999, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282508,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203108,
        args = [],
        exp = 34237
    };
get(283901) ->
    #mon{
        mid = 283901,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 296728, mp_lim = 9990, inner_att = 2139, outer_att = 2139, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 18344
    };
get(283902) ->
    #mon{
        mid = 283902,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 226592, mp_lim = 9990, inner_att = 1711, outer_att = 1711, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 3562
    };
get(283903) ->
    #mon{
        mid = 283903,
        name = <<"闵墨">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1483641, mp_lim = 9990, inner_att = 6417, outer_att = 6417, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282009,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4}],
        ai_group = 2032,
        args = [],
        exp = 36440
    };
get(283904) ->
    #mon{
        mid = 283904,
        name = <<"秦韵">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1780369, mp_lim = 9990, inner_att = 7487, outer_att = 7487, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282109,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4}],
        ai_group = 2033,
        args = [],
        exp = 36440
    };
get(283905) ->
    #mon{
        mid = 283905,
        name = <<"陶青">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2136443, mp_lim = 9990, inner_att = 10696, outer_att = 10696, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282209,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4}],
        ai_group = 203409,
        args = [],
        exp = 36440
    };
get(283906) ->
    #mon{
        mid = 283906,
        name = <<"庞企">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2563732, mp_lim = 9990, inner_att = 13370, outer_att = 13370, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282309,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203109,
        args = [],
        exp = 36440
    };
get(283907) ->
    #mon{
        mid = 283907,
        name = <<"青鹰">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 226592, mp_lim = 9990, inner_att = 1711, outer_att = 1711, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(283908) ->
    #mon{
        mid = 283908,
        name = <<"墨虎">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 296728, mp_lim = 9990, inner_att = 2139, outer_att = 2139, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(283909) ->
    #mon{
        mid = 283909,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 296728, mp_lim = 9990, inner_att = 2139, outer_att = 2139, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 2035,
        args = [],
        exp = 0
    };
get(283910) ->
    #mon{
        mid = 283910,
        name = <<"庞企·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3076479, mp_lim = 9990, inner_att = 17381, outer_att = 17381, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 282509,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4}],
        ai_group = 203109,
        args = [],
        exp = 54660
    };
get(284001) ->
    #mon{
        mid = 284001,
        name = <<"僵尸">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 1011, mp_lim = 49, inner_att = 18, outer_att = 18, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
get(284002) ->
    #mon{
        mid = 284002,
        name = <<"哈大霸">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 3310, mp_lim = 49, inner_att = 22, outer_att = 22, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283001,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 335
    };
get(284003) ->
    #mon{
        mid = 284003,
        name = <<"桑土公">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 6621, mp_lim = 49, inner_att = 67, outer_att = 67, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283101,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 2045,
        args = [],
        exp = 887
    };
get(284004) ->
    #mon{
        mid = 284004,
        name = <<"乌老大">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7946, mp_lim = 49, inner_att = 79, outer_att = 79, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283201,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 887
    };
get(284005) ->
    #mon{
        mid = 284005,
        name = <<"卓不凡">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7946, mp_lim = 49, inner_att = 79, outer_att = 79, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 2043,
        args = [],
        exp = 887
    };
get(284006) ->
    #mon{
        mid = 284006,
        name = <<"不平道人">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 9535, mp_lim = 49, inner_att = 113, outer_att = 113, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 2044,
        args = [],
        exp = 887
    };
get(284007) ->
    #mon{
        mid = 284007,
        name = <<"任平生">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 9535, mp_lim = 49, inner_att = 113, outer_att = 113, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
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
        exp = 887
    };
get(284008) ->
    #mon{
        mid = 284008,
        name = <<"李秋水">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 11442, mp_lim = 49, inner_att = 141, outer_att = 141, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283401,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 887
    };
get(284009) ->
    #mon{
        mid = 284009,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 13730, mp_lim = 49, inner_att = 183, outer_att = 183, inner_def = 10, outer_def = 10, hit = 145, dodge = 10, crit_hurt = 14, crit_def = 3, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283501,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 1331
    };
get(284101) ->
    #mon{
        mid = 284101,
        name = <<"僵尸">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 5798, mp_lim = 1330, inner_att = 55, outer_att = 55, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
get(284102) ->
    #mon{
        mid = 284102,
        name = <<"哈大霸">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 18983, mp_lim = 1330, inner_att = 69, outer_att = 69, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283001,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 671
    };
get(284103) ->
    #mon{
        mid = 284103,
        name = <<"桑土公">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 37966, mp_lim = 1330, inner_att = 207, outer_att = 207, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283101,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204501,
        args = [],
        exp = 1775
    };
get(284104) ->
    #mon{
        mid = 284104,
        name = <<"乌老大">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 45560, mp_lim = 1330, inner_att = 242, outer_att = 242, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283201,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 1775
    };
get(284105) ->
    #mon{
        mid = 284105,
        name = <<"卓不凡">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 45560, mp_lim = 1330, inner_att = 242, outer_att = 242, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204301,
        args = [],
        exp = 1775
    };
get(284106) ->
    #mon{
        mid = 284106,
        name = <<"不平道人">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 54672, mp_lim = 1330, inner_att = 346, outer_att = 346, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204401,
        args = [],
        exp = 1775
    };
get(284107) ->
    #mon{
        mid = 284107,
        name = <<"任平生">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 54672, mp_lim = 1330, inner_att = 346, outer_att = 346, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 1775
    };
get(284108) ->
    #mon{
        mid = 284108,
        name = <<"李秋水">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 65606, mp_lim = 1330, inner_att = 432, outer_att = 432, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283401,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 1775
    };
get(284109) ->
    #mon{
        mid = 284109,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 11,
        attr = #bt_attr{hp_lim = 78727, mp_lim = 1330, inner_att = 562, outer_att = 562, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283501,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 2663
    };
get(284201) ->
    #mon{
        mid = 284201,
        name = <<"僵尸">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 12816, mp_lim = 2413, inner_att = 109, outer_att = 109, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
get(284202) ->
    #mon{
        mid = 284202,
        name = <<"哈大霸">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 41959, mp_lim = 2413, inner_att = 137, outer_att = 137, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283002,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 1007
    };
get(284203) ->
    #mon{
        mid = 284203,
        name = <<"桑土公">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 83919, mp_lim = 2413, inner_att = 411, outer_att = 411, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283102,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204502,
        args = [],
        exp = 2663
    };
get(284204) ->
    #mon{
        mid = 284204,
        name = <<"乌老大">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 100703, mp_lim = 2413, inner_att = 479, outer_att = 479, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283202,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 2663
    };
get(284205) ->
    #mon{
        mid = 284205,
        name = <<"卓不凡">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 100703, mp_lim = 2413, inner_att = 479, outer_att = 479, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204302,
        args = [],
        exp = 2663
    };
get(284206) ->
    #mon{
        mid = 284206,
        name = <<"不平道人">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 120844, mp_lim = 2413, inner_att = 685, outer_att = 685, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204402,
        args = [],
        exp = 2663
    };
get(284207) ->
    #mon{
        mid = 284207,
        name = <<"任平生">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 120844, mp_lim = 2413, inner_att = 685, outer_att = 685, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
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
        exp = 2663
    };
get(284208) ->
    #mon{
        mid = 284208,
        name = <<"李秋水">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 145012, mp_lim = 2413, inner_att = 856, outer_att = 856, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283402,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 2663
    };
get(284209) ->
    #mon{
        mid = 284209,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 174015, mp_lim = 2413, inner_att = 1113, outer_att = 1113, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283502,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 3994
    };
get(284301) ->
    #mon{
        mid = 284301,
        name = <<"僵尸">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 24398, mp_lim = 3495, inner_att = 199, outer_att = 199, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
get(284302) ->
    #mon{
        mid = 284302,
        name = <<"哈大霸">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 79876, mp_lim = 3495, inner_att = 248, outer_att = 248, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283003,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 1478
    };
get(284303) ->
    #mon{
        mid = 284303,
        name = <<"桑土公">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 159753, mp_lim = 3495, inner_att = 746, outer_att = 746, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283103,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204503,
        args = [],
        exp = 3906
    };
get(284304) ->
    #mon{
        mid = 284304,
        name = <<"乌老大">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 191703, mp_lim = 3495, inner_att = 871, outer_att = 871, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283203,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 3906
    };
get(284305) ->
    #mon{
        mid = 284305,
        name = <<"卓不凡">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 191703, mp_lim = 3495, inner_att = 871, outer_att = 871, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204303,
        args = [],
        exp = 3906
    };
get(284306) ->
    #mon{
        mid = 284306,
        name = <<"不平道人">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 230044, mp_lim = 3495, inner_att = 1244, outer_att = 1244, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204403,
        args = [],
        exp = 3906
    };
get(284307) ->
    #mon{
        mid = 284307,
        name = <<"任平生">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 230044, mp_lim = 3495, inner_att = 1244, outer_att = 1244, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
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
        exp = 3906
    };
get(284308) ->
    #mon{
        mid = 284308,
        name = <<"李秋水">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 276053, mp_lim = 3495, inner_att = 1555, outer_att = 1555, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283403,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 3906
    };
get(284309) ->
    #mon{
        mid = 284309,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 31,
        attr = #bt_attr{hp_lim = 331264, mp_lim = 3495, inner_att = 2022, outer_att = 2022, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283503,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 5859
    };
get(284401) ->
    #mon{
        mid = 284401,
        name = <<"僵尸">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 43486, mp_lim = 4578, inner_att = 346, outer_att = 346, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
get(284402) ->
    #mon{
        mid = 284402,
        name = <<"哈大霸">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 142367, mp_lim = 4578, inner_att = 432, outer_att = 432, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283004,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 1948
    };
get(284403) ->
    #mon{
        mid = 284403,
        name = <<"桑土公">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 284734, mp_lim = 4578, inner_att = 1297, outer_att = 1297, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283104,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204504,
        args = [],
        exp = 5149
    };
get(284404) ->
    #mon{
        mid = 284404,
        name = <<"乌老大">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 341681, mp_lim = 4578, inner_att = 1514, outer_att = 1514, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283204,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 5149
    };
get(284405) ->
    #mon{
        mid = 284405,
        name = <<"卓不凡">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 341681, mp_lim = 4578, inner_att = 1514, outer_att = 1514, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204304,
        args = [],
        exp = 5149
    };
get(284406) ->
    #mon{
        mid = 284406,
        name = <<"不平道人">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 410017, mp_lim = 4578, inner_att = 2162, outer_att = 2162, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204404,
        args = [],
        exp = 5149
    };
get(284407) ->
    #mon{
        mid = 284407,
        name = <<"任平生">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 410017, mp_lim = 4578, inner_att = 2162, outer_att = 2162, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
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
        exp = 5149
    };
get(284408) ->
    #mon{
        mid = 284408,
        name = <<"李秋水">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 492020, mp_lim = 4578, inner_att = 2703, outer_att = 2703, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283404,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 5149
    };
get(284409) ->
    #mon{
        mid = 284409,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 41,
        attr = #bt_attr{hp_lim = 590424, mp_lim = 4578, inner_att = 3514, outer_att = 3514, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283504,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 7723
    };
get(284501) ->
    #mon{
        mid = 284501,
        name = <<"僵尸">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 72814, mp_lim = 5660, inner_att = 569, outer_att = 569, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
get(284502) ->
    #mon{
        mid = 284502,
        name = <<"哈大霸">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 238382, mp_lim = 5660, inner_att = 712, outer_att = 712, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283005,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 2553
    };
get(284503) ->
    #mon{
        mid = 284503,
        name = <<"桑土公">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 476764, mp_lim = 5660, inner_att = 2136, outer_att = 2136, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283105,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204505,
        args = [],
        exp = 6747
    };
get(284504) ->
    #mon{
        mid = 284504,
        name = <<"乌老大">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 572117, mp_lim = 5660, inner_att = 2492, outer_att = 2492, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283205,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 6747
    };
get(284505) ->
    #mon{
        mid = 284505,
        name = <<"卓不凡">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 572117, mp_lim = 5660, inner_att = 2492, outer_att = 2492, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204305,
        args = [],
        exp = 6747
    };
get(284506) ->
    #mon{
        mid = 284506,
        name = <<"不平道人">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 686540, mp_lim = 5660, inner_att = 3560, outer_att = 3560, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204405,
        args = [],
        exp = 6747
    };
get(284507) ->
    #mon{
        mid = 284507,
        name = <<"任平生">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 686540, mp_lim = 5660, inner_att = 3560, outer_att = 3560, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
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
        exp = 6747
    };
get(284508) ->
    #mon{
        mid = 284508,
        name = <<"李秋水">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 823848, mp_lim = 5660, inner_att = 4450, outer_att = 4450, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283405,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 6747
    };
get(284509) ->
    #mon{
        mid = 284509,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 988618, mp_lim = 5660, inner_att = 5785, outer_att = 5785, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283505,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 10120
    };
get(284601) ->
    #mon{
        mid = 284601,
        name = <<"僵尸">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 109400, mp_lim = 6743, inner_att = 846, outer_att = 846, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
get(284602) ->
    #mon{
        mid = 284602,
        name = <<"哈大霸">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 358155, mp_lim = 6743, inner_att = 1058, outer_att = 1058, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283006,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 3830
    };
get(284603) ->
    #mon{
        mid = 284603,
        name = <<"桑土公">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 716310, mp_lim = 6743, inner_att = 3174, outer_att = 3174, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283106,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204506,
        args = [],
        exp = 10120
    };
get(284604) ->
    #mon{
        mid = 284604,
        name = <<"乌老大">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 859573, mp_lim = 6743, inner_att = 3703, outer_att = 3703, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283206,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 10120
    };
get(284605) ->
    #mon{
        mid = 284605,
        name = <<"卓不凡">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 859573, mp_lim = 6743, inner_att = 3703, outer_att = 3703, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204306,
        args = [],
        exp = 10120
    };
get(284606) ->
    #mon{
        mid = 284606,
        name = <<"不平道人">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1031487, mp_lim = 6743, inner_att = 5290, outer_att = 5290, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204406,
        args = [],
        exp = 10120
    };
get(284607) ->
    #mon{
        mid = 284607,
        name = <<"任平生">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1031487, mp_lim = 6743, inner_att = 5290, outer_att = 5290, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
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
        exp = 10120
    };
get(284608) ->
    #mon{
        mid = 284608,
        name = <<"李秋水">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1237785, mp_lim = 6743, inner_att = 6613, outer_att = 6613, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283406,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 10120
    };
get(284609) ->
    #mon{
        mid = 284609,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 61,
        attr = #bt_attr{hp_lim = 1485342, mp_lim = 6743, inner_att = 8597, outer_att = 8597, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283506,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 15180
    };
get(284701) ->
    #mon{
        mid = 284701,
        name = <<"僵尸">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 153247, mp_lim = 7825, inner_att = 1175, outer_att = 1175, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
get(284702) ->
    #mon{
        mid = 284702,
        name = <<"哈大霸">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 501703, mp_lim = 7825, inner_att = 1469, outer_att = 1469, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283007,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 5778
    };
get(284703) ->
    #mon{
        mid = 284703,
        name = <<"桑土公">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1003407, mp_lim = 7825, inner_att = 4408, outer_att = 4408, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283107,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204507,
        args = [],
        exp = 15269
    };
get(284704) ->
    #mon{
        mid = 284704,
        name = <<"乌老大">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1204089, mp_lim = 7825, inner_att = 5142, outer_att = 5142, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283207,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 15269
    };
get(284705) ->
    #mon{
        mid = 284705,
        name = <<"卓不凡">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1204089, mp_lim = 7825, inner_att = 5142, outer_att = 5142, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204307,
        args = [],
        exp = 15269
    };
get(284706) ->
    #mon{
        mid = 284706,
        name = <<"不平道人">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1444906, mp_lim = 7825, inner_att = 7347, outer_att = 7347, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204407,
        args = [],
        exp = 15269
    };
get(284707) ->
    #mon{
        mid = 284707,
        name = <<"任平生">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1444906, mp_lim = 7825, inner_att = 7347, outer_att = 7347, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
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
        exp = 15269
    };
get(284708) ->
    #mon{
        mid = 284708,
        name = <<"李秋水">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 1733888, mp_lim = 7825, inner_att = 9183, outer_att = 9183, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283407,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 15269
    };
get(284709) ->
    #mon{
        mid = 284709,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 71,
        attr = #bt_attr{hp_lim = 2080666, mp_lim = 7825, inner_att = 11939, outer_att = 11939, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283507,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 22904
    };
get(284801) ->
    #mon{
        mid = 284801,
        name = <<"僵尸">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 199097, mp_lim = 8908, inner_att = 1516, outer_att = 1516, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
get(284802) ->
    #mon{
        mid = 284802,
        name = <<"哈大霸">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 651807, mp_lim = 8908, inner_att = 1895, outer_att = 1895, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283008,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 11490
    };
get(284803) ->
    #mon{
        mid = 284803,
        name = <<"桑土公">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1303614, mp_lim = 8908, inner_att = 5686, outer_att = 5686, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283108,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204508,
        args = [],
        exp = 30361
    };
get(284804) ->
    #mon{
        mid = 284804,
        name = <<"乌老大">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1564337, mp_lim = 8908, inner_att = 6633, outer_att = 6633, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283208,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 30361
    };
get(284805) ->
    #mon{
        mid = 284805,
        name = <<"卓不凡">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1564337, mp_lim = 8908, inner_att = 6633, outer_att = 6633, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204308,
        args = [],
        exp = 30361
    };
get(284806) ->
    #mon{
        mid = 284806,
        name = <<"不平道人">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1877205, mp_lim = 8908, inner_att = 9476, outer_att = 9476, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204408,
        args = [],
        exp = 30361
    };
get(284807) ->
    #mon{
        mid = 284807,
        name = <<"任平生">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1877205, mp_lim = 8908, inner_att = 9476, outer_att = 9476, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
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
        exp = 30361
    };
get(284808) ->
    #mon{
        mid = 284808,
        name = <<"李秋水">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2252646, mp_lim = 8908, inner_att = 11845, outer_att = 11845, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283408,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 30361
    };
get(284809) ->
    #mon{
        mid = 284809,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 2703175, mp_lim = 8908, inner_att = 15399, outer_att = 15399, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283508,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 45542
    };
get(284901) ->
    #mon{
        mid = 284901,
        name = <<"僵尸">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 249251, mp_lim = 9990, inner_att = 1882, outer_att = 1882, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
get(284902) ->
    #mon{
        mid = 284902,
        name = <<"哈大霸">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 816002, mp_lim = 9990, inner_att = 2353, outer_att = 2353, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283009,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,4}],
        ai_group = 2041,
        args = [],
        exp = 18344
    };
get(284903) ->
    #mon{
        mid = 284903,
        name = <<"桑土公">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1632005, mp_lim = 9990, inner_att = 7059, outer_att = 7059, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283109,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,4},{20024203,1,100,4}],
        ai_group = 204509,
        args = [],
        exp = 48471
    };
get(284904) ->
    #mon{
        mid = 284904,
        name = <<"乌老大">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1958406, mp_lim = 9990, inner_att = 8236, outer_att = 8236, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283209,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,4}],
        ai_group = 2042,
        args = [],
        exp = 48471
    };
get(284905) ->
    #mon{
        mid = 284905,
        name = <<"卓不凡">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 1958406, mp_lim = 9990, inner_att = 8236, outer_att = 8236, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,4}],
        ai_group = 204309,
        args = [],
        exp = 48471
    };
get(284906) ->
    #mon{
        mid = 284906,
        name = <<"不平道人">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2350088, mp_lim = 9990, inner_att = 11766, outer_att = 11766, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 280000,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,4}],
        ai_group = 204409,
        args = [],
        exp = 48471
    };
get(284907) ->
    #mon{
        mid = 284907,
        name = <<"任平生">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2350088, mp_lim = 9990, inner_att = 11766, outer_att = 11766, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
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
        exp = 48471
    };
get(284908) ->
    #mon{
        mid = 284908,
        name = <<"李秋水">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 2820105, mp_lim = 9990, inner_att = 14707, outer_att = 14707, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283409,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 48471
    };
get(284909) ->
    #mon{
        mid = 284909,
        name = <<"李秋水·狂">>,
        boss = 1,
        level = 91,
        attr = #bt_attr{hp_lim = 3384126, mp_lim = 9990, inner_att = 19119, outer_att = 19119, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 283509,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,4}],
        ai_group = 2047,
        args = [],
        exp = 72707
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

