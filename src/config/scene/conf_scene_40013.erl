%% -*- coding: latin-1 -*-
-module(conf_scene_40013).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40013,
    name = <<"结婚礼堂">>,
    type = 5,
    role_lmt = 100,
    x = 112,
    y = 194,
    width = 200,
    height = 300,
    mode = [1],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
		{2101,102,227},
		{2102,98,211},
		{2103,93,211},
		{2104,134,218},
		{2105,101,183},
		{2106,101,171},
		{2107,125,183},
		{2108,101,195},
		{2109,125,171},
		{2110,125,195}
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
