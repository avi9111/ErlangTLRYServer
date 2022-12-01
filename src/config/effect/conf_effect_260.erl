%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_260).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(26001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 26001,
                level = 1,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,1240,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 26001,
                level = 2,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,1680,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 26001,
                level = 3,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,2120,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 26001,
                level = 4,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,2560,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 26001,
                level = 5,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,3000,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 26001,
                level = 6,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,3440,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 26001,
                level = 7,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,3880,0,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 26001,
                level = 8,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,4320,0,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 26001,
                level = 9,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,4760,0,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 26001,
                level = 10,
                kind = 1,
                group = 26001,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,5200,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
