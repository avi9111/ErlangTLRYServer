%%-------------------------------------------------------
%% @File     : svr_cluster_scene_agent.erl
%% @Brief    : 跨服集群场景代理(10节点)
%% @Author   : cablsbs
%% @Date     : 2018-9-27
%%-------------------------------------------------------
-module(svr_cluster_scene_agent).

-behaviour(gen_server).

-include("scene.hrl").
-include("common.hrl").
-include("cluster.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").

-export([
    start_link/0,
    get_line_id/1,              % 获取跨服场景分线id
    get_line_pid/2,             % 获取跨服场景分线pid
    get_line_info/1,            % 获取跨服场景分线信息(客户端查看)
    get_best_line_id_pid/2,     % 获取跨服场景最空闲分线id和pid
    new_scene_line/4,           % 新场景分线
    update_scene_lines/2,       % 更新场景分线
    del_scene_line/2,           % 关闭场景分线
    sync_scene_lines/2,         % 新场景分线
    sync_role_num/3             % 同步分线人数
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

% 场景管理进程
-record(cluster_scene_agent_st, {
    server_num = 0,
    cluster_scene_mgr = undefined
}).


%% Apis -------------------------------------------------------
% @doc 启动跨服场景代理
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

% @doc 获取跨服场景分线id (只对10节点开放)
get_line_id(SceneId) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =:= ?NODE_ID_GAME ->
            case lookup_ets(SceneId) of
                #ets_scene_line{line_roles = LineRoles} -> get_best_line_id(LineRoles);
                _ -> undefined
            end;
        true ->
            undefined
    end.

% @doc 获取跨服场景分线进程id
get_line_pid(SceneId, LineId) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =:= ?NODE_ID_GAME ->
            LinePid = case lookup_ets(SceneId) of
                #ets_scene_line{line_pids = LinePids} ->
                    maps:get(LineId, LinePids, undefined);
                _ ->
                    undefined
            end,
            if
                LinePid =:= undefined ->
                    gen_server:call(?MODULE, {'get_line_pid', SceneId, LineId});
                true ->
                    LinePid
            end;
        true ->
            dist:get_cluster_line_pid(SceneId, LineId)
    end.

% @doc 获取跨服场景分线信息
get_line_info(SceneId) ->
    case lookup_ets(SceneId) of
        #ets_scene_line{line_roles = LineRoles} ->
            LineRoles;
        _Res ->
            ?ERROR("Unexpected ets_scene_line data: ~p of Scene: ~p", [_Res, SceneId]),
            undefined
    end.

% @doc 获取跨服场景最空闲分线id和pid
get_best_line_id_pid(SceneId, LineId) ->
    case lookup_ets(SceneId) of
        #ets_scene_line{line_pids = LinePids, line_roles = LineRoles} ->
            BestLineId = get_best_line_id(LineRoles),
            BestLinePid = maps:get(LineId, LinePids, undefined),
            {BestLineId, BestLinePid};
        _ ->
            {undefined, undefined}
    end.

% @doc 新场景分线
new_scene_line(SceneId, LineId, LinePid, RoleNum) ->
    gen_server:cast(?MODULE, {'new_scene_line', SceneId, LineId, LinePid, RoleNum}).

% @doc 新场景分线
update_scene_lines(SceneId, Lines) ->
    gen_server:cast(?MODULE, {'update_scene_lines', SceneId, Lines}).

% @doc 关闭场景分线
del_scene_line(SceneId, LineId) ->
    gen_server:cast(?MODULE, {'del_scene_line', SceneId, LineId}).

% @doc 连上跨服中心后, 同步场景分线
sync_scene_lines(ClusterSceneMgr, SceneLines) ->
    Pid = whereis(?MODULE),
    gen_server:cast(Pid, {'sync_scene_lines', ClusterSceneMgr, SceneLines}).

% @doc 更新场景分线人数
sync_role_num(SceneId, LineId, RoleNum) ->
    gen_server:cast(?MODULE, {'sync_role_num', SceneId, LineId, RoleNum}).



%% Callbacks --------------------------------------------------
init([]) ->
    process_flag(trap_exit, true),
    ServerNum = config:get_server_num(),
    {ok, #cluster_scene_agent_st{server_num = ServerNum}}.

% 获取分线进程id
handle_call({'get_line_pid', SceneId, LineId}, _FROM, State) ->
    #cluster_scene_agent_st{
        server_num = ServerNum,
        cluster_scene_mgr = ClusterSceneMgr
    } = State,
    Reply = case is_pid(ClusterSceneMgr) of
        true ->
            CallMsg = {'get_cluster_line_info', ServerNum, SceneId, LineId},
            case gen_server:call(ClusterSceneMgr, CallMsg) of
                {LinePid, RoleNum} ->
                    do_update_scene_line(SceneId, LineId, LinePid, RoleNum),
                    LinePid;
                _ ->
                    undefined
            end;
        false ->
            undefined
    end,
    {reply, Reply, State};

% 默认匹配
handle_call(Msg, _FROM, State) ->
    ?ERROR("Recv unexpected call msg: ~p", [Msg]),
    {reply, undefined, State}.

% 新场景分线
handle_cast({'new_scene_line', SceneId, LineId, LinePid, RoleNum}, State) ->
    do_update_scene_line(SceneId, LineId, LinePid, RoleNum),
    {noreply, State};

% 更新场景分线
handle_cast({'update_scene_lines', SceneId, Lines}, State) ->
    EtsSceneLine = lookup_ets_default(SceneId),
    LinePidsL = [{LineId, LinePid} || {LineId, LinePid, _RoleNum} <- Lines],
    LineRolesL = [{LineId, RoleNum} || {LineId, _LinePid, RoleNum} <- Lines],
    EtsSceneLineN = EtsSceneLine#ets_scene_line{
        line_pids = maps:from_list(LinePidsL),
        line_roles = maps:from_list(LineRolesL)
    },
    update_ets(EtsSceneLineN),
    {noreply, State};


% 关闭场景分线
handle_cast({'del_scene_line', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene_line{line_pids = LinePids, line_roles = LineRoles} = EtsSceneLine ->
            EtsSceneLineN = EtsSceneLine#ets_scene_line{
                line_pids = maps:remove(LineId, LinePids),
                line_roles = maps:remove(LineId, LineRoles)
            },
            update_ets(EtsSceneLineN);
        _ ->
            skip
    end,
    {noreply, State};

% 更新场景分线人数
handle_cast({'sync_role_num', SceneId, LineId, RoleNum}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene_line{line_roles = LineRoles} = EtsSceneLine ->
            LineRolesN = maps:put(LineId, RoleNum, LineRoles),
            EtsSceneLineN = EtsSceneLine#ets_scene_line{line_roles = LineRolesN},
            update_ets(EtsSceneLineN);
        _ ->
            skip
    end,
    {noreply, State};

% 初始化场景分线
handle_cast({'sync_scene_lines', ClusterSceneMgr, SceneLines}, State) ->
    [init_ets_scene_line(SceneId, Lines) || {SceneId, Lines} <- SceneLines],
    StateN = State#cluster_scene_agent_st{cluster_scene_mgr = ClusterSceneMgr},
    {noreply, StateN};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------------
% 查找场景数据
lookup_ets(SceneId) ->
    case ets:lookup(?ETS_CLUSTER_SCENE_AGENT, SceneId) of
        [#ets_scene_line{} = EtsScene] ->
            EtsScene;
        _Res ->
            undefined
    end.

lookup_ets_default(SceneId) ->
    case ets:lookup(?ETS_CLUSTER_SCENE_AGENT, SceneId) of
        [#ets_scene_line{} = EtsScene] ->
            EtsScene;
        _Res ->
            #scene{type = Type, role_lmt = RoleLmt} = conf_scene:get(SceneId),
            #ets_scene_line{scene_id = SceneId, scene_type = Type, role_lmt = RoleLmt}
    end.

% 更新场景数据
update_ets(EtsScene) ->
    ets:insert(?ETS_CLUSTER_SCENE_AGENT, EtsScene).

% 获取最佳分线id
get_best_line_id(LineRoles) ->
    MFoldFun = fun(LineId, RoleNum, {_CurLineId, CurRoleNum} = AccBest) ->
        if
            CurRoleNum > RoleNum -> {LineId, RoleNum};
            true -> AccBest
        end
    end,
    {BestLineId, _} = maps:fold(MFoldFun, {undefined, 100000}, LineRoles),
    BestLineId.

% 初始化跨服场景分线数据
init_ets_scene_line(SceneId, Lines) ->
    LinePidL = [{LineId, LinePid} || {LineId, LinePid, _RoleNum} <- Lines],
    LineRoleL = [{LineId, RoleNum} || {LineId, _LinePid, RoleNum} <- Lines],
    #scene{type = Type, role_lmt = RoleLmt} = conf_scene:get(SceneId),
    EtsSceneLine = #ets_scene_line{
        scene_id = SceneId,
        scene_type = Type,
        role_lmt = RoleLmt,
        line_pids = maps:from_list(LinePidL),
        line_roles = maps:from_list(LineRoleL)
    },
    update_ets(EtsSceneLine).

do_update_scene_line(SceneId, LineId, LinePid, RoleNum) ->
    EtsSceneLine = lookup_ets_default(SceneId),
    LinePidsN = maps:put(LineId, LinePid, EtsSceneLine#ets_scene_line.line_pids),
    LineRolesN = maps:put(LineId, RoleNum, EtsSceneLine#ets_scene_line.line_roles),
    EtsSceneLineN = EtsSceneLine#ets_scene_line{line_pids = LinePidsN, line_roles = LineRolesN},
    update_ets(EtsSceneLineN).
