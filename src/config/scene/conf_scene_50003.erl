%% -*- coding: latin-1 -*-
-module(conf_scene_50003).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 50003,
    name = <<"武林禁地">>,
    type = 5,
    role_lmt = 100,
    x = 260,
    y = 144,
    width = 540,
    height = 540,
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
