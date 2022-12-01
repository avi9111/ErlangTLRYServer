%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_territory).
-author("Ryuu").

-include("common.hrl").

-behavior(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    update/3,
    get_info/1,
    permanent/0,
    start_link/0,
    reset_round/0,
    daily_auction/0
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

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(local, ?SERVER).

get_info(RoleID) ->
    cast({get_info, RoleID}).

update(Version, Winners, GuildList) ->
    cast({update, Version, Winners, GuildList}).

reset_round() ->
    cast(reset_round).

daily_auction() ->
    cast(daily_auction).

permanent() ->
    call(permanent).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_territory:init(),
    {ok, State}.

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
    Reply = lib_territory:info(),
    {reply, Reply, State};
do_handle_call(permanent, _From, State) ->
    Reply = lib_territory:save(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(reset_round, State) ->
    lib_territory:reset_round(),
    {noreply, State};
do_handle_cast(daily_auction, State) ->
    lib_territory:daily_auction(),
    {noreply, State};
do_handle_cast({get_info, RoleID}, State) ->
    lib_territory:get_info(RoleID),
    {noreply, State};
do_handle_cast({update, Version, Winners, GuildList}, State) ->
    lib_territory:update(Version, Winners, GuildList),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
