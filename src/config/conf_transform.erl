%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_transform
%% @Brief  : 变身配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_transform).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        name => <<"炼金小人">>,
        type => 1        
    };
get(2) ->
    #{
        id => 2,
        name => <<"炼金小人+马车">>,
        type => 1        
    };
get(3) ->
    #{
        id => 3,
        name => <<"结婚1">>,
        type => 2        
    };
get(4) ->
    #{
        id => 4,
        name => <<"结婚2">>,
        type => 2        
    };
get(5) ->
    #{
        id => 5,
        name => <<"结婚3">>,
        type => 2        
    };
get(6) ->
    #{
        id => 6,
        name => <<"结婚4">>,
        type => 2        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6].
