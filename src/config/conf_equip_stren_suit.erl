%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_equip_stren_suit
%% @Brief  : 强化大师（套装）
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_equip_stren_suit).

-export([
    get/1,
    get_ids/0,
    get_by_career/1
]).

get({1, Lv}) when Lv >= 90 ->
    #{
        career => 1,
        num => 10,
        lv => 90,
        attr => [{24,374}]
    };
get({2, Lv}) when Lv >= 90 ->
    #{
        career => 2,
        num => 10,
        lv => 90,
        attr => [{22,374}]
    };
get({3, Lv}) when Lv >= 90 ->
    #{
        career => 3,
        num => 10,
        lv => 90,
        attr => [{23,374}]
    };
get({4, Lv}) when Lv >= 90 ->
    #{
        career => 4,
        num => 10,
        lv => 90,
        attr => [{21,374}]
    };
get({1, Lv}) when Lv >= 80 ->
    #{
        career => 1,
        num => 10,
        lv => 80,
        attr => [{103,276}]
    };
get({2, Lv}) when Lv >= 80 ->
    #{
        career => 2,
        num => 10,
        lv => 80,
        attr => [{103,276}]
    };
get({3, Lv}) when Lv >= 80 ->
    #{
        career => 3,
        num => 10,
        lv => 80,
        attr => [{103,276}]
    };
get({4, Lv}) when Lv >= 80 ->
    #{
        career => 4,
        num => 10,
        lv => 80,
        attr => [{103,276}]
    };
get({1, Lv}) when Lv >= 70 ->
    #{
        career => 1,
        num => 10,
        lv => 70,
        attr => [{24,275}]
    };
get({2, Lv}) when Lv >= 70 ->
    #{
        career => 2,
        num => 10,
        lv => 70,
        attr => [{22,275}]
    };
get({3, Lv}) when Lv >= 70 ->
    #{
        career => 3,
        num => 10,
        lv => 70,
        attr => [{23,275}]
    };
get({4, Lv}) when Lv >= 70 ->
    #{
        career => 4,
        num => 10,
        lv => 70,
        attr => [{21,275}]
    };
get({1, Lv}) when Lv >= 60 ->
    #{
        career => 1,
        num => 9,
        lv => 60,
        attr => [{103,218}]
    };
get({2, Lv}) when Lv >= 60 ->
    #{
        career => 2,
        num => 9,
        lv => 60,
        attr => [{103,218}]
    };
get({3, Lv}) when Lv >= 60 ->
    #{
        career => 3,
        num => 9,
        lv => 60,
        attr => [{103,218}]
    };
get({4, Lv}) when Lv >= 60 ->
    #{
        career => 4,
        num => 9,
        lv => 60,
        attr => [{103,218}]
    };
get({1, Lv}) when Lv >= 50 ->
    #{
        career => 1,
        num => 9,
        lv => 50,
        attr => [{107,45}]
    };
get({2, Lv}) when Lv >= 50 ->
    #{
        career => 2,
        num => 9,
        lv => 50,
        attr => [{107,45}]
    };
get({3, Lv}) when Lv >= 50 ->
    #{
        career => 3,
        num => 9,
        lv => 50,
        attr => [{107,45}]
    };
get({4, Lv}) when Lv >= 50 ->
    #{
        career => 4,
        num => 9,
        lv => 50,
        attr => [{107,45}]
    };
get({1, Lv}) when Lv >= 40 ->
    #{
        career => 1,
        num => 9,
        lv => 40,
        attr => [{24,165}]
    };
get({2, Lv}) when Lv >= 40 ->
    #{
        career => 2,
        num => 9,
        lv => 40,
        attr => [{22,165}]
    };
get({3, Lv}) when Lv >= 40 ->
    #{
        career => 3,
        num => 9,
        lv => 40,
        attr => [{23,165}]
    };
get({4, Lv}) when Lv >= 40 ->
    #{
        career => 4,
        num => 9,
        lv => 40,
        attr => [{21,165}]
    };
get({1, Lv}) when Lv >= 30 ->
    #{
        career => 1,
        num => 8,
        lv => 30,
        attr => [{103,109}]
    };
get({2, Lv}) when Lv >= 30 ->
    #{
        career => 2,
        num => 8,
        lv => 30,
        attr => [{103,109}]
    };
get({3, Lv}) when Lv >= 30 ->
    #{
        career => 3,
        num => 8,
        lv => 30,
        attr => [{103,109}]
    };
get({4, Lv}) when Lv >= 30 ->
    #{
        career => 4,
        num => 8,
        lv => 30,
        attr => [{103,109}]
    };
get({1, Lv}) when Lv >= 20 ->
    #{
        career => 1,
        num => 8,
        lv => 20,
        attr => [{24,88}]
    };
get({2, Lv}) when Lv >= 20 ->
    #{
        career => 2,
        num => 8,
        lv => 20,
        attr => [{22,88}]
    };
get({3, Lv}) when Lv >= 20 ->
    #{
        career => 3,
        num => 8,
        lv => 20,
        attr => [{23,88}]
    };
get({4, Lv}) when Lv >= 20 ->
    #{
        career => 4,
        num => 8,
        lv => 20,
        attr => [{21,88}]
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
    [0, 20, 30, 40, 50, 60, 70, 80, 90].

get_by_career(1) ->
    [{1, 0}, {1, 20}, {1, 30}, {1, 40}, {1, 50}, {1, 60}, {1, 70}, {1, 80}, {1, 90}];
get_by_career(2) ->
    [{2, 0}, {2, 20}, {2, 30}, {2, 40}, {2, 50}, {2, 60}, {2, 70}, {2, 80}, {2, 90}];
get_by_career(3) ->
    [{3, 0}, {3, 20}, {3, 30}, {3, 40}, {3, 50}, {3, 60}, {3, 70}, {3, 80}, {3, 90}];
get_by_career(4) ->
    [{4, 0}, {4, 20}, {4, 30}, {4, 40}, {4, 50}, {4, 60}, {4, 70}, {4, 80}, {4, 90}];
get_by_career(_) ->
    [].
