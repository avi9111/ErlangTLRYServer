%% -*- coding: latin-1 -*-
-module(conf_scene_40007).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40007,
    name = <<"门派竞技休息室">>,
    type = 10,
    role_lmt = 100,
    x = 100,
    y = 106,
    width = 200,
    height = 200,
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
