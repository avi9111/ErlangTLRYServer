%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [管理]
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_dynasty_war_mgr).
-author("Ryuu").

-include("common.hrl").
-include("ret_code.hrl").

-behavior(gen_server).

%% API
-export([
    p/1,
    i/1,
    enter/2,
    leave/2,
    leave/3,
    start_link/1,
    stop_activity/1,
    start_activity/1
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

%% =============================================================================
%% API
%% =============================================================================

%% @doc 启动活动
start_activity(Activity) ->
    #{group_id := GroupID} = Activity,
    sup_dynasty_war_mgr:start_child(GroupID),
    cast(GroupID, {start_activity, Activity}).

stop_activity(Activity) ->
    #{group_id := GroupID} = Activity,
    cast(GroupID, {stop_activity, Activity}),
    sup_dynasty_war_mgr:stop_child(p(GroupID)).

start_link(GroupID) ->
    RegName = get_reg_name(GroupID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [GroupID], []).

i(GroupID) ->
    call(GroupID, {info, GroupID}).

p(GroupID) ->
    RegName = get_reg_name(GroupID),
    dist:whereis_name(?SCOPE, RegName).

%% @doc 进入
 enter(GroupID, EnterInfo) ->
    cast(GroupID, {enter, GroupID, EnterInfo}).

%% @doc 离开
leave(SceneID, LineID, RoleID) ->
    case lib_dynasty_war:is_in_scene(SceneID) of
        true ->
            leave(LineID div 1000, RoleID);
        _ ->
            ignore
    end.

leave(GroupID, RoleID) ->
    cast(GroupID, {leave, RoleID}).

call(GroupID, Request) ->
    ?call(GroupID, Request).

cast(GroupID, Request) ->
    ?cast(GroupID, Request).

get_reg_name(GroupID) ->
    dist:get_local_name([?MODULE, "_", GroupID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([GroupID]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_dynasty_war:init(GroupID),
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

do_handle_call({info, GroupID}, _From, State) ->
    Reply = lib_dynasty_war:info(GroupID),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({start_activity, Activity}, State) ->
    lib_dynasty_war:start_activity(Activity),
    {noreply, State};
do_handle_cast({stop_activity, Activity}, State) ->
    lib_dynasty_war:stop_activity(Activity),
    {noreply, State};
do_handle_cast({enter, GroupID, EnterInfo}, State) ->
    lib_dynasty_war:enter(GroupID, EnterInfo),
    {noreply, State};
do_handle_cast({leave, GroupID, RoleID}, State) ->
    lib_dynasty_war:leave(GroupID, RoleID),
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_dynasty_war:loop(State, Now),
    {noreply, State};
do_handle_cast(match_end, State) ->
    lib_dynasty_war:match_end(State),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
