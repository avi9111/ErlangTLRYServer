%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_cook_type
%% @Brief  : 帮派烹饪方式
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_cook_type).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        cost => [{4,10000}],
        funds => 20,
        cont => 100,
        value => 1        
    };
get(2) ->
    #{
        id => 2,
        cost => [{3,500}],
        funds => 100,
        cont => 500,
        value => 3        
    };
get(3) ->
    #{
        id => 3,
        cost => [{2,500}],
        funds => 400,
        cont => 800,
        value => 60        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].
