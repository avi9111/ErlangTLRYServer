%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_112).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(11201, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11201,
                level = 1,
                kind = 52,
                group = 11201,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11301,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11201,
                level = 2,
                kind = 52,
                group = 11201,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11301,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11201,
                level = 3,
                kind = 52,
                group = 11201,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11301,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11201,
                level = 4,
                kind = 52,
                group = 11201,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11301,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11201,
                level = 5,
                kind = 52,
                group = 11201,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11301,5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11202, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11202,
                level = 1,
                kind = 52,
                group = 11202,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11302,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11202,
                level = 2,
                kind = 52,
                group = 11202,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11302,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11202,
                level = 3,
                kind = 52,
                group = 11202,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11302,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11202,
                level = 4,
                kind = 52,
                group = 11202,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11302,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11202,
                level = 5,
                kind = 52,
                group = 11202,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,1,{11302,5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11203, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11203,
                level = 1,
                kind = 22,
                group = 11203,
                group_rule = 1,
                type = 13001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [8],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11203,
                level = 2,
                kind = 22,
                group = 11203,
                group_rule = 1,
                type = 13001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [9],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11203,
                level = 3,
                kind = 22,
                group = 11203,
                group_rule = 1,
                type = 13001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [11],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11203,
                level = 4,
                kind = 22,
                group = 11203,
                group_rule = 1,
                type = 13001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [13],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11203,
                level = 5,
                kind = 22,
                group = 11203,
                group_rule = 1,
                type = 13001,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [15],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11204, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11204,
                level = 1,
                kind = 51,
                group = 11204,
                group_rule = 1,
                type = 13801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 10000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,0,8000],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11204,
                level = 2,
                kind = 51,
                group = 11204,
                group_rule = 1,
                type = 13801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 10000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,0,9000],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11204,
                level = 3,
                kind = 51,
                group = 11204,
                group_rule = 1,
                type = 13801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 10000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,0,11000],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11204,
                level = 4,
                kind = 51,
                group = 11204,
                group_rule = 1,
                type = 13801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 10000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,0,13000],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11204,
                level = 5,
                kind = 51,
                group = 11204,
                group_rule = 1,
                type = 13801,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 10000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [5000,0,15000],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11205, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11205,
                level = 1,
                kind = 54,
                group = 11205,
                group_rule = 1,
                type = 13901,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10,{10000,1,{11303,1}},{10000,0,10}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11205,
                level = 2,
                kind = 54,
                group = 11205,
                group_rule = 1,
                type = 13901,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10,{10000,1,{11303,2}},{10000,0,10}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11205,
                level = 3,
                kind = 54,
                group = 11205,
                group_rule = 1,
                type = 13901,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10,{10000,1,{11303,3}},{10000,0,10}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11205,
                level = 4,
                kind = 54,
                group = 11205,
                group_rule = 1,
                type = 13901,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10,{10000,1,{11303,4}},{10000,0,10}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11205,
                level = 5,
                kind = 54,
                group = 11205,
                group_rule = 1,
                type = 13901,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 120000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10,{10000,1,{11303,5}},{10000,0,10}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11206, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11206,
                level = 1,
                kind = 52,
                group = 11206,
                group_rule = 1,
                type = 12605,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,6,{1000,2}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11206,
                level = 2,
                kind = 52,
                group = 11206,
                group_rule = 1,
                type = 12605,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,6,{1000,3}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11206,
                level = 3,
                kind = 52,
                group = 11206,
                group_rule = 1,
                type = 12605,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,6,{1500,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11206,
                level = 4,
                kind = 52,
                group = 11206,
                group_rule = 1,
                type = 12605,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,6,{1500,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11206,
                level = 5,
                kind = 52,
                group = 11206,
                group_rule = 1,
                type = 12605,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,6,{2000,5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11207, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11207,
                level = 1,
                kind = 52,
                group = 11207,
                group_rule = 1,
                type = 12606,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,5,{1500}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11207,
                level = 2,
                kind = 52,
                group = 11207,
                group_rule = 1,
                type = 12606,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,5,{1400}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11207,
                level = 3,
                kind = 52,
                group = 11207,
                group_rule = 1,
                type = 12606,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,5,{1300}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11207,
                level = 4,
                kind = 52,
                group = 11207,
                group_rule = 1,
                type = 12606,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,5,{1200}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11207,
                level = 5,
                kind = 52,
                group = 11207,
                group_rule = 1,
                type = 12606,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [10000,5,{1000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11208, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11208,
                level = 1,
                kind = 55,
                group = 11208,
                group_rule = 1,
                type = 14101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{0,15000}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11208,
                level = 2,
                kind = 55,
                group = 11208,
                group_rule = 1,
                type = 14101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{0,18000}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11208,
                level = 3,
                kind = 55,
                group = 11208,
                group_rule = 1,
                type = 14101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{0,22000}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11208,
                level = 4,
                kind = 55,
                group = 11208,
                group_rule = 1,
                type = 14101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{0,26000}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11208,
                level = 5,
                kind = 55,
                group = 11208,
                group_rule = 1,
                type = 14101,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{0,30000}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11209, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11209,
                level = 1,
                kind = 51,
                group = 13802,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,1,{11304,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11209,
                level = 2,
                kind = 51,
                group = 13802,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,1,{11304,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11209,
                level = 3,
                kind = 51,
                group = 13802,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,1,{11304,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11209,
                level = 4,
                kind = 51,
                group = 13802,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,1,{11304,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11209,
                level = 5,
                kind = 51,
                group = 13802,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,1,{11304,5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11210, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11210,
                level = 1,
                kind = 51,
                group = 13803,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{-1,3},1,{11305,1}],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11210,
                level = 2,
                kind = 51,
                group = 13803,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{-1,3},1,{11305,2}],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11210,
                level = 3,
                kind = 51,
                group = 13803,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{-1,3},1,{11305,3}],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11210,
                level = 4,
                kind = 51,
                group = 13803,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{-1,3},1,{11305,4}],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11210,
                level = 5,
                kind = 51,
                group = 13803,
                group_rule = 1,
                type = 12604,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 30000,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [{-1,3},1,{11305,5}],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
