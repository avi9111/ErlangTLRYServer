%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽技能
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_skill).

-export([
	get/1
]).


%% @doc 获取珍兽技能配置
%% @spec get(SkillId) -> #{}.
%% SkillId      :: integer()
get(16010001) ->
    #{type => 1, skill_book => 35000001, fit_type => 1};
get(16010002) ->
    #{type => 1, skill_book => 35000002, fit_type => 2};
get(16010003) ->
    #{type => 1, skill_book => 35000003, fit_type => 3};
get(16010004) ->
    #{type => 1, skill_book => 35000004, fit_type => 4};
get(16010005) ->
    #{type => 1, skill_book => 35000005, fit_type => 5};
get(16010006) ->
    #{type => 1, skill_book => 35000006, fit_type => 1};
get(16010007) ->
    #{type => 1, skill_book => 35000007, fit_type => 2};
get(16010008) ->
    #{type => 1, skill_book => 35000008, fit_type => 3};
get(16010009) ->
    #{type => 1, skill_book => 35000009, fit_type => 4};
get(16010010) ->
    #{type => 1, skill_book => 35000010, fit_type => 5};
get(16010011) ->
    #{type => 1, skill_book => 35000011, fit_type => 1};
get(16010012) ->
    #{type => 1, skill_book => 35000012, fit_type => 2};
get(16010013) ->
    #{type => 1, skill_book => 35000013, fit_type => 3};
get(16020001) ->
    #{type => 2, skill_book => 35001001, fit_type => 1};
get(16020002) ->
    #{type => 2, skill_book => 35001002, fit_type => 2};
get(16020003) ->
    #{type => 2, skill_book => 35001003, fit_type => 3};
get(16020004) ->
    #{type => 2, skill_book => 35001004, fit_type => 4};
get(16020005) ->
    #{type => 2, skill_book => 35001005, fit_type => 5};
get(16020006) ->
    #{type => 2, skill_book => 35001006, fit_type => 1};
get(16020007) ->
    #{type => 2, skill_book => 35001007, fit_type => 2};
get(16020008) ->
    #{type => 2, skill_book => 35001008, fit_type => 3};
get(16020009) ->
    #{type => 2, skill_book => 35001009, fit_type => 4};
get(16020010) ->
    #{type => 2, skill_book => 35001010, fit_type => 5};
get(16020011) ->
    #{type => 2, skill_book => 35001011, fit_type => 1};
get(16020012) ->
    #{type => 2, skill_book => 35001012, fit_type => 2};
get(16020013) ->
    #{type => 2, skill_book => 35001013, fit_type => 3};
get(16020014) ->
    #{type => 2, skill_book => 35001014, fit_type => 4};
get(16020015) ->
    #{type => 2, skill_book => 35001015, fit_type => 5};
get(16020016) ->
    #{type => 2, skill_book => 35001016, fit_type => 1};
get(16020017) ->
    #{type => 2, skill_book => 35001017, fit_type => 2};
get(16020018) ->
    #{type => 2, skill_book => 35001018, fit_type => 3};
get(16020019) ->
    #{type => 2, skill_book => 35001019, fit_type => 4};
get(16020020) ->
    #{type => 2, skill_book => 35001020, fit_type => 5};
get(16020021) ->
    #{type => 2, skill_book => 35001021, fit_type => 1};
get(16020022) ->
    #{type => 2, skill_book => 35001022, fit_type => 2};
get(16020023) ->
    #{type => 2, skill_book => 35001023, fit_type => 3};
get(16020024) ->
    #{type => 2, skill_book => 35001024, fit_type => 4};
get(_SkillId) ->
    undefined.

