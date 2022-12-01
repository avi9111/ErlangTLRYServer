%% -*- coding: latin-1 -*-
-module(conf_scene_10014).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 10014,
    name = <<"无量剑派（废弃）">>,
    type = 2,
    role_lmt = 100,
    x = 736,
    y = 368,
    width = 1200,
    height = 1200,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
	],
    mon = [
	],
    coll = [
	],
    jump = [
	],
    door = [
		{1,300,184,{10001,437,81}},
		{2,320,185,{10006,379,445}}
	],
    clear_effects = [],
    switch_mode_lmt = 0,
    murderous_type = 15,
    ban_horse = 0
  }.
