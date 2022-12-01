%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_cook_reward
%% @Brief  : 帮派烹饪奖励
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_cook_reward).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        total => 20,
        reward => 21001        
    };
get(2) ->
    #{
        id => 2,
        total => 40,
        reward => 21002        
    };
get(3) ->
    #{
        id => 3,
        total => 60,
        reward => 21003        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].
