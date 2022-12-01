%% -*- coding: latin-1 -*-
-module(conf_scene_11001).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 11001,
    name = <<"地府">>,
    type = 4,
    role_lmt = 100,
    x = 380,
    y = 454,
    width = 800,
    height = 900,
    mode = [1],
    enter_lmt = [{1,1}],
    elem = [],
    npc = [
		{1131,381,438}
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
