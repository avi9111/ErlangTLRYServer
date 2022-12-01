%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_100).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(10001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10001,
                level = 1,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.45,0},{6,0,0.45,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10001,
                level = 2,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.88,0},{6,0,0.88,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10001,
                level = 3,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,1.31,0},{6,0,1.31,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10001,
                level = 4,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,1.74,0},{6,0,1.74,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10001,
                level = 5,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,2.18,0},{6,0,2.18,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10001,
                level = 6,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,2.18,0},{6,0,2.18,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10001,
                level = 7,
                kind = 1,
                group = 10001,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,2.18,0},{6,0,2.18,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10002,
                level = 1,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10002,
                level = 2,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10002,
                level = 3,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10002,
                level = 4,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10002,
                level = 5,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10002,
                level = 6,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{10016,6}}]
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10002,
                level = 7,
                kind = 15,
                group = 10002,
                group_rule = 1,
                type = 12301,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 16000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = [{0,{10016,7}}]
            };
        true ->
            undefined
    end;
get(10003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10003,
                level = 1,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{1000,9000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10003,
                level = 2,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{2000,8000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10003,
                level = 3,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{3300,6700}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10003,
                level = 4,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{4200,5800}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10003,
                level = 5,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{5000,5000}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10003,
                level = 6,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{2500,5000}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10003,
                level = 7,
                kind = 52,
                group = 10003,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,0,{1750,5000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10005, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10005,
                level = 1,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10005,
                level = 2,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10005,
                level = 3,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10005,
                level = 4,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10005,
                level = 5,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 14000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10005,
                level = 6,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10005,
                level = 7,
                kind = 5,
                group = 10005,
                group_rule = 1,
                type = 11001,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10006, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10006,
                level = 1,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.1,0},{6,0,-0.1,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10006,
                level = 2,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10006,
                level = 3,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.2,0},{6,0,-0.2,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10006,
                level = 4,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.25,0},{6,0,-0.25,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10006,
                level = 5,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.3,0},{6,0,-0.3,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10006,
                level = 6,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.35,0},{6,0,-0.35,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10006,
                level = 7,
                kind = 17,
                group = 10006,
                group_rule = 1,
                type = 117101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.40,0},{6,0,-0.40,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10007, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10007,
                level = 1,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.1,0},{8,0,-0.1,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10007,
                level = 2,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.15,0},{8,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10007,
                level = 3,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.2,0},{8,0,-0.2,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10007,
                level = 4,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.25,0},{8,0,-0.25,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10007,
                level = 5,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.3,0},{8,0,-0.3,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10007,
                level = 6,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.35,0},{8,0,-0.35,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10007,
                level = 7,
                kind = 17,
                group = 10007,
                group_rule = 1,
                type = 117102,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,-0.40,0},{8,0,-0.40,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10008, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10008,
                level = 1,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10008,
                level = 2,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10008,
                level = 3,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10008,
                level = 4,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10008,
                level = 5,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10008,
                level = 6,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.6,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10008,
                level = 7,
                kind = 17,
                group = 10008,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.7,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10009, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10009,
                level = 1,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000,3,0.5],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10009,
                level = 2,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1600,3,0.5],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10009,
                level = 3,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [2200,3,0.5],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10009,
                level = 4,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [2800,3,0.5],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10009,
                level = 5,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [3300,3,0.5],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10009,
                level = 6,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4100,3,0.5],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10009,
                level = 7,
                kind = 52,
                group = 10009,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 500,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4800,3,0.5],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10010, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10010,
                level = 1,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,2100,0,0},{59,2100,0,0},{60,2100,0,0},{61,2100,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10010,
                level = 2,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,2900,0,0},{59,2900,0,0},{60,2900,0,0},{61,2900,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10010,
                level = 3,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,3500,0,0},{59,3500,0,0},{60,3500,0,0},{61,3500,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10010,
                level = 4,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,4000,0,0},{59,4000,0,0},{60,4000,0,0},{61,4000,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10010,
                level = 5,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,4600,0,0},{59,4600,0,0},{60,4600,0,0},{61,4600,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10010,
                level = 6,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,5200,0,0},{59,5200,0,0},{60,5200,0,0},{61,5200,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10010,
                level = 7,
                kind = 1,
                group = 10010,
                group_rule = 1,
                type = 101103,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{58,5900,0,0},{59,5900,0,0},{60,5900,0,0},{61,5900,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10011, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10011,
                level = 1,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1000,4,{10000,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10011,
                level = 2,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1600,4,{10000,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10011,
                level = 3,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [2200,4,{10000,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10011,
                level = 4,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [3000,4,{10000,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10011,
                level = 5,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [3500,4,{10000,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10011,
                level = 6,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4000,4,{10000,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10011,
                level = 7,
                kind = 52,
                group = 10011,
                group_rule = 1,
                type = 12601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 360000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4600,4,{10000,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10012, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10012,
                level = 1,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10012,
                level = 2,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10012,
                level = 3,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10012,
                level = 4,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10012,
                level = 5,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10012,
                level = 6,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,0.5,0},{6,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10012,
                level = 7,
                kind = 1,
                group = 10012,
                group_rule = 1,
                type = 10105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,1,0},{6,0,1,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10013, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10013,
                level = 1,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10013,
                level = 2,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10013,
                level = 3,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10013,
                level = 4,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10013,
                level = 5,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10013,
                level = 6,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.15,0},{6,0,-0.15,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10013,
                level = 7,
                kind = 17,
                group = 10013,
                group_rule = 1,
                type = 11705,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 15000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{5,0,-0.3,0},{6,0,-0.3,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10014, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10014,
                level = 1,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10014,
                level = 2,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10014,
                level = 3,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10014,
                level = 4,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10014,
                level = 5,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10014,
                level = 6,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10014,
                level = 7,
                kind = 13,
                group = 10014,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11001},{10000,0,11501},{10000,0,11601},{10000,0,11801},{10000,0,13501}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10015, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10015,
                level = 1,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10015,
                level = 2,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10015,
                level = 3,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10015,
                level = 4,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10015,
                level = 5,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10015,
                level = 6,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10015,
                level = 7,
                kind = 13,
                group = 10015,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,17,0},{10000,0,12902},{10000,0,13002},{10000,0,13102},{10000,0,13202}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10016, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10016,
                level = 1,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10016,
                level = 2,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10016,
                level = 3,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10016,
                level = 4,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10016,
                level = 5,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10016,
                level = 6,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10016,
                level = 7,
                kind = 53,
                group = 10016,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 50,
                interval = 50,
                cd = 0,
                conditions = [],
                param = [{10000,-1,16011007}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10017, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10017,
                level = 1,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10017,
                level = 2,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10017,
                level = 3,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10017,
                level = 4,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10017,
                level = 5,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10017,
                level = 6,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,100000}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10017,
                level = 7,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{1,200000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10018, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10018,
                level = 1,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10018,
                level = 2,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10018,
                level = 3,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10018,
                level = 4,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10018,
                level = 5,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10018,
                level = 6,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,100000}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10018,
                level = 7,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{2,200000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10019, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10019,
                level = 1,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10019,
                level = 2,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10019,
                level = 3,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10019,
                level = 4,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10019,
                level = 5,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10019,
                level = 6,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,100000}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10019,
                level = 7,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{3,200000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(10020, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 10020,
                level = 1,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 10020,
                level = 2,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 10020,
                level = 3,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 10020,
                level = 4,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 10020,
                level = 5,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 10020,
                level = 6,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,100000}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 10020,
                level = 7,
                kind = 36,
                group = 10017,
                group_rule = 1,
                type = 14201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{4,200000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
