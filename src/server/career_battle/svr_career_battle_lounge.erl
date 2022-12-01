%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技休息室
%%% @end
%%% Created : 31. 十月 2018 14:34
%%%-------------------------------------------------------------------
-module(svr_career_battle_lounge).

-include("role.hrl").
-include("op_type.hrl").
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
    do_handle_cast/2
]).

-export([
    enter/2,
    leave/2,
    lounge_info/3,
    p/1,
    cast/2,
    call/2
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%%%===================================================================
%%% API
%%%===================================================================

start_link(RoomID) ->
    RegName = reg_name(RoomID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [RoomID], []).

enter(RoomID, EnterInfo) ->
    cast(RoomID, {enter, EnterInfo}).

leave(RoomID, RoleID) ->
    cast(RoomID, {leave, RoleID}).

lounge_info(RoomID, RoleID, RoleSid) ->
    cast(RoomID, {lounge_info, RoleID, RoleSid}).

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

init([RoomID]) ->
    {Career, Grade} = lib_role_career_battle:decode_lounge_room_id(RoomID),
    BaseID = lib_role_career_battle:make_bat_room_base(Career, Grade),
    erlang:process_flag(trap_exit, true),
    {ok, #career_battle{room_id = RoomID, bat_base_id = BaseID}}.

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

do_handle_cast(prepare_match, State) ->
    #{match_interval := Interval, wait_time := WaitTime} = conf_career_battle_info:get(),
    {noreply, State#career_battle{match_time = time:unixtime() + Interval + WaitTime}};

do_handle_cast(begin_match, State) ->
    #{match_interval := Interval} = conf_career_battle_info:get(),
    {ok, NewState} = lib_career_battle_l:match(State),
    {noreply, NewState#career_battle{match_time = time:unixtime() + Interval}};

do_handle_cast({enter, EnterInfo}, #career_battle{online = Online} = State) ->
    lib_career_battle_l:enter(EnterInfo, State),
    NewOnline = sets:add_element(EnterInfo#career_battle_role.id, Online),
    {noreply, State#career_battle{online = NewOnline}};

do_handle_cast({leave, RoleID}, #career_battle{online = Online} = State) ->
    NewOnline = sets:del_element(RoleID, Online),
    {noreply, State#career_battle{online = NewOnline}};

do_handle_cast({lounge_info, RoleID, RoleSid}, State) ->
    lib_career_battle_l:lounge_info(RoleID, RoleSid, State),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.
