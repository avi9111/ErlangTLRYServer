%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_equip_pos
%% @Brief  : 经脉装备
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_equip_pos).

-export([
    get/1,
    get_ids/0,
    get_by_pos/1,
    get_by_type/1
]).

get(31) ->
    #{
        pos => 31,
        type => 1        
    };
get(32) ->
    #{
        pos => 32,
        type => 2        
    };
get(33) ->
    #{
        pos => 33,
        type => 3        
    };
get(34) ->
    #{
        pos => 34,
        type => 4        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [31, 32, 33, 34].

get_by_pos(31) ->
    1;
get_by_pos(32) ->
    2;
get_by_pos(33) ->
    3;
get_by_pos(34) ->
    4;
get_by_pos(_ID) ->
    undefined.

get_by_type(1) ->
    31;
get_by_type(2) ->
    32;
get_by_type(3) ->
    33;
get_by_type(4) ->
    34;
get_by_type(_ID) ->
    undefined.
