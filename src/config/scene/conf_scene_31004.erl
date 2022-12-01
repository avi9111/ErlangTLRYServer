%% -*- coding: latin-1 -*-
-module(conf_scene_31004).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 31004,
    name = <<"无量剑派">>,
    type = 3,
    role_lmt = 100,
    x = 480,
    y = 590,
    width = 600,
    height = 1000,
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
	],
    door = [
	],
    clear_effects = [],
    switch_mode_lmt = 0,
    murderous_type = 0,
    ban_horse = 0
  }.
