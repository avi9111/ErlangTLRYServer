%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_room
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_room).

-export([
    get/1,
    get_div/1,
    get_ids/0,
    get_scene/1,
    get_scenes/0,
    is_prepare/1,
    get_div_scene/1,
    get_scene_div/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"青铜休息室">>,
        scene => 20021,
        min_lv => 1,
        max_lv => 69        
    };
get(2) ->
    #{
        id => 2,
        name => <<"白银休息室">>,
        scene => 20022,
        min_lv => 70,
        max_lv => 79        
    };
get(3) ->
    #{
        id => 3,
        name => <<"黄金休息室">>,
        scene => 20023,
        min_lv => 80,
        max_lv => 89        
    };
get(4) ->
    #{
        id => 4,
        name => <<"钻石休息室">>,
        scene => 20024,
        min_lv => 90,
        max_lv => 99        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4].

get_scenes() ->
    [1, 2, 3, 4].

get_div(Level) when Level >= 1 andalso Level =< 69 ->
    1;
get_div(Level) when Level >= 70 andalso Level =< 79 ->
    2;
get_div(Level) when Level >= 80 andalso Level =< 89 ->
    3;
get_div(Level) when Level >= 90 andalso Level =< 99 ->
    4;
get_div(_ID) ->
    0.

get_scene(Level) when Level >= 1 andalso Level =< 69 ->
    20021;
get_scene(Level) when Level >= 70 andalso Level =< 79 ->
    20022;
get_scene(Level) when Level >= 80 andalso Level =< 89 ->
    20023;
get_scene(Level) when Level >= 90 andalso Level =< 99 ->
    20024;
get_scene(_ID) ->
    0.

get_div_scene(1) ->
    20021;
get_div_scene(2) ->
    20022;
get_div_scene(3) ->
    20023;
get_div_scene(4) ->
    20024;
get_div_scene(_ID) ->
    0.

get_scene_div(20021) ->
    1;
get_scene_div(20022) ->
    2;
get_scene_div(20023) ->
    3;
get_scene_div(20024) ->
    4;
get_scene_div(_ID) ->
    0.

is_prepare(20021) ->
    true;
is_prepare(20022) ->
    true;
is_prepare(20023) ->
    true;
is_prepare(20024) ->
    true;
is_prepare(_ID) ->
    false.
