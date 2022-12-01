%% -*- coding: latin-1 -*-
-module(conf_scene_60001).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 60001,
    name = <<"创角-天山">>,
    type = 1,
    role_lmt = 100,
    x = 0,
    y = 0,
    width = 800,
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
