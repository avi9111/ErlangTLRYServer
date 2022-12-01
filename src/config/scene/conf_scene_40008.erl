%% -*- coding: latin-1 -*-
-module(conf_scene_40008).

-include("scene.hrl").

-export([
    get/0
]).


%% Apis ------------------------------------------------
%% @doc 获取场景配置
get() ->
  #scene{
    id = 40008,
    name = <<"镜湖剿匪">>,
    type = 2,
    role_lmt = 100,
    x = 100,
    y = 180,
    width = 440,
    height = 440,
    mode = [1,2,3,4,5],
    enter_lmt = [{1,40}],
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
