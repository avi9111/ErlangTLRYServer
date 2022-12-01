%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_111).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(11101, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11101,
                level = 1,
                kind = 43,
                group = 11101,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11101,
                level = 2,
                kind = 43,
                group = 11101,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11101,
                level = 3,
                kind = 43,
                group = 11101,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11101,
                level = 4,
                kind = 43,
                group = 11101,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11101,
                level = 5,
                kind = 43,
                group = 11101,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11102, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11102,
                level = 1,
                kind = 43,
                group = 11102,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11102,
                level = 2,
                kind = 43,
                group = 11102,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11102,
                level = 3,
                kind = 43,
                group = 11102,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11102,
                level = 4,
                kind = 43,
                group = 11102,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11102,
                level = 5,
                kind = 43,
                group = 11102,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11103, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11103,
                level = 1,
                kind = 43,
                group = 11103,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11103,
                level = 2,
                kind = 43,
                group = 11103,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11103,
                level = 3,
                kind = 43,
                group = 11103,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11103,
                level = 4,
                kind = 43,
                group = 11103,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11103,
                level = 5,
                kind = 43,
                group = 11103,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11104, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11104,
                level = 1,
                kind = 43,
                group = 11104,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11104,
                level = 2,
                kind = 43,
                group = 11104,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11104,
                level = 3,
                kind = 43,
                group = 11104,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11104,
                level = 4,
                kind = 43,
                group = 11104,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11104,
                level = 5,
                kind = 43,
                group = 11104,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11105, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11105,
                level = 1,
                kind = 43,
                group = 11105,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11105,
                level = 2,
                kind = 43,
                group = 11105,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11105,
                level = 3,
                kind = 43,
                group = 11105,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11105,
                level = 4,
                kind = 43,
                group = 11105,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11105,
                level = 5,
                kind = 43,
                group = 11105,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11106, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11106,
                level = 1,
                kind = 43,
                group = 11106,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11106,
                level = 2,
                kind = 43,
                group = 11106,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11106,
                level = 3,
                kind = 43,
                group = 11106,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],20000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11106,
                level = 4,
                kind = 43,
                group = 11106,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],22000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11106,
                level = 5,
                kind = 43,
                group = 11106,
                group_rule = 1,
                type = 13701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],25000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11107, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11107,
                level = 1,
                kind = 42,
                group = 11107,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11107,
                level = 2,
                kind = 42,
                group = 11107,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11107,
                level = 3,
                kind = 42,
                group = 11107,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11107,
                level = 4,
                kind = 42,
                group = 11107,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11107,
                level = 5,
                kind = 42,
                group = 11107,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11714],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11108, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11108,
                level = 1,
                kind = 42,
                group = 11108,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11108,
                level = 2,
                kind = 42,
                group = 11108,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11108,
                level = 3,
                kind = 42,
                group = 11108,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11108,
                level = 4,
                kind = 42,
                group = 11108,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11108,
                level = 5,
                kind = 42,
                group = 11108,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11601],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11109, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11109,
                level = 1,
                kind = 42,
                group = 11109,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11109,
                level = 2,
                kind = 42,
                group = 11109,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11109,
                level = 3,
                kind = 42,
                group = 11109,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11109,
                level = 4,
                kind = 42,
                group = 11109,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11109,
                level = 5,
                kind = 42,
                group = 11109,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11501],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11110, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11110,
                level = 1,
                kind = 42,
                group = 11110,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11110,
                level = 2,
                kind = 42,
                group = 11110,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11110,
                level = 3,
                kind = 42,
                group = 11110,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11110,
                level = 4,
                kind = 42,
                group = 11110,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11110,
                level = 5,
                kind = 42,
                group = 11110,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11801],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11111, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11111,
                level = 1,
                kind = 42,
                group = 11111,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11111,
                level = 2,
                kind = 42,
                group = 11111,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11111,
                level = 3,
                kind = 42,
                group = 11111,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11111,
                level = 4,
                kind = 42,
                group = 11111,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11111,
                level = 5,
                kind = 42,
                group = 11111,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[11001],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11112, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11112,
                level = 1,
                kind = 42,
                group = 11112,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],15000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11112,
                level = 2,
                kind = 42,
                group = 11112,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],18000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11112,
                level = 3,
                kind = 42,
                group = 11112,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],22000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11112,
                level = 4,
                kind = 42,
                group = 11112,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],26000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11112,
                level = 5,
                kind = 42,
                group = 11112,
                group_rule = 1,
                type = 13601,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [[],[13501],30000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
