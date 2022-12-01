%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_rank_mgr).
-author("Ryuu").

-include("rank.hrl").
-include("common.hrl").
-include("ret_code.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/0,
    mfa/2,
    mfa/3,
    cast/1,
    call/1,
    get_rank/3,
    permanent/0,
    start_link/0,
    refresh_rank/0
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    code_change/3,
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

%% @doc 排行榜信息
i(RankID) ->
    call({info, RankID}).

%% @doc MFA
mfa(M, F) ->
    mfa(M, F, []).

mfa(M, F, A) when is_list(A) ->
    call({mfa, M, F, A});
mfa(_M, _F, _A) ->
    ignore.

%% @doc 获取排行榜
get_rank(RankID, Page, Key) ->
    call({get_rank, RankID, Page, Key}).

%% @doc 刷新排行榜
refresh_rank() ->
    sup_rank_svr:info_all(timer_refresh).

%% @doc 持久化
permanent() ->
    call(permanent).

cast(Request) ->
    ?cast(Request).

call(Request) ->
    ?call(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(1000, self(), init_for_start),
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

do_handle_call({get_rank, RankID, Page, Key}, _From, State) ->
    Reply = lib_rank:get_rank(RankID, Page, Key),
    {reply, Reply, State};
do_handle_call({info, RankID}, _From, State) ->
    Reply = lib_rank:info(RankID),
    {reply, Reply, State};
do_handle_call({mfa, M, F, A}, _From, State) ->
    Reply = erlang:apply(M, F, A),
    {reply, Reply, State};
do_handle_call(permanent, _From, State) ->
    Reply = lib_rank:save_all_rank(),
%%    Reply = ok,
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(init_for_start, State) ->
    lib_rank:init_all_rank(),
    {noreply, State};
do_handle_cast(refresh_rank, State) ->
    sup_rank_svr:info_all(refresh_rank),
    {noreply, State};
do_handle_cast({role_delete, RoleIDs}, State) ->
    sup_rank_svr:info_all({role_delete, RoleIDs}),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
