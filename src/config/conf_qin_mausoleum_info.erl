%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_info
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_info).

-export([
    get/1,
    get_act/1,
    get_ids/0,
    get_index/1
]).

get(1) ->
    #{
        index => 1,
        name => <<"秦皇陵">>,
        npc => 0,
        min_num => 1,
        fix_mem => 20,
        room_mem => {80,85},
        item => 16010001,
        act_id => 6002,
        score => 50,
        coin_ex => 0,
        evil_val => 0,
        evil_kill => 3,
        evil_time => 0,
        evil_clear => 0,
        evil_effect => 0,
        win_rumor => 30007,
        cont_kill_cd => 60,
        settle_mail => 2901,
        prepare_time => 10,
        battle_scene => 20025        
    };
get(2) ->
    #{
        index => 2,
        name => <<"巅峰秦皇陵">>,
        npc => 0,
        min_num => 1,
        fix_mem => 20,
        room_mem => {80,85},
        item => 16010001,
        act_id => 6003,
        score => 50,
        coin_ex => 10,
        evil_val => 1,
        evil_kill => 3,
        evil_time => 30,
        evil_clear => 10,
        evil_effect => 30029,
        win_rumor => 30007,
        cont_kill_cd => 60,
        settle_mail => 2902,
        prepare_time => 10,
        battle_scene => 20025        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2].

get_act(1) ->
    6002;
get_act(2) ->
    6003;
get_act(_ID) ->
    0.

get_index(6002) ->
    1;
get_index(6003) ->
    2;
get_index(_ID) ->
    0.
