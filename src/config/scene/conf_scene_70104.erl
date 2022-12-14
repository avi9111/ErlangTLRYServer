%% -*- coding: latin-1 -*-
-module(conf_scene_70104).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 70104,
    name = <<"燕王古墓四层">>,
    type = 2,
    role_lmt = 100,
    x = 275,
    y = 229,
    width = 500,
    height = 500,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,75}],
    elem = [],
    npc = [
	],
    mon = [
		[{271401,195,231},{271402,207,211},{271401,177,260},{271401,161,246},{271401,218,244},{271401,184,214},{271402,209,260},{271402,173,231},{271402,212,228},{271402,189,248}],
		[{271403,294,243},{271404,312,254},{271403,311,241},{271403,276,237},{271403,285,230},{271403,284,252},{271404,308,215},{271404,274,218},{271404,290,219},{271404,301,230}],
		[{271405,228,287},{271406,226,298},{271405,229,311},{271405,234,273},{271405,241,306},{271405,242,316},{271406,239,291},{271406,249,278},{271406,257,294},{271406,257,307}],
		[{271407,286,295},{271408,305,308},{271407,317,309},{271407,307,292},{271407,322,296},{271407,287,278},{271408,296,285},{271408,312,278},{271408,290,315},{271408,298,300}]
	],
    coll = [
	],
    jump = [
	],
    door = [
		{11,247,227,{70103,261,227}},
		{22,195,294,{70105,261,227}}
	],
    clear_effects = [],
    switch_mode_lmt = 0,
    murderous_type = 15,
    ban_horse = 0
  }.
