%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽孵化星级
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_star_ratio).

-export([
	get/1
]).


%% @doc 获取孵化星级配置
%% @spec get(GrowupLvSum) -> [].
%% GrowupLvSum  :: integer()
get(2) ->
    [{1,2000},{2,2200},{3,2000},{4,2000},{5,1800}];
get(3) ->
    [{1,2000},{2,2200},{3,2000},{4,2000},{5,1800}];
get(4) ->
    [{2,3500},{3,2500},{4,2100},{5,1900}];
get(5) ->
    [{2,3500},{3,2500},{4,2100},{5,1900}];
get(6) ->
    [{2,2400},{3,2600},{4,2100},{5,1600},{6,1300}];
get(7) ->
    [{2,2400},{3,2600},{4,2100},{5,1600},{6,1300}];
get(8) ->
    [{3,3400},{4,2800},{5,2200},{6,1600}];
get(9) ->
    [{3,3400},{4,2800},{5,2200},{6,1600}];
get(10) ->
    [{4,3200},{5,3000},{6,2500},{7,970},{8,300},{9,30}];
get(_GrowupLvSum) ->
    undefined.