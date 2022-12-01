%%----------------------------------
%% Statements:
%% @module 组等级文件
%% @date   2018-06-09 15-27-12
%% @author cablsbs
%%----------------------------------

-module(conf_group_lv).

-export([
	get_group_lv_conf/1
]).


%% @doc 获取组等级配置
%% -spec get_group_lv_conf(GId) -> {GSize, Rewards} | undefined.
%% Reawrds                      :: [{Item, Num}]
%% GId = GSize = Item = Num     :: integer()
get_group_lv_conf(2) ->
    {4, [{1002,1}]};
get_group_lv_conf(3) ->
    {6, [{1001,1},{1002,1}]};
get_group_lv_conf(4) ->
    {8, [{1002,2},{1003,2}]};
get_group_lv_conf(_GLv) ->
	undefined.
