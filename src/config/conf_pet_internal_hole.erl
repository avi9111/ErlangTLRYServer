%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽内丹孔位
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_internal_hole).

-export([
	get/1
]).


%% @doc 获取珍兽内丹孔位要求
%% @spec get(Hole) -> CarryLv.
%% Hole = Material     :: integer()
%% QualityFact          :: float()
get(1) -> 1;
get(2) -> 1;
get(3) -> 1;
get(4) -> 1;
get(5) -> 1;
get(6) -> 1;
get(7) -> 85;
get(8) -> 95;
get(_Hole) -> undefined.
