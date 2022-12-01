%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_career_battle_info
%% @Brief  : 门派竞技信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_career_battle_info).

-export([
    get/0
]).

get() ->
    #{
        open_lv => 55,
        lounge_scene => 40007,
        battle_scene => 40006,
        stage => [{20,69,1},{70,79,2},{80,89,3},{90,999,4}],
        match_interval => 180,
        battle_time => 120,
        max_battle_times => 10,
        page_capcaity => 13,
        battle_reward => [{1,{{20,131001},{10,131002}}},{2,{{20,131101},{10,131102}}},{3,{{20,131201},{10,131202}}},{4,{{20,131301},{10,131302}}}],
        title_reward => [{1,[{1,133101},{2,133201},{3,133301},{4,133401}]},{2,[{1,133102},{2,133202},{3,133302},{4,133402}]},{3,[{1,133103},{2,133203},{3,133303},{4,133403}]},{4,[{1,133104},{2,133204},{3,133304},{4,133404}]}],
        wait_time => 120,
        show_rank => 30    }.
