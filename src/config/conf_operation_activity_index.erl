%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_operation_activity_index
%% @Brief  : 运营活动索引
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_operation_activity_index).

-export([
    get/1,
    get_ids/0,
    get_def/1
]).

get({4001, 1}) ->
    #{
        act_id => 4001,
        index => 1,
        name => <<"幸运转盘">>,
        default => 1        
    };
get({4001, 2}) ->
    #{
        act_id => 4001,
        index => 2,
        name => <<"幸运转盘">>,
        default => 0        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{4001, 1}, {4001, 2}].

get_def(4001) ->
	4001;
get_def(_) ->
    1.
