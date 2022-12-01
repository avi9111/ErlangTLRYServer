%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      效果配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_effect).

-export([get/2]).

%% Apis ------------------------------------------------
%% @doc 获取效果配置
%% @spec get(EffectId, EffectLv) -> #conf_effect{} | undefined.
%% EffectId = EffectLv  :: integer()
get(EffId, EffLv) ->
    ModId = EffId div 100,
    Mod = eff_mod(ModId),
    Mod:get(EffId, EffLv).


eff_mod(0) -> conf_effect_0;
eff_mod(1) -> conf_effect_1;
eff_mod(10) -> conf_effect_10;
eff_mod(20) -> conf_effect_20;
eff_mod(30) -> conf_effect_30;
eff_mod(40) -> conf_effect_40;
eff_mod(100) -> conf_effect_100;
eff_mod(110) -> conf_effect_110;
eff_mod(111) -> conf_effect_111;
eff_mod(112) -> conf_effect_112;
eff_mod(113) -> conf_effect_113;
eff_mod(200) -> conf_effect_200;
eff_mod(201) -> conf_effect_201;
eff_mod(202) -> conf_effect_202;
eff_mod(210) -> conf_effect_210;
eff_mod(211) -> conf_effect_211;
eff_mod(220) -> conf_effect_220;
eff_mod(230) -> conf_effect_230;
eff_mod(250) -> conf_effect_250;
eff_mod(251) -> conf_effect_251;
eff_mod(260) -> conf_effect_260;
eff_mod(300) -> conf_effect_300;
eff_mod(_ModId) -> conf_effect_0.

