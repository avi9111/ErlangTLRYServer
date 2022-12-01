%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_equip_stone_suit
%% @Brief  : 宝石套装
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_equip_stone_suit).

-export([
    get/1,
    get_ids/0,
    get_by_career/1
]).

get({1, Lv}) when Lv >= 7 ->
    #{
        career => 1,
        num => 10,
        lv => 7,
        attr => [{24,596}]
    };
get({2, Lv}) when Lv >= 7 ->
    #{
        career => 2,
        num => 10,
        lv => 7,
        attr => [{22,596}]
    };
get({3, Lv}) when Lv >= 7 ->
    #{
        career => 3,
        num => 10,
        lv => 7,
        attr => [{23,596}]
    };
get({4, Lv}) when Lv >= 7 ->
    #{
        career => 4,
        num => 10,
        lv => 7,
        attr => [{21,596}]
    };
get({1, Lv}) when Lv >= 6 ->
    #{
        career => 1,
        num => 10,
        lv => 6,
        attr => [{1,34160}]
    };
get({2, Lv}) when Lv >= 6 ->
    #{
        career => 2,
        num => 10,
        lv => 6,
        attr => [{1,34160}]
    };
get({3, Lv}) when Lv >= 6 ->
    #{
        career => 3,
        num => 10,
        lv => 6,
        attr => [{1,34160}]
    };
get({4, Lv}) when Lv >= 6 ->
    #{
        career => 4,
        num => 10,
        lv => 6,
        attr => [{1,34160}]
    };
get({1, Lv}) when Lv >= 5 ->
    #{
        career => 1,
        num => 9,
        lv => 5,
        attr => [{24,542}]
    };
get({2, Lv}) when Lv >= 5 ->
    #{
        career => 2,
        num => 9,
        lv => 5,
        attr => [{22,542}]
    };
get({3, Lv}) when Lv >= 5 ->
    #{
        career => 3,
        num => 9,
        lv => 5,
        attr => [{23,542}]
    };
get({4, Lv}) when Lv >= 5 ->
    #{
        career => 4,
        num => 9,
        lv => 5,
        attr => [{21,542}]
    };
get({1, Lv}) when Lv >= 4 ->
    #{
        career => 1,
        num => 9,
        lv => 4,
        attr => [{108,45}]
    };
get({2, Lv}) when Lv >= 4 ->
    #{
        career => 2,
        num => 9,
        lv => 4,
        attr => [{108,45}]
    };
get({3, Lv}) when Lv >= 4 ->
    #{
        career => 3,
        num => 9,
        lv => 4,
        attr => [{108,45}]
    };
get({4, Lv}) when Lv >= 4 ->
    #{
        career => 4,
        num => 9,
        lv => 4,
        attr => [{108,45}]
    };
get({1, Lv}) when Lv >= 3 ->
    #{
        career => 1,
        num => 8,
        lv => 3,
        attr => [{1,16266}]
    };
get({2, Lv}) when Lv >= 3 ->
    #{
        career => 2,
        num => 8,
        lv => 3,
        attr => [{1,16266}]
    };
get({3, Lv}) when Lv >= 3 ->
    #{
        career => 3,
        num => 8,
        lv => 3,
        attr => [{1,16266}]
    };
get({4, Lv}) when Lv >= 3 ->
    #{
        career => 4,
        num => 8,
        lv => 3,
        attr => [{1,16266}]
    };
get({1, Lv}) when Lv >= 2 ->
    #{
        career => 1,
        num => 8,
        lv => 2,
        attr => [{24,135}]
    };
get({2, Lv}) when Lv >= 2 ->
    #{
        career => 2,
        num => 8,
        lv => 2,
        attr => [{22,135}]
    };
get({3, Lv}) when Lv >= 2 ->
    #{
        career => 3,
        num => 8,
        lv => 2,
        attr => [{23,135}]
    };
get({4, Lv}) when Lv >= 2 ->
    #{
        career => 4,
        num => 8,
        lv => 2,
        attr => [{21,135}]
    };
get({1, Lv}) when Lv >= 1 ->
    #{
        career => 1,
        num => 8,
        lv => 1,
        attr => [{1,4880}]
    };
get({2, Lv}) when Lv >= 1 ->
    #{
        career => 2,
        num => 8,
        lv => 1,
        attr => [{1,4880}]
    };
get({3, Lv}) when Lv >= 1 ->
    #{
        career => 3,
        num => 8,
        lv => 1,
        attr => [{1,4880}]
    };
get({4, Lv}) when Lv >= 1 ->
    #{
        career => 4,
        num => 8,
        lv => 1,
        attr => [{1,4880}]
    };
get({1, Lv}) when Lv >= 0 ->
    #{
        career => 1,
        num => 8,
        lv => 0,
        attr => [{1,0}]
    };
get({2, Lv}) when Lv >= 0 ->
    #{
        career => 2,
        num => 8,
        lv => 0,
        attr => [{1,0}]
    };
get({3, Lv}) when Lv >= 0 ->
    #{
        career => 3,
        num => 8,
        lv => 0,
        attr => [{1,0}]
    };
get({4, Lv}) when Lv >= 0 ->
    #{
        career => 4,
        num => 8,
        lv => 0,
        attr => [{1,0}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{1, 0}, {1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}, {2, 0}, {2, 1}, {2, 2}, {2, 3}, {2, 4}, {2, 5}, {2, 6}, {2, 7}, {3, 0}, {3, 1}, {3, 2}, {3, 3}, {3, 4}, {3, 5}, {3, 6}, {3, 7}, {4, 0}, {4, 1}, {4, 2}, {4, 3}, {4, 4}, {4, 5}, {4, 6}, {4, 7}].

get_by_career(1) ->
    [{1, 0}, {1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {1, 6}, {1, 7}];
get_by_career(2) ->
    [{2, 0}, {2, 1}, {2, 2}, {2, 3}, {2, 4}, {2, 5}, {2, 6}, {2, 7}];
get_by_career(3) ->
    [{3, 0}, {3, 1}, {3, 2}, {3, 3}, {3, 4}, {3, 5}, {3, 6}, {3, 7}];
get_by_career(4) ->
    [{4, 0}, {4, 1}, {4, 2}, {4, 3}, {4, 4}, {4, 5}, {4, 6}, {4, 7}];
get_by_career(_) ->
    [].
