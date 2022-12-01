%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      镖车配置
%% @author      cablsbs
%%----------------------------------
-module(conf_carry).

-export([
	get/1
]).


%% @doc 获取镖车配置
%% @spec get(CarryId) -> #{}.
%% CarryId      :: integer()
get(1001) ->
    #{name => <<"绿色镖车">>, speed => 240};
get(1002) ->
    #{name => <<"黄色镖车">>, speed => 240};
get(1003) ->
    #{name => <<"紫色镖车">>, speed => 240};
get(1004) ->
    #{name => <<"橙色镖车">>, speed => 240};
get(1005) ->
    #{name => <<"花轿">>, speed => 150};
get(_CarryId) ->
    undefined.
