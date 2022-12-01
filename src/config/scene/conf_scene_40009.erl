%% -*- coding: latin-1 -*-
-module(conf_scene_40009).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40009,
    name = <<"领地休息室">>,
    type = 5,
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
