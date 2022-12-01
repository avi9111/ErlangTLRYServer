%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_100
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_100).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(1000001) ->
    #mon{
        mid = 1000001,
        name = <<"余毒">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20022101,1,100,4},{20022102,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000002) ->
    #mon{
        mid = 1000002,
        name = <<"红熊王">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20022201,1,100,4},{20022202,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000003) ->
    #mon{
        mid = 1000003,
        name = <<"葛荣">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20022301,1,100,4},{20022302,1,100,4},{20022303,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000004) ->
    #mon{
        mid = 1000004,
        name = <<"闵墨">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 14000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20021101,1,100,4},{20021102,1,100,4},{20021103,1,100,4},{20021104,1,100,4},{20021105,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000005) ->
    #mon{
        mid = 1000005,
        name = <<"秦韵">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 16000, mp_lim = 400, mp_rec = 400, inner_att = 350, outer_att = 350, inner_def = 350, outer_def = 350, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20021201,1,100,4},{20021202,1,100,4},{20021203,1,100,4},{20021204,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000006) ->
    #mon{
        mid = 1000006,
        name = <<"陶青">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 18000, mp_lim = 400, mp_rec = 400, inner_att = 400, outer_att = 400, inner_def = 400, outer_def = 400, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20021301,1,100,4},{20021302,1,100,4},{20021303,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000007) ->
    #mon{
        mid = 1000007,
        name = <<"庞企">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 20000, mp_lim = 400, mp_rec = 400, inner_att = 450, outer_att = 450, inner_def = 450, outer_def = 450, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 1005,
        revive = 0,
        realm = 0,
        skill_list = [{20021401,1,100,4},{20021404,1,100,4},{20021402,1,100,4},{20021405,1,100,4}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000008) ->
    #mon{
        mid = 1000008,
        name = <<"岳老三">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023101,1,100,6},{20023102,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000009) ->
    #mon{
        mid = 1000009,
        name = <<"叶二娘">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023201,1,100,6},{20023202,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000010) ->
    #mon{
        mid = 1000010,
        name = <<"云中鹤">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023301,1,100,6},{20023302,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000011) ->
    #mon{
        mid = 1000011,
        name = <<"段延庆">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 2000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023401,1,100,6},{20023402,1,100,6},{20023403,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000012) ->
    #mon{
        mid = 1000012,
        name = <<"姚伯当">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023501,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000013) ->
    #mon{
        mid = 1000013,
        name = <<"司马林">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023601,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000014) ->
    #mon{
        mid = 1000014,
        name = <<"鸠摩智">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 2000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023701,1,100,6},{20023702,1,100,6},{20023703,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000015) ->
    #mon{
        mid = 1000015,
        name = <<"包不同">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023801,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000016) ->
    #mon{
        mid = 1000016,
        name = <<"风波恶">>,
        boss = 0,
        level = 1,
        attr = #bt_attr{hp_lim = 300, mp_lim = 200, mp_rec = 200, inner_att = 40, outer_att = 40, inner_def = 40, outer_def = 40, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023802,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000017) ->
    #mon{
        mid = 1000017,
        name = <<"慕容复">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 3000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 300, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20023901,1,100,6},{20023902,1,100,6},{20023903,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000018) ->
    #mon{
        mid = 1000018,
        name = <<"哈大霸">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 7000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024101,1,100,6},{20024102,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000019) ->
    #mon{
        mid = 1000019,
        name = <<"桑土公">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 8000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024201,1,100,6},{20024202,1,100,6},{20024203,1,100,6},{20024204,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000020) ->
    #mon{
        mid = 1000020,
        name = <<"乌老大">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 9000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024301,1,100,6},{20024302,1,100,6},{20024303,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000021) ->
    #mon{
        mid = 1000021,
        name = <<"卓不凡">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 10000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024401,1,100,6},{20024402,1,100,6},{20024403,1,100,6},{20024404,1,100,6}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000022) ->
    #mon{
        mid = 1000022,
        name = <<"不平道人">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 11000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024501,1,100,16},{20024502,1,100,16},{20024504,1,100,16}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000023) ->
    #mon{
        mid = 1000023,
        name = <<"任平生">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 12000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024601,1,100,16}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000024) ->
    #mon{
        mid = 1000024,
        name = <<"李秋水">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 13000, mp_lim = 400, mp_rec = 400, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 4,
        sight_area = 5,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20024701,1,100,6},{20024702,1,100,16},{20024704,1,100,16}],
        ai_group = 2010,
        args = [],
        exp = 0
    };
get(1000025) ->
    #mon{
        mid = 1000025,
        name = <<"混江小龙">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 14000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029101,1,100,6},{20029102,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000026) ->
    #mon{
        mid = 1000026,
        name = <<"翻江蜃">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 15000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029301,1,100,6},{20029302,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000027) ->
    #mon{
        mid = 1000027,
        name = <<"出洞蛟">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 16000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029401,1,100,6},{20029402,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(1000028) ->
    #mon{
        mid = 1000028,
        name = <<"混江龙">>,
        boss = 1,
        level = 1,
        attr = #bt_attr{hp_lim = 18000, mp_lim = 400, mp_rec = 400, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 500, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
        att_type = 0,
        att_area = 6,
        sight_area = 10,
        trace_area = 30,
        drop = 0,
        revive = 0,
        realm = 0,
        skill_list = [{20029501,1,100,6},{20029502,1,100,6}],
        ai_group = 1010,
        args = [],
        exp = 0
    };
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

