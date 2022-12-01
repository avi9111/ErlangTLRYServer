%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_40).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(4001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4001,
                level = 1,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4001,
                level = 2,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4001,
                level = 3,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4001,
                level = 4,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4001,
                level = 5,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,5}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4001,
                level = 6,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,6}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4001,
                level = 7,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,7}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4001,
                level = 8,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,8}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4001,
                level = 9,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,9}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4001,
                level = 10,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,10}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4001,
                level = 11,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,11}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4001,
                level = 12,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,12}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4001,
                level = 13,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,13}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4001,
                level = 14,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,14}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4001,
                level = 15,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,15}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4001,
                level = 16,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,16}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4001,
                level = 17,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,17}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4001,
                level = 18,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,18}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4001,
                level = 19,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,19}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4001,
                level = 20,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,20}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4001,
                level = 21,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,21}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4001,
                level = 22,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,22}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4001,
                level = 23,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,23}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4001,
                level = 24,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,24}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4001,
                level = 25,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,25}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4001,
                level = 26,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,26}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4001,
                level = 27,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,27}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4001,
                level = 28,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,28}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4001,
                level = 29,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,29}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4001,
                level = 30,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,30}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4001,
                level = 31,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,31}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4001,
                level = 32,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,32}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4001,
                level = 33,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,33}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4001,
                level = 34,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,34}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4001,
                level = 35,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,35}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4001,
                level = 36,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,36}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4001,
                level = 37,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,37}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4001,
                level = 38,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,38}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4001,
                level = 39,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,39}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4001,
                level = 40,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,40}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4001,
                level = 41,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,41}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4001,
                level = 42,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,42}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4001,
                level = 43,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,43}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4001,
                level = 44,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,44}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4001,
                level = 45,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,45}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4001,
                level = 46,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,46}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4001,
                level = 47,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,47}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4001,
                level = 48,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,48}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4001,
                level = 49,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,49}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4001,
                level = 50,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,50}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4001,
                level = 51,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,51}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4001,
                level = 52,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,52}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4001,
                level = 53,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,53}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4001,
                level = 54,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,54}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4001,
                level = 55,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,55}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4001,
                level = 56,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,56}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4001,
                level = 57,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,57}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4001,
                level = 58,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,58}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4001,
                level = 59,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,59}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4001,
                level = 60,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,60}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4001,
                level = 61,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,61}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4001,
                level = 62,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,62}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4001,
                level = 63,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,63}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4001,
                level = 64,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,64}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4001,
                level = 65,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,65}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4001,
                level = 66,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,66}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4001,
                level = 67,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,67}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4001,
                level = 68,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,68}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4001,
                level = 69,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,69}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4001,
                level = 70,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,70}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4001,
                level = 71,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,71}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4001,
                level = 72,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,72}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4001,
                level = 73,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,73}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4001,
                level = 74,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,74}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4001,
                level = 75,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,75}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4001,
                level = 76,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,76}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4001,
                level = 77,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,77}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4001,
                level = 78,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,78}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4001,
                level = 79,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,79}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4001,
                level = 80,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,80}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4001,
                level = 81,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,81}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4001,
                level = 82,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,82}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4001,
                level = 83,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,83}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4001,
                level = 84,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,84}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4001,
                level = 85,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,85}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4001,
                level = 86,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,86}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4001,
                level = 87,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,87}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4001,
                level = 88,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,88}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4001,
                level = 89,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,89}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4001,
                level = 90,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,90}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4001,
                level = 91,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,91}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4001,
                level = 92,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,92}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4001,
                level = 93,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,93}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4001,
                level = 94,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,94}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4001,
                level = 95,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,95}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4001,
                level = 96,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,96}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4001,
                level = 97,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,97}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4001,
                level = 98,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,98}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4001,
                level = 99,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,99}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4001,
                level = 100,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,100}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4001,
                level = 101,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,101}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4001,
                level = 102,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,102}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4001,
                level = 103,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,103}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4001,
                level = 104,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,104}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4001,
                level = 105,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,105}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4001,
                level = 106,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,106}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4001,
                level = 107,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,107}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4001,
                level = 108,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,108}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4001,
                level = 109,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,109}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4001,
                level = 110,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,110}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4001,
                level = 111,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,111}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4001,
                level = 112,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,112}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4001,
                level = 113,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,113}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4001,
                level = 114,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,114}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4001,
                level = 115,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,115}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4001,
                level = 116,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,116}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4001,
                level = 117,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,117}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4001,
                level = 118,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,118}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4001,
                level = 119,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,119}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4001,
                level = 120,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,120}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4001,
                level = 121,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,121}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4001,
                level = 122,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,122}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4001,
                level = 123,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,123}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4001,
                level = 124,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,124}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4001,
                level = 125,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,125}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4001,
                level = 126,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,126}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4001,
                level = 127,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,127}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4001,
                level = 128,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,128}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4001,
                level = 129,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,129}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4001,
                level = 130,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,130}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4001,
                level = 131,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,131}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4001,
                level = 132,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,132}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4001,
                level = 133,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,133}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4001,
                level = 134,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,134}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4001,
                level = 135,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,135}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4001,
                level = 136,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,136}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4001,
                level = 137,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,137}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4001,
                level = 138,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,138}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4001,
                level = 139,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,139}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4001,
                level = 140,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,140}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4001,
                level = 141,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,141}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4001,
                level = 142,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,142}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4001,
                level = 143,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,143}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4001,
                level = 144,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,144}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4001,
                level = 145,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,145}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4001,
                level = 146,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,146}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4001,
                level = 147,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,147}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4001,
                level = 148,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,148}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4001,
                level = 149,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,149}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4001,
                level = 150,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,150}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4001,
                level = 151,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,151}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4001,
                level = 152,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,152}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4001,
                level = 153,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,153}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4001,
                level = 154,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,154}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4001,
                level = 155,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,155}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4001,
                level = 156,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,156}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4001,
                level = 157,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,157}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4001,
                level = 158,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,158}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4001,
                level = 159,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,159}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4001,
                level = 160,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,160}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4001,
                level = 161,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,161}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4001,
                level = 162,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,162}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4001,
                level = 163,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,163}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4001,
                level = 164,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,164}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4001,
                level = 165,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,165}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4001,
                level = 166,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,166}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4001,
                level = 167,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,167}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4001,
                level = 168,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,168}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4001,
                level = 169,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,169}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4001,
                level = 170,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,170}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4001,
                level = 171,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,171}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4001,
                level = 172,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,172}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4001,
                level = 173,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,173}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4001,
                level = 174,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,174}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4001,
                level = 175,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,175}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4001,
                level = 176,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,176}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4001,
                level = 177,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,177}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4001,
                level = 178,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,178}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4001,
                level = 179,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,179}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4001,
                level = 180,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,180}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4001,
                level = 181,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,181}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4001,
                level = 182,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,182}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4001,
                level = 183,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,183}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4001,
                level = 184,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,184}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4001,
                level = 185,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,185}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4001,
                level = 186,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,186}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4001,
                level = 187,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,187}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4001,
                level = 188,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,188}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4001,
                level = 189,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,189}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4001,
                level = 190,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,190}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4001,
                level = 191,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,191}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4001,
                level = 192,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,192}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4001,
                level = 193,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,193}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4001,
                level = 194,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,194}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4001,
                level = 195,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,195}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4001,
                level = 196,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,196}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4001,
                level = 197,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,197}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4001,
                level = 198,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,198}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4001,
                level = 199,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,199}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4001,
                level = 200,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,200}],
                remove_act = []
            };
        Level =:= 255 ->
            #conf_effect{
                id = 4001,
                level = 255,
                kind = 14,
                group = 4001,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4002,
                level = 1,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4002,
                level = 2,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4002,
                level = 3,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4002,
                level = 4,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4002,
                level = 5,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4002,
                level = 6,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4002,
                level = 7,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4002,
                level = 8,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4002,
                level = 9,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4002,
                level = 10,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4002,
                level = 11,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4002,
                level = 12,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4002,
                level = 13,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4002,
                level = 14,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4002,
                level = 15,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4002,
                level = 16,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4002,
                level = 17,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4002,
                level = 18,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4002,
                level = 19,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4002,
                level = 20,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4002,
                level = 21,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4002,
                level = 22,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4002,
                level = 23,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4002,
                level = 24,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4002,
                level = 25,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4002,
                level = 26,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4002,
                level = 27,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4002,
                level = 28,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4002,
                level = 29,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4002,
                level = 30,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4002,
                level = 31,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4002,
                level = 32,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4002,
                level = 33,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4002,
                level = 34,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4002,
                level = 35,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4002,
                level = 36,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4002,
                level = 37,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4002,
                level = 38,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4002,
                level = 39,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4002,
                level = 40,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4002,
                level = 41,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4002,
                level = 42,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4002,
                level = 43,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4002,
                level = 44,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4002,
                level = 45,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4002,
                level = 46,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4002,
                level = 47,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4002,
                level = 48,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4002,
                level = 49,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4002,
                level = 50,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4002,
                level = 51,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4002,
                level = 52,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4002,
                level = 53,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4002,
                level = 54,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4002,
                level = 55,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4002,
                level = 56,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4002,
                level = 57,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4002,
                level = 58,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4002,
                level = 59,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4002,
                level = 60,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4002,
                level = 61,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4002,
                level = 62,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4002,
                level = 63,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4002,
                level = 64,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4002,
                level = 65,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4002,
                level = 66,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4002,
                level = 67,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4002,
                level = 68,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4002,
                level = 69,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4002,
                level = 70,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4002,
                level = 71,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4002,
                level = 72,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4002,
                level = 73,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4002,
                level = 74,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4002,
                level = 75,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4002,
                level = 76,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4002,
                level = 77,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4002,
                level = 78,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4002,
                level = 79,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4002,
                level = 80,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4002,
                level = 81,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4002,
                level = 82,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4002,
                level = 83,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4002,
                level = 84,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4002,
                level = 85,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4002,
                level = 86,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4002,
                level = 87,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4002,
                level = 88,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4002,
                level = 89,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4002,
                level = 90,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4002,
                level = 91,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4002,
                level = 92,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4002,
                level = 93,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4002,
                level = 94,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4002,
                level = 95,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4002,
                level = 96,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4002,
                level = 97,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4002,
                level = 98,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4002,
                level = 99,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4002,
                level = 100,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4002,
                level = 101,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4002,
                level = 102,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4002,
                level = 103,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4002,
                level = 104,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4002,
                level = 105,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4002,
                level = 106,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4002,
                level = 107,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4002,
                level = 108,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4002,
                level = 109,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4002,
                level = 110,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4002,
                level = 111,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4002,
                level = 112,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4002,
                level = 113,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4002,
                level = 114,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4002,
                level = 115,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4002,
                level = 116,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4002,
                level = 117,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4002,
                level = 118,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4002,
                level = 119,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4002,
                level = 120,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4002,
                level = 121,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4002,
                level = 122,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4002,
                level = 123,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4002,
                level = 124,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4002,
                level = 125,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4002,
                level = 126,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4002,
                level = 127,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4002,
                level = 128,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4002,
                level = 129,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4002,
                level = 130,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4002,
                level = 131,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4002,
                level = 132,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4002,
                level = 133,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4002,
                level = 134,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4002,
                level = 135,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4002,
                level = 136,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4002,
                level = 137,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4002,
                level = 138,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4002,
                level = 139,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4002,
                level = 140,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4002,
                level = 141,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4002,
                level = 142,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4002,
                level = 143,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4002,
                level = 144,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4002,
                level = 145,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4002,
                level = 146,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4002,
                level = 147,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4002,
                level = 148,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4002,
                level = 149,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4002,
                level = 150,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4002,
                level = 151,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4002,
                level = 152,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4002,
                level = 153,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4002,
                level = 154,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4002,
                level = 155,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4002,
                level = 156,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4002,
                level = 157,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4002,
                level = 158,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4002,
                level = 159,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4002,
                level = 160,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4002,
                level = 161,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4002,
                level = 162,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4002,
                level = 163,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4002,
                level = 164,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4002,
                level = 165,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4002,
                level = 166,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4002,
                level = 167,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4002,
                level = 168,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4002,
                level = 169,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4002,
                level = 170,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4002,
                level = 171,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4002,
                level = 172,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4002,
                level = 173,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4002,
                level = 174,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4002,
                level = 175,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4002,
                level = 176,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4002,
                level = 177,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4002,
                level = 178,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4002,
                level = 179,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4002,
                level = 180,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4002,
                level = 181,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4002,
                level = 182,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4002,
                level = 183,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4002,
                level = 184,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4002,
                level = 185,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4002,
                level = 186,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4002,
                level = 187,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4002,
                level = 188,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4002,
                level = 189,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4002,
                level = 190,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4002,
                level = 191,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4002,
                level = 192,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4002,
                level = 193,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4002,
                level = 194,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4002,
                level = 195,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4002,
                level = 196,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4002,
                level = 197,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4002,
                level = 198,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4002,
                level = 199,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4002,
                level = 200,
                kind = 16,
                group = 4002,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        true ->
            undefined
    end;
get(4003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4003,
                level = 1,
                kind = 5,
                group = 4003,
                group_rule = 1,
                type = 11001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4004, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4004,
                level = 1,
                kind = 5,
                group = 4003,
                group_rule = 2,
                type = 11001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4005, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4005,
                level = 1,
                kind = 16,
                group = 4005,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{102,1}}]
            };
        true ->
            undefined
    end;
get(4006, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4006,
                level = 1,
                kind = 13,
                group = 4006,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11714},{10000,0,11601}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4007, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4007,
                level = 1,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4007,
                level = 2,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4007,
                level = 3,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4007,
                level = 4,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4007,
                level = 5,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4007,
                level = 6,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4007,
                level = 7,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4007,
                level = 8,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4007,
                level = 9,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4007,
                level = 10,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4007,
                level = 11,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4007,
                level = 12,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4007,
                level = 13,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4007,
                level = 14,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4007,
                level = 15,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4007,
                level = 16,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4007,
                level = 17,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4007,
                level = 18,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4007,
                level = 19,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4007,
                level = 20,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4007,
                level = 21,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4007,
                level = 22,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4007,
                level = 23,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4007,
                level = 24,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4007,
                level = 25,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4007,
                level = 26,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4007,
                level = 27,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4007,
                level = 28,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4007,
                level = 29,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4007,
                level = 30,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4007,
                level = 31,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4007,
                level = 32,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4007,
                level = 33,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4007,
                level = 34,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4007,
                level = 35,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4007,
                level = 36,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4007,
                level = 37,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4007,
                level = 38,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4007,
                level = 39,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4007,
                level = 40,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4007,
                level = 41,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4007,
                level = 42,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4007,
                level = 43,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4007,
                level = 44,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4007,
                level = 45,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4007,
                level = 46,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4007,
                level = 47,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4007,
                level = 48,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4007,
                level = 49,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4007,
                level = 50,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4007,
                level = 51,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4007,
                level = 52,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4007,
                level = 53,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4007,
                level = 54,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4007,
                level = 55,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4007,
                level = 56,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4007,
                level = 57,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4007,
                level = 58,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4007,
                level = 59,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4007,
                level = 60,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4007,
                level = 61,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4007,
                level = 62,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4007,
                level = 63,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4007,
                level = 64,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4007,
                level = 65,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4007,
                level = 66,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4007,
                level = 67,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4007,
                level = 68,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4007,
                level = 69,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4007,
                level = 70,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4007,
                level = 71,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4007,
                level = 72,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4007,
                level = 73,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4007,
                level = 74,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4007,
                level = 75,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4007,
                level = 76,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4007,
                level = 77,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4007,
                level = 78,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4007,
                level = 79,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4007,
                level = 80,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4007,
                level = 81,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4007,
                level = 82,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4007,
                level = 83,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4007,
                level = 84,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4007,
                level = 85,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4007,
                level = 86,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4007,
                level = 87,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4007,
                level = 88,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4007,
                level = 89,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4007,
                level = 90,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4007,
                level = 91,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4007,
                level = 92,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4007,
                level = 93,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4007,
                level = 94,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4007,
                level = 95,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4007,
                level = 96,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4007,
                level = 97,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4007,
                level = 98,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4007,
                level = 99,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4007,
                level = 100,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4007,
                level = 101,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4007,
                level = 102,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4007,
                level = 103,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4007,
                level = 104,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4007,
                level = 105,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4007,
                level = 106,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4007,
                level = 107,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4007,
                level = 108,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4007,
                level = 109,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4007,
                level = 110,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4007,
                level = 111,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4007,
                level = 112,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4007,
                level = 113,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4007,
                level = 114,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4007,
                level = 115,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4007,
                level = 116,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4007,
                level = 117,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4007,
                level = 118,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4007,
                level = 119,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4007,
                level = 120,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4007,
                level = 121,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4007,
                level = 122,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4007,
                level = 123,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4007,
                level = 124,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4007,
                level = 125,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4007,
                level = 126,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4007,
                level = 127,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4007,
                level = 128,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4007,
                level = 129,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4007,
                level = 130,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4007,
                level = 131,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4007,
                level = 132,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4007,
                level = 133,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4007,
                level = 134,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4007,
                level = 135,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4007,
                level = 136,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4007,
                level = 137,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4007,
                level = 138,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4007,
                level = 139,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4007,
                level = 140,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4007,
                level = 141,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4007,
                level = 142,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4007,
                level = 143,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4007,
                level = 144,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4007,
                level = 145,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4007,
                level = 146,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4007,
                level = 147,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4007,
                level = 148,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4007,
                level = 149,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4007,
                level = 150,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4007,
                level = 151,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4007,
                level = 152,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4007,
                level = 153,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4007,
                level = 154,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4007,
                level = 155,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4007,
                level = 156,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4007,
                level = 157,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4007,
                level = 158,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4007,
                level = 159,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4007,
                level = 160,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4007,
                level = 161,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4007,
                level = 162,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4007,
                level = 163,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4007,
                level = 164,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4007,
                level = 165,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4007,
                level = 166,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4007,
                level = 167,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4007,
                level = 168,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4007,
                level = 169,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4007,
                level = 170,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4007,
                level = 171,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4007,
                level = 172,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4007,
                level = 173,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4007,
                level = 174,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4007,
                level = 175,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4007,
                level = 176,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4007,
                level = 177,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4007,
                level = 178,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4007,
                level = 179,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4007,
                level = 180,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4007,
                level = 181,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4007,
                level = 182,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4007,
                level = 183,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4007,
                level = 184,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4007,
                level = 185,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4007,
                level = 186,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4007,
                level = 187,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4007,
                level = 188,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4007,
                level = 189,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4007,
                level = 190,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4007,
                level = 191,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4007,
                level = 192,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4007,
                level = 193,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4007,
                level = 194,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4007,
                level = 195,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4007,
                level = 196,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4007,
                level = 197,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4007,
                level = 198,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4007,
                level = 199,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4007,
                level = 200,
                kind = 1,
                group = 4007,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4008, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4008,
                level = 1,
                kind = 17,
                group = 4008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4009, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4009,
                level = 1,
                kind = 23,
                group = 4009,
                group_rule = 1,
                type = 13101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0.3],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4010, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4010,
                level = 1,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4010,
                level = 2,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4010,
                level = 3,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4010,
                level = 4,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4010,
                level = 5,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4010,
                level = 6,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4010,
                level = 7,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4010,
                level = 8,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4010,
                level = 9,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4010,
                level = 10,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4010,
                level = 11,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4010,
                level = 12,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4010,
                level = 13,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4010,
                level = 14,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4010,
                level = 15,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4010,
                level = 16,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4010,
                level = 17,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4010,
                level = 18,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4010,
                level = 19,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4010,
                level = 20,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4010,
                level = 21,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4010,
                level = 22,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4010,
                level = 23,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4010,
                level = 24,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4010,
                level = 25,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4010,
                level = 26,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4010,
                level = 27,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4010,
                level = 28,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4010,
                level = 29,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4010,
                level = 30,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4010,
                level = 31,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4010,
                level = 32,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4010,
                level = 33,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4010,
                level = 34,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4010,
                level = 35,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4010,
                level = 36,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4010,
                level = 37,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4010,
                level = 38,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4010,
                level = 39,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4010,
                level = 40,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4010,
                level = 41,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4010,
                level = 42,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4010,
                level = 43,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4010,
                level = 44,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4010,
                level = 45,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4010,
                level = 46,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4010,
                level = 47,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4010,
                level = 48,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4010,
                level = 49,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4010,
                level = 50,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4010,
                level = 51,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4010,
                level = 52,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4010,
                level = 53,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4010,
                level = 54,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4010,
                level = 55,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4010,
                level = 56,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4010,
                level = 57,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4010,
                level = 58,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4010,
                level = 59,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4010,
                level = 60,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4010,
                level = 61,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4010,
                level = 62,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4010,
                level = 63,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4010,
                level = 64,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4010,
                level = 65,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4010,
                level = 66,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4010,
                level = 67,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4010,
                level = 68,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4010,
                level = 69,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4010,
                level = 70,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4010,
                level = 71,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4010,
                level = 72,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4010,
                level = 73,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4010,
                level = 74,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4010,
                level = 75,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4010,
                level = 76,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4010,
                level = 77,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4010,
                level = 78,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4010,
                level = 79,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4010,
                level = 80,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4010,
                level = 81,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4010,
                level = 82,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4010,
                level = 83,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4010,
                level = 84,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4010,
                level = 85,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4010,
                level = 86,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4010,
                level = 87,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4010,
                level = 88,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4010,
                level = 89,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4010,
                level = 90,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4010,
                level = 91,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4010,
                level = 92,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4010,
                level = 93,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4010,
                level = 94,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4010,
                level = 95,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4010,
                level = 96,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4010,
                level = 97,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4010,
                level = 98,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4010,
                level = 99,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4010,
                level = 100,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4010,
                level = 101,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4010,
                level = 102,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4010,
                level = 103,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4010,
                level = 104,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4010,
                level = 105,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4010,
                level = 106,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4010,
                level = 107,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4010,
                level = 108,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4010,
                level = 109,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4010,
                level = 110,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4010,
                level = 111,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4010,
                level = 112,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4010,
                level = 113,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4010,
                level = 114,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4010,
                level = 115,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4010,
                level = 116,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4010,
                level = 117,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4010,
                level = 118,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4010,
                level = 119,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4010,
                level = 120,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4010,
                level = 121,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4010,
                level = 122,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4010,
                level = 123,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4010,
                level = 124,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4010,
                level = 125,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4010,
                level = 126,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4010,
                level = 127,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4010,
                level = 128,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4010,
                level = 129,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4010,
                level = 130,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4010,
                level = 131,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4010,
                level = 132,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4010,
                level = 133,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4010,
                level = 134,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4010,
                level = 135,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4010,
                level = 136,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4010,
                level = 137,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4010,
                level = 138,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4010,
                level = 139,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4010,
                level = 140,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4010,
                level = 141,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4010,
                level = 142,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4010,
                level = 143,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4010,
                level = 144,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4010,
                level = 145,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4010,
                level = 146,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4010,
                level = 147,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4010,
                level = 148,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4010,
                level = 149,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4010,
                level = 150,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4010,
                level = 151,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4010,
                level = 152,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4010,
                level = 153,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4010,
                level = 154,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4010,
                level = 155,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4010,
                level = 156,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4010,
                level = 157,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4010,
                level = 158,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4010,
                level = 159,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4010,
                level = 160,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4010,
                level = 161,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4010,
                level = 162,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4010,
                level = 163,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4010,
                level = 164,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4010,
                level = 165,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4010,
                level = 166,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4010,
                level = 167,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4010,
                level = 168,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4010,
                level = 169,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4010,
                level = 170,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4010,
                level = 171,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4010,
                level = 172,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4010,
                level = 173,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4010,
                level = 174,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4010,
                level = 175,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4010,
                level = 176,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4010,
                level = 177,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4010,
                level = 178,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4010,
                level = 179,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4010,
                level = 180,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4010,
                level = 181,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4010,
                level = 182,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4010,
                level = 183,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4010,
                level = 184,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4010,
                level = 185,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4010,
                level = 186,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4010,
                level = 187,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4010,
                level = 188,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4010,
                level = 189,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4010,
                level = 190,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4010,
                level = 191,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4010,
                level = 192,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4010,
                level = 193,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4010,
                level = 194,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4010,
                level = 195,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4010,
                level = 196,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4010,
                level = 197,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4010,
                level = 198,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4010,
                level = 199,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4010,
                level = 200,
                kind = 1,
                group = 4010,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4011, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4011,
                level = 1,
                kind = 20,
                group = 4011,
                group_rule = 1,
                type = 10801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4012, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4012,
                level = 1,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4012,
                level = 2,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4012,
                level = 3,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4012,
                level = 4,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4012,
                level = 5,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,5}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4012,
                level = 6,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,6}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4012,
                level = 7,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,7}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4012,
                level = 8,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,8}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4012,
                level = 9,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,9}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4012,
                level = 10,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,10}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4012,
                level = 11,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,11}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4012,
                level = 12,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5525,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,12}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4012,
                level = 13,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,13}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4012,
                level = 14,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5575,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,14}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4012,
                level = 15,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,15}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4012,
                level = 16,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5625,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,16}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4012,
                level = 17,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,17}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4012,
                level = 18,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5675,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,18}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4012,
                level = 19,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,19}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4012,
                level = 20,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,20}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4012,
                level = 21,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,21}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4012,
                level = 22,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5775,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,22}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4012,
                level = 23,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,23}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4012,
                level = 24,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5825,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,24}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4012,
                level = 25,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,25}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4012,
                level = 26,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5875,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,26}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4012,
                level = 27,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,27}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4012,
                level = 28,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5925,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,28}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4012,
                level = 29,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,29}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4012,
                level = 30,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5975,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,30}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4012,
                level = 31,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,31}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4012,
                level = 32,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6025,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,32}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4012,
                level = 33,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,33}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4012,
                level = 34,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6075,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,34}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4012,
                level = 35,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,35}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4012,
                level = 36,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6125,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,36}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4012,
                level = 37,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,37}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4012,
                level = 38,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6175,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,38}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4012,
                level = 39,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,39}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4012,
                level = 40,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6225,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,40}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4012,
                level = 41,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,41}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4012,
                level = 42,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6275,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,42}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4012,
                level = 43,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,43}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4012,
                level = 44,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6325,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,44}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4012,
                level = 45,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,45}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4012,
                level = 46,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6375,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,46}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4012,
                level = 47,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,47}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4012,
                level = 48,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6425,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,48}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4012,
                level = 49,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,49}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4012,
                level = 50,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6475,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,50}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4012,
                level = 51,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,51}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4012,
                level = 52,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6525,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,52}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4012,
                level = 53,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,53}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4012,
                level = 54,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6575,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,54}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4012,
                level = 55,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,55}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4012,
                level = 56,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6625,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,56}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4012,
                level = 57,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,57}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4012,
                level = 58,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6675,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,58}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4012,
                level = 59,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,59}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4012,
                level = 60,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,60}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4012,
                level = 61,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,61}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4012,
                level = 62,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6775,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,62}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4012,
                level = 63,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,63}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4012,
                level = 64,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6825,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,64}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4012,
                level = 65,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,65}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4012,
                level = 66,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6875,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,66}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4012,
                level = 67,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,67}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4012,
                level = 68,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6925,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,68}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4012,
                level = 69,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,69}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4012,
                level = 70,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6975,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,70}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4012,
                level = 71,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,71}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4012,
                level = 72,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7025,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,72}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4012,
                level = 73,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,73}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4012,
                level = 74,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7075,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,74}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4012,
                level = 75,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,75}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4012,
                level = 76,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7125,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,76}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4012,
                level = 77,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,77}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4012,
                level = 78,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7175,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,78}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4012,
                level = 79,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,79}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4012,
                level = 80,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7225,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,80}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4012,
                level = 81,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,81}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4012,
                level = 82,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7275,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,82}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4012,
                level = 83,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,83}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4012,
                level = 84,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7325,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,84}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4012,
                level = 85,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,85}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4012,
                level = 86,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7375,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,86}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4012,
                level = 87,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,87}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4012,
                level = 88,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7425,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,88}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4012,
                level = 89,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,89}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4012,
                level = 90,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7475,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,90}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4012,
                level = 91,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,91}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4012,
                level = 92,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7525,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,92}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4012,
                level = 93,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,93}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4012,
                level = 94,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7575,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,94}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4012,
                level = 95,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,95}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4012,
                level = 96,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7625,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,96}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4012,
                level = 97,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,97}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4012,
                level = 98,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7675,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,98}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4012,
                level = 99,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,99}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4012,
                level = 100,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,100}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4012,
                level = 101,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,101}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4012,
                level = 102,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,102}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4012,
                level = 103,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,103}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4012,
                level = 104,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,104}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4012,
                level = 105,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,105}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4012,
                level = 106,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,106}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4012,
                level = 107,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,107}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4012,
                level = 108,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,108}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4012,
                level = 109,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,109}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4012,
                level = 110,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,110}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4012,
                level = 111,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,111}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4012,
                level = 112,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,112}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4012,
                level = 113,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,113}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4012,
                level = 114,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,114}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4012,
                level = 115,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,115}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4012,
                level = 116,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,116}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4012,
                level = 117,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,117}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4012,
                level = 118,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,118}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4012,
                level = 119,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,119}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4012,
                level = 120,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,120}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4012,
                level = 121,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,121}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4012,
                level = 122,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,122}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4012,
                level = 123,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,123}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4012,
                level = 124,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,124}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4012,
                level = 125,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,125}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4012,
                level = 126,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,126}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4012,
                level = 127,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,127}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4012,
                level = 128,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,128}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4012,
                level = 129,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,129}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4012,
                level = 130,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,130}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4012,
                level = 131,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,131}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4012,
                level = 132,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,132}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4012,
                level = 133,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,133}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4012,
                level = 134,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,134}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4012,
                level = 135,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,135}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4012,
                level = 136,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,136}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4012,
                level = 137,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,137}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4012,
                level = 138,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,138}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4012,
                level = 139,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,139}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4012,
                level = 140,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,140}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4012,
                level = 141,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,141}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4012,
                level = 142,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,142}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4012,
                level = 143,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,143}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4012,
                level = 144,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,144}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4012,
                level = 145,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,145}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4012,
                level = 146,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,146}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4012,
                level = 147,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,147}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4012,
                level = 148,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,148}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4012,
                level = 149,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,149}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4012,
                level = 150,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,150}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4012,
                level = 151,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,151}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4012,
                level = 152,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,152}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4012,
                level = 153,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,153}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4012,
                level = 154,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,154}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4012,
                level = 155,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,155}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4012,
                level = 156,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,156}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4012,
                level = 157,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,157}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4012,
                level = 158,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,158}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4012,
                level = 159,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,159}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4012,
                level = 160,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,160}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4012,
                level = 161,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,161}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4012,
                level = 162,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,162}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4012,
                level = 163,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,163}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4012,
                level = 164,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,164}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4012,
                level = 165,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,165}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4012,
                level = 166,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,166}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4012,
                level = 167,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,167}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4012,
                level = 168,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,168}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4012,
                level = 169,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,169}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4012,
                level = 170,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,170}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4012,
                level = 171,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,171}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4012,
                level = 172,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,172}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4012,
                level = 173,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,173}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4012,
                level = 174,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,174}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4012,
                level = 175,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,175}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4012,
                level = 176,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,176}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4012,
                level = 177,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,177}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4012,
                level = 178,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,178}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4012,
                level = 179,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,179}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4012,
                level = 180,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,180}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4012,
                level = 181,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,181}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4012,
                level = 182,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,182}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4012,
                level = 183,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,183}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4012,
                level = 184,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,184}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4012,
                level = 185,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,185}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4012,
                level = 186,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,186}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4012,
                level = 187,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,187}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4012,
                level = 188,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,188}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4012,
                level = 189,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,189}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4012,
                level = 190,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,190}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4012,
                level = 191,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,191}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4012,
                level = 192,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,192}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4012,
                level = 193,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,193}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4012,
                level = 194,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,194}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4012,
                level = 195,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,195}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4012,
                level = 196,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,196}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4012,
                level = 197,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,197}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4012,
                level = 198,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,198}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4012,
                level = 199,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,199}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4012,
                level = 200,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7725,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10041014,200}],
                remove_act = []
            };
        Level =:= 255 ->
            #conf_effect{
                id = 4012,
                level = 255,
                kind = 14,
                group = 4012,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4013, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4013,
                level = 1,
                kind = 1,
                group = 4013,
                group_rule = 1,
                type = 10119,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{19,5000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4014, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4014,
                level = 1,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4014,
                level = 2,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4014,
                level = 3,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4014,
                level = 4,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4014,
                level = 5,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,5}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4014,
                level = 6,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,6}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4014,
                level = 7,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,7}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4014,
                level = 8,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,8}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4014,
                level = 9,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,9}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4014,
                level = 10,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,10}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4014,
                level = 11,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,11}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4014,
                level = 12,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,12}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4014,
                level = 13,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,13}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4014,
                level = 14,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,14}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4014,
                level = 15,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,15}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4014,
                level = 16,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,16}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4014,
                level = 17,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,17}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4014,
                level = 18,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,18}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4014,
                level = 19,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,19}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4014,
                level = 20,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,20}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4014,
                level = 21,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,21}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4014,
                level = 22,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,22}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4014,
                level = 23,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,23}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4014,
                level = 24,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,24}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4014,
                level = 25,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,25}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4014,
                level = 26,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,26}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4014,
                level = 27,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,27}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4014,
                level = 28,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,28}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4014,
                level = 29,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,29}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4014,
                level = 30,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,30}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4014,
                level = 31,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,31}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4014,
                level = 32,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,32}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4014,
                level = 33,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,33}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4014,
                level = 34,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,34}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4014,
                level = 35,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,35}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4014,
                level = 36,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,36}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4014,
                level = 37,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,37}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4014,
                level = 38,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,38}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4014,
                level = 39,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,39}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4014,
                level = 40,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,40}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4014,
                level = 41,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,41}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4014,
                level = 42,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,42}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4014,
                level = 43,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,43}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4014,
                level = 44,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,44}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4014,
                level = 45,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,45}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4014,
                level = 46,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,46}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4014,
                level = 47,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,47}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4014,
                level = 48,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,48}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4014,
                level = 49,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,49}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4014,
                level = 50,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,50}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4014,
                level = 51,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,51}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4014,
                level = 52,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,52}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4014,
                level = 53,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,53}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4014,
                level = 54,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,54}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4014,
                level = 55,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,55}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4014,
                level = 56,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,56}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4014,
                level = 57,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,57}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4014,
                level = 58,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,58}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4014,
                level = 59,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,59}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4014,
                level = 60,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,60}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4014,
                level = 61,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,61}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4014,
                level = 62,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,62}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4014,
                level = 63,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,63}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4014,
                level = 64,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,64}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4014,
                level = 65,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,65}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4014,
                level = 66,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,66}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4014,
                level = 67,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,67}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4014,
                level = 68,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,68}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4014,
                level = 69,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,69}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4014,
                level = 70,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,70}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4014,
                level = 71,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,71}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4014,
                level = 72,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,72}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4014,
                level = 73,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,73}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4014,
                level = 74,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,74}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4014,
                level = 75,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,75}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4014,
                level = 76,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,76}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4014,
                level = 77,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,77}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4014,
                level = 78,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,78}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4014,
                level = 79,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,79}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4014,
                level = 80,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,80}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4014,
                level = 81,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,81}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4014,
                level = 82,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,82}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4014,
                level = 83,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,83}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4014,
                level = 84,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,84}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4014,
                level = 85,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,85}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4014,
                level = 86,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,86}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4014,
                level = 87,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,87}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4014,
                level = 88,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,88}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4014,
                level = 89,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,89}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4014,
                level = 90,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,90}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4014,
                level = 91,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,91}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4014,
                level = 92,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,92}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4014,
                level = 93,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,93}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4014,
                level = 94,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,94}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4014,
                level = 95,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,95}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4014,
                level = 96,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,96}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4014,
                level = 97,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,97}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4014,
                level = 98,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,98}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4014,
                level = 99,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,99}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4014,
                level = 100,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,100}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4014,
                level = 101,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,101}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4014,
                level = 102,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,102}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4014,
                level = 103,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,103}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4014,
                level = 104,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,104}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4014,
                level = 105,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,105}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4014,
                level = 106,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,106}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4014,
                level = 107,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,107}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4014,
                level = 108,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,108}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4014,
                level = 109,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,109}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4014,
                level = 110,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,110}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4014,
                level = 111,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,111}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4014,
                level = 112,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,112}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4014,
                level = 113,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,113}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4014,
                level = 114,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,114}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4014,
                level = 115,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,115}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4014,
                level = 116,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,116}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4014,
                level = 117,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,117}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4014,
                level = 118,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,118}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4014,
                level = 119,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,119}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4014,
                level = 120,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,120}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4014,
                level = 121,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,121}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4014,
                level = 122,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,122}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4014,
                level = 123,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,123}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4014,
                level = 124,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,124}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4014,
                level = 125,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,125}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4014,
                level = 126,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,126}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4014,
                level = 127,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,127}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4014,
                level = 128,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,128}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4014,
                level = 129,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,129}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4014,
                level = 130,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,130}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4014,
                level = 131,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,131}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4014,
                level = 132,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,132}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4014,
                level = 133,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,133}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4014,
                level = 134,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,134}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4014,
                level = 135,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,135}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4014,
                level = 136,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,136}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4014,
                level = 137,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,137}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4014,
                level = 138,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,138}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4014,
                level = 139,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,139}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4014,
                level = 140,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,140}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4014,
                level = 141,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,141}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4014,
                level = 142,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,142}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4014,
                level = 143,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,143}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4014,
                level = 144,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,144}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4014,
                level = 145,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,145}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4014,
                level = 146,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,146}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4014,
                level = 147,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,147}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4014,
                level = 148,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,148}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4014,
                level = 149,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,149}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4014,
                level = 150,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,150}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4014,
                level = 151,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,151}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4014,
                level = 152,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,152}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4014,
                level = 153,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,153}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4014,
                level = 154,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,154}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4014,
                level = 155,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,155}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4014,
                level = 156,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,156}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4014,
                level = 157,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,157}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4014,
                level = 158,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,158}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4014,
                level = 159,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,159}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4014,
                level = 160,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,160}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4014,
                level = 161,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,161}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4014,
                level = 162,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,162}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4014,
                level = 163,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,163}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4014,
                level = 164,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,164}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4014,
                level = 165,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,165}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4014,
                level = 166,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,166}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4014,
                level = 167,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,167}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4014,
                level = 168,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,168}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4014,
                level = 169,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,169}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4014,
                level = 170,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,170}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4014,
                level = 171,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,171}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4014,
                level = 172,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,172}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4014,
                level = 173,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,173}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4014,
                level = 174,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,174}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4014,
                level = 175,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,175}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4014,
                level = 176,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,176}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4014,
                level = 177,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,177}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4014,
                level = 178,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,178}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4014,
                level = 179,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,179}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4014,
                level = 180,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,180}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4014,
                level = 181,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,181}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4014,
                level = 182,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,182}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4014,
                level = 183,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,183}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4014,
                level = 184,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,184}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4014,
                level = 185,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,185}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4014,
                level = 186,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,186}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4014,
                level = 187,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,187}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4014,
                level = 188,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,188}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4014,
                level = 189,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,189}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4014,
                level = 190,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,190}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4014,
                level = 191,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,191}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4014,
                level = 192,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,192}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4014,
                level = 193,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,193}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4014,
                level = 194,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,194}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4014,
                level = 195,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,195}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4014,
                level = 196,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,196}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4014,
                level = 197,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,197}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4014,
                level = 198,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,198}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4014,
                level = 199,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,199}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4014,
                level = 200,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10042014,200}],
                remove_act = []
            };
        Level =:= 255 ->
            #conf_effect{
                id = 4014,
                level = 255,
                kind = 14,
                group = 4014,
                group_rule = 1,
                type = 12101,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4015, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4015,
                level = 1,
                kind = 1,
                group = 4015,
                group_rule = 1,
                type = 10119,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{19,5000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4016, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4016,
                level = 1,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4016,
                level = 2,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4016,
                level = 3,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4016,
                level = 4,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4016,
                level = 5,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4016,
                level = 6,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4016,
                level = 7,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4016,
                level = 8,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4016,
                level = 9,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4016,
                level = 10,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4016,
                level = 11,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4016,
                level = 12,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4016,
                level = 13,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4016,
                level = 14,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4016,
                level = 15,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4016,
                level = 16,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4016,
                level = 17,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4016,
                level = 18,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4016,
                level = 19,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4016,
                level = 20,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4016,
                level = 21,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4016,
                level = 22,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4016,
                level = 23,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4016,
                level = 24,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4016,
                level = 25,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4016,
                level = 26,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4016,
                level = 27,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4016,
                level = 28,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4016,
                level = 29,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4016,
                level = 30,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4016,
                level = 31,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4016,
                level = 32,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4016,
                level = 33,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4016,
                level = 34,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4016,
                level = 35,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4016,
                level = 36,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4016,
                level = 37,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4016,
                level = 38,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4016,
                level = 39,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4016,
                level = 40,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4016,
                level = 41,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4016,
                level = 42,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4016,
                level = 43,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4016,
                level = 44,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4016,
                level = 45,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4016,
                level = 46,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4016,
                level = 47,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4016,
                level = 48,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4016,
                level = 49,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4016,
                level = 50,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4016,
                level = 51,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4016,
                level = 52,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4016,
                level = 53,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4016,
                level = 54,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4016,
                level = 55,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4016,
                level = 56,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4016,
                level = 57,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4016,
                level = 58,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4016,
                level = 59,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4016,
                level = 60,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4016,
                level = 61,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4016,
                level = 62,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4016,
                level = 63,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4016,
                level = 64,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4016,
                level = 65,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4016,
                level = 66,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4016,
                level = 67,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4016,
                level = 68,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4016,
                level = 69,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4016,
                level = 70,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4016,
                level = 71,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4016,
                level = 72,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4016,
                level = 73,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4016,
                level = 74,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4016,
                level = 75,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4016,
                level = 76,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4016,
                level = 77,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4016,
                level = 78,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4016,
                level = 79,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4016,
                level = 80,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 17900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4016,
                level = 81,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4016,
                level = 82,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4016,
                level = 83,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4016,
                level = 84,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4016,
                level = 85,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4016,
                level = 86,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4016,
                level = 87,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4016,
                level = 88,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4016,
                level = 89,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4016,
                level = 90,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 18900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4016,
                level = 91,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4016,
                level = 92,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4016,
                level = 93,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4016,
                level = 94,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4016,
                level = 95,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4016,
                level = 96,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4016,
                level = 97,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4016,
                level = 98,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4016,
                level = 99,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4016,
                level = 100,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4016,
                level = 101,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4016,
                level = 102,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4016,
                level = 103,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4016,
                level = 104,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4016,
                level = 105,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4016,
                level = 106,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4016,
                level = 107,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4016,
                level = 108,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4016,
                level = 109,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4016,
                level = 110,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4016,
                level = 111,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4016,
                level = 112,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4016,
                level = 113,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4016,
                level = 114,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4016,
                level = 115,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4016,
                level = 116,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4016,
                level = 117,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4016,
                level = 118,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4016,
                level = 119,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4016,
                level = 120,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4016,
                level = 121,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4016,
                level = 122,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4016,
                level = 123,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4016,
                level = 124,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4016,
                level = 125,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4016,
                level = 126,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4016,
                level = 127,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4016,
                level = 128,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4016,
                level = 129,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4016,
                level = 130,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4016,
                level = 131,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4016,
                level = 132,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4016,
                level = 133,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4016,
                level = 134,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4016,
                level = 135,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4016,
                level = 136,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4016,
                level = 137,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4016,
                level = 138,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4016,
                level = 139,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4016,
                level = 140,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4016,
                level = 141,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4016,
                level = 142,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4016,
                level = 143,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4016,
                level = 144,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4016,
                level = 145,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4016,
                level = 146,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4016,
                level = 147,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4016,
                level = 148,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4016,
                level = 149,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4016,
                level = 150,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4016,
                level = 151,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4016,
                level = 152,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4016,
                level = 153,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4016,
                level = 154,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4016,
                level = 155,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4016,
                level = 156,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4016,
                level = 157,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4016,
                level = 158,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4016,
                level = 159,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4016,
                level = 160,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4016,
                level = 161,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4016,
                level = 162,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4016,
                level = 163,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4016,
                level = 164,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4016,
                level = 165,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4016,
                level = 166,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4016,
                level = 167,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4016,
                level = 168,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4016,
                level = 169,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4016,
                level = 170,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4016,
                level = 171,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4016,
                level = 172,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4016,
                level = 173,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4016,
                level = 174,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4016,
                level = 175,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4016,
                level = 176,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4016,
                level = 177,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4016,
                level = 178,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4016,
                level = 179,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4016,
                level = 180,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4016,
                level = 181,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4016,
                level = 182,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4016,
                level = 183,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4016,
                level = 184,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4016,
                level = 185,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4016,
                level = 186,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4016,
                level = 187,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4016,
                level = 188,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4016,
                level = 189,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4016,
                level = 190,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4016,
                level = 191,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4016,
                level = 192,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4016,
                level = 193,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4016,
                level = 194,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4016,
                level = 195,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4016,
                level = 196,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4016,
                level = 197,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4016,
                level = 198,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4016,
                level = 199,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4016,
                level = 200,
                kind = 16,
                group = 4016,
                group_rule = 1,
                type = 12501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 19900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{4015,1}},{0,{102,1}}]
            };
        true ->
            undefined
    end;
get(4017, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4017,
                level = 1,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 4017,
                level = 2,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 4017,
                level = 3,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 4017,
                level = 4,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 4017,
                level = 5,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 4017,
                level = 6,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 4017,
                level = 7,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 4017,
                level = 8,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 4017,
                level = 9,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 4017,
                level = 10,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 4017,
                level = 11,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 4017,
                level = 12,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 4017,
                level = 13,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 4017,
                level = 14,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 4017,
                level = 15,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 4017,
                level = 16,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 4017,
                level = 17,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 4017,
                level = 18,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 4017,
                level = 19,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 4017,
                level = 20,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 4017,
                level = 21,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 4017,
                level = 22,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 4017,
                level = 23,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 4017,
                level = 24,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 4017,
                level = 25,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 4017,
                level = 26,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 4017,
                level = 27,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 4017,
                level = 28,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 4017,
                level = 29,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 4017,
                level = 30,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 4017,
                level = 31,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 4017,
                level = 32,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 4017,
                level = 33,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 4017,
                level = 34,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 4017,
                level = 35,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 4017,
                level = 36,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 4017,
                level = 37,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 4017,
                level = 38,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 4017,
                level = 39,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 4017,
                level = 40,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 4017,
                level = 41,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 4017,
                level = 42,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 4017,
                level = 43,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 4017,
                level = 44,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 4017,
                level = 45,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 4017,
                level = 46,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 4017,
                level = 47,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 4017,
                level = 48,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 4017,
                level = 49,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 4017,
                level = 50,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 4017,
                level = 51,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 4017,
                level = 52,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 4017,
                level = 53,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 4017,
                level = 54,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 4017,
                level = 55,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 4017,
                level = 56,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 4017,
                level = 57,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 4017,
                level = 58,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 4017,
                level = 59,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 4017,
                level = 60,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 4017,
                level = 61,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 4017,
                level = 62,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 4017,
                level = 63,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 4017,
                level = 64,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 4017,
                level = 65,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 4017,
                level = 66,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 4017,
                level = 67,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 4017,
                level = 68,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 4017,
                level = 69,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 4017,
                level = 70,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 13950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 4017,
                level = 71,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 4017,
                level = 72,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 4017,
                level = 73,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 4017,
                level = 74,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 4017,
                level = 75,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 4017,
                level = 76,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 4017,
                level = 77,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 4017,
                level = 78,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 4017,
                level = 79,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 4017,
                level = 80,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 4017,
                level = 81,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 4017,
                level = 82,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 4017,
                level = 83,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 4017,
                level = 84,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 4017,
                level = 85,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 4017,
                level = 86,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 4017,
                level = 87,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 4017,
                level = 88,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 4017,
                level = 89,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 4017,
                level = 90,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 4017,
                level = 91,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 4017,
                level = 92,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 4017,
                level = 93,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 4017,
                level = 94,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 4017,
                level = 95,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 4017,
                level = 96,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 4017,
                level = 97,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 4017,
                level = 98,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 4017,
                level = 99,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 4017,
                level = 100,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 4017,
                level = 101,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 4017,
                level = 102,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 4017,
                level = 103,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 4017,
                level = 104,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 4017,
                level = 105,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 4017,
                level = 106,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 4017,
                level = 107,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 4017,
                level = 108,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 4017,
                level = 109,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 4017,
                level = 110,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 4017,
                level = 111,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 4017,
                level = 112,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 4017,
                level = 113,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 4017,
                level = 114,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 4017,
                level = 115,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 4017,
                level = 116,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 4017,
                level = 117,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 4017,
                level = 118,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 4017,
                level = 119,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 4017,
                level = 120,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 4017,
                level = 121,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 4017,
                level = 122,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 4017,
                level = 123,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 4017,
                level = 124,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 4017,
                level = 125,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 4017,
                level = 126,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 4017,
                level = 127,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 4017,
                level = 128,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 4017,
                level = 129,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 4017,
                level = 130,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 4017,
                level = 131,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 4017,
                level = 132,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 4017,
                level = 133,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 4017,
                level = 134,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 4017,
                level = 135,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 4017,
                level = 136,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 4017,
                level = 137,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 4017,
                level = 138,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 4017,
                level = 139,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 4017,
                level = 140,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 4017,
                level = 141,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 4017,
                level = 142,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 4017,
                level = 143,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 4017,
                level = 144,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 4017,
                level = 145,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 4017,
                level = 146,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 4017,
                level = 147,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 4017,
                level = 148,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 4017,
                level = 149,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 4017,
                level = 150,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 4017,
                level = 151,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 4017,
                level = 152,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 4017,
                level = 153,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 4017,
                level = 154,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 4017,
                level = 155,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 4017,
                level = 156,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 4017,
                level = 157,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 4017,
                level = 158,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 4017,
                level = 159,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 4017,
                level = 160,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 4017,
                level = 161,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 4017,
                level = 162,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 4017,
                level = 163,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 4017,
                level = 164,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 4017,
                level = 165,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 4017,
                level = 166,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 4017,
                level = 167,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 4017,
                level = 168,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 4017,
                level = 169,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 4017,
                level = 170,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 4017,
                level = 171,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 4017,
                level = 172,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 4017,
                level = 173,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 4017,
                level = 174,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 4017,
                level = 175,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 4017,
                level = 176,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 4017,
                level = 177,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 4017,
                level = 178,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 4017,
                level = 179,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 4017,
                level = 180,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 4017,
                level = 181,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 4017,
                level = 182,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 4017,
                level = 183,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 4017,
                level = 184,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 4017,
                level = 185,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 4017,
                level = 186,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 4017,
                level = 187,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 4017,
                level = 188,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 4017,
                level = 189,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 4017,
                level = 190,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 4017,
                level = 191,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 4017,
                level = 192,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 4017,
                level = 193,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 4017,
                level = 194,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 4017,
                level = 195,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 4017,
                level = 196,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 4017,
                level = 197,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 4017,
                level = 198,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 4017,
                level = 199,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 4017,
                level = 200,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 255 ->
            #conf_effect{
                id = 4017,
                level = 255,
                kind = 18,
                group = 4017,
                group_rule = 1,
                type = 12801,
                type_rule = 4,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4018, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4018,
                level = 1,
                kind = 1,
                group = 4018,
                group_rule = 1,
                type = 10111,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{11,50000000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(4019, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 4019,
                level = 1,
                kind = 22,
                group = 4019,
                group_rule = 1,
                type = 13002,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.5],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
