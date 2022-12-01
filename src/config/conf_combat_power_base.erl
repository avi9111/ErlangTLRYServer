%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      基础属性战力系数配置表
%% @author      cablsbs
%%----------------------------------

-module(conf_combat_power_base).

-export([
	get/1,
	soul/1
]).


%% @doc 获取基础属性战力系数
%% @spec get(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
get(1) -> 15;
get(2) -> 15;
get(3) -> 15;
get(4) -> 15;
get(5) -> 27;
get(6) -> 87;
get(7) -> 100;
get(8) -> 100;
get(9) -> 40;
get(10) -> 100;
get(_AttrType) -> 0.

%% @doc 获取武魂基础属性战力系数
%% @spec soul(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
soul(1) -> 24;
soul(2) -> 24;
soul(3) -> 24;
soul(4) -> 24;
soul(5) -> 43.2;
soul(6) -> 139.2;
soul(7) -> 160;
soul(8) -> 160;
soul(9) -> 64;
soul(10) -> 160;
soul(_AttrType) -> 0.