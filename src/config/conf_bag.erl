%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_bag
%% @Brief  : 背包
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_bag).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        name => <<"道具">>,
        cost => 0,
        init_size => 100,
        max_size => 100        
    };
get(2) ->
    #{
        id => 2,
        name => <<"龙元背包">>,
        cost => 0,
        init_size => 100,
        max_size => 100        
    };
get(3) ->
    #{
        id => 3,
        name => <<"仓库1">>,
        cost => 0,
        init_size => 20,
        max_size => 20        
    };
get(4) ->
    #{
        id => 4,
        name => <<"仓库2">>,
        cost => 1000,
        init_size => 20,
        max_size => 20        
    };
get(5) ->
    #{
        id => 5,
        name => <<"仓库3">>,
        cost => 5000,
        init_size => 20,
        max_size => 20        
    };
get(6) ->
    #{
        id => 6,
        name => <<"仓库4">>,
        cost => 10000,
        init_size => 20,
        max_size => 20        
    };
get(7) ->
    #{
        id => 7,
        name => <<"仓库5">>,
        cost => 15000,
        init_size => 20,
        max_size => 20        
    };
get(8) ->
    #{
        id => 8,
        name => <<"仓库6">>,
        cost => 20000,
        init_size => 20,
        max_size => 20        
    };
get(9) ->
    #{
        id => 9,
        name => <<"仓库7">>,
        cost => 30000,
        init_size => 20,
        max_size => 20        
    };
get(10) ->
    #{
        id => 10,
        name => <<"仓库8">>,
        cost => 40000,
        init_size => 20,
        max_size => 20        
    };
get(11) ->
    #{
        id => 11,
        name => <<"仓库9">>,
        cost => 50000,
        init_size => 20,
        max_size => 20        
    };
get(12) ->
    #{
        id => 12,
        name => <<"仓库10">>,
        cost => 60000,
        init_size => 20,
        max_size => 20        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].
