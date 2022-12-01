%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家数据（键值对）
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_data).

-include("role.hrl").
-include("common.hrl").

-export([
    init/1,
    save/1,
    event/2
]).

%% 在线处理函数
-export([
    get_value/2,
    get_value/3,
    put_value/3,
    add_counter/3
]).

%% 离线处理函数
-export([
    data_load/1,
    add_to_db/3,
    put_to_db/3,
    get_from_db/2
]).

%% 数据保存的Key
-define(KEY_ROLE_KV_DATA, role_kv_data).

-define(SQL_GET_ROLE_KV_DATA, <<"select `data` from `role_kv_data` where `role_id` = ~p">>).
-define(SQL_SET_ROLE_KV_DATA, <<"replace into `role_kv_data`(`role_id`, `data`) values (~w, '~s')">>).

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _) ->
    ignore.

%% -----------------------------------------------------------------------------
%% 在线获取
%% -----------------------------------------------------------------------------

%% @doc 在线获取
get_value(RoleID, Key) ->
    get_value(RoleID, Key, undefined).

get_value(RoleID, Key, Def) ->
    case dict:find(Key, kv_data(RoleID)) of
        error -> Def;
        {ok, Value} -> Value
    end.

%% @doc 在线保存
put_value(RoleID, Key, Value) ->
    erlang:put(?KEY_ROLE_KV_DATA, dict:store(Key, Value, kv_data(RoleID))).

%% @doc 在线增加
add_counter(RoleID, Key, Value) ->
    erlang:put(?KEY_ROLE_KV_DATA, dict:update_counter(Key, Value, kv_data(RoleID))).

%% -----------------------------------------------------------------------------
%% 离线获取
%% -----------------------------------------------------------------------------

%% @doc 离线获取
get_from_db(RoleID, Key) ->
    case dict:find(Key, data_load(RoleID)) of
        error -> undefined;
        {ok, Value} -> Value
    end.

%% @doc 离线保存
put_to_db(RoleID, Key, Value) ->
    data_save(RoleID, dict:store(Key, Value, data_load(RoleID))).

%% @doc 离线增加
add_to_db(RoleID, Key, Value) ->
    data_save(RoleID, dict:update_counter(Key, Value, data_load(RoleID))).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc init
init(_PS) ->
    ok.

%% @doc 加载数据
data_load(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_KV_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DbData] ->
            List = type:convert_db_field(list, DbData, []),
            dict:from_list(List);
        _ ->
            dict:new()
    end.

%% @doc save
save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get(?KEY_ROLE_KV_DATA) of
        undefined ->
            ignore;
        Dict ->
            data_save(RoleID, Dict)
    end.

data_save(RoleID, Dict) ->
    KvList = dict:to_list(Dict),
    DbKvList = type:term_to_bitstring(KvList),
    SQL = io_lib:format(?SQL_SET_ROLE_KV_DATA, [RoleID, DbKvList]),
    ?DB:execute(SQL).

%% @doc 键值数据
kv_data(RoleID) ->
    case erlang:get(?KEY_ROLE_KV_DATA) of
        undefined ->
            Data = data_load(RoleID),
            erlang:put(?KEY_ROLE_KV_DATA, Data),
            Data;
        Data ->
            Data
    end.
