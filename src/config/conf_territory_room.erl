%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_territory_room
%% @Brief  : 领地战场
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_territory_room).

-export([
    get/1,
    get_ids/0,
    get_num/0,
    get_name/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"天战场">>
        
    };
get(2) ->
    #{
        id => 2,
        name => <<"地战场">>
        
    };
get(3) ->
    #{
        id => 3,
        name => <<"人战场">>
        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].

get_name(1) ->
    <<"天战场">>;
get_name(2) ->
    <<"地战场">>;
get_name(3) ->
    <<"人战场">>;
get_name(_ID) ->
    <<"所罗门">>.

get_num() ->
    3.
