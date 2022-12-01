%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_catch_pet
%% @Brief  : 珍兽捕捉
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_catch_pet).

-export([
    get/1,
    get_item_id/1,
    get_coll_ids/0
]).

get(240001) ->
    #{
        weight => 3300,
        coll_id => 1501        
    };
get(240002) ->
    #{
        weight => 3300,
        coll_id => 1502        
    };
get(240003) ->
    #{
        weight => 3300,
        coll_id => 1503        
    };
get(240004) ->
    #{
        weight => 3300,
        coll_id => 1504        
    };
get(240005) ->
    #{
        weight => 3300,
        coll_id => 1505        
    };
get(240006) ->
    #{
        weight => 3300,
        coll_id => 1506        
    };
get(240007) ->
    #{
        weight => 3300,
        coll_id => 1507        
    };
get(240008) ->
    #{
        weight => 3300,
        coll_id => 1508        
    };
get(240009) ->
    #{
        weight => 3300,
        coll_id => 1509        
    };
get(240010) ->
    #{
        weight => 3300,
        coll_id => 1510        
    };
get(240011) ->
    #{
        weight => 3300,
        coll_id => 1511        
    };
get(_ID) ->
    undefined.


get_item_id(1501) ->
    33011003;
get_item_id(1502) ->
    33011004;
get_item_id(1503) ->
    33011005;
get_item_id(1504) ->
    33011006;
get_item_id(1505) ->
    33011007;
get_item_id(1506) ->
    33011008;
get_item_id(1507) ->
    33011009;
get_item_id(1508) ->
    33011010;
get_item_id(1509) ->
    33011011;
get_item_id(1510) ->
    33011012;
get_item_id(1511) ->
    33011013;
get_item_id(_ID) ->
    0.

get_coll_ids() ->
    [1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511].