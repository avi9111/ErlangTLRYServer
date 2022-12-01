%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_230).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(23001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 23001,
                level = 1,
                kind = 24,
                group = 23001,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.05],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 23001,
                level = 2,
                kind = 24,
                group = 23001,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.06],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 23001,
                level = 3,
                kind = 24,
                group = 23001,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.07],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 23001,
                level = 4,
                kind = 24,
                group = 23001,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.08],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 23001,
                level = 5,
                kind = 24,
                group = 23001,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.12],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
