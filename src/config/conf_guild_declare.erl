%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_declare
%% @Brief  : 帮派宣战
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_declare).

-export([
    get/0
]).

get() ->
    #{
        cost_battle => 5000,
        declare_time => {9,23},
        last_time => 86400,
        guild_lv_diff => 2,
        max_declare_times => 3,
        max_back_times => 3,
        max_battle => 100000    }.
