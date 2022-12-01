%% -*- coding: latin-1 -*-
-module(conf_scene_40010).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40010,
    name = <<"领地战">>,
    type = 5,
    role_lmt = 100,
    x = 224,
    y = 354,
    width = 500,
    height = 500,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
	],
    mon = [
		[{1001,306,268},{1001,306,247},{1001,314,242},{1001,330,241}],
		[{1002,140,268},{1002,140,247},{1002,134,243},{1002,117,243}]
	],
    coll = [
		{1005,225,355}
	],
    jump = [
	],
    door = [
	],
    clear_effects = [21001,21002,21003],
    switch_mode_lmt = 0,
    murderous_type = 0,
    ban_horse = 0
  }.
