%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_250).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(25001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25001,
                level = 1,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25001,
                level = 2,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25001,
                level = 3,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25001,
                level = 4,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25001,
                level = 5,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25001,
                level = 6,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25001,
                level = 7,
                kind = 51,
                group = 25001,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25101}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25002,
                level = 1,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25002,
                level = 2,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25002,
                level = 3,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25002,
                level = 4,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25002,
                level = 5,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25002,
                level = 6,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25002,
                level = 7,
                kind = 51,
                group = 25002,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25102}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25003,
                level = 1,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25003,
                level = 2,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25003,
                level = 3,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25003,
                level = 4,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25003,
                level = 5,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25003,
                level = 6,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25003,
                level = 7,
                kind = 51,
                group = 25003,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25103}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25004, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25004,
                level = 1,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25004,
                level = 2,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25004,
                level = 3,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25004,
                level = 4,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25004,
                level = 5,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25004,
                level = 6,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25004,
                level = 7,
                kind = 51,
                group = 25004,
                group_rule = 1,
                type = 13301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 10000,
                conditions = [],
                param = [5000,1,{25104}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
