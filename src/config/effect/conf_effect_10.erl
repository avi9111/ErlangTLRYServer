%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_10).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(1001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1001,
                level = 1,
                kind = 17,
                group = 1001,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1002,
                level = 1,
                kind = 13,
                group = 1002,
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
        true ->
            undefined
    end;
get(1003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1003,
                level = 1,
                kind = 6,
                group = 1003,
                group_rule = 1,
                type = 11501,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1004, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1004,
                level = 1,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1004,
                level = 2,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1004,
                level = 3,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1004,
                level = 4,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1004,
                level = 5,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1004,
                level = 6,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1004,
                level = 7,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1004,
                level = 8,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1004,
                level = 9,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1004,
                level = 10,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1004,
                level = 11,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1004,
                level = 12,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1004,
                level = 13,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1004,
                level = 14,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1004,
                level = 15,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1004,
                level = 16,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1004,
                level = 17,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1004,
                level = 18,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1004,
                level = 19,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1004,
                level = 20,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1004,
                level = 21,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1004,
                level = 22,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1004,
                level = 23,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1004,
                level = 24,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1004,
                level = 25,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1004,
                level = 26,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1004,
                level = 27,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1004,
                level = 28,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1004,
                level = 29,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1004,
                level = 30,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1004,
                level = 31,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1004,
                level = 32,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1004,
                level = 33,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1004,
                level = 34,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1004,
                level = 35,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1004,
                level = 36,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1004,
                level = 37,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1004,
                level = 38,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1004,
                level = 39,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1004,
                level = 40,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1004,
                level = 41,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1004,
                level = 42,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1004,
                level = 43,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1004,
                level = 44,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1004,
                level = 45,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1004,
                level = 46,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1004,
                level = 47,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1004,
                level = 48,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1004,
                level = 49,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1004,
                level = 50,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1004,
                level = 51,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1004,
                level = 52,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1004,
                level = 53,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1004,
                level = 54,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1004,
                level = 55,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1004,
                level = 56,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1004,
                level = 57,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1004,
                level = 58,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1004,
                level = 59,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1004,
                level = 60,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1004,
                level = 61,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1004,
                level = 62,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1004,
                level = 63,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1004,
                level = 64,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1004,
                level = 65,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1004,
                level = 66,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1004,
                level = 67,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1004,
                level = 68,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1004,
                level = 69,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1004,
                level = 70,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1004,
                level = 71,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1004,
                level = 72,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1004,
                level = 73,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1004,
                level = 74,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1004,
                level = 75,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1004,
                level = 76,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1004,
                level = 77,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1004,
                level = 78,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1004,
                level = 79,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1004,
                level = 80,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1004,
                level = 81,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1004,
                level = 82,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1004,
                level = 83,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1004,
                level = 84,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1004,
                level = 85,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1004,
                level = 86,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1004,
                level = 87,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1004,
                level = 88,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1004,
                level = 89,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1004,
                level = 90,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1004,
                level = 91,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1004,
                level = 92,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1004,
                level = 93,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1004,
                level = 94,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1004,
                level = 95,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1004,
                level = 96,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1004,
                level = 97,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1004,
                level = 98,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1004,
                level = 99,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1004,
                level = 100,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1004,
                level = 101,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1004,
                level = 102,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1004,
                level = 103,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1004,
                level = 104,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1004,
                level = 105,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1004,
                level = 106,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1004,
                level = 107,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1004,
                level = 108,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1004,
                level = 109,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1004,
                level = 110,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1004,
                level = 111,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1004,
                level = 112,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1004,
                level = 113,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1004,
                level = 114,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1004,
                level = 115,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1004,
                level = 116,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1004,
                level = 117,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1004,
                level = 118,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1004,
                level = 119,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1004,
                level = 120,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1004,
                level = 121,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1004,
                level = 122,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1004,
                level = 123,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1004,
                level = 124,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1004,
                level = 125,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1004,
                level = 126,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1004,
                level = 127,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1004,
                level = 128,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1004,
                level = 129,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1004,
                level = 130,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1004,
                level = 131,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1004,
                level = 132,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1004,
                level = 133,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1004,
                level = 134,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1004,
                level = 135,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1004,
                level = 136,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1004,
                level = 137,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1004,
                level = 138,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1004,
                level = 139,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1004,
                level = 140,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1004,
                level = 141,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1004,
                level = 142,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1004,
                level = 143,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1004,
                level = 144,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1004,
                level = 145,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1004,
                level = 146,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1004,
                level = 147,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1004,
                level = 148,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1004,
                level = 149,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1004,
                level = 150,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1004,
                level = 151,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1004,
                level = 152,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1004,
                level = 153,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1004,
                level = 154,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1004,
                level = 155,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1004,
                level = 156,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1004,
                level = 157,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1004,
                level = 158,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1004,
                level = 159,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1004,
                level = 160,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1004,
                level = 161,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1004,
                level = 162,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1004,
                level = 163,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1004,
                level = 164,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1004,
                level = 165,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1004,
                level = 166,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1004,
                level = 167,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1004,
                level = 168,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1004,
                level = 169,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1004,
                level = 170,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1004,
                level = 171,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1004,
                level = 172,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1004,
                level = 173,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1004,
                level = 174,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1004,
                level = 175,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1004,
                level = 176,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1004,
                level = 177,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1004,
                level = 178,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1004,
                level = 179,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1004,
                level = 180,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1004,
                level = 181,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1004,
                level = 182,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1004,
                level = 183,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1004,
                level = 184,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1004,
                level = 185,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1004,
                level = 186,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1004,
                level = 187,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1004,
                level = 188,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1004,
                level = 189,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1004,
                level = 190,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1004,
                level = 191,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1004,
                level = 192,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1004,
                level = 193,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1004,
                level = 194,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1004,
                level = 195,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1004,
                level = 196,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1004,
                level = 197,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1004,
                level = 198,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1004,
                level = 199,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1004,
                level = 200,
                kind = 1,
                group = 1004,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1005, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1005,
                level = 1,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1005,
                level = 2,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1005,
                level = 3,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1005,
                level = 4,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1005,
                level = 5,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1005,
                level = 6,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1005,
                level = 7,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1005,
                level = 8,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1005,
                level = 9,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1005,
                level = 10,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1005,
                level = 11,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1005,
                level = 12,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1005,
                level = 13,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1005,
                level = 14,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1005,
                level = 15,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1005,
                level = 16,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1005,
                level = 17,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1005,
                level = 18,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1005,
                level = 19,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1005,
                level = 20,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1005,
                level = 21,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1005,
                level = 22,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1005,
                level = 23,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1005,
                level = 24,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1005,
                level = 25,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1005,
                level = 26,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1005,
                level = 27,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1005,
                level = 28,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1005,
                level = 29,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1005,
                level = 30,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1005,
                level = 31,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1005,
                level = 32,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1005,
                level = 33,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1005,
                level = 34,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1005,
                level = 35,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1005,
                level = 36,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1005,
                level = 37,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1005,
                level = 38,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1005,
                level = 39,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1005,
                level = 40,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1005,
                level = 41,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1005,
                level = 42,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1005,
                level = 43,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1005,
                level = 44,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1005,
                level = 45,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1005,
                level = 46,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1005,
                level = 47,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1005,
                level = 48,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1005,
                level = 49,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1005,
                level = 50,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1005,
                level = 51,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1005,
                level = 52,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1005,
                level = 53,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1005,
                level = 54,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1005,
                level = 55,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1005,
                level = 56,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1005,
                level = 57,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1005,
                level = 58,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1005,
                level = 59,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1005,
                level = 60,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1005,
                level = 61,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1005,
                level = 62,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1005,
                level = 63,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1005,
                level = 64,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1005,
                level = 65,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1005,
                level = 66,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1005,
                level = 67,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1005,
                level = 68,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1005,
                level = 69,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1005,
                level = 70,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1005,
                level = 71,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1005,
                level = 72,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1005,
                level = 73,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1005,
                level = 74,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1005,
                level = 75,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1005,
                level = 76,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1005,
                level = 77,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1005,
                level = 78,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1005,
                level = 79,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1005,
                level = 80,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1005,
                level = 81,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1005,
                level = 82,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1005,
                level = 83,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1005,
                level = 84,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1005,
                level = 85,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1005,
                level = 86,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1005,
                level = 87,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1005,
                level = 88,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1005,
                level = 89,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1005,
                level = 90,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1005,
                level = 91,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1005,
                level = 92,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1005,
                level = 93,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1005,
                level = 94,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1005,
                level = 95,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1005,
                level = 96,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1005,
                level = 97,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1005,
                level = 98,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1005,
                level = 99,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1005,
                level = 100,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1005,
                level = 101,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1005,
                level = 102,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1005,
                level = 103,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1005,
                level = 104,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1005,
                level = 105,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1005,
                level = 106,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1005,
                level = 107,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1005,
                level = 108,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1005,
                level = 109,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1005,
                level = 110,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1005,
                level = 111,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1005,
                level = 112,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1005,
                level = 113,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1005,
                level = 114,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1005,
                level = 115,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1005,
                level = 116,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1005,
                level = 117,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1005,
                level = 118,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1005,
                level = 119,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1005,
                level = 120,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1005,
                level = 121,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1005,
                level = 122,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1005,
                level = 123,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1005,
                level = 124,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1005,
                level = 125,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1005,
                level = 126,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1005,
                level = 127,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1005,
                level = 128,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1005,
                level = 129,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1005,
                level = 130,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1005,
                level = 131,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1005,
                level = 132,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1005,
                level = 133,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1005,
                level = 134,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1005,
                level = 135,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1005,
                level = 136,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1005,
                level = 137,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1005,
                level = 138,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1005,
                level = 139,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1005,
                level = 140,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1005,
                level = 141,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1005,
                level = 142,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1005,
                level = 143,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1005,
                level = 144,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1005,
                level = 145,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1005,
                level = 146,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1005,
                level = 147,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1005,
                level = 148,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1005,
                level = 149,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1005,
                level = 150,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1005,
                level = 151,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1005,
                level = 152,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1005,
                level = 153,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1005,
                level = 154,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1005,
                level = 155,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1005,
                level = 156,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1005,
                level = 157,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1005,
                level = 158,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1005,
                level = 159,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1005,
                level = 160,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1005,
                level = 161,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1005,
                level = 162,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1005,
                level = 163,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1005,
                level = 164,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1005,
                level = 165,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1005,
                level = 166,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1005,
                level = 167,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1005,
                level = 168,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1005,
                level = 169,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1005,
                level = 170,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1005,
                level = 171,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1005,
                level = 172,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1005,
                level = 173,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1005,
                level = 174,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1005,
                level = 175,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1005,
                level = 176,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1005,
                level = 177,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1005,
                level = 178,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1005,
                level = 179,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1005,
                level = 180,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1005,
                level = 181,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1005,
                level = 182,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1005,
                level = 183,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1005,
                level = 184,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1005,
                level = 185,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1005,
                level = 186,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1005,
                level = 187,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1005,
                level = 188,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1005,
                level = 189,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1005,
                level = 190,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1005,
                level = 191,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1005,
                level = 192,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1005,
                level = 193,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1005,
                level = 194,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1005,
                level = 195,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1005,
                level = 196,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1005,
                level = 197,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1005,
                level = 198,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1005,
                level = 199,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1005,
                level = 200,
                kind = 1,
                group = 1005,
                group_rule = 1,
                type = 101105,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10,0,0.3,0},{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1006, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1006,
                level = 1,
                kind = 23,
                group = 1006,
                group_rule = 1,
                type = 13101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0.5],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1007, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1007,
                level = 1,
                kind = 7,
                group = 1007,
                group_rule = 1,
                type = 11601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1008, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1008,
                level = 1,
                kind = 3,
                group = 1008,
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
get(1009, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1009,
                level = 1,
                kind = 24,
                group = 1009,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.3],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1010, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1010,
                level = 1,
                kind = 10,
                group = 1010,
                group_rule = 1,
                type = 12201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1011, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1011,
                level = 1,
                kind = 17,
                group = 1011,
                group_rule = 1,
                type = 11709,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{9,0,0,-0.5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1012, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1012,
                level = 1,
                kind = 3,
                group = 1012,
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
get(1013, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1013,
                level = 1,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1013,
                level = 2,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1013,
                level = 3,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1013,
                level = 4,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1013,
                level = 5,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1013,
                level = 6,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1013,
                level = 7,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1013,
                level = 8,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1013,
                level = 9,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1013,
                level = 10,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1013,
                level = 11,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1013,
                level = 12,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1013,
                level = 13,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1013,
                level = 14,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1013,
                level = 15,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1013,
                level = 16,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1013,
                level = 17,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1013,
                level = 18,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1013,
                level = 19,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1013,
                level = 20,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1013,
                level = 21,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1013,
                level = 22,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1013,
                level = 23,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1013,
                level = 24,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1013,
                level = 25,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1013,
                level = 26,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1013,
                level = 27,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1013,
                level = 28,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1013,
                level = 29,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1013,
                level = 30,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1013,
                level = 31,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1013,
                level = 32,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1013,
                level = 33,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1013,
                level = 34,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1013,
                level = 35,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1013,
                level = 36,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1013,
                level = 37,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1013,
                level = 38,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1013,
                level = 39,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1013,
                level = 40,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 9950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1013,
                level = 41,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1013,
                level = 42,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1013,
                level = 43,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1013,
                level = 44,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1013,
                level = 45,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1013,
                level = 46,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1013,
                level = 47,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1013,
                level = 48,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1013,
                level = 49,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1013,
                level = 50,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1013,
                level = 51,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1013,
                level = 52,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1013,
                level = 53,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1013,
                level = 54,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1013,
                level = 55,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1013,
                level = 56,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1013,
                level = 57,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1013,
                level = 58,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1013,
                level = 59,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1013,
                level = 60,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1013,
                level = 61,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1013,
                level = 62,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1013,
                level = 63,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1013,
                level = 64,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1013,
                level = 65,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1013,
                level = 66,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1013,
                level = 67,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1013,
                level = 68,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1013,
                level = 69,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1013,
                level = 70,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1013,
                level = 71,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1013,
                level = 72,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1013,
                level = 73,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1013,
                level = 74,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1013,
                level = 75,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1013,
                level = 76,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1013,
                level = 77,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1013,
                level = 78,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1013,
                level = 79,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1013,
                level = 80,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 11950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1013,
                level = 81,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1013,
                level = 82,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12050,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1013,
                level = 83,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12100,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1013,
                level = 84,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12150,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1013,
                level = 85,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12200,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1013,
                level = 86,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12250,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1013,
                level = 87,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12300,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1013,
                level = 88,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12350,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1013,
                level = 89,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12400,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1013,
                level = 90,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12450,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1013,
                level = 91,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12500,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1013,
                level = 92,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12550,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1013,
                level = 93,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12600,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1013,
                level = 94,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12650,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1013,
                level = 95,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12700,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1013,
                level = 96,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12750,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1013,
                level = 97,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12800,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1013,
                level = 98,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12850,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1013,
                level = 99,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12900,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1013,
                level = 100,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1013,
                level = 101,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1013,
                level = 102,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1013,
                level = 103,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1013,
                level = 104,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1013,
                level = 105,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1013,
                level = 106,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1013,
                level = 107,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1013,
                level = 108,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1013,
                level = 109,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1013,
                level = 110,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1013,
                level = 111,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1013,
                level = 112,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1013,
                level = 113,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1013,
                level = 114,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1013,
                level = 115,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1013,
                level = 116,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1013,
                level = 117,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1013,
                level = 118,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1013,
                level = 119,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1013,
                level = 120,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1013,
                level = 121,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1013,
                level = 122,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1013,
                level = 123,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1013,
                level = 124,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1013,
                level = 125,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1013,
                level = 126,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1013,
                level = 127,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1013,
                level = 128,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1013,
                level = 129,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1013,
                level = 130,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1013,
                level = 131,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1013,
                level = 132,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1013,
                level = 133,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1013,
                level = 134,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1013,
                level = 135,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1013,
                level = 136,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1013,
                level = 137,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1013,
                level = 138,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1013,
                level = 139,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1013,
                level = 140,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1013,
                level = 141,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1013,
                level = 142,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1013,
                level = 143,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1013,
                level = 144,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1013,
                level = 145,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1013,
                level = 146,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1013,
                level = 147,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1013,
                level = 148,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1013,
                level = 149,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1013,
                level = 150,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1013,
                level = 151,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1013,
                level = 152,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1013,
                level = 153,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1013,
                level = 154,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1013,
                level = 155,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1013,
                level = 156,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1013,
                level = 157,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1013,
                level = 158,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1013,
                level = 159,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1013,
                level = 160,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1013,
                level = 161,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1013,
                level = 162,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1013,
                level = 163,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1013,
                level = 164,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1013,
                level = 165,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1013,
                level = 166,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1013,
                level = 167,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1013,
                level = 168,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1013,
                level = 169,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1013,
                level = 170,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1013,
                level = 171,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1013,
                level = 172,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1013,
                level = 173,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1013,
                level = 174,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1013,
                level = 175,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1013,
                level = 176,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1013,
                level = 177,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1013,
                level = 178,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1013,
                level = 179,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1013,
                level = 180,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1013,
                level = 181,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1013,
                level = 182,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1013,
                level = 183,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1013,
                level = 184,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1013,
                level = 185,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1013,
                level = 186,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1013,
                level = 187,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1013,
                level = 188,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1013,
                level = 189,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1013,
                level = 190,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1013,
                level = 191,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1013,
                level = 192,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1013,
                level = 193,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1013,
                level = 194,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1013,
                level = 195,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1013,
                level = 196,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1013,
                level = 197,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1013,
                level = 198,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1013,
                level = 199,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1013,
                level = 200,
                kind = 1,
                group = 1013,
                group_rule = 1,
                type = 10114,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12950,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1014, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1014,
                level = 1,
                kind = 23,
                group = 1014,
                group_rule = 1,
                type = 13101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0.5],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1015, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1015,
                level = 1,
                kind = 3,
                group = 1015,
                group_rule = 1,
                type = 10403,
                type_rule = 5,
                overlay = 3,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 2000,
                cd = 0,
                conditions = [],
                param = [0,0,-2500],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1016, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1016,
                level = 1,
                kind = 3,
                group = 1016,
                group_rule = 1,
                type = 10403,
                type_rule = 5,
                overlay = 5,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 12000,
                interval = 2000,
                cd = 0,
                conditions = [],
                param = [0,0,-2500],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1017, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1017,
                level = 1,
                kind = 6,
                group = 1017,
                group_rule = 1,
                type = 11501,
                type_rule = 2,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 7000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1018, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1018,
                level = 1,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1018,
                level = 2,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1018,
                level = 3,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1018,
                level = 4,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1018,
                level = 5,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1018,
                level = 6,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1018,
                level = 7,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1018,
                level = 8,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1018,
                level = 9,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1018,
                level = 10,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1018,
                level = 11,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1018,
                level = 12,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1018,
                level = 13,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1018,
                level = 14,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1018,
                level = 15,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1018,
                level = 16,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1018,
                level = 17,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1018,
                level = 18,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1018,
                level = 19,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1018,
                level = 20,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1018,
                level = 21,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1018,
                level = 22,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1018,
                level = 23,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1018,
                level = 24,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1018,
                level = 25,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1018,
                level = 26,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1018,
                level = 27,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1018,
                level = 28,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1018,
                level = 29,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1018,
                level = 30,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1018,
                level = 31,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1018,
                level = 32,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1018,
                level = 33,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1018,
                level = 34,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1018,
                level = 35,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1018,
                level = 36,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1018,
                level = 37,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1018,
                level = 38,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1018,
                level = 39,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1018,
                level = 40,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1018,
                level = 41,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1018,
                level = 42,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1018,
                level = 43,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1018,
                level = 44,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1018,
                level = 45,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1018,
                level = 46,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1018,
                level = 47,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1018,
                level = 48,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1018,
                level = 49,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1018,
                level = 50,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1018,
                level = 51,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1018,
                level = 52,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1018,
                level = 53,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1018,
                level = 54,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1018,
                level = 55,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1018,
                level = 56,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1018,
                level = 57,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1018,
                level = 58,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1018,
                level = 59,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1018,
                level = 60,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1018,
                level = 61,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1018,
                level = 62,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1018,
                level = 63,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1018,
                level = 64,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1018,
                level = 65,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1018,
                level = 66,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1018,
                level = 67,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1018,
                level = 68,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1018,
                level = 69,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1018,
                level = 70,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1018,
                level = 71,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1018,
                level = 72,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1018,
                level = 73,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1018,
                level = 74,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1018,
                level = 75,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1018,
                level = 76,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1018,
                level = 77,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1018,
                level = 78,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1018,
                level = 79,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1018,
                level = 80,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1018,
                level = 81,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1018,
                level = 82,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1018,
                level = 83,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1018,
                level = 84,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1018,
                level = 85,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1018,
                level = 86,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1018,
                level = 87,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1018,
                level = 88,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1018,
                level = 89,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1018,
                level = 90,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1018,
                level = 91,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1018,
                level = 92,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1018,
                level = 93,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1018,
                level = 94,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1018,
                level = 95,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1018,
                level = 96,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1018,
                level = 97,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1018,
                level = 98,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1018,
                level = 99,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1018,
                level = 100,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1018,
                level = 101,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1018,
                level = 102,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1018,
                level = 103,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1018,
                level = 104,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1018,
                level = 105,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1018,
                level = 106,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1018,
                level = 107,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1018,
                level = 108,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1018,
                level = 109,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1018,
                level = 110,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1018,
                level = 111,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1018,
                level = 112,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1018,
                level = 113,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1018,
                level = 114,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1018,
                level = 115,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1018,
                level = 116,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1018,
                level = 117,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1018,
                level = 118,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1018,
                level = 119,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1018,
                level = 120,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1018,
                level = 121,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1018,
                level = 122,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1018,
                level = 123,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1018,
                level = 124,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1018,
                level = 125,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1018,
                level = 126,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1018,
                level = 127,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1018,
                level = 128,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1018,
                level = 129,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1018,
                level = 130,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1018,
                level = 131,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1018,
                level = 132,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1018,
                level = 133,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1018,
                level = 134,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1018,
                level = 135,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1018,
                level = 136,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1018,
                level = 137,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1018,
                level = 138,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1018,
                level = 139,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1018,
                level = 140,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1018,
                level = 141,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1018,
                level = 142,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1018,
                level = 143,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1018,
                level = 144,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1018,
                level = 145,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1018,
                level = 146,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1018,
                level = 147,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1018,
                level = 148,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1018,
                level = 149,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1018,
                level = 150,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1018,
                level = 151,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1018,
                level = 152,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1018,
                level = 153,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1018,
                level = 154,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1018,
                level = 155,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1018,
                level = 156,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1018,
                level = 157,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1018,
                level = 158,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1018,
                level = 159,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1018,
                level = 160,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1018,
                level = 161,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1018,
                level = 162,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1018,
                level = 163,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1018,
                level = 164,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1018,
                level = 165,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1018,
                level = 166,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1018,
                level = 167,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1018,
                level = 168,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1018,
                level = 169,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1018,
                level = 170,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1018,
                level = 171,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1018,
                level = 172,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1018,
                level = 173,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1018,
                level = 174,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1018,
                level = 175,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1018,
                level = 176,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1018,
                level = 177,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1018,
                level = 178,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1018,
                level = 179,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1018,
                level = 180,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1018,
                level = 181,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1018,
                level = 182,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1018,
                level = 183,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1018,
                level = 184,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1018,
                level = 185,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1018,
                level = 186,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1018,
                level = 187,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1018,
                level = 188,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1018,
                level = 189,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1018,
                level = 190,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1018,
                level = 191,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1018,
                level = 192,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1018,
                level = 193,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1018,
                level = 194,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1018,
                level = 195,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1018,
                level = 196,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1018,
                level = 197,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1018,
                level = 198,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1018,
                level = 199,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1018,
                level = 200,
                kind = 53,
                group = 1018,
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
                param = [{10000,-1,10011013}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1019, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1019,
                level = 1,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1019,
                level = 2,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1019,
                level = 3,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1019,
                level = 4,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1019,
                level = 5,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1019,
                level = 6,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1019,
                level = 7,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1019,
                level = 8,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1019,
                level = 9,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1019,
                level = 10,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1019,
                level = 11,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1019,
                level = 12,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1019,
                level = 13,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1019,
                level = 14,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1019,
                level = 15,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1019,
                level = 16,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1019,
                level = 17,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1019,
                level = 18,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1019,
                level = 19,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1019,
                level = 20,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1019,
                level = 21,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1019,
                level = 22,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1019,
                level = 23,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1019,
                level = 24,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1019,
                level = 25,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1019,
                level = 26,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1019,
                level = 27,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1019,
                level = 28,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1019,
                level = 29,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1019,
                level = 30,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1019,
                level = 31,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1019,
                level = 32,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1019,
                level = 33,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1019,
                level = 34,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1019,
                level = 35,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1019,
                level = 36,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1019,
                level = 37,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1019,
                level = 38,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1019,
                level = 39,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1019,
                level = 40,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1019,
                level = 41,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1019,
                level = 42,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1019,
                level = 43,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1019,
                level = 44,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1019,
                level = 45,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1019,
                level = 46,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1019,
                level = 47,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1019,
                level = 48,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1019,
                level = 49,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1019,
                level = 50,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1019,
                level = 51,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1019,
                level = 52,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1019,
                level = 53,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1019,
                level = 54,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1019,
                level = 55,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1019,
                level = 56,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1019,
                level = 57,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1019,
                level = 58,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1019,
                level = 59,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1019,
                level = 60,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1019,
                level = 61,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1019,
                level = 62,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1019,
                level = 63,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1019,
                level = 64,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1019,
                level = 65,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1019,
                level = 66,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1019,
                level = 67,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1019,
                level = 68,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1019,
                level = 69,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1019,
                level = 70,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1019,
                level = 71,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1019,
                level = 72,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1019,
                level = 73,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1019,
                level = 74,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1019,
                level = 75,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1019,
                level = 76,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1019,
                level = 77,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1019,
                level = 78,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1019,
                level = 79,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1019,
                level = 80,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1019,
                level = 81,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1019,
                level = 82,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1019,
                level = 83,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1019,
                level = 84,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1019,
                level = 85,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1019,
                level = 86,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1019,
                level = 87,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1019,
                level = 88,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1019,
                level = 89,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1019,
                level = 90,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1019,
                level = 91,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1019,
                level = 92,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1019,
                level = 93,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1019,
                level = 94,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1019,
                level = 95,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1019,
                level = 96,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1019,
                level = 97,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1019,
                level = 98,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1019,
                level = 99,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1019,
                level = 100,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1019,
                level = 101,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1019,
                level = 102,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1019,
                level = 103,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1019,
                level = 104,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1019,
                level = 105,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1019,
                level = 106,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1019,
                level = 107,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1019,
                level = 108,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1019,
                level = 109,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1019,
                level = 110,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1019,
                level = 111,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1019,
                level = 112,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1019,
                level = 113,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1019,
                level = 114,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1019,
                level = 115,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1019,
                level = 116,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1019,
                level = 117,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1019,
                level = 118,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1019,
                level = 119,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1019,
                level = 120,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1019,
                level = 121,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1019,
                level = 122,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1019,
                level = 123,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1019,
                level = 124,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1019,
                level = 125,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1019,
                level = 126,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1019,
                level = 127,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1019,
                level = 128,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1019,
                level = 129,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1019,
                level = 130,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1019,
                level = 131,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1019,
                level = 132,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1019,
                level = 133,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1019,
                level = 134,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1019,
                level = 135,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1019,
                level = 136,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1019,
                level = 137,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1019,
                level = 138,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1019,
                level = 139,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1019,
                level = 140,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1019,
                level = 141,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1019,
                level = 142,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1019,
                level = 143,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1019,
                level = 144,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1019,
                level = 145,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1019,
                level = 146,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1019,
                level = 147,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1019,
                level = 148,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1019,
                level = 149,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1019,
                level = 150,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1019,
                level = 151,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1019,
                level = 152,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1019,
                level = 153,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1019,
                level = 154,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1019,
                level = 155,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1019,
                level = 156,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1019,
                level = 157,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1019,
                level = 158,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1019,
                level = 159,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1019,
                level = 160,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1019,
                level = 161,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1019,
                level = 162,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1019,
                level = 163,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1019,
                level = 164,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1019,
                level = 165,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1019,
                level = 166,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1019,
                level = 167,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1019,
                level = 168,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1019,
                level = 169,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1019,
                level = 170,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1019,
                level = 171,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1019,
                level = 172,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1019,
                level = 173,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1019,
                level = 174,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1019,
                level = 175,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1019,
                level = 176,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1019,
                level = 177,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1019,
                level = 178,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1019,
                level = 179,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1019,
                level = 180,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1019,
                level = 181,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1019,
                level = 182,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1019,
                level = 183,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1019,
                level = 184,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1019,
                level = 185,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1019,
                level = 186,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1019,
                level = 187,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1019,
                level = 188,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1019,
                level = 189,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1019,
                level = 190,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1019,
                level = 191,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1019,
                level = 192,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1019,
                level = 193,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1019,
                level = 194,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1019,
                level = 195,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1019,
                level = 196,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1019,
                level = 197,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1019,
                level = 198,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1019,
                level = 199,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1019,
                level = 200,
                kind = 53,
                group = 1019,
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
                param = [{10000,-1,10012013}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1020, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1020,
                level = 1,
                kind = 17,
                group = 1020,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 4000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.5,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1021, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1021,
                level = 1,
                kind = 13,
                group = 1021,
                group_rule = 1,
                type = 12001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 8000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{10000,0,11501},{10000,0,11601},{10000,0,11701},{10000,0,11801}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(1022, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 1022,
                level = 1,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 1022,
                level = 2,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 1022,
                level = 3,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 1022,
                level = 4,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 1022,
                level = 5,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 1022,
                level = 6,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 1022,
                level = 7,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 1022,
                level = 8,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 1022,
                level = 9,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 1022,
                level = 10,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 1022,
                level = 11,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 1022,
                level = 12,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 1022,
                level = 13,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 1022,
                level = 14,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 1022,
                level = 15,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 1022,
                level = 16,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 1022,
                level = 17,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 1022,
                level = 18,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 1022,
                level = 19,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 1022,
                level = 20,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 1022,
                level = 21,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 1022,
                level = 22,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 1022,
                level = 23,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 1022,
                level = 24,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 1022,
                level = 25,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 1022,
                level = 26,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 1022,
                level = 27,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 1022,
                level = 28,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 1022,
                level = 29,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 1022,
                level = 30,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 1022,
                level = 31,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 1022,
                level = 32,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 1022,
                level = 33,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 1022,
                level = 34,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 1022,
                level = 35,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 1022,
                level = 36,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 1022,
                level = 37,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 1022,
                level = 38,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 1022,
                level = 39,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 1022,
                level = 40,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 1022,
                level = 41,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 1022,
                level = 42,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 1022,
                level = 43,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 1022,
                level = 44,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 1022,
                level = 45,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 1022,
                level = 46,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 1022,
                level = 47,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 1022,
                level = 48,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 1022,
                level = 49,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 1022,
                level = 50,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 1022,
                level = 51,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 1022,
                level = 52,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 1022,
                level = 53,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 1022,
                level = 54,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 1022,
                level = 55,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 1022,
                level = 56,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 1022,
                level = 57,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 1022,
                level = 58,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 1022,
                level = 59,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 1022,
                level = 60,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 1022,
                level = 61,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 1022,
                level = 62,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 1022,
                level = 63,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 1022,
                level = 64,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 1022,
                level = 65,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 1022,
                level = 66,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 1022,
                level = 67,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 1022,
                level = 68,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 1022,
                level = 69,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 1022,
                level = 70,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 1022,
                level = 71,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 1022,
                level = 72,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 1022,
                level = 73,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 1022,
                level = 74,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 1022,
                level = 75,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 1022,
                level = 76,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 1022,
                level = 77,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 1022,
                level = 78,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 1022,
                level = 79,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 1022,
                level = 80,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 1022,
                level = 81,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 1022,
                level = 82,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 1022,
                level = 83,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 1022,
                level = 84,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 1022,
                level = 85,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 1022,
                level = 86,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 1022,
                level = 87,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 1022,
                level = 88,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 1022,
                level = 89,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 1022,
                level = 90,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 1022,
                level = 91,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 1022,
                level = 92,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 1022,
                level = 93,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 1022,
                level = 94,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 1022,
                level = 95,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 1022,
                level = 96,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 1022,
                level = 97,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 1022,
                level = 98,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 1022,
                level = 99,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 1022,
                level = 100,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 101 ->
            #conf_effect{
                id = 1022,
                level = 101,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 102 ->
            #conf_effect{
                id = 1022,
                level = 102,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 103 ->
            #conf_effect{
                id = 1022,
                level = 103,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 104 ->
            #conf_effect{
                id = 1022,
                level = 104,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 105 ->
            #conf_effect{
                id = 1022,
                level = 105,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 106 ->
            #conf_effect{
                id = 1022,
                level = 106,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 107 ->
            #conf_effect{
                id = 1022,
                level = 107,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 108 ->
            #conf_effect{
                id = 1022,
                level = 108,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 109 ->
            #conf_effect{
                id = 1022,
                level = 109,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 110 ->
            #conf_effect{
                id = 1022,
                level = 110,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 111 ->
            #conf_effect{
                id = 1022,
                level = 111,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 112 ->
            #conf_effect{
                id = 1022,
                level = 112,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 113 ->
            #conf_effect{
                id = 1022,
                level = 113,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 114 ->
            #conf_effect{
                id = 1022,
                level = 114,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 115 ->
            #conf_effect{
                id = 1022,
                level = 115,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 116 ->
            #conf_effect{
                id = 1022,
                level = 116,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 117 ->
            #conf_effect{
                id = 1022,
                level = 117,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 118 ->
            #conf_effect{
                id = 1022,
                level = 118,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 119 ->
            #conf_effect{
                id = 1022,
                level = 119,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 120 ->
            #conf_effect{
                id = 1022,
                level = 120,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 121 ->
            #conf_effect{
                id = 1022,
                level = 121,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 122 ->
            #conf_effect{
                id = 1022,
                level = 122,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 123 ->
            #conf_effect{
                id = 1022,
                level = 123,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 124 ->
            #conf_effect{
                id = 1022,
                level = 124,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 125 ->
            #conf_effect{
                id = 1022,
                level = 125,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 126 ->
            #conf_effect{
                id = 1022,
                level = 126,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 127 ->
            #conf_effect{
                id = 1022,
                level = 127,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 128 ->
            #conf_effect{
                id = 1022,
                level = 128,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 129 ->
            #conf_effect{
                id = 1022,
                level = 129,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 130 ->
            #conf_effect{
                id = 1022,
                level = 130,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 131 ->
            #conf_effect{
                id = 1022,
                level = 131,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 132 ->
            #conf_effect{
                id = 1022,
                level = 132,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 133 ->
            #conf_effect{
                id = 1022,
                level = 133,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 134 ->
            #conf_effect{
                id = 1022,
                level = 134,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 135 ->
            #conf_effect{
                id = 1022,
                level = 135,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 136 ->
            #conf_effect{
                id = 1022,
                level = 136,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 137 ->
            #conf_effect{
                id = 1022,
                level = 137,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 138 ->
            #conf_effect{
                id = 1022,
                level = 138,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 139 ->
            #conf_effect{
                id = 1022,
                level = 139,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 140 ->
            #conf_effect{
                id = 1022,
                level = 140,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 141 ->
            #conf_effect{
                id = 1022,
                level = 141,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 142 ->
            #conf_effect{
                id = 1022,
                level = 142,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 143 ->
            #conf_effect{
                id = 1022,
                level = 143,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 144 ->
            #conf_effect{
                id = 1022,
                level = 144,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 145 ->
            #conf_effect{
                id = 1022,
                level = 145,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 146 ->
            #conf_effect{
                id = 1022,
                level = 146,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 147 ->
            #conf_effect{
                id = 1022,
                level = 147,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 148 ->
            #conf_effect{
                id = 1022,
                level = 148,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 149 ->
            #conf_effect{
                id = 1022,
                level = 149,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 150 ->
            #conf_effect{
                id = 1022,
                level = 150,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 151 ->
            #conf_effect{
                id = 1022,
                level = 151,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 152 ->
            #conf_effect{
                id = 1022,
                level = 152,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 153 ->
            #conf_effect{
                id = 1022,
                level = 153,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 154 ->
            #conf_effect{
                id = 1022,
                level = 154,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 155 ->
            #conf_effect{
                id = 1022,
                level = 155,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 156 ->
            #conf_effect{
                id = 1022,
                level = 156,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 157 ->
            #conf_effect{
                id = 1022,
                level = 157,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 158 ->
            #conf_effect{
                id = 1022,
                level = 158,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 159 ->
            #conf_effect{
                id = 1022,
                level = 159,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 160 ->
            #conf_effect{
                id = 1022,
                level = 160,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 161 ->
            #conf_effect{
                id = 1022,
                level = 161,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 162 ->
            #conf_effect{
                id = 1022,
                level = 162,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 163 ->
            #conf_effect{
                id = 1022,
                level = 163,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 164 ->
            #conf_effect{
                id = 1022,
                level = 164,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 165 ->
            #conf_effect{
                id = 1022,
                level = 165,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 166 ->
            #conf_effect{
                id = 1022,
                level = 166,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 167 ->
            #conf_effect{
                id = 1022,
                level = 167,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 168 ->
            #conf_effect{
                id = 1022,
                level = 168,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 169 ->
            #conf_effect{
                id = 1022,
                level = 169,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 170 ->
            #conf_effect{
                id = 1022,
                level = 170,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 171 ->
            #conf_effect{
                id = 1022,
                level = 171,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 172 ->
            #conf_effect{
                id = 1022,
                level = 172,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 173 ->
            #conf_effect{
                id = 1022,
                level = 173,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 174 ->
            #conf_effect{
                id = 1022,
                level = 174,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 175 ->
            #conf_effect{
                id = 1022,
                level = 175,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 176 ->
            #conf_effect{
                id = 1022,
                level = 176,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 177 ->
            #conf_effect{
                id = 1022,
                level = 177,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 178 ->
            #conf_effect{
                id = 1022,
                level = 178,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 179 ->
            #conf_effect{
                id = 1022,
                level = 179,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 180 ->
            #conf_effect{
                id = 1022,
                level = 180,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 181 ->
            #conf_effect{
                id = 1022,
                level = 181,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 182 ->
            #conf_effect{
                id = 1022,
                level = 182,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 183 ->
            #conf_effect{
                id = 1022,
                level = 183,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 184 ->
            #conf_effect{
                id = 1022,
                level = 184,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 185 ->
            #conf_effect{
                id = 1022,
                level = 185,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 186 ->
            #conf_effect{
                id = 1022,
                level = 186,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 187 ->
            #conf_effect{
                id = 1022,
                level = 187,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 188 ->
            #conf_effect{
                id = 1022,
                level = 188,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 189 ->
            #conf_effect{
                id = 1022,
                level = 189,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 190 ->
            #conf_effect{
                id = 1022,
                level = 190,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 191 ->
            #conf_effect{
                id = 1022,
                level = 191,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 192 ->
            #conf_effect{
                id = 1022,
                level = 192,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 193 ->
            #conf_effect{
                id = 1022,
                level = 193,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 194 ->
            #conf_effect{
                id = 1022,
                level = 194,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 195 ->
            #conf_effect{
                id = 1022,
                level = 195,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 196 ->
            #conf_effect{
                id = 1022,
                level = 196,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 197 ->
            #conf_effect{
                id = 1022,
                level = 197,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 198 ->
            #conf_effect{
                id = 1022,
                level = 198,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 199 ->
            #conf_effect{
                id = 1022,
                level = 199,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        Level =:= 200 ->
            #conf_effect{
                id = 1022,
                level = 200,
                kind = 53,
                group = 1022,
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
                param = [{10000,-1,10012012}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
