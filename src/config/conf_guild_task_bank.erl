%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_task_bank
%% @Brief  : 帮派每日任务库
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_task_bank).

-export([
    get/2
]).

get(Level, 1) when Level =< 40 -> [3,4,5,6];
get(Level, 2) when Level =< 40 -> [6,7,8,9];
get(Level, 4) when Level =< 24 -> [1,2];
get(Level, 4) when Level =< 44 -> [1,2,3,4,5];
get(Level, 4) when Level =< 64 -> [1,2,3,4,5,6,7,8];
get(Level, 1) when Level =< 999 -> [3,4,5,6,7,8,9,10];
get(Level, 2) when Level =< 999 -> [6,7,8,9,10,11,12,13,14];
get(Level, 3) when Level =< 999 -> [1,2,3,4,5];
get(Level, 4) when Level =< 999 -> [1,2,3,4,5,6,7,8,9,10,11];
get(Level, 5) when Level =< 999 -> [1,2,3,4,5,6,7,8,9,10,11];
get(_Level, _Type) -> undefined.