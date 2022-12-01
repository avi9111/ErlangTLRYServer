%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wine_act
%% @Brief  : 帮会行酒令
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_guild_wine_act).

-export([
    get/0
]).

get() ->
    #{
    	open_lv => 20,
        get_exp_time => 10,
        quiz_time => 5,
        quiz_last_time => 5,
        dice_time => 10,
        dice_last_time => 4,
        comment_time => 14,
        comment_last_time => 1    }.
