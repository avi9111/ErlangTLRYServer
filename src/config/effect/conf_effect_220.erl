%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_220).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(22000, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 22000,
                level = 1,
                kind = 1,
                group = 20100,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(22001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 22001,
                level = 1,
                kind = 1,
                group = 20100,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(22002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 22002,
                level = 1,
                kind = 1,
                group = 20100,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
