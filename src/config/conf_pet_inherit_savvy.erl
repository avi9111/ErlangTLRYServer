%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽继承悟性等级
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_inherit_savvy).

-export([
	get_cost/1
]).


%% @doc 获取珍兽继承悟性消耗
%% @spec get_cost(SavvyLv) -> CostNum.
%% SavvyLv = CostNum    :: integer()
get_cost(1) -> 1;
get_cost(2) -> 2;
get_cost(3) -> 3;
get_cost(4) -> 4;
get_cost(5) -> 5;
get_cost(6) -> 6;
get_cost(7) -> 7;
get_cost(8) -> 8;
get_cost(9) -> 9;
get_cost(10) -> 10;
get_cost(11) -> 11;
get_cost(12) -> 12;
get_cost(13) -> 13;
get_cost(14) -> 14;
get_cost(15) -> 15;
get_cost(_SavvyLv) -> undefined.
