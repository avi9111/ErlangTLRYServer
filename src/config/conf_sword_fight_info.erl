%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sword_fight_info
%% @Brief  : 华山论剑信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_sword_fight_info).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 40,
        team_min_mem => 3,
        max_match_times => 10,
        match_interval => 180,
        battle_win_prestige => 10,    
        battle_lose_prestige => 1,
        battle_time => 120,
        season_max_times => 32,
        personal_rank_limit => 50,
        team_rank_limit => 300,
        personal_rank_reward => [{1,5,1004},{6,20,1004},{21,50,1004},{51,100,1004}],
        team_rank_reward => [{1,1,1004},{2,2,1004},{3,3,1004},{4,10,1004},{11,50,1004}],
        create_fight_team_cost => {4,500000},
        fight_team_name_limit => {2,6},
        fight_team_lv_stage => [{40,69, 1},{70,79,2},{80,89,3},{90,99,4}],
        match_pool => [{0,10,1},{11,20,2},{21,999,3}],
        battle_scene => 40008,
        lounge_scenes => [{1,40008},{2,11111},{3,22222},{4,33333}]
    }.
