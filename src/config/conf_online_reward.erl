%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_online_reward
%% @Brief  : 在线奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_online_reward).

-export([
    get/0
]).

get() ->
    #{
        max_times => 6,
        reward => [{1,31051},{2,31052},{3,31053},{4,31054},{5,31055},{6,31056},{7,31057},{8,31058}],
        online_time => [{1,300},{2,900},{3,2100},{4,3600},{5,5400},{6,7200}]
    }.
