%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_kf_daily_charge
%% @Brief  : 开服累计充值
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_kf_daily_charge).

-export([
    get/2,
    get_ids/1
]).

get(1, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2101    };
get(1, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2102    };
get(1, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2103    };
get(2, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2201    };
get(2, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2202    };
get(2, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2203    };
get(3, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2301    };
get(3, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2302    };
get(3, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2303    };
get(4, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2401    };
get(4, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2402    };
get(4, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2403    };
get(5, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2501    };
get(5, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2502    };
get(5, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2503    };
get(6, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2601    };
get(6, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2602    };
get(6, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2603    };
get(7, 1) ->
    #{
        need_rmb => 10,
        drop_id => 2701    };
get(7, 2) ->
    #{
        need_rmb => 20,
        drop_id => 2702    };
get(7, 3) ->
    #{
        need_rmb => 30,
        drop_id => 2703    };
get(_Day, _ID) ->
    undefined.

get_ids(1) ->
    [1, 2, 3];
get_ids(2) ->
    [1, 2, 3];
get_ids(3) ->
    [1, 2, 3];
get_ids(4) ->
    [1, 2, 3];
get_ids(5) ->
    [1, 2, 3];
get_ids(6) ->
    [1, 2, 3];
get_ids(7) ->
    [1, 2, 3];
get_ids(_) ->
    [].