%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_211).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(21100, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21100,
                level = 1,
                kind = 13,
                group = 21100,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8640000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21101, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21101,
                level = 1,
                kind = 1,
                group = 21101,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.85,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21102, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21102,
                level = 1,
                kind = 3,
                group = 21102,
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
                param = [0,10000,0],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21103, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21103,
                level = 1,
                kind = 12,
                group = 21103,
                group_rule = 1,
                type = 11201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-1],
                remove_act = []
            };
        true ->
            undefined
    end;
get(21104, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 21104,
                level = 1,
                kind = 12,
                group = 30004,
                group_rule = 1,
                type = 11201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-1],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
