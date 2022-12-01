%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_equip
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_equip).

-export([
    get/1,
    get_ids/0
]).

get({2, 1}) ->
    #{
        index => 2,
        id => 1,
        name => <<"秦皇之盔">>,
        coin => 36,
        effect => 30030,
        attr => []
    };
get({2, 2}) ->
    #{
        index => 2,
        id => 2,
        name => <<"秦国之甲">>,
        coin => 39,
        effect => 30031,
        attr => []
    };
get({2, 3}) ->
    #{
        index => 2,
        id => 3,
        name => <<"秦国之腕">>,
        coin => 39,
        effect => 30032,
        attr => []
    };
get({2, 4}) ->
    #{
        index => 2,
        id => 4,
        name => <<"秦国之靴">>,
        coin => 30,
        effect => 30033,
        attr => []
    };
get({2, 5}) ->
    #{
        index => 2,
        id => 5,
        name => <<"秦国之链">>,
        coin => 38,
        effect => 30034,
        attr => []
    };
get({2, 6}) ->
    #{
        index => 2,
        id => 6,
        name => <<"秦国之戒">>,
        coin => 36,
        effect => 30035,
        attr => []
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{2, 1}, {2, 2}, {2, 3}, {2, 4}, {2, 5}, {2, 6}].
