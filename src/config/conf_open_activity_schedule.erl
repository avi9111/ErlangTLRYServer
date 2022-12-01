%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_open_activity_schedule
%% @Brief  : 开服活动时间表
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_open_activity_schedule).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        act_id => 2016,
        open_day => 1,
        last_day => 7        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1].
