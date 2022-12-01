%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_1).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(150, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 150,
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
                duration = 180000,
                interval = 300000,
                cd = 0,
                conditions = [],
                param = [0,500,0],
                remove_act = []
            };
        true ->
            undefined
    end;
get(101, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 101,
                level = 1,
                kind = 1,
                group = 101,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,1,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(102, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 102,
                level = 1,
                kind = 1,
                group = 102,
                group_rule = 1,
                type = 10,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 2000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,1,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
