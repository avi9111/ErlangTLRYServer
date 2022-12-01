%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽属性辅助技能
%% @author      cablsbs
%%----------------------------------
-module(conf_skill_attr_assist).

-export([
	get/2
]).


%% @doc 获取辅助效果
%% @spec get(SkillId, SkillLv) -> {CostHpRate, TransferType, TransferFact}.
%% SkillId = SkillLv        :: integer()
%% CostHp = TransferType    :: integer()
%% TransferFact             :: float()
get(16010003, 1) ->
    {1000, 1, 1};
get(16010003, 2) ->
    {1000, 1, 2};
get(16010003, 3) ->
    {1000, 1, 2.8};
get(16010003, 4) ->
    {1000, 1, 3.6};
get(16010003, 5) ->
    {1000, 1, 4.4};
get(16010003, 6) ->
    {1000, 1, 5.2};
get(16010003, 7) ->
    {1000, 1, 6};
get(16010008, 1) ->
    {1000, 2, 0.75};
get(16010008, 2) ->
    {1000, 2, 1};
get(16010008, 3) ->
    {1000, 2, 1.5};
get(16010008, 4) ->
    {1000, 2, 2};
get(16010008, 5) ->
    {1000, 2, 2.5};
get(16010008, 6) ->
    {1000, 2, 3};
get(16010008, 7) ->
    {1000, 2, 3.5};
get(_SkillId, _SkillLv) ->
    undefined.
