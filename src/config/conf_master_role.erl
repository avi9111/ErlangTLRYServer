%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主 - 玩家奖励
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_master_role).
-author("Ryuu").

-export([
    get/1,
    get_ids/0
]).

get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 1 andalso Lv =< 1 ->
    #{
        id => 7,
        low => 1,
        high => 1,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 2 andalso Lv =< 2 ->
    #{
        id => 8,
        low => 2,
        high => 2,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 3 andalso Lv =< 3 ->
    #{
        id => 9,
        low => 3,
        high => 3,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 4 andalso Lv =< 5 ->
    #{
        id => 10,
        low => 4,
        high => 5,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 6 andalso Lv =< 10 ->
    #{
        id => 11,
        low => 6,
        high => 10,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 21 andalso Lv >= 11 andalso Lv =< 9999 ->
    #{
        id => 12,
        low => 11,
        high => 9999,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 1 andalso Lv =< 1 ->
    #{
        id => 1,
        low => 1,
        high => 1,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 2 andalso Lv =< 2 ->
    #{
        id => 2,
        low => 2,
        high => 2,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 3 andalso Lv =< 3 ->
    #{
        id => 3,
        low => 3,
        high => 3,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 4 andalso Lv =< 5 ->
    #{
        id => 4,
        low => 4,
        high => 5,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 6 andalso Lv =< 10 ->
    #{
        id => 5,
        low => 6,
        high => 10,
        reward => 1005        
    };
get({WorldLv, Lv}) when WorldLv >= 1 andalso Lv >= 11 andalso Lv =< 9999 ->
    #{
        id => 6,
        low => 11,
        high => 9999,
        reward => 1005        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].

