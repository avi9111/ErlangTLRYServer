%% -*- coding: latin-1 -*-
-module(conf_scene_20003).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 20003,
    name = <<"宋辽战场">>,
    type = 105,
    role_lmt = 100,
    x = 244,
    y = 432,
    width = 500,
    height = 500,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
	],
    mon = [
		[{1001,238,418},{1001,252,418}],
		[{1002,234,257},{1002,255,257}]
	],
    coll = [
	],
    jump = [
	],
    door = [
	],
    clear_effects = [],
    switch_mode_lmt = 1,
    murderous_type = 0,
    ban_horse = 0
  }.
