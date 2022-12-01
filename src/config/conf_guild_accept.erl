%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_accept
%% @Brief  : 帮派招人
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_accept).

-export([
    get/1,
    get_ids/0
]).

get(0) ->
    #{
        id => 0,
        fight => 0        
    };
get(1) ->
    #{
        id => 1,
        fight => 100000        
    };
get(2) ->
    #{
        id => 2,
        fight => 300000        
    };
get(3) ->
    #{
        id => 3,
        fight => 500000        
    };
get(4) ->
    #{
        id => 4,
        fight => 1000000        
    };
get(5) ->
    #{
        id => 5,
        fight => 2000000        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [0, 1, 2, 3, 4, 5].
