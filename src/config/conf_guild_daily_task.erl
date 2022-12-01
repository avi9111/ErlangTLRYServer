%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_daily_task
%% @Brief  : 领地任务
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_daily_task).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        round => 30,
        born_list => [{60,88},{77,88},{79,110},{60,110}],
        scene => 40001,
        one_key_cost => 120,
        reset_cost => 120,
        max_reset => 1,
        reset_vip => 4,
        type => 1    };
get(2) ->
    #{
        id => 2,
        round => 30,
        born_list => [{60,88},{77,88},{79,110},{60,110}],
        scene => 40001,
        one_key_cost => 120,
        reset_cost => 120,
        max_reset => 1,
        reset_vip => 4,
        type => 2    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2].
