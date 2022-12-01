%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_territory_drum
%% @Brief  : 领地战鼓
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_territory_drum).

-export([
    get/1,
    get_ids/0,
    get_buffs/0
]).

get(1) ->
    #{
        id => 1,
        buff => 21001,
        cost => 500,
        study_id => 2007        
    };
get(2) ->
    #{
        id => 2,
        buff => 21002,
        cost => 500,
        study_id => 0        
    };
get(3) ->
    #{
        id => 3,
        buff => 21003,
        cost => 500,
        study_id => 2010        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].

get_buffs() ->
    [21001, 21002, 21003].
