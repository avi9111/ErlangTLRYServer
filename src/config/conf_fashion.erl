%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_fashion
%% @Brief  : 时装
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_fashion).

-export([
    get/1,
    get_ids/0
]).

get(1001) ->
    #{
        id => 1001,
        name => <<"门派服饰">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1002) ->
    #{
        id => 1002,
        name => <<"段誉语嫣">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1003) ->
    #{
        id => 1003,
        name => <<"骷髅战甲">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1004) ->
    #{
        id => 1004,
        name => <<"乔峰阿朱">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1005) ->
    #{
        id => 1005,
        name => <<"仙侣情缘">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1006) ->
    #{
        id => 1006,
        name => <<"血色战甲">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1007) ->
    #{
        id => 1007,
        name => <<"雪羽霜衣">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1008) ->
    #{
        id => 1008,
        name => <<"冰心如梦">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1009) ->
    #{
        id => 1009,
        name => <<"蝶舞流芳">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1010) ->
    #{
        id => 1010,
        name => <<"古代婚装">>,
        default => 1,
        dyeing => [],
        active => 0,
        unlock => [1],
        colors => [1],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1011) ->
    #{
        id => 1011,
        name => <<"金枫红霞">>,
        default => 1,
        dyeing => [{2,5000},{3,3000},{4,1500},{5,500}],
        active => 6,
        unlock => [1, 2, 3, 4, 5],
        colors => [1, 2, 3, 4, 5, 6],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(1012) ->
    #{
        id => 1012,
        name => <<"仙狐裘衣">>,
        default => 1,
        dyeing => [{2,5000},{3,3000},{4,1500},{5,500}],
        active => 6,
        unlock => [1, 2, 3, 4, 5],
        colors => [1, 2, 3, 4, 5, 6],
        cost => [{16140001,1}],
        attr => [{1,0},{5,0},{6,0}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012].
