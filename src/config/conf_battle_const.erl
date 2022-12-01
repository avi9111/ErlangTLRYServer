%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      战斗常数
%% @author      cablsbs
%%----------------------------------
-module(conf_battle_const).

-export([
	get_secure/0,
	get_battle_klv/3
]).


%% Apis ------------------------------------------------
%% @doc 读取保底配置
%% @spec get_secure() -> #{}.
get_secure() ->
    #{ hit => 4000, crit => 5500, resist => 0, aoe => 10000, penetrate_cirt => 6000, cure_crit => 4000}.


%% @doc 获取klv
%% @spec get_battle_klv(ObjType, AtkType, Level) -> #{}.
%% ObjType = AtkType = Level    :: integer()
get_battle_klv(2, AtkType, Level) ->
    conf_battle_const_role:get_battle_klv(AtkType, Level);
get_battle_klv(_ObjType, AtkType, Level) ->
    conf_battle_const_pet:get_battle_klv(AtkType, Level).
