%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     市场
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_market).
-author("Ryuu").

-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    buy/2,
    call/1,
    cast/1,
    follow/3,
    put_on/2,
    resale/3,
    search/4,
    get_pet/2,
    get_info/1,
    get_item/2,
    take_off/3,
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

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(local, ?SERVER).

get_info(RoleID) ->
    cast({get_info, RoleID}).

search(RoleID, TagID, ID, Stat) ->
    cast({search, RoleID, TagID, ID, Stat}).

get_item(RoleID, Uid) ->
    cast({get_item, RoleID, Uid}).

get_pet(RoleID, Uid) ->
    cast({get_pet, RoleID, Uid}).

follow(RoleID, Uid, Opt) ->
    cast({follow, RoleID, Uid, Opt}).

put_on(RoleID, Items) ->
    call({put_on, RoleID, Items}).

take_off(RoleID, Uid, Room) ->
    call({take_off, RoleID, Uid, Room}).

resale(RoleID, Uid, Coin) ->
    call({resale, RoleID, Uid, Coin}).

buy(RoleID, Args) ->
    call({buy, RoleID, Args}).

permanent() ->
    call(permanent).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    lib_market:init(),
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

%%%===================================================================
%%% Internal functions
%%%===================================================================

do_handle_call(info, _From, State) ->
    Reply = lib_market:info(),
    {reply, Reply, State};
do_handle_call({put_on, RoleID, Items}, _From, State) ->
    Reply = lib_market:put_on(RoleID, Items),
    {reply, Reply, State};
do_handle_call({take_off, RoleID, Uid, Room}, _From, State) ->
    Reply = lib_market:take_off(RoleID, Uid, Room),
    {reply, Reply, State};
do_handle_call({resale, RoleID, Uid, Coin}, _From, State) ->
    Reply = lib_market:resale(RoleID, Uid, Coin),
    {reply, Reply, State};
do_handle_call({buy, RoleID, Args}, _From, State) ->
    Reply = lib_market:buy(RoleID, Args),
    {reply, Reply, State};

do_handle_call(permanent, _From, State) ->
    Reply = lib_market:permanent(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({role_delete, RoleIDs}, State) ->
    lib_market:role_delete(RoleIDs),
    {noreply, State};
do_handle_cast({get_info, RoleID}, State) ->
    lib_market:get_info(RoleID),
    {noreply, State};
do_handle_cast({search, RoleID, TagID, ID, Stat}, State) ->
    lib_market:search(RoleID, TagID, ID, Stat),
    {noreply, State};
do_handle_cast({get_item, RoleID, Uid}, State) ->
    lib_market:get_item(RoleID, Uid),
    {noreply, State};
do_handle_cast({get_pet, RoleID, Uid}, State) ->
    lib_market:get_pet(RoleID, Uid),
    {noreply, State};
do_handle_cast({follow, RoleID, Uid, Opt}, State) ->
    lib_market:follow(RoleID, Uid, Opt),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_market:loop(Now),
    {noreply, State};
do_handle_cast(interval_save, State) ->
    lib_market:permanent(),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
