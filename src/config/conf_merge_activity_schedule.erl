%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_merge_activity_schedule
%% @Brief  : 合服活动时间表
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_merge_activity_schedule).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        act_id => 1001,
        merge_day => 1,
        last_day => 0        
    };
get(2) ->
    #{
        id => 2,
        act_id => 1002,
        merge_day => 1,
        last_day => 0        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2].
