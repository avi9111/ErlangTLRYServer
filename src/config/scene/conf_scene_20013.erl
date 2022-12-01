%% -*- coding: latin-1 -*-
-module(conf_scene_20013).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 20013,
    name = <<"惊门战场">>,
    type = 5,
    role_lmt = 100,
    x = 158,
    y = 152,
    width = 300,
    height = 300,
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
    switch_mode_lmt = 1,
    murderous_type = 0,
    ban_horse = 0
  }.
