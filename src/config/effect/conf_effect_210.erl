%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_210).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(21001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21001,
                level = 1,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 21001,
                level = 2,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 21001,
                level = 3,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 21001,
                level = 4,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 21001,
                level = 5,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 21001,
                level = 6,
                kind = 1,
                group = 21001,
                group_rule = 1,
                type = 10117,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,1000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21002,
                level = 1,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 21002,
                level = 2,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 21002,
                level = 3,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 21002,
                level = 4,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 21002,
                level = 5,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 21002,
                level = 6,
                kind = 1,
                group = 21002,
                group_rule = 1,
                type = 10118,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{18,1000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21003,
                level = 1,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 21003,
                level = 2,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 21003,
                level = 3,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 21003,
                level = 4,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 21003,
                level = 5,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 21003,
                level = 6,
                kind = 1,
                group = 21003,
                group_rule = 1,
                type = 10101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,0,0.1,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
