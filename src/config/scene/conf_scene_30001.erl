%% -*- coding: latin-1 -*-
-module(conf_scene_30001).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 30001,
    name = <<"老三环">>,
    type = 3,
    role_lmt = 100,
    x = 40,
    y = 120,
    width = 400,
    height = 400,
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
