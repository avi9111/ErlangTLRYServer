%% -*- coding: latin-1 -*-
-module(conf_scene_30012).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 30012,
    name = <<"英雄燕子坞">>,
    type = 3,
    role_lmt = 100,
    x = 360,
    y = 190,
    width = 640,
    height = 640,
    mode = [1],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
	],
    mon = [
	],
    coll = [
	],
    jump = [
		{{298,188},{224,231}},
		{{224,231},{298,188}},
		{{274,310},{431,404}},
		{{431,404},{274,310}}
	],
    door = [
	],
    clear_effects = [],
    switch_mode_lmt = 0,
    murderous_type = 0,
    ban_horse = 0
  }.
