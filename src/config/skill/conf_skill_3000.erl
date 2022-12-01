%% -*- coding: latin-1 -*-
%%-------------------------------------------------------
%% @File   : conf_skill_3000
%% @Brief  : 技能配置
%% @Author : Ryuu
%% @Date   : 2018-08-20
%%-------------------------------------------------------
-module(conf_skill_3000).

-include("skill.hrl").

-export([
    get/1,
    get_base/2
]).

get({30000001, 0}) ->
    #{
        id => 30000001,
        name => <<"穿刺技能">>,
        type => 2,
        level => 0,
        cost => 100,
        material => [],
        attr => [{1,0}]
    };
get(_ID) ->
    undefined.


get_base(30000001, 0) ->
    #base_skill{
        id = 30000001,
        level = 0,
        type = 2,
        category = 1,
        mp = 0,
        anger = 0,
        cd = 0,
        to_obj = 1,
        skill_ratio = 2500,
        attr_ratio = 5000,
        skill_const = 1000,
        cure_ratio = 1000,
        attr_cure_ratio = 1000,
        cure_const = 1000,
        att_num = 1,
        att_area = [{1,10}],
        att_times = [0],
        pre_time = 0,
        self_buff = [],
        target_buff = [],
        del_self_buff_types = [],
        del_buff_types = [],
        sp = 5,
        repel = [],
        power = 0,
        attr = [{1,0}],
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

