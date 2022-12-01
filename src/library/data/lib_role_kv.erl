%%-------------------------------------------------------
%% @File     : lib_role_kv
%% @Brief    : 键值对
%% @Author   : cablsbs
%% @Date     : 2018-8-9
%%-------------------------------------------------------
-module(lib_role_kv).

-include("keyvalue.hrl").

-export([
    get_counter/2,
    get_kv/2,
    get_kv/3,
    set_kv/3
]).


%% Apis -------------------------------------------------
% 获取计数器
get_counter(RoleId, Key) ->
    get_kv(RoleId, Key, 0).

% 获取value
get_kv(RoleId, Key) ->
    get_kv(RoleId, Key, undefined).

% 玩家每日数据
get_kv(RoleId, Key, Default) when Key >= 1 andalso Key =< 1000 ->
    case lib_role_daily:get_value(RoleId, Key) of
        undefined -> Default;
        Value -> Value
    end;
% 玩家持久数据
get_kv(RoleId, Key, Default) when Key >= 2001 andalso Key =< 5000 ->
    lib_role_data:get_value(RoleId, Key, Default);
% 全服性数据(永久)
get_kv(_RoleId, Key, Default) when Key >= 6001 andalso Key =< 8000 ->
    svr_global_data:get_value(0, Key, Default);
% 全服性数据(每日)
get_kv(_RoleId, Key, Default) when Key >= 8001 andalso Key =< 10000 ->
    svr_global_data:get_value(1, Key, Default);
% 临时数据(lib_daily_api, special_data)
get_kv(RoleId, Key, _Default) when Key >= 20001 andalso Key =< 30000 ->
    lib_role_daily:get_value(RoleId, Key);
get_kv(_RoleId, _Key, _Default) ->
    0.


% 玩家每日数据
set_kv(RoleId, Key, Value) when Key >= 1 andalso Key =< 1000 ->
    lib_role_daily:put_value(RoleId, Key, Value);
% 玩家持久数据
set_kv(RoleId, Key, Value) when Key >= 2001 andalso Key =< 5000 ->
    lib_role_data:put_value(RoleId, Key, Value);
% 全服性数据(永久) Value可以为任意格式
set_kv(_RoleId, Key, Value) when Key >= 6001 andalso Key =< 8000 ->
    svr_global_data:put_value(0, Key, Value);
% 全服性数据(每日) Value可以为任意格式
set_kv(_RoleId, Key, Value) when Key >= 8001 andalso Key =< 10000 ->
    svr_global_data:put_value(1, Key, Value);
% 临时数据(lib_daily_api, special_data)
set_kv(RoleId, Key, Value) when Key >= 20001 andalso Key =< 30000 ->
    lib_role_daily:put_value(RoleId, Key, Value);
set_kv(_RoleId, _Key, _Value) ->
    ok.
