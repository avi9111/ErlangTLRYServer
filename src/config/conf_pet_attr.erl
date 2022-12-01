%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽属性转换配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_attr).

-export([
    get_attr_pairs/0,
	to_bt_attr/5
]).



%% @doc 获取珍兽属性转换对
%% @spec get_attr_pairs() -> Pairs.
%% Pairs                    :: [{BtAttrIdx, BaseAttrIdx}]
%% BtAttrIdx = BaseAttrIdx  :: integer()
get_attr_pairs() ->
    [{1, 3}, {5, 1}, {6, 2}, {7, 3}, {8, 4}, {9, 5}, {10, 5}, {11, 5}, {12, 5}].


%% @doc 珍兽等级、成长率、基础属性转战斗属性
%% @spec to_bt_attr(BtAttrIdx, Level, GrowupRate, BaseAttrVal, Poten) -> BtAttrVal.
%% BtAttrIdx                    :: integer()
%% Level = GrowupRate = Poten   :: integer()
%% BaseAttrVal = BaseAttrVal    :: integer()
to_bt_attr(1, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.125 + BaseAttrVal * Poten * 0.04);
to_bt_attr(5, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0115 + BaseAttrVal * Poten * 0.0084);
to_bt_attr(6, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0115 + BaseAttrVal * Poten * 0.0084);
to_bt_attr(7, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0115 + BaseAttrVal * Poten * 0.00825);
to_bt_attr(8, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0115 + BaseAttrVal * Poten * 0.00825);
to_bt_attr(9, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0163 + BaseAttrVal * Poten * 0.012);
to_bt_attr(10, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0041 + BaseAttrVal * Poten * 0.003);
to_bt_attr(11, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0017 + BaseAttrVal * Poten * 0.00069);
to_bt_attr(12, Level, GrowupRate, BaseAttrVal, Poten) ->
    trunc(Level * GrowupRate * 0.0017 + BaseAttrVal * Poten * 0);
to_bt_attr(_BtAttrIndex, _Level, _GrowupRate, _BaseAttrVal, _Poten) ->
    0.
