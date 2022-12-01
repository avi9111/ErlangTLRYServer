%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%     Timer
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_timer).
-author("Ryuu").

-include("timer.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    register/0,
    register/1,
    register/2,
    unregister/0,
    unregister/1,
    unregister/2,
    start_link/0
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
-define(SCOPE, local).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% @doc 注册循环
register() ->
    ?MODULE:register(?TIMER_SEC, self()).

register(Pid) when is_pid(Pid) ->
    ?MODULE:register(?TIMER_SEC, Pid);
register(Type) when is_atom(Type) ->
    ?MODULE:register(Type, self()).

register(Type, Pid) ->
    cast({register, Type, Pid}).

%% @doc 注册循环
unregister() ->
    ?MODULE:unregister(self()).

unregister(Pid) ->
    cast({unregister, Pid}).

unregister(Type, Pid) ->
    cast({unregister, Type, Pid}).

%% @doc call
call(Request) ->
    ?call(Request).

%% @doc cast
cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    lib_timer:init(),
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

do_handle_call(info, _From, State) ->
    Reply = lib_timer:info(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(loop, State) ->
    lib_timer:loop(),
    {noreply, State};
do_handle_cast({register, Type, Pid}, State) ->
    lib_timer:register(Type, Pid),
    {noreply, State};
do_handle_cast({unregister, Pid}, State) ->
    lib_timer:unregister(Pid),
    {noreply, State};
do_handle_cast({unregister, Type, Pid}, State) ->
    lib_timer:unregister(Type, Pid),
    {noreply, State};
do_handle_cast({'DOWN', _Mref, _Type, Pid, _Reason}, State) ->
    lib_timer:unregister(Pid),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
