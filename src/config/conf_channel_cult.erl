%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_cult
%% @Brief  : 经脉培养
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_cult).

-export([
    get/1,
    get_ids/0,
    get_cost/1,
    get_color/1
]).

get(Pert) when Pert >= 0 andalso Pert =< 1000 ->
    #{
        id => 1,
        color => 1,
        cost => [{16290001,1}]
    };
get(Pert) when Pert >= 1001 andalso Pert =< 2000 ->
    #{
        id => 2,
        color => 2,
        cost => [{16290001,2}]
    };
get(Pert) when Pert >= 2001 andalso Pert =< 3000 ->
    #{
        id => 3,
        color => 3,
        cost => [{16290001,4}]
    };
get(Pert) when Pert >= 3001 andalso Pert =< 4000 ->
    #{
        id => 4,
        color => 3,
        cost => [{16290001,6}]
    };
get(Pert) when Pert >= 4001 andalso Pert =< 5000 ->
    #{
        id => 5,
        color => 4,
        cost => [{16290001,8}]
    };
get(Pert) when Pert >= 5001 andalso Pert =< 6000 ->
    #{
        id => 6,
        color => 4,
        cost => [{16290001,10}]
    };
get(Pert) when Pert >= 6001 andalso Pert =< 8000 ->
    #{
        id => 7,
        color => 5,
        cost => [{16290001,12}]
    };
get(Pert) when Pert >= 8001 andalso Pert =< 10000 ->
    #{
        id => 8,
        color => 5,
        cost => [{16290001,16}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8].

get_cost(Pert) when Pert >= 0 andalso Pert =< 1000 ->
    [{16290001,1}];
get_cost(Pert) when Pert >= 1001 andalso Pert =< 2000 ->
    [{16290001,2}];
get_cost(Pert) when Pert >= 2001 andalso Pert =< 3000 ->
    [{16290001,4}];
get_cost(Pert) when Pert >= 3001 andalso Pert =< 4000 ->
    [{16290001,6}];
get_cost(Pert) when Pert >= 4001 andalso Pert =< 5000 ->
    [{16290001,8}];
get_cost(Pert) when Pert >= 5001 andalso Pert =< 6000 ->
    [{16290001,10}];
get_cost(Pert) when Pert >= 6001 andalso Pert =< 8000 ->
    [{16290001,12}];
get_cost(Pert) when Pert >= 8001 andalso Pert =< 10000 ->
    [{16290001,16}];
get_cost(_ID) ->
    [].

get_color(Pert) when Pert >= 0 andalso Pert =< 1000 ->
    1;
get_color(Pert) when Pert >= 1001 andalso Pert =< 2000 ->
    2;
get_color(Pert) when Pert >= 2001 andalso Pert =< 3000 ->
    3;
get_color(Pert) when Pert >= 3001 andalso Pert =< 4000 ->
    3;
get_color(Pert) when Pert >= 4001 andalso Pert =< 5000 ->
    4;
get_color(Pert) when Pert >= 5001 andalso Pert =< 6000 ->
    4;
get_color(Pert) when Pert >= 6001 andalso Pert =< 8000 ->
    5;
get_color(Pert) when Pert >= 8001 andalso Pert =< 10000 ->
    5;
get_color(_ID) ->
    0.
