%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     在线玩家管理
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_role_agent).
-author("Ryuu").

-include("role.hrl").
-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    p/0,
    call/1,
    cast/1,
    online/1,
    update/2,
    offline/1,
    broadcast/1,
    broadcast/2,
    online_num/0,
    start_link/0,
    info_online/1,
    select_info/2,
    select_mod_info/3,
    select_broadcast/2,
    select_broadcast/3
]).

%% gen_server callbacks
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SERVER, ?MODULE).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

p() ->
    erlang:whereis(?SERVER).

online(Role) ->
    cast({online, Role}).

offline(RoleID) ->
    cast({offline, RoleID}).

update(RoleID, V) ->
    cast({update, RoleID, V}).

%% @doc 在线人数
online_num() ->
    call('online_num').

%% @doc 广播
broadcast(Bin) ->
    cast({broadcast, Bin}).

broadcast(Bin, Except) ->
    cast({broadcast, Bin, Except}).

select_broadcast(Type, Bin) ->
    cast({select_broadcast, Type, Bin}).

select_broadcast(Type, Bin, Except) ->
    cast({select_broadcast, Type, Bin, Except}).

%% @doc send info
info_online(Info) ->
    cast({info_online, Info}).

select_info(Type, Info) ->
    cast({select_info, Type, Info}).

select_mod_info(Type, Mod, Info) ->
    cast({select_mod_info, Type, Mod, Info}).

cast(Request) ->
    ?cast(Request).

call(Request) ->
    ?call(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    lib_role_agent:init_online_dict(),
    start_log_online(60000),
    {ok, #state{}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info('log_online', State) ->
    lib_role_agent:log_online(),
    start_log_online(30000),
    {noreply, State};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call('online_num', _From, State) ->
    Reply = lib_role_agent:online_num(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({online, Role}, State) ->
    lib_role_agent:online(Role),
    {noreply, State};
do_handle_cast({offline, RoleID}, State) ->
    lib_role_agent:offline(RoleID),
    {noreply, State};
do_handle_cast({update, RoleID, V}, State) ->
    lib_role_agent:update(RoleID, V),
    {noreply, State};
do_handle_cast({broadcast, Bin}, State) ->
    lib_role_agent:broadcast(Bin),
    {noreply, State};
do_handle_cast({broadcast, Bin, Except}, State) ->
    lib_role_agent:broadcast(Bin, Except),
    {noreply, State};
do_handle_cast({select_broadcast, Type, Bin}, State) ->
    lib_role_agent:select_broadcast(Type, Bin),
    {noreply, State};
do_handle_cast({info_online, Info}, State) ->
    lib_role_agent:info_online(Info),
    {noreply, State};
do_handle_cast({select_info, Type, Info}, State) ->
    lib_role_agent:select_info(Type, Info),
    {noreply, State};
do_handle_cast({select_mod_info, Type, Mod, Info}, State) ->
    lib_role_agent:select_mod_info(Type, Mod, Info),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.

start_log_online(Time) ->
    erlang:send_after(Time, self(), 'log_online').
