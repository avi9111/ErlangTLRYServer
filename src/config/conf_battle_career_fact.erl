%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      职业战斗系数
%% @author      cablsbs
%%----------------------------------
-module(conf_battle_career_fact).

-export([
	get_attr_factor/1,
	get_atk_factor/3,
	get_hit_rate/1,
	get_dodge/1,
    get_crit/1,
    get_penetrate_crit/1,
    get_cure/1,
    get_harm/1
]).


%% Apis ------------------------------------------------
%% @doc 获取属性伤害系数
%% @spec get_attr_factor(Career) -> {IceFactor, FireFactor, DarkFactor, PoisonFactor}.
%% Career   :: integer()
%% Factor   :: number()
get_attr_factor(1) -> {1, 1, 1, 1.5};
get_attr_factor(2) -> {1, 1.5, 1, 1};
get_attr_factor(3) -> {1, 1, 1.5, 1};
get_attr_factor(4) -> {1.5, 1, 1, 1};
get_attr_factor(_Career) -> {1, 1, 1, 1}.


%% @doc 获取内外功伤害系数
%% @spec get_atk_factor(Career, AtkType, ALevel) -> {InnerFact, OuterFact}.
%% Career = AtkType = ALevel    :: integer()
%% Factor                       :: number()
get_atk_factor(0, AtkType, ALevel) -> conf_battle_const_pet:get_atk_factor(AtkType, ALevel);
get_atk_factor(1, _AtkType, _ALevel) -> {1, 0.2};
get_atk_factor(2, _AtkType, _ALevel) -> {0.2, 1};
get_atk_factor(3, _AtkType, _ALevel) -> {1, 0.2};
get_atk_factor(4, _AtkType, _ALevel) -> {0.2, 1};
get_atk_factor(_Career, _AtkType, _ALevel) -> {0.6, 0.6}.


%% @doc 获取基础命中率
%% @spec get_hit_rate(Career) -> HitRate.
%% Career   :: integer()
%% HitRate  :: number()
get_hit_rate(1) -> 0;
get_hit_rate(2) -> 1000;
get_hit_rate(3) -> 0;
get_hit_rate(4) -> 0;
get_hit_rate(_Career) -> 500.


%% @doc 获取基础闪避
%% @spec get_dodge(Career) -> {DodgeFactor, DodgeRate}.
%% Career                   :: integer()
%% DodgeFactor = DodgeRate  :: number()
get_dodge(1) -> {1.6, 1000};
get_dodge(2) -> {1.6, 0};
get_dodge(3) -> {1.6, 0};
get_dodge(4) -> {1.6, 0};
get_dodge(_Career) -> {1.6, 500}.


%% @doc 获取基础暴击配置
%% @spec get_crit(Career) -> {CritHurtAdd, CritRate}.
%% Career                   :: integer()
%% CritHurtAdd = CritRate   :: number()
get_crit(1) -> {10000, 0};
get_crit(2) -> {10000, 0};
get_crit(3) -> {10000, 0};
get_crit(4) -> {10000, 1000};
get_crit(_Career) -> {10000, 1000}.


%% @doc 获取基础穿刺暴击配置
%% @spec get_penetrate_crit(Career) -> {PCritHurtAdd, PCritRate}.
%% Career                   :: integer()
%% PCritHurtAdd = PCritRate :: number()
get_penetrate_crit(1) -> {10000, 0};
get_penetrate_crit(2) -> {10000, 0};
get_penetrate_crit(3) -> {10000, 0};
get_penetrate_crit(4) -> {10000, 1000};
get_penetrate_crit(_Career) -> {10000, 1000}.


%% @doc 获取治疗配置
%% @spec get_cure(Career) -> #{}.
%% Career                       :: integer()
get_cure(1) ->
    #{cure_fact => 1, attr_cure_fact => 1, basic_crit_cure_addon => 4000, active_cure_fact => 1, passive_cure_fact => 1};
get_cure(2) ->
    #{cure_fact => 1, attr_cure_fact => 1, basic_crit_cure_addon => 4000, active_cure_fact => 1, passive_cure_fact => 1};
get_cure(3) ->
    #{cure_fact => 1, attr_cure_fact => 1, basic_crit_cure_addon => 4000, active_cure_fact => 1, passive_cure_fact => 1};
get_cure(4) ->
    #{cure_fact => 1, attr_cure_fact => 1, basic_crit_cure_addon => 4000, active_cure_fact => 1, passive_cure_fact => 1};
get_cure(_Career) ->
    #{cure_fact => 1, attr_cure_fact => 1, basic_crit_cure_addon => 4000, active_cure_fact => 1, passive_cure_fact => 1}.


%% @doc 获取伤害配置
%% @spec get_harm(Career) -> #{}.
%% Career                       :: integer()
get_harm(1) ->
    #{active_harm_fact => 1, passive_harm_fact => 1};
get_harm(2) ->
    #{active_harm_fact => 1, passive_harm_fact => 1};
get_harm(3) ->
    #{active_harm_fact => 1, passive_harm_fact => 1};
get_harm(4) ->
    #{active_harm_fact => 1, passive_harm_fact => 1};
get_harm(_Career) ->
    #{active_harm_fact => 1, passive_harm_fact => 1}.
