%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_metall
%% @Brief  : 帮派炼金
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_metall).

-export([
    get/0
]).

get() ->
    #{
        max_lively => 300,
        cost_lively => 30,
        extra_reward => 252001,
        big_ratio => 5    }.
