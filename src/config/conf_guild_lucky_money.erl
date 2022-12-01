%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_lucky_money
%% @Brief  : 帮派红包
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_lucky_money).

-export([
    get/1,
    get_ids/0
]).

get(1001) ->
    #{
        id => 1001,
        bgold => 50,
        times => 5,
        limit => {1,20},
        name => <<"帮会小红包">>
        
    };
get(1002) ->
    #{
        id => 1002,
        bgold => 100,
        times => 10,
        limit => {1,30},
        name => <<"帮会中红包">>
        
    };
get(1003) ->
    #{
        id => 1003,
        bgold => 200,
        times => 15,
        limit => {1,40},
        name => <<"帮会大红包">>
        
    };
get(1009) ->
    #{
        id => 1009,
        bgold => 48,
        times => 5,
        limit => {1,13},
        name => <<"">>
        
    };
get(1010) ->
    #{
        id => 1010,
        bgold => 100,
        times => 10,
        limit => {1,18},
        name => <<"首充红包">>
        
    };
get(1011) ->
    #{
        id => 1011,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"充值红包">>
        
    };
get(1012) ->
    #{
        id => 1012,
        bgold => 200,
        times => 10,
        limit => {1,30},
        name => <<"充值大红包">>
        
    };
get(1013) ->
    #{
        id => 1013,
        bgold => 360,
        times => 15,
        limit => {1,40},
        name => <<"充值超大红包">>
        
    };
get(1014) ->
    #{
        id => 1014,
        bgold => 600,
        times => 30,
        limit => {1,50},
        name => <<"充值满堂红包">>
        
    };
get(1021) ->
    #{
        id => 1021,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"剿匪红包">>
        
    };
get(1022) ->
    #{
        id => 1022,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"剿匪大红包">>
        
    };
get(1023) ->
    #{
        id => 1023,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"领地战红包">>
        
    };
get(1024) ->
    #{
        id => 1024,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"领地战大红包">>
        
    };
get(1025) ->
    #{
        id => 1025,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"红包1">>
        
    };
get(1026) ->
    #{
        id => 1026,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"红包2">>
        
    };
get(1027) ->
    #{
        id => 1027,
        bgold => 100,
        times => 10,
        limit => {1,25},
        name => <<"红包3">>
        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1001, 1002, 1003, 1009, 1010, 1011, 1012, 1013, 1014, 1021, 1022, 1023, 1024, 1025, 1026, 1027].
