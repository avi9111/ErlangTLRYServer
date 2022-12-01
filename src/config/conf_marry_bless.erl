%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_marry_bless
%% @Brief  : 结婚祝福
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_marry_bless).

-export([
    get/1,
    get_ids/0
]).

get(0) ->
    #{
        level => 0,
        love => 0,
        role_lv => 38,
        attr => [{7,0},{8,0}]
    };
get(1) ->
    #{
        level => 1,
        love => 5000,
        role_lv => 38,
        attr => [{7,125},{8,125}]
    };
get(2) ->
    #{
        level => 2,
        love => 10000,
        role_lv => 48,
        attr => [{7,237},{8,237}]
    };
get(3) ->
    #{
        level => 3,
        love => 15000,
        role_lv => 58,
        attr => [{7,346},{8,346}]
    };
get(4) ->
    #{
        level => 4,
        love => 20000,
        role_lv => 66,
        attr => [{7,626},{8,626}]
    };
get(5) ->
    #{
        level => 5,
        love => 25000,
        role_lv => 72,
        attr => [{7,723},{8,723}]
    };
get(6) ->
    #{
        level => 6,
        love => 30000,
        role_lv => 76,
        attr => [{7,876},{8,876}]
    };
get(7) ->
    #{
        level => 7,
        love => 35000,
        role_lv => 79,
        attr => [{7,1184},{8,1184}]
    };
get(8) ->
    #{
        level => 8,
        love => 40000,
        role_lv => 83,
        attr => [{7,1342},{8,1342}]
    };
get(9) ->
    #{
        level => 9,
        love => 45000,
        role_lv => 86,
        attr => [{7,1693},{8,1693}]
    };
get(10) ->
    #{
        level => 10,
        love => 50000,
        role_lv => 89,
        attr => [{7,1885},{8,1885}]
    };
get(11) ->
    #{
        level => 11,
        love => 55000,
        role_lv => 92,
        attr => [{7,2229},{8,2229}]
    };
get(12) ->
    #{
        level => 12,
        love => 60000,
        role_lv => 94,
        attr => [{7,2693},{8,2693}]
    };
get(13) ->
    #{
        level => 13,
        love => 65000,
        role_lv => 96,
        attr => [{7,3013},{8,3013}]
    };
get(14) ->
    #{
        level => 14,
        love => 70000,
        role_lv => 98,
        attr => [{7,3493},{8,3493}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].
