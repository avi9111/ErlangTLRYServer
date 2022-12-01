%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_hero_item
%% @Brief  : 培养道具
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_hero_item).

-export([
    get/1,
    get_ids/0,
    cult_exp/1
]).

get(16220001) ->
    #{
        id => 16220001,
        color => 2,
        cult_exp => 10        
    };
get(16220002) ->
    #{
        id => 16220002,
        color => 3,
        cult_exp => 10        
    };
get(16220003) ->
    #{
        id => 16220003,
        color => 4,
        cult_exp => 10        
    };
get(16220004) ->
    #{
        id => 16220004,
        color => 5,
        cult_exp => 10        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [16220001, 16220002, 16220003, 16220004].

cult_exp(16220001) ->
    10;
cult_exp(16220002) ->
    10;
cult_exp(16220003) ->
    10;
cult_exp(16220004) ->
    10;
cult_exp(_ID) ->
    0.
