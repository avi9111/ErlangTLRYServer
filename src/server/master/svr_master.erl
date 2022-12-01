%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_master).
-author("Ryuu").

-include("common.hrl").
-include("master.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    rob/2,
    call/1,
    cast/1,
    chap/1,
    get_log/1,
    get_info/1,
    get_rank/1,
    register/2,
    rob_result/3,
    start_link/0,
    chap_result/2,
    stop_activity/1,
    start_activity/1,
    remove_activity/1
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

%% =============================================================================
%% API
%% =============================================================================

%% @doc start activity
start_activity(Activity) ->
    Spec = {?MODULE, {?MODULE, start_link, []},
        transient, 10000, worker, [?MODULE]},
    sup_activity:start_activity(Spec),
    cast({start_activity, Activity}).

%% @doc stop activity
stop_activity(Activity) ->
    cast({stop_activity, Activity}).

%% @doc remove activity
remove_activity(_Activity) ->
    sup_activity:stop_activity(?MODULE).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(local, ?SERVER).

%% @doc get log
get_log(RoleID) ->
    cast({get_log, RoleID}).

%% @doc get info
get_info(RoleID) ->
    cast({get_info, RoleID}).

%% @doc get rank list
get_rank(RoleID) ->
    cast({get_rank, RoleID}).

register(RoleID, Opt) ->
    cast({register, RoleID, Opt}).

%% @doc challenge master
chap(RoleID) ->
    cast({chap, RoleID}).

%% @doc challenge result
chap_result(RoleID, Hurt) ->
    cast({chap_result, RoleID, Hurt}).

%% @doc rob role resources
rob(RoleID, TargetID) ->
    cast({rob, RoleID, TargetID}).

%% @doc rob result
rob_result(RoleID, TargetID, Succ) ->
    cast({rob_result, RoleID, TargetID, Succ}).

cast(Request) ->
    ?cast(Request).

call(Request) ->
    ?call(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_master:init(),
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
    Reply = lib_master:info(State),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({start_activity, _Activity}, State) ->
    NewState = lib_master:start_activity(State),
    {noreply, NewState};
do_handle_cast({get_log, RoleID}, State) ->
    lib_master:get_log(State, RoleID),
    {noreply, State};
do_handle_cast({get_info, RoleID}, State) ->
    lib_master:get_info(State, RoleID),
    {noreply, State};
do_handle_cast({get_rank, RoleID}, State) ->
    lib_master:get_rank(State, RoleID),
    {noreply, State};
do_handle_cast({chap, RoleID}, State) ->
    NewState = lib_master:chap(State, RoleID),
    {noreply, NewState};
do_handle_cast({rob, RoleID, TargetID}, State) ->
    NewState = lib_master:rob(State, RoleID, TargetID),
    {noreply, NewState};
do_handle_cast(_, #{state := ?MASTER_FINISH} = State) ->
    {noreply, State};
do_handle_cast({remove_activity, _Activity}, State) ->
    NewState = lib_master:remove_activity(State),
    {noreply, NewState};
do_handle_cast({settle_up, EndType}, State) ->
    NewState = lib_master:settle_up(State, EndType),
    {noreply, NewState};
do_handle_cast({chap_result, RoleID, Hurt}, State) ->
    NewState = lib_master:chap_result(State, RoleID, Hurt),
    {noreply, NewState};
do_handle_cast({rob_result, RoleID, TargetID, Succ}, State) ->
    NewState = lib_master:rob_result(State, RoleID, TargetID, Succ),
    {noreply, NewState};
do_handle_cast(_, #{state := ?MASTER_SETTLE} = State) ->
    {noreply, State};
do_handle_cast({stop_activity, _Activity}, State) ->
    NewState = lib_master:stop_activity(State),
    {noreply, NewState};
do_handle_cast({loop, Now}, State) ->
    NewState = lib_master:loop(State, Now),
    {noreply, NewState};
do_handle_cast({register, RoleID, Opt}, State) ->
    NewState = lib_master:register(State, RoleID, Opt),
    {noreply, NewState};
do_handle_cast(_Request, State) ->
    {noreply, State}.
