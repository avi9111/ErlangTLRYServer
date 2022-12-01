%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      运镖通用
%% @author      cablsbs
%%----------------------------------
-module(conf_guild_carry_common).

-export([
	get/1
]).


%% @doc 获取运镖通用
%% @spec get(Key) -> Value.
%% Key      :: atom()
%% Value    :: term()
get(refresh_cost) ->
    15;
get(onekey_refresh_cost) ->
    120;
get(onekey_refresh_item) ->
    16310101;
get(refresh_ratio) ->
    [{1,50},{2,30},{3,20},{4,10}];
get(quality_ratio) ->
    [{1,70},{2,30},{3,0},{4,0}];
get(carry_times) ->
    3;
get(rob_times) ->
    3;
get(carry_npc) ->
    2001;
get(line_ratio) ->
    [{1,20},{2,20}];
get(carry_expire) ->
    1800;
get(parade_npc) ->
    1;
get(parade_line) ->
    3;
get(parade_quality) ->
    5;
get(_Key) ->
    undefined.
