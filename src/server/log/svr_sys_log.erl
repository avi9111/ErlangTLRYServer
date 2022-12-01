%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     日志进程(缓解日志压力)
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_sys_log).
-author("Ryuu").

-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    p/0,
    log/1,
    log/3,
    cast/1,
    start_link/0
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    code_change/3,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    do_handle_call/3,
    do_handle_cast/2
]).

-define(SCOPE, local).
-define(SERVER, ?MODULE).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

log(SQL) when is_binary(SQL); is_list(SQL) ->
    cast({log, SQL}).

log(M, F, A) ->
    cast({log, M, F, A}).

cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    {ok, #state{}}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({log, SQL}, State) ->
    db:execute(SQL),
    {noreply, State};
do_handle_cast({log, M, F, A}, State) ->
    erlang:apply(M, F, A),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
