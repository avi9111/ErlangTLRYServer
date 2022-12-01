%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      怪物配置表
%% @author      cablsbs
%%----------------------------------
-module(conf_mon).

-export([get/1]).

get(MonId) ->
    ModId = MonId div 10000,
    Mod = mon_mod(ModId),
    Mod:get(MonId).


mon_mod(0) -> conf_mon_0;
mon_mod(1) -> conf_mon_1;
mon_mod(11) -> conf_mon_11;
mon_mod(12) -> conf_mon_12;
mon_mod(13) -> conf_mon_13;
mon_mod(14) -> conf_mon_14;
mon_mod(15) -> conf_mon_15;
mon_mod(16) -> conf_mon_16;
mon_mod(17) -> conf_mon_17;
mon_mod(18) -> conf_mon_18;
mon_mod(19) -> conf_mon_19;
mon_mod(192) -> conf_mon_192;
mon_mod(20) -> conf_mon_20;
mon_mod(21) -> conf_mon_21;
mon_mod(22) -> conf_mon_22;
mon_mod(23) -> conf_mon_23;
mon_mod(24) -> conf_mon_24;
mon_mod(25) -> conf_mon_25;
mon_mod(26) -> conf_mon_26;
mon_mod(27) -> conf_mon_27;
mon_mod(28) -> conf_mon_28;
mon_mod(29) -> conf_mon_29;
mon_mod(30) -> conf_mon_30;
mon_mod(31) -> conf_mon_31;
mon_mod(50) -> conf_mon_50;
mon_mod(90) -> conf_mon_90;
mon_mod(100) -> conf_mon_100;
mon_mod(_ModId) -> conf_mon_0.

