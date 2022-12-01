%%-------------------------------------------------------
%% @File     : svr_scene_agent.erl
%% @Brief    : 场景管理
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
-module(svr_scene_agent).

-include("role.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("common.hrl").

-behaviour(gen_server).

-export([
    start_line/2,       % 启动场景进程
    start_link/2,       % 由 sup_scene_agent 的 start_child 调用
    load_scene/1        % 加载场景
]).

-export([
    push_cmd/2,         % 压入命令队列
    push_cmd/3,         % 压入命令队列
    apply_cast/4,       % 异步apply
    apply_cast/5,       % 异步apply
    apply_call/4,       % 同步apply
    apply_call/5,       % 同步apply
    cast_scene/2,       % cast场景
    cast_scene/3,       % cast场景
    call_scene/2,       % call场景
    call_scene/3        % call场景
]).

%%% Callbacks --------------------------------------------
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


%%% Apis -------------------------------------------------
%% @doc 启动场景模块
start_line(Scene, LineId) ->
    ConfScene = case is_integer(Scene) of
        true -> conf_scene:get(Scene);
        false -> Scene
    end,
    if
        is_record(ConfScene, scene) ->
            {ok, NewLinePid} = supervisor:start_child(sup_scene_agent, [ConfScene, LineId]),
            NewLinePid;
        true ->
            ?ERROR("Start Scene: ~p, LineId: ~p failed !", [Scene, LineId]),
            ignore
    end.

% @doc 不直接调用此函数
start_link(Scene, LineId) ->
    case util_svr:get_node_id() of
        ?NODE_ID_GAME ->
            gen_server:start_link(?MODULE, [Scene, LineId], []);
        _ ->
            SceneId = ?iif(is_record(Scene, scene), Scene#scene.id, Scene),
            gen_server:start_link({global, {scene, SceneId, LineId}}, ?MODULE, [Scene, LineId], [])
    end.

%% @doc 加载场景
%% @spec load_scene(RoleState) -> ok.
%% RoleState    :: #role_state{}
load_scene(RoleState) ->
    Pet = lib_role_pet:get_current_pet(),
    ScenePet = data_transfer:to_scene_pet(Pet),
    PetAddon = case ScenePet of
        #pet{base_attr = PetBaseAttr} ->
            lib_role_attr:base_to_bt_attr(RoleState#role_state.career, PetBaseAttr);
        _ ->
            []
    end,
    SkillList = RoleState#role_state.skill_list,
    SceneRolerT = data_transfer:to_scene_role(RoleState),
    ModPSkills = SceneRolerT#scene_role.mod_pskills,
    PEffectMap = lib_skill_util:gen_passive_effects(SkillList ++ ModPSkills),
    PEffectAttr = lib_effect_util:calc_passive_effect_attr(PEffectMap),
    SceneRoler = SceneRolerT#scene_role{pet_addon = PetAddon, peffect_attr = PEffectAttr, peffect_map = PEffectMap},
    #role_scene{scene_id = SceneId, line_pid = LinePid} = RoleState#role_state.role_scene,
    lib_role_agent:update(SceneRoler#scene_role.id, {#role_online.scene, SceneId}),
    TeamInfo = lib_team:get_role_team(RoleState#role_state.id),
    cast_scene(LinePid, {'load_scene', SceneRoler, ScenePet, TeamInfo}).

%% @doc 命令压入队列
push_cmd(LinePid, Cmd) ->
    cast_scene(LinePid, {'push_cmd', Cmd}).

push_cmd(SceneId, LineId, Cmd) ->
    cast_scene(SceneId, LineId, {'push_cmd', Cmd}).

%% @doc 通过场景调用函数 - cast
apply_cast(LinePid, M, F, A) ->
    cast_scene(LinePid, {'apply_cast', M, F, A}).

%% @doc 通过场景调用函数 - cast
apply_cast(SceneId, LineId, M, F, A) ->
    cast_scene(SceneId, LineId, {'apply_cast', M, F, A}).

%% @doc 通过场景调用函数(带catch) - call
apply_call(LinePid, M, F, A) when is_pid(LinePid) ->
    case catch gen:call(LinePid, '$gen_call', {'apply_call', M, F, A}) of
        {ok, Res} ->
            Res;
        Reason ->
            ?ERROR_FUNC_CALL([LinePid, M, F, A]),
            ?ERROR("Error reason: ~p", [Reason]),
            skip
    end;
apply_call(LinePid, M, F, A) ->
    ?ERROR_FUNC_CALL([LinePid, M, F, A]),
    ?ERROR("LinePid: ~p not a pid !", [LinePid]),
    skip.

%% @doc 通过场景调用函数(带catch) - call
apply_call(SceneId, LineId, M, F, A) ->
    case svr_scene_mgr:get_line_pid(SceneId, LineId) of
        Pid when is_pid(Pid) ->
            apply_call(Pid, M, F, A);
        _ ->
            ?ERROR("Error, scene pid not found !"),
            skip
    end.

%% @doc cast消息
cast_scene(#role_scene{line_pid = LinePid}, Msg) ->
    cast_scene(LinePid, Msg);
cast_scene(LinePid, Msg) when is_pid(LinePid) ->
    gen_server:cast(LinePid, Msg);
cast_scene(_Scene, _Msg) ->
    ?ERROR_FUNC_CALL([_Scene, _Msg]),
    false.

%% @doc cast消息
cast_scene(SceneId, LineId, Msg) ->
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    is_pid(LinePid) andalso gen_server:cast(LinePid, Msg).

%% @doc call消息(不带catch)
call_scene(#role_scene{line_pid = LinePid}, Msg) ->
    call_scene(LinePid, Msg);
call_scene(LinePid, Msg) when is_pid(LinePid) ->
    gen_server:call(LinePid, Msg);
call_scene(_Scene, _Msg) ->
    ?ERROR_FUNC_CALL([_Scene, _Msg]),
    false.

%% @doc call消息
call_scene(SceneId, LineId, Msg) when is_integer(SceneId) ->
    LinePid = svr_scene_mgr:get_line_pid(SceneId, LineId),
    call_scene(LinePid, Msg).


%% Callbacks ---------------------------------------------------------
% @doc 场景初始化
init([Scene, Line]) ->
    process_flag(trap_exit, true),
    SceneT = Scene#scene{line = Line},
    lib_scene_agent:dictionary_init(SceneT),
    SceneN = lib_scene_agent:start_scene_timers(SceneT),
    {ok, SceneN}.

% @doc 在场景进程调用 apply(M, F, A)
handle_call({'apply_call', Module, Method, Args}, _From, State) ->
    case catch apply(Module, Method, Args) of
        {'EXIT', Reason} ->
            ?ERROR("apply_call(~p, ~p, ~p) error !~nReason:=~p", [Module, Method, Args, Reason]),
            {reply, failed, State};
        Reply ->
            {reply, Reply, State}
    end;

handle_call(R, From, State) ->
    case catch svr_scene_agent_call:handle_call(R, From, State) of
        {reply, NewFrom, NewState} ->
            {reply, NewFrom, NewState};
        {noreply, NewState} ->
            {noreply, NewState};
        Reason ->
            ?ERROR("handle_call(~p, From, State) error !~nReason:=~p~n", [R, Reason]),
            {reply, error, State}
    end.

% @doc 在场景进程调用 apply(M, F, A)
handle_cast({'apply_cast', Module, Method, Args}, State) ->
    case catch apply(Module, Method, Args) of
        {'EXIT', Reason} ->
            ?ERROR("apply_cast(~p, ~p, ~p) error !~nReason:=~p", [Module, Method, Args, Reason]);
        _ ->
            ok
    end,
    {noreply, State};

handle_cast(R, State) ->
    case catch svr_scene_agent_cast:handle_cast(R, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        {stop, Reason, NewState} ->
            {stop, Reason, NewState};
        Reason ->
            ?ERROR("handle_cast(~p, State) error !~nReason:=~p~n", [R, Reason]),
            {noreply, State}
    end.

handle_info(R, State) ->
    case catch svr_scene_agent_info:handle_info(R, State) of
        {noreply, NewState} ->
            {noreply, NewState};
        {stop, Reason, NewState} ->
            {stop, Reason, NewState};
        Reason ->
            ?ERROR("handle_info(~p, State) error !~nReason:=~p~n", [R, Reason]),
            {noreply, State}
    end.

terminate(Reason, #scene{id = SceneId, line = LineId}) ->
    lists:member(Reason, [normal, shutdown]) orelse
        ?ERROR("svr_scene_agent is terminate, id: ~p, line:~p, reason:~p", [SceneId, LineId, Reason]),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ----------------------------------------------
