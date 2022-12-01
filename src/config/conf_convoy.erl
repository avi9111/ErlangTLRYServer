%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_convoy
%% @Brief  : 镖车配置
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_convoy).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        quality => 1,
        module => 1,
        weight => 5000,
        cont => 100,
        funds => 1000,
        reward => 2101,
        robbed_cont => 100,
        robbed_funds => 1000,
        robbed_reward => 2101    };
get(2) ->
    #{
        quality => 2,
        module => 2,
        weight => 3000,
        cont => 200,
        funds => 2000,
        reward => 2102,
        robbed_cont => 200,
        robbed_funds => 2000,
        robbed_reward => 2102    };
get(3) ->
    #{
        quality => 3,
        module => 3,
        weight => 1500,
        cont => 300,
        funds => 3000,
        reward => 2103,
        robbed_cont => 300,
        robbed_funds => 3000,
        robbed_reward => 2103    };
get(4) ->
    #{
        quality => 4,
        module => 4,
        weight => 500,
        cont => 400,
        funds => 4000,
        reward => 2104,
        robbed_cont => 400,
        robbed_funds => 4000,
        robbed_reward => 2104    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4].
