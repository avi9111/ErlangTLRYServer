%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      神兽觉醒配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_god_awaken).

-export([
	get/2,
	max_savvy_lv/2
]).


%% @doc 获取神兽激活配置
%% @spec get(PetCId, Awaken) -> #{}.
%% PetCId = Awaken      :: integer()
get(2001, 1) ->
    #{god_piece => 16280001, piece_num => 50, growup_rate => 1275, potential => {963,2799,1840,1417,1753}, need_savvy_lv => 10};
get(2001, 2) ->
    #{god_piece => 16280001, piece_num => 100, growup_rate => 1728, potential => {1061,3083,2027,1561,1931}, need_savvy_lv => 11};
get(2001, 3) ->
    #{god_piece => 16280001, piece_num => 150, growup_rate => 2038, potential => {1146,3330,2189,1686,2086}, need_savvy_lv => 13};
get(2002, 1) ->
    #{god_piece => 16280002, piece_num => 50, growup_rate => 1728, potential => {2971,1008,2185,1965,1691}, need_savvy_lv => 10};
get(2002, 2) ->
    #{god_piece => 16280002, piece_num => 100, growup_rate => 2038, potential => {3206,1087,2357,2120,1824}, need_savvy_lv => 11};
get(2002, 3) ->
    #{god_piece => 16280002, piece_num => 150, growup_rate => 2388, potential => {3506,1189,2578,2318,1995}, need_savvy_lv => 13};
get(2003, 1) ->
    #{god_piece => 16280003, piece_num => 50, growup_rate => 2038, potential => {2268,2268,3019,2539,1863}, need_savvy_lv => 10};
get(2003, 2) ->
    #{god_piece => 16280003, piece_num => 100, growup_rate => 2388, potential => {2480,2480,3301,2776,2037}, need_savvy_lv => 11};
get(2003, 3) ->
    #{god_piece => 16280003, piece_num => 150, growup_rate => 2388, potential => {2629,2629,3499,2943,2159}, need_savvy_lv => 13};
get(_PetCId, _Awaken) ->
    undefined.


%% @doc 获取神兽最大悟性等级
%% @spec max_savvy_lv(PetCId, Awaken) -> MaxSavvyLv.
%% PetCId = Awaken = MaxSavvyLv     :: integer()
max_savvy_lv(2001, 1) -> 11;
max_savvy_lv(2001, 2) -> 13;
max_savvy_lv(2001, 3) -> 15;
max_savvy_lv(2002, 1) -> 11;
max_savvy_lv(2002, 2) -> 13;
max_savvy_lv(2002, 3) -> 15;
max_savvy_lv(2003, 1) -> 11;
max_savvy_lv(2003, 2) -> 13;
max_savvy_lv(2003, 3) -> 15;
max_savvy_lv(_PetCId, _Awaken) -> 10.
