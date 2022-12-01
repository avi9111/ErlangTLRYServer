%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_mon_12
%% @Brief  : 怪物配置
%% @Author : cablsbs
%%-------------------------------------------------------
-module(conf_mon_12).

-include("log.hrl").
-include("scene_objs.hrl").

-export([get/1]).


%% @doc 获取怪物配置
%% @spec get(MId) -> #mon{} | undefined.
%% MId     :: integer()
get(120001) ->
    #mon{
        mid = 120001,
        name = <<"大猿王">>,
        boss = 0,
        level = 11,
        attr = #bt_attr{hp_lim = 7987, mp_lim = 1330, inner_att = 26, outer_att = 26, inner_def = 47, outer_def = 47, hit = 508, dodge = 43, crit_hurt = 49, crit_def = 11, move_speed = 200},
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
        exp = 50
    };
get(120002) ->
    #mon{
        mid = 120002,
        name = <<"摘星子">>,
        boss = 0,
        level = 16,
        attr = #bt_attr{hp_lim = 12152, mp_lim = 1869, inner_att = 37, outer_att = 37, inner_def = 71, outer_def = 71, hit = 737, dodge = 64, crit_hurt = 70, crit_def = 17, move_speed = 200},
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
        exp = 50
    };
get(120003) ->
    #mon{
        mid = 120003,
        name = <<"神农帮帮主">>,
        boss = 0,
        level = 18,
        attr = #bt_attr{hp_lim = 14021, mp_lim = 2085, inner_att = 42, outer_att = 42, inner_def = 82, outer_def = 82, hit = 838, dodge = 73, crit_hurt = 80, crit_def = 19, move_speed = 200},
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
        exp = 50
    };
get(120004) ->
    #mon{
        mid = 120004,
        name = <<"木婉清">>,
        boss = 0,
        level = 22,
        attr = #bt_attr{hp_lim = 18942, mp_lim = 2518, inner_att = 55, outer_att = 55, inner_def = 109, outer_def = 109, hit = 1108, dodge = 98, crit_hurt = 106, crit_def = 25, move_speed = 200},
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
        exp = 50
    };
get(121001) ->
    #mon{
        mid = 121001,
        name = <<"马贼宋姜">>,
        boss = 0,
        level = 25,
        attr = #bt_attr{hp_lim = 33000, mp_lim = 200, mp_rec = 200, inner_att = 100, outer_att = 100, inner_def = 100, outer_def = 100, hit = 200, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121002) ->
    #mon{
        mid = 121002,
        name = <<"马贼伍庸">>,
        boss = 0,
        level = 26,
        attr = #bt_attr{hp_lim = 35000, mp_lim = 200, mp_rec = 200, inner_att = 150, outer_att = 150, inner_def = 150, outer_def = 150, hit = 200, dodge = 100, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121003) ->
    #mon{
        mid = 121003,
        name = <<"马贼鹿君逸">>,
        boss = 0,
        level = 27,
        attr = #bt_attr{hp_lim = 37000, mp_lim = 200, mp_rec = 200, inner_att = 200, outer_att = 200, inner_def = 200, outer_def = 200, hit = 220, dodge = 110, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121004) ->
    #mon{
        mid = 121004,
        name = <<"马贼林崇">>,
        boss = 0,
        level = 28,
        attr = #bt_attr{hp_lim = 39000, mp_lim = 200, mp_rec = 200, inner_att = 250, outer_att = 250, inner_def = 250, outer_def = 250, hit = 240, dodge = 120, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121005) ->
    #mon{
        mid = 121005,
        name = <<"马贼李魁">>,
        boss = 0,
        level = 29,
        attr = #bt_attr{hp_lim = 41000, mp_lim = 200, mp_rec = 200, inner_att = 300, outer_att = 300, inner_def = 300, outer_def = 300, hit = 260, dodge = 130, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121006) ->
    #mon{
        mid = 121006,
        name = <<"马贼公孙省">>,
        boss = 0,
        level = 30,
        attr = #bt_attr{hp_lim = 43000, mp_lim = 200, mp_rec = 200, inner_att = 350, outer_att = 350, inner_def = 350, outer_def = 350, hit = 280, dodge = 140, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121007) ->
    #mon{
        mid = 121007,
        name = <<"马贼管盛">>,
        boss = 0,
        level = 31,
        attr = #bt_attr{hp_lim = 45000, mp_lim = 200, mp_rec = 200, inner_att = 400, outer_att = 400, inner_def = 400, outer_def = 400, hit = 300, dodge = 150, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121008) ->
    #mon{
        mid = 121008,
        name = <<"马贼秦冥">>,
        boss = 0,
        level = 32,
        attr = #bt_attr{hp_lim = 47000, mp_lim = 200, mp_rec = 200, inner_att = 450, outer_att = 450, inner_def = 450, outer_def = 450, hit = 320, dodge = 160, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121009) ->
    #mon{
        mid = 121009,
        name = <<"马贼胡彦灼">>,
        boss = 0,
        level = 33,
        attr = #bt_attr{hp_lim = 50000, mp_lim = 200, mp_rec = 200, inner_att = 500, outer_att = 500, inner_def = 500, outer_def = 500, hit = 340, dodge = 170, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121010) ->
    #mon{
        mid = 121010,
        name = <<"马贼华容">>,
        boss = 0,
        level = 34,
        attr = #bt_attr{hp_lim = 55000, mp_lim = 200, mp_rec = 200, inner_att = 550, outer_att = 550, inner_def = 550, outer_def = 550, hit = 360, dodge = 180, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121011) ->
    #mon{
        mid = 121011,
        name = <<"马贼蔡进">>,
        boss = 0,
        level = 35,
        attr = #bt_attr{hp_lim = 60000, mp_lim = 200, mp_rec = 200, inner_att = 600, outer_att = 600, inner_def = 600, outer_def = 600, hit = 380, dodge = 190, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121012) ->
    #mon{
        mid = 121012,
        name = <<"马贼李英">>,
        boss = 0,
        level = 36,
        attr = #bt_attr{hp_lim = 65000, mp_lim = 200, mp_rec = 200, inner_att = 650, outer_att = 650, inner_def = 650, outer_def = 650, hit = 400, dodge = 200, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121013) ->
    #mon{
        mid = 121013,
        name = <<"马贼祝仝">>,
        boss = 0,
        level = 37,
        attr = #bt_attr{hp_lim = 29000, mp_lim = 200, mp_rec = 200, inner_att = 700, outer_att = 700, inner_def = 700, outer_def = 700, hit = 420, dodge = 210, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121014) ->
    #mon{
        mid = 121014,
        name = <<"马贼卢至深">>,
        boss = 0,
        level = 38,
        attr = #bt_attr{hp_lim = 31000, mp_lim = 200, mp_rec = 200, inner_att = 750, outer_att = 750, inner_def = 750, outer_def = 750, hit = 440, dodge = 220, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121015) ->
    #mon{
        mid = 121015,
        name = <<"马贼伍松">>,
        boss = 0,
        level = 39,
        attr = #bt_attr{hp_lim = 33000, mp_lim = 200, mp_rec = 200, inner_att = 800, outer_att = 800, inner_def = 800, outer_def = 800, hit = 460, dodge = 230, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121016) ->
    #mon{
        mid = 121016,
        name = <<"马贼董萍">>,
        boss = 0,
        level = 40,
        attr = #bt_attr{hp_lim = 35000, mp_lim = 200, mp_rec = 200, inner_att = 850, outer_att = 850, inner_def = 850, outer_def = 850, hit = 480, dodge = 240, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121017) ->
    #mon{
        mid = 121017,
        name = <<"马贼张青">>,
        boss = 0,
        level = 41,
        attr = #bt_attr{hp_lim = 37000, mp_lim = 200, mp_rec = 200, inner_att = 900, outer_att = 900, inner_def = 900, outer_def = 900, hit = 500, dodge = 250, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121018) ->
    #mon{
        mid = 121018,
        name = <<"马贼杨智">>,
        boss = 0,
        level = 42,
        attr = #bt_attr{hp_lim = 39000, mp_lim = 200, mp_rec = 200, inner_att = 950, outer_att = 950, inner_def = 950, outer_def = 950, hit = 520, dodge = 260, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121019) ->
    #mon{
        mid = 121019,
        name = <<"马贼许宁">>,
        boss = 0,
        level = 43,
        attr = #bt_attr{hp_lim = 41000, mp_lim = 200, mp_rec = 200, inner_att = 1000, outer_att = 1000, inner_def = 1000, outer_def = 1000, hit = 540, dodge = 270, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121020) ->
    #mon{
        mid = 121020,
        name = <<"马贼索抄">>,
        boss = 0,
        level = 44,
        attr = #bt_attr{hp_lim = 43000, mp_lim = 200, mp_rec = 200, inner_att = 1050, outer_att = 1050, inner_def = 1050, outer_def = 1050, hit = 560, dodge = 280, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121021) ->
    #mon{
        mid = 121021,
        name = <<"云中鹤">>,
        boss = 0,
        level = 45,
        attr = #bt_attr{hp_lim = 45000, mp_lim = 200, mp_rec = 200, inner_att = 1100, outer_att = 1100, inner_def = 1100, outer_def = 1100, hit = 580, dodge = 290, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121022) ->
    #mon{
        mid = 121022,
        name = <<"岳老三">>,
        boss = 0,
        level = 46,
        attr = #bt_attr{hp_lim = 47000, mp_lim = 200, mp_rec = 200, inner_att = 1150, outer_att = 1150, inner_def = 1150, outer_def = 1150, hit = 600, dodge = 300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121023) ->
    #mon{
        mid = 121023,
        name = <<"叶二娘">>,
        boss = 0,
        level = 47,
        attr = #bt_attr{hp_lim = 50000, mp_lim = 200, mp_rec = 200, inner_att = 1200, outer_att = 1200, inner_def = 1200, outer_def = 1200, hit = 620, dodge = 310, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121024) ->
    #mon{
        mid = 121024,
        name = <<"段延庆">>,
        boss = 0,
        level = 48,
        attr = #bt_attr{hp_lim = 55000, mp_lim = 200, mp_rec = 200, inner_att = 1250, outer_att = 1250, inner_def = 1250, outer_def = 1250, hit = 640, dodge = 320, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121025) ->
    #mon{
        mid = 121025,
        name = <<"鸠摩智">>,
        boss = 0,
        level = 49,
        attr = #bt_attr{hp_lim = 60000, mp_lim = 200, mp_rec = 200, inner_att = 1300, outer_att = 1300, inner_def = 1300, outer_def = 1300, hit = 660, dodge = 330, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121026) ->
    #mon{
        mid = 121026,
        name = <<"江湖高手">>,
        boss = 0,
        level = 50,
        attr = #bt_attr{hp_lim = 65000, mp_lim = 200, mp_rec = 200, inner_att = 1350, outer_att = 1350, inner_def = 1350, outer_def = 1350, hit = 680, dodge = 340, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121027) ->
    #mon{
        mid = 121027,
        name = <<"江湖高手">>,
        boss = 0,
        level = 51,
        attr = #bt_attr{hp_lim = 70000, mp_lim = 200, mp_rec = 200, inner_att = 1400, outer_att = 1400, inner_def = 1400, outer_def = 1400, hit = 700, dodge = 350, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121028) ->
    #mon{
        mid = 121028,
        name = <<"江湖高手">>,
        boss = 0,
        level = 52,
        attr = #bt_attr{hp_lim = 75000, mp_lim = 200, mp_rec = 200, inner_att = 1450, outer_att = 1450, inner_def = 1450, outer_def = 1450, hit = 720, dodge = 360, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121029) ->
    #mon{
        mid = 121029,
        name = <<"江湖高手">>,
        boss = 0,
        level = 53,
        attr = #bt_attr{hp_lim = 80000, mp_lim = 200, mp_rec = 200, inner_att = 1500, outer_att = 1500, inner_def = 1500, outer_def = 1500, hit = 740, dodge = 370, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121030) ->
    #mon{
        mid = 121030,
        name = <<"江湖高手">>,
        boss = 0,
        level = 54,
        attr = #bt_attr{hp_lim = 85000, mp_lim = 200, mp_rec = 200, inner_att = 1550, outer_att = 1550, inner_def = 1550, outer_def = 1550, hit = 760, dodge = 380, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121031) ->
    #mon{
        mid = 121031,
        name = <<"江湖高手">>,
        boss = 0,
        level = 55,
        attr = #bt_attr{hp_lim = 90000, mp_lim = 200, mp_rec = 200, inner_att = 1600, outer_att = 1600, inner_def = 1600, outer_def = 1600, hit = 780, dodge = 390, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121032) ->
    #mon{
        mid = 121032,
        name = <<"江湖高手">>,
        boss = 0,
        level = 56,
        attr = #bt_attr{hp_lim = 95000, mp_lim = 200, mp_rec = 200, inner_att = 1650, outer_att = 1650, inner_def = 1650, outer_def = 1650, hit = 800, dodge = 400, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121033) ->
    #mon{
        mid = 121033,
        name = <<"江湖高手">>,
        boss = 0,
        level = 57,
        attr = #bt_attr{hp_lim = 100000, mp_lim = 200, mp_rec = 200, inner_att = 1700, outer_att = 1700, inner_def = 1700, outer_def = 1700, hit = 820, dodge = 410, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121034) ->
    #mon{
        mid = 121034,
        name = <<"江湖高手">>,
        boss = 0,
        level = 58,
        attr = #bt_attr{hp_lim = 110000, mp_lim = 200, mp_rec = 200, inner_att = 1800, outer_att = 1800, inner_def = 1800, outer_def = 1800, hit = 840, dodge = 420, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121035) ->
    #mon{
        mid = 121035,
        name = <<"江湖高手">>,
        boss = 0,
        level = 59,
        attr = #bt_attr{hp_lim = 120000, mp_lim = 200, mp_rec = 200, inner_att = 1900, outer_att = 1900, inner_def = 1900, outer_def = 1900, hit = 860, dodge = 430, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121036) ->
    #mon{
        mid = 121036,
        name = <<"江湖高手">>,
        boss = 0,
        level = 60,
        attr = #bt_attr{hp_lim = 130000, mp_lim = 200, mp_rec = 200, inner_att = 2000, outer_att = 2000, inner_def = 2000, outer_def = 2000, hit = 880, dodge = 440, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121037) ->
    #mon{
        mid = 121037,
        name = <<"江湖高手">>,
        boss = 0,
        level = 61,
        attr = #bt_attr{hp_lim = 140000, mp_lim = 200, mp_rec = 200, inner_att = 2100, outer_att = 2100, inner_def = 2100, outer_def = 2100, hit = 900, dodge = 450, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121038) ->
    #mon{
        mid = 121038,
        name = <<"江湖高手">>,
        boss = 0,
        level = 62,
        attr = #bt_attr{hp_lim = 150000, mp_lim = 200, mp_rec = 200, inner_att = 2200, outer_att = 2200, inner_def = 2200, outer_def = 2200, hit = 920, dodge = 460, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121039) ->
    #mon{
        mid = 121039,
        name = <<"江湖高手">>,
        boss = 0,
        level = 63,
        attr = #bt_attr{hp_lim = 160000, mp_lim = 200, mp_rec = 200, inner_att = 2300, outer_att = 2300, inner_def = 2300, outer_def = 2300, hit = 940, dodge = 470, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121040) ->
    #mon{
        mid = 121040,
        name = <<"江湖高手">>,
        boss = 0,
        level = 64,
        attr = #bt_attr{hp_lim = 170000, mp_lim = 200, mp_rec = 200, inner_att = 2400, outer_att = 2400, inner_def = 2400, outer_def = 2400, hit = 960, dodge = 480, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121041) ->
    #mon{
        mid = 121041,
        name = <<"江湖高手">>,
        boss = 0,
        level = 65,
        attr = #bt_attr{hp_lim = 180000, mp_lim = 200, mp_rec = 200, inner_att = 2500, outer_att = 2500, inner_def = 2500, outer_def = 2500, hit = 980, dodge = 490, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121042) ->
    #mon{
        mid = 121042,
        name = <<"江湖高手">>,
        boss = 0,
        level = 66,
        attr = #bt_attr{hp_lim = 190000, mp_lim = 200, mp_rec = 200, inner_att = 2600, outer_att = 2600, inner_def = 2600, outer_def = 2600, hit = 1000, dodge = 500, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121043) ->
    #mon{
        mid = 121043,
        name = <<"江湖高手">>,
        boss = 0,
        level = 67,
        attr = #bt_attr{hp_lim = 200000, mp_lim = 200, mp_rec = 200, inner_att = 2700, outer_att = 2700, inner_def = 2700, outer_def = 2700, hit = 1020, dodge = 510, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121044) ->
    #mon{
        mid = 121044,
        name = <<"江湖高手">>,
        boss = 0,
        level = 68,
        attr = #bt_attr{hp_lim = 220000, mp_lim = 200, mp_rec = 200, inner_att = 2800, outer_att = 2800, inner_def = 2800, outer_def = 2800, hit = 1040, dodge = 520, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121045) ->
    #mon{
        mid = 121045,
        name = <<"江湖高手">>,
        boss = 0,
        level = 69,
        attr = #bt_attr{hp_lim = 240000, mp_lim = 200, mp_rec = 200, inner_att = 2900, outer_att = 2900, inner_def = 2900, outer_def = 2900, hit = 1060, dodge = 530, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121046) ->
    #mon{
        mid = 121046,
        name = <<"江湖高手">>,
        boss = 0,
        level = 70,
        attr = #bt_attr{hp_lim = 260000, mp_lim = 200, mp_rec = 200, inner_att = 3000, outer_att = 3000, inner_def = 3000, outer_def = 3000, hit = 1080, dodge = 540, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121047) ->
    #mon{
        mid = 121047,
        name = <<"江湖高手">>,
        boss = 0,
        level = 71,
        attr = #bt_attr{hp_lim = 280000, mp_lim = 200, mp_rec = 200, inner_att = 3100, outer_att = 3100, inner_def = 3100, outer_def = 3100, hit = 1100, dodge = 550, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121048) ->
    #mon{
        mid = 121048,
        name = <<"江湖高手">>,
        boss = 0,
        level = 72,
        attr = #bt_attr{hp_lim = 300000, mp_lim = 200, mp_rec = 200, inner_att = 3200, outer_att = 3200, inner_def = 3200, outer_def = 3200, hit = 1120, dodge = 560, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121049) ->
    #mon{
        mid = 121049,
        name = <<"江湖高手">>,
        boss = 0,
        level = 73,
        attr = #bt_attr{hp_lim = 320000, mp_lim = 200, mp_rec = 200, inner_att = 3300, outer_att = 3300, inner_def = 3300, outer_def = 3300, hit = 1140, dodge = 570, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121050) ->
    #mon{
        mid = 121050,
        name = <<"江湖高手">>,
        boss = 0,
        level = 74,
        attr = #bt_attr{hp_lim = 340000, mp_lim = 200, mp_rec = 200, inner_att = 3400, outer_att = 3400, inner_def = 3400, outer_def = 3400, hit = 1160, dodge = 580, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121051) ->
    #mon{
        mid = 121051,
        name = <<"江湖高手">>,
        boss = 0,
        level = 75,
        attr = #bt_attr{hp_lim = 360000, mp_lim = 200, mp_rec = 200, inner_att = 3500, outer_att = 3500, inner_def = 3500, outer_def = 3500, hit = 1180, dodge = 590, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121052) ->
    #mon{
        mid = 121052,
        name = <<"江湖高手">>,
        boss = 0,
        level = 76,
        attr = #bt_attr{hp_lim = 380000, mp_lim = 200, mp_rec = 200, inner_att = 3600, outer_att = 3600, inner_def = 3600, outer_def = 3600, hit = 1200, dodge = 600, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121053) ->
    #mon{
        mid = 121053,
        name = <<"江湖高手">>,
        boss = 0,
        level = 77,
        attr = #bt_attr{hp_lim = 400000, mp_lim = 200, mp_rec = 200, inner_att = 3700, outer_att = 3700, inner_def = 3700, outer_def = 3700, hit = 1220, dodge = 610, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121054) ->
    #mon{
        mid = 121054,
        name = <<"江湖高手">>,
        boss = 0,
        level = 78,
        attr = #bt_attr{hp_lim = 450000, mp_lim = 200, mp_rec = 200, inner_att = 4000, outer_att = 4000, inner_def = 4000, outer_def = 4000, hit = 1240, dodge = 620, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121055) ->
    #mon{
        mid = 121055,
        name = <<"江湖高手">>,
        boss = 0,
        level = 79,
        attr = #bt_attr{hp_lim = 500000, mp_lim = 200, mp_rec = 200, inner_att = 4300, outer_att = 4300, inner_def = 4300, outer_def = 4300, hit = 1260, dodge = 630, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121056) ->
    #mon{
        mid = 121056,
        name = <<"江湖高手">>,
        boss = 0,
        level = 80,
        attr = #bt_attr{hp_lim = 550000, mp_lim = 200, mp_rec = 200, inner_att = 4600, outer_att = 4600, inner_def = 4600, outer_def = 4600, hit = 1280, dodge = 640, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121057) ->
    #mon{
        mid = 121057,
        name = <<"江湖高手">>,
        boss = 0,
        level = 81,
        attr = #bt_attr{hp_lim = 600000, mp_lim = 200, mp_rec = 200, inner_att = 4900, outer_att = 4900, inner_def = 4900, outer_def = 4900, hit = 1300, dodge = 650, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121058) ->
    #mon{
        mid = 121058,
        name = <<"江湖高手">>,
        boss = 0,
        level = 82,
        attr = #bt_attr{hp_lim = 650000, mp_lim = 200, mp_rec = 200, inner_att = 5200, outer_att = 5200, inner_def = 5200, outer_def = 5200, hit = 1320, dodge = 660, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121059) ->
    #mon{
        mid = 121059,
        name = <<"江湖高手">>,
        boss = 0,
        level = 83,
        attr = #bt_attr{hp_lim = 700000, mp_lim = 200, mp_rec = 200, inner_att = 5500, outer_att = 5500, inner_def = 5500, outer_def = 5500, hit = 1340, dodge = 670, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121060) ->
    #mon{
        mid = 121060,
        name = <<"江湖高手">>,
        boss = 0,
        level = 84,
        attr = #bt_attr{hp_lim = 750000, mp_lim = 200, mp_rec = 200, inner_att = 5800, outer_att = 5800, inner_def = 5800, outer_def = 5800, hit = 1360, dodge = 680, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121061) ->
    #mon{
        mid = 121061,
        name = <<"江湖高手">>,
        boss = 0,
        level = 85,
        attr = #bt_attr{hp_lim = 800000, mp_lim = 200, mp_rec = 200, inner_att = 6100, outer_att = 6100, inner_def = 6100, outer_def = 6100, hit = 1380, dodge = 690, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121062) ->
    #mon{
        mid = 121062,
        name = <<"江湖高手">>,
        boss = 0,
        level = 86,
        attr = #bt_attr{hp_lim = 850000, mp_lim = 200, mp_rec = 200, inner_att = 6400, outer_att = 6400, inner_def = 6400, outer_def = 6400, hit = 1400, dodge = 700, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121063) ->
    #mon{
        mid = 121063,
        name = <<"江湖高手">>,
        boss = 0,
        level = 87,
        attr = #bt_attr{hp_lim = 900000, mp_lim = 200, mp_rec = 200, inner_att = 6700, outer_att = 6700, inner_def = 6700, outer_def = 6700, hit = 1420, dodge = 710, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121064) ->
    #mon{
        mid = 121064,
        name = <<"江湖高手">>,
        boss = 0,
        level = 88,
        attr = #bt_attr{hp_lim = 950000, mp_lim = 200, mp_rec = 200, inner_att = 7000, outer_att = 7000, inner_def = 7000, outer_def = 7000, hit = 1440, dodge = 720, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121065) ->
    #mon{
        mid = 121065,
        name = <<"江湖高手">>,
        boss = 0,
        level = 89,
        attr = #bt_attr{hp_lim = 1000000, mp_lim = 200, mp_rec = 200, inner_att = 7300, outer_att = 7300, inner_def = 7300, outer_def = 7300, hit = 1460, dodge = 730, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121066) ->
    #mon{
        mid = 121066,
        name = <<"江湖高手">>,
        boss = 0,
        level = 90,
        attr = #bt_attr{hp_lim = 1050000, mp_lim = 200, mp_rec = 200, inner_att = 7600, outer_att = 7600, inner_def = 7600, outer_def = 7600, hit = 1480, dodge = 740, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121067) ->
    #mon{
        mid = 121067,
        name = <<"江湖高手">>,
        boss = 0,
        level = 91,
        attr = #bt_attr{hp_lim = 1100000, mp_lim = 200, mp_rec = 200, inner_att = 7900, outer_att = 7900, inner_def = 7900, outer_def = 7900, hit = 1500, dodge = 750, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121068) ->
    #mon{
        mid = 121068,
        name = <<"江湖高手">>,
        boss = 0,
        level = 92,
        attr = #bt_attr{hp_lim = 1150000, mp_lim = 200, mp_rec = 200, inner_att = 8200, outer_att = 8200, inner_def = 8200, outer_def = 8200, hit = 1520, dodge = 760, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121069) ->
    #mon{
        mid = 121069,
        name = <<"江湖高手">>,
        boss = 0,
        level = 93,
        attr = #bt_attr{hp_lim = 1200000, mp_lim = 200, mp_rec = 200, inner_att = 8500, outer_att = 8500, inner_def = 8500, outer_def = 8500, hit = 1540, dodge = 770, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121070) ->
    #mon{
        mid = 121070,
        name = <<"江湖高手">>,
        boss = 0,
        level = 94,
        attr = #bt_attr{hp_lim = 1250000, mp_lim = 200, mp_rec = 200, inner_att = 8800, outer_att = 8800, inner_def = 8800, outer_def = 8800, hit = 1560, dodge = 780, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121071) ->
    #mon{
        mid = 121071,
        name = <<"江湖高手">>,
        boss = 0,
        level = 95,
        attr = #bt_attr{hp_lim = 1300000, mp_lim = 200, mp_rec = 200, inner_att = 9100, outer_att = 9100, inner_def = 9100, outer_def = 9100, hit = 1580, dodge = 790, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121072) ->
    #mon{
        mid = 121072,
        name = <<"江湖高手">>,
        boss = 0,
        level = 96,
        attr = #bt_attr{hp_lim = 1350000, mp_lim = 200, mp_rec = 200, inner_att = 9400, outer_att = 9400, inner_def = 9400, outer_def = 9400, hit = 1600, dodge = 800, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121073) ->
    #mon{
        mid = 121073,
        name = <<"江湖高手">>,
        boss = 0,
        level = 97,
        attr = #bt_attr{hp_lim = 1400000, mp_lim = 200, mp_rec = 200, inner_att = 9700, outer_att = 9700, inner_def = 9700, outer_def = 9700, hit = 1620, dodge = 810, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121074) ->
    #mon{
        mid = 121074,
        name = <<"江湖高手">>,
        boss = 0,
        level = 98,
        attr = #bt_attr{hp_lim = 1500000, mp_lim = 200, mp_rec = 200, inner_att = 10000, outer_att = 10000, inner_def = 10000, outer_def = 10000, hit = 1640, dodge = 820, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121075) ->
    #mon{
        mid = 121075,
        name = <<"江湖高手">>,
        boss = 0,
        level = 99,
        attr = #bt_attr{hp_lim = 1600000, mp_lim = 200, mp_rec = 200, inner_att = 11000, outer_att = 11000, inner_def = 11000, outer_def = 11000, hit = 1660, dodge = 830, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121076) ->
    #mon{
        mid = 121076,
        name = <<"江湖高手">>,
        boss = 0,
        level = 100,
        attr = #bt_attr{hp_lim = 1700000, mp_lim = 200, mp_rec = 200, inner_att = 12000, outer_att = 12000, inner_def = 12000, outer_def = 12000, hit = 1680, dodge = 840, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121077) ->
    #mon{
        mid = 121077,
        name = <<"江湖高手">>,
        boss = 0,
        level = 101,
        attr = #bt_attr{hp_lim = 1800000, mp_lim = 200, mp_rec = 200, inner_att = 13000, outer_att = 13000, inner_def = 13000, outer_def = 13000, hit = 1700, dodge = 850, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121078) ->
    #mon{
        mid = 121078,
        name = <<"江湖高手">>,
        boss = 0,
        level = 102,
        attr = #bt_attr{hp_lim = 1900000, mp_lim = 200, mp_rec = 200, inner_att = 14000, outer_att = 14000, inner_def = 14000, outer_def = 14000, hit = 1720, dodge = 860, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121079) ->
    #mon{
        mid = 121079,
        name = <<"江湖高手">>,
        boss = 0,
        level = 103,
        attr = #bt_attr{hp_lim = 2000000, mp_lim = 200, mp_rec = 200, inner_att = 15000, outer_att = 15000, inner_def = 15000, outer_def = 15000, hit = 1740, dodge = 870, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121080) ->
    #mon{
        mid = 121080,
        name = <<"江湖高手">>,
        boss = 0,
        level = 104,
        attr = #bt_attr{hp_lim = 2100000, mp_lim = 200, mp_rec = 200, inner_att = 16000, outer_att = 16000, inner_def = 16000, outer_def = 16000, hit = 1760, dodge = 880, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121081) ->
    #mon{
        mid = 121081,
        name = <<"江湖高手">>,
        boss = 0,
        level = 105,
        attr = #bt_attr{hp_lim = 2200000, mp_lim = 200, mp_rec = 200, inner_att = 17000, outer_att = 17000, inner_def = 17000, outer_def = 17000, hit = 1780, dodge = 890, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121082) ->
    #mon{
        mid = 121082,
        name = <<"江湖高手">>,
        boss = 0,
        level = 106,
        attr = #bt_attr{hp_lim = 2300000, mp_lim = 200, mp_rec = 200, inner_att = 18000, outer_att = 18000, inner_def = 18000, outer_def = 18000, hit = 1800, dodge = 900, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121083) ->
    #mon{
        mid = 121083,
        name = <<"江湖高手">>,
        boss = 0,
        level = 107,
        attr = #bt_attr{hp_lim = 2400000, mp_lim = 200, mp_rec = 200, inner_att = 19000, outer_att = 19000, inner_def = 19000, outer_def = 19000, hit = 1820, dodge = 910, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121084) ->
    #mon{
        mid = 121084,
        name = <<"江湖高手">>,
        boss = 0,
        level = 108,
        attr = #bt_attr{hp_lim = 2500000, mp_lim = 200, mp_rec = 200, inner_att = 20000, outer_att = 20000, inner_def = 20000, outer_def = 20000, hit = 1840, dodge = 920, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121085) ->
    #mon{
        mid = 121085,
        name = <<"江湖高手">>,
        boss = 0,
        level = 109,
        attr = #bt_attr{hp_lim = 2600000, mp_lim = 200, mp_rec = 200, inner_att = 21000, outer_att = 21000, inner_def = 21000, outer_def = 21000, hit = 1860, dodge = 930, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121086) ->
    #mon{
        mid = 121086,
        name = <<"江湖高手">>,
        boss = 0,
        level = 110,
        attr = #bt_attr{hp_lim = 2700000, mp_lim = 200, mp_rec = 200, inner_att = 22000, outer_att = 22000, inner_def = 22000, outer_def = 22000, hit = 1880, dodge = 940, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121087) ->
    #mon{
        mid = 121087,
        name = <<"江湖高手">>,
        boss = 0,
        level = 111,
        attr = #bt_attr{hp_lim = 2800000, mp_lim = 200, mp_rec = 200, inner_att = 23000, outer_att = 23000, inner_def = 23000, outer_def = 23000, hit = 1900, dodge = 950, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121088) ->
    #mon{
        mid = 121088,
        name = <<"江湖高手">>,
        boss = 0,
        level = 112,
        attr = #bt_attr{hp_lim = 2900000, mp_lim = 200, mp_rec = 200, inner_att = 24000, outer_att = 24000, inner_def = 24000, outer_def = 24000, hit = 1920, dodge = 960, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121089) ->
    #mon{
        mid = 121089,
        name = <<"江湖高手">>,
        boss = 0,
        level = 113,
        attr = #bt_attr{hp_lim = 3000000, mp_lim = 200, mp_rec = 200, inner_att = 25000, outer_att = 25000, inner_def = 25000, outer_def = 25000, hit = 1940, dodge = 970, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121090) ->
    #mon{
        mid = 121090,
        name = <<"江湖高手">>,
        boss = 0,
        level = 114,
        attr = #bt_attr{hp_lim = 3100000, mp_lim = 200, mp_rec = 200, inner_att = 26000, outer_att = 26000, inner_def = 26000, outer_def = 26000, hit = 1960, dodge = 980, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121091) ->
    #mon{
        mid = 121091,
        name = <<"江湖高手">>,
        boss = 0,
        level = 115,
        attr = #bt_attr{hp_lim = 3200000, mp_lim = 200, mp_rec = 200, inner_att = 27000, outer_att = 27000, inner_def = 27000, outer_def = 27000, hit = 1980, dodge = 990, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121092) ->
    #mon{
        mid = 121092,
        name = <<"江湖高手">>,
        boss = 0,
        level = 116,
        attr = #bt_attr{hp_lim = 3300000, mp_lim = 200, mp_rec = 200, inner_att = 28000, outer_att = 28000, inner_def = 28000, outer_def = 28000, hit = 2000, dodge = 1000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121093) ->
    #mon{
        mid = 121093,
        name = <<"江湖高手">>,
        boss = 0,
        level = 117,
        attr = #bt_attr{hp_lim = 3400000, mp_lim = 200, mp_rec = 200, inner_att = 29000, outer_att = 29000, inner_def = 29000, outer_def = 29000, hit = 2020, dodge = 1010, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121094) ->
    #mon{
        mid = 121094,
        name = <<"江湖高手">>,
        boss = 0,
        level = 118,
        attr = #bt_attr{hp_lim = 3500000, mp_lim = 200, mp_rec = 200, inner_att = 30000, outer_att = 30000, inner_def = 30000, outer_def = 30000, hit = 2040, dodge = 1020, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121095) ->
    #mon{
        mid = 121095,
        name = <<"江湖高手">>,
        boss = 0,
        level = 119,
        attr = #bt_attr{hp_lim = 3600000, mp_lim = 200, mp_rec = 200, inner_att = 31000, outer_att = 31000, inner_def = 31000, outer_def = 31000, hit = 2060, dodge = 1030, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121096) ->
    #mon{
        mid = 121096,
        name = <<"江湖高手">>,
        boss = 0,
        level = 120,
        attr = #bt_attr{hp_lim = 3700000, mp_lim = 200, mp_rec = 200, inner_att = 32000, outer_att = 32000, inner_def = 32000, outer_def = 32000, hit = 2080, dodge = 1040, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121097) ->
    #mon{
        mid = 121097,
        name = <<"江湖高手">>,
        boss = 0,
        level = 121,
        attr = #bt_attr{hp_lim = 3800000, mp_lim = 200, mp_rec = 200, inner_att = 33000, outer_att = 33000, inner_def = 33000, outer_def = 33000, hit = 2100, dodge = 1050, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121098) ->
    #mon{
        mid = 121098,
        name = <<"江湖高手">>,
        boss = 0,
        level = 122,
        attr = #bt_attr{hp_lim = 3900000, mp_lim = 200, mp_rec = 200, inner_att = 34000, outer_att = 34000, inner_def = 34000, outer_def = 34000, hit = 2120, dodge = 1060, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121099) ->
    #mon{
        mid = 121099,
        name = <<"江湖高手">>,
        boss = 0,
        level = 123,
        attr = #bt_attr{hp_lim = 4000000, mp_lim = 200, mp_rec = 200, inner_att = 35000, outer_att = 35000, inner_def = 35000, outer_def = 35000, hit = 2140, dodge = 1070, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121100) ->
    #mon{
        mid = 121100,
        name = <<"江湖高手">>,
        boss = 0,
        level = 124,
        attr = #bt_attr{hp_lim = 4100000, mp_lim = 200, mp_rec = 200, inner_att = 36000, outer_att = 36000, inner_def = 36000, outer_def = 36000, hit = 2160, dodge = 1080, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121101) ->
    #mon{
        mid = 121101,
        name = <<"江湖高手">>,
        boss = 0,
        level = 125,
        attr = #bt_attr{hp_lim = 4200000, mp_lim = 200, mp_rec = 200, inner_att = 37000, outer_att = 37000, inner_def = 37000, outer_def = 37000, hit = 2180, dodge = 1090, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121102) ->
    #mon{
        mid = 121102,
        name = <<"江湖高手">>,
        boss = 0,
        level = 126,
        attr = #bt_attr{hp_lim = 4300000, mp_lim = 200, mp_rec = 200, inner_att = 38000, outer_att = 38000, inner_def = 38000, outer_def = 38000, hit = 2200, dodge = 1100, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121103) ->
    #mon{
        mid = 121103,
        name = <<"江湖高手">>,
        boss = 0,
        level = 127,
        attr = #bt_attr{hp_lim = 4400000, mp_lim = 200, mp_rec = 200, inner_att = 39000, outer_att = 39000, inner_def = 39000, outer_def = 39000, hit = 2220, dodge = 1110, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121104) ->
    #mon{
        mid = 121104,
        name = <<"江湖高手">>,
        boss = 0,
        level = 128,
        attr = #bt_attr{hp_lim = 4500000, mp_lim = 200, mp_rec = 200, inner_att = 40000, outer_att = 40000, inner_def = 40000, outer_def = 40000, hit = 2240, dodge = 1120, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121105) ->
    #mon{
        mid = 121105,
        name = <<"江湖高手">>,
        boss = 0,
        level = 129,
        attr = #bt_attr{hp_lim = 4600000, mp_lim = 200, mp_rec = 200, inner_att = 41000, outer_att = 41000, inner_def = 41000, outer_def = 41000, hit = 2260, dodge = 1130, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121106) ->
    #mon{
        mid = 121106,
        name = <<"江湖高手">>,
        boss = 0,
        level = 130,
        attr = #bt_attr{hp_lim = 4700000, mp_lim = 200, mp_rec = 200, inner_att = 42000, outer_att = 42000, inner_def = 42000, outer_def = 42000, hit = 2280, dodge = 1140, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121107) ->
    #mon{
        mid = 121107,
        name = <<"江湖高手">>,
        boss = 0,
        level = 131,
        attr = #bt_attr{hp_lim = 4800000, mp_lim = 200, mp_rec = 200, inner_att = 43000, outer_att = 43000, inner_def = 43000, outer_def = 43000, hit = 2300, dodge = 1150, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121108) ->
    #mon{
        mid = 121108,
        name = <<"江湖高手">>,
        boss = 0,
        level = 132,
        attr = #bt_attr{hp_lim = 4900000, mp_lim = 200, mp_rec = 200, inner_att = 44000, outer_att = 44000, inner_def = 44000, outer_def = 44000, hit = 2320, dodge = 1160, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121109) ->
    #mon{
        mid = 121109,
        name = <<"江湖高手">>,
        boss = 0,
        level = 133,
        attr = #bt_attr{hp_lim = 5000000, mp_lim = 200, mp_rec = 200, inner_att = 45000, outer_att = 45000, inner_def = 45000, outer_def = 45000, hit = 2340, dodge = 1170, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121110) ->
    #mon{
        mid = 121110,
        name = <<"江湖高手">>,
        boss = 0,
        level = 134,
        attr = #bt_attr{hp_lim = 5100000, mp_lim = 200, mp_rec = 200, inner_att = 46000, outer_att = 46000, inner_def = 46000, outer_def = 46000, hit = 2360, dodge = 1180, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121111) ->
    #mon{
        mid = 121111,
        name = <<"江湖高手">>,
        boss = 0,
        level = 135,
        attr = #bt_attr{hp_lim = 5200000, mp_lim = 200, mp_rec = 200, inner_att = 47000, outer_att = 47000, inner_def = 47000, outer_def = 47000, hit = 2380, dodge = 1190, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121112) ->
    #mon{
        mid = 121112,
        name = <<"江湖高手">>,
        boss = 0,
        level = 136,
        attr = #bt_attr{hp_lim = 5300000, mp_lim = 200, mp_rec = 200, inner_att = 48000, outer_att = 48000, inner_def = 48000, outer_def = 48000, hit = 2400, dodge = 1200, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121113) ->
    #mon{
        mid = 121113,
        name = <<"江湖高手">>,
        boss = 0,
        level = 137,
        attr = #bt_attr{hp_lim = 5400000, mp_lim = 200, mp_rec = 200, inner_att = 49000, outer_att = 49000, inner_def = 49000, outer_def = 49000, hit = 2420, dodge = 1210, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121114) ->
    #mon{
        mid = 121114,
        name = <<"江湖高手">>,
        boss = 0,
        level = 138,
        attr = #bt_attr{hp_lim = 5500000, mp_lim = 200, mp_rec = 200, inner_att = 50000, outer_att = 50000, inner_def = 50000, outer_def = 50000, hit = 2440, dodge = 1220, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121115) ->
    #mon{
        mid = 121115,
        name = <<"江湖高手">>,
        boss = 0,
        level = 139,
        attr = #bt_attr{hp_lim = 5600000, mp_lim = 200, mp_rec = 200, inner_att = 51000, outer_att = 51000, inner_def = 51000, outer_def = 51000, hit = 2460, dodge = 1230, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121116) ->
    #mon{
        mid = 121116,
        name = <<"江湖高手">>,
        boss = 0,
        level = 140,
        attr = #bt_attr{hp_lim = 5700000, mp_lim = 200, mp_rec = 200, inner_att = 52000, outer_att = 52000, inner_def = 52000, outer_def = 52000, hit = 2480, dodge = 1240, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121117) ->
    #mon{
        mid = 121117,
        name = <<"江湖高手">>,
        boss = 0,
        level = 141,
        attr = #bt_attr{hp_lim = 5800000, mp_lim = 200, mp_rec = 200, inner_att = 53000, outer_att = 53000, inner_def = 53000, outer_def = 53000, hit = 2500, dodge = 1250, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121118) ->
    #mon{
        mid = 121118,
        name = <<"江湖高手">>,
        boss = 0,
        level = 142,
        attr = #bt_attr{hp_lim = 5900000, mp_lim = 200, mp_rec = 200, inner_att = 54000, outer_att = 54000, inner_def = 54000, outer_def = 54000, hit = 2520, dodge = 1260, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121119) ->
    #mon{
        mid = 121119,
        name = <<"江湖高手">>,
        boss = 0,
        level = 143,
        attr = #bt_attr{hp_lim = 6000000, mp_lim = 200, mp_rec = 200, inner_att = 55000, outer_att = 55000, inner_def = 55000, outer_def = 55000, hit = 2540, dodge = 1270, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121120) ->
    #mon{
        mid = 121120,
        name = <<"江湖高手">>,
        boss = 0,
        level = 144,
        attr = #bt_attr{hp_lim = 6100000, mp_lim = 200, mp_rec = 200, inner_att = 56000, outer_att = 56000, inner_def = 56000, outer_def = 56000, hit = 2560, dodge = 1280, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121121) ->
    #mon{
        mid = 121121,
        name = <<"江湖高手">>,
        boss = 0,
        level = 145,
        attr = #bt_attr{hp_lim = 6200000, mp_lim = 200, mp_rec = 200, inner_att = 57000, outer_att = 57000, inner_def = 57000, outer_def = 57000, hit = 2580, dodge = 1290, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121122) ->
    #mon{
        mid = 121122,
        name = <<"江湖高手">>,
        boss = 0,
        level = 146,
        attr = #bt_attr{hp_lim = 6300000, mp_lim = 200, mp_rec = 200, inner_att = 58000, outer_att = 58000, inner_def = 58000, outer_def = 58000, hit = 2600, dodge = 1300, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121123) ->
    #mon{
        mid = 121123,
        name = <<"江湖高手">>,
        boss = 0,
        level = 147,
        attr = #bt_attr{hp_lim = 6400000, mp_lim = 200, mp_rec = 200, inner_att = 59000, outer_att = 59000, inner_def = 59000, outer_def = 59000, hit = 2620, dodge = 1310, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121124) ->
    #mon{
        mid = 121124,
        name = <<"江湖高手">>,
        boss = 0,
        level = 148,
        attr = #bt_attr{hp_lim = 6500000, mp_lim = 200, mp_rec = 200, inner_att = 60000, outer_att = 60000, inner_def = 60000, outer_def = 60000, hit = 2640, dodge = 1320, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121125) ->
    #mon{
        mid = 121125,
        name = <<"江湖高手">>,
        boss = 0,
        level = 149,
        attr = #bt_attr{hp_lim = 6600000, mp_lim = 200, mp_rec = 200, inner_att = 61000, outer_att = 61000, inner_def = 61000, outer_def = 61000, hit = 2660, dodge = 1330, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121126) ->
    #mon{
        mid = 121126,
        name = <<"江湖高手">>,
        boss = 0,
        level = 150,
        attr = #bt_attr{hp_lim = 6700000, mp_lim = 200, mp_rec = 200, inner_att = 62000, outer_att = 62000, inner_def = 62000, outer_def = 62000, hit = 2680, dodge = 1340, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121127) ->
    #mon{
        mid = 121127,
        name = <<"江湖高手">>,
        boss = 0,
        level = 151,
        attr = #bt_attr{hp_lim = 6800000, mp_lim = 200, mp_rec = 200, inner_att = 63000, outer_att = 63000, inner_def = 63000, outer_def = 63000, hit = 2700, dodge = 1350, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121128) ->
    #mon{
        mid = 121128,
        name = <<"江湖高手">>,
        boss = 0,
        level = 152,
        attr = #bt_attr{hp_lim = 6900000, mp_lim = 200, mp_rec = 200, inner_att = 64000, outer_att = 64000, inner_def = 64000, outer_def = 64000, hit = 2720, dodge = 1360, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121129) ->
    #mon{
        mid = 121129,
        name = <<"江湖高手">>,
        boss = 0,
        level = 153,
        attr = #bt_attr{hp_lim = 7000000, mp_lim = 200, mp_rec = 200, inner_att = 65000, outer_att = 65000, inner_def = 65000, outer_def = 65000, hit = 2740, dodge = 1370, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121130) ->
    #mon{
        mid = 121130,
        name = <<"江湖高手">>,
        boss = 0,
        level = 154,
        attr = #bt_attr{hp_lim = 7100000, mp_lim = 200, mp_rec = 200, inner_att = 66000, outer_att = 66000, inner_def = 66000, outer_def = 66000, hit = 2760, dodge = 1380, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121131) ->
    #mon{
        mid = 121131,
        name = <<"江湖高手">>,
        boss = 0,
        level = 155,
        attr = #bt_attr{hp_lim = 7200000, mp_lim = 200, mp_rec = 200, inner_att = 67000, outer_att = 67000, inner_def = 67000, outer_def = 67000, hit = 2780, dodge = 1390, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121132) ->
    #mon{
        mid = 121132,
        name = <<"江湖高手">>,
        boss = 0,
        level = 156,
        attr = #bt_attr{hp_lim = 7300000, mp_lim = 200, mp_rec = 200, inner_att = 68000, outer_att = 68000, inner_def = 68000, outer_def = 68000, hit = 2800, dodge = 1400, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121133) ->
    #mon{
        mid = 121133,
        name = <<"江湖高手">>,
        boss = 0,
        level = 157,
        attr = #bt_attr{hp_lim = 7400000, mp_lim = 200, mp_rec = 200, inner_att = 69000, outer_att = 69000, inner_def = 69000, outer_def = 69000, hit = 2820, dodge = 1410, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121134) ->
    #mon{
        mid = 121134,
        name = <<"江湖高手">>,
        boss = 0,
        level = 158,
        attr = #bt_attr{hp_lim = 7500000, mp_lim = 200, mp_rec = 200, inner_att = 70000, outer_att = 70000, inner_def = 70000, outer_def = 70000, hit = 2840, dodge = 1420, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121135) ->
    #mon{
        mid = 121135,
        name = <<"江湖高手">>,
        boss = 0,
        level = 159,
        attr = #bt_attr{hp_lim = 7600000, mp_lim = 200, mp_rec = 200, inner_att = 71000, outer_att = 71000, inner_def = 71000, outer_def = 71000, hit = 2860, dodge = 1430, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121136) ->
    #mon{
        mid = 121136,
        name = <<"江湖高手">>,
        boss = 0,
        level = 160,
        attr = #bt_attr{hp_lim = 7700000, mp_lim = 200, mp_rec = 200, inner_att = 72000, outer_att = 72000, inner_def = 72000, outer_def = 72000, hit = 2880, dodge = 1440, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121137) ->
    #mon{
        mid = 121137,
        name = <<"江湖高手">>,
        boss = 0,
        level = 161,
        attr = #bt_attr{hp_lim = 7800000, mp_lim = 200, mp_rec = 200, inner_att = 73000, outer_att = 73000, inner_def = 73000, outer_def = 73000, hit = 2900, dodge = 1450, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121138) ->
    #mon{
        mid = 121138,
        name = <<"江湖高手">>,
        boss = 0,
        level = 162,
        attr = #bt_attr{hp_lim = 7900000, mp_lim = 200, mp_rec = 200, inner_att = 74000, outer_att = 74000, inner_def = 74000, outer_def = 74000, hit = 2920, dodge = 1460, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121139) ->
    #mon{
        mid = 121139,
        name = <<"江湖高手">>,
        boss = 0,
        level = 163,
        attr = #bt_attr{hp_lim = 8000000, mp_lim = 200, mp_rec = 200, inner_att = 75000, outer_att = 75000, inner_def = 75000, outer_def = 75000, hit = 2940, dodge = 1470, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121140) ->
    #mon{
        mid = 121140,
        name = <<"江湖高手">>,
        boss = 0,
        level = 164,
        attr = #bt_attr{hp_lim = 8100000, mp_lim = 200, mp_rec = 200, inner_att = 76000, outer_att = 76000, inner_def = 76000, outer_def = 76000, hit = 2960, dodge = 1480, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121141) ->
    #mon{
        mid = 121141,
        name = <<"江湖高手">>,
        boss = 0,
        level = 165,
        attr = #bt_attr{hp_lim = 8200000, mp_lim = 200, mp_rec = 200, inner_att = 77000, outer_att = 77000, inner_def = 77000, outer_def = 77000, hit = 2980, dodge = 1490, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121142) ->
    #mon{
        mid = 121142,
        name = <<"江湖高手">>,
        boss = 0,
        level = 166,
        attr = #bt_attr{hp_lim = 8300000, mp_lim = 200, mp_rec = 200, inner_att = 78000, outer_att = 78000, inner_def = 78000, outer_def = 78000, hit = 3000, dodge = 1500, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121143) ->
    #mon{
        mid = 121143,
        name = <<"江湖高手">>,
        boss = 0,
        level = 167,
        attr = #bt_attr{hp_lim = 8400000, mp_lim = 200, mp_rec = 200, inner_att = 79000, outer_att = 79000, inner_def = 79000, outer_def = 79000, hit = 3020, dodge = 1510, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121144) ->
    #mon{
        mid = 121144,
        name = <<"江湖高手">>,
        boss = 0,
        level = 168,
        attr = #bt_attr{hp_lim = 8500000, mp_lim = 200, mp_rec = 200, inner_att = 80000, outer_att = 80000, inner_def = 80000, outer_def = 80000, hit = 3040, dodge = 1520, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121145) ->
    #mon{
        mid = 121145,
        name = <<"江湖高手">>,
        boss = 0,
        level = 169,
        attr = #bt_attr{hp_lim = 8600000, mp_lim = 200, mp_rec = 200, inner_att = 81000, outer_att = 81000, inner_def = 81000, outer_def = 81000, hit = 3060, dodge = 1530, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121146) ->
    #mon{
        mid = 121146,
        name = <<"江湖高手">>,
        boss = 0,
        level = 170,
        attr = #bt_attr{hp_lim = 8700000, mp_lim = 200, mp_rec = 200, inner_att = 82000, outer_att = 82000, inner_def = 82000, outer_def = 82000, hit = 3080, dodge = 1540, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121147) ->
    #mon{
        mid = 121147,
        name = <<"江湖高手">>,
        boss = 0,
        level = 171,
        attr = #bt_attr{hp_lim = 8800000, mp_lim = 200, mp_rec = 200, inner_att = 83000, outer_att = 83000, inner_def = 83000, outer_def = 83000, hit = 3100, dodge = 1550, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121148) ->
    #mon{
        mid = 121148,
        name = <<"江湖高手">>,
        boss = 0,
        level = 172,
        attr = #bt_attr{hp_lim = 8900000, mp_lim = 200, mp_rec = 200, inner_att = 84000, outer_att = 84000, inner_def = 84000, outer_def = 84000, hit = 3120, dodge = 1560, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121149) ->
    #mon{
        mid = 121149,
        name = <<"江湖高手">>,
        boss = 0,
        level = 173,
        attr = #bt_attr{hp_lim = 9000000, mp_lim = 200, mp_rec = 200, inner_att = 85000, outer_att = 85000, inner_def = 85000, outer_def = 85000, hit = 3140, dodge = 1570, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121150) ->
    #mon{
        mid = 121150,
        name = <<"江湖高手">>,
        boss = 0,
        level = 174,
        attr = #bt_attr{hp_lim = 9100000, mp_lim = 200, mp_rec = 200, inner_att = 86000, outer_att = 86000, inner_def = 86000, outer_def = 86000, hit = 3160, dodge = 1580, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121151) ->
    #mon{
        mid = 121151,
        name = <<"江湖高手">>,
        boss = 0,
        level = 175,
        attr = #bt_attr{hp_lim = 9200000, mp_lim = 200, mp_rec = 200, inner_att = 87000, outer_att = 87000, inner_def = 87000, outer_def = 87000, hit = 3180, dodge = 1590, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121152) ->
    #mon{
        mid = 121152,
        name = <<"江湖高手">>,
        boss = 0,
        level = 176,
        attr = #bt_attr{hp_lim = 9300000, mp_lim = 200, mp_rec = 200, inner_att = 88000, outer_att = 88000, inner_def = 88000, outer_def = 88000, hit = 3200, dodge = 1600, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121153) ->
    #mon{
        mid = 121153,
        name = <<"江湖高手">>,
        boss = 0,
        level = 177,
        attr = #bt_attr{hp_lim = 9400000, mp_lim = 200, mp_rec = 200, inner_att = 89000, outer_att = 89000, inner_def = 89000, outer_def = 89000, hit = 3220, dodge = 1610, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121154) ->
    #mon{
        mid = 121154,
        name = <<"江湖高手">>,
        boss = 0,
        level = 178,
        attr = #bt_attr{hp_lim = 9500000, mp_lim = 200, mp_rec = 200, inner_att = 90000, outer_att = 90000, inner_def = 90000, outer_def = 90000, hit = 3240, dodge = 1620, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121155) ->
    #mon{
        mid = 121155,
        name = <<"江湖高手">>,
        boss = 0,
        level = 179,
        attr = #bt_attr{hp_lim = 9600000, mp_lim = 200, mp_rec = 200, inner_att = 91000, outer_att = 91000, inner_def = 91000, outer_def = 91000, hit = 3260, dodge = 1630, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121156) ->
    #mon{
        mid = 121156,
        name = <<"江湖高手">>,
        boss = 0,
        level = 180,
        attr = #bt_attr{hp_lim = 9700000, mp_lim = 200, mp_rec = 200, inner_att = 92000, outer_att = 92000, inner_def = 92000, outer_def = 92000, hit = 3280, dodge = 1640, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121157) ->
    #mon{
        mid = 121157,
        name = <<"江湖高手">>,
        boss = 0,
        level = 181,
        attr = #bt_attr{hp_lim = 9800000, mp_lim = 200, mp_rec = 200, inner_att = 93000, outer_att = 93000, inner_def = 93000, outer_def = 93000, hit = 3300, dodge = 1650, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121158) ->
    #mon{
        mid = 121158,
        name = <<"江湖高手">>,
        boss = 0,
        level = 182,
        attr = #bt_attr{hp_lim = 9900000, mp_lim = 200, mp_rec = 200, inner_att = 94000, outer_att = 94000, inner_def = 94000, outer_def = 94000, hit = 3320, dodge = 1660, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121159) ->
    #mon{
        mid = 121159,
        name = <<"江湖高手">>,
        boss = 0,
        level = 183,
        attr = #bt_attr{hp_lim = 10000000, mp_lim = 200, mp_rec = 200, inner_att = 95000, outer_att = 95000, inner_def = 95000, outer_def = 95000, hit = 3340, dodge = 1670, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121160) ->
    #mon{
        mid = 121160,
        name = <<"江湖高手">>,
        boss = 0,
        level = 184,
        attr = #bt_attr{hp_lim = 10100000, mp_lim = 200, mp_rec = 200, inner_att = 96000, outer_att = 96000, inner_def = 96000, outer_def = 96000, hit = 3360, dodge = 1680, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121161) ->
    #mon{
        mid = 121161,
        name = <<"江湖高手">>,
        boss = 0,
        level = 185,
        attr = #bt_attr{hp_lim = 10200000, mp_lim = 200, mp_rec = 200, inner_att = 97000, outer_att = 97000, inner_def = 97000, outer_def = 97000, hit = 3380, dodge = 1690, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121162) ->
    #mon{
        mid = 121162,
        name = <<"江湖高手">>,
        boss = 0,
        level = 186,
        attr = #bt_attr{hp_lim = 10300000, mp_lim = 200, mp_rec = 200, inner_att = 98000, outer_att = 98000, inner_def = 98000, outer_def = 98000, hit = 3400, dodge = 1700, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121163) ->
    #mon{
        mid = 121163,
        name = <<"江湖高手">>,
        boss = 0,
        level = 187,
        attr = #bt_attr{hp_lim = 10400000, mp_lim = 200, mp_rec = 200, inner_att = 99000, outer_att = 99000, inner_def = 99000, outer_def = 99000, hit = 3420, dodge = 1710, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121164) ->
    #mon{
        mid = 121164,
        name = <<"江湖高手">>,
        boss = 0,
        level = 188,
        attr = #bt_attr{hp_lim = 10500000, mp_lim = 200, mp_rec = 200, inner_att = 100000, outer_att = 100000, inner_def = 100000, outer_def = 100000, hit = 3440, dodge = 1720, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121165) ->
    #mon{
        mid = 121165,
        name = <<"江湖高手">>,
        boss = 0,
        level = 189,
        attr = #bt_attr{hp_lim = 10600000, mp_lim = 200, mp_rec = 200, inner_att = 101000, outer_att = 101000, inner_def = 101000, outer_def = 101000, hit = 3460, dodge = 1730, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121166) ->
    #mon{
        mid = 121166,
        name = <<"江湖高手">>,
        boss = 0,
        level = 190,
        attr = #bt_attr{hp_lim = 10700000, mp_lim = 200, mp_rec = 200, inner_att = 102000, outer_att = 102000, inner_def = 102000, outer_def = 102000, hit = 3480, dodge = 1740, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121167) ->
    #mon{
        mid = 121167,
        name = <<"江湖高手">>,
        boss = 0,
        level = 191,
        attr = #bt_attr{hp_lim = 10800000, mp_lim = 200, mp_rec = 200, inner_att = 103000, outer_att = 103000, inner_def = 103000, outer_def = 103000, hit = 3500, dodge = 1750, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121168) ->
    #mon{
        mid = 121168,
        name = <<"江湖高手">>,
        boss = 0,
        level = 192,
        attr = #bt_attr{hp_lim = 10900000, mp_lim = 200, mp_rec = 200, inner_att = 104000, outer_att = 104000, inner_def = 104000, outer_def = 104000, hit = 3520, dodge = 1760, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121169) ->
    #mon{
        mid = 121169,
        name = <<"江湖高手">>,
        boss = 0,
        level = 193,
        attr = #bt_attr{hp_lim = 11000000, mp_lim = 200, mp_rec = 200, inner_att = 105000, outer_att = 105000, inner_def = 105000, outer_def = 105000, hit = 3540, dodge = 1770, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121170) ->
    #mon{
        mid = 121170,
        name = <<"江湖高手">>,
        boss = 0,
        level = 194,
        attr = #bt_attr{hp_lim = 11100000, mp_lim = 200, mp_rec = 200, inner_att = 106000, outer_att = 106000, inner_def = 106000, outer_def = 106000, hit = 3560, dodge = 1780, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121171) ->
    #mon{
        mid = 121171,
        name = <<"江湖高手">>,
        boss = 0,
        level = 195,
        attr = #bt_attr{hp_lim = 11200000, mp_lim = 200, mp_rec = 200, inner_att = 107000, outer_att = 107000, inner_def = 107000, outer_def = 107000, hit = 3580, dodge = 1790, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121172) ->
    #mon{
        mid = 121172,
        name = <<"江湖高手">>,
        boss = 0,
        level = 196,
        attr = #bt_attr{hp_lim = 11300000, mp_lim = 200, mp_rec = 200, inner_att = 108000, outer_att = 108000, inner_def = 108000, outer_def = 108000, hit = 3600, dodge = 1800, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121173) ->
    #mon{
        mid = 121173,
        name = <<"江湖高手">>,
        boss = 0,
        level = 197,
        attr = #bt_attr{hp_lim = 11400000, mp_lim = 200, mp_rec = 200, inner_att = 109000, outer_att = 109000, inner_def = 109000, outer_def = 109000, hit = 3620, dodge = 1810, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121174) ->
    #mon{
        mid = 121174,
        name = <<"江湖高手">>,
        boss = 0,
        level = 198,
        attr = #bt_attr{hp_lim = 11500000, mp_lim = 200, mp_rec = 200, inner_att = 110000, outer_att = 110000, inner_def = 110000, outer_def = 110000, hit = 3640, dodge = 1820, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121175) ->
    #mon{
        mid = 121175,
        name = <<"江湖高手">>,
        boss = 0,
        level = 199,
        attr = #bt_attr{hp_lim = 11600000, mp_lim = 200, mp_rec = 200, inner_att = 111000, outer_att = 111000, inner_def = 111000, outer_def = 111000, hit = 3660, dodge = 1830, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121176) ->
    #mon{
        mid = 121176,
        name = <<"江湖高手">>,
        boss = 0,
        level = 200,
        attr = #bt_attr{hp_lim = 11700000, mp_lim = 200, mp_rec = 200, inner_att = 112000, outer_att = 112000, inner_def = 112000, outer_def = 112000, hit = 3680, dodge = 1840, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121177) ->
    #mon{
        mid = 121177,
        name = <<"江湖高手">>,
        boss = 0,
        level = 201,
        attr = #bt_attr{hp_lim = 11800000, mp_lim = 200, mp_rec = 200, inner_att = 113000, outer_att = 113000, inner_def = 113000, outer_def = 113000, hit = 3700, dodge = 1850, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121178) ->
    #mon{
        mid = 121178,
        name = <<"江湖高手">>,
        boss = 0,
        level = 202,
        attr = #bt_attr{hp_lim = 11900000, mp_lim = 200, mp_rec = 200, inner_att = 114000, outer_att = 114000, inner_def = 114000, outer_def = 114000, hit = 3720, dodge = 1860, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121179) ->
    #mon{
        mid = 121179,
        name = <<"江湖高手">>,
        boss = 0,
        level = 203,
        attr = #bt_attr{hp_lim = 12000000, mp_lim = 200, mp_rec = 200, inner_att = 115000, outer_att = 115000, inner_def = 115000, outer_def = 115000, hit = 3740, dodge = 1870, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121180) ->
    #mon{
        mid = 121180,
        name = <<"江湖高手">>,
        boss = 0,
        level = 204,
        attr = #bt_attr{hp_lim = 12100000, mp_lim = 200, mp_rec = 200, inner_att = 116000, outer_att = 116000, inner_def = 116000, outer_def = 116000, hit = 3760, dodge = 1880, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121181) ->
    #mon{
        mid = 121181,
        name = <<"江湖高手">>,
        boss = 0,
        level = 205,
        attr = #bt_attr{hp_lim = 12200000, mp_lim = 200, mp_rec = 200, inner_att = 117000, outer_att = 117000, inner_def = 117000, outer_def = 117000, hit = 3780, dodge = 1890, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121182) ->
    #mon{
        mid = 121182,
        name = <<"江湖高手">>,
        boss = 0,
        level = 206,
        attr = #bt_attr{hp_lim = 12300000, mp_lim = 200, mp_rec = 200, inner_att = 118000, outer_att = 118000, inner_def = 118000, outer_def = 118000, hit = 3800, dodge = 1900, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121183) ->
    #mon{
        mid = 121183,
        name = <<"江湖高手">>,
        boss = 0,
        level = 207,
        attr = #bt_attr{hp_lim = 12400000, mp_lim = 200, mp_rec = 200, inner_att = 119000, outer_att = 119000, inner_def = 119000, outer_def = 119000, hit = 3820, dodge = 1910, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121184) ->
    #mon{
        mid = 121184,
        name = <<"江湖高手">>,
        boss = 0,
        level = 208,
        attr = #bt_attr{hp_lim = 12500000, mp_lim = 200, mp_rec = 200, inner_att = 120000, outer_att = 120000, inner_def = 120000, outer_def = 120000, hit = 3840, dodge = 1920, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121185) ->
    #mon{
        mid = 121185,
        name = <<"江湖高手">>,
        boss = 0,
        level = 209,
        attr = #bt_attr{hp_lim = 12600000, mp_lim = 200, mp_rec = 200, inner_att = 121000, outer_att = 121000, inner_def = 121000, outer_def = 121000, hit = 3860, dodge = 1930, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121186) ->
    #mon{
        mid = 121186,
        name = <<"江湖高手">>,
        boss = 0,
        level = 210,
        attr = #bt_attr{hp_lim = 12700000, mp_lim = 200, mp_rec = 200, inner_att = 122000, outer_att = 122000, inner_def = 122000, outer_def = 122000, hit = 3880, dodge = 1940, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121187) ->
    #mon{
        mid = 121187,
        name = <<"江湖高手">>,
        boss = 0,
        level = 211,
        attr = #bt_attr{hp_lim = 12800000, mp_lim = 200, mp_rec = 200, inner_att = 123000, outer_att = 123000, inner_def = 123000, outer_def = 123000, hit = 3900, dodge = 1950, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121188) ->
    #mon{
        mid = 121188,
        name = <<"江湖高手">>,
        boss = 0,
        level = 212,
        attr = #bt_attr{hp_lim = 12900000, mp_lim = 200, mp_rec = 200, inner_att = 124000, outer_att = 124000, inner_def = 124000, outer_def = 124000, hit = 3920, dodge = 1960, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121189) ->
    #mon{
        mid = 121189,
        name = <<"江湖高手">>,
        boss = 0,
        level = 213,
        attr = #bt_attr{hp_lim = 13000000, mp_lim = 200, mp_rec = 200, inner_att = 125000, outer_att = 125000, inner_def = 125000, outer_def = 125000, hit = 3940, dodge = 1970, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121190) ->
    #mon{
        mid = 121190,
        name = <<"江湖高手">>,
        boss = 0,
        level = 214,
        attr = #bt_attr{hp_lim = 13100000, mp_lim = 200, mp_rec = 200, inner_att = 126000, outer_att = 126000, inner_def = 126000, outer_def = 126000, hit = 3960, dodge = 1980, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121191) ->
    #mon{
        mid = 121191,
        name = <<"江湖高手">>,
        boss = 0,
        level = 215,
        attr = #bt_attr{hp_lim = 13200000, mp_lim = 200, mp_rec = 200, inner_att = 127000, outer_att = 127000, inner_def = 127000, outer_def = 127000, hit = 3980, dodge = 1990, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121192) ->
    #mon{
        mid = 121192,
        name = <<"江湖高手">>,
        boss = 0,
        level = 216,
        attr = #bt_attr{hp_lim = 13300000, mp_lim = 200, mp_rec = 200, inner_att = 128000, outer_att = 128000, inner_def = 128000, outer_def = 128000, hit = 4000, dodge = 2000, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121193) ->
    #mon{
        mid = 121193,
        name = <<"江湖高手">>,
        boss = 0,
        level = 217,
        attr = #bt_attr{hp_lim = 13400000, mp_lim = 200, mp_rec = 200, inner_att = 129000, outer_att = 129000, inner_def = 129000, outer_def = 129000, hit = 4020, dodge = 2010, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121194) ->
    #mon{
        mid = 121194,
        name = <<"江湖高手">>,
        boss = 0,
        level = 218,
        attr = #bt_attr{hp_lim = 13500000, mp_lim = 200, mp_rec = 200, inner_att = 130000, outer_att = 130000, inner_def = 130000, outer_def = 130000, hit = 4040, dodge = 2020, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121195) ->
    #mon{
        mid = 121195,
        name = <<"江湖高手">>,
        boss = 0,
        level = 219,
        attr = #bt_attr{hp_lim = 13600000, mp_lim = 200, mp_rec = 200, inner_att = 131000, outer_att = 131000, inner_def = 131000, outer_def = 131000, hit = 4060, dodge = 2030, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121196) ->
    #mon{
        mid = 121196,
        name = <<"江湖高手">>,
        boss = 0,
        level = 220,
        attr = #bt_attr{hp_lim = 13700000, mp_lim = 200, mp_rec = 200, inner_att = 132000, outer_att = 132000, inner_def = 132000, outer_def = 132000, hit = 4080, dodge = 2040, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121197) ->
    #mon{
        mid = 121197,
        name = <<"江湖高手">>,
        boss = 0,
        level = 221,
        attr = #bt_attr{hp_lim = 13800000, mp_lim = 200, mp_rec = 200, inner_att = 133000, outer_att = 133000, inner_def = 133000, outer_def = 133000, hit = 4100, dodge = 2050, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121198) ->
    #mon{
        mid = 121198,
        name = <<"江湖高手">>,
        boss = 0,
        level = 222,
        attr = #bt_attr{hp_lim = 13900000, mp_lim = 200, mp_rec = 200, inner_att = 134000, outer_att = 134000, inner_def = 134000, outer_def = 134000, hit = 4120, dodge = 2060, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121199) ->
    #mon{
        mid = 121199,
        name = <<"江湖高手">>,
        boss = 0,
        level = 223,
        attr = #bt_attr{hp_lim = 14000000, mp_lim = 200, mp_rec = 200, inner_att = 135000, outer_att = 135000, inner_def = 135000, outer_def = 135000, hit = 4140, dodge = 2070, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121200) ->
    #mon{
        mid = 121200,
        name = <<"江湖高手">>,
        boss = 0,
        level = 224,
        attr = #bt_attr{hp_lim = 14100000, mp_lim = 200, mp_rec = 200, inner_att = 136000, outer_att = 136000, inner_def = 136000, outer_def = 136000, hit = 4160, dodge = 2080, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121201) ->
    #mon{
        mid = 121201,
        name = <<"江湖高手">>,
        boss = 0,
        level = 225,
        attr = #bt_attr{hp_lim = 14200000, mp_lim = 200, mp_rec = 200, inner_att = 137000, outer_att = 137000, inner_def = 137000, outer_def = 137000, hit = 4180, dodge = 2090, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121202) ->
    #mon{
        mid = 121202,
        name = <<"江湖高手">>,
        boss = 0,
        level = 226,
        attr = #bt_attr{hp_lim = 14300000, mp_lim = 200, mp_rec = 200, inner_att = 138000, outer_att = 138000, inner_def = 138000, outer_def = 138000, hit = 4200, dodge = 2100, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121203) ->
    #mon{
        mid = 121203,
        name = <<"江湖高手">>,
        boss = 0,
        level = 227,
        attr = #bt_attr{hp_lim = 14400000, mp_lim = 200, mp_rec = 200, inner_att = 139000, outer_att = 139000, inner_def = 139000, outer_def = 139000, hit = 4220, dodge = 2110, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121204) ->
    #mon{
        mid = 121204,
        name = <<"江湖高手">>,
        boss = 0,
        level = 228,
        attr = #bt_attr{hp_lim = 14500000, mp_lim = 200, mp_rec = 200, inner_att = 140000, outer_att = 140000, inner_def = 140000, outer_def = 140000, hit = 4240, dodge = 2120, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121205) ->
    #mon{
        mid = 121205,
        name = <<"江湖高手">>,
        boss = 0,
        level = 229,
        attr = #bt_attr{hp_lim = 14600000, mp_lim = 200, mp_rec = 200, inner_att = 141000, outer_att = 141000, inner_def = 141000, outer_def = 141000, hit = 4260, dodge = 2130, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121206) ->
    #mon{
        mid = 121206,
        name = <<"江湖高手">>,
        boss = 0,
        level = 230,
        attr = #bt_attr{hp_lim = 14700000, mp_lim = 200, mp_rec = 200, inner_att = 142000, outer_att = 142000, inner_def = 142000, outer_def = 142000, hit = 4280, dodge = 2140, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121207) ->
    #mon{
        mid = 121207,
        name = <<"江湖高手">>,
        boss = 0,
        level = 231,
        attr = #bt_attr{hp_lim = 14800000, mp_lim = 200, mp_rec = 200, inner_att = 143000, outer_att = 143000, inner_def = 143000, outer_def = 143000, hit = 4300, dodge = 2150, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121208) ->
    #mon{
        mid = 121208,
        name = <<"江湖高手">>,
        boss = 0,
        level = 232,
        attr = #bt_attr{hp_lim = 14900000, mp_lim = 200, mp_rec = 200, inner_att = 144000, outer_att = 144000, inner_def = 144000, outer_def = 144000, hit = 4320, dodge = 2160, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121209) ->
    #mon{
        mid = 121209,
        name = <<"江湖高手">>,
        boss = 0,
        level = 233,
        attr = #bt_attr{hp_lim = 15000000, mp_lim = 200, mp_rec = 200, inner_att = 145000, outer_att = 145000, inner_def = 145000, outer_def = 145000, hit = 4340, dodge = 2170, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121210) ->
    #mon{
        mid = 121210,
        name = <<"江湖高手">>,
        boss = 0,
        level = 234,
        attr = #bt_attr{hp_lim = 15100000, mp_lim = 200, mp_rec = 200, inner_att = 146000, outer_att = 146000, inner_def = 146000, outer_def = 146000, hit = 4360, dodge = 2180, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121211) ->
    #mon{
        mid = 121211,
        name = <<"江湖高手">>,
        boss = 0,
        level = 235,
        attr = #bt_attr{hp_lim = 15200000, mp_lim = 200, mp_rec = 200, inner_att = 147000, outer_att = 147000, inner_def = 147000, outer_def = 147000, hit = 4380, dodge = 2190, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121212) ->
    #mon{
        mid = 121212,
        name = <<"江湖高手">>,
        boss = 0,
        level = 236,
        attr = #bt_attr{hp_lim = 15300000, mp_lim = 200, mp_rec = 200, inner_att = 148000, outer_att = 148000, inner_def = 148000, outer_def = 148000, hit = 4400, dodge = 2200, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121213) ->
    #mon{
        mid = 121213,
        name = <<"江湖高手">>,
        boss = 0,
        level = 237,
        attr = #bt_attr{hp_lim = 15400000, mp_lim = 200, mp_rec = 200, inner_att = 149000, outer_att = 149000, inner_def = 149000, outer_def = 149000, hit = 4420, dodge = 2210, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121214) ->
    #mon{
        mid = 121214,
        name = <<"江湖高手">>,
        boss = 0,
        level = 238,
        attr = #bt_attr{hp_lim = 15500000, mp_lim = 200, mp_rec = 200, inner_att = 150000, outer_att = 150000, inner_def = 150000, outer_def = 150000, hit = 4440, dodge = 2220, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121215) ->
    #mon{
        mid = 121215,
        name = <<"江湖高手">>,
        boss = 0,
        level = 239,
        attr = #bt_attr{hp_lim = 15600000, mp_lim = 200, mp_rec = 200, inner_att = 151000, outer_att = 151000, inner_def = 151000, outer_def = 151000, hit = 4460, dodge = 2230, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121216) ->
    #mon{
        mid = 121216,
        name = <<"江湖高手">>,
        boss = 0,
        level = 240,
        attr = #bt_attr{hp_lim = 15700000, mp_lim = 200, mp_rec = 200, inner_att = 152000, outer_att = 152000, inner_def = 152000, outer_def = 152000, hit = 4480, dodge = 2240, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121217) ->
    #mon{
        mid = 121217,
        name = <<"江湖高手">>,
        boss = 0,
        level = 241,
        attr = #bt_attr{hp_lim = 15800000, mp_lim = 200, mp_rec = 200, inner_att = 153000, outer_att = 153000, inner_def = 153000, outer_def = 153000, hit = 4500, dodge = 2250, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121218) ->
    #mon{
        mid = 121218,
        name = <<"江湖高手">>,
        boss = 0,
        level = 242,
        attr = #bt_attr{hp_lim = 15900000, mp_lim = 200, mp_rec = 200, inner_att = 154000, outer_att = 154000, inner_def = 154000, outer_def = 154000, hit = 4520, dodge = 2260, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121219) ->
    #mon{
        mid = 121219,
        name = <<"江湖高手">>,
        boss = 0,
        level = 243,
        attr = #bt_attr{hp_lim = 16000000, mp_lim = 200, mp_rec = 200, inner_att = 155000, outer_att = 155000, inner_def = 155000, outer_def = 155000, hit = 4540, dodge = 2270, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(121220) ->
    #mon{
        mid = 121220,
        name = <<"江湖高手">>,
        boss = 0,
        level = 244,
        attr = #bt_attr{hp_lim = 16100000, mp_lim = 200, mp_rec = 200, inner_att = 156000, outer_att = 156000, inner_def = 156000, outer_def = 156000, hit = 4560, dodge = 2280, crit_hurt = 6, crit_def = 10, move_speed = 200},
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
get(MId) ->
    ?ERROR_FUNC_CALL([MId]),
    undefined.

