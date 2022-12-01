%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      战斗属性相关配置表
%% @author      cablsbs
%%----------------------------------

-module(conf_combat_power_battle).

-export([
	get/1,
	pet/1,
	soul/1,
	pet_attach/1
]).


%% @doc 获取战斗属性战力系数
%% @spec get(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
get(1) -> 0.1667;
get(2) -> 0;
get(3) -> 0;
get(4) -> 0;
get(5) -> 2.7;
get(6) -> 2.7;
get(7) -> 2.7;
get(8) -> 2.7;
get(9) -> 2;
get(10) -> 8.2;
get(11) -> 10.6;
get(12) -> 20;
get(13) -> 0;
get(14) -> 0;
get(15) -> 0;
get(16) -> 0;
get(17) -> 0;
get(18) -> 0;
get(19) -> 0;
get(20) -> 0;
get(21) -> 10;
get(22) -> 10;
get(23) -> 10;
get(24) -> 10;
get(25) -> 25;
get(26) -> 25;
get(27) -> 25;
get(28) -> 25;
get(29) -> 25;
get(30) -> 25;
get(31) -> 25;
get(32) -> 25;
get(33) -> 100;
get(34) -> 100;
get(35) -> 100;
get(36) -> 100;
get(37) -> 10;
get(38) -> 10;
get(39) -> 10;
get(40) -> 10;
get(41) -> 0;
get(42) -> 0;
get(43) -> 1.1;
get(44) -> 1.1;
get(45) -> 4.8;
get(46) -> 4.8;
get(47) -> 0;
get(48) -> 0;
get(49) -> 0;
get(50) -> 10;
get(51) -> 10;
get(52) -> 10;
get(53) -> 10;
get(54) -> 0;
get(55) -> 0;
get(56) -> 0;
get(57) -> 0;
get(58) -> 0;
get(59) -> 0;
get(60) -> 0;
get(61) -> 0;
get(62) -> 0;
get(63) -> 0;
get(64) -> 0;
get(65) -> 0;
get(_AttrType) -> 0.


%% @doc 获取珍兽战斗属性战力系数
%% @spec pet(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
pet(1) -> 0.067;
pet(2) -> 0;
pet(3) -> 0;
pet(4) -> 0;
pet(5) -> 1.08;
pet(6) -> 1.08;
pet(7) -> 1.08;
pet(8) -> 1.08;
pet(9) -> 0.8;
pet(10) -> 3.28;
pet(11) -> 4.24;
pet(12) -> 8;
pet(13) -> 0;
pet(14) -> 0;
pet(15) -> 0;
pet(16) -> 0;
pet(17) -> 0;
pet(18) -> 0;
pet(19) -> 0;
pet(20) -> 0;
pet(21) -> 4;
pet(22) -> 4;
pet(23) -> 4;
pet(24) -> 4;
pet(25) -> 10;
pet(26) -> 10;
pet(27) -> 10;
pet(28) -> 10;
pet(29) -> 10;
pet(30) -> 10;
pet(31) -> 10;
pet(32) -> 10;
pet(33) -> 40;
pet(34) -> 40;
pet(35) -> 40;
pet(36) -> 40;
pet(37) -> 4;
pet(38) -> 4;
pet(39) -> 4;
pet(40) -> 4;
pet(41) -> 0;
pet(42) -> 0;
pet(43) -> 0;
pet(44) -> 0;
pet(45) -> 0;
pet(46) -> 0;
pet(47) -> 0;
pet(48) -> 0;
pet(49) -> 0;
pet(50) -> 4;
pet(51) -> 4;
pet(52) -> 4;
pet(53) -> 4;
pet(54) -> 0;
pet(55) -> 0;
pet(56) -> 0;
pet(57) -> 0;
pet(58) -> 0;
pet(59) -> 0;
pet(60) -> 0;
pet(61) -> 0;
pet(62) -> 0;
pet(63) -> 0;
pet(64) -> 0;
pet(65) -> 0;
pet(_AttrType) -> 0.

%% @doc 获取武魂战斗属性战力系数
%% @spec soul(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
soul(1) -> 0.271721;
soul(2) -> 0;
soul(3) -> 0;
soul(4) -> 0;
soul(5) -> 4.401;
soul(6) -> 4.401;
soul(7) -> 4.401;
soul(8) -> 4.401;
soul(9) -> 3.26;
soul(10) -> 13.366;
soul(11) -> 17.278;
soul(12) -> 32.6;
soul(13) -> 0;
soul(14) -> 0;
soul(15) -> 0;
soul(16) -> 0;
soul(17) -> 0;
soul(18) -> 0;
soul(19) -> 0;
soul(20) -> 0;
soul(21) -> 16.3;
soul(22) -> 16.3;
soul(23) -> 16.3;
soul(24) -> 16.3;
soul(25) -> 40.75;
soul(26) -> 40.75;
soul(27) -> 40.75;
soul(28) -> 40.75;
soul(29) -> 40.75;
soul(30) -> 40.75;
soul(31) -> 40.75;
soul(32) -> 40.75;
soul(33) -> 163;
soul(34) -> 163;
soul(35) -> 163;
soul(36) -> 163;
soul(37) -> 16.3;
soul(38) -> 16.3;
soul(39) -> 16.3;
soul(40) -> 16.3;
soul(41) -> 0;
soul(42) -> 0;
soul(43) -> 1.793;
soul(44) -> 1.793;
soul(45) -> 7.824;
soul(46) -> 7.824;
soul(47) -> 0;
soul(48) -> 0;
soul(49) -> 0;
soul(50) -> 16.3;
soul(51) -> 16.3;
soul(52) -> 16.3;
soul(53) -> 16.3;
soul(54) -> 0;
soul(55) -> 0;
soul(56) -> 0;
soul(57) -> 0;
soul(58) -> 0;
soul(59) -> 0;
soul(60) -> 0;
soul(61) -> 0;
soul(62) -> 0;
soul(63) -> 0;
soul(64) -> 0;
soul(65) -> 0;
soul(_AttrType) -> 0.

%% @doc 获取珍兽附体战斗属性战力系数
%% @spec pet_attach(AttrType) -> CombatX.
%% AttrType     :: integer()
%% CombatX      :: number()
pet_attach(1) -> 0.46676;
pet_attach(2) -> 0;
pet_attach(3) -> 0;
pet_attach(4) -> 0;
pet_attach(5) -> 7.56;
pet_attach(6) -> 7.56;
pet_attach(7) -> 7.56;
pet_attach(8) -> 7.56;
pet_attach(9) -> 5.6;
pet_attach(10) -> 22.96;
pet_attach(11) -> 29.68;
pet_attach(12) -> 56;
pet_attach(13) -> 0;
pet_attach(14) -> 0;
pet_attach(15) -> 0;
pet_attach(16) -> 0;
pet_attach(17) -> 0;
pet_attach(18) -> 0;
pet_attach(19) -> 0;
pet_attach(20) -> 0;
pet_attach(21) -> 28;
pet_attach(22) -> 28;
pet_attach(23) -> 28;
pet_attach(24) -> 28;
pet_attach(25) -> 70;
pet_attach(26) -> 70;
pet_attach(27) -> 70;
pet_attach(28) -> 70;
pet_attach(29) -> 70;
pet_attach(30) -> 70;
pet_attach(31) -> 70;
pet_attach(32) -> 70;
pet_attach(33) -> 280;
pet_attach(34) -> 280;
pet_attach(35) -> 280;
pet_attach(36) -> 280;
pet_attach(37) -> 28;
pet_attach(38) -> 28;
pet_attach(39) -> 28;
pet_attach(40) -> 28;
pet_attach(41) -> 0;
pet_attach(42) -> 0;
pet_attach(43) -> 0;
pet_attach(44) -> 0;
pet_attach(45) -> 0;
pet_attach(46) -> 0;
pet_attach(47) -> 0;
pet_attach(48) -> 0;
pet_attach(49) -> 0;
pet_attach(50) -> 28;
pet_attach(51) -> 28;
pet_attach(52) -> 28;
pet_attach(53) -> 28;
pet_attach(54) -> 0;
pet_attach(55) -> 0;
pet_attach(56) -> 0;
pet_attach(57) -> 0;
pet_attach(58) -> 0;
pet_attach(59) -> 0;
pet_attach(60) -> 0;
pet_attach(61) -> 0;
pet_attach(62) -> 0;
pet_attach(63) -> 0;
pet_attach(64) -> 0;
pet_attach(65) -> 0;
pet_attach(_AttrType) -> 0.
