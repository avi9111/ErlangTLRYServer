%% -*- coding: latin-1 -*-
-module(conf_scene_71001).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 71001,
    name = <<"藏宝洞">>,
    type = 3,
    role_lmt = 100,
    x = 196,
    y = 294,
    width = 500,
    height = 500,
    mode = [1],
    enter_lmt = [{1,20}],
    elem = [],
    npc = [
	],
    mon = [
	],
    coll = [
		{1201,256,222}
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
