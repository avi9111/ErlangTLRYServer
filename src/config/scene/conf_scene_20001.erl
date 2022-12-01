%% -*- coding: latin-1 -*-
-module(conf_scene_20001).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 20001,
    name = <<"竞技场">>,
    type = 6,
    role_lmt = 100,
    x = 70,
    y = 96,
    width = 160,
    height = 160,
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
    switch_mode_lmt = 0,
    murderous_type = 0,
    ban_horse = 0
  }.
