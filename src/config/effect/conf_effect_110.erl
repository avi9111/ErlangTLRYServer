%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect_110).

-include("log.hrl").
-include("effect.hrl").

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(11001, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11001,
                level = 1,
                kind = 41,
                group = 11001,
                group_rule = 1,
                type = 13401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11001,
                level = 2,
                kind = 41,
                group = 11001,
                group_rule = 1,
                type = 13401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11001,
                level = 3,
                kind = 41,
                group = 11001,
                group_rule = 1,
                type = 13401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11001,
                level = 4,
                kind = 41,
                group = 11001,
                group_rule = 1,
                type = 13401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11001,
                level = 5,
                kind = 41,
                group = 11001,
                group_rule = 1,
                type = 13401,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11002, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11002,
                level = 1,
                kind = 41,
                group = 11002,
                group_rule = 1,
                type = 13402,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{2,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11002,
                level = 2,
                kind = 41,
                group = 11002,
                group_rule = 1,
                type = 13402,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{2,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11002,
                level = 3,
                kind = 41,
                group = 11002,
                group_rule = 1,
                type = 13402,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{2,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11002,
                level = 4,
                kind = 41,
                group = 11002,
                group_rule = 1,
                type = 13402,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{2,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11002,
                level = 5,
                kind = 41,
                group = 11002,
                group_rule = 1,
                type = 13402,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{2,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11003, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11003,
                level = 1,
                kind = 41,
                group = 11003,
                group_rule = 1,
                type = 13403,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{3,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11003,
                level = 2,
                kind = 41,
                group = 11003,
                group_rule = 1,
                type = 13403,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{3,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11003,
                level = 3,
                kind = 41,
                group = 11003,
                group_rule = 1,
                type = 13403,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{3,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11003,
                level = 4,
                kind = 41,
                group = 11003,
                group_rule = 1,
                type = 13403,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{3,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11003,
                level = 5,
                kind = 41,
                group = 11003,
                group_rule = 1,
                type = 13403,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{3,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11004, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11004,
                level = 1,
                kind = 41,
                group = 11004,
                group_rule = 1,
                type = 13404,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{4,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11004,
                level = 2,
                kind = 41,
                group = 11004,
                group_rule = 1,
                type = 13404,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{4,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11004,
                level = 3,
                kind = 41,
                group = 11004,
                group_rule = 1,
                type = 13404,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{4,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11004,
                level = 4,
                kind = 41,
                group = 11004,
                group_rule = 1,
                type = 13404,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{4,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11004,
                level = 5,
                kind = 41,
                group = 11004,
                group_rule = 1,
                type = 13404,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{4,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11005, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11005,
                level = 1,
                kind = 41,
                group = 11005,
                group_rule = 1,
                type = 13405,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,120000},{2,120000},{3,120000},{4,120000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11005,
                level = 2,
                kind = 41,
                group = 11005,
                group_rule = 1,
                type = 13405,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,150000},{2,150000},{3,150000},{4,150000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11005,
                level = 3,
                kind = 41,
                group = 11005,
                group_rule = 1,
                type = 13405,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,180000},{2,180000},{3,180000},{4,180000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11005,
                level = 4,
                kind = 41,
                group = 11005,
                group_rule = 1,
                type = 13405,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,220000},{2,220000},{3,220000},{4,220000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11005,
                level = 5,
                kind = 41,
                group = 11005,
                group_rule = 1,
                type = 13405,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [0,0,3000,[{1,250000},{2,250000},{3,250000},{4,250000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11006, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11006,
                level = 1,
                kind = 41,
                group = 11006,
                group_rule = 1,
                type = 13411,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11006,
                level = 2,
                kind = 41,
                group = 11006,
                group_rule = 1,
                type = 13411,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11006,
                level = 3,
                kind = 41,
                group = 11006,
                group_rule = 1,
                type = 13411,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11006,
                level = 4,
                kind = 41,
                group = 11006,
                group_rule = 1,
                type = 13411,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11006,
                level = 5,
                kind = 41,
                group = 11006,
                group_rule = 1,
                type = 13411,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11007, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11007,
                level = 1,
                kind = 41,
                group = 11007,
                group_rule = 1,
                type = 13412,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{2,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11007,
                level = 2,
                kind = 41,
                group = 11007,
                group_rule = 1,
                type = 13412,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{2,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11007,
                level = 3,
                kind = 41,
                group = 11007,
                group_rule = 1,
                type = 13412,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{2,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11007,
                level = 4,
                kind = 41,
                group = 11007,
                group_rule = 1,
                type = 13412,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{2,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11007,
                level = 5,
                kind = 41,
                group = 11007,
                group_rule = 1,
                type = 13412,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{2,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11008, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11008,
                level = 1,
                kind = 41,
                group = 11008,
                group_rule = 1,
                type = 13413,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{3,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11008,
                level = 2,
                kind = 41,
                group = 11008,
                group_rule = 1,
                type = 13413,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{3,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11008,
                level = 3,
                kind = 41,
                group = 11008,
                group_rule = 1,
                type = 13413,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{3,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11008,
                level = 4,
                kind = 41,
                group = 11008,
                group_rule = 1,
                type = 13413,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{3,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11008,
                level = 5,
                kind = 41,
                group = 11008,
                group_rule = 1,
                type = 13413,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{3,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11009, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11009,
                level = 1,
                kind = 41,
                group = 11009,
                group_rule = 1,
                type = 13414,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{4,150000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11009,
                level = 2,
                kind = 41,
                group = 11009,
                group_rule = 1,
                type = 13414,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{4,180000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11009,
                level = 3,
                kind = 41,
                group = 11009,
                group_rule = 1,
                type = 13414,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{4,220000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11009,
                level = 4,
                kind = 41,
                group = 11009,
                group_rule = 1,
                type = 13414,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{4,260000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11009,
                level = 5,
                kind = 41,
                group = 11009,
                group_rule = 1,
                type = 13414,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{4,300000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(11010, Level) ->
    if
        Level =:= 1 ->
            #conf_effect{
                id = 11010,
                level = 1,
                kind = 41,
                group = 11010,
                group_rule = 1,
                type = 13415,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,120000},{2,120000},{3,120000},{4,120000}]],
                remove_act = []
            };
        Level =:= 2 ->
            #conf_effect{
                id = 11010,
                level = 2,
                kind = 41,
                group = 11010,
                group_rule = 1,
                type = 13415,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,150000},{2,150000},{3,150000},{4,150000}]],
                remove_act = []
            };
        Level =:= 3 ->
            #conf_effect{
                id = 11010,
                level = 3,
                kind = 41,
                group = 11010,
                group_rule = 1,
                type = 13415,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,180000},{2,180000},{3,180000},{4,180000}]],
                remove_act = []
            };
        Level =:= 4 ->
            #conf_effect{
                id = 11010,
                level = 4,
                kind = 41,
                group = 11010,
                group_rule = 1,
                type = 13415,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,220000},{2,220000},{3,220000},{4,220000}]],
                remove_act = []
            };
        Level =:= 5 ->
            #conf_effect{
                id = 11010,
                level = 5,
                kind = 41,
                group = 11010,
                group_rule = 1,
                type = 13415,
                type_rule = 1,
                overlay = 0,
                dead_clear = 1,
                to_obj = 0,
                trig_cd = 0,
                duration = 0,
                interval = 0,
                cd = 0,
                conditions = [],
                param = [1,7000,10000,[{1,250000},{2,250000},{3,250000},{4,250000}]],
                remove_act = []
            };
        true ->
            undefined
    end;
get(EffectId, EffectLv) ->
    ?ERROR_FUNC_CALL([EffectId, EffectLv]),
    undefined.
