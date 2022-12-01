%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_territory_mgr).
-author("Ryuu").

-include("common.hrl").
-include("territory.hrl").

-behaviour(gen_server).

%% API
-export([
    i/0,
    p/0,
    call/1,
    cast/1,
    enter/1,
    leave/2,
    role_enter/2,
    start_link/0,
    switch_room/2,
    get_progress/2,
    upload_result/3,
    stop_activity/1,
    start_activity/1,
    remove_activity/1,
    prepare_activity/1
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

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

i() ->
    call(info).

p() ->
    dist:whereis_name(local, ?SERVER).

prepare_activity(Activity) ->
    Now = time:unixtime(),
    Rumor = config:get_sys_config(territory_prepare_rumor),
    EndTime = lib_activity:get_end_time(Activity),
    Min = erlang:ceil((EndTime - Now) / 60),
    svr_rumor:publish(world, Rumor, [?STR(Min)]).

start_activity(Activity) ->
    Spec = {?MODULE, {?MODULE, start_link, []},
        transient, 10000, worker, [?MODULE]},
    sup_activity:start_activity(Spec),
    cast({start_activity, Activity}).

stop_activity(Activity) ->
    cast({stop_activity, Activity}).

remove_activity(Activity) ->
    cast({remove_activity, Activity}),
    sup_activity:stop_activity(?SERVER).

enter(EnterInfo) ->
    cast({enter, EnterInfo}).

role_enter(SceneID, RoleID) ->
    lib_territory_mgr:is_prepare_scene(SceneID) andalso begin
        cast({role_enter, RoleID})
    end.

leave(SceneID, RoleID) ->
    lib_territory_mgr:is_prepare_scene(SceneID) andalso begin
        cast({leave, RoleID})
    end.

switch_room(RoleID, RoomID) ->
    cast({switch_room, RoleID, RoomID}).

get_progress(RoleID, GuildID) ->
    cast({get_progress, RoleID, GuildID}).

upload_result(LineID, RoomInfo, Winner) ->
    cast({upload_result, LineID, RoomInfo, Winner}).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    erlang:process_flag(trap_exit, true),
    State = lib_territory_mgr:init(),
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
    {reply, State, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({start_activity, Activity}, #{stage := ?TERRITORY_STAGE_UNDEFINED} = State) ->
    NewState = lib_territory_mgr:start_activity(State, Activity),
    {noreply, NewState};
do_handle_cast({stop_activity, Activity}, State) ->
    NewState = lib_territory_mgr:stop_activity(State, Activity),
    {noreply, NewState};
do_handle_cast({remove_activity, Activity}, State) ->
    NewState = lib_territory_mgr:remove_activity(State, Activity),
    {stop, normal, NewState};
do_handle_cast({wait_results, N}, State) ->
    NewState = lib_territory_mgr:wait_results(State, N),
    {noreply, NewState};
do_handle_cast({upload_result, LineID}, State) ->
    NewState = lib_territory_mgr:handle_result(State, LineID),
    {noreply, NewState};
do_handle_cast(_, #{stage := ?TERRITORY_STAGE_SETTLING} = State) ->
    {noreply, State};
do_handle_cast(_, #{stage := ?TERRITORY_STAGE_SETTLED} = State) ->
    {noreply, State};
do_handle_cast({enter, EnterInfo}, State) ->
    lib_territory_mgr:enter(State, EnterInfo),
    {noreply, State};
do_handle_cast({leave, RoleID}, State) ->
    lib_territory_mgr:leave(State, RoleID),
    {noreply, State};
do_handle_cast({switch_room, RoleID, RoomID}, State) ->
    lib_territory_mgr:switch_room(State, RoleID, RoomID),
    {noreply, State};
do_handle_cast({get_progress, RoleID, GuildID}, State) ->
    lib_territory_mgr:get_progress(RoleID, GuildID),
    {noreply, State};
do_handle_cast({role_enter, RoleID}, State) ->
    lib_territory_mgr:role_enter(RoleID),
    {noreply, State};
do_handle_cast(_, #{stage := ?TERRITORY_STAGE_BATTLE} = State) ->
    {noreply, State};
do_handle_cast(start_battle, State) ->
    NewState = lib_territory_mgr:start_battle(State),
    {noreply, NewState};
do_handle_cast(_Request, State) ->
    {noreply, State}.
