%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_0).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(10, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10,
                level = 1,
                kind = 1,
                group = 3,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
                cd = 0,
                conditions = [],
                param = [{1,0,0.05,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10,
                level = 2,
                kind = 1,
                group = 3,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
                cd = 0,
                conditions = [],
                param = [{1,0,0.10,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(12, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 12,
                level = 1,
                kind = 1,
                group = 3,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
                cd = 0,
                conditions = [],
                param = [{1,0,0.15,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(13, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 13,
                level = 1,
                kind = 1,
                group = 3,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
                cd = 0,
                conditions = [],
                param = [{1,0,0.20,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(14, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 14,
                level = 1,
                kind = 2,
                group = 3,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
                cd = 0,
                conditions = [],
                param = [{1,0,0.25,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(15, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 15,
                level = 1,
                kind = 3,
                group = 15,
                group_rule = 1,
                type = 10401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,500,0],
                remove_act = []
            };
        true ->
            undefined
    end;
get(16, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 16,
                level = 1,
                kind = 6,
                group = 16,
                group_rule = 1,
                type = 11501,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 1800000,
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
