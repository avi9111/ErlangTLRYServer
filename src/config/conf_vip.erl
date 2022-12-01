%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_vip
%% @Brief  : Vip配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_vip).

-export([
    get/1,
    get_ids/0
]).

get(0) ->
    #{
        level => 0,
        exp => 0,
        gift => 0,
        follow => 50,
        follower => 50        
    };
get(1) ->
    #{
        level => 1,
        exp => 0,
        gift => 30001,
        follow => 60,
        follower => 60        
    };
get(2) ->
    #{
        level => 2,
        exp => 0,
        gift => 30002,
        follow => 70,
        follower => 70        
    };
get(3) ->
    #{
        level => 3,
        exp => 0,
        gift => 30003,
        follow => 80,
        follower => 80        
    };
get(4) ->
    #{
        level => 4,
        exp => 10,
        gift => 30004,
        follow => 90,
        follower => 90        
    };
get(5) ->
    #{
        level => 5,
        exp => 50,
        gift => 30005,
        follow => 100,
        follower => 100        
    };
get(6) ->
    #{
        level => 6,
        exp => 100,
        gift => 30006,
        follow => 110,
        follower => 110        
    };
get(7) ->
    #{
        level => 7,
        exp => 200,
        gift => 30007,
        follow => 120,
        follower => 120        
    };
get(8) ->
    #{
        level => 8,
        exp => 500,
        gift => 30008,
        follow => 130,
        follower => 130        
    };
get(9) ->
    #{
        level => 9,
        exp => 1000,
        gift => 30009,
        follow => 140,
        follower => 140        
    };
get(10) ->
    #{
        level => 10,
        exp => 2000,
        gift => 30010,
        follow => 150,
        follower => 150        
    };
get(11) ->
    #{
        level => 11,
        exp => 5000,
        gift => 30011,
        follow => 160,
        follower => 160        
    };
get(12) ->
    #{
        level => 12,
        exp => 10000,
        gift => 30012,
        follow => 170,
        follower => 170        
    };
get(13) ->
    #{
        level => 13,
        exp => 20000,
        gift => 30013,
        follow => 180,
        follower => 180        
    };
get(14) ->
    #{
        level => 14,
        exp => 50000,
        gift => 30014,
        follow => 190,
        follower => 190        
    };
get(15) ->
    #{
        level => 15,
        exp => 100000,
        gift => 30015,
        follow => 200,
        follower => 200        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].
