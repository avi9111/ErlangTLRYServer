%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_society_tag
%% @Brief  : 江湖之路标签
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_society_tag).

-export([
    get/1,
    get_ids/0,
    get_days/0
]).

get(1) ->
    #{
        id => 1,
        name => <<"入江湖">>,
        day => 1,
        mail => 0,
        reward => 0        
    };
get(2) ->
    #{
        id => 2,
        name => <<"游天下">>,
        day => 2,
        mail => 3001,
        reward => 289501        
    };
get(3) ->
    #{
        id => 3,
        name => <<"侠客行">>,
        day => 3,
        mail => 3002,
        reward => 289502        
    };
get(4) ->
    #{
        id => 4,
        name => <<"任逍遥">>,
        day => 4,
        mail => 3003,
        reward => 289503        
    };
get(5) ->
    #{
        id => 5,
        name => <<"武林尊">>,
        day => 5,
        mail => 3004,
        reward => 289504        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].

get_days() ->
    [1, 2, 3, 4, 5].
