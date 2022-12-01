%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_convoy_info
%% @Brief  : 运镖信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_convoy_info).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        lv => 1,
        start_scene => 40001,
        start_npc => 2001,
        end_scene => 40002,
        end_npc => 2002,
        robbed_rumor => 10008    };
get(_ID) ->
    undefined.

get_ids() ->
    [1].
