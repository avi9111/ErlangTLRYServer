%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽被动技能
%% @author      cablsbs
%%----------------------------------
-module(conf_skill_passive).

-export([
	is_passive/1
]).


%% @doc 是否珍兽被动技能
%% @spec is_passive(SkillId) -> boolean().
%% SkillId  :: integer()
is_passive(16020011) -> true;
is_passive(16020014) -> true;
is_passive(16020015) -> true;
is_passive(16020016) -> true;
is_passive(16020017) -> true;
is_passive(16020018) -> true;
is_passive(16020019) -> true;
is_passive(16020020) -> true;
is_passive(16020021) -> true;
is_passive(16020022) -> true;
is_passive(16020023) -> true;
is_passive(_SkillId) -> false.
