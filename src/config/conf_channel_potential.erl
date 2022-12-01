%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_potential
%% @Brief  : 经脉潜能
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_potential).

-export([
    get/1,
    get_ids/0
]).

get(21) ->
    #{
        id => 21,
        name => <<"冰攻击">>,
        type => 1,
        limit => 349        
    };
get(22) ->
    #{
        id => 22,
        name => <<"火攻击">>,
        type => 1,
        limit => 349        
    };
get(23) ->
    #{
        id => 23,
        name => <<"玄攻击">>,
        type => 1,
        limit => 349        
    };
get(24) ->
    #{
        id => 24,
        name => <<"毒攻击">>,
        type => 1,
        limit => 349        
    };
get(109) ->
    #{
        id => 109,
        name => <<"全属性攻击">>,
        type => 1,
        limit => 100        
    };
get(103) ->
    #{
        id => 103,
        name => <<"体力">>,
        type => 2,
        limit => 202        
    };
get(7) ->
    #{
        id => 7,
        name => <<"外功防御">>,
        type => 2,
        limit => 1254        
    };
get(8) ->
    #{
        id => 8,
        name => <<"内功防御">>,
        type => 2,
        limit => 1254        
    };
get(3) ->
    #{
        id => 3,
        name => <<"气量">>,
        type => 2,
        limit => 5332        
    };
get(101) ->
    #{
        id => 101,
        name => <<"力量">>,
        type => 3,
        limit => 231        
    };
get(102) ->
    #{
        id => 102,
        name => <<"灵气">>,
        type => 3,
        limit => 231        
    };
get(9) ->
    #{
        id => 9,
        name => <<"命中">>,
        type => 3,
        limit => 1651        
    };
get(104) ->
    #{
        id => 104,
        name => <<"定力">>,
        type => 4,
        limit => 224        
    };
get(105) ->
    #{
        id => 105,
        name => <<"身法">>,
        type => 4,
        limit => 124        
    };
get(10) ->
    #{
        id => 10,
        name => <<"闪避">>,
        type => 4,
        limit => 413        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [21, 22, 23, 24, 109, 103, 7, 8, 3, 101, 102, 9, 104, 105, 10].
