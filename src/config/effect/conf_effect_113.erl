%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_113).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(11301, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11301,
                level = 1,
                kind = 4,
                group = 11301,
                group_rule = 1,
                type = 11101,
                type_rule = 2,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9999999999,0,3000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11301,
                level = 2,
                kind = 4,
                group = 11301,
                group_rule = 1,
                type = 11101,
                type_rule = 2,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9999999999,0,3000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11301,
                level = 3,
                kind = 4,
                group = 11301,
                group_rule = 1,
                type = 11101,
                type_rule = 2,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9999999999,0,3000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11301,
                level = 4,
                kind = 4,
                group = 11301,
                group_rule = 1,
                type = 11101,
                type_rule = 2,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 7000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9999999999,0,3000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11301,
                level = 5,
                kind = 4,
                group = 11301,
                group_rule = 1,
                type = 11101,
                type_rule = 2,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9999999999,0,3000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11302, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11302,
                level = 1,
                kind = 1,
                group = 11302,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11302,
                level = 2,
                kind = 1,
                group = 11302,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11302,
                level = 3,
                kind = 1,
                group = 11302,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11302,
                level = 4,
                kind = 1,
                group = 11302,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 7000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11302,
                level = 5,
                kind = 1,
                group = 11302,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11303, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11303,
                level = 1,
                kind = 25,
                group = 11303,
                group_rule = 1,
                type = 14001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11303,
                level = 2,
                kind = 25,
                group = 11303,
                group_rule = 1,
                type = 14001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11303,
                level = 3,
                kind = 25,
                group = 11303,
                group_rule = 1,
                type = 14001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11303,
                level = 4,
                kind = 25,
                group = 11303,
                group_rule = 1,
                type = 14001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 7000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11303,
                level = 5,
                kind = 25,
                group = 11303,
                group_rule = 1,
                type = 14001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11304, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11304,
                level = 1,
                kind = 24,
                group = 11304,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-15],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11304,
                level = 2,
                kind = 24,
                group = 11304,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11304,
                level = 3,
                kind = 24,
                group = 11304,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11304,
                level = 4,
                kind = 24,
                group = 11304,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11304,
                level = 5,
                kind = 24,
                group = 11304,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11305, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11305,
                level = 1,
                kind = 24,
                group = 11305,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11305,
                level = 2,
                kind = 24,
                group = 11305,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11305,
                level = 3,
                kind = 24,
                group = 11305,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11305,
                level = 4,
                kind = 24,
                group = 11305,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11305,
                level = 5,
                kind = 24,
                group = 11305,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-17],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
