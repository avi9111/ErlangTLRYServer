%% -*- coding: latin-1 -*-
-module(conf_scene_30014).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 30014,
    name = <<"英雄缥缈峰">>,
    type = 3,
    role_lmt = 100,
    x = 290,
    y = 140,
    width = 560,
    height = 560,
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
