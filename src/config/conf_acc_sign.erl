%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_acc_sign
%% @Brief  : 累计签到
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_acc_sign).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        day => 5,
        reward => 31041        
    };
get(2) ->
    #{
        day => 10,
        reward => 31042        
    };
get(3) ->
    #{
        day => 15,
        reward => 31043        
    };
get(4) ->
    #{
        day => 20,
        reward => 31044        
    };
get(5) ->
    #{
        day => 25,
        reward => 31045        
    };
get(6) ->
    #{
        day => 0,
        reward => 31046        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6].
