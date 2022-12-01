%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_money_exchange
%% @Brief  : 货币兑换
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_money_exchange).

-export([
    get/1,
    get_ids/0,
    get_by_ttype/1
]).

get(1) ->
    #{
        id => 1,
        stype => 25,
        ttype => 17,
        ratio => 100        
    };
get(2) ->
    #{
        id => 2,
        stype => 25,
        ttype => 4,
        ratio => 10000        
    };
get(3) ->
    #{
        id => 3,
        stype => 17,
        ttype => 4,
        ratio => 100        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].

get_by_ttype(17) ->
    [1];
get_by_ttype(4) ->
    [2, 3];
get_by_ttype(_) ->
    [].
