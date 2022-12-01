%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     掉落
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_drop_api).

-include("role.hrl").
-include("goods.hrl").
-include("common.hrl").
-include("op_type.hrl").

-export([
    give_drop_asyn/3,
    give_drop_asyn/4,
    give_drop_sync/3,
    give_drop_sync/4
]).

%% @doc 发送掉落 [玩家进程内同步调用], 支持掉落见 lib_drop_base, 下同
give_drop_sync(PS, Drop, OpType) ->
    give_drop_sync(PS, Drop, [], OpType).

give_drop_sync(PS, Drop, ExtraInfo, OpType) when is_record(PS, role_state) andalso (is_integer(Drop) orelse is_list(Drop)) ->
    DropItemList = get_drop_goods(Drop, ExtraInfo),
    NewPS = lib_role_drop:give_drop(PS, DropItemList, ExtraInfo, OpType),
    {NewPS, DropItemList}.

%% @doc 发送掉落 [异步]
give_drop_asyn(RoleID, Drop, OpType) ->
    give_drop_asyn(RoleID, Drop, [], OpType).

give_drop_asyn(RoleID, Drop, ExtraInfo, OpType) ->
    DropItemList = get_drop_goods(Drop, ExtraInfo),
    lib_role:mod_info(RoleID, lib_role_drop, {give_drop, DropItemList, ExtraInfo, OpType}),
    DropItemList.

get_drop_goods(Drop, ExtraInfo) ->
    %% 获取特殊掉落类型
    SpLimList = case lists:keyfind(special_lim, 1, ExtraInfo) of
        false -> [];
        {_, SpLimCond} -> lib_drop_base:get_special_drop_type(SpLimCond, [])
    end,
    %% 获取掉落物品
    lib_drop_base:get_drop_goods(Drop, SpLimList).
