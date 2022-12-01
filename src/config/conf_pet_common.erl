%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽通用
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_common).

-export([
	get/1
]).


%% @doc 获取珍兽通用
%% @spec get(Key) -> Value.
%% Key      :: atom()
%% Value    :: term()
get(lucky_star) ->
    7;
get(lucky_growup_lv) ->
    10;
get(lucky_values) ->
    [{5,20},{25,36},{45,54},{65,83},{75,123},{85,193},{95,193}];
get(lucky_limits) ->
    [{5,220},{25,396},{45,594},{65,913},{75,1353},{85,2123},{95,2123}];
get(lucky_star_ratio) ->
    [{7,2500},{8,1200},{9,300}];
get(hatch_npc) ->
    [23];
get(hatch_time) ->
    600;
get(star_range) ->
    [{0,0},{1,3},{4,6},{7,9}];
get(skill_stone) ->
    16250104;
get(carry_pet_num) ->
    10;
get(pet_rarity) ->
    [{2,{0,0}},{3,{1,3}},{4,{4,6}},{5,{7,9}}];
get(init_depot_size) ->
    5;
get(inherit_item) ->
    16250103;
get(pet_attach_level_lmt) ->
    55;
get(savvy_title) ->
    [{0,3,2,""},{4,5,3,"长生"},{6,9,4,"千年"},{10,10,5,"九转"},{11,13,5,"混沌"},{14,15,5,"逆天"}];
get(growup_title) ->
    [{1,2,""},{2,2,"地"},{3,3,"天"},{4,4,"元"},{5,5,"超"}];
get(potential_title) ->
    [{0,94,2,"灵兽"},{94,96,3,"圣兽"},{96,98,4,"仙兽"},{98,999,5,"神兽"}];
get(pet_exp_pill_id) ->
    16110001;
get(pet_exp_item) ->
    16110002;
get(pet_exp_pill_max) ->
    2000000;
get(awaken_npc) ->
    [24];
get(egg_model) ->
    5028;
get(bubble_probability) ->
    1;
get(_Key) ->
    undefined.
