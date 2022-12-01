%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_200).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(20001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 20001,
                level = 1,
                kind = 1,
                group = 20001,
                group_rule = 1,
                type = 101104,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,12000,0,0},{18,7200,0,0},{5,100,2,0},{6,100,2,0},{7,400,4,0},{8,400,4,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(20002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 20002,
                level = 1,
                kind = 1,
                group = 20001,
                group_rule = 1,
                type = 101104,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,45000,0,0},{18,9500,0,0},{5,1000,6,0},{6,1000,6,0},{7,1000,10,0},{8,1000,10,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
