%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. 10月 2019 16:42
%%%-------------------------------------------------------------------
-module(test_data).
-author("Administrator").
-include("svr_client.hrl").
%% API
-export([kv/2, test_kv/2]).

kv(RoleId, Key) ->
    Pid = dist:get_role_pid(RoleId),
    {_, List} = erlang:process_info(Pid, 'dictionary'),
    util:prop_get_value(Key, List).

test_kv(CliId, Key) ->
    Ets = ?to_ets(CliId),
    RoleId = util:get_ets(Ets, 'role_id'),
    Pid = dist:get_role_pid(RoleId),
    {_, List} = erlang:process_info(Pid, 'dictionary'),
    util:prop_get_value(Key, List).