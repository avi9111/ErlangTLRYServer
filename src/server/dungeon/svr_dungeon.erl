%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_dungeon).
-author("Ryuu").

-include("scene.hrl").
-include("common.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    call/2,
    cast/2,
    stop/2,
    start/1,
    enter/4,
    leave/3,
    mon_die/3,
    mon_drop/4,
    reg_name/1,
    role_die/3
]).

%% gen_server callbacks
-export([
    init/1,
    terminate/2,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    code_change/3
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API
%% =============================================================================

start(Args) ->
    gen_server:start_link(?MODULE, Args, []).

i(ID) ->
    call(ID, info).

enter(SceneID, LineID, RoleID, Enter) ->
    lib_dungeon_util:is_dung_scene(SceneID) andalso begin
        cast({SceneID, LineID}, {enter, RoleID, Enter})
    end.

leave(SceneID, LineID, RoleID) ->
    lib_dungeon_util:is_dung_scene(SceneID) andalso begin
        cast({SceneID, LineID}, {leave, RoleID})
    end.

role_die(SceneID, LineID, RoleID) ->
    lib_dungeon_util:is_dung_scene(SceneID) andalso begin
        cast({?SCENE_ID, LineID}, {role_die, RoleID})
    end.

mon_die(SceneID, LineID, #mon{mid = MonID}) ->
    lib_dungeon_util:is_dung_scene(SceneID) andalso begin
        cast({SceneID, LineID}, {kill_mon, MonID})
    end.

mon_drop(SceneID, LineID, DropID, MID) ->
    lib_dungeon_util:is_dung_scene(SceneID) andalso begin
        cast({SceneID, LineID}, {mon_drop, DropID, MID})
    end.

stop(SceneID, LineID) ->
    cast({SceneID, LineID}, stop).

cast(LineID, Request) ->
    ?cast(LineID, Request).

call(LineID, Request) ->
    ?call(LineID, Request).

p(Pid) when is_pid(Pid) ->
    Pid;
p({SceneID, LineID}) ->
    RegName = reg_name({SceneID, LineID}),
    dist:whereis_name(local, RegName).

reg_name({SceneID, LineID}) ->
    dist:get_local_name([?MODULE, SceneID, LineID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init(Args) ->
    State = lib_dungeon:init(Args),
    {ok, State}.

handle_call(info, _From, State) ->
    Reply = lib_dungeon:info(State),
    {reply, Reply, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({enter, RoleID, Enter}, State) ->
    NewState = lib_dungeon:enter(State, RoleID, Enter),
    {noreply, NewState};
handle_cast({leave, RoleID}, State) ->
    NewState = lib_dungeon:leave(State, RoleID),
    {noreply, NewState};
handle_cast({role_die, RoleID}, State) ->
    NewState = lib_dungeon:role_die(State, RoleID),
    {noreply, NewState};
handle_cast({kill_mon, MonID}, State) ->
    NewState = lib_dungeon:kill_mon(State, MonID),
    {noreply, NewState};
handle_cast({mon_drop, DropID, MID}, State) ->
    NewState = lib_dungeon:mon_drop(State, DropID, MID),
    {noreply, NewState};
handle_cast(stop, State) ->
    {stop, normal, State};
handle_cast(_Request, State) ->
    {noreply, State}.

handle_info({refresh_wave, Wave}, State) ->
    NewState = lib_dungeon:refresh_wave(State, Wave),
    {noreply, NewState};
handle_info({finish_wave, Wave}, State) ->
    NewState = lib_dungeon:finish_wave(State, Wave),
    {noreply, NewState};
handle_info({wave_timeout, Wave}, State) ->
    NewState = lib_dungeon:wave_timeout(State, Wave),
    {noreply, NewState};
handle_info({finish_dung, Type}, State) ->
    NewState = lib_dungeon:finish_dung(State, Type),
    {noreply, NewState};
handle_info(stop_clear, State) ->
    NewState = lib_dungeon:stop_clear(State, true),
    {stop, normal, NewState};
handle_info(stop, State) ->
    NewState = lib_dungeon:stop_clear(State, false),
    {stop, normal, NewState};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% =============================================================================
%% Internal functions
%% =============================================================================

