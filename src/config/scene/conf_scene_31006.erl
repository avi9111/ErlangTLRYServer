%% -*- coding: latin-1 -*-
-module(conf_scene_31006).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 31006,
    name = <<"无量剑派">>,
    type = 3,
    role_lmt = 100,
    x = 381,
    y = 837,
    width = 600,
    height = 900,
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
