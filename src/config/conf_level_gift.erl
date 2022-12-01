%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_level_gift
%% @Brief  : 等级礼包
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_level_gift).

-export([
    get/1,
    get_ids/0
]).

get(15) ->
    #{
        level => 15,
        reward => 32001        
    };
get(25) ->
    #{
        level => 25,
        reward => 32002        
    };
get(35) ->
    #{
        level => 35,
        reward => 32003        
    };
get(40) ->
    #{
        level => 40,
        reward => 32004        
    };
get(45) ->
    #{
        level => 45,
        reward => 32005        
    };
get(50) ->
    #{
        level => 50,
        reward => 32006        
    };
get(55) ->
    #{
        level => 55,
        reward => 32007        
    };
get(60) ->
    #{
        level => 60,
        reward => 32008        
    };
get(65) ->
    #{
        level => 65,
        reward => 32009        
    };
get(70) ->
    #{
        level => 70,
        reward => 32010        
    };
get(75) ->
    #{
        level => 75,
        reward => 32011        
    };
get(80) ->
    #{
        level => 80,
        reward => 32012        
    };
get(85) ->
    #{
        level => 85,
        reward => 32013        
    };
get(90) ->
    #{
        level => 90,
        reward => 32014        
    };
get(93) ->
    #{
        level => 93,
        reward => 32015        
    };
get(97) ->
    #{
        level => 97,
        reward => 32016        
    };
get(99) ->
    #{
        level => 99,
        reward => 32017        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [15, 25, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 93, 97, 99].
