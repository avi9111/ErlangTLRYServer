%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     结婚
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_marriage).
-author("Ryuu").

-include("common.hrl").
-include("marriage.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    marry/2,
    invite/2,
    confirm/2,
    divorce/1,
    request/1,
    add_love/3,
    response/3,
    permanent/0,
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

-define(SERVER, ?MODULE).

-record(state, {}).

%% =============================================================================
%% API
%% =============================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(local, ?SERVER).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

invite(RoleID, TargetID) ->
    cast({invite, RoleID, TargetID}).

response(RoleID, TargetID, Type) ->
    cast({response, RoleID, TargetID, Type}).

marry(RoleID, TargetID) ->
    call({marry, RoleID, TargetID}).

divorce(RoleID) ->
    call({divorce, RoleID}).

request(RoleID) ->
    cast({request, RoleID}).

confirm(RoleID, Opt) ->
    cast({confirm, RoleID, Opt}).

add_love(MarryID, Val, OpType) ->
    cast({add_love, MarryID, Val, OpType}).

permanent() ->
    call(permanent).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    lib_marriage:init(),
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

do_handle_call(info, _From, State) ->
    Reply = lib_marriage:info(),
    {reply, Reply, State};
do_handle_call(permanent, _From, State) ->
    Reply = lib_marriage:permanent(),
    {reply, Reply, State};
do_handle_call({marry, RoleID, TargetID}, _From, State) ->
    Reply = lib_marriage:marry(RoleID, TargetID),
    {reply, Reply, State};
do_handle_call({divorce, RoleID}, _From, State) ->
    Reply = lib_marriage:divorce(RoleID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({invite, RoleID, TargetID}, State) ->
    lib_marriage:invite(RoleID, TargetID),
    {noreply, State};
do_handle_cast({response, RoleID, TargetID, Opt}, State) ->
    lib_marriage:response(RoleID, TargetID, Opt),
    {noreply, State};
do_handle_cast({request, RoleID}, State) ->
    lib_marriage:request(RoleID),
    {noreply, State};
do_handle_cast({confirm, RoleID, Opt}, State) ->
    lib_marriage:confirm(RoleID, Opt),
    {noreply, State};
do_handle_cast({add_love, MarryID, Val, OpType}, State) ->
    lib_marriage:add_love(MarryID, Val, OpType),
    {noreply, State};

do_handle_cast(permanent, State) ->
    lib_marriage:permanent(),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
