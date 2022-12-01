%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_25
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_25).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(250001) ->
    #mon{
        mid = 250001,
        name = <<"向望海">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 4308, mp_lim = 464, inner_att = 69, outer_att = 69, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250002) ->
    #mon{
        mid = 250002,
        name = <<"灵鹫使者">>,
        boss = 0,
        level = 5,
        attr = #bt_attr{hp_lim = 6396, mp_lim = 681, inner_att = 87, outer_att = 87, inner_def = 23, outer_def = 23, hit = 275, dodge = 22, crit_hurt = 27, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250003) ->
    #mon{
        mid = 250003,
        name = <<"深谷猿王">>,
        boss = 0,
        level = 7,
        attr = #bt_attr{hp_lim = 8652, mp_lim = 897, inner_att = 108, outer_att = 108, inner_def = 31, outer_def = 31, hit = 347, dodge = 28, crit_hurt = 34, crit_def = 7, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250004) ->
    #mon{
        mid = 250004,
        name = <<"大宋枪兵">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 11088, mp_lim = 1114, inner_att = 132, outer_att = 132, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250005) ->
    #mon{
        mid = 250005,
        name = <<"闪电貂">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 14940, mp_lim = 1436, inner_att = 168, outer_att = 168, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250006) ->
    #mon{
        mid = 250006,
        name = <<"山寨喽啰">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 19416, mp_lim = 1763, inner_att = 207, outer_att = 207, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250007) ->
    #mon{
        mid = 250007,
        name = <<"余毒">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 24036, mp_lim = 2085, inner_att = 252, outer_att = 252, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250008) ->
    #mon{
        mid = 250008,
        name = <<"山寨匪徒">>,
        boss = 0,
        level = 20,
        attr = #bt_attr{hp_lim = 27864, mp_lim = 2302, inner_att = 288, outer_att = 288, inner_def = 94, outer_def = 94, hit = 960, dodge = 84, crit_hurt = 93, crit_def = 22, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250009) ->
    #mon{
        mid = 250009,
        name = <<"木婉清">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 32472, mp_lim = 2518, inner_att = 330, outer_att = 330, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250010) ->
    #mon{
        mid = 250010,
        name = <<"葛荣">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 37416, mp_lim = 2735, inner_att = 375, outer_att = 375, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250011) ->
    #mon{
        mid = 250011,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 40176, mp_lim = 2846, inner_att = 399, outer_att = 399, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250012) ->
    #mon{
        mid = 250012,
        name = <<"墨虎">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 40176, mp_lim = 2846, inner_att = 399, outer_att = 399, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250013) ->
    #mon{
        mid = 250013,
        name = <<"大将军">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 40176, mp_lim = 2846, inner_att = 399, outer_att = 399, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250014) ->
    #mon{
        mid = 250014,
        name = <<"摘星子">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 40176, mp_lim = 2846, inner_att = 399, outer_att = 399, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250015) ->
    #mon{
        mid = 250015,
        name = <<"出尘子">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 40176, mp_lim = 2846, inner_att = 399, outer_att = 399, inner_def = 134, outer_def = 134, hit = 1352, dodge = 121, crit_hurt = 132, crit_def = 31, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250016) ->
    #mon{
        mid = 250016,
        name = <<"心魔守卫">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 42696, mp_lim = 2951, inner_att = 423, outer_att = 423, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250017) ->
    #mon{
        mid = 250017,
        name = <<"心魔">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 42696, mp_lim = 2951, inner_att = 423, outer_att = 423, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250018) ->
    #mon{
        mid = 250018,
        name = <<"青城弟子">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 42696, mp_lim = 2951, inner_att = 423, outer_att = 423, inner_def = 143, outer_def = 143, hit = 1435, dodge = 128, crit_hurt = 138, crit_def = 32, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250019) ->
    #mon{
        mid = 250019,
        name = <<"司马林">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 45648, mp_lim = 3062, inner_att = 450, outer_att = 450, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250020) ->
    #mon{
        mid = 250020,
        name = <<"远古棋魂">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 45648, mp_lim = 3062, inner_att = 450, outer_att = 450, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250021) ->
    #mon{
        mid = 250021,
        name = <<"神农帮弟子">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 45648, mp_lim = 3062, inner_att = 450, outer_att = 450, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250022) ->
    #mon{
        mid = 250022,
        name = <<"神农帮精英">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 48324, mp_lim = 3168, inner_att = 477, outer_att = 477, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250023) ->
    #mon{
        mid = 250023,
        name = <<"小熊">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 48324, mp_lim = 3168, inner_att = 477, outer_att = 477, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250024) ->
    #mon{
        mid = 250024,
        name = <<"神农帮舵主">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 48324, mp_lim = 3168, inner_att = 477, outer_att = 477, inner_def = 161, outer_def = 161, hit = 1615, dodge = 144, crit_hurt = 156, crit_def = 37, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250025) ->
    #mon{
        mid = 250025,
        name = <<"星罗小卒">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 51456, mp_lim = 3279, inner_att = 504, outer_att = 504, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250026) ->
    #mon{
        mid = 250026,
        name = <<"神农帮护法">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 51456, mp_lim = 3279, inner_att = 504, outer_att = 504, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250027) ->
    #mon{
        mid = 250027,
        name = <<"江湖杀手">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 51456, mp_lim = 3279, inner_att = 504, outer_att = 504, inner_def = 171, outer_def = 171, hit = 1712, dodge = 154, crit_hurt = 167, crit_def = 39, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250028) ->
    #mon{
        mid = 250028,
        name = <<"江湖护卫">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 54300, mp_lim = 3384, inner_att = 531, outer_att = 531, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250029) ->
    #mon{
        mid = 250029,
        name = <<"征东将领">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 54300, mp_lim = 3384, inner_att = 531, outer_att = 531, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250030) ->
    #mon{
        mid = 250030,
        name = <<"太古龙魂">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 54300, mp_lim = 3384, inner_att = 531, outer_att = 531, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250031) ->
    #mon{
        mid = 250031,
        name = <<"蒙面杀手">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 57612, mp_lim = 3495, inner_att = 561, outer_att = 561, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250032) ->
    #mon{
        mid = 250032,
        name = <<"杀手首领">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 57612, mp_lim = 3495, inner_att = 561, outer_att = 561, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250033) ->
    #mon{
        mid = 250033,
        name = <<"红熊王">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 57612, mp_lim = 3495, inner_att = 561, outer_att = 561, inner_def = 191, outer_def = 191, hit = 1905, dodge = 172, crit_hurt = 186, crit_def = 43, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250034) ->
    #mon{
        mid = 250034,
        name = <<"吴用">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 60612, mp_lim = 3601, inner_att = 588, outer_att = 588, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250035) ->
    #mon{
        mid = 250035,
        name = <<"司空玄">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 60612, mp_lim = 3601, inner_att = 588, outer_att = 588, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250036) ->
    #mon{
        mid = 250036,
        name = <<"四绝殿护卫">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 60612, mp_lim = 3601, inner_att = 588, outer_att = 588, inner_def = 202, outer_def = 202, hit = 2004, dodge = 181, crit_hurt = 194, crit_def = 46, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250037) ->
    #mon{
        mid = 250037,
        name = <<"四绝殿教头">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 64104, mp_lim = 3712, inner_att = 621, outer_att = 621, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250038) ->
    #mon{
        mid = 250038,
        name = <<"陶青">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 64104, mp_lim = 3712, inner_att = 621, outer_att = 621, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250039) ->
    #mon{
        mid = 250039,
        name = <<"岳老三">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 64104, mp_lim = 3712, inner_att = 621, outer_att = 621, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250040) ->
    #mon{
        mid = 250040,
        name = <<"魔君黄玮佳">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 67272, mp_lim = 3817, inner_att = 648, outer_att = 648, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250041) ->
    #mon{
        mid = 250041,
        name = <<"一品堂卫士">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 67272, mp_lim = 3817, inner_att = 648, outer_att = 648, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250042) ->
    #mon{
        mid = 250042,
        name = <<"一品堂刀客">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 67272, mp_lim = 3817, inner_att = 648, outer_att = 648, inner_def = 223, outer_def = 223, hit = 2215, dodge = 200, crit_hurt = 214, crit_def = 50, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250043) ->
    #mon{
        mid = 250043,
        name = <<"一品堂豪侠">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 70944, mp_lim = 3928, inner_att = 681, outer_att = 681, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250044) ->
    #mon{
        mid = 250044,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 70944, mp_lim = 3928, inner_att = 681, outer_att = 681, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250045) ->
    #mon{
        mid = 250045,
        name = <<"姚伯当">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 70944, mp_lim = 3928, inner_att = 681, outer_att = 681, inner_def = 235, outer_def = 235, hit = 2326, dodge = 211, crit_hurt = 226, crit_def = 53, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250046) ->
    #mon{
        mid = 250046,
        name = <<"三十六洞弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 74280, mp_lim = 4034, inner_att = 714, outer_att = 714, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250047) ->
    #mon{
        mid = 250047,
        name = <<"卓不凡">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 74280, mp_lim = 4034, inner_att = 714, outer_att = 714, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250048) ->
    #mon{
        mid = 250048,
        name = <<"七十二岛弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 74280, mp_lim = 4034, inner_att = 714, outer_att = 714, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250049) ->
    #mon{
        mid = 250049,
        name = <<"哈大霸">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 79788, mp_lim = 4145, inner_att = 762, outer_att = 762, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250050) ->
    #mon{
        mid = 250050,
        name = <<"叶二娘">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 79788, mp_lim = 4145, inner_att = 762, outer_att = 762, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250051) ->
    #mon{
        mid = 250051,
        name = <<"吐蕃喇嘛">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 79788, mp_lim = 4145, inner_att = 762, outer_att = 762, inner_def = 264, outer_def = 264, hit = 2608, dodge = 237, crit_hurt = 255, crit_def = 60, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250052) ->
    #mon{
        mid = 250052,
        name = <<"三十六洞弟子">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 85020, mp_lim = 4250, inner_att = 813, outer_att = 813, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250053) ->
    #mon{
        mid = 250053,
        name = <<"乌老大">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 85020, mp_lim = 4250, inner_att = 813, outer_att = 813, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250054) ->
    #mon{
        mid = 250054,
        name = <<"七十二岛弟子">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 85020, mp_lim = 4250, inner_att = 813, outer_att = 813, inner_def = 282, outer_def = 282, hit = 2778, dodge = 252, crit_hurt = 269, crit_def = 64, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250055) ->
    #mon{
        mid = 250055,
        name = <<"桑土公">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 90900, mp_lim = 4361, inner_att = 867, outer_att = 867, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250056) ->
    #mon{
        mid = 250056,
        name = <<"缥缈峰弟子">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 90900, mp_lim = 4361, inner_att = 867, outer_att = 867, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250057) ->
    #mon{
        mid = 250057,
        name = <<"不平道人">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 90900, mp_lim = 4361, inner_att = 867, outer_att = 867, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250058) ->
    #mon{
        mid = 250058,
        name = <<"姚伯当">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 96456, mp_lim = 4467, inner_att = 918, outer_att = 918, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250059) ->
    #mon{
        mid = 250059,
        name = <<"慕容氏弟子">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 96456, mp_lim = 4467, inner_att = 918, outer_att = 918, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250060) ->
    #mon{
        mid = 250060,
        name = <<"段延庆">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 96456, mp_lim = 4467, inner_att = 918, outer_att = 918, inner_def = 319, outer_def = 319, hit = 3141, dodge = 286, crit_hurt = 304, crit_def = 72, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250061) ->
    #mon{
        mid = 250061,
        name = <<"三十六洞弟子">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 102684, mp_lim = 4578, inner_att = 975, outer_att = 975, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250062) ->
    #mon{
        mid = 250062,
        name = <<"慕容氏护卫">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 102684, mp_lim = 4578, inner_att = 975, outer_att = 975, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250063) ->
    #mon{
        mid = 250063,
        name = <<"风波恶">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 102684, mp_lim = 4578, inner_att = 975, outer_att = 975, inner_def = 339, outer_def = 339, hit = 3336, dodge = 305, crit_hurt = 325, crit_def = 77, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250064) ->
    #mon{
        mid = 250064,
        name = <<"慕容氏卫士">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 108564, mp_lim = 4683, inner_att = 1029, outer_att = 1029, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250065) ->
    #mon{
        mid = 250065,
        name = <<"左子穆">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 108564, mp_lim = 4683, inner_att = 1029, outer_att = 1029, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250066) ->
    #mon{
        mid = 250066,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 108564, mp_lim = 4683, inner_att = 1029, outer_att = 1029, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250067) ->
    #mon{
        mid = 250067,
        name = <<"包不同">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 115164, mp_lim = 4794, inner_att = 1089, outer_att = 1089, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250068) ->
    #mon{
        mid = 250068,
        name = <<"山猪">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 115164, mp_lim = 4794, inner_att = 1089, outer_att = 1089, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250069) ->
    #mon{
        mid = 250069,
        name = <<"星宿派三师弟">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 115164, mp_lim = 4794, inner_att = 1089, outer_att = 1089, inner_def = 380, outer_def = 380, hit = 3730, dodge = 340, crit_hurt = 363, crit_def = 86, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250070) ->
    #mon{
        mid = 250070,
        name = <<"刺客蔡骏阳">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 121368, mp_lim = 4900, inner_att = 1146, outer_att = 1146, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250071) ->
    #mon{
        mid = 250071,
        name = <<"梁上君子">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 121368, mp_lim = 4900, inner_att = 1146, outer_att = 1146, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250072) ->
    #mon{
        mid = 250072,
        name = <<"大虎">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 121368, mp_lim = 4900, inner_att = 1146, outer_att = 1146, inner_def = 401, outer_def = 401, hit = 3932, dodge = 358, crit_hurt = 381, crit_def = 90, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250073) ->
    #mon{
        mid = 250073,
        name = <<"马贼">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 128328, mp_lim = 5011, inner_att = 1209, outer_att = 1209, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250074) ->
    #mon{
        mid = 250074,
        name = <<"江湖妖女">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 128328, mp_lim = 5011, inner_att = 1209, outer_att = 1209, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250075) ->
    #mon{
        mid = 250075,
        name = <<"岩魂">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 128328, mp_lim = 5011, inner_att = 1209, outer_att = 1209, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250076) ->
    #mon{
        mid = 250076,
        name = <<"神秘剑士">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 134856, mp_lim = 5116, inner_att = 1269, outer_att = 1269, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250077) ->
    #mon{
        mid = 250077,
        name = <<"江湖弟子">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 134856, mp_lim = 5116, inner_att = 1269, outer_att = 1269, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250078) ->
    #mon{
        mid = 250078,
        name = <<"北极熊">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 134856, mp_lim = 5116, inner_att = 1269, outer_att = 1269, inner_def = 445, outer_def = 445, hit = 4357, dodge = 398, crit_hurt = 422, crit_def = 100, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250079) ->
    #mon{
        mid = 250079,
        name = <<"不平道人">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 142176, mp_lim = 5227, inner_att = 1335, outer_att = 1335, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250080) ->
    #mon{
        mid = 250080,
        name = <<"书生黄轶之">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 142176, mp_lim = 5227, inner_att = 1335, outer_att = 1335, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250081) ->
    #mon{
        mid = 250081,
        name = <<"鸠摩智">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 142176, mp_lim = 5227, inner_att = 1335, outer_att = 1335, inner_def = 468, outer_def = 468, hit = 4583, dodge = 420, crit_hurt = 447, crit_def = 105, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250082) ->
    #mon{
        mid = 250082,
        name = <<"墨虎">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 149028, mp_lim = 5333, inner_att = 1398, outer_att = 1398, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250083) ->
    #mon{
        mid = 250083,
        name = <<"駮马">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 149028, mp_lim = 5333, inner_att = 1398, outer_att = 1398, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250084) ->
    #mon{
        mid = 250084,
        name = <<"闪电貂">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 149028, mp_lim = 5333, inner_att = 1398, outer_att = 1398, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250085) ->
    #mon{
        mid = 250085,
        name = <<"魔教长老">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 156720, mp_lim = 5444, inner_att = 1467, outer_att = 1467, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250086) ->
    #mon{
        mid = 250086,
        name = <<"青城派弟子">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 156720, mp_lim = 5444, inner_att = 1467, outer_att = 1467, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250087) ->
    #mon{
        mid = 250087,
        name = <<"江湖弟子">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 156720, mp_lim = 5444, inner_att = 1467, outer_att = 1467, inner_def = 516, outer_def = 516, hit = 5043, dodge = 463, crit_hurt = 492, crit_def = 116, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250088) ->
    #mon{
        mid = 250088,
        name = <<"混江小龙">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 163896, mp_lim = 5549, inner_att = 1533, outer_att = 1533, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250089) ->
    #mon{
        mid = 250089,
        name = <<"四绝护卫">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 163896, mp_lim = 5549, inner_att = 1533, outer_att = 1533, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250090) ->
    #mon{
        mid = 250090,
        name = <<"庞企">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 163896, mp_lim = 5549, inner_att = 1533, outer_att = 1533, inner_def = 540, outer_def = 540, hit = 5272, dodge = 483, crit_hurt = 512, crit_def = 121, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250091) ->
    #mon{
        mid = 250091,
        name = <<"哈大霸">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 171936, mp_lim = 5660, inner_att = 1605, outer_att = 1605, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250092) ->
    #mon{
        mid = 250092,
        name = <<"门派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 171936, mp_lim = 5660, inner_att = 1605, outer_att = 1605, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250093) ->
    #mon{
        mid = 250093,
        name = <<"刺猬">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 171936, mp_lim = 5660, inner_att = 1605, outer_att = 1605, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250094) ->
    #mon{
        mid = 250094,
        name = <<"门派弟子">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 179436, mp_lim = 5766, inner_att = 1674, outer_att = 1674, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250095) ->
    #mon{
        mid = 250095,
        name = <<"演武守卫">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 179436, mp_lim = 5766, inner_att = 1674, outer_att = 1674, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250096) ->
    #mon{
        mid = 250096,
        name = <<"星宿派弟子">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 179436, mp_lim = 5766, inner_att = 1674, outer_att = 1674, inner_def = 590, outer_def = 590, hit = 5762, dodge = 528, crit_hurt = 560, crit_def = 132, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250097) ->
    #mon{
        mid = 250097,
        name = <<"慕容复">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 187848, mp_lim = 5877, inner_att = 1749, outer_att = 1749, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250098) ->
    #mon{
        mid = 250098,
        name = <<"山寨亲兵">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 187848, mp_lim = 5877, inner_att = 1749, outer_att = 1749, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250099) ->
    #mon{
        mid = 250099,
        name = <<"演武守将">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 187848, mp_lim = 5877, inner_att = 1749, outer_att = 1749, inner_def = 617, outer_def = 617, hit = 6022, dodge = 554, crit_hurt = 588, crit_def = 139, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250100) ->
    #mon{
        mid = 250100,
        name = <<"隐士钟智前">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 195672, mp_lim = 5982, inner_att = 1821, outer_att = 1821, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250101) ->
    #mon{
        mid = 250101,
        name = <<"101江湖高手">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 195672, mp_lim = 5982, inner_att = 1821, outer_att = 1821, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250102) ->
    #mon{
        mid = 250102,
        name = <<"102江湖高手">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 195672, mp_lim = 5982, inner_att = 1821, outer_att = 1821, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250103) ->
    #mon{
        mid = 250103,
        name = <<"103江湖高手">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 204432, mp_lim = 6093, inner_att = 1899, outer_att = 1899, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250104) ->
    #mon{
        mid = 250104,
        name = <<"104江湖高手">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 204432, mp_lim = 6093, inner_att = 1899, outer_att = 1899, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250105) ->
    #mon{
        mid = 250105,
        name = <<"105江湖高手">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 204432, mp_lim = 6093, inner_att = 1899, outer_att = 1899, inner_def = 671, outer_def = 671, hit = 6539, dodge = 602, crit_hurt = 638, crit_def = 150, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250106) ->
    #mon{
        mid = 250106,
        name = <<"106江湖高手">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 212580, mp_lim = 6199, inner_att = 1974, outer_att = 1974, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250107) ->
    #mon{
        mid = 250107,
        name = <<"107江湖高手">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 212580, mp_lim = 6199, inner_att = 1974, outer_att = 1974, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250108) ->
    #mon{
        mid = 250108,
        name = <<"108江湖高手">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 212580, mp_lim = 6199, inner_att = 1974, outer_att = 1974, inner_def = 699, outer_def = 699, hit = 6802, dodge = 625, crit_hurt = 660, crit_def = 157, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250109) ->
    #mon{
        mid = 250109,
        name = <<"109江湖高手">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 221712, mp_lim = 6310, inner_att = 2055, outer_att = 2055, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250110) ->
    #mon{
        mid = 250110,
        name = <<"110江湖高手">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 221712, mp_lim = 6310, inner_att = 2055, outer_att = 2055, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250111) ->
    #mon{
        mid = 250111,
        name = <<"111江湖高手">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 221712, mp_lim = 6310, inner_att = 2055, outer_att = 2055, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250112) ->
    #mon{
        mid = 250112,
        name = <<"112江湖高手">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 230184, mp_lim = 6415, inner_att = 2133, outer_att = 2133, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250113) ->
    #mon{
        mid = 250113,
        name = <<"113江湖高手">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 230184, mp_lim = 6415, inner_att = 2133, outer_att = 2133, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250114) ->
    #mon{
        mid = 250114,
        name = <<"114江湖高手">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 230184, mp_lim = 6415, inner_att = 2133, outer_att = 2133, inner_def = 756, outer_def = 756, hit = 7355, dodge = 676, crit_hurt = 714, crit_def = 169, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250115) ->
    #mon{
        mid = 250115,
        name = <<"115江湖高手">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 239676, mp_lim = 6526, inner_att = 2214, outer_att = 2214, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250116) ->
    #mon{
        mid = 250116,
        name = <<"116江湖高手">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 239676, mp_lim = 6526, inner_att = 2214, outer_att = 2214, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250117) ->
    #mon{
        mid = 250117,
        name = <<"117江湖高手">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 239676, mp_lim = 6526, inner_att = 2214, outer_att = 2214, inner_def = 786, outer_def = 786, hit = 7645, dodge = 704, crit_hurt = 745, crit_def = 177, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250118) ->
    #mon{
        mid = 250118,
        name = <<"118江湖高手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 248472, mp_lim = 6632, inner_att = 2295, outer_att = 2295, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250119) ->
    #mon{
        mid = 250119,
        name = <<"119江湖高手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 248472, mp_lim = 6632, inner_att = 2295, outer_att = 2295, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250120) ->
    #mon{
        mid = 250120,
        name = <<"120江湖高手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 248472, mp_lim = 6632, inner_att = 2295, outer_att = 2295, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250121) ->
    #mon{
        mid = 250121,
        name = <<"121江湖高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 258324, mp_lim = 6743, inner_att = 2385, outer_att = 2385, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250122) ->
    #mon{
        mid = 250122,
        name = <<"122江湖高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 258324, mp_lim = 6743, inner_att = 2385, outer_att = 2385, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250123) ->
    #mon{
        mid = 250123,
        name = <<"123江湖高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 258324, mp_lim = 6743, inner_att = 2385, outer_att = 2385, inner_def = 847, outer_def = 847, hit = 8229, dodge = 760, crit_hurt = 804, crit_def = 191, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250124) ->
    #mon{
        mid = 250124,
        name = <<"124江湖高手">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 267444, mp_lim = 6848, inner_att = 2466, outer_att = 2466, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250125) ->
    #mon{
        mid = 250125,
        name = <<"125江湖高手">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 267444, mp_lim = 6848, inner_att = 2466, outer_att = 2466, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250126) ->
    #mon{
        mid = 250126,
        name = <<"126江湖高手">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 267444, mp_lim = 6848, inner_att = 2466, outer_att = 2466, inner_def = 877, outer_def = 877, hit = 8521, dodge = 785, crit_hurt = 827, crit_def = 196, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250127) ->
    #mon{
        mid = 250127,
        name = <<"127江湖高手">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 277668, mp_lim = 6959, inner_att = 2556, outer_att = 2556, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250128) ->
    #mon{
        mid = 250128,
        name = <<"128江湖高手">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 277668, mp_lim = 6959, inner_att = 2556, outer_att = 2556, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250129) ->
    #mon{
        mid = 250129,
        name = <<"129江湖高手">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 277668, mp_lim = 6959, inner_att = 2556, outer_att = 2556, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250130) ->
    #mon{
        mid = 250130,
        name = <<"130江湖高手">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 287112, mp_lim = 7065, inner_att = 2643, outer_att = 2643, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250131) ->
    #mon{
        mid = 250131,
        name = <<"131江湖高手">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 287112, mp_lim = 7065, inner_att = 2643, outer_att = 2643, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250132) ->
    #mon{
        mid = 250132,
        name = <<"132江湖高手">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 287112, mp_lim = 7065, inner_att = 2643, outer_att = 2643, inner_def = 941, outer_def = 941, hit = 9136, dodge = 842, crit_hurt = 887, crit_def = 211, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250133) ->
    #mon{
        mid = 250133,
        name = <<"133江湖高手">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 297684, mp_lim = 7176, inner_att = 2736, outer_att = 2736, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250134) ->
    #mon{
        mid = 250134,
        name = <<"134江湖高手">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 297684, mp_lim = 7176, inner_att = 2736, outer_att = 2736, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250135) ->
    #mon{
        mid = 250135,
        name = <<"135江湖高手">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 297684, mp_lim = 7176, inner_att = 2736, outer_att = 2736, inner_def = 975, outer_def = 975, hit = 9458, dodge = 874, crit_hurt = 923, crit_def = 218, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250136) ->
    #mon{
        mid = 250136,
        name = <<"136江湖高手">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 307452, mp_lim = 7281, inner_att = 2826, outer_att = 2826, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250137) ->
    #mon{
        mid = 250137,
        name = <<"137江湖高手">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 307452, mp_lim = 7281, inner_att = 2826, outer_att = 2826, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250138) ->
    #mon{
        mid = 250138,
        name = <<"138江湖高手">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 307452, mp_lim = 7281, inner_att = 2826, outer_att = 2826, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250139) ->
    #mon{
        mid = 250139,
        name = <<"139江湖高手">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 318396, mp_lim = 7392, inner_att = 2922, outer_att = 2922, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250140) ->
    #mon{
        mid = 250140,
        name = <<"140江湖高手">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 318396, mp_lim = 7392, inner_att = 2922, outer_att = 2922, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250141) ->
    #mon{
        mid = 250141,
        name = <<"141江湖高手">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 318396, mp_lim = 7392, inner_att = 2922, outer_att = 2922, inner_def = 1042, outer_def = 1042, hit = 10103, dodge = 933, crit_hurt = 984, crit_def = 233, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250142) ->
    #mon{
        mid = 250142,
        name = <<"142江湖高手">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 328488, mp_lim = 7498, inner_att = 3015, outer_att = 3015, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250143) ->
    #mon{
        mid = 250143,
        name = <<"143江湖高手">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 328488, mp_lim = 7498, inner_att = 3015, outer_att = 3015, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250144) ->
    #mon{
        mid = 250144,
        name = <<"144江湖高手">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 328488, mp_lim = 7498, inner_att = 3015, outer_att = 3015, inner_def = 1076, outer_def = 1076, hit = 10428, dodge = 962, crit_hurt = 1014, crit_def = 240, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250145) ->
    #mon{
        mid = 250145,
        name = <<"145江湖高手">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 339780, mp_lim = 7609, inner_att = 3114, outer_att = 3114, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250146) ->
    #mon{
        mid = 250146,
        name = <<"146江湖高手">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 339780, mp_lim = 7609, inner_att = 3114, outer_att = 3114, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250147) ->
    #mon{
        mid = 250147,
        name = <<"147江湖高手">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 339780, mp_lim = 7609, inner_att = 3114, outer_att = 3114, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250148) ->
    #mon{
        mid = 250148,
        name = <<"148江湖高手">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 350196, mp_lim = 7714, inner_att = 3207, outer_att = 3207, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250149) ->
    #mon{
        mid = 250149,
        name = <<"149江湖高手">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 350196, mp_lim = 7714, inner_att = 3207, outer_att = 3207, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250150) ->
    #mon{
        mid = 250150,
        name = <<"150江湖高手">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 350196, mp_lim = 7714, inner_att = 3207, outer_att = 3207, inner_def = 1147, outer_def = 1147, hit = 11103, dodge = 1027, crit_hurt = 1078, crit_def = 256, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250151) ->
    #mon{
        mid = 250151,
        name = <<"151江湖高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 361860, mp_lim = 7825, inner_att = 3312, outer_att = 3312, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250152) ->
    #mon{
        mid = 250152,
        name = <<"152江湖高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 361860, mp_lim = 7825, inner_att = 3312, outer_att = 3312, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250153) ->
    #mon{
        mid = 250153,
        name = <<"153江湖高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 361860, mp_lim = 7825, inner_att = 3312, outer_att = 3312, inner_def = 1184, outer_def = 1184, hit = 11457, dodge = 1061, crit_hurt = 1118, crit_def = 264, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250154) ->
    #mon{
        mid = 250154,
        name = <<"154江湖高手">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 372600, mp_lim = 7931, inner_att = 3408, outer_att = 3408, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250155) ->
    #mon{
        mid = 250155,
        name = <<"155江湖高手">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 372600, mp_lim = 7931, inner_att = 3408, outer_att = 3408, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250156) ->
    #mon{
        mid = 250156,
        name = <<"156江湖高手">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 372600, mp_lim = 7931, inner_att = 3408, outer_att = 3408, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250157) ->
    #mon{
        mid = 250157,
        name = <<"157江湖高手">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 384624, mp_lim = 8042, inner_att = 3513, outer_att = 3513, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250158) ->
    #mon{
        mid = 250158,
        name = <<"158江湖高手">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 384624, mp_lim = 8042, inner_att = 3513, outer_att = 3513, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250159) ->
    #mon{
        mid = 250159,
        name = <<"159江湖高手">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 384624, mp_lim = 8042, inner_att = 3513, outer_att = 3513, inner_def = 1258, outer_def = 1258, hit = 12171, dodge = 1128, crit_hurt = 1188, crit_def = 281, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250160) ->
    #mon{
        mid = 250160,
        name = <<"160江湖高手">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 395688, mp_lim = 8147, inner_att = 3615, outer_att = 3615, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250161) ->
    #mon{
        mid = 250161,
        name = <<"161江湖高手">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 395688, mp_lim = 8147, inner_att = 3615, outer_att = 3615, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250162) ->
    #mon{
        mid = 250162,
        name = <<"162江湖高手">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 395688, mp_lim = 8147, inner_att = 3615, outer_att = 3615, inner_def = 1295, outer_def = 1295, hit = 12523, dodge = 1159, crit_hurt = 1217, crit_def = 288, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250163) ->
    #mon{
        mid = 250163,
        name = <<"163江湖高手">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 406428, mp_lim = 8258, inner_att = 3708, outer_att = 3708, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250164) ->
    #mon{
        mid = 250164,
        name = <<"164江湖高手">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 406428, mp_lim = 8258, inner_att = 3708, outer_att = 3708, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250165) ->
    #mon{
        mid = 250165,
        name = <<"165江湖高手">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 406428, mp_lim = 8258, inner_att = 3708, outer_att = 3708, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250166) ->
    #mon{
        mid = 250166,
        name = <<"166江湖高手">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 416136, mp_lim = 8364, inner_att = 3795, outer_att = 3795, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250167) ->
    #mon{
        mid = 250167,
        name = <<"167江湖高手">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 416136, mp_lim = 8364, inner_att = 3795, outer_att = 3795, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250168) ->
    #mon{
        mid = 250168,
        name = <<"168江湖高手">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 416136, mp_lim = 8364, inner_att = 3795, outer_att = 3795, inner_def = 1361, outer_def = 1361, hit = 13156, dodge = 1217, crit_hurt = 1280, crit_def = 303, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250169) ->
    #mon{
        mid = 250169,
        name = <<"169江湖高手">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 427140, mp_lim = 8475, inner_att = 3891, outer_att = 3891, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250170) ->
    #mon{
        mid = 250170,
        name = <<"170江湖高手">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 427140, mp_lim = 8475, inner_att = 3891, outer_att = 3891, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250171) ->
    #mon{
        mid = 250171,
        name = <<"171江湖高手">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 427140, mp_lim = 8475, inner_att = 3891, outer_att = 3891, inner_def = 1396, outer_def = 1396, hit = 13491, dodge = 1251, crit_hurt = 1318, crit_def = 312, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250172) ->
    #mon{
        mid = 250172,
        name = <<"172江湖高手">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 437100, mp_lim = 8580, inner_att = 3984, outer_att = 3984, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250173) ->
    #mon{
        mid = 250173,
        name = <<"173江湖高手">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 437100, mp_lim = 8580, inner_att = 3984, outer_att = 3984, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250174) ->
    #mon{
        mid = 250174,
        name = <<"174江湖高手">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 437100, mp_lim = 8580, inner_att = 3984, outer_att = 3984, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250175) ->
    #mon{
        mid = 250175,
        name = <<"175江湖高手">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 448380, mp_lim = 8691, inner_att = 4080, outer_att = 4080, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250176) ->
    #mon{
        mid = 250176,
        name = <<"176江湖高手">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 448380, mp_lim = 8691, inner_att = 4080, outer_att = 4080, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250177) ->
    #mon{
        mid = 250177,
        name = <<"177江湖高手">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 448380, mp_lim = 8691, inner_att = 4080, outer_att = 4080, inner_def = 1465, outer_def = 1465, hit = 14147, dodge = 1313, crit_hurt = 1380, crit_def = 326, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250178) ->
    #mon{
        mid = 250178,
        name = <<"178江湖高手">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 458568, mp_lim = 8797, inner_att = 4173, outer_att = 4173, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250179) ->
    #mon{
        mid = 250179,
        name = <<"179江湖高手">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 458568, mp_lim = 8797, inner_att = 4173, outer_att = 4173, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250180) ->
    #mon{
        mid = 250180,
        name = <<"180江湖高手">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 458568, mp_lim = 8797, inner_att = 4173, outer_att = 4173, inner_def = 1499, outer_def = 1499, hit = 14472, dodge = 1341, crit_hurt = 1406, crit_def = 334, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250181) ->
    #mon{
        mid = 250181,
        name = <<"181江湖高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 470124, mp_lim = 8908, inner_att = 4272, outer_att = 4272, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250182) ->
    #mon{
        mid = 250182,
        name = <<"182江湖高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 470124, mp_lim = 8908, inner_att = 4272, outer_att = 4272, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250183) ->
    #mon{
        mid = 250183,
        name = <<"183江湖高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 470124, mp_lim = 8908, inner_att = 4272, outer_att = 4272, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250184) ->
    #mon{
        mid = 250184,
        name = <<"184江湖高手">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 480552, mp_lim = 9013, inner_att = 4368, outer_att = 4368, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250185) ->
    #mon{
        mid = 250185,
        name = <<"185江湖高手">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 480552, mp_lim = 9013, inner_att = 4368, outer_att = 4368, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250186) ->
    #mon{
        mid = 250186,
        name = <<"186江湖高手">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 480552, mp_lim = 9013, inner_att = 4368, outer_att = 4368, inner_def = 1570, outer_def = 1570, hit = 15155, dodge = 1405, crit_hurt = 1474, crit_def = 349, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250187) ->
    #mon{
        mid = 250187,
        name = <<"187江湖高手">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 492384, mp_lim = 9124, inner_att = 4470, outer_att = 4470, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250188) ->
    #mon{
        mid = 250188,
        name = <<"188江湖高手">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 492384, mp_lim = 9124, inner_att = 4470, outer_att = 4470, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250189) ->
    #mon{
        mid = 250189,
        name = <<"189江湖高手">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 492384, mp_lim = 9124, inner_att = 4470, outer_att = 4470, inner_def = 1607, outer_def = 1607, hit = 15511, dodge = 1439, crit_hurt = 1512, crit_def = 359, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250190) ->
    #mon{
        mid = 250190,
        name = <<"190江湖高手">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 503064, mp_lim = 9230, inner_att = 4569, outer_att = 4569, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250191) ->
    #mon{
        mid = 250191,
        name = <<"191江湖高手">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 503064, mp_lim = 9230, inner_att = 4569, outer_att = 4569, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250192) ->
    #mon{
        mid = 250192,
        name = <<"192江湖高手">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 503064, mp_lim = 9230, inner_att = 4569, outer_att = 4569, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250193) ->
    #mon{
        mid = 250193,
        name = <<"193江湖高手">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 515148, mp_lim = 9341, inner_att = 4671, outer_att = 4671, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250194) ->
    #mon{
        mid = 250194,
        name = <<"194江湖高手">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 515148, mp_lim = 9341, inner_att = 4671, outer_att = 4671, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250195) ->
    #mon{
        mid = 250195,
        name = <<"195江湖高手">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 515148, mp_lim = 9341, inner_att = 4671, outer_att = 4671, inner_def = 1681, outer_def = 1681, hit = 16218, dodge = 1506, crit_hurt = 1584, crit_def = 376, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250196) ->
    #mon{
        mid = 250196,
        name = <<"196江湖高手">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 526080, mp_lim = 9446, inner_att = 4773, outer_att = 4773, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250197) ->
    #mon{
        mid = 250197,
        name = <<"197江湖高手">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 526080, mp_lim = 9446, inner_att = 4773, outer_att = 4773, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250198) ->
    #mon{
        mid = 250198,
        name = <<"198江湖高手">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 526080, mp_lim = 9446, inner_att = 4773, outer_att = 4773, inner_def = 1718, outer_def = 1718, hit = 16565, dodge = 1537, crit_hurt = 1610, crit_def = 382, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250199) ->
    #mon{
        mid = 250199,
        name = <<"199江湖高手">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 538440, mp_lim = 9557, inner_att = 4878, outer_att = 4878, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250200) ->
    #mon{
        mid = 250200,
        name = <<"200江湖高手">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 538440, mp_lim = 9557, inner_att = 4878, outer_att = 4878, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250201) ->
    #mon{
        mid = 250201,
        name = <<"201江湖高手">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 538440, mp_lim = 9557, inner_att = 4878, outer_att = 4878, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250202) ->
    #mon{
        mid = 250202,
        name = <<"202江湖高手">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 549600, mp_lim = 9663, inner_att = 4980, outer_att = 4980, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250203) ->
    #mon{
        mid = 250203,
        name = <<"203江湖高手">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 549600, mp_lim = 9663, inner_att = 4980, outer_att = 4980, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250204) ->
    #mon{
        mid = 250204,
        name = <<"204江湖高手">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 549600, mp_lim = 9663, inner_att = 4980, outer_att = 4980, inner_def = 1794, outer_def = 1794, hit = 17295, dodge = 1604, crit_hurt = 1681, crit_def = 399, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250205) ->
    #mon{
        mid = 250205,
        name = <<"205江湖高手">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 562236, mp_lim = 9774, inner_att = 5088, outer_att = 5088, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250206) ->
    #mon{
        mid = 250206,
        name = <<"206江湖高手">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 562236, mp_lim = 9774, inner_att = 5088, outer_att = 5088, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250207) ->
    #mon{
        mid = 250207,
        name = <<"207江湖高手">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 562236, mp_lim = 9774, inner_att = 5088, outer_att = 5088, inner_def = 1834, outer_def = 1834, hit = 17679, dodge = 1644, crit_hurt = 1725, crit_def = 408, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250208) ->
    #mon{
        mid = 250208,
        name = <<"208江湖高手">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 573648, mp_lim = 9879, inner_att = 5193, outer_att = 5193, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250209) ->
    #mon{
        mid = 250209,
        name = <<"209江湖高手">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 573648, mp_lim = 9879, inner_att = 5193, outer_att = 5193, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250210) ->
    #mon{
        mid = 250210,
        name = <<"210江湖高手">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 573648, mp_lim = 9879, inner_att = 5193, outer_att = 5193, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250211) ->
    #mon{
        mid = 250211,
        name = <<"211江湖高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 588552, mp_lim = 9990, inner_att = 5304, outer_att = 5304, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250212) ->
    #mon{
        mid = 250212,
        name = <<"212江湖高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 588552, mp_lim = 9990, inner_att = 5304, outer_att = 5304, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250213) ->
    #mon{
        mid = 250213,
        name = <<"213江湖高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 588552, mp_lim = 9990, inner_att = 5304, outer_att = 5304, inner_def = 1920, outer_def = 1920, hit = 18488, dodge = 1718, crit_hurt = 1802, crit_def = 427, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250214) ->
    #mon{
        mid = 250214,
        name = <<"214江湖高手">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 602220, mp_lim = 10096, inner_att = 5409, outer_att = 5409, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250215) ->
    #mon{
        mid = 250215,
        name = <<"215江湖高手">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 602220, mp_lim = 10096, inner_att = 5409, outer_att = 5409, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250216) ->
    #mon{
        mid = 250216,
        name = <<"216江湖高手">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 602220, mp_lim = 10096, inner_att = 5409, outer_att = 5409, inner_def = 1965, outer_def = 1965, hit = 18926, dodge = 1758, crit_hurt = 1842, crit_def = 437, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250217) ->
    #mon{
        mid = 250217,
        name = <<"217江湖高手">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 617484, mp_lim = 10207, inner_att = 5523, outer_att = 5523, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250218) ->
    #mon{
        mid = 250218,
        name = <<"218江湖高手">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 617484, mp_lim = 10207, inner_att = 5523, outer_att = 5523, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250219) ->
    #mon{
        mid = 250219,
        name = <<"219江湖高手">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 617484, mp_lim = 10207, inner_att = 5523, outer_att = 5523, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250220) ->
    #mon{
        mid = 250220,
        name = <<"220江湖高手">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 631488, mp_lim = 10312, inner_att = 5631, outer_att = 5631, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250221) ->
    #mon{
        mid = 250221,
        name = <<"221江湖高手">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 631488, mp_lim = 10312, inner_att = 5631, outer_att = 5631, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250222) ->
    #mon{
        mid = 250222,
        name = <<"222江湖高手">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 631488, mp_lim = 10312, inner_att = 5631, outer_att = 5631, inner_def = 2060, outer_def = 2060, hit = 19835, dodge = 1843, crit_hurt = 1928, crit_def = 458, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250223) ->
    #mon{
        mid = 250223,
        name = <<"223江湖高手">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 647100, mp_lim = 10423, inner_att = 5748, outer_att = 5748, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250224) ->
    #mon{
        mid = 250224,
        name = <<"224江湖高手">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 647100, mp_lim = 10423, inner_att = 5748, outer_att = 5748, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250225) ->
    #mon{
        mid = 250225,
        name = <<"225江湖高手">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 647100, mp_lim = 10423, inner_att = 5748, outer_att = 5748, inner_def = 2109, outer_def = 2109, hit = 20303, dodge = 1889, crit_hurt = 1981, crit_def = 468, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250226) ->
    #mon{
        mid = 250226,
        name = <<"226江湖高手">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 661428, mp_lim = 10529, inner_att = 5859, outer_att = 5859, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250227) ->
    #mon{
        mid = 250227,
        name = <<"227江湖高手">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 661428, mp_lim = 10529, inner_att = 5859, outer_att = 5859, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250228) ->
    #mon{
        mid = 250228,
        name = <<"228江湖高手">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 661428, mp_lim = 10529, inner_att = 5859, outer_att = 5859, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250229) ->
    #mon{
        mid = 250229,
        name = <<"229江湖高手">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 677412, mp_lim = 10640, inner_att = 5976, outer_att = 5976, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250230) ->
    #mon{
        mid = 250230,
        name = <<"230江湖高手">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 677412, mp_lim = 10640, inner_att = 5976, outer_att = 5976, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250231) ->
    #mon{
        mid = 250231,
        name = <<"231江湖高手">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 677412, mp_lim = 10640, inner_att = 5976, outer_att = 5976, inner_def = 2207, outer_def = 2207, hit = 21248, dodge = 1977, crit_hurt = 2073, crit_def = 491, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250232) ->
    #mon{
        mid = 250232,
        name = <<"232江湖高手">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 692064, mp_lim = 10745, inner_att = 6090, outer_att = 6090, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250233) ->
    #mon{
        mid = 250233,
        name = <<"233江湖高手">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 692064, mp_lim = 10745, inner_att = 6090, outer_att = 6090, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250234) ->
    #mon{
        mid = 250234,
        name = <<"234江湖高手">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 692064, mp_lim = 10745, inner_att = 6090, outer_att = 6090, inner_def = 2256, outer_def = 2256, hit = 21712, dodge = 2018, crit_hurt = 2112, crit_def = 500, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250235) ->
    #mon{
        mid = 250235,
        name = <<"235江湖高手">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 708408, mp_lim = 10856, inner_att = 6210, outer_att = 6210, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250236) ->
    #mon{
        mid = 250236,
        name = <<"236江湖高手">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 708408, mp_lim = 10856, inner_att = 6210, outer_att = 6210, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250237) ->
    #mon{
        mid = 250237,
        name = <<"237江湖高手">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 708408, mp_lim = 10856, inner_att = 6210, outer_att = 6210, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250238) ->
    #mon{
        mid = 250238,
        name = <<"238江湖高手">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 723372, mp_lim = 10962, inner_att = 6324, outer_att = 6324, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250239) ->
    #mon{
        mid = 250239,
        name = <<"239江湖高手">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 723372, mp_lim = 10962, inner_att = 6324, outer_att = 6324, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250240) ->
    #mon{
        mid = 250240,
        name = <<"240江湖高手">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 723372, mp_lim = 10962, inner_att = 6324, outer_att = 6324, inner_def = 2358, outer_def = 2358, hit = 22679, dodge = 2109, crit_hurt = 2207, crit_def = 523, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250241) ->
    #mon{
        mid = 250241,
        name = <<"241江湖高手">>,
        boss = 0,
        level = 101,
        attr = #bt_attr{hp_lim = 740076, mp_lim = 11073, inner_att = 6447, outer_att = 6447, inner_def = 2411, outer_def = 2411, hit = 23188, dodge = 2160, crit_hurt = 2264, crit_def = 537, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250242) ->
    #mon{
        mid = 250242,
        name = <<"242江湖高手">>,
        boss = 0,
        level = 101,
        attr = #bt_attr{hp_lim = 740076, mp_lim = 11073, inner_att = 6447, outer_att = 6447, inner_def = 2411, outer_def = 2411, hit = 23188, dodge = 2160, crit_hurt = 2264, crit_def = 537, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250243) ->
    #mon{
        mid = 250243,
        name = <<"243江湖高手">>,
        boss = 0,
        level = 101,
        attr = #bt_attr{hp_lim = 740076, mp_lim = 11073, inner_att = 6447, outer_att = 6447, inner_def = 2411, outer_def = 2411, hit = 23188, dodge = 2160, crit_hurt = 2264, crit_def = 537, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250244) ->
    #mon{
        mid = 250244,
        name = <<"244江湖高手">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 755376, mp_lim = 11178, inner_att = 6564, outer_att = 6564, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250245) ->
    #mon{
        mid = 250245,
        name = <<"245江湖高手">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 755376, mp_lim = 11178, inner_att = 6564, outer_att = 6564, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250246) ->
    #mon{
        mid = 250246,
        name = <<"246江湖高手">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 755376, mp_lim = 11178, inner_att = 6564, outer_att = 6564, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250247) ->
    #mon{
        mid = 250247,
        name = <<"247江湖高手">>,
        boss = 0,
        level = 103,
        attr = #bt_attr{hp_lim = 772452, mp_lim = 11289, inner_att = 6690, outer_att = 6690, inner_def = 2516, outer_def = 2516, hit = 24187, dodge = 2253, crit_hurt = 2359, crit_def = 559, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250248) ->
    #mon{
        mid = 250248,
        name = <<"248江湖高手">>,
        boss = 0,
        level = 103,
        attr = #bt_attr{hp_lim = 772452, mp_lim = 11289, inner_att = 6690, outer_att = 6690, inner_def = 2516, outer_def = 2516, hit = 24187, dodge = 2253, crit_hurt = 2359, crit_def = 559, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250249) ->
    #mon{
        mid = 250249,
        name = <<"249江湖高手">>,
        boss = 0,
        level = 103,
        attr = #bt_attr{hp_lim = 772452, mp_lim = 11289, inner_att = 6690, outer_att = 6690, inner_def = 2516, outer_def = 2516, hit = 24187, dodge = 2253, crit_hurt = 2359, crit_def = 559, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250250) ->
    #mon{
        mid = 250250,
        name = <<"250江湖高手">>,
        boss = 0,
        level = 104,
        attr = #bt_attr{hp_lim = 788064, mp_lim = 11395, inner_att = 6807, outer_att = 6807, inner_def = 2568, outer_def = 2568, hit = 24686, dodge = 2296, crit_hurt = 2401, crit_def = 570, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250251) ->
    #mon{
        mid = 250251,
        name = <<"251江湖高手">>,
        boss = 0,
        level = 104,
        attr = #bt_attr{hp_lim = 788064, mp_lim = 11395, inner_att = 6807, outer_att = 6807, inner_def = 2568, outer_def = 2568, hit = 24686, dodge = 2296, crit_hurt = 2401, crit_def = 570, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250252) ->
    #mon{
        mid = 250252,
        name = <<"252江湖高手">>,
        boss = 0,
        level = 104,
        attr = #bt_attr{hp_lim = 788064, mp_lim = 11395, inner_att = 6807, outer_att = 6807, inner_def = 2568, outer_def = 2568, hit = 24686, dodge = 2296, crit_hurt = 2401, crit_def = 570, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250253) ->
    #mon{
        mid = 250253,
        name = <<"253江湖高手">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 805500, mp_lim = 11506, inner_att = 6936, outer_att = 6936, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250254) ->
    #mon{
        mid = 250254,
        name = <<"254江湖高手">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 805500, mp_lim = 11506, inner_att = 6936, outer_att = 6936, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250255) ->
    #mon{
        mid = 250255,
        name = <<"255江湖高手">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 805500, mp_lim = 11506, inner_att = 6936, outer_att = 6936, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250256) ->
    #mon{
        mid = 250256,
        name = <<"256江湖高手">>,
        boss = 0,
        level = 106,
        attr = #bt_attr{hp_lim = 821436, mp_lim = 11611, inner_att = 7056, outer_att = 7056, inner_def = 2676, outer_def = 2676, hit = 25716, dodge = 2394, crit_hurt = 2502, crit_def = 592, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250257) ->
    #mon{
        mid = 250257,
        name = <<"257江湖高手">>,
        boss = 0,
        level = 106,
        attr = #bt_attr{hp_lim = 821436, mp_lim = 11611, inner_att = 7056, outer_att = 7056, inner_def = 2676, outer_def = 2676, hit = 25716, dodge = 2394, crit_hurt = 2502, crit_def = 592, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250258) ->
    #mon{
        mid = 250258,
        name = <<"258江湖高手">>,
        boss = 0,
        level = 106,
        attr = #bt_attr{hp_lim = 821436, mp_lim = 11611, inner_att = 7056, outer_att = 7056, inner_def = 2676, outer_def = 2676, hit = 25716, dodge = 2394, crit_hurt = 2502, crit_def = 592, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250259) ->
    #mon{
        mid = 250259,
        name = <<"259江湖高手">>,
        boss = 0,
        level = 107,
        attr = #bt_attr{hp_lim = 839232, mp_lim = 11722, inner_att = 7188, outer_att = 7188, inner_def = 2732, outer_def = 2732, hit = 26253, dodge = 2444, crit_hurt = 2559, crit_def = 607, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250260) ->
    #mon{
        mid = 250260,
        name = <<"260江湖高手">>,
        boss = 0,
        level = 107,
        attr = #bt_attr{hp_lim = 839232, mp_lim = 11722, inner_att = 7188, outer_att = 7188, inner_def = 2732, outer_def = 2732, hit = 26253, dodge = 2444, crit_hurt = 2559, crit_def = 607, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250261) ->
    #mon{
        mid = 250261,
        name = <<"261江湖高手">>,
        boss = 0,
        level = 107,
        attr = #bt_attr{hp_lim = 839232, mp_lim = 11722, inner_att = 7188, outer_att = 7188, inner_def = 2732, outer_def = 2732, hit = 26253, dodge = 2444, crit_hurt = 2559, crit_def = 607, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250262) ->
    #mon{
        mid = 250262,
        name = <<"262江湖高手">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 855504, mp_lim = 11828, inner_att = 7308, outer_att = 7308, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250263) ->
    #mon{
        mid = 250263,
        name = <<"263江湖高手">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 855504, mp_lim = 11828, inner_att = 7308, outer_att = 7308, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250264) ->
    #mon{
        mid = 250264,
        name = <<"264江湖高手">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 855504, mp_lim = 11828, inner_att = 7308, outer_att = 7308, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250265) ->
    #mon{
        mid = 250265,
        name = <<"265江湖高手">>,
        boss = 0,
        level = 109,
        attr = #bt_attr{hp_lim = 873648, mp_lim = 11939, inner_att = 7440, outer_att = 7440, inner_def = 2844, outer_def = 2844, hit = 27324, dodge = 2548, crit_hurt = 2668, crit_def = 632, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250266) ->
    #mon{
        mid = 250266,
        name = <<"266江湖高手">>,
        boss = 0,
        level = 109,
        attr = #bt_attr{hp_lim = 873648, mp_lim = 11939, inner_att = 7440, outer_att = 7440, inner_def = 2844, outer_def = 2844, hit = 27324, dodge = 2548, crit_hurt = 2668, crit_def = 632, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250267) ->
    #mon{
        mid = 250267,
        name = <<"267江湖高手">>,
        boss = 0,
        level = 109,
        attr = #bt_attr{hp_lim = 873648, mp_lim = 11939, inner_att = 7440, outer_att = 7440, inner_def = 2844, outer_def = 2844, hit = 27324, dodge = 2548, crit_hurt = 2668, crit_def = 632, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250268) ->
    #mon{
        mid = 250268,
        name = <<"268江湖高手">>,
        boss = 0,
        level = 110,
        attr = #bt_attr{hp_lim = 890244, mp_lim = 12044, inner_att = 7566, outer_att = 7566, inner_def = 2899, outer_def = 2899, hit = 27844, dodge = 2594, crit_hurt = 2708, crit_def = 643, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250269) ->
    #mon{
        mid = 250269,
        name = <<"269江湖高手">>,
        boss = 0,
        level = 110,
        attr = #bt_attr{hp_lim = 890244, mp_lim = 12044, inner_att = 7566, outer_att = 7566, inner_def = 2899, outer_def = 2899, hit = 27844, dodge = 2594, crit_hurt = 2708, crit_def = 643, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250270) ->
    #mon{
        mid = 250270,
        name = <<"270江湖高手">>,
        boss = 0,
        level = 110,
        attr = #bt_attr{hp_lim = 890244, mp_lim = 12044, inner_att = 7566, outer_att = 7566, inner_def = 2899, outer_def = 2899, hit = 27844, dodge = 2594, crit_hurt = 2708, crit_def = 643, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250271) ->
    #mon{
        mid = 250271,
        name = <<"271江湖高手">>,
        boss = 0,
        level = 111,
        attr = #bt_attr{hp_lim = 908760, mp_lim = 12155, inner_att = 7701, outer_att = 7701, inner_def = 2958, outer_def = 2958, hit = 28402, dodge = 2648, crit_hurt = 2771, crit_def = 656, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250272) ->
    #mon{
        mid = 250272,
        name = <<"272江湖高手">>,
        boss = 0,
        level = 111,
        attr = #bt_attr{hp_lim = 908760, mp_lim = 12155, inner_att = 7701, outer_att = 7701, inner_def = 2958, outer_def = 2958, hit = 28402, dodge = 2648, crit_hurt = 2771, crit_def = 656, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250273) ->
    #mon{
        mid = 250273,
        name = <<"273江湖高手">>,
        boss = 0,
        level = 111,
        attr = #bt_attr{hp_lim = 908760, mp_lim = 12155, inner_att = 7701, outer_att = 7701, inner_def = 2958, outer_def = 2958, hit = 28402, dodge = 2648, crit_hurt = 2771, crit_def = 656, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250274) ->
    #mon{
        mid = 250274,
        name = <<"274江湖高手">>,
        boss = 0,
        level = 112,
        attr = #bt_attr{hp_lim = 925680, mp_lim = 12261, inner_att = 7827, outer_att = 7827, inner_def = 3014, outer_def = 3014, hit = 28941, dodge = 2696, crit_hurt = 2815, crit_def = 669, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250275) ->
    #mon{
        mid = 250275,
        name = <<"275江湖高手">>,
        boss = 0,
        level = 112,
        attr = #bt_attr{hp_lim = 925680, mp_lim = 12261, inner_att = 7827, outer_att = 7827, inner_def = 3014, outer_def = 3014, hit = 28941, dodge = 2696, crit_hurt = 2815, crit_def = 669, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250276) ->
    #mon{
        mid = 250276,
        name = <<"276江湖高手">>,
        boss = 0,
        level = 112,
        attr = #bt_attr{hp_lim = 925680, mp_lim = 12261, inner_att = 7827, outer_att = 7827, inner_def = 3014, outer_def = 3014, hit = 28941, dodge = 2696, crit_hurt = 2815, crit_def = 669, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250277) ->
    #mon{
        mid = 250277,
        name = <<"277江湖高手">>,
        boss = 0,
        level = 113,
        attr = #bt_attr{hp_lim = 944556, mp_lim = 12372, inner_att = 7965, outer_att = 7965, inner_def = 3074, outer_def = 3074, hit = 29515, dodge = 2753, crit_hurt = 2880, crit_def = 682, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250278) ->
    #mon{
        mid = 250278,
        name = <<"278江湖高手">>,
        boss = 0,
        level = 113,
        attr = #bt_attr{hp_lim = 944556, mp_lim = 12372, inner_att = 7965, outer_att = 7965, inner_def = 3074, outer_def = 3074, hit = 29515, dodge = 2753, crit_hurt = 2880, crit_def = 682, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250279) ->
    #mon{
        mid = 250279,
        name = <<"279江湖高手">>,
        boss = 0,
        level = 113,
        attr = #bt_attr{hp_lim = 944556, mp_lim = 12372, inner_att = 7965, outer_att = 7965, inner_def = 3074, outer_def = 3074, hit = 29515, dodge = 2753, crit_hurt = 2880, crit_def = 682, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250280) ->
    #mon{
        mid = 250280,
        name = <<"280江湖高手">>,
        boss = 0,
        level = 114,
        attr = #bt_attr{hp_lim = 961800, mp_lim = 12477, inner_att = 8094, outer_att = 8094, inner_def = 3131, outer_def = 3131, hit = 30060, dodge = 2801, crit_hurt = 2925, crit_def = 693, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250281) ->
    #mon{
        mid = 250281,
        name = <<"281江湖高手">>,
        boss = 0,
        level = 114,
        attr = #bt_attr{hp_lim = 961800, mp_lim = 12477, inner_att = 8094, outer_att = 8094, inner_def = 3131, outer_def = 3131, hit = 30060, dodge = 2801, crit_hurt = 2925, crit_def = 693, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250282) ->
    #mon{
        mid = 250282,
        name = <<"282江湖高手">>,
        boss = 0,
        level = 114,
        attr = #bt_attr{hp_lim = 961800, mp_lim = 12477, inner_att = 8094, outer_att = 8094, inner_def = 3131, outer_def = 3131, hit = 30060, dodge = 2801, crit_hurt = 2925, crit_def = 693, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250283) ->
    #mon{
        mid = 250283,
        name = <<"283江湖高手">>,
        boss = 0,
        level = 115,
        attr = #bt_attr{hp_lim = 981036, mp_lim = 12588, inner_att = 8235, outer_att = 8235, inner_def = 3192, outer_def = 3192, hit = 30634, dodge = 2855, crit_hurt = 2987, crit_def = 708, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250284) ->
    #mon{
        mid = 250284,
        name = <<"284江湖高手">>,
        boss = 0,
        level = 115,
        attr = #bt_attr{hp_lim = 981036, mp_lim = 12588, inner_att = 8235, outer_att = 8235, inner_def = 3192, outer_def = 3192, hit = 30634, dodge = 2855, crit_hurt = 2987, crit_def = 708, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250285) ->
    #mon{
        mid = 250285,
        name = <<"285江湖高手">>,
        boss = 0,
        level = 115,
        attr = #bt_attr{hp_lim = 981036, mp_lim = 12588, inner_att = 8235, outer_att = 8235, inner_def = 3192, outer_def = 3192, hit = 30634, dodge = 2855, crit_hurt = 2987, crit_def = 708, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250286) ->
    #mon{
        mid = 250286,
        name = <<"286江湖高手">>,
        boss = 0,
        level = 116,
        attr = #bt_attr{hp_lim = 998604, mp_lim = 12694, inner_att = 8367, outer_att = 8367, inner_def = 3251, outer_def = 3251, hit = 31194, dodge = 2906, crit_hurt = 3037, crit_def = 720, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250287) ->
    #mon{
        mid = 250287,
        name = <<"287江湖高手">>,
        boss = 0,
        level = 116,
        attr = #bt_attr{hp_lim = 998604, mp_lim = 12694, inner_att = 8367, outer_att = 8367, inner_def = 3251, outer_def = 3251, hit = 31194, dodge = 2906, crit_hurt = 3037, crit_def = 720, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250288) ->
    #mon{
        mid = 250288,
        name = <<"288江湖高手">>,
        boss = 0,
        level = 116,
        attr = #bt_attr{hp_lim = 998604, mp_lim = 12694, inner_att = 8367, outer_att = 8367, inner_def = 3251, outer_def = 3251, hit = 31194, dodge = 2906, crit_hurt = 3037, crit_def = 720, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250289) ->
    #mon{
        mid = 250289,
        name = <<"289江湖高手">>,
        boss = 0,
        level = 117,
        attr = #bt_attr{hp_lim = 1018200, mp_lim = 12805, inner_att = 8505, outer_att = 8505, inner_def = 3312, outer_def = 3312, hit = 31790, dodge = 2966, crit_hurt = 3104, crit_def = 736, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250290) ->
    #mon{
        mid = 250290,
        name = <<"290江湖高手">>,
        boss = 0,
        level = 117,
        attr = #bt_attr{hp_lim = 1018200, mp_lim = 12805, inner_att = 8505, outer_att = 8505, inner_def = 3312, outer_def = 3312, hit = 31790, dodge = 2966, crit_hurt = 3104, crit_def = 736, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250291) ->
    #mon{
        mid = 250291,
        name = <<"291江湖高手">>,
        boss = 0,
        level = 117,
        attr = #bt_attr{hp_lim = 1018200, mp_lim = 12805, inner_att = 8505, outer_att = 8505, inner_def = 3312, outer_def = 3312, hit = 31790, dodge = 2966, crit_hurt = 3104, crit_def = 736, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250292) ->
    #mon{
        mid = 250292,
        name = <<"292江湖高手">>,
        boss = 0,
        level = 118,
        attr = #bt_attr{hp_lim = 1036092, mp_lim = 12910, inner_att = 8640, outer_att = 8640, inner_def = 3372, outer_def = 3372, hit = 32355, dodge = 3015, crit_hurt = 3147, crit_def = 747, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250293) ->
    #mon{
        mid = 250293,
        name = <<"293江湖高手">>,
        boss = 0,
        level = 118,
        attr = #bt_attr{hp_lim = 1036092, mp_lim = 12910, inner_att = 8640, outer_att = 8640, inner_def = 3372, outer_def = 3372, hit = 32355, dodge = 3015, crit_hurt = 3147, crit_def = 747, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250294) ->
    #mon{
        mid = 250294,
        name = <<"294江湖高手">>,
        boss = 0,
        level = 118,
        attr = #bt_attr{hp_lim = 1036092, mp_lim = 12910, inner_att = 8640, outer_att = 8640, inner_def = 3372, outer_def = 3372, hit = 32355, dodge = 3015, crit_hurt = 3147, crit_def = 747, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250295) ->
    #mon{
        mid = 250295,
        name = <<"295江湖高手">>,
        boss = 0,
        level = 119,
        attr = #bt_attr{hp_lim = 1056048, mp_lim = 13021, inner_att = 8784, outer_att = 8784, inner_def = 3435, outer_def = 3435, hit = 32956, dodge = 3076, crit_hurt = 3215, crit_def = 761, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250296) ->
    #mon{
        mid = 250296,
        name = <<"296江湖高手">>,
        boss = 0,
        level = 119,
        attr = #bt_attr{hp_lim = 1056048, mp_lim = 13021, inner_att = 8784, outer_att = 8784, inner_def = 3435, outer_def = 3435, hit = 32956, dodge = 3076, crit_hurt = 3215, crit_def = 761, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250297) ->
    #mon{
        mid = 250297,
        name = <<"297江湖高手">>,
        boss = 0,
        level = 119,
        attr = #bt_attr{hp_lim = 1056048, mp_lim = 13021, inner_att = 8784, outer_att = 8784, inner_def = 3435, outer_def = 3435, hit = 32956, dodge = 3076, crit_hurt = 3215, crit_def = 761, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250298) ->
    #mon{
        mid = 250298,
        name = <<"298江湖高手">>,
        boss = 0,
        level = 120,
        attr = #bt_attr{hp_lim = 1074264, mp_lim = 13127, inner_att = 8919, outer_att = 8919, inner_def = 3496, outer_def = 3496, hit = 33531, dodge = 3127, crit_hurt = 3263, crit_def = 775, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250299) ->
    #mon{
        mid = 250299,
        name = <<"299江湖高手">>,
        boss = 0,
        level = 120,
        attr = #bt_attr{hp_lim = 1074264, mp_lim = 13127, inner_att = 8919, outer_att = 8919, inner_def = 3496, outer_def = 3496, hit = 33531, dodge = 3127, crit_hurt = 3263, crit_def = 775, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250300) ->
    #mon{
        mid = 250300,
        name = <<"300江湖高手">>,
        boss = 0,
        level = 120,
        attr = #bt_attr{hp_lim = 1074264, mp_lim = 13127, inner_att = 8919, outer_att = 8919, inner_def = 3496, outer_def = 3496, hit = 33531, dodge = 3127, crit_hurt = 3263, crit_def = 775, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250301) ->
    #mon{
        mid = 250301,
        name = <<"301江湖高手">>,
        boss = 0,
        level = 121,
        attr = #bt_attr{hp_lim = 1094580, mp_lim = 13238, inner_att = 9066, outer_att = 9066, inner_def = 3560, outer_def = 3560, hit = 34148, dodge = 3188, crit_hurt = 3332, crit_def = 790, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250302) ->
    #mon{
        mid = 250302,
        name = <<"302江湖高手">>,
        boss = 0,
        level = 121,
        attr = #bt_attr{hp_lim = 1094580, mp_lim = 13238, inner_att = 9066, outer_att = 9066, inner_def = 3560, outer_def = 3560, hit = 34148, dodge = 3188, crit_hurt = 3332, crit_def = 790, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250303) ->
    #mon{
        mid = 250303,
        name = <<"303江湖高手">>,
        boss = 0,
        level = 121,
        attr = #bt_attr{hp_lim = 1094580, mp_lim = 13238, inner_att = 9066, outer_att = 9066, inner_def = 3560, outer_def = 3560, hit = 34148, dodge = 3188, crit_hurt = 3332, crit_def = 790, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250304) ->
    #mon{
        mid = 250304,
        name = <<"304江湖高手">>,
        boss = 0,
        level = 122,
        attr = #bt_attr{hp_lim = 1113120, mp_lim = 13343, inner_att = 9204, outer_att = 9204, inner_def = 3621, outer_def = 3621, hit = 34734, dodge = 3240, crit_hurt = 3381, crit_def = 801, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250305) ->
    #mon{
        mid = 250305,
        name = <<"305江湖高手">>,
        boss = 0,
        level = 122,
        attr = #bt_attr{hp_lim = 1113120, mp_lim = 13343, inner_att = 9204, outer_att = 9204, inner_def = 3621, outer_def = 3621, hit = 34734, dodge = 3240, crit_hurt = 3381, crit_def = 801, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250306) ->
    #mon{
        mid = 250306,
        name = <<"306江湖高手">>,
        boss = 0,
        level = 122,
        attr = #bt_attr{hp_lim = 1113120, mp_lim = 13343, inner_att = 9204, outer_att = 9204, inner_def = 3621, outer_def = 3621, hit = 34734, dodge = 3240, crit_hurt = 3381, crit_def = 801, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250307) ->
    #mon{
        mid = 250307,
        name = <<"307江湖高手">>,
        boss = 0,
        level = 123,
        attr = #bt_attr{hp_lim = 1133808, mp_lim = 13454, inner_att = 9354, outer_att = 9354, inner_def = 3687, outer_def = 3687, hit = 35356, dodge = 3298, crit_hurt = 3447, crit_def = 818, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250308) ->
    #mon{
        mid = 250308,
        name = <<"308江湖高手">>,
        boss = 0,
        level = 123,
        attr = #bt_attr{hp_lim = 1133808, mp_lim = 13454, inner_att = 9354, outer_att = 9354, inner_def = 3687, outer_def = 3687, hit = 35356, dodge = 3298, crit_hurt = 3447, crit_def = 818, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250309) ->
    #mon{
        mid = 250309,
        name = <<"309江湖高手">>,
        boss = 0,
        level = 123,
        attr = #bt_attr{hp_lim = 1133808, mp_lim = 13454, inner_att = 9354, outer_att = 9354, inner_def = 3687, outer_def = 3687, hit = 35356, dodge = 3298, crit_hurt = 3447, crit_def = 818, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250310) ->
    #mon{
        mid = 250310,
        name = <<"310江湖高手">>,
        boss = 0,
        level = 124,
        attr = #bt_attr{hp_lim = 1152672, mp_lim = 13560, inner_att = 9492, outer_att = 9492, inner_def = 3750, outer_def = 3750, hit = 35957, dodge = 3353, crit_hurt = 3501, crit_def = 830, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250311) ->
    #mon{
        mid = 250311,
        name = <<"311江湖高手">>,
        boss = 0,
        level = 124,
        attr = #bt_attr{hp_lim = 1152672, mp_lim = 13560, inner_att = 9492, outer_att = 9492, inner_def = 3750, outer_def = 3750, hit = 35957, dodge = 3353, crit_hurt = 3501, crit_def = 830, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250312) ->
    #mon{
        mid = 250312,
        name = <<"312江湖高手">>,
        boss = 0,
        level = 124,
        attr = #bt_attr{hp_lim = 1152672, mp_lim = 13560, inner_att = 9492, outer_att = 9492, inner_def = 3750, outer_def = 3750, hit = 35957, dodge = 3353, crit_hurt = 3501, crit_def = 830, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250313) ->
    #mon{
        mid = 250313,
        name = <<"313江湖高手">>,
        boss = 0,
        level = 125,
        attr = #bt_attr{hp_lim = 1173708, mp_lim = 13671, inner_att = 9645, outer_att = 9645, inner_def = 3816, outer_def = 3816, hit = 36590, dodge = 3417, crit_hurt = 3572, crit_def = 847, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250314) ->
    #mon{
        mid = 250314,
        name = <<"314江湖高手">>,
        boss = 0,
        level = 125,
        attr = #bt_attr{hp_lim = 1173708, mp_lim = 13671, inner_att = 9645, outer_att = 9645, inner_def = 3816, outer_def = 3816, hit = 36590, dodge = 3417, crit_hurt = 3572, crit_def = 847, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250315) ->
    #mon{
        mid = 250315,
        name = <<"315江湖高手">>,
        boss = 0,
        level = 125,
        attr = #bt_attr{hp_lim = 1173708, mp_lim = 13671, inner_att = 9645, outer_att = 9645, inner_def = 3816, outer_def = 3816, hit = 36590, dodge = 3417, crit_hurt = 3572, crit_def = 847, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250316) ->
    #mon{
        mid = 250316,
        name = <<"316江湖高手">>,
        boss = 0,
        level = 126,
        attr = #bt_attr{hp_lim = 1192896, mp_lim = 13776, inner_att = 9786, outer_att = 9786, inner_def = 3880, outer_def = 3880, hit = 37196, dodge = 3470, crit_hurt = 3618, crit_def = 858, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250317) ->
    #mon{
        mid = 250317,
        name = <<"317江湖高手">>,
        boss = 0,
        level = 126,
        attr = #bt_attr{hp_lim = 1192896, mp_lim = 13776, inner_att = 9786, outer_att = 9786, inner_def = 3880, outer_def = 3880, hit = 37196, dodge = 3470, crit_hurt = 3618, crit_def = 858, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250318) ->
    #mon{
        mid = 250318,
        name = <<"318江湖高手">>,
        boss = 0,
        level = 126,
        attr = #bt_attr{hp_lim = 1192896, mp_lim = 13776, inner_att = 9786, outer_att = 9786, inner_def = 3880, outer_def = 3880, hit = 37196, dodge = 3470, crit_hurt = 3618, crit_def = 858, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250319) ->
    #mon{
        mid = 250319,
        name = <<"319江湖高手">>,
        boss = 0,
        level = 127,
        attr = #bt_attr{hp_lim = 1214304, mp_lim = 13887, inner_att = 9939, outer_att = 9939, inner_def = 3947, outer_def = 3947, hit = 37840, dodge = 3533, crit_hurt = 3691, crit_def = 874, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250320) ->
    #mon{
        mid = 250320,
        name = <<"320江湖高手">>,
        boss = 0,
        level = 127,
        attr = #bt_attr{hp_lim = 1214304, mp_lim = 13887, inner_att = 9939, outer_att = 9939, inner_def = 3947, outer_def = 3947, hit = 37840, dodge = 3533, crit_hurt = 3691, crit_def = 874, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250321) ->
    #mon{
        mid = 250321,
        name = <<"321江湖高手">>,
        boss = 0,
        level = 127,
        attr = #bt_attr{hp_lim = 1214304, mp_lim = 13887, inner_att = 9939, outer_att = 9939, inner_def = 3947, outer_def = 3947, hit = 37840, dodge = 3533, crit_hurt = 3691, crit_def = 874, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250322) ->
    #mon{
        mid = 250322,
        name = <<"322江湖高手">>,
        boss = 0,
        level = 128,
        attr = #bt_attr{hp_lim = 1233816, mp_lim = 13993, inner_att = 10083, outer_att = 10083, inner_def = 4012, outer_def = 4012, hit = 38461, dodge = 3587, crit_hurt = 3742, crit_def = 889, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250323) ->
    #mon{
        mid = 250323,
        name = <<"323江湖高手">>,
        boss = 0,
        level = 128,
        attr = #bt_attr{hp_lim = 1233816, mp_lim = 13993, inner_att = 10083, outer_att = 10083, inner_def = 4012, outer_def = 4012, hit = 38461, dodge = 3587, crit_hurt = 3742, crit_def = 889, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250324) ->
    #mon{
        mid = 250324,
        name = <<"324江湖高手">>,
        boss = 0,
        level = 128,
        attr = #bt_attr{hp_lim = 1233816, mp_lim = 13993, inner_att = 10083, outer_att = 10083, inner_def = 4012, outer_def = 4012, hit = 38461, dodge = 3587, crit_hurt = 3742, crit_def = 889, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250325) ->
    #mon{
        mid = 250325,
        name = <<"325江湖高手">>,
        boss = 0,
        level = 129,
        attr = #bt_attr{hp_lim = 1255584, mp_lim = 14104, inner_att = 10239, outer_att = 10239, inner_def = 4082, outer_def = 4082, hit = 39121, dodge = 3655, crit_hurt = 3816, crit_def = 904, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250326) ->
    #mon{
        mid = 250326,
        name = <<"326江湖高手">>,
        boss = 0,
        level = 129,
        attr = #bt_attr{hp_lim = 1255584, mp_lim = 14104, inner_att = 10239, outer_att = 10239, inner_def = 4082, outer_def = 4082, hit = 39121, dodge = 3655, crit_hurt = 3816, crit_def = 904, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250327) ->
    #mon{
        mid = 250327,
        name = <<"327江湖高手">>,
        boss = 0,
        level = 129,
        attr = #bt_attr{hp_lim = 1255584, mp_lim = 14104, inner_att = 10239, outer_att = 10239, inner_def = 4082, outer_def = 4082, hit = 39121, dodge = 3655, crit_hurt = 3816, crit_def = 904, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250328) ->
    #mon{
        mid = 250328,
        name = <<"328江湖高手">>,
        boss = 0,
        level = 130,
        attr = #bt_attr{hp_lim = 1275420, mp_lim = 14209, inner_att = 10386, outer_att = 10386, inner_def = 4147, outer_def = 4147, hit = 39742, dodge = 3710, crit_hurt = 3869, crit_def = 917, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250329) ->
    #mon{
        mid = 250329,
        name = <<"329江湖高手">>,
        boss = 0,
        level = 130,
        attr = #bt_attr{hp_lim = 1275420, mp_lim = 14209, inner_att = 10386, outer_att = 10386, inner_def = 4147, outer_def = 4147, hit = 39742, dodge = 3710, crit_hurt = 3869, crit_def = 917, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250330) ->
    #mon{
        mid = 250330,
        name = <<"330江湖高手">>,
        boss = 0,
        level = 130,
        attr = #bt_attr{hp_lim = 1275420, mp_lim = 14209, inner_att = 10386, outer_att = 10386, inner_def = 4147, outer_def = 4147, hit = 39742, dodge = 3710, crit_hurt = 3869, crit_def = 917, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250331) ->
    #mon{
        mid = 250331,
        name = <<"331江湖高手">>,
        boss = 0,
        level = 131,
        attr = #bt_attr{hp_lim = 1297548, mp_lim = 14320, inner_att = 10545, outer_att = 10545, inner_def = 4218, outer_def = 4218, hit = 40407, dodge = 3773, crit_hurt = 3939, crit_def = 934, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250332) ->
    #mon{
        mid = 250332,
        name = <<"332江湖高手">>,
        boss = 0,
        level = 131,
        attr = #bt_attr{hp_lim = 1297548, mp_lim = 14320, inner_att = 10545, outer_att = 10545, inner_def = 4218, outer_def = 4218, hit = 40407, dodge = 3773, crit_hurt = 3939, crit_def = 934, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250333) ->
    #mon{
        mid = 250333,
        name = <<"333江湖高手">>,
        boss = 0,
        level = 131,
        attr = #bt_attr{hp_lim = 1297548, mp_lim = 14320, inner_att = 10545, outer_att = 10545, inner_def = 4218, outer_def = 4218, hit = 40407, dodge = 3773, crit_hurt = 3939, crit_def = 934, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250334) ->
    #mon{
        mid = 250334,
        name = <<"334江湖高手">>,
        boss = 0,
        level = 132,
        attr = #bt_attr{hp_lim = 1317708, mp_lim = 14426, inner_att = 10692, outer_att = 10692, inner_def = 4284, outer_def = 4284, hit = 41049, dodge = 3831, crit_hurt = 3997, crit_def = 948, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250335) ->
    #mon{
        mid = 250335,
        name = <<"335江湖高手">>,
        boss = 0,
        level = 132,
        attr = #bt_attr{hp_lim = 1317708, mp_lim = 14426, inner_att = 10692, outer_att = 10692, inner_def = 4284, outer_def = 4284, hit = 41049, dodge = 3831, crit_hurt = 3997, crit_def = 948, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250336) ->
    #mon{
        mid = 250336,
        name = <<"336江湖高手">>,
        boss = 0,
        level = 132,
        attr = #bt_attr{hp_lim = 1317708, mp_lim = 14426, inner_att = 10692, outer_att = 10692, inner_def = 4284, outer_def = 4284, hit = 41049, dodge = 3831, crit_hurt = 3997, crit_def = 948, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250337) ->
    #mon{
        mid = 250337,
        name = <<"337江湖高手">>,
        boss = 0,
        level = 133,
        attr = #bt_attr{hp_lim = 1340196, mp_lim = 14537, inner_att = 10851, outer_att = 10851, inner_def = 4355, outer_def = 4355, hit = 41731, dodge = 3899, crit_hurt = 4073, crit_def = 966, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250338) ->
    #mon{
        mid = 250338,
        name = <<"338江湖高手">>,
        boss = 0,
        level = 133,
        attr = #bt_attr{hp_lim = 1340196, mp_lim = 14537, inner_att = 10851, outer_att = 10851, inner_def = 4355, outer_def = 4355, hit = 41731, dodge = 3899, crit_hurt = 4073, crit_def = 966, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250339) ->
    #mon{
        mid = 250339,
        name = <<"339江湖高手">>,
        boss = 0,
        level = 133,
        attr = #bt_attr{hp_lim = 1340196, mp_lim = 14537, inner_att = 10851, outer_att = 10851, inner_def = 4355, outer_def = 4355, hit = 41731, dodge = 3899, crit_hurt = 4073, crit_def = 966, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250340) ->
    #mon{
        mid = 250340,
        name = <<"340江湖高手">>,
        boss = 0,
        level = 134,
        attr = #bt_attr{hp_lim = 1360680, mp_lim = 14642, inner_att = 11001, outer_att = 11001, inner_def = 4424, outer_def = 4424, hit = 42377, dodge = 3956, crit_hurt = 4123, crit_def = 979, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250341) ->
    #mon{
        mid = 250341,
        name = <<"341江湖高手">>,
        boss = 0,
        level = 134,
        attr = #bt_attr{hp_lim = 1360680, mp_lim = 14642, inner_att = 11001, outer_att = 11001, inner_def = 4424, outer_def = 4424, hit = 42377, dodge = 3956, crit_hurt = 4123, crit_def = 979, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250342) ->
    #mon{
        mid = 250342,
        name = <<"342江湖高手">>,
        boss = 0,
        level = 134,
        attr = #bt_attr{hp_lim = 1360680, mp_lim = 14642, inner_att = 11001, outer_att = 11001, inner_def = 4424, outer_def = 4424, hit = 42377, dodge = 3956, crit_hurt = 4123, crit_def = 979, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250343) ->
    #mon{
        mid = 250343,
        name = <<"343江湖高手">>,
        boss = 0,
        level = 135,
        attr = #bt_attr{hp_lim = 1383528, mp_lim = 14753, inner_att = 11166, outer_att = 11166, inner_def = 4496, outer_def = 4496, hit = 43058, dodge = 4023, crit_hurt = 4200, crit_def = 994, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250344) ->
    #mon{
        mid = 250344,
        name = <<"344江湖高手">>,
        boss = 0,
        level = 135,
        attr = #bt_attr{hp_lim = 1383528, mp_lim = 14753, inner_att = 11166, outer_att = 11166, inner_def = 4496, outer_def = 4496, hit = 43058, dodge = 4023, crit_hurt = 4200, crit_def = 994, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250345) ->
    #mon{
        mid = 250345,
        name = <<"345江湖高手">>,
        boss = 0,
        level = 135,
        attr = #bt_attr{hp_lim = 1383528, mp_lim = 14753, inner_att = 11166, outer_att = 11166, inner_def = 4496, outer_def = 4496, hit = 43058, dodge = 4023, crit_hurt = 4200, crit_def = 994, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250346) ->
    #mon{
        mid = 250346,
        name = <<"346江湖高手">>,
        boss = 0,
        level = 136,
        attr = #bt_attr{hp_lim = 1404336, mp_lim = 14859, inner_att = 11319, outer_att = 11319, inner_def = 4565, outer_def = 4565, hit = 43720, dodge = 4081, crit_hurt = 4255, crit_def = 1011, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250347) ->
    #mon{
        mid = 250347,
        name = <<"347江湖高手">>,
        boss = 0,
        level = 136,
        attr = #bt_attr{hp_lim = 1404336, mp_lim = 14859, inner_att = 11319, outer_att = 11319, inner_def = 4565, outer_def = 4565, hit = 43720, dodge = 4081, crit_hurt = 4255, crit_def = 1011, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250348) ->
    #mon{
        mid = 250348,
        name = <<"348江湖高手">>,
        boss = 0,
        level = 136,
        attr = #bt_attr{hp_lim = 1404336, mp_lim = 14859, inner_att = 11319, outer_att = 11319, inner_def = 4565, outer_def = 4565, hit = 43720, dodge = 4081, crit_hurt = 4255, crit_def = 1011, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250349) ->
    #mon{
        mid = 250349,
        name = <<"349江湖高手">>,
        boss = 0,
        level = 137,
        attr = #bt_attr{hp_lim = 1427556, mp_lim = 14970, inner_att = 11481, outer_att = 11481, inner_def = 4638, outer_def = 4638, hit = 44424, dodge = 4152, crit_hurt = 4334, crit_def = 1027, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250350) ->
    #mon{
        mid = 250350,
        name = <<"350江湖高手">>,
        boss = 0,
        level = 137,
        attr = #bt_attr{hp_lim = 1427556, mp_lim = 14970, inner_att = 11481, outer_att = 11481, inner_def = 4638, outer_def = 4638, hit = 44424, dodge = 4152, crit_hurt = 4334, crit_def = 1027, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250351) ->
    #mon{
        mid = 250351,
        name = <<"351江湖高手">>,
        boss = 0,
        level = 137,
        attr = #bt_attr{hp_lim = 1427556, mp_lim = 14970, inner_att = 11481, outer_att = 11481, inner_def = 4638, outer_def = 4638, hit = 44424, dodge = 4152, crit_hurt = 4334, crit_def = 1027, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250352) ->
    #mon{
        mid = 250352,
        name = <<"352江湖高手">>,
        boss = 0,
        level = 138,
        attr = #bt_attr{hp_lim = 1448688, mp_lim = 15075, inner_att = 11637, outer_att = 11637, inner_def = 4709, outer_def = 4709, hit = 45090, dodge = 4210, crit_hurt = 4389, crit_def = 1040, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250353) ->
    #mon{
        mid = 250353,
        name = <<"353江湖高手">>,
        boss = 0,
        level = 138,
        attr = #bt_attr{hp_lim = 1448688, mp_lim = 15075, inner_att = 11637, outer_att = 11637, inner_def = 4709, outer_def = 4709, hit = 45090, dodge = 4210, crit_hurt = 4389, crit_def = 1040, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250354) ->
    #mon{
        mid = 250354,
        name = <<"354江湖高手">>,
        boss = 0,
        level = 138,
        attr = #bt_attr{hp_lim = 1448688, mp_lim = 15075, inner_att = 11637, outer_att = 11637, inner_def = 4709, outer_def = 4709, hit = 45090, dodge = 4210, crit_hurt = 4389, crit_def = 1040, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250355) ->
    #mon{
        mid = 250355,
        name = <<"355江湖高手">>,
        boss = 0,
        level = 139,
        attr = #bt_attr{hp_lim = 1472268, mp_lim = 15186, inner_att = 11805, outer_att = 11805, inner_def = 4783, outer_def = 4783, hit = 45798, dodge = 4279, crit_hurt = 4465, crit_def = 1060, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250356) ->
    #mon{
        mid = 250356,
        name = <<"356江湖高手">>,
        boss = 0,
        level = 139,
        attr = #bt_attr{hp_lim = 1472268, mp_lim = 15186, inner_att = 11805, outer_att = 11805, inner_def = 4783, outer_def = 4783, hit = 45798, dodge = 4279, crit_hurt = 4465, crit_def = 1060, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250357) ->
    #mon{
        mid = 250357,
        name = <<"357江湖高手">>,
        boss = 0,
        level = 139,
        attr = #bt_attr{hp_lim = 1472268, mp_lim = 15186, inner_att = 11805, outer_att = 11805, inner_def = 4783, outer_def = 4783, hit = 45798, dodge = 4279, crit_hurt = 4465, crit_def = 1060, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250358) ->
    #mon{
        mid = 250358,
        name = <<"358江湖高手">>,
        boss = 0,
        level = 140,
        attr = #bt_attr{hp_lim = 1493712, mp_lim = 15292, inner_att = 11961, outer_att = 11961, inner_def = 4854, outer_def = 4854, hit = 46475, dodge = 4341, crit_hurt = 4526, crit_def = 1073, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250359) ->
    #mon{
        mid = 250359,
        name = <<"359江湖高手">>,
        boss = 0,
        level = 140,
        attr = #bt_attr{hp_lim = 1493712, mp_lim = 15292, inner_att = 11961, outer_att = 11961, inner_def = 4854, outer_def = 4854, hit = 46475, dodge = 4341, crit_hurt = 4526, crit_def = 1073, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250360) ->
    #mon{
        mid = 250360,
        name = <<"360江湖高手">>,
        boss = 0,
        level = 140,
        attr = #bt_attr{hp_lim = 1493712, mp_lim = 15292, inner_att = 11961, outer_att = 11961, inner_def = 4854, outer_def = 4854, hit = 46475, dodge = 4341, crit_hurt = 4526, crit_def = 1073, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250361) ->
    #mon{
        mid = 250361,
        name = <<"361江湖高手">>,
        boss = 0,
        level = 141,
        attr = #bt_attr{hp_lim = 1517652, mp_lim = 15403, inner_att = 12132, outer_att = 12132, inner_def = 4930, outer_def = 4930, hit = 47200, dodge = 4414, crit_hurt = 4607, crit_def = 1093, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250362) ->
    #mon{
        mid = 250362,
        name = <<"362江湖高手">>,
        boss = 0,
        level = 141,
        attr = #bt_attr{hp_lim = 1517652, mp_lim = 15403, inner_att = 12132, outer_att = 12132, inner_def = 4930, outer_def = 4930, hit = 47200, dodge = 4414, crit_hurt = 4607, crit_def = 1093, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250363) ->
    #mon{
        mid = 250363,
        name = <<"363江湖高手">>,
        boss = 0,
        level = 141,
        attr = #bt_attr{hp_lim = 1517652, mp_lim = 15403, inner_att = 12132, outer_att = 12132, inner_def = 4930, outer_def = 4930, hit = 47200, dodge = 4414, crit_hurt = 4607, crit_def = 1093, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250364) ->
    #mon{
        mid = 250364,
        name = <<"364江湖高手">>,
        boss = 0,
        level = 142,
        attr = #bt_attr{hp_lim = 1539432, mp_lim = 15508, inner_att = 12291, outer_att = 12291, inner_def = 5002, outer_def = 5002, hit = 47887, dodge = 4475, crit_hurt = 4660, crit_def = 1106, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250365) ->
    #mon{
        mid = 250365,
        name = <<"365江湖高手">>,
        boss = 0,
        level = 142,
        attr = #bt_attr{hp_lim = 1539432, mp_lim = 15508, inner_att = 12291, outer_att = 12291, inner_def = 5002, outer_def = 5002, hit = 47887, dodge = 4475, crit_hurt = 4660, crit_def = 1106, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250366) ->
    #mon{
        mid = 250366,
        name = <<"366江湖高手">>,
        boss = 0,
        level = 142,
        attr = #bt_attr{hp_lim = 1539432, mp_lim = 15508, inner_att = 12291, outer_att = 12291, inner_def = 5002, outer_def = 5002, hit = 47887, dodge = 4475, crit_hurt = 4660, crit_def = 1106, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250367) ->
    #mon{
        mid = 250367,
        name = <<"367江湖高手">>,
        boss = 0,
        level = 143,
        attr = #bt_attr{hp_lim = 1563732, mp_lim = 15619, inner_att = 12462, outer_att = 12462, inner_def = 5079, outer_def = 5079, hit = 48617, dodge = 4546, crit_hurt = 4742, crit_def = 1123, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250368) ->
    #mon{
        mid = 250368,
        name = <<"368江湖高手">>,
        boss = 0,
        level = 143,
        attr = #bt_attr{hp_lim = 1563732, mp_lim = 15619, inner_att = 12462, outer_att = 12462, inner_def = 5079, outer_def = 5079, hit = 48617, dodge = 4546, crit_hurt = 4742, crit_def = 1123, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250369) ->
    #mon{
        mid = 250369,
        name = <<"369江湖高手">>,
        boss = 0,
        level = 143,
        attr = #bt_attr{hp_lim = 1563732, mp_lim = 15619, inner_att = 12462, outer_att = 12462, inner_def = 5079, outer_def = 5079, hit = 48617, dodge = 4546, crit_hurt = 4742, crit_def = 1123, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250370) ->
    #mon{
        mid = 250370,
        name = <<"370江湖高手">>,
        boss = 0,
        level = 144,
        attr = #bt_attr{hp_lim = 1585836, mp_lim = 15725, inner_att = 12624, outer_att = 12624, inner_def = 5153, outer_def = 5153, hit = 49320, dodge = 4607, crit_hurt = 4800, crit_def = 1140, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250371) ->
    #mon{
        mid = 250371,
        name = <<"371江湖高手">>,
        boss = 0,
        level = 144,
        attr = #bt_attr{hp_lim = 1585836, mp_lim = 15725, inner_att = 12624, outer_att = 12624, inner_def = 5153, outer_def = 5153, hit = 49320, dodge = 4607, crit_hurt = 4800, crit_def = 1140, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250372) ->
    #mon{
        mid = 250372,
        name = <<"372江湖高手">>,
        boss = 0,
        level = 144,
        attr = #bt_attr{hp_lim = 1585836, mp_lim = 15725, inner_att = 12624, outer_att = 12624, inner_def = 5153, outer_def = 5153, hit = 49320, dodge = 4607, crit_hurt = 4800, crit_def = 1140, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250373) ->
    #mon{
        mid = 250373,
        name = <<"373江湖高手">>,
        boss = 0,
        level = 145,
        attr = #bt_attr{hp_lim = 1610496, mp_lim = 15836, inner_att = 10785, outer_att = 10785, inner_def = 5230, outer_def = 5230, hit = 50060, dodge = 4682, crit_hurt = 4884, crit_def = 1158, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250374) ->
    #mon{
        mid = 250374,
        name = <<"374江湖高手">>,
        boss = 0,
        level = 145,
        attr = #bt_attr{hp_lim = 1610496, mp_lim = 15836, inner_att = 10785, outer_att = 10785, inner_def = 5230, outer_def = 5230, hit = 50060, dodge = 4682, crit_hurt = 4884, crit_def = 1158, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250375) ->
    #mon{
        mid = 250375,
        name = <<"375江湖高手">>,
        boss = 0,
        level = 145,
        attr = #bt_attr{hp_lim = 1610496, mp_lim = 15836, inner_att = 10785, outer_att = 10785, inner_def = 5230, outer_def = 5230, hit = 50060, dodge = 4682, crit_hurt = 4884, crit_def = 1158, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(250376) ->
    #mon{
        mid = 250376,
        name = <<"376江湖高手">>,
        boss = 0,
        level = 146,
        attr = #bt_attr{hp_lim = 1632924, mp_lim = 15941, inner_att = 10923, outer_att = 10923, inner_def = 5305, outer_def = 5305, hit = 50767, dodge = 4744, crit_hurt = 4943, crit_def = 1171, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 8,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1012,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

