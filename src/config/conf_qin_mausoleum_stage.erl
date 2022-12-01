%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_stage
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_stage).

-export([
    get/1,
    get_ids/0
]).

get({1, 0}) ->
    #{
        index => 1,
        stage => 0,
        name => <<"进入战场">>,
        time => 0,
        span => 0,
        mode => 1,
        num => 0,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 1}) ->
    #{
        index => 1,
        stage => 1,
        name => <<"准备阶段">>,
        time => 0,
        span => 30,
        mode => 1,
        num => 0,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 2}) ->
    #{
        index => 1,
        stage => 2,
        name => <<"切换PK模式">>,
        time => 30,
        span => 60,
        mode => 4,
        num => 0,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 3}) ->
    #{
        index => 1,
        stage => 3,
        name => <<"刷新宝箱">>,
        time => 90,
        span => 90,
        mode => 4,
        num => 8,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 4}) ->
    #{
        index => 1,
        stage => 4,
        name => <<"刷新兵俑">>,
        time => 180,
        span => 120,
        mode => 4,
        num => 6,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 5}) ->
    #{
        index => 1,
        stage => 5,
        name => <<"刷新宝箱">>,
        time => 300,
        span => 120,
        mode => 4,
        num => 8,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 6}) ->
    #{
        index => 1,
        stage => 6,
        name => <<"刷新兵俑">>,
        time => 420,
        span => 180,
        mode => 4,
        num => 6,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 7}) ->
    #{
        index => 1,
        stage => 7,
        name => <<"刷新宝箱">>,
        time => 600,
        span => 120,
        mode => 4,
        num => 8,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 8}) ->
    #{
        index => 1,
        stage => 8,
        name => <<"刷新女妖">>,
        time => 720,
        span => 180,
        mode => 4,
        num => 3,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 9}) ->
    #{
        index => 1,
        stage => 9,
        name => <<"刷新女妖">>,
        time => 900,
        span => 180,
        mode => 4,
        num => 3,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 10}) ->
    #{
        index => 1,
        stage => 10,
        name => <<"刷新女妖">>,
        time => 1080,
        span => 120,
        mode => 4,
        num => 3,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 11}) ->
    #{
        index => 1,
        stage => 11,
        name => <<"刷新大宝箱">>,
        time => 1200,
        span => 120,
        mode => 4,
        num => 1,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 12}) ->
    #{
        index => 1,
        stage => 12,
        name => <<"刷新护卫">>,
        time => 1420,
        span => 180,
        mode => 4,
        num => 2,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 13}) ->
    #{
        index => 1,
        stage => 13,
        name => <<"刷新护卫">>,
        time => 1500,
        span => 180,
        mode => 4,
        num => 2,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 14}) ->
    #{
        index => 1,
        stage => 14,
        name => <<"刷新将领">>,
        time => 1680,
        span => 120,
        mode => 4,
        num => 1,
        mon => [],
        coll => [],
        poses => []
    };
get({1, 15}) ->
    #{
        index => 1,
        stage => 15,
        name => <<"活动结束">>,
        time => 1800,
        span => 0,
        mode => 4,
        num => 0,
        mon => [],
        coll => [],
        poses => []
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{1, 0}, {1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}, {1, 8}, {1, 9}, {1, 10}, {1, 11}, {1, 12}, {1, 13}, {1, 14}, {1, 15}].
