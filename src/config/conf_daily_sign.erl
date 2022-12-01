%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_daily_sign
%% @Brief  : 每日签到
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_daily_sign).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        day => 1,
        reward => 31001        
    };
get(2) ->
    #{
        day => 2,
        reward => 31002        
    };
get(3) ->
    #{
        day => 3,
        reward => 31003        
    };
get(4) ->
    #{
        day => 4,
        reward => 31004        
    };
get(5) ->
    #{
        day => 5,
        reward => 31005        
    };
get(6) ->
    #{
        day => 6,
        reward => 31006        
    };
get(7) ->
    #{
        day => 7,
        reward => 31007        
    };
get(8) ->
    #{
        day => 8,
        reward => 31008        
    };
get(9) ->
    #{
        day => 9,
        reward => 31009        
    };
get(10) ->
    #{
        day => 10,
        reward => 31010        
    };
get(11) ->
    #{
        day => 11,
        reward => 31011        
    };
get(12) ->
    #{
        day => 12,
        reward => 31012        
    };
get(13) ->
    #{
        day => 13,
        reward => 31013        
    };
get(14) ->
    #{
        day => 14,
        reward => 31014        
    };
get(15) ->
    #{
        day => 15,
        reward => 31015        
    };
get(16) ->
    #{
        day => 16,
        reward => 31016        
    };
get(17) ->
    #{
        day => 17,
        reward => 31017        
    };
get(18) ->
    #{
        day => 18,
        reward => 31018        
    };
get(19) ->
    #{
        day => 19,
        reward => 31019        
    };
get(20) ->
    #{
        day => 20,
        reward => 31020        
    };
get(21) ->
    #{
        day => 21,
        reward => 31021        
    };
get(22) ->
    #{
        day => 22,
        reward => 31022        
    };
get(23) ->
    #{
        day => 23,
        reward => 31023        
    };
get(24) ->
    #{
        day => 24,
        reward => 31024        
    };
get(25) ->
    #{
        day => 25,
        reward => 31025        
    };
get(26) ->
    #{
        day => 26,
        reward => 31026        
    };
get(27) ->
    #{
        day => 27,
        reward => 31027        
    };
get(28) ->
    #{
        day => 28,
        reward => 31028        
    };
get(29) ->
    #{
        day => 29,
        reward => 31029        
    };
get(30) ->
    #{
        day => 30,
        reward => 31030        
    };
get(31) ->
    #{
        day => 31,
        reward => 31031        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31].
