%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽星级配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_star).

-export([
	get_poten_addon/1
]).


%% @doc 获取星级资质提升
%% @spec get_poten_addon(Star) -> Addon.
%% Star = Addon :: integer()
get_poten_addon(1) -> 450;
get_poten_addon(2) -> 1500;
get_poten_addon(3) -> 2650;
get_poten_addon(4) -> 3900;
get_poten_addon(5) -> 5300;
get_poten_addon(6) -> 6850.0000000000009;
get_poten_addon(7) -> 8500;
get_poten_addon(8) -> 10200;
get_poten_addon(9) -> 12430.000000000002;
get_poten_addon(_Star) -> 0.
