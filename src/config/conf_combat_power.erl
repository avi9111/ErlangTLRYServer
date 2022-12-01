%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      战力系数配置表
%% @lastUpdated 2018-11-05 16-42-12
%% @author      cablsbs
%%----------------------------------

-module(conf_combat_power).

-export([
	get/1
]).


%% @doc 获取属性战力系数
%% @spec get(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
get(1) -> 0.5;
get(2) -> 0;
get(3) -> 0;
get(4) -> 0;
get(5) -> 5;
get(6) -> 5;
get(7) -> 0;
get(8) -> 0;
get(9) -> 15;
get(10) -> 15;
get(11) -> 15;
get(12) -> 15;
get(13) -> 5;
get(14) -> 5;
get(15) -> 0;
get(16) -> 0;
get(17) -> 0;
get(18) -> 0;
get(19) -> 0;
get(20) -> 0;
get(21) -> 0;
get(22) -> 0;
get(23) -> 0;
get(24) -> 0;
get(_AttrType) -> 0.
