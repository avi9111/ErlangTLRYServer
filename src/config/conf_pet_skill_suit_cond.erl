%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽技能套装条件
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_skill_suit_cond).

-export([
	get/1
]).


%% @doc 获取珍兽技能套装条件
%% @spec get(SuitLv) -> {Num, Lv}.
%% SuitLv   :: integer()
%% Num = Lv :: integer()
get(1) -> {4, 1};
get(2) -> {4, 2};
get(3) -> {4, 3};
get(4) -> {4, 4};
get(5) -> {4, 5};
get(6) -> {5, 5};
get(7) -> {6, 5};
get(_SuitLv) -> undefined.
