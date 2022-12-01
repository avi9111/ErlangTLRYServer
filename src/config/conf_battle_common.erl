%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      战斗通用
%% @author      cablsbs
%%----------------------------------
-module(conf_battle_common).

-export([
	get/1
]).


%% @doc 获取战斗通用
%% @spec get(Key) -> Value.
%% Key      :: atom()
%% Value    :: term()
get(jail_murderous) ->
    10;
get(free_murderous) ->
    5;
get(declare_expire) ->
    180000;
get(_Key) ->
    undefined.
