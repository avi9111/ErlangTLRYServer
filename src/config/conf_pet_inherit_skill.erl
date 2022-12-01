%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽继承技能
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_inherit_skill).

-export([
	get_cost/1
]).


%% @doc 获取珍兽继承悟性消耗
%% @spec get_cost(SkillLv) -> CostNum.
%% SkillLv = CostNum    :: integer()
get_cost(1) -> 1;
get_cost(2) -> 1.5;
get_cost(3) -> 1.75;
get_cost(4) -> 2;
get_cost(5) -> 2.5;
get_cost(6) -> 3;
get_cost(7) -> 4;
get_cost(_SkillLv) -> undefined.
