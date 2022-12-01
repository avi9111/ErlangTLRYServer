%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     拍卖行
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_auction).
-author("Ryuu").

-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    bid/1,
    call/1,
    cast/1,
    auction/5,
    get_log/3,
    get_info/2,
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

-define(SCOPE, local).
-define(SERVER, ?MODULE).

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

%% @doc get auction info
get_info(RoleID, GuildID) ->
    cast({get_info, RoleID, GuildID}).

%% @doc get auction log
get_log(RoleID, Scope, Target) ->
    cast({get_log, RoleID, Scope, Target}).

%% @doc 拍卖 来源, 范围, 目标, [{玩家ID,分红系数}], [物品ID(拍卖物品.xml)]
auction(Type, Scope, Target, Roles, Items)
    when is_list(Roles), Roles =/= [], is_list(Items), Items =/= [] ->
    cast({auction, Type, Scope, Target, Roles, Items});
auction(_Type, _Scope, _Target, _Roles, _Items) ->
    ignore.

%% @doc 出价
bid(Args) ->
    call({bid, Args}).

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
    lib_auction:init(),
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
    Reply = lib_auction:info(),
    {reply, Reply, State};
do_handle_call({bid, Args}, _From, State) ->
    Reply = lib_auction:bid(Args),
    {reply, Reply, State};
do_handle_call(permanent, _From, State) ->
    Reply = lib_auction:permanent(),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(interval_save, State) ->
    lib_auction:permanent(),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_auction:loop(Now),
    {noreply, State};
do_handle_cast({get_info, RoleID, GuildID}, State) ->
    lib_auction:get_info(RoleID, GuildID),
    {noreply, State};
do_handle_cast({get_log, RoleID, Scope, Target}, State) ->
    lib_auction:get_log(RoleID, Scope, Target),
    {noreply, State};
do_handle_cast({auction, Type, Scope, Target, Roles, Items}, State) ->
    lib_auction:auction(Type, Scope, Target, Roles, Items),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
