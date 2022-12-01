%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[战斗]
%%% @end
%%% Created : 31. 十月 2018 11:38
%%%-------------------------------------------------------------------
-module(svr_career_battle_bat).

-include("role.hrl").
-include("ret_code.hrl").
-include("career_battle.hrl").
-include("proto/prot_511.hrl").

-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    do_handle_call/3,
    do_handle_cast/2,
    p/1,
    call/2,
    cast/2
]).

-export([
    hurt_role/4,
    kill_role/3,
    leave/3
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

start_link([RoomID | _] = Args) ->
    RegName = reg_name(RoomID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [Args], []).

hurt_role(SceneID, RoomID, RoleID, Hurt) ->
    BSceneID = lib_role_career_battle:battle_scene(),
    SceneID =:= BSceneID andalso begin
                                     cast(RoomID, {hurt_role, RoleID, Hurt})
                                 end.

kill_role(SceneID, RoomID, KillerID) ->
    BSceneID = lib_role_career_battle:battle_scene(),
    SceneID =:= BSceneID andalso begin
                                     cast(RoomID, {kill_role, KillerID})
                                 end.

leave(RoomID, RoleID, Type) ->
    cast(RoomID, {leave, RoleID, Type}).

%% @doc call
call(RoomID, Request) ->
    case p(RoomID) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(RoomID, Request) ->
    case p(RoomID) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% @doc 获取Boss Pid
p(Pid) when is_pid(Pid) ->
    Pid;
p(RoomID) ->
    RegName = reg_name(RoomID),
    dist:whereis_name(?SCOPE, RegName).

reg_name(RoomID) ->
    dist:get_local_name([?MODULE, "_", RoomID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([Args]) ->
    erlang:process_flag(trap_exit, true),
    lib_career_battle_b:init(Args),
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

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({hurt_role, RoleID, Hurt}, State) ->
    lib_career_battle_b:hurt_role(RoleID, Hurt),
    {noreply, State};

do_handle_cast({kill_role, KillerID}, State) ->
    lib_career_battle_b:kill_role(KillerID),
    {noreply, State};

do_handle_cast(battle_end, State) ->
    lib_career_battle_b:battle_end(),
    {noreply, State};

do_handle_cast({leave, RoleID, Type}, State) ->
    lib_career_battle_b:leave(RoleID, Type),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.
