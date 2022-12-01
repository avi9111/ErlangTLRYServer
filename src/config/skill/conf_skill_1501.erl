%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_skill_1501
%% @Brief  : 技能配置
%% @Author : Ryuu
%% @Date   : 2018-08-20
%%-------------------------------------------------------
-module(conf_skill_1501).

-include("skill.hrl").

-export([
    get/1,
    get_base/2
]).

get({15010001, 1}) ->
    #{
        id => 15010001,
        name => <<"小怪普攻1">>,
        type => 1,
        level => 1,
        cost => 0,
        material => [],
        attr => []
    };
get({15010002, 1}) ->
    #{
        id => 15010002,
        name => <<"箭塔攻击">>,
        type => 1,
        level => 1,
        cost => 0,
        material => [],
        attr => []
    };
get(_ID) ->
    undefined.


get_base(15010001, 1) ->
    #base_skill{
        id = 15010001,
        level = 1,
        type = 1,
        category = 7,
        mp = 0,
        anger = 0,
        cd = 2000,
        to_obj = 2,
        skill_ratio = 10000,
        attr_ratio = 10000,
        skill_const = 0,
        cure_ratio = 0,
        attr_cure_ratio = 0,
        cure_const = 0,
        att_num = 1,
        att_area = [{1,4}],
        att_times = [0],
        pre_time = 0,
        self_buff = [],
        target_buff = [],
        del_self_buff_types = [],
        del_buff_types = [],
        sp = 0,
        repel = [],
        power = 0,
        attr = [],
        pos_type = 0,
        pos_dist = 0,
        pos_time = 0,
        pos_skill = 0,
        dup_ratio = [],
        dup_skill = 0,
        extra_harm = {},
        extra_buff = {},
        remove_cd = [],
        flyitems = [],
        suck_blood_ratio = 0,
        suck_blood_fact = 0,
        rec_blood_ratio = 0,
        rec_blood_perc = 0,
        suck_magic_ratio = 0,
        suck_magic_fact = 0,
        suck_magic_perc = 0,
        rec_magic_ratio = 0,
        rec_magic_perc = 0
    };
get_base(15010002, 1) ->
    #base_skill{
        id = 15010002,
        level = 1,
        type = 1,
        category = 7,
        mp = 0,
        anger = 0,
        cd = 1000,
        to_obj = 2,
        skill_ratio = 10000,
        attr_ratio = 10000,
        skill_const = 0,
        cure_ratio = 0,
        attr_cure_ratio = 0,
        cure_const = 0,
        att_num = 1,
        att_area = [{1,10}],
        att_times = [0],
        pre_time = 0,
        self_buff = [],
        target_buff = [],
        del_self_buff_types = [],
        del_buff_types = [],
        sp = 0,
        repel = [],
        power = 0,
        attr = [],
        pos_type = 0,
        pos_dist = 0,
        pos_time = 0,
        pos_skill = 0,
        dup_ratio = [],
        dup_skill = 0,
        extra_harm = {},
        extra_buff = {},
        remove_cd = [],
        flyitems = [],
        suck_blood_ratio = 0,
        suck_blood_fact = 0,
        rec_blood_ratio = 0,
        rec_blood_perc = 0,
        suck_magic_ratio = 0,
        suck_magic_fact = 0,
        suck_magic_perc = 0,
        rec_magic_ratio = 0,
        rec_magic_perc = 0
    };
get_base(_SkillId, _Level) ->
    undefined.

