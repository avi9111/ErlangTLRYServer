%% -*- coding: latin-1 -*-
-module(conf_scene_40012).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40012,
    name = <<"英雄试炼">>,
    type = 3,
    role_lmt = 100,
    x = 70,
    y = 96,
    width = 160,
    height = 160,
    mode = [1],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
		{4100,80,103}
	],
    mon = [
	],
    coll = [
	],
    jump = [
	],
    door = [
	],
    clear_effects = [],
    switch_mode_lmt = 0,
    murderous_type = 0,
    ban_horse = 0
  }.