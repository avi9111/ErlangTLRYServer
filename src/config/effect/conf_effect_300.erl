%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_300).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(30001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30001,
                level = 1,
                kind = 1,
                group = 30001,
                group_rule = 1,
                type = 101104,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 120000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30002,
                level = 1,
                kind = 1,
                group = 30002,
                group_rule = 1,
                type = 101104,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 120000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{17,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30003,
                level = 1,
                kind = 24,
                group = 30003,
                group_rule = 1,
                type = 13202,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3600000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4.00],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30004, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30004,
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
                duration = 5000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-1],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30005, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30005,
                level = 1,
                kind = 52,
                group = 30005,
                group_rule = 1,
                type = 12602,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,3,1],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30006, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30006,
                level = 1,
                kind = 16,
                group = 30006,
                group_rule = 1,
                type = 12501,
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
        true ->
            undefined
    end;
get(30007, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30007,
                level = 1,
                kind = 15,
                group = 30007,
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
        true ->
            undefined
    end;
get(30008, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30008,
                level = 1,
                kind = 1,
                group = 30008,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30009, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30009,
                level = 1,
                kind = 1,
                group = 30009,
                group_rule = 1,
                type = 10108,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{8,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30010, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30010,
                level = 1,
                kind = 1,
                group = 30010,
                group_rule = 1,
                type = 10125,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{25,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30011, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30011,
                level = 1,
                kind = 1,
                group = 30011,
                group_rule = 1,
                type = 10126,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{26,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30012, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30012,
                level = 1,
                kind = 1,
                group = 30012,
                group_rule = 1,
                type = 10127,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{27,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30013, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30013,
                level = 1,
                kind = 1,
                group = 30013,
                group_rule = 1,
                type = 10128,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{28,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30014, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30014,
                level = 1,
                kind = 3,
                group = 30014,
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
                param = [0,-100,0],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30015, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30015,
                level = 1,
                kind = 1,
                group = 30015,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30016, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30016,
                level = 1,
                kind = 1,
                group = 30016,
                group_rule = 1,
                type = 10108,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{8,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30017, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30017,
                level = 1,
                kind = 1,
                group = 30017,
                group_rule = 1,
                type = 10127,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{27,50000,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30018, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30018,
                level = 1,
                kind = 53,
                group = 30018,
                group_rule = 1,
                type = 12701,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 6000,
                interval = 6000,
                cd = 0,
                conditions = [],
                param = [{10000,-1,20024503}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30019, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30019,
                level = 1,
                kind = 5,
                group = 30019,
                group_rule = 2,
                type = 11001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 2000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30020, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30020,
                level = 1,
                kind = 20,
                group = 30020,
                group_rule = 2,
                type = 10801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 1000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30021, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30021,
                level = 1,
                kind = 1,
                group = 30021,
                group_rule = 1,
                type = 11714,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{14,0,-0.85,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30022, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30022,
                level = 1,
                kind = 23,
                group = 30022,
                group_rule = 1,
                type = 13101,
                type_rule = 1,
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
        true ->
            undefined
    end;
get(30023, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30023,
                level = 1,
                kind = 23,
                group = 30023,
                group_rule = 1,
                type = 13101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 3600000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [4],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30024, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30024,
                level = 1,
                kind = 16,
                group = 30024,
                group_rule = 1,
                type = 12501,
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
        true ->
            undefined
    end;
get(30025, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30025,
                level = 1,
                kind = 16,
                group = 30025,
                group_rule = 1,
                type = 12501,
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
        true ->
            undefined
    end;
get(30026, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30026,
                level = 1,
                kind = 16,
                group = 30026,
                group_rule = 1,
                type = 12501,
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
        true ->
            undefined
    end;
get(30027, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30027,
                level = 1,
                kind = 12,
                group = 30027,
                group_rule = 1,
                type = 11201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 5000000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-1],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30028, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30028,
                level = 1,
                kind = 24,
                group = 30028,
                group_rule = 1,
                type = 13201,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 10000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [-0.9],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30029, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30029,
                level = 1,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 30029,
                level = 2,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 30029,
                level = 3,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 30029,
                level = 4,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 30029,
                level = 5,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 6 ->
            #conf_effect{
                id = 30029,
                level = 6,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 7 ->
            #conf_effect{
                id = 30029,
                level = 7,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 8 ->
            #conf_effect{
                id = 30029,
                level = 8,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 9 ->
            #conf_effect{
                id = 30029,
                level = 9,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 10 ->
            #conf_effect{
                id = 30029,
                level = 10,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 11 ->
            #conf_effect{
                id = 30029,
                level = 11,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 12 ->
            #conf_effect{
                id = 30029,
                level = 12,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 13 ->
            #conf_effect{
                id = 30029,
                level = 13,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 14 ->
            #conf_effect{
                id = 30029,
                level = 14,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 15 ->
            #conf_effect{
                id = 30029,
                level = 15,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 16 ->
            #conf_effect{
                id = 30029,
                level = 16,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 17 ->
            #conf_effect{
                id = 30029,
                level = 17,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 18 ->
            #conf_effect{
                id = 30029,
                level = 18,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 19 ->
            #conf_effect{
                id = 30029,
                level = 19,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 20 ->
            #conf_effect{
                id = 30029,
                level = 20,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 21 ->
            #conf_effect{
                id = 30029,
                level = 21,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 22 ->
            #conf_effect{
                id = 30029,
                level = 22,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 23 ->
            #conf_effect{
                id = 30029,
                level = 23,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 24 ->
            #conf_effect{
                id = 30029,
                level = 24,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 25 ->
            #conf_effect{
                id = 30029,
                level = 25,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 26 ->
            #conf_effect{
                id = 30029,
                level = 26,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 27 ->
            #conf_effect{
                id = 30029,
                level = 27,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 28 ->
            #conf_effect{
                id = 30029,
                level = 28,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 29 ->
            #conf_effect{
                id = 30029,
                level = 29,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 30 ->
            #conf_effect{
                id = 30029,
                level = 30,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 31 ->
            #conf_effect{
                id = 30029,
                level = 31,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 32 ->
            #conf_effect{
                id = 30029,
                level = 32,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 33 ->
            #conf_effect{
                id = 30029,
                level = 33,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 34 ->
            #conf_effect{
                id = 30029,
                level = 34,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 35 ->
            #conf_effect{
                id = 30029,
                level = 35,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 36 ->
            #conf_effect{
                id = 30029,
                level = 36,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 37 ->
            #conf_effect{
                id = 30029,
                level = 37,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 38 ->
            #conf_effect{
                id = 30029,
                level = 38,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 39 ->
            #conf_effect{
                id = 30029,
                level = 39,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 40 ->
            #conf_effect{
                id = 30029,
                level = 40,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 41 ->
            #conf_effect{
                id = 30029,
                level = 41,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 42 ->
            #conf_effect{
                id = 30029,
                level = 42,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 43 ->
            #conf_effect{
                id = 30029,
                level = 43,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 44 ->
            #conf_effect{
                id = 30029,
                level = 44,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 45 ->
            #conf_effect{
                id = 30029,
                level = 45,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 46 ->
            #conf_effect{
                id = 30029,
                level = 46,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 47 ->
            #conf_effect{
                id = 30029,
                level = 47,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 48 ->
            #conf_effect{
                id = 30029,
                level = 48,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 49 ->
            #conf_effect{
                id = 30029,
                level = 49,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 50 ->
            #conf_effect{
                id = 30029,
                level = 50,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 51 ->
            #conf_effect{
                id = 30029,
                level = 51,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 52 ->
            #conf_effect{
                id = 30029,
                level = 52,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 53 ->
            #conf_effect{
                id = 30029,
                level = 53,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 54 ->
            #conf_effect{
                id = 30029,
                level = 54,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 55 ->
            #conf_effect{
                id = 30029,
                level = 55,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 56 ->
            #conf_effect{
                id = 30029,
                level = 56,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 57 ->
            #conf_effect{
                id = 30029,
                level = 57,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 58 ->
            #conf_effect{
                id = 30029,
                level = 58,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 59 ->
            #conf_effect{
                id = 30029,
                level = 59,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 60 ->
            #conf_effect{
                id = 30029,
                level = 60,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 61 ->
            #conf_effect{
                id = 30029,
                level = 61,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 62 ->
            #conf_effect{
                id = 30029,
                level = 62,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 63 ->
            #conf_effect{
                id = 30029,
                level = 63,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 64 ->
            #conf_effect{
                id = 30029,
                level = 64,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 65 ->
            #conf_effect{
                id = 30029,
                level = 65,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 66 ->
            #conf_effect{
                id = 30029,
                level = 66,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 67 ->
            #conf_effect{
                id = 30029,
                level = 67,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 68 ->
            #conf_effect{
                id = 30029,
                level = 68,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 69 ->
            #conf_effect{
                id = 30029,
                level = 69,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 70 ->
            #conf_effect{
                id = 30029,
                level = 70,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 71 ->
            #conf_effect{
                id = 30029,
                level = 71,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 72 ->
            #conf_effect{
                id = 30029,
                level = 72,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 73 ->
            #conf_effect{
                id = 30029,
                level = 73,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 74 ->
            #conf_effect{
                id = 30029,
                level = 74,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 75 ->
            #conf_effect{
                id = 30029,
                level = 75,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 76 ->
            #conf_effect{
                id = 30029,
                level = 76,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 77 ->
            #conf_effect{
                id = 30029,
                level = 77,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 78 ->
            #conf_effect{
                id = 30029,
                level = 78,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 79 ->
            #conf_effect{
                id = 30029,
                level = 79,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 80 ->
            #conf_effect{
                id = 30029,
                level = 80,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 81 ->
            #conf_effect{
                id = 30029,
                level = 81,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 82 ->
            #conf_effect{
                id = 30029,
                level = 82,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 83 ->
            #conf_effect{
                id = 30029,
                level = 83,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 84 ->
            #conf_effect{
                id = 30029,
                level = 84,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 85 ->
            #conf_effect{
                id = 30029,
                level = 85,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 86 ->
            #conf_effect{
                id = 30029,
                level = 86,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 87 ->
            #conf_effect{
                id = 30029,
                level = 87,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 88 ->
            #conf_effect{
                id = 30029,
                level = 88,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 89 ->
            #conf_effect{
                id = 30029,
                level = 89,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 90 ->
            #conf_effect{
                id = 30029,
                level = 90,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 91 ->
            #conf_effect{
                id = 30029,
                level = 91,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 92 ->
            #conf_effect{
                id = 30029,
                level = 92,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 93 ->
            #conf_effect{
                id = 30029,
                level = 93,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 94 ->
            #conf_effect{
                id = 30029,
                level = 94,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 95 ->
            #conf_effect{
                id = 30029,
                level = 95,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 96 ->
            #conf_effect{
                id = 30029,
                level = 96,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 97 ->
            #conf_effect{
                id = 30029,
                level = 97,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 98 ->
            #conf_effect{
                id = 30029,
                level = 98,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 99 ->
            #conf_effect{
                id = 30029,
                level = 99,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        Level =:= 100 ->
            #conf_effect{
                id = 30029,
                level = 100,
                kind = 1,
                group = 30029,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30030, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30030,
                level = 1,
                kind = 1,
                group = 30030,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30031, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30031,
                level = 1,
                kind = 1,
                group = 30031,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30032, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30032,
                level = 1,
                kind = 1,
                group = 30032,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30033, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30033,
                level = 1,
                kind = 1,
                group = 30033,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30034, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30034,
                level = 1,
                kind = 1,
                group = 30034,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30035, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30035,
                level = 1,
                kind = 1,
                group = 30035,
                group_rule = 1,
                type = 10107,
                type_rule = 1,
                overlay = 0,
                dead_clear = 0,
                to_obj = 0,
                trig_cd = 0,
                duration = 1800000,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{7,0,0,0}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(30036, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 30036,
                level = 1,
                kind = 6,
                group = 30036,
                group_rule = 1,
                type = 11501,
                type_rule = 3,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 20000,
                interval = 0,
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
