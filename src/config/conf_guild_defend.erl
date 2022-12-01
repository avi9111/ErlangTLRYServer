%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_defend
%% @Brief  : 帮派守卫战
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_defend).

-export([
    get/0
]).

get() ->
    #{
        guild_lv => 1,
        scene_id => 40005,
        guild_funds => 100000,
        rank => 100,
        lv => 20,
        wave => 36,
        refresh_interval => 120,
        tripod_nearly_dist => 30,
        hurt_ratio => [{1,10000},{2,10000},{3,10000},{4,10000}],
        cure_ratio => [{1,10000},{2,10000},{3,10000},{4,10000}]
    }.
