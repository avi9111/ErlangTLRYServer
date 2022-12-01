%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_19
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_19).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(190001) ->
    #mon{
        mid = 190001,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1077, mp_lim = 464, inner_att = 23, outer_att = 23, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190002) ->
    #mon{
        mid = 190002,
        name = <<"门派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 1851, mp_lim = 786, inner_att = 33, outer_att = 33, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190003) ->
    #mon{
        mid = 190003,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 2772, mp_lim = 1114, inner_att = 44, outer_att = 44, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190004) ->
    #mon{
        mid = 190004,
        name = <<"江湖侠客">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 3735, mp_lim = 1436, inner_att = 56, outer_att = 56, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190005) ->
    #mon{
        mid = 190005,
        name = <<"虎">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 4854, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190006) ->
    #mon{
        mid = 190006,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 6009, mp_lim = 2085, inner_att = 84, outer_att = 84, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190007) ->
    #mon{
        mid = 190007,
        name = <<"门派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 7566, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190008) ->
    #mon{
        mid = 190008,
        name = <<"混江小龙">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 9354, mp_lim = 2735, inner_att = 125, outer_att = 125, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190009) ->
    #mon{
        mid = 190009,
        name = <<"碧鳞僵尸">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190010) ->
    #mon{
        mid = 190010,
        name = <<"鹰">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190011) ->
    #mon{
        mid = 190011,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190012) ->
    #mon{
        mid = 190012,
        name = <<"门派弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190013) ->
    #mon{
        mid = 190013,
        name = <<"守卫">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190014) ->
    #mon{
        mid = 190014,
        name = <<"熊猫">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190015) ->
    #mon{
        mid = 190015,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190016) ->
    #mon{
        mid = 190016,
        name = <<"小卒">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190017) ->
    #mon{
        mid = 190017,
        name = <<"门派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190018) ->
    #mon{
        mid = 190018,
        name = <<"马贼">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190019) ->
    #mon{
        mid = 190019,
        name = <<"乌龟">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190020) ->
    #mon{
        mid = 190020,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190021) ->
    #mon{
        mid = 190021,
        name = <<"幻蝶">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 69417, mp_lim = 6959, inner_att = 852, outer_att = 852, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190022) ->
    #mon{
        mid = 190022,
        name = <<"墨虎">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 76863, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190023) ->
    #mon{
        mid = 190023,
        name = <<"小熊">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 84945, mp_lim = 7609, inner_att = 1038, outer_att = 1038, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190024) ->
    #mon{
        mid = 190024,
        name = <<"穷奇">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 93150, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190025) ->
    #mon{
        mid = 190025,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 101607, mp_lim = 8258, inner_att = 1236, outer_att = 1236, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190026) ->
    #mon{
        mid = 190026,
        name = <<"鹿">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 109275, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190027) ->
    #mon{
        mid = 190027,
        name = <<"护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 117531, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190028) ->
    #mon{
        mid = 190028,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 125766, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190029) ->
    #mon{
        mid = 190029,
        name = <<"太古龙魂">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 134610, mp_lim = 9557, inner_att = 1626, outer_att = 1626, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190030) ->
    #mon{
        mid = 190030,
        name = <<"小卒">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 143412, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190031) ->
    #mon{
        mid = 190031,
        name = <<"山猪">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 154371, mp_lim = 10207, inner_att = 1841, outer_att = 1841, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190032) ->
    #mon{
        mid = 190032,
        name = <<"教头">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 165357, mp_lim = 10529, inner_att = 1953, outer_att = 1953, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190033) ->
    #mon{
        mid = 190033,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 177102, mp_lim = 10856, inner_att = 2070, outer_att = 2070, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190034) ->
    #mon{
        mid = 190034,
        name = <<"九黎妖虎">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 188844, mp_lim = 11178, inner_att = 2188, outer_att = 2188, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190035) ->
    #mon{
        mid = 190035,
        name = <<"幻蝶">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 201375, mp_lim = 11506, inner_att = 2312, outer_att = 2312, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190036) ->
    #mon{
        mid = 190036,
        name = <<"门派弟子">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 213876, mp_lim = 11828, inner_att = 2436, outer_att = 2436, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(190101) ->
    #mon{
        mid = 190101,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1077, mp_lim = 464, inner_att = 23, outer_att = 23, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190102) ->
    #mon{
        mid = 190102,
        name = <<"门派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 1851, mp_lim = 786, inner_att = 33, outer_att = 33, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190103) ->
    #mon{
        mid = 190103,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 2772, mp_lim = 1114, inner_att = 44, outer_att = 44, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190104) ->
    #mon{
        mid = 190104,
        name = <<"江湖侠客">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 3735, mp_lim = 1436, inner_att = 56, outer_att = 56, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190105) ->
    #mon{
        mid = 190105,
        name = <<"虎">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 4854, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190106) ->
    #mon{
        mid = 190106,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 6009, mp_lim = 2085, inner_att = 84, outer_att = 84, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190107) ->
    #mon{
        mid = 190107,
        name = <<"门派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 7566, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190108) ->
    #mon{
        mid = 190108,
        name = <<"混江小龙">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 9354, mp_lim = 2735, inner_att = 125, outer_att = 125, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190109) ->
    #mon{
        mid = 190109,
        name = <<"碧鳞僵尸">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190110) ->
    #mon{
        mid = 190110,
        name = <<"鹰">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190111) ->
    #mon{
        mid = 190111,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190112) ->
    #mon{
        mid = 190112,
        name = <<"门派弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190113) ->
    #mon{
        mid = 190113,
        name = <<"守卫">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190114) ->
    #mon{
        mid = 190114,
        name = <<"熊猫">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190115) ->
    #mon{
        mid = 190115,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190116) ->
    #mon{
        mid = 190116,
        name = <<"小卒">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190117) ->
    #mon{
        mid = 190117,
        name = <<"门派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190118) ->
    #mon{
        mid = 190118,
        name = <<"马贼">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190119) ->
    #mon{
        mid = 190119,
        name = <<"乌龟">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190120) ->
    #mon{
        mid = 190120,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190121) ->
    #mon{
        mid = 190121,
        name = <<"幻蝶">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 69417, mp_lim = 6959, inner_att = 852, outer_att = 852, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190122) ->
    #mon{
        mid = 190122,
        name = <<"墨虎">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 76863, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190123) ->
    #mon{
        mid = 190123,
        name = <<"小熊">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 84945, mp_lim = 7609, inner_att = 1038, outer_att = 1038, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190124) ->
    #mon{
        mid = 190124,
        name = <<"穷奇">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 93150, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190125) ->
    #mon{
        mid = 190125,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 101607, mp_lim = 8258, inner_att = 1236, outer_att = 1236, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190126) ->
    #mon{
        mid = 190126,
        name = <<"鹿">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 109275, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190127) ->
    #mon{
        mid = 190127,
        name = <<"护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 117531, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190128) ->
    #mon{
        mid = 190128,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 125766, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190129) ->
    #mon{
        mid = 190129,
        name = <<"太古龙魂">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 134610, mp_lim = 9557, inner_att = 1626, outer_att = 1626, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190130) ->
    #mon{
        mid = 190130,
        name = <<"小卒">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 143412, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190131) ->
    #mon{
        mid = 190131,
        name = <<"山猪">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 154371, mp_lim = 10207, inner_att = 1841, outer_att = 1841, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190132) ->
    #mon{
        mid = 190132,
        name = <<"教头">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 165357, mp_lim = 10529, inner_att = 1953, outer_att = 1953, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190133) ->
    #mon{
        mid = 190133,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 177102, mp_lim = 10856, inner_att = 2070, outer_att = 2070, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190134) ->
    #mon{
        mid = 190134,
        name = <<"九黎妖虎">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 188844, mp_lim = 11178, inner_att = 2188, outer_att = 2188, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190135) ->
    #mon{
        mid = 190135,
        name = <<"幻蝶">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 201375, mp_lim = 11506, inner_att = 2312, outer_att = 2312, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190136) ->
    #mon{
        mid = 190136,
        name = <<"门派弟子">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 213876, mp_lim = 11828, inner_att = 2436, outer_att = 2436, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3011,
        args = [],
        exp = 0
    };
get(190201) ->
    #mon{
        mid = 190201,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1077, mp_lim = 464, inner_att = 23, outer_att = 23, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190202) ->
    #mon{
        mid = 190202,
        name = <<"门派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 1851, mp_lim = 786, inner_att = 33, outer_att = 33, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190203) ->
    #mon{
        mid = 190203,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 2772, mp_lim = 1114, inner_att = 44, outer_att = 44, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190204) ->
    #mon{
        mid = 190204,
        name = <<"江湖侠客">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 3735, mp_lim = 1436, inner_att = 56, outer_att = 56, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190205) ->
    #mon{
        mid = 190205,
        name = <<"虎">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 4854, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190206) ->
    #mon{
        mid = 190206,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 6009, mp_lim = 2085, inner_att = 84, outer_att = 84, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190207) ->
    #mon{
        mid = 190207,
        name = <<"门派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 7566, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190208) ->
    #mon{
        mid = 190208,
        name = <<"混江小龙">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 9354, mp_lim = 2735, inner_att = 125, outer_att = 125, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190209) ->
    #mon{
        mid = 190209,
        name = <<"碧鳞僵尸">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190210) ->
    #mon{
        mid = 190210,
        name = <<"鹰">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190211) ->
    #mon{
        mid = 190211,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190212) ->
    #mon{
        mid = 190212,
        name = <<"门派弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190213) ->
    #mon{
        mid = 190213,
        name = <<"守卫">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190214) ->
    #mon{
        mid = 190214,
        name = <<"熊猫">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190215) ->
    #mon{
        mid = 190215,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190216) ->
    #mon{
        mid = 190216,
        name = <<"小卒">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190217) ->
    #mon{
        mid = 190217,
        name = <<"门派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190218) ->
    #mon{
        mid = 190218,
        name = <<"马贼">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190219) ->
    #mon{
        mid = 190219,
        name = <<"乌龟">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190220) ->
    #mon{
        mid = 190220,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190221) ->
    #mon{
        mid = 190221,
        name = <<"幻蝶">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 69417, mp_lim = 6959, inner_att = 852, outer_att = 852, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190222) ->
    #mon{
        mid = 190222,
        name = <<"墨虎">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 76863, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190223) ->
    #mon{
        mid = 190223,
        name = <<"小熊">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 84945, mp_lim = 7609, inner_att = 1038, outer_att = 1038, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190224) ->
    #mon{
        mid = 190224,
        name = <<"穷奇">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 93150, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190225) ->
    #mon{
        mid = 190225,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 101607, mp_lim = 8258, inner_att = 1236, outer_att = 1236, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190226) ->
    #mon{
        mid = 190226,
        name = <<"鹿">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 109275, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190227) ->
    #mon{
        mid = 190227,
        name = <<"护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 117531, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190228) ->
    #mon{
        mid = 190228,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 125766, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190229) ->
    #mon{
        mid = 190229,
        name = <<"太古龙魂">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 134610, mp_lim = 9557, inner_att = 1626, outer_att = 1626, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190230) ->
    #mon{
        mid = 190230,
        name = <<"小卒">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 143412, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190231) ->
    #mon{
        mid = 190231,
        name = <<"山猪">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 154371, mp_lim = 10207, inner_att = 1841, outer_att = 1841, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190232) ->
    #mon{
        mid = 190232,
        name = <<"教头">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 165357, mp_lim = 10529, inner_att = 1953, outer_att = 1953, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190233) ->
    #mon{
        mid = 190233,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 177102, mp_lim = 10856, inner_att = 2070, outer_att = 2070, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190234) ->
    #mon{
        mid = 190234,
        name = <<"九黎妖虎">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 188844, mp_lim = 11178, inner_att = 2188, outer_att = 2188, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190235) ->
    #mon{
        mid = 190235,
        name = <<"幻蝶">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 201375, mp_lim = 11506, inner_att = 2312, outer_att = 2312, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190236) ->
    #mon{
        mid = 190236,
        name = <<"门派弟子">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 213876, mp_lim = 11828, inner_att = 2436, outer_att = 2436, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(190301) ->
    #mon{
        mid = 190301,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 3,
        attr = #bt_attr{hp_lim = 1077, mp_lim = 464, inner_att = 23, outer_att = 23, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190302) ->
    #mon{
        mid = 190302,
        name = <<"门派弟子">>,
        boss = 0,
        level = 6,
        attr = #bt_attr{hp_lim = 1851, mp_lim = 786, inner_att = 33, outer_att = 33, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190303) ->
    #mon{
        mid = 190303,
        name = <<"翻江蜃">>,
        boss = 0,
        level = 9,
        attr = #bt_attr{hp_lim = 2772, mp_lim = 1114, inner_att = 44, outer_att = 44, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190304) ->
    #mon{
        mid = 190304,
        name = <<"江湖侠客">>,
        boss = 0,
        level = 12,
        attr = #bt_attr{hp_lim = 3735, mp_lim = 1436, inner_att = 56, outer_att = 56, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190305) ->
    #mon{
        mid = 190305,
        name = <<"虎">>,
        boss = 0,
        level = 15,
        attr = #bt_attr{hp_lim = 4854, mp_lim = 1763, inner_att = 69, outer_att = 69, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190306) ->
    #mon{
        mid = 190306,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 6009, mp_lim = 2085, inner_att = 84, outer_att = 84, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190307) ->
    #mon{
        mid = 190307,
        name = <<"门派弟子">>,
        boss = 0,
        level = 21,
        attr = #bt_attr{hp_lim = 7566, mp_lim = 2413, inner_att = 103, outer_att = 103, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190308) ->
    #mon{
        mid = 190308,
        name = <<"混江小龙">>,
        boss = 0,
        level = 24,
        attr = #bt_attr{hp_lim = 9354, mp_lim = 2735, inner_att = 125, outer_att = 125, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190309) ->
    #mon{
        mid = 190309,
        name = <<"碧鳞僵尸">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 11412, mp_lim = 3062, inner_att = 150, outer_att = 150, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190310) ->
    #mon{
        mid = 190310,
        name = <<"鹰">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 13575, mp_lim = 3384, inner_att = 177, outer_att = 177, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190311) ->
    #mon{
        mid = 190311,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 16026, mp_lim = 3712, inner_att = 207, outer_att = 207, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190312) ->
    #mon{
        mid = 190312,
        name = <<"门派弟子">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 18570, mp_lim = 4034, inner_att = 238, outer_att = 238, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190313) ->
    #mon{
        mid = 190313,
        name = <<"守卫">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 22725, mp_lim = 4361, inner_att = 289, outer_att = 289, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190314) ->
    #mon{
        mid = 190314,
        name = <<"熊猫">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 27141, mp_lim = 4683, inner_att = 343, outer_att = 343, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190315) ->
    #mon{
        mid = 190315,
        name = <<"江湖小卒">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 32082, mp_lim = 5011, inner_att = 403, outer_att = 403, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190316) ->
    #mon{
        mid = 190316,
        name = <<"小卒">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 37257, mp_lim = 5333, inner_att = 466, outer_att = 466, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190317) ->
    #mon{
        mid = 190317,
        name = <<"门派弟子">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 42984, mp_lim = 5660, inner_att = 535, outer_att = 535, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190318) ->
    #mon{
        mid = 190318,
        name = <<"马贼">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 48918, mp_lim = 5982, inner_att = 607, outer_att = 607, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190319) ->
    #mon{
        mid = 190319,
        name = <<"乌龟">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 55428, mp_lim = 6310, inner_att = 685, outer_att = 685, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190320) ->
    #mon{
        mid = 190320,
        name = <<"黑衣杀手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 62118, mp_lim = 6632, inner_att = 765, outer_att = 765, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190321) ->
    #mon{
        mid = 190321,
        name = <<"幻蝶">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 69417, mp_lim = 6959, inner_att = 852, outer_att = 852, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190322) ->
    #mon{
        mid = 190322,
        name = <<"墨虎">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 76863, mp_lim = 7281, inner_att = 942, outer_att = 942, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190323) ->
    #mon{
        mid = 190323,
        name = <<"小熊">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 84945, mp_lim = 7609, inner_att = 1038, outer_att = 1038, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190324) ->
    #mon{
        mid = 190324,
        name = <<"穷奇">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 93150, mp_lim = 7931, inner_att = 1136, outer_att = 1136, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190325) ->
    #mon{
        mid = 190325,
        name = <<"持刀卫士">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 101607, mp_lim = 8258, inner_att = 1236, outer_att = 1236, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190326) ->
    #mon{
        mid = 190326,
        name = <<"鹿">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 109275, mp_lim = 8580, inner_att = 1328, outer_att = 1328, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190327) ->
    #mon{
        mid = 190327,
        name = <<"护卫">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 117531, mp_lim = 8908, inner_att = 1424, outer_att = 1424, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190328) ->
    #mon{
        mid = 190328,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 125766, mp_lim = 9230, inner_att = 1523, outer_att = 1523, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190329) ->
    #mon{
        mid = 190329,
        name = <<"太古龙魂">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 134610, mp_lim = 9557, inner_att = 1626, outer_att = 1626, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190330) ->
    #mon{
        mid = 190330,
        name = <<"小卒">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 143412, mp_lim = 9879, inner_att = 1731, outer_att = 1731, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190331) ->
    #mon{
        mid = 190331,
        name = <<"山猪">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 154371, mp_lim = 10207, inner_att = 1841, outer_att = 1841, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190332) ->
    #mon{
        mid = 190332,
        name = <<"教头">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 165357, mp_lim = 10529, inner_att = 1953, outer_att = 1953, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190333) ->
    #mon{
        mid = 190333,
        name = <<"江湖豪客">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 177102, mp_lim = 10856, inner_att = 2070, outer_att = 2070, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190334) ->
    #mon{
        mid = 190334,
        name = <<"九黎妖虎">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 188844, mp_lim = 11178, inner_att = 2188, outer_att = 2188, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190335) ->
    #mon{
        mid = 190335,
        name = <<"幻蝶">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 201375, mp_lim = 11506, inner_att = 2312, outer_att = 2312, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(190336) ->
    #mon{
        mid = 190336,
        name = <<"门派弟子">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 213876, mp_lim = 11828, inner_att = 2436, outer_att = 2436, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15010001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191001) ->
    #mon{
        mid = 191001,
        name = <<"天魔真君">>,
        boss = 1,
        level = 3,
        attr = #bt_attr{hp_lim = 11488, mp_lim = 464, inner_att = 92, outer_att = 92, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191002) ->
    #mon{
        mid = 191002,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 19744, mp_lim = 786, inner_att = 132, outer_att = 132, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191003) ->
    #mon{
        mid = 191003,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 9,
        attr = #bt_attr{hp_lim = 29568, mp_lim = 1114, inner_att = 176, outer_att = 176, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191004) ->
    #mon{
        mid = 191004,
        name = <<"不平道人">>,
        boss = 1,
        level = 12,
        attr = #bt_attr{hp_lim = 39840, mp_lim = 1436, inner_att = 224, outer_att = 224, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191005) ->
    #mon{
        mid = 191005,
        name = <<"天魔真君">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 51776, mp_lim = 1763, inner_att = 276, outer_att = 276, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191006) ->
    #mon{
        mid = 191006,
        name = <<"闵墨">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 64096, mp_lim = 2085, inner_att = 336, outer_att = 336, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191007) ->
    #mon{
        mid = 191007,
        name = <<"魔教护法">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 80704, mp_lim = 2413, inner_att = 412, outer_att = 412, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191008) ->
    #mon{
        mid = 191008,
        name = <<"慕容复">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 99776, mp_lim = 2735, inner_att = 500, outer_att = 500, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191009) ->
    #mon{
        mid = 191009,
        name = <<"哈大霸">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 121728, mp_lim = 3062, inner_att = 600, outer_att = 600, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191010) ->
    #mon{
        mid = 191010,
        name = <<"闵墨">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 144800, mp_lim = 3384, inner_att = 708, outer_att = 708, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191011) ->
    #mon{
        mid = 191011,
        name = <<"秦韵">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 170944, mp_lim = 3712, inner_att = 828, outer_att = 828, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191012) ->
    #mon{
        mid = 191012,
        name = <<"魔教长老">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 198080, mp_lim = 4034, inner_att = 952, outer_att = 952, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191013) ->
    #mon{
        mid = 191013,
        name = <<"司马林">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 242400, mp_lim = 4361, inner_att = 1156, outer_att = 1156, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191014) ->
    #mon{
        mid = 191014,
        name = <<"李秋水">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 289504, mp_lim = 4683, inner_att = 1372, outer_att = 1372, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191015) ->
    #mon{
        mid = 191015,
        name = <<"秦韵">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191016) ->
    #mon{
        mid = 191016,
        name = <<"陶青">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 397408, mp_lim = 5333, inner_att = 1864, outer_att = 1864, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191017) ->
    #mon{
        mid = 191017,
        name = <<"混江龙">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 2140, outer_att = 2140, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191018) ->
    #mon{
        mid = 191018,
        name = <<"姚伯当">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 521792, mp_lim = 5982, inner_att = 2428, outer_att = 2428, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191019) ->
    #mon{
        mid = 191019,
        name = <<"任平生">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 591232, mp_lim = 6310, inner_att = 2740, outer_att = 2740, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191020) ->
    #mon{
        mid = 191020,
        name = <<"陶青">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 662592, mp_lim = 6632, inner_att = 3060, outer_att = 3060, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191021) ->
    #mon{
        mid = 191021,
        name = <<"庞企">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 740448, mp_lim = 6959, inner_att = 3408, outer_att = 3408, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191022) ->
    #mon{
        mid = 191022,
        name = <<"演武守将">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 819872, mp_lim = 7281, inner_att = 3768, outer_att = 3768, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191023) ->
    #mon{
        mid = 191023,
        name = <<"叶二娘">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 906080, mp_lim = 7609, inner_att = 4152, outer_att = 4152, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191024) ->
    #mon{
        mid = 191024,
        name = <<"桑土公">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 993600, mp_lim = 7931, inner_att = 4544, outer_att = 4544, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191025) ->
    #mon{
        mid = 191025,
        name = <<"庞企">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 1083808, mp_lim = 8258, inner_att = 4944, outer_att = 4944, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191026) ->
    #mon{
        mid = 191026,
        name = <<"大猿王">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1165600, mp_lim = 8580, inner_att = 5312, outer_att = 5312, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191027) ->
    #mon{
        mid = 191027,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 5696, outer_att = 5696, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191028) ->
    #mon{
        mid = 191028,
        name = <<"岳老三">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1341504, mp_lim = 9230, inner_att = 6092, outer_att = 6092, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191029) ->
    #mon{
        mid = 191029,
        name = <<"乌老大">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 1435840, mp_lim = 9557, inner_att = 6504, outer_att = 6504, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191030) ->
    #mon{
        mid = 191030,
        name = <<"大猿王">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1529728, mp_lim = 9879, inner_att = 6924, outer_att = 6924, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191031) ->
    #mon{
        mid = 191031,
        name = <<"摘星子">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 1646624, mp_lim = 10207, inner_att = 7364, outer_att = 7364, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191032) ->
    #mon{
        mid = 191032,
        name = <<"红熊王">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 1763808, mp_lim = 10529, inner_att = 7812, outer_att = 7812, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191033) ->
    #mon{
        mid = 191033,
        name = <<"云中鹤">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 1889088, mp_lim = 10856, inner_att = 8280, outer_att = 8280, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191034) ->
    #mon{
        mid = 191034,
        name = <<"卓不凡">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 2014336, mp_lim = 11178, inner_att = 8752, outer_att = 8752, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191035) ->
    #mon{
        mid = 191035,
        name = <<"摘星子">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 2148000, mp_lim = 11506, inner_att = 9248, outer_att = 9248, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191036) ->
    #mon{
        mid = 191036,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 2281344, mp_lim = 11828, inner_att = 9744, outer_att = 9744, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 1015,
        args = [],
        exp = 0
    };
get(191101) ->
    #mon{
        mid = 191101,
        name = <<"天魔真君">>,
        boss = 1,
        level = 3,
        attr = #bt_attr{hp_lim = 11488, mp_lim = 464, inner_att = 92, outer_att = 92, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191102) ->
    #mon{
        mid = 191102,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 19744, mp_lim = 786, inner_att = 132, outer_att = 132, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191103) ->
    #mon{
        mid = 191103,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 9,
        attr = #bt_attr{hp_lim = 29568, mp_lim = 1114, inner_att = 176, outer_att = 176, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191104) ->
    #mon{
        mid = 191104,
        name = <<"不平道人">>,
        boss = 1,
        level = 12,
        attr = #bt_attr{hp_lim = 39840, mp_lim = 1436, inner_att = 224, outer_att = 224, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191105) ->
    #mon{
        mid = 191105,
        name = <<"天魔真君">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 51776, mp_lim = 1763, inner_att = 276, outer_att = 276, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191106) ->
    #mon{
        mid = 191106,
        name = <<"闵墨">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 64096, mp_lim = 2085, inner_att = 336, outer_att = 336, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191107) ->
    #mon{
        mid = 191107,
        name = <<"魔教护法">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 80704, mp_lim = 2413, inner_att = 412, outer_att = 412, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191108) ->
    #mon{
        mid = 191108,
        name = <<"慕容复">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 99776, mp_lim = 2735, inner_att = 500, outer_att = 500, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191109) ->
    #mon{
        mid = 191109,
        name = <<"哈大霸">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 121728, mp_lim = 3062, inner_att = 600, outer_att = 600, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191110) ->
    #mon{
        mid = 191110,
        name = <<"闵墨">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 144800, mp_lim = 3384, inner_att = 708, outer_att = 708, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191111) ->
    #mon{
        mid = 191111,
        name = <<"秦韵">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 170944, mp_lim = 3712, inner_att = 828, outer_att = 828, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191112) ->
    #mon{
        mid = 191112,
        name = <<"魔教长老">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 198080, mp_lim = 4034, inner_att = 952, outer_att = 952, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191113) ->
    #mon{
        mid = 191113,
        name = <<"司马林">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 242400, mp_lim = 4361, inner_att = 1156, outer_att = 1156, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191114) ->
    #mon{
        mid = 191114,
        name = <<"李秋水">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 289504, mp_lim = 4683, inner_att = 1372, outer_att = 1372, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191115) ->
    #mon{
        mid = 191115,
        name = <<"秦韵">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191116) ->
    #mon{
        mid = 191116,
        name = <<"陶青">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 397408, mp_lim = 5333, inner_att = 1864, outer_att = 1864, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191117) ->
    #mon{
        mid = 191117,
        name = <<"混江龙">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 2140, outer_att = 2140, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191118) ->
    #mon{
        mid = 191118,
        name = <<"姚伯当">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 521792, mp_lim = 5982, inner_att = 2428, outer_att = 2428, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191119) ->
    #mon{
        mid = 191119,
        name = <<"任平生">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 591232, mp_lim = 6310, inner_att = 2740, outer_att = 2740, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191120) ->
    #mon{
        mid = 191120,
        name = <<"陶青">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 662592, mp_lim = 6632, inner_att = 3060, outer_att = 3060, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191121) ->
    #mon{
        mid = 191121,
        name = <<"庞企">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 740448, mp_lim = 6959, inner_att = 3408, outer_att = 3408, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191122) ->
    #mon{
        mid = 191122,
        name = <<"演武守将">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 819872, mp_lim = 7281, inner_att = 3768, outer_att = 3768, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191123) ->
    #mon{
        mid = 191123,
        name = <<"叶二娘">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 906080, mp_lim = 7609, inner_att = 4152, outer_att = 4152, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191124) ->
    #mon{
        mid = 191124,
        name = <<"桑土公">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 993600, mp_lim = 7931, inner_att = 4544, outer_att = 4544, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191125) ->
    #mon{
        mid = 191125,
        name = <<"庞企">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 1083808, mp_lim = 8258, inner_att = 4944, outer_att = 4944, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191126) ->
    #mon{
        mid = 191126,
        name = <<"大猿王">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1165600, mp_lim = 8580, inner_att = 5312, outer_att = 5312, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191127) ->
    #mon{
        mid = 191127,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 5696, outer_att = 5696, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191128) ->
    #mon{
        mid = 191128,
        name = <<"岳老三">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1341504, mp_lim = 9230, inner_att = 6092, outer_att = 6092, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191129) ->
    #mon{
        mid = 191129,
        name = <<"乌老大">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 1435840, mp_lim = 9557, inner_att = 6504, outer_att = 6504, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191130) ->
    #mon{
        mid = 191130,
        name = <<"大猿王">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1529728, mp_lim = 9879, inner_att = 6924, outer_att = 6924, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191131) ->
    #mon{
        mid = 191131,
        name = <<"摘星子">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 1646624, mp_lim = 10207, inner_att = 7364, outer_att = 7364, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191132) ->
    #mon{
        mid = 191132,
        name = <<"红熊王">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 1763808, mp_lim = 10529, inner_att = 7812, outer_att = 7812, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191133) ->
    #mon{
        mid = 191133,
        name = <<"云中鹤">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 1889088, mp_lim = 10856, inner_att = 8280, outer_att = 8280, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191134) ->
    #mon{
        mid = 191134,
        name = <<"卓不凡">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 2014336, mp_lim = 11178, inner_att = 8752, outer_att = 8752, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191135) ->
    #mon{
        mid = 191135,
        name = <<"摘星子">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 2148000, mp_lim = 11506, inner_att = 9248, outer_att = 9248, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191136) ->
    #mon{
        mid = 191136,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 2281344, mp_lim = 11828, inner_att = 9744, outer_att = 9744, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3015,
        args = [],
        exp = 0
    };
get(191201) ->
    #mon{
        mid = 191201,
        name = <<"天魔真君">>,
        boss = 1,
        level = 3,
        attr = #bt_attr{hp_lim = 11488, mp_lim = 464, inner_att = 92, outer_att = 92, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191202) ->
    #mon{
        mid = 191202,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 19744, mp_lim = 786, inner_att = 132, outer_att = 132, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191203) ->
    #mon{
        mid = 191203,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 9,
        attr = #bt_attr{hp_lim = 29568, mp_lim = 1114, inner_att = 176, outer_att = 176, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191204) ->
    #mon{
        mid = 191204,
        name = <<"不平道人">>,
        boss = 1,
        level = 12,
        attr = #bt_attr{hp_lim = 39840, mp_lim = 1436, inner_att = 224, outer_att = 224, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191205) ->
    #mon{
        mid = 191205,
        name = <<"天魔真君">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 51776, mp_lim = 1763, inner_att = 276, outer_att = 276, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191206) ->
    #mon{
        mid = 191206,
        name = <<"闵墨">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 64096, mp_lim = 2085, inner_att = 336, outer_att = 336, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191207) ->
    #mon{
        mid = 191207,
        name = <<"魔教护法">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 80704, mp_lim = 2413, inner_att = 412, outer_att = 412, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191208) ->
    #mon{
        mid = 191208,
        name = <<"慕容复">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 99776, mp_lim = 2735, inner_att = 500, outer_att = 500, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191209) ->
    #mon{
        mid = 191209,
        name = <<"哈大霸">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 121728, mp_lim = 3062, inner_att = 600, outer_att = 600, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191210) ->
    #mon{
        mid = 191210,
        name = <<"闵墨">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 144800, mp_lim = 3384, inner_att = 708, outer_att = 708, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191211) ->
    #mon{
        mid = 191211,
        name = <<"秦韵">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 170944, mp_lim = 3712, inner_att = 828, outer_att = 828, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191212) ->
    #mon{
        mid = 191212,
        name = <<"魔教长老">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 198080, mp_lim = 4034, inner_att = 952, outer_att = 952, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191213) ->
    #mon{
        mid = 191213,
        name = <<"司马林">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 242400, mp_lim = 4361, inner_att = 1156, outer_att = 1156, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191214) ->
    #mon{
        mid = 191214,
        name = <<"李秋水">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 289504, mp_lim = 4683, inner_att = 1372, outer_att = 1372, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191215) ->
    #mon{
        mid = 191215,
        name = <<"秦韵">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191216) ->
    #mon{
        mid = 191216,
        name = <<"陶青">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 397408, mp_lim = 5333, inner_att = 1864, outer_att = 1864, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191217) ->
    #mon{
        mid = 191217,
        name = <<"混江龙">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 2140, outer_att = 2140, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191218) ->
    #mon{
        mid = 191218,
        name = <<"姚伯当">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 521792, mp_lim = 5982, inner_att = 2428, outer_att = 2428, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191219) ->
    #mon{
        mid = 191219,
        name = <<"任平生">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 591232, mp_lim = 6310, inner_att = 2740, outer_att = 2740, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191220) ->
    #mon{
        mid = 191220,
        name = <<"陶青">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 662592, mp_lim = 6632, inner_att = 3060, outer_att = 3060, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191221) ->
    #mon{
        mid = 191221,
        name = <<"庞企">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 740448, mp_lim = 6959, inner_att = 3408, outer_att = 3408, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191222) ->
    #mon{
        mid = 191222,
        name = <<"演武守将">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 819872, mp_lim = 7281, inner_att = 3768, outer_att = 3768, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191223) ->
    #mon{
        mid = 191223,
        name = <<"叶二娘">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 906080, mp_lim = 7609, inner_att = 4152, outer_att = 4152, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191224) ->
    #mon{
        mid = 191224,
        name = <<"桑土公">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 993600, mp_lim = 7931, inner_att = 4544, outer_att = 4544, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191225) ->
    #mon{
        mid = 191225,
        name = <<"庞企">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 1083808, mp_lim = 8258, inner_att = 4944, outer_att = 4944, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191226) ->
    #mon{
        mid = 191226,
        name = <<"大猿王">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1165600, mp_lim = 8580, inner_att = 5312, outer_att = 5312, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191227) ->
    #mon{
        mid = 191227,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 5696, outer_att = 5696, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191228) ->
    #mon{
        mid = 191228,
        name = <<"岳老三">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1341504, mp_lim = 9230, inner_att = 6092, outer_att = 6092, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191229) ->
    #mon{
        mid = 191229,
        name = <<"乌老大">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 1435840, mp_lim = 9557, inner_att = 6504, outer_att = 6504, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191230) ->
    #mon{
        mid = 191230,
        name = <<"大猿王">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1529728, mp_lim = 9879, inner_att = 6924, outer_att = 6924, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191231) ->
    #mon{
        mid = 191231,
        name = <<"摘星子">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 1646624, mp_lim = 10207, inner_att = 7364, outer_att = 7364, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191232) ->
    #mon{
        mid = 191232,
        name = <<"红熊王">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 1763808, mp_lim = 10529, inner_att = 7812, outer_att = 7812, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191233) ->
    #mon{
        mid = 191233,
        name = <<"云中鹤">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 1889088, mp_lim = 10856, inner_att = 8280, outer_att = 8280, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191234) ->
    #mon{
        mid = 191234,
        name = <<"卓不凡">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 2014336, mp_lim = 11178, inner_att = 8752, outer_att = 8752, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191235) ->
    #mon{
        mid = 191235,
        name = <<"摘星子">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 2148000, mp_lim = 11506, inner_att = 9248, outer_att = 9248, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191236) ->
    #mon{
        mid = 191236,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 2281344, mp_lim = 11828, inner_att = 9744, outer_att = 9744, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3012,
        args = [],
        exp = 0
    };
get(191301) ->
    #mon{
        mid = 191301,
        name = <<"天魔真君">>,
        boss = 1,
        level = 3,
        attr = #bt_attr{hp_lim = 11488, mp_lim = 464, inner_att = 92, outer_att = 92, inner_def = 17, outer_def = 17, hit = 207, dodge = 15, crit_hurt = 20, crit_def = 4, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191302) ->
    #mon{
        mid = 191302,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 6,
        attr = #bt_attr{hp_lim = 19744, mp_lim = 786, inner_att = 132, outer_att = 132, inner_def = 27, outer_def = 27, hit = 308, dodge = 24, crit_hurt = 29, crit_def = 6, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191303) ->
    #mon{
        mid = 191303,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 9,
        attr = #bt_attr{hp_lim = 29568, mp_lim = 1114, inner_att = 176, outer_att = 176, inner_def = 39, outer_def = 39, hit = 426, dodge = 36, crit_hurt = 41, crit_def = 9, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191304) ->
    #mon{
        mid = 191304,
        name = <<"不平道人">>,
        boss = 1,
        level = 12,
        attr = #bt_attr{hp_lim = 39840, mp_lim = 1436, inner_att = 224, outer_att = 224, inner_def = 52, outer_def = 52, hit = 550, dodge = 46, crit_hurt = 53, crit_def = 12, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191305) ->
    #mon{
        mid = 191305,
        name = <<"天魔真君">>,
        boss = 1,
        level = 15,
        attr = #bt_attr{hp_lim = 51776, mp_lim = 1763, inner_att = 276, outer_att = 276, inner_def = 66, outer_def = 66, hit = 689, dodge = 60, crit_hurt = 67, crit_def = 15, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191306) ->
    #mon{
        mid = 191306,
        name = <<"闵墨">>,
        boss = 1,
        level = 18,
        attr = #bt_attr{hp_lim = 64096, mp_lim = 2085, inner_att = 336, outer_att = 336, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191307) ->
    #mon{
        mid = 191307,
        name = <<"魔教护法">>,
        boss = 1,
        level = 21,
        attr = #bt_attr{hp_lim = 80704, mp_lim = 2413, inner_att = 412, outer_att = 412, inner_def = 102, outer_def = 102, hit = 1036, dodge = 92, crit_hurt = 101, crit_def = 24, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191308) ->
    #mon{
        mid = 191308,
        name = <<"慕容复">>,
        boss = 1,
        level = 24,
        attr = #bt_attr{hp_lim = 99776, mp_lim = 2735, inner_att = 500, outer_att = 500, inner_def = 126, outer_def = 126, hit = 1267, dodge = 112, crit_hurt = 122, crit_def = 29, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191309) ->
    #mon{
        mid = 191309,
        name = <<"哈大霸">>,
        boss = 1,
        level = 27,
        attr = #bt_attr{hp_lim = 121728, mp_lim = 3062, inner_att = 600, outer_att = 600, inner_def = 152, outer_def = 152, hit = 1526, dodge = 136, crit_hurt = 148, crit_def = 35, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191310) ->
    #mon{
        mid = 191310,
        name = <<"闵墨">>,
        boss = 1,
        level = 30,
        attr = #bt_attr{hp_lim = 144800, mp_lim = 3384, inner_att = 708, outer_att = 708, inner_def = 181, outer_def = 181, hit = 1804, dodge = 162, crit_hurt = 174, crit_def = 41, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191311) ->
    #mon{
        mid = 191311,
        name = <<"秦韵">>,
        boss = 1,
        level = 33,
        attr = #bt_attr{hp_lim = 170944, mp_lim = 3712, inner_att = 828, outer_att = 828, inner_def = 213, outer_def = 213, hit = 2112, dodge = 191, crit_hurt = 206, crit_def = 48, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191312) ->
    #mon{
        mid = 191312,
        name = <<"魔教长老">>,
        boss = 1,
        level = 36,
        attr = #bt_attr{hp_lim = 198080, mp_lim = 4034, inner_att = 952, outer_att = 952, inner_def = 246, outer_def = 246, hit = 2435, dodge = 220, crit_hurt = 236, crit_def = 56, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191313) ->
    #mon{
        mid = 191313,
        name = <<"司马林">>,
        boss = 1,
        level = 39,
        attr = #bt_attr{hp_lim = 242400, mp_lim = 4361, inner_att = 1156, outer_att = 1156, inner_def = 301, outer_def = 301, hit = 2961, dodge = 270, crit_hurt = 289, crit_def = 68, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191314) ->
    #mon{
        mid = 191314,
        name = <<"李秋水">>,
        boss = 1,
        level = 42,
        attr = #bt_attr{hp_lim = 289504, mp_lim = 4683, inner_att = 1372, outer_att = 1372, inner_def = 359, outer_def = 359, hit = 3526, dodge = 321, crit_hurt = 342, crit_def = 80, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191315) ->
    #mon{
        mid = 191315,
        name = <<"秦韵">>,
        boss = 1,
        level = 45,
        attr = #bt_attr{hp_lim = 342208, mp_lim = 5011, inner_att = 1612, outer_att = 1612, inner_def = 423, outer_def = 423, hit = 4147, dodge = 380, crit_hurt = 405, crit_def = 96, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191316) ->
    #mon{
        mid = 191316,
        name = <<"陶青">>,
        boss = 1,
        level = 48,
        attr = #bt_attr{hp_lim = 397408, mp_lim = 5333, inner_att = 1864, outer_att = 1864, inner_def = 491, outer_def = 491, hit = 4805, dodge = 439, crit_hurt = 466, crit_def = 110, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191317) ->
    #mon{
        mid = 191317,
        name = <<"混江龙">>,
        boss = 1,
        level = 51,
        attr = #bt_attr{hp_lim = 458496, mp_lim = 5660, inner_att = 2140, outer_att = 2140, inner_def = 565, outer_def = 565, hit = 5519, dodge = 506, crit_hurt = 538, crit_def = 127, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191318) ->
    #mon{
        mid = 191318,
        name = <<"姚伯当">>,
        boss = 1,
        level = 54,
        attr = #bt_attr{hp_lim = 521792, mp_lim = 5982, inner_att = 2428, outer_att = 2428, inner_def = 644, outer_def = 644, hit = 6273, dodge = 576, crit_hurt = 608, crit_def = 144, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191319) ->
    #mon{
        mid = 191319,
        name = <<"任平生">>,
        boss = 1,
        level = 57,
        attr = #bt_attr{hp_lim = 591232, mp_lim = 6310, inner_att = 2740, outer_att = 2740, inner_def = 727, outer_def = 727, hit = 7084, dodge = 652, crit_hurt = 691, crit_def = 163, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191320) ->
    #mon{
        mid = 191320,
        name = <<"陶青">>,
        boss = 1,
        level = 60,
        attr = #bt_attr{hp_lim = 662592, mp_lim = 6632, inner_att = 3060, outer_att = 3060, inner_def = 816, outer_def = 816, hit = 7926, dodge = 730, crit_hurt = 770, crit_def = 182, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191321) ->
    #mon{
        mid = 191321,
        name = <<"庞企">>,
        boss = 1,
        level = 63,
        attr = #bt_attr{hp_lim = 740448, mp_lim = 6959, inner_att = 3408, outer_att = 3408, inner_def = 910, outer_def = 910, hit = 8832, dodge = 816, crit_hurt = 862, crit_def = 204, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191322) ->
    #mon{
        mid = 191322,
        name = <<"演武守将">>,
        boss = 1,
        level = 66,
        attr = #bt_attr{hp_lim = 819872, mp_lim = 7281, inner_att = 3768, outer_att = 3768, inner_def = 1008, outer_def = 1008, hit = 9770, dodge = 902, crit_hurt = 949, crit_def = 224, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191323) ->
    #mon{
        mid = 191323,
        name = <<"叶二娘">>,
        boss = 1,
        level = 69,
        attr = #bt_attr{hp_lim = 906080, mp_lim = 7609, inner_att = 4152, outer_att = 4152, inner_def = 1112, outer_def = 1112, hit = 10774, dodge = 997, crit_hurt = 1052, crit_def = 249, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191324) ->
    #mon{
        mid = 191324,
        name = <<"桑土公">>,
        boss = 1,
        level = 72,
        attr = #bt_attr{hp_lim = 993600, mp_lim = 7931, inner_att = 4544, outer_att = 4544, inner_def = 1219, outer_def = 1219, hit = 11802, dodge = 1091, crit_hurt = 1146, crit_def = 273, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191325) ->
    #mon{
        mid = 191325,
        name = <<"庞企">>,
        boss = 1,
        level = 75,
        attr = #bt_attr{hp_lim = 1083808, mp_lim = 8258, inner_att = 4944, outer_att = 4944, inner_def = 1328, outer_def = 1328, hit = 12844, dodge = 1189, crit_hurt = 1252, crit_def = 297, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191326) ->
    #mon{
        mid = 191326,
        name = <<"大猿王">>,
        boss = 1,
        level = 78,
        attr = #bt_attr{hp_lim = 1165600, mp_lim = 8580, inner_att = 5312, outer_att = 5312, inner_def = 1429, outer_def = 1429, hit = 13808, dodge = 1278, crit_hurt = 1341, crit_def = 318, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191327) ->
    #mon{
        mid = 191327,
        name = <<"葛荣">>,
        boss = 1,
        level = 81,
        attr = #bt_attr{hp_lim = 1253664, mp_lim = 8908, inner_att = 5696, outer_att = 5696, inner_def = 1535, outer_def = 1535, hit = 14823, dodge = 1376, crit_hurt = 1446, crit_def = 343, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191328) ->
    #mon{
        mid = 191328,
        name = <<"岳老三">>,
        boss = 1,
        level = 84,
        attr = #bt_attr{hp_lim = 1341504, mp_lim = 9230, inner_att = 6092, outer_att = 6092, inner_def = 1643, outer_def = 1643, hit = 15854, dodge = 1470, crit_hurt = 1542, crit_def = 365, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191329) ->
    #mon{
        mid = 191329,
        name = <<"乌老大">>,
        boss = 1,
        level = 87,
        attr = #bt_attr{hp_lim = 1435840, mp_lim = 9557, inner_att = 6504, outer_att = 6504, inner_def = 1757, outer_def = 1757, hit = 16937, dodge = 1573, crit_hurt = 1652, crit_def = 391, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191330) ->
    #mon{
        mid = 191330,
        name = <<"大猿王">>,
        boss = 1,
        level = 90,
        attr = #bt_attr{hp_lim = 1529728, mp_lim = 9879, inner_att = 6924, outer_att = 6924, inner_def = 1872, outer_def = 1872, hit = 18038, dodge = 1676, crit_hurt = 1754, crit_def = 416, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191331) ->
    #mon{
        mid = 191331,
        name = <<"摘星子">>,
        boss = 1,
        level = 93,
        attr = #bt_attr{hp_lim = 1646624, mp_lim = 10207, inner_att = 7364, outer_att = 7364, inner_def = 2013, outer_def = 2013, hit = 19391, dodge = 1804, crit_hurt = 1893, crit_def = 449, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191332) ->
    #mon{
        mid = 191332,
        name = <<"红熊王">>,
        boss = 1,
        level = 96,
        attr = #bt_attr{hp_lim = 1763808, mp_lim = 10529, inner_att = 7812, outer_att = 7812, inner_def = 2157, outer_def = 2157, hit = 20761, dodge = 1929, crit_hurt = 2019, crit_def = 480, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191333) ->
    #mon{
        mid = 191333,
        name = <<"云中鹤">>,
        boss = 1,
        level = 99,
        attr = #bt_attr{hp_lim = 1889088, mp_lim = 10856, inner_att = 8280, outer_att = 8280, inner_def = 2309, outer_def = 2309, hit = 22205, dodge = 2066, crit_hurt = 2164, crit_def = 514, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191334) ->
    #mon{
        mid = 191334,
        name = <<"卓不凡">>,
        boss = 1,
        level = 102,
        attr = #bt_attr{hp_lim = 2014336, mp_lim = 11178, inner_att = 8752, outer_att = 8752, inner_def = 2462, outer_def = 2462, hit = 23672, dodge = 2203, crit_hurt = 2301, crit_def = 546, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191335) ->
    #mon{
        mid = 191335,
        name = <<"摘星子">>,
        boss = 1,
        level = 105,
        attr = #bt_attr{hp_lim = 2148000, mp_lim = 11506, inner_att = 9248, outer_att = 9248, inner_def = 2623, outer_def = 2623, hit = 25212, dodge = 2349, crit_hurt = 2460, crit_def = 583, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(191336) ->
    #mon{
        mid = 191336,
        name = <<"神农帮帮主">>,
        boss = 1,
        level = 108,
        attr = #bt_attr{hp_lim = 2281344, mp_lim = 11828, inner_att = 9744, outer_att = 9744, inner_def = 2786, outer_def = 2786, hit = 26772, dodge = 2491, crit_hurt = 2606, crit_def = 617, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 100,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{15020001,1,100,4}],
        ai_group = 3013,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

