%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_liveness_task
%% @Brief  : 帮派活跃任务
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_liveness_task).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        times => 1,
        exp => 30        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1].
