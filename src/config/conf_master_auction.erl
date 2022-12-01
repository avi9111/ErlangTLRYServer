%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_master_auction).
-author("Ryuu").

-export([
    get/1,
    get_ids/0
]).

get({WorldLv, Rank}) when WorldLv >= 21 andalso Rank >= 1 andalso Rank =< 1 ->
    #{
        id => 6,
        low => 1,
        high => 1,
        group => [{1,[{1,10000}]},{2,[{1,5000},{2,5000}]},{3,[{2,5000},{3,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 21 andalso Rank >= 2 andalso Rank =< 2 ->
    #{
        id => 7,
        low => 2,
        high => 2,
        group => [{1,[{0,5000},{1,5000}]},{2,[{1,10000}]},{3,[{2,5000},{3,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 21 andalso Rank >= 3 andalso Rank =< 3 ->
    #{
        id => 8,
        low => 3,
        high => 3,
        group => [{1,[{0,8000},{1,2000}]},{2,[{0,5000},{1,5000}]},{3,[{2,10000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 21 andalso Rank >= 4 andalso Rank =< 10 ->
    #{
        id => 9,
        low => 4,
        high => 10,
        group => [{1,[{0,9900},{1,100}]},{2,[{0,8000},{1,2000}]},{3,[{1,5000},{2,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 21 andalso Rank >= 11 andalso Rank =< 9999 ->
    #{
        id => 10,
        low => 11,
        high => 9999,
        group => [{3,[{1,10000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 1 andalso Rank >= 1 andalso Rank =< 1 ->
    #{
        id => 1,
        low => 1,
        high => 1,
        group => [{1,[{1,10000}]},{2,[{1,5000},{2,5000}]},{3,[{2,5000},{3,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 1 andalso Rank >= 2 andalso Rank =< 2 ->
    #{
        id => 2,
        low => 2,
        high => 2,
        group => [{1,[{0,5000},{1,5000}]},{2,[{1,10000}]},{3,[{2,5000},{3,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 1 andalso Rank >= 3 andalso Rank =< 3 ->
    #{
        id => 3,
        low => 3,
        high => 3,
        group => [{1,[{0,8000},{1,2000}]},{2,[{0,5000},{1,5000}]},{3,[{2,10000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 1 andalso Rank >= 4 andalso Rank =< 10 ->
    #{
        id => 4,
        low => 4,
        high => 10,
        group => [{1,[{0,9900},{1,100}]},{2,[{0,8000},{1,2000}]},{3,[{1,5000},{2,5000}]}]
    };
get({WorldLv, Rank}) when WorldLv >= 1 andalso Rank >= 11 andalso Rank =< 9999 ->
    #{
        id => 5,
        low => 11,
        high => 9999,
        group => [{3,[{1,10000}]}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
