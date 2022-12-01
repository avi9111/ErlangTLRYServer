%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_jousts_hall_war
%% @Brief  : 演武堂战场
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_jousts_hall_war).

-export([
	get/2,
    get_war_ids/1,
    get_scenes/0,
    get_wars/0,
    get_war_scenes/1,
    get_scene_war/1,
    get_mon_scenes/0
]).

get(1, 1) -> 20006;
get(1, 2) -> 20007;
get(1, 3) -> 20008;
get(1, 4) -> 20009;
get(1, 5) -> 20010;
get(1, 6) -> 20011;
get(1, 7) -> 20012;
get(1, 8) -> 20013;
get(2, 1) -> 20014;
get(2, 2) -> 20015;
get(2, 3) -> 20016;
get(2, 4) -> 20017;
get(3, 1) -> 20018;
get(3, 2) -> 20019;
get(4, 1) -> 20020;
get(_War, _ID) -> undefined.


get_war_ids(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8];
get_war_ids(2) ->
    [1, 2, 3, 4];
get_war_ids(3) ->
    [1, 2];
get_war_ids(4) ->
    [1];
get_war_ids(_) ->
    [].

get_war_scenes(1) ->
    [20006, 20007, 20008, 20009, 20010, 20011, 20012, 20013];
get_war_scenes(2) ->
    [20014, 20015, 20016, 20017];
get_war_scenes(3) ->
    [20018, 20019];
get_war_scenes(4) ->
    [20020];
get_war_scenes(_) ->
    [].

get_scenes() ->
	[20006, 20007, 20008, 20009, 20010, 20011, 20012, 20013, 20014, 20015, 20016, 20017, 20018, 20019, 20020].

get_wars() ->
	[1, 2, 3, 4].

get_scene_war(20006) ->
    1;
get_scene_war(20007) ->
    1;
get_scene_war(20008) ->
    1;
get_scene_war(20009) ->
    1;
get_scene_war(20010) ->
    1;
get_scene_war(20011) ->
    1;
get_scene_war(20012) ->
    1;
get_scene_war(20013) ->
    1;
get_scene_war(20014) ->
    2;
get_scene_war(20015) ->
    2;
get_scene_war(20016) ->
    2;
get_scene_war(20017) ->
    2;
get_scene_war(20018) ->
    3;
get_scene_war(20019) ->
    3;
get_scene_war(20020) ->
    4;
get_scene_war(_SceneId) ->
    undefined.

get_mon_scenes() ->
    [20006,20007,20008,20009,20010,20011,20012,20013,20014,20015,20016,20017,20018,20019].

