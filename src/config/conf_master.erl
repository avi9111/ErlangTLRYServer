%% -*- coding: latin-1 -*-
%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主
%%% @end
%%% ----------------------------------------------------------------------------
-module(conf_master).
-author("Ryuu").

-export([
    get/1,
    get_ids/0,
    get_by_lv/1,
    is_master/1
]).

get(180001) ->
    #{
        id => 180001,
        low => 1,
        high => 20        
    };
get(180002) ->
    #{
        id => 180002,
        low => 21,
        high => 9999        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [180001, 180002].

get_by_lv(Lv) when Lv >= 1 andalso Lv =< 20 ->
    180001;
get_by_lv(Lv) when Lv >= 21 andalso Lv =< 9999 ->
    180002;
get_by_lv(_) ->
    undefined.

is_master(ID) ->
    ?MODULE:get(ID) =/= undefined.
