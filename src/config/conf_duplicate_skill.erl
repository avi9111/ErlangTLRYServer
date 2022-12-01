%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      复刻技能配置表
%% @lastUpdated 2018-10-19 11-13-17
%% @author      cablsbs
%%----------------------------------
-module(conf_duplicate_skill).

-include("log.hrl").

-export([
	get/1
]).


%% Apis ------------------------------------------------
%% @doc 获取复刻技能配置
%% @spec get(SkillId) -> #duplicate_skill{} | undefined.
%% SkillId      :: integer()
get(10040017) ->
    {[{6000,0},{2500,1},{1500,2}], 10041017};
get(SkillId) ->
    ?ERROR_FUNC_CALL(SkillId),
    undefined.
