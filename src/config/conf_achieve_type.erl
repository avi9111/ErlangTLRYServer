%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_achieve_type
%% @Brief  : 成就类型
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_achieve_type).

-export([
    get/1,
    get_ids/0,
    get_by_cate/1
]).

get(11) ->
    #{
        type => 11,
        cate => 1,
        name => <<"江湖">>,
        star => 25,
        reward => 305201,
        title => 0        
    };
get(12) ->
    #{
        type => 12,
        cate => 1,
        name => <<"结拜">>,
        star => 5,
        reward => 305202,
        title => 0        
    };
get(13) ->
    #{
        type => 13,
        cate => 1,
        name => <<"英雄谱">>,
        star => 5,
        reward => 305203,
        title => 0        
    };
get(21) ->
    #{
        type => 21,
        cate => 2,
        name => <<"帮会">>,
        star => 30,
        reward => 305204,
        title => 0        
    };
get(31) ->
    #{
        type => 31,
        cate => 3,
        name => <<"装备">>,
        star => 40,
        reward => 305205,
        title => 0        
    };
get(32) ->
    #{
        type => 32,
        cate => 3,
        name => <<"珍兽">>,
        star => 20,
        reward => 305206,
        title => 0        
    };
get(41) ->
    #{
        type => 41,
        cate => 4,
        name => <<"副本">>,
        star => 20,
        reward => 305208,
        title => 0        
    };
get(43) ->
    #{
        type => 43,
        cate => 4,
        name => <<"门派竞技">>,
        star => 20,
        reward => 305209,
        title => 0        
    };
get(51) ->
    #{
        type => 51,
        cate => 5,
        name => <<"日常活动">>,
        star => 40,
        reward => 305210,
        title => 0        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [11, 12, 13, 21, 31, 32, 41, 43, 51].

get_by_cate(1) ->
    [11, 12, 13];
get_by_cate(2) ->
    [21];
get_by_cate(3) ->
    [31, 32];
get_by_cate(4) ->
    [41, 43];
get_by_cate(5) ->
    [51];
get_by_cate(_) ->
    [].
