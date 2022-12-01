%% -*- coding: latin-1 -*-
-module(conf_scene_11000).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 11000,
    name = <<"监狱">>,
    type = 4,
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
    murderous_type = 2,
    ban_horse = 0
  }.
