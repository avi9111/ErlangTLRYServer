%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂休息室兼活动流程控制
%%% @end
%%% Created : 13. 十一月 2018 19:27
%%%-------------------------------------------------------------------
-module(svr_jousts_hall_lounge).

-behaviour(gen_server).

-include("role.hrl").
-include("ets_defines.hrl").
-include("ret_code.hrl").
-include("scene.hrl").
-include("jousts_hall.hrl").

%% API
-export([start_link/0]).

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
    prepare_activity/1,
    start_activity/1,
    stop_activity/1,
    p/0,
    cast/1,
    call/1
]).

-export([
    get_stat/0,
    enter/3,
    leave/1,
    info/1,
    gm_change_stage/1,
    collect_round_res/1,
    get_score/2,
    die_enter/2,
    team_changed/2
]).

-define(SERVER, ?MODULE).
-define(SCOPE, local).


%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({?SCOPE, ?SERVER}, ?MODULE, [], []).

prepare_activity(_Activity) ->
    svr_rumor:publish(world, 20801).

start_activity(_Activity) ->
    Child = {sup_jousts_hall, {sup_jousts_hall, start_link, []},
        temporary, 10000, supervisor, [sup_jousts_hall]},
    _ = sup_activity:start_activity(Child),
    %% 启动战场进程和所有战斗场景
    SceneIDs = conf_jousts_hall_war:get_scenes(),
    WorldLv = util_svr:get_world_lv(),
    [
        begin
            sup_jousts_hall_battle:start_child([SceneID, WorldLv]),
            svr_scene_mgr:add_scene_line_asyn(SceneID, 1)
        end || SceneID <- SceneIDs
    ],
    svr_rumor:publish(world, 20802),
    cast({start_activity, WorldLv}),
    ok.

stop_activity(_Activity) ->
    cast(stop_activity),
    %% 关闭所有场景进程
    SceneIDs = conf_jousts_hall_war:get_scenes(),
    lists:foreach(fun(SceneID) ->
        svr_scene_mgr:close_scene(SceneID)
    end, SceneIDs),
    #{foyer_scene := FSceneID} = conf_jousts_hall_info:get(),
    case ets:lookup(?ETS_SCENE_MGR, FSceneID) of
        [#ets_scene{}] ->
            svr_scene_mgr:close_scene(FSceneID);
        _ ->
            skip
    end,
    %% 关闭战斗室进程
    sup_jousts_hall_battle:stop_all(),
    %% 关闭休息室进程
    sup_jousts_hall:stop_activity(svr_jousts_hall_lounge),
    %% 关闭战斗室监督者进程
    sup_jousts_hall:stop_activity(sup_jousts_hall_battle),
    %% 关闭演武堂活动监督者进程
    sup_activity:stop_activity(sup_jousts_hall),
    ok.

%% @doc 进入
enter(RoleID, RoleSid, EnterInfo) ->
    cast({enter, RoleID, RoleSid, EnterInfo}).

%% @doc 离开休息室
leave(RoleID) ->
    cast({leave, RoleID}).

%% 获取当前状态
get_stat() ->
    call(get_stat).

%% @doc 信息
info(RoleSid) ->
    cast({info, RoleSid}).

%% @doc 收集结果
collect_round_res(RoleList) ->
    cast({collect_round_res, RoleList}).

get_score(RoleID, RoleSid) ->
    cast({get_score, RoleID, RoleSid}).

die_enter(RoleID, Score) ->
    cast({die_enter, RoleID, Score}).

%% @doc 队伍变化
team_changed(RoleID, TeamID) ->
    cast({team_changed, RoleID, TeamID}).

%%%% @doc MFA
%%mfa(M, F) ->
%%    mfa(M, F, []).
%%
%%mfa(M, F, A) ->
%%    cast({mfa, M, F, A}).
gm_change_stage(Stage) ->
    cast({stage, Stage}).

%% @doc call
call(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:call(Pid, Request);
        _ ->
            {error, ?RC_LINK_ACTIVITY_PREPARE}
    end.

%% @doc cast
cast(Request) ->
    case p() of
        Pid when is_pid(Pid) ->
            gen_server:cast(Pid, Request);
        _ ->
            ignore
    end.

%% @doc
p() ->
    dist:whereis_name(?SCOPE, ?SERVER).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    erlang:process_flag(trap_exit, true),
    {ok, #jousts_l{scene_id = ForyerScene}}.

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

do_handle_call(get_stat, _From, State) ->
    #jousts_l{stage = Stage, war_id = WarID} = State,
    Reply =
    case Stage =:= ?WAIT_STAGE andalso WarID =:= ?ROUND_ZERO of
        true ->
            ok;
        _ ->
            {error, ?RC_JOUSTS_HALL_ALREADY_BEGIN}
    end,
    {reply, Reply, State};

do_handle_call(_Request, _From, State) ->
    {reply, ok, State}.

do_handle_cast({start_activity, WorldLv}, State) ->
    NewState = lib_jousts_hall_lounge:start_activity(State),
    {noreply, NewState#jousts_l{world_lv = WorldLv}};

do_handle_cast(stop_activity, State) ->
    lib_jousts_hall_lounge:stop_activity(),
    {noreply, State};

do_handle_cast({enter, RoleID, RoleSid, EnterInfo}, State) ->
    NewState = lib_jousts_hall_lounge:enter(RoleID, RoleSid, EnterInfo, State),
    {noreply, NewState};

do_handle_cast({info, RoleSid}, State) ->
    lib_jousts_hall_lounge:info(RoleSid, State),
    {noreply, State};

do_handle_cast({leave, RoleID}, State) ->
    lib_jousts_hall_lounge:leave(RoleID),
    {noreply, State};

do_handle_cast({collect_round_res, RoleList}, State) ->
    NewState = lib_jousts_hall_lounge:collect_round_res(RoleList, State),
    {noreply, NewState};

do_handle_cast({get_score, RoleID, RoleSid}, State) ->
    lib_jousts_hall_lounge:get_score(RoleID, RoleSid),
    {noreply, State};

do_handle_cast({die_enter, RoleID, Score}, State) ->
    lib_jousts_hall_lounge:die_enter(RoleID, Score),
    {noreply, State};

do_handle_cast({team_changed, RoleID, TeamID}, State) ->
    lib_jousts_hall_lounge:team_changed(RoleID, TeamID),
    {noreply, State};

do_handle_cast({stage, Stage}, State) ->
    NewState = lib_jousts_hall_lounge:swich_stage(Stage, State),
    {noreply, NewState};

do_handle_cast(_Request, State) ->
    {noreply, State}.


%% =============================================================================
%% Private
%% =============================================================================