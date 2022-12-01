%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(svr_territory_battle).
-author("Ryuu").

-include("common.hrl").
-include("territory.hrl").

-behaviour(gen_server).

%% API
-export([
    i/1,
    p/1,
    call/2,
    cast/2,
    leave/3,
    coll_fin/3,
    get_rank/2,
    beat_drum/4,
    heal_role/4,
    hurt_role/4,
    kill_role/4,
    role_enter/3,
    start_link/1
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

start_link([LineID | _] = Args) ->
    RegName = get_reg_name(LineID),
    gen_server:start_link({local, RegName}, ?MODULE, Args, []).

i(LineID) ->
    call(LineID, info).

p(LineID) ->
    RegName = get_reg_name(LineID),
    dist:whereis_name(local, RegName).

beat_drum(LineID, RoleID, ID, BuffLv) ->
    call(LineID, {beat_drum, RoleID, ID, BuffLv}).

get_rank(LineID, RoleID) ->
    cast(LineID, {get_rank, RoleID}).

role_enter(SceneID, LineID, RoleID) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {role_enter, RoleID})
    end.

leave(SceneID, LineID, RoleID) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {role_leave, RoleID})
    end.

hurt_role(SceneID, LineID, RoleID, Hp) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {hurt_role, RoleID, Hp})
    end.

heal_role(SceneID, LineID, RoleID, Hp) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {heal_role, RoleID, Hp})
    end.

kill_role(SceneID, LineID, RoleID, TargetID) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {kill_role, RoleID, TargetID})
    end.

coll_fin(SceneID, LineID, RoleID) ->
    lib_territory_mgr:is_battle_scene(SceneID) andalso begin
        cast(LineID, {coll_fin, RoleID})
    end.

call(LineID, Request) ->
    ?call(LineID, Request).

cast(LineID, Request) ->
    ?cast(LineID, Request).

get_reg_name(LineID) ->
    dist:get_local_name([?MODULE, LineID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init(Args) ->
    erlang:process_flag(trap_exit, true),
    State = lib_territory_battle:init(Args),
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
    Reply = State,
    {reply, Reply, State};
do_handle_call({beat_drum, RoleID, ID, BuffLv}, _From, State) ->
    Reply = lib_territory_battle:beat_drum(State, RoleID, ID, BuffLv),
    {reply, Reply, State};
do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast(settle_up, State) ->
    NewState = lib_territory_battle:settle_up(State),
    {noreply, NewState};
do_handle_cast(_, #{stage := ?TERRITORY_STAGE_SETTLED} = State) ->
    {noreply, State};
do_handle_cast({loop, Now}, State) ->
    lib_territory_battle:loop(State, Now),
    {noreply, State};
do_handle_cast({get_rank, RoleID}, State) ->
    lib_territory_battle:get_rank(RoleID),
    {noreply, State};
do_handle_cast({role_enter, RoleID}, State) ->
    lib_territory_battle:role_enter(RoleID),
    {noreply, State};
do_handle_cast({hurt_role, RoleID, Hp}, State) ->
    lib_territory_battle:hurt_role(RoleID, Hp),
    {noreply, State};
do_handle_cast({kill_role, RoleID, TargetID}, State) ->
    lib_territory_battle:kill_role(RoleID, TargetID),
    {noreply, State};
do_handle_cast({coll_fin, RoleID}, State) ->
    lib_territory_battle:coll_fin(RoleID),
    {noreply, State};
do_handle_cast({occupy_room, LineID, Ref}, State) ->
    lib_territory_battle:occupy_room(LineID, Ref),
    {noreply, State};
do_handle_cast(_Request, State) ->
    {noreply, State}.

