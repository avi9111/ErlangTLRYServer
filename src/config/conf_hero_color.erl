%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_hero_color
%% @Brief  : 英雄品质
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_hero_color).

-export([
    get/1,
    get_ids/0
]).

get(2) ->
    #{
        color => 2,
        item_id => 16220001,
        item_num => 15        
    };
get(3) ->
    #{
        color => 3,
        item_id => 16220002,
        item_num => 30        
    };
get(4) ->
    #{
        color => 4,
        item_id => 16220003,
        item_num => 45        
    };
get(5) ->
    #{
        color => 5,
        item_id => 16220004,
        item_num => 100        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [2, 3, 4, 5].
