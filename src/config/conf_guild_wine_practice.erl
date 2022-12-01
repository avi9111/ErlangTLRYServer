%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wine_practice
%% @Brief  : 帮派练功
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_guild_wine_practice).

-export([
    get/0
]).

get() ->
    #{
    	open_lv => 20,
        get_exp_time => 2,
        during_time => 120000,
        times => 1,
        team_num => 2,
        area => [{360,435,459}],
        mentor_pos => [{356,432}]
    }.
