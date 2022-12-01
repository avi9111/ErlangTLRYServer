%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_coll
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_coll).

-export([
    get/1,
    get_ids/0
]).

get(4001) ->
    #{
        id => 4001,
        score_basic => 100,
        score_mem => 100,
        coin => 0,
        coin_mem => 0,
        range => 40        
    };
get(4002) ->
    #{
        id => 4002,
        score_basic => 500,
        score_mem => 500,
        coin => 0,
        coin_mem => 0,
        range => 40        
    };
get(4003) ->
    #{
        id => 4003,
        score_basic => 100,
        score_mem => 100,
        coin => 100,
        coin_mem => 100,
        range => 40        
    };
get(4004) ->
    #{
        id => 4004,
        score_basic => 500,
        score_mem => 500,
        coin => 500,
        coin_mem => 500,
        range => 40        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [4001, 4002, 4003, 4004].
