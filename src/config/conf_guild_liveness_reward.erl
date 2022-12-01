%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_liveness_reward
%% @Brief  : 帮派活跃奖励
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_liveness_reward).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        liveness => 10,
        reward => 20001        
    };
get(2) ->
    #{
        id => 2,
        liveness => 20,
        reward => 20001        
    };
get(3) ->
    #{
        id => 3,
        liveness => 30,
        reward => 20001        
    };
get(4) ->
    #{
        id => 4,
        liveness => 40,
        reward => 20001        
    };
get(5) ->
    #{
        id => 5,
        liveness => 50,
        reward => 20001        
    };
get(6) ->
    #{
        id => 6,
        liveness => 60,
        reward => 20001        
    };
get(7) ->
    #{
        id => 7,
        liveness => 70,
        reward => 20001        
    };
get(8) ->
    #{
        id => 8,
        liveness => 80,
        reward => 20001        
    };
get(9) ->
    #{
        id => 9,
        liveness => 90,
        reward => 20001        
    };
get(10) ->
    #{
        id => 10,
        liveness => 100,
        reward => 20001        
    };
get(11) ->
    #{
        id => 11,
        liveness => 110,
        reward => 20001        
    };
get(12) ->
    #{
        id => 12,
        liveness => 120,
        reward => 20001        
    };
get(13) ->
    #{
        id => 13,
        liveness => 130,
        reward => 20001        
    };
get(14) ->
    #{
        id => 14,
        liveness => 140,
        reward => 20001        
    };
get(15) ->
    #{
        id => 15,
        liveness => 150,
        reward => 20001        
    };
get(16) ->
    #{
        id => 16,
        liveness => 160,
        reward => 20001        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16].
