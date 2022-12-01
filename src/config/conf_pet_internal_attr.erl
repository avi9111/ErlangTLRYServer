%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽内丹属性计算
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_internal_attr).

-export([
    get_attr_ids/0,
	to_bt_attr/6
]).



%% @doc 获取珍兽属性转换对
%% @spec get_attr_ids() -> [Index].
%% Index    :: integer()
get_attr_ids() ->
    [21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 1, 9, 10, 11].


%% @doc 珍兽等级、成长率、基础属性转战斗属性
%% @spec to_bt_attr(BtAttrIdx, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) -> BtAttrVal.
%% BtAttrIdx = GrowupRate = Level   :: integer()
%% Potens                           :: {} of 5 elem
%% DanLvFact = DanQualityFact       :: float()
%% BtAttrVal                        :: integer()
to_bt_attr(21, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0006 + max(element(1, Potens), element(2, Potens)) * 0.000675) * Level * DanLvFact * DanQualityFact);
to_bt_attr(22, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0006 + max(element(1, Potens), element(2, Potens)) * 0.000675) * Level * DanLvFact * DanQualityFact);
to_bt_attr(23, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0006 + max(element(1, Potens), element(2, Potens)) * 0.000675) * Level * DanLvFact * DanQualityFact);
to_bt_attr(24, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0006 + max(element(1, Potens), element(2, Potens)) * 0.000675) * Level * DanLvFact * DanQualityFact);
to_bt_attr(25, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + element(3, Potens) * 0.0002) * Level * DanLvFact * DanQualityFact);
to_bt_attr(26, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + element(3, Potens) * 0.0002) * Level * DanLvFact * DanQualityFact);
to_bt_attr(27, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + element(3, Potens) * 0.0002) * Level * DanLvFact * DanQualityFact);
to_bt_attr(28, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + element(3, Potens) * 0.0002) * Level * DanLvFact * DanQualityFact);
to_bt_attr(29, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + max(element(1, Potens), element(2, Potens)) * 0.00018) * Level * DanLvFact * DanQualityFact);
to_bt_attr(30, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + max(element(1, Potens), element(2, Potens)) * 0.00018) * Level * DanLvFact * DanQualityFact);
to_bt_attr(31, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + max(element(1, Potens), element(2, Potens)) * 0.00018) * Level * DanLvFact * DanQualityFact);
to_bt_attr(32, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00016 + max(element(1, Potens), element(2, Potens)) * 0.00018) * Level * DanLvFact * DanQualityFact);
to_bt_attr(1, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0448 + element(3, Potens) * 0.036) * Level * DanLvFact * DanQualityFact);
to_bt_attr(9, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.00521 + element(5, Potens) * 0.003) * Level * DanLvFact * DanQualityFact);
to_bt_attr(10, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.0013 + element(5, Potens) * 0.00075) * Level * DanLvFact * DanQualityFact);
to_bt_attr(11, GrowupRate, Potens, Level, DanLvFact, DanQualityFact) ->
    trunc((GrowupRate * 0.001 + element(5, Potens) * 0.00058) * Level * DanLvFact * DanQualityFact);
to_bt_attr(_BtAttrIndex, _GrowupRate, _Potens, _Level, _DanLvFact, _DanQualityFact) ->
    0.
