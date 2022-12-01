%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_task
%% @Brief  : 帮派任务
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_task).

-export([
    get/2,
    get_type_ids/1
]).

get(1, 3) ->
    #{
    	id => 3,
        task_scene_info => {10004},
        obj_id => 2003,
        obj_num => 3    };
get(1, 4) ->
    #{
    	id => 4,
        task_scene_info => {10004},
        obj_id => 2004,
        obj_num => 3    };
get(1, 5) ->
    #{
    	id => 5,
        task_scene_info => {10004},
        obj_id => 1205,
        obj_num => 3    };
get(1, 6) ->
    #{
    	id => 6,
        task_scene_info => {10004},
        obj_id => 1206,
        obj_num => 3    };
get(1, 7) ->
    #{
    	id => 7,
        task_scene_info => {10006},
        obj_id => 1207,
        obj_num => 3    };
get(1, 8) ->
    #{
    	id => 8,
        task_scene_info => {10006},
        obj_id => 1208,
        obj_num => 3    };
get(1, 9) ->
    #{
    	id => 9,
        task_scene_info => {10006},
        obj_id => 1209,
        obj_num => 3    };
get(1, 10) ->
    #{
    	id => 10,
        task_scene_info => {10006},
        obj_id => 1210,
        obj_num => 3    };
get(2, 6) ->
    #{
    	id => 6,
        task_scene_info => {10004},
        obj_id => 110105,
        obj_num => 10    };
get(2, 7) ->
    #{
    	id => 7,
        task_scene_info => {10004},
        obj_id => 110106,
        obj_num => 10    };
get(2, 8) ->
    #{
    	id => 8,
        task_scene_info => {10004},
        obj_id => 110107,
        obj_num => 10    };
get(2, 9) ->
    #{
    	id => 9,
        task_scene_info => {10004},
        obj_id => 110108,
        obj_num => 10    };
get(2, 10) ->
    #{
    	id => 10,
        task_scene_info => {10006},
        obj_id => 110201,
        obj_num => 10    };
get(2, 11) ->
    #{
    	id => 11,
        task_scene_info => {10006},
        obj_id => 110204,
        obj_num => 10    };
get(2, 12) ->
    #{
    	id => 12,
        task_scene_info => {10006},
        obj_id => 110205,
        obj_num => 10    };
get(2, 13) ->
    #{
    	id => 13,
        task_scene_info => {10006},
        obj_id => 110206,
        obj_num => 10    };
get(2, 14) ->
    #{
    	id => 14,
        task_scene_info => {10006},
        obj_id => 110207,
        obj_num => 10    };
get(3, 1) ->
    #{
    	id => 1,
        task_scene_info => {},
        obj_id => 0,
        obj_num => 1    };
get(3, 2) ->
    #{
    	id => 2,
        task_scene_info => {},
        obj_id => 0,
        obj_num => 1    };
get(3, 3) ->
    #{
    	id => 3,
        task_scene_info => {},
        obj_id => 0,
        obj_num => 1    };
get(3, 4) ->
    #{
    	id => 4,
        task_scene_info => {},
        obj_id => 0,
        obj_num => 1    };
get(3, 5) ->
    #{
    	id => 5,
        task_scene_info => {},
        obj_id => 0,
        obj_num => 1    };
get(4, 1) ->
    #{
    	id => 1,
        task_scene_info => {40011},
        obj_id => 1003,
        obj_num => 1    };
get(4, 2) ->
    #{
    	id => 2,
        task_scene_info => {40011},
        obj_id => 1004,
        obj_num => 1    };
get(4, 3) ->
    #{
    	id => 3,
        task_scene_info => {40011},
        obj_id => 1005,
        obj_num => 1    };
get(4, 4) ->
    #{
    	id => 4,
        task_scene_info => {40011},
        obj_id => 1006,
        obj_num => 1    };
get(4, 5) ->
    #{
    	id => 5,
        task_scene_info => {40011},
        obj_id => 1007,
        obj_num => 1    };
get(4, 6) ->
    #{
    	id => 6,
        task_scene_info => {40011},
        obj_id => 1008,
        obj_num => 1    };
get(4, 7) ->
    #{
    	id => 7,
        task_scene_info => {40011},
        obj_id => 1009,
        obj_num => 1    };
get(4, 8) ->
    #{
    	id => 8,
        task_scene_info => {40011},
        obj_id => 1010,
        obj_num => 1    };
get(4, 9) ->
    #{
    	id => 9,
        task_scene_info => {40011},
        obj_id => 1011,
        obj_num => 1    };
get(4, 10) ->
    #{
    	id => 10,
        task_scene_info => {40011},
        obj_id => 1012,
        obj_num => 1    };
get(4, 11) ->
    #{
    	id => 11,
        task_scene_info => {40011},
        obj_id => 1013,
        obj_num => 1    };
get(5, 1) ->
    #{
    	id => 1,
        task_scene_info => {},
        obj_id => 16340002,
        obj_num => 1    };
get(5, 2) ->
    #{
    	id => 2,
        task_scene_info => {},
        obj_id => 16340003,
        obj_num => 1    };
get(5, 3) ->
    #{
    	id => 3,
        task_scene_info => {},
        obj_id => 16340004,
        obj_num => 1    };
get(5, 4) ->
    #{
    	id => 4,
        task_scene_info => {},
        obj_id => 16340005,
        obj_num => 1    };
get(5, 5) ->
    #{
    	id => 5,
        task_scene_info => {},
        obj_id => 16340006,
        obj_num => 1    };
get(5, 6) ->
    #{
    	id => 6,
        task_scene_info => {},
        obj_id => 16340007,
        obj_num => 1    };
get(5, 7) ->
    #{
    	id => 7,
        task_scene_info => {},
        obj_id => 16340008,
        obj_num => 1    };
get(5, 8) ->
    #{
    	id => 8,
        task_scene_info => {},
        obj_id => 16350001,
        obj_num => 1    };
get(5, 9) ->
    #{
    	id => 9,
        task_scene_info => {},
        obj_id => 16350002,
        obj_num => 1    };
get(5, 10) ->
    #{
    	id => 10,
        task_scene_info => {},
        obj_id => 16350003,
        obj_num => 1    };
get(5, 11) ->
    #{
    	id => 11,
        task_scene_info => {},
        obj_id => 16350004,
        obj_num => 1    };
get(_Type, _ID) ->
    undefined.

get_type_ids(1) ->
    [3, 4, 5, 6, 7, 8, 9, 10];
get_type_ids(2) ->
    [6, 7, 8, 9, 10, 11, 12, 13, 14];
get_type_ids(3) ->
    [1, 2, 3, 4, 5];
get_type_ids(4) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
get_type_ids(5) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
get_type_ids(_) ->
    [].