%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_territory_bonus
%% @Brief  : 领地分成
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_territory_bonus).

-export([
    get/1,
    get_ids/0,
    get_ratio/1
]).

get(1) ->
    #{
        id => 1,
        low => 1,
        high => 1,
        ratio => 1.5        
    };
get(2) ->
    #{
        id => 2,
        low => 2,
        high => 2,
        ratio => 1.35        
    };
get(3) ->
    #{
        id => 3,
        low => 3,
        high => 3,
        ratio => 1.2        
    };
get(4) ->
    #{
        id => 4,
        low => 4,
        high => 10,
        ratio => 1        
    };
get(5) ->
    #{
        id => 5,
        low => 11,
        high => 20,
        ratio => 0.7        
    };
get(6) ->
    #{
        id => 6,
        low => 21,
        high => 40,
        ratio => 0.5        
    };
get(7) ->
    #{
        id => 7,
        low => 41,
        high => 999,
        ratio => 0.4        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7].

get_ratio(Rank) when Rank >= 1 andalso Rank =< 1 ->
   1.5;
get_ratio(Rank) when Rank >= 2 andalso Rank =< 2 ->
   1.35;
get_ratio(Rank) when Rank >= 3 andalso Rank =< 3 ->
   1.2;
get_ratio(Rank) when Rank >= 4 andalso Rank =< 10 ->
   1;
get_ratio(Rank) when Rank >= 11 andalso Rank =< 20 ->
   0.7;
get_ratio(Rank) when Rank >= 21 andalso Rank =< 40 ->
   0.5;
get_ratio(Rank) when Rank >= 41 andalso Rank =< 999 ->
   0.4;
get_ratio(_Rank) ->
    0.
