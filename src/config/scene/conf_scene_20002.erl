%% -*- coding: latin-1 -*-
-module(conf_scene_20002).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 20002,
    name = <<"领地战">>,
    type = 2,
    role_lmt = 100,
    x = 94,
    y = 168,
    width = 300,
    height = 300,
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
	],
    clear_effects = [],
    switch_mode_lmt = 1,
    murderous_type = 0,
    ban_horse = 0
  }.
