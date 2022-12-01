%% -*- coding: latin-1 -*-
-module(conf_scene_10007).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 10007,
    name = <<"秦皇地宫">>,
    type = 2,
    role_lmt = 100,
    x = 378,
    y = 152,
    width = 500,
    height = 500,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,30}],
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
    murderous_type = 15,
    ban_horse = 0
  }.
