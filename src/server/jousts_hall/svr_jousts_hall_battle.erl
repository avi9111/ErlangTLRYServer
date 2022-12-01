%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂 战斗进程
%%% @end
%%% Created : 13. 十一月 2018 19:27
%%%-------------------------------------------------------------------
-module(svr_jousts_hall_battle).

-behaviour(gen_server).

-include("role.hrl").
-include("ret_code.hrl").
-include("jousts_hall.hrl").

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
    p/1,
    cast/2,
    call/2
]).

-export([
    enter/3,
    boss_hurt/4,
    boss_die/2,
    mon_die/2,
    role_die/3,
    leave/3,
    info/3,
    get_rank/3,
    get_score/3,
    team_changed/3
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).

%%%===================================================================
%%% API
%%%===================================================================

start_link([SceneID | _] = Args) ->
    RegName = reg_name(SceneID),
    gen_server:start_link({?SCOPE, RegName}, ?MODULE, [Args], []).

%% @doc 进入战场
enter(SceneID, RoleID, RoleData) ->
    cast(SceneID, {enter, RoleID, RoleData}).

%% @doc BOSS死亡
boss_die(SceneID, KillerRole) ->
    cast(SceneID, {boss_die, KillerRole}).

%% @doc 小怪死亡
mon_die(SceneID, Roles) ->
    cast(SceneID, {mon_die, Roles}).

%% @doc BOSS受击
boss_hurt(SceneID, GuildID, Hurt, NewHp) ->
    cast(SceneID, {boss_hurt, GuildID, Hurt, NewHp}).

%% @doc 玩家死亡
role_die(SceneID, DieRoleID, Roles) ->
    cast(SceneID, {role_die, DieRoleID, Roles}).

%% @doc 离开战场
leave(SceneID, RoleID, Type) ->
    cast(SceneID, {leave, RoleID, Type}).

%% @doc 查看信息
info(SceneID, RoleID, RoleSid) ->
    cast(SceneID, {info, RoleID, RoleSid}).

%% @doc 查看排行榜
get_rank(SceneID, RoleID, RoleSid) ->
    cast(SceneID, {get_rank, RoleID, RoleSid}).

%% @doc 查看积分
get_score(SceneID, RoleID, RoleSid) ->
    cast(SceneID, {get_score, RoleID, RoleSid}).

%% @doc 队伍变化
team_changed(SceneID, RoleID, TeamID) ->
    cast(SceneID, {team_changed, RoleID, TeamID}).

%% @doc call
call(SceneID, Request) ->
    case p(SceneID) of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(SceneID, Request) ->
    case p(SceneID) of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% @doc 获取Boss Pid
p(Pid) when is_pid(Pid) ->
    Pid;
p(SceneID) ->
    RegName = reg_name(SceneID),
    dist:whereis_name(?SCOPE, RegName).

reg_name(SceneID) ->
    dist:get_local_name([?MODULE, "_", SceneID]).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([Args]) ->
    State = lib_jousts_hall_battle:init(Args),
    erlang:process_flag(trap_exit, true),
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

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({info, RoleID, RoleSid}, State) ->
    lib_jousts_hall_battle:info(RoleID, RoleSid, State),
    {noreply, State};

do_handle_cast({enter, RoleID, RoleData}, State) ->
    NewState = lib_jousts_hall_battle:enter(RoleID, RoleData, State),
    {noreply, NewState};

do_handle_cast({leave, RoleID, Type}, State) ->
    NewState = lib_jousts_hall_battle:leave(RoleID, Type, State),
    {noreply, NewState};

do_handle_cast({get_rank, RoleID, RoleSid}, State) ->
    lib_jousts_hall_battle:get_rank(RoleID, RoleSid, State),
    {noreply, State};

do_handle_cast({prapare, WarID, Stage, StageEndTime}, State) ->
    NewState = lib_jousts_hall_battle:prapare(WarID, Stage, StageEndTime, State),
    {noreply, NewState};

do_handle_cast({refresh_boss, MTypeID}, State) ->
    Hp = lib_scene_api:get_mon_hp(MTypeID),
    {noreply, State#jousts_b{boss_hp = Hp}};

do_handle_cast(poison_begin, State) ->
    lib_jousts_hall_battle:poison_begin(),
    {noreply, State#jousts_b{is_poison_open = 1}};

do_handle_cast(poison_end, State) ->
    NewState = lib_jousts_hall_battle:poison_end(State),
    {noreply, NewState};

do_handle_cast(enter_next_war, State) ->
    lib_jousts_hall_battle:enter_next_war(State),
    {noreply, State};

do_handle_cast({boss_die, KillerRole}, State) ->
    NewState = lib_jousts_hall_battle:boss_die(KillerRole, State),
    {noreply, NewState};

do_handle_cast(finish, State) ->
    NewState = lib_jousts_hall_battle:finish(State),
    {noreply, NewState};

do_handle_cast({mon_die, Roles}, State) ->
    NewState = lib_jousts_hall_battle:mon_die(Roles, State),
    {noreply, NewState};

do_handle_cast({boss_hurt, GuildID, Hurt, NewHp}, State) ->
    NewState = lib_jousts_hall_battle:boss_hurt(GuildID, Hurt, NewHp, State),
    {noreply, NewState};

do_handle_cast({role_die, DieRoleID, Roles}, State) ->
    NewState = lib_jousts_hall_battle:role_die(Roles, DieRoleID, State),
    {noreply, NewState};

do_handle_cast({get_score, RoleID, RoleSid}, State) ->
    lib_jousts_hall_battle:get_score(RoleID, RoleSid),
    {noreply, State};

do_handle_cast({team_changed, RoleID, TeamID}, State) ->
    lib_jousts_hall_battle:team_changed(RoleID, TeamID),
    {noreply, State};

do_handle_cast({loop, Now}, State) ->
    lib_jousts_hall_battle:loop(Now, State),
    {noreply, State};

do_handle_cast(_Request, State) ->
    {noreply, State}.


%% =============================================================================
%% Private
%% =============================================================================