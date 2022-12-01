%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mystical_store
%% @Brief  : 神秘商店
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_mystical_store).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        day => [{1,999}],
        drop_id => 80001,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 300    };
get(2) ->
    #{
        day => [{1,999}],
        drop_id => 80002,
        limit_type => 1,
        limit_times => 6,
        sell_gold => 600    };
get(3) ->
    #{
        day => [{1,999}],
        drop_id => 80003,
        limit_type => 2,
        limit_times => 3,
        sell_gold => 900    };
get(4) ->
    #{
        day => [{1,999}],
        drop_id => 80004,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 1200    };
get(5) ->
    #{
        day => [{1,999}],
        drop_id => 80005,
        limit_type => 1,
        limit_times => 6,
        sell_gold => 1600    };
get(6) ->
    #{
        day => [{1,999}],
        drop_id => 80006,
        limit_type => 2,
        limit_times => 3,
        sell_gold => 2000    };
get(7) ->
    #{
        day => [{1,999}],
        drop_id => 80007,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 2400    };
get(8) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80008,
        limit_type => 1,
        limit_times => 5,
        sell_gold => 2800    };
get(9) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80009,
        limit_type => 1,
        limit_times => 5,
        sell_gold => 3200    };
get(10) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80010,
        limit_type => 1,
        limit_times => 5,
        sell_gold => 3600    };
get(11) ->
    #{
        day => [{1,1}],
        drop_id => 80011,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 4000    };
get(12) ->
    #{
        day => [{1,1}],
        drop_id => 80012,
        limit_type => 1,
        limit_times => 8,
        sell_gold => 4400    };
get(13) ->
    #{
        day => [{1,1}],
        drop_id => 80013,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 4800    };
get(14) ->
    #{
        day => [{1,1}],
        drop_id => 80014,
        limit_type => 0,
        limit_times => 0,
        sell_gold => 5200    };
get(15) ->
    #{
        day => [{1,1}],
        drop_id => 80015,
        limit_type => 1,
        limit_times => 8,
        sell_gold => 5600    };
get(16) ->
    #{
        day => [{1,999}],
        drop_id => 80016,
        limit_type => 1,
        limit_times => 8,
        sell_gold => 6000    };
get(17) ->
    #{
        day => [{1,999}],
        drop_id => 80017,
        limit_type => 1,
        limit_times => 8,
        sell_gold => 6400    };
get(18) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80018,
        limit_type => 2,
        limit_times => 3,
        sell_gold => 6800    };
get(19) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80019,
        limit_type => 2,
        limit_times => 3,
        sell_gold => 7200    };
get(20) ->
    #{
        day => [{1,1},{4,10}],
        drop_id => 80020,
        limit_type => 1,
        limit_times => 5,
        sell_gold => 7600    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20].
