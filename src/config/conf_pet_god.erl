%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      神兽配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_god).

-export([
	active_items/1,
    geffect_id/1
]).


%% @doc 获取神兽激活配置
%% @spec get(PetCId) -> {GodPiece, ActiveNum}.
%% PetCId = GodPiece = ActiveNum    :: integer()
active_items(2001) -> {16280001, 100};
active_items(2002) -> {16280002, 100};
active_items(2003) -> {16280003, 100};
active_items(_PetCId) -> undefined.


%% @doc 获取神兽激活物品效果
%% @spec get(PetCId) -> GoodsEffectId.
%% PetCId = GoodsEffectId   :: integer().
geffect_id(2001) -> 33021001;
geffect_id(2002) -> 33021002;
geffect_id(2003) -> 33021003;
geffect_id(_PetCId) -> undefined.
