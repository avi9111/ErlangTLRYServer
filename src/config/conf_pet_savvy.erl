%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽悟性
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_savvy).

-export([
	upgrade_conf/1,
	get_poten_addon/1,
	get_skill_grids/1
]).


%% @doc 获取提升悟性配置
%% @spec upgrade_conf(SavvyLv) -> {Cost, Ratio, FailDownTo}.
%% Savvy = Ratio = FailDownTo   :: integer()
%% Cost                         :: {ItemId :: integer(), Num :: integer()}
upgrade_conf(0) ->
    {[{16250102,1}], 10000, 0};
upgrade_conf(1) ->
    {[{16250102,2}], 8000, 1};
upgrade_conf(2) ->
    {[{16250102,3}], 8000, 1};
upgrade_conf(3) ->
    {[{16250102,4}], 8000, 1};
upgrade_conf(4) ->
    {[{16250102,5}], 5000, 4};
upgrade_conf(5) ->
    {[{16250102,6}], 4000, 4};
upgrade_conf(6) ->
    {[{16250102,7}], 3000, 4};
upgrade_conf(7) ->
    {[{16250102,8}], 2000, 7};
upgrade_conf(8) ->
    {[{16250102,9}], 2000, 7};
upgrade_conf(9) ->
    {[{16250102,10}], 2000, 9};
upgrade_conf(10) ->
    {[{16250102,11}], 1000, 10};
upgrade_conf(11) ->
    {[{16250102,12}], 500, 11};
upgrade_conf(12) ->
    {[{16250102,13}], 500, 12};
upgrade_conf(13) ->
    {[{16250102,14}], 400, 13};
upgrade_conf(14) ->
    {[{16250102,15}], 300, 14};
upgrade_conf(15) ->
    {[{16250102,16}], 0, 15};
upgrade_conf(_SavvyLv) ->
    undefined.


%% @doc 获取悟性资质配置
%% @spec get_poten_addon(SavvyLv) -> Addon.
%% SavvyLv = Addon    :: integer()
get_poten_addon(0) -> 0;
get_poten_addon(1) -> 150;
get_poten_addon(2) -> 250;
get_poten_addon(3) -> 400;
get_poten_addon(4) -> 600;
get_poten_addon(5) -> 1000;
get_poten_addon(6) -> 1450;
get_poten_addon(7) -> 2350;
get_poten_addon(8) -> 3000;
get_poten_addon(9) -> 3850;
get_poten_addon(10) -> 4650;
get_poten_addon(11) -> 5150;
get_poten_addon(12) -> 5649.9999999999991;
get_poten_addon(13) -> 6200;
get_poten_addon(14) -> 6750;
get_poten_addon(15) -> 7350;
get_poten_addon(_SavvyLv) -> 0.


%% @doc 获取可用技能格子
%% @spec get_skill_grids(SavvyLv) -> Grids.
%% SavvyLv = Grids    :: integer()
get_skill_grids(0) -> 4;
get_skill_grids(1) -> 4;
get_skill_grids(2) -> 4;
get_skill_grids(3) -> 4;
get_skill_grids(4) -> 5;
get_skill_grids(5) -> 5;
get_skill_grids(6) -> 5;
get_skill_grids(7) -> 6;
get_skill_grids(8) -> 6;
get_skill_grids(9) -> 6;
get_skill_grids(10) -> 7;
get_skill_grids(11) -> 7;
get_skill_grids(12) -> 7;
get_skill_grids(13) -> 7;
get_skill_grids(14) -> 7;
get_skill_grids(15) -> 8;
get_skill_grids(_SavvyLv) -> 0.
