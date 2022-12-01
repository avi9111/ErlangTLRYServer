%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_lucky_rotary
%% @Brief  : 幸运转盘
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_lucky_rotary).

-export([
    get/2,
    get_ids/1
]).

get(1, 1) ->
    #{
    	id => 1,
        drop_id => 2101,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 2) ->
    #{
    	id => 2,
        drop_id => 2102,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 3) ->
    #{
    	id => 3,
        drop_id => 2103,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 4) ->
    #{
    	id => 4,
        drop_id => 2104,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 5) ->
    #{
    	id => 5,
        drop_id => 2201,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 6) ->
    #{
    	id => 6,
        drop_id => 2202,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 7) ->
    #{
    	id => 7,
        drop_id => 2203,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 8) ->
    #{
    	id => 8,
        drop_id => 2204,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(1, 9) ->
    #{
    	id => 9,
        drop_id => 2301,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(1, 10) ->
    #{
    	id => 10,
        drop_id => 2302,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(1, 11) ->
    #{
    	id => 11,
        drop_id => 2303,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(1, 12) ->
    #{
    	id => 12,
        drop_id => 2304,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(2, 1) ->
    #{
    	id => 1,
        drop_id => 2101,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 2) ->
    #{
    	id => 2,
        drop_id => 2102,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 3) ->
    #{
    	id => 3,
        drop_id => 2103,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 4) ->
    #{
    	id => 4,
        drop_id => 2104,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 5) ->
    #{
    	id => 5,
        drop_id => 2201,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 6) ->
    #{
    	id => 6,
        drop_id => 2202,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 7) ->
    #{
    	id => 7,
        drop_id => 2203,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 8) ->
    #{
    	id => 8,
        drop_id => 2204,
        bgold_weight => 1000,
        gold_weight => 1000,
        min_times => 0,
        max_times => 0,
        is_rumor => 0,
        is_rare => 0    };
get(2, 9) ->
    #{
    	id => 9,
        drop_id => 2301,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(2, 10) ->
    #{
    	id => 10,
        drop_id => 2302,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(2, 11) ->
    #{
    	id => 11,
        drop_id => 2303,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(2, 12) ->
    #{
    	id => 12,
        drop_id => 2304,
        bgold_weight => 0,
        gold_weight => 10,
        min_times => 10,
        max_times => 20,
        is_rumor => 1,
        is_rare => 1    };
get(_Index, _ID) ->
    undefined.

get_ids(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
get_ids(2) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
get_ids(_) ->
    [].