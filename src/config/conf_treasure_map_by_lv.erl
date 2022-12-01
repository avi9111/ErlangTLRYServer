%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_treasure_map_by_lv
%% @Brief  : 藏宝图等级相关
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_treasure_map_by_lv).

-export([
    get/2
]).

get(Level, 1) when Level =< 35 -> 210001;
get(Level, 2) when Level =< 35 -> 210011;
get(Level, 3) when Level =< 35 -> 2000;
get(Level, 4) when Level =< 35 -> 210021;
get(Level, 5) when Level =< 35 -> {230001,210011};
get(Level, 6) when Level =< 35 -> {231001,231002};
get(Level, 7) when Level =< 35 -> {1100,1150};
get(Level, 1) when Level =< 55 -> 210001;
get(Level, 2) when Level =< 55 -> 210011;
get(Level, 3) when Level =< 55 -> 2000;
get(Level, 4) when Level =< 55 -> 210021;
get(Level, 5) when Level =< 55 -> {230003,210011};
get(Level, 6) when Level =< 55 -> {231003,231004};
get(Level, 7) when Level =< 55 -> {1100,1150};
get(Level, 1) when Level =< 75 -> 210001;
get(Level, 2) when Level =< 75 -> 210011;
get(Level, 3) when Level =< 75 -> 2000;
get(Level, 4) when Level =< 75 -> 210021;
get(Level, 5) when Level =< 75 -> {230005,210011};
get(Level, 6) when Level =< 75 -> {231005,231006};
get(Level, 7) when Level =< 75 -> {1100,1150};
get(Level, 1) when Level =< 999 -> 210001;
get(Level, 2) when Level =< 999 -> 210011;
get(Level, 3) when Level =< 999 -> 2500;
get(Level, 4) when Level =< 999 -> 210021;
get(Level, 5) when Level =< 999 -> {230010,210011};
get(Level, 6) when Level =< 999 -> {231007,231008};
get(Level, 7) when Level =< 999 -> {1100,1150};
get(_Level, _ID) -> undefined.