%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽孵化成长配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_growup).

-export([
	growup_conf/2,
	get_pay_hatch/2
]).


%% Apis ------------------------------------------------
%% @doc 获取孵化成长配置
%% @spec growup_conf(GrowupId, GrowupLv) -> #{}.
%% GrowupId = GrowupLv   :: integer()
growup_conf(1, 1) ->
    #{growup => 540, upgrade_rate => 6300, upgrade_cost => {16250101,1}};
growup_conf(1, 2) ->
    #{growup => 590, upgrade_rate => 3000, upgrade_cost => {16250101,1}};
growup_conf(1, 3) ->
    #{growup => 621, upgrade_rate => 1600, upgrade_cost => {16250101,1}};
growup_conf(1, 4) ->
    #{growup => 701, upgrade_rate => 800, upgrade_cost => {16250101,1}};
growup_conf(1, 5) ->
    #{growup => 810, upgrade_rate => 0, upgrade_cost => {16250101,1}};
growup_conf(2, 1) ->
    #{growup => 640, upgrade_rate => 6300, upgrade_cost => {16250101,1}};
growup_conf(2, 2) ->
    #{growup => 700, upgrade_rate => 3000, upgrade_cost => {16250101,1}};
growup_conf(2, 3) ->
    #{growup => 736, upgrade_rate => 1600, upgrade_cost => {16250101,1}};
growup_conf(2, 4) ->
    #{growup => 831, upgrade_rate => 800, upgrade_cost => {16250101,1}};
growup_conf(2, 5) ->
    #{growup => 960, upgrade_rate => 0, upgrade_cost => {16250101,1}};
growup_conf(3, 1) ->
    #{growup => 850, upgrade_rate => 6300, upgrade_cost => {16250101,2}};
growup_conf(3, 2) ->
    #{growup => 932, upgrade_rate => 3000, upgrade_cost => {16250101,2}};
growup_conf(3, 3) ->
    #{growup => 975, upgrade_rate => 1600, upgrade_cost => {16250101,2}};
growup_conf(3, 4) ->
    #{growup => 1108, upgrade_rate => 800, upgrade_cost => {16250101,2}};
growup_conf(3, 5) ->
    #{growup => 1275, upgrade_rate => 0, upgrade_cost => {16250101,2}};
growup_conf(4, 1) ->
    #{growup => 1080, upgrade_rate => 6300, upgrade_cost => {16250101,3}};
growup_conf(4, 2) ->
    #{growup => 1190, upgrade_rate => 3000, upgrade_cost => {16250101,3}};
growup_conf(4, 3) ->
    #{growup => 1245, upgrade_rate => 1600, upgrade_cost => {16250101,3}};
growup_conf(4, 4) ->
    #{growup => 1415, upgrade_rate => 800, upgrade_cost => {16250101,3}};
growup_conf(4, 5) ->
    #{growup => 1728, upgrade_rate => 0, upgrade_cost => {16250101,3}};
growup_conf(5, 1) ->
    #{growup => 1245, upgrade_rate => 6300, upgrade_cost => {16250101,4}};
growup_conf(5, 2) ->
    #{growup => 1369, upgrade_rate => 3000, upgrade_cost => {16250101,4}};
growup_conf(5, 3) ->
    #{growup => 1431, upgrade_rate => 1600, upgrade_cost => {16250101,4}};
growup_conf(5, 4) ->
    #{growup => 1618, upgrade_rate => 800, upgrade_cost => {16250101,4}};
growup_conf(5, 5) ->
    #{growup => 2038, upgrade_rate => 0, upgrade_cost => {16250101,4}};
growup_conf(6, 1) ->
    #{growup => 1459, upgrade_rate => 6300, upgrade_cost => {16250101,5}};
growup_conf(6, 2) ->
    #{growup => 1604, upgrade_rate => 3000, upgrade_cost => {16250101,5}};
growup_conf(6, 3) ->
    #{growup => 1677, upgrade_rate => 1600, upgrade_cost => {16250101,5}};
growup_conf(6, 4) ->
    #{growup => 1896, upgrade_rate => 800, upgrade_cost => {16250101,5}};
growup_conf(6, 5) ->
    #{growup => 2388, upgrade_rate => 0, upgrade_cost => {16250101,5}};
growup_conf(7, 1) ->
    #{growup => 1459, upgrade_rate => 6300, upgrade_cost => {16250101,6}};
growup_conf(7, 2) ->
    #{growup => 1604, upgrade_rate => 3000, upgrade_cost => {16250101,6}};
growup_conf(7, 3) ->
    #{growup => 1677, upgrade_rate => 1600, upgrade_cost => {16250101,6}};
growup_conf(7, 4) ->
    #{growup => 1896, upgrade_rate => 800, upgrade_cost => {16250101,6}};
growup_conf(7, 5) ->
    #{growup => 2388, upgrade_rate => 0, upgrade_cost => {16250101,6}};
growup_conf(_GrowupId, _GrowupLv) ->
    undefined.


%% @doc 获取求种孵化消耗配置
%% @spec get_pay_hatch(GrowupId, GrowupLv) -> Assets.
%% GrowupId = GrowupLv   :: integer()
get_pay_hatch(1, 1) ->
    [{2,1000}];
get_pay_hatch(1, 2) ->
    [{2,1000}];
get_pay_hatch(1, 3) ->
    [{2,1000}];
get_pay_hatch(1, 4) ->
    [{2,1000}];
get_pay_hatch(1, 5) ->
    [{2,1000}];
get_pay_hatch(2, 1) ->
    [{2,1000}];
get_pay_hatch(2, 2) ->
    [{2,1000}];
get_pay_hatch(2, 3) ->
    [{2,1000}];
get_pay_hatch(2, 4) ->
    [{2,1000}];
get_pay_hatch(2, 5) ->
    [{2,1000}];
get_pay_hatch(3, 1) ->
    [{2,1000}];
get_pay_hatch(3, 2) ->
    [{2,1000}];
get_pay_hatch(3, 3) ->
    [{2,1000}];
get_pay_hatch(3, 4) ->
    [{2,1000}];
get_pay_hatch(3, 5) ->
    [{2,1000}];
get_pay_hatch(4, 1) ->
    [{2,1000}];
get_pay_hatch(4, 2) ->
    [{2,1000}];
get_pay_hatch(4, 3) ->
    [{2,1000}];
get_pay_hatch(4, 4) ->
    [{2,1000}];
get_pay_hatch(4, 5) ->
    [{2,1000}];
get_pay_hatch(5, 1) ->
    [{2,1000}];
get_pay_hatch(5, 2) ->
    [{2,1000}];
get_pay_hatch(5, 3) ->
    [{2,1000}];
get_pay_hatch(5, 4) ->
    [{2,1000}];
get_pay_hatch(5, 5) ->
    [{2,1000}];
get_pay_hatch(6, 1) ->
    [{2,1000}];
get_pay_hatch(6, 2) ->
    [{2,1000}];
get_pay_hatch(6, 3) ->
    [{2,1000}];
get_pay_hatch(6, 4) ->
    [{2,1000}];
get_pay_hatch(6, 5) ->
    [{2,1000}];
get_pay_hatch(7, 1) ->
    [{2,1000}];
get_pay_hatch(7, 2) ->
    [{2,1000}];
get_pay_hatch(7, 3) ->
    [{2,1000}];
get_pay_hatch(7, 4) ->
    [{2,1000}];
get_pay_hatch(7, 5) ->
    [{2,1000}];
get_pay_hatch(_GrowupId, _GrowupLv) ->
    undefined.
