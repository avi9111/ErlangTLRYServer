%% -*- coding: latin-1 -*-
-module(conf_scene_40002).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40002,
    name = <<"运镖地图">>,
    type = 2,
    role_lmt = 100,
    x = 152,
    y = 108,
    width = 500,
    height = 500,
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
