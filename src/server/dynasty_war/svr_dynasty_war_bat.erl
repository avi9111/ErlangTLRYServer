%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [战斗]
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_dynasty_war_bat).
-author("Ryuu").

-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    call/2,
    cast/2,
    hurt_role/4,
    kill_role/4,
    start_link/1,
    timer_score/2
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

%% =============================================================================
%% API
%% =============================================================================

start_link([RoomInfo | _] = Args) ->
    #{id := RoomID} = RoomInfo, %% LineID =:= RoomID
    RegName = get_reg_name(RoomID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [Args], []).

i(LineID) ->
    call(LineID, info).

p(LineID) ->
    RegName = get_reg_name(LineID),
    dist:whereis_name(?SCOPE, RegName).

%% @doc 定时加积分
timer_score(LineID, ZoneRoles) ->
    cast(LineID, {timer_score, ZoneRoles}).

%% @doc 攻击玩家
hurt_role(SceneID, LineID, RoleID, Hurt) ->
    lib_dynasty_war:is_battle_scene(SceneID) andalso begin
        cast(LineID, {hurt_role, RoleID, Hurt})
    end.

%% @doc 击杀玩家
kill_role(SceneID, LineID, RoleID, TargetID) ->
    lib_dynasty_war:is_battle_scene(SceneID) andalso begin
        cast(LineID, {kill_role, RoleID, TargetID})
    end.

call(GroupID, Request) ->
    ?call(GroupID, Request).

cast(GroupID, Request) ->
    ?cast(GroupID, Request).

get_reg_name(GroupID) ->
    dist:get_local_name([?MODULE, "_", GroupID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([Args]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_dynasty_war_b:init(Args),
    {ok, State}.

handle_call(Request, From, State) ->
    ?DO_HANDLE_CALL(Request, From, State).

handle_cast(Request, State) ->
    ?DO_HANDLE_CAST(Request, State).

handle_info(Info, State) ->
    ?DO_HANDLE_CAST(Info, State).

terminate(_Reason, State) ->
    lib_dynasty_war_b:stop_clear(State),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

do_handle_call(info, _From, State) ->
    Reply = lib_dynasty_war_b:info(State),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({loop, Now}, State) ->
    lib_dynasty_war_b:loop(State, Now),
    {noreply, State};
do_handle_cast({hurt_role, RoleID, Hurt}, State) ->
    lib_dynasty_war_b:hurt_role(RoleID, Hurt),
    {noreply, State};
do_handle_cast({kill_role, RoleID, TargetID}, State) ->
    lib_dynasty_war_b:kill_role(State, RoleID, TargetID),
    {noreply, State};
do_handle_cast({timer_score, ZoneRoles}, State) ->
    lib_dynasty_war_b:timer_score(State, ZoneRoles),
    {noreply, State};
do_handle_cast({switch_state, NextState}, State) ->
    NewState = lib_dynasty_war_b:switch_state(State, NextState),
    {noreply, NewState};
do_handle_cast(stop_clear, State) ->
%%    lib_dynasty_war_b:stop_clear(State),
    {stop, normal, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.
