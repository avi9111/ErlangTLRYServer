%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_chat_channel
%% @Brief  : 聊天频道
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_chat_channel).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        type => 1,
        level => 1,
        vip => 0,
        cd => 10,
        len => 40,
        cost => 0        
    };
get(2) ->
    #{
        type => 2,
        level => 1,
        vip => 0,
        cd => 1,
        len => 40,
        cost => 0        
    };
get(3) ->
    #{
        type => 3,
        level => 1,
        vip => 0,
        cd => 1,
        len => 40,
        cost => 0        
    };
get(4) ->
    #{
        type => 4,
        level => 1,
        vip => 0,
        cd => 10,
        len => 40,
        cost => 0        
    };
get(5) ->
    #{
        type => 5,
        level => 10,
        vip => 0,
        cd => 1,
        len => 40,
        cost => 0        
    };
get(6) ->
    #{
        type => 6,
        level => 30,
        vip => 0,
        cd => 1,
        len => 40,
        cost => 0        
    };
get(7) ->
    #{
        type => 7,
        level => 10,
        vip => 0,
        cd => 10,
        len => 40,
        cost => 0        
    };
get(9) ->
    #{
        type => 9,
        level => 1,
        vip => 0,
        cd => 10,
        len => 40,
        cost => 16990001        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 9].
