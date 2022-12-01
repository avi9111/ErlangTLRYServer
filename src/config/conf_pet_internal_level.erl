%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽内丹等级
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_internal_level).

-export([
	upgrade_conf/1,
    level_fact/1
]).


%% @doc 获取珍兽内丹升级配置
%% @spec upgrade_conf(DanLv) -> {CostNum, UpgradeRate}.
%% DanLv                    :: integer()
%% CostNum = UpgradeRate    :: integer()
upgrade_conf(1) -> {2, 10000};
upgrade_conf(2) -> {5, 10000};
upgrade_conf(3) -> {10, 10000};
upgrade_conf(4) -> {0, 0};
upgrade_conf(_DanLv) -> undefined.


%% @doc 获取内丹等级系数
%% @spec level_fact(DanLv) -> LevelFact.
%% DanLv        :: integer()
%% LevelFact    :: float()
level_fact(1) -> 0.3;
level_fact(2) -> 0.5;
level_fact(3) -> 0.75;
level_fact(4) -> 1;
level_fact(_DanLv) -> 0.
