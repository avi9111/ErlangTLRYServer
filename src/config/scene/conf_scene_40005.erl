%% -*- coding: latin-1 -*-
-module(conf_scene_40005).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40005,
    name = <<"帮会守卫战">>,
    type = 5,
    role_lmt = 100,
    x = 334,
    y = 444,
    width = 600,
    height = 600,
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
