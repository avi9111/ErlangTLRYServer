%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽技能升级
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_skill_upgrade).

-export([
	get/1
]).


%% @doc 获取珍兽技能升级配置
%% @spec get(SkillId) -> #{}.
%% SkillId      :: integer()
get(1) ->
    #{book_num => 2, upgrade_rate => 10000, carry_lv => 0, stone_rate => 0, stone_rate_auto => 0};
get(2) ->
    #{book_num => 5, upgrade_rate => 10000, carry_lv => 0, stone_rate => 0, stone_rate_auto => 0};
get(3) ->
    #{book_num => 10, upgrade_rate => 10000, carry_lv => 0, stone_rate => 0, stone_rate_auto => 0};
get(4) ->
    #{book_num => 15, upgrade_rate => 10000, carry_lv => 0, stone_rate => 0, stone_rate_auto => 0};
get(5) ->
    #{book_num => 0, upgrade_rate => 0, carry_lv => 85, stone_rate => 500, stone_rate_auto => 800};
get(6) ->
    #{book_num => 0, upgrade_rate => 0, carry_lv => 95, stone_rate => 400, stone_rate_auto => 600};
get(7) ->
    #{book_num => 0, upgrade_rate => 0, carry_lv => 0, stone_rate => 0, stone_rate_auto => 0};
get(_Level) ->
    undefined.

