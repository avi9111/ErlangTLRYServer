%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_251).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(25101, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25101,
                level = 1,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,131,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25101,
                level = 2,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,287,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25101,
                level = 3,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,468,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25101,
                level = 4,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,707,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25101,
                level = 5,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,985,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25101,
                level = 6,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,1283,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25101,
                level = 7,
                kind = 1,
                group = 25101,
                group_rule = 1,
                type = 10121,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{21,1645,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25102, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25102,
                level = 1,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,131,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25102,
                level = 2,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,287,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25102,
                level = 3,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,468,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25102,
                level = 4,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,707,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25102,
                level = 5,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,985,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25102,
                level = 6,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,1283,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25102,
                level = 7,
                kind = 1,
                group = 25102,
                group_rule = 1,
                type = 10122,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{22,1645,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25103, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25103,
                level = 1,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,131,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25103,
                level = 2,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,287,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25103,
                level = 3,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,468,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25103,
                level = 4,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,707,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25103,
                level = 5,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,985,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25103,
                level = 6,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,1283,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25103,
                level = 7,
                kind = 1,
                group = 25103,
                group_rule = 1,
                type = 10123,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{23,1645,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(25104, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 25104,
                level = 1,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,131,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 25104,
                level = 2,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,287,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 25104,
                level = 3,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,468,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 25104,
                level = 4,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,707,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 25104,
                level = 5,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,985,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 25104,
                level = 6,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,1283,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 25104,
                level = 7,
                kind = 1,
                group = 25104,
                group_rule = 1,
                type = 10124,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 20000,
                conditions = [],
                param = [{24,1645,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
