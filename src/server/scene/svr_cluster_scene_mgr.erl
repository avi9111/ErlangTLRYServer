%%-------------------------------------------------------
%% @File     : svr_cluster_scene_mgr.erl
%% @Brief    : 跨服集群场景管理
%% @Author   : cablsbs
%% @Date     : 2018-9-27
%%-------------------------------------------------------
-module(svr_cluster_scene_mgr).

-behaviour(gen_server).

-include("scene.hrl").
-include("common.hrl").
-include("cluster.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").

% TODO cluster down handle

-export([
    start_link/0,
    create_scene_line/4,        % 为指定{活动,分组}创建场景分线
    create_scene_line_asyn/4,   % 为指定{活动,分组}创建场景分线(异步)
    create_scene_lines/4,       % 为指定{活动,分组}创建场景多个分线
    create_scene_lines_asyn/4,  % 为指定{活动,分组}创建场景多个分线(异步)
    % create_scene_lines/2,       % 为指定活动的所有分组创建场景分线
    sync_scene_lines/1,         % 将可用分线同步到游戏服
    group_initiated/0,          % 分组加载完毕

    scene_cleared/2,            % 清除场景完毕
    close_line/2,               % 关闭场景分线

    kick_all_role/2,            % 踢出场景所有玩家
    kick_all_role_later/3       % 延时踢出场景所有玩家
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
-define(MGR_ST, ok).


%% Apis -------------------------------------------------------
% @doc 启动场景管理进程
start_link() ->
    gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

% @doc 分组加载完毕，开启跨服野外等场景
group_initiated() ->
    cast('group_initiated').

% @doc 为指定{活动,分组}创建场景分线 (需要调用 close_line/2 关闭场景分线)
create_scene_line(SceneId, ActId, GroupId, LineId) ->
    call({'create_scene_line', SceneId, ActId, GroupId, LineId}).

create_scene_line_asyn(SceneId, ActId, GroupId, LineId) ->
    cast({'create_scene_line_asyn', SceneId, ActId, GroupId, LineId}).

create_scene_lines(SceneId, ActId, GroupId, LineIds) ->
    call({'create_scene_lines', SceneId, ActId, GroupId, LineIds}).

create_scene_lines_asyn(SceneId, ActId, GroupId, LineIds) ->
    cast({'create_scene_lines_asyn', SceneId, ActId, GroupId, LineIds}).

% % @doc 为指定活动的所有分组创建场景分线
% create_scene_lines(SceneId, ActId) ->
%     call({'create_scene_lines', SceneId, ActId}).

% @doc 为指定活动的所有分组创建场景分线
sync_scene_lines(SvrId) ->
    cast({'sync_scene_lines', SvrId}).

% @doc 关场景
close_line(SceneId, LineId) ->
    info({'close_line', SceneId, LineId}).

% @doc 清场景完毕 TODO
scene_cleared(_SceneId, _LineId) ->
    ignore.

% @doc 踢出场景所有玩家
kick_all_role(SceneId, LineId) ->
    info({'kick_all_role', SceneId, LineId}).

% @doc 踢出场景所有玩家
kick_all_role_later(SceneId, LineId, Wait) ->
    MgrPid = mgr_pid(),
    erlang:send_after(Wait, MgrPid, {'kick_all_role', SceneId, LineId}).


%% Callbacks --------------------------------------------------
init([]) ->
    process_flag(trap_exit, true),
    process_flag(priority, high),
    {ok, ?MGR_ST}.

% 为指定{活动,分组}增开场景分线
handle_call({'create_scene_line', SceneId, ActId, GroupId, LineId}, _From, State) ->
    GroupInfo = svr_group:get_group_info(ActId, GroupId),
    Pids = do_create_scene_lines(SceneId, [LineId], GroupInfo),
    {reply, Pids, State};

% 为指定{活动,分组}增开场景多个分线
handle_call({'create_scene_lines', SceneId, ActId, GroupId, LineIds}, _From, State) ->
    GroupInfo = svr_group:get_group_info(ActId, GroupId),
    Pids = do_create_scene_lines(SceneId, LineIds, GroupInfo),
    {reply, Pids, State};

% 为指定{活动,分组}增开场景分线
handle_call({'get_cluster_line_info', SvrId, SceneId, LineId}, _From, State) ->
    Reply = case lookup_ets(SceneId) of
        #ets_cluster_scene{line_info = LineInfo} ->
            case maps:find(LineId, LineInfo) of
                {ok, {LinePid, RoleNum, SvrIds}} ->
                    case lists:member(SvrId, SvrIds) of
                        true -> {LinePid, RoleNum};
                        false -> undefined
                    end;
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end,
    {reply, Reply, State};

% 默认匹配
handle_call(Msg, _FROM, State) ->
    ?ERROR("Recv unexpected call msg: ~p", [Msg]),
    {reply, undefined, State}.

% 分组初始化，创建野外等场景
handle_cast('group_initiated', State) ->
    GroupList = svr_group:get_groups(0),
    LoadSceneFun = fun(SceneId, TmpEtsSceneL) ->
        Scene = conf_scene:get(SceneId),
        #scene{type = SceneType, role_lmt = RoleLmt} = Scene,
        RoleLmtSoft = trunc(RoleLmt * 0.75),

        {LineInfo, SvrLine} = create_lines_in_clusters(Scene, GroupList),
        EtsScene = #ets_cluster_scene{
            scene_id = SceneId,
            scene_type = SceneType,
            role_lmt = RoleLmt,
            role_lmt_soft = RoleLmtSoft,
            line_info = LineInfo,
            svr_line = SvrLine
        },
        [EtsScene | TmpEtsSceneL]
    end,
    SceneIds = conf_scene:get_active_scene_ids(?NODE_ID_CLUSTER),
    AllEtsScene = lists:foldl(LoadSceneFun, [], SceneIds),
    ets:insert(?ETS_CLUSTER_SCENE_MGR, AllEtsScene),
    {noreply, State};

% 为指定{活动,分组}增开场景分线(异步)
handle_cast({'create_scene_line_asyn', SceneId, ActId, GroupId, LineId}, State) ->
    GroupInfo = svr_group:get_group_info(ActId, GroupId),
    do_create_scene_lines(SceneId, [LineId], GroupInfo),
    {noreply, State};

% 为指定{活动,分组}增开场景多个分线(异步)
handle_cast({'create_scene_lines_asyn', SceneId, ActId, GroupId, LineIds}, State) ->
    GroupInfo = svr_group:get_group_info(ActId, GroupId),
    do_create_scene_lines(SceneId, LineIds, GroupInfo),
    {noreply, State};

% % 为指定活动的所有分组创建场景分线(每个分组单分线)
% handle_cast({'create_scene_lines', SceneId, ActId}, State) ->
%     GroupList = svr_group:get_groups(ActId),
%     [
%         do_create_scene_lines(SceneId, [GroupId], GroupInfo)
%         || #group_info{group_id = GroupId} = GroupInfo <- GroupList
%     ],
%     {noreply, State};

% 更新场景分线人数
handle_cast({'update_role_num', SceneId, LineId, RoleNum}, State) ->
    case lookup_ets(SceneId) of
        #ets_cluster_scene{line_info = LineInfo} = EtsClusterScene ->
            case maps:find(LineId, LineInfo) of
                {ok, {LinePid, _RoleNum, SvrIds}} ->
                    LineInfoN = maps:put(LineId, {LinePid, RoleNum, SvrIds}, LineInfo),
                    EtsClusterSceneN = EtsClusterScene#ets_cluster_scene{line_info = LineInfoN},
                    update_ets(EtsClusterSceneN),
                    % 看压力降低频率 TODO
                    [
                        lib_kf:cast_to_server(SvrId, svr_cluster_scene_agent, sync_role_num, [SceneId, LineId, RoleNum])
                        || SvrId <- SvrIds
                    ];
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    {noreply, State};

% 为指定活动的所有分组创建场景分线
handle_cast({'sync_scene_lines', SvrId}, State) ->
    ValidSceneLine = get_valid_scene_line(SvrId),
    ValidSceneLine =/= [] andalso
        lib_kf:cast_to_server(SvrId, svr_cluster_scene_agent, sync_scene_lines, [self(), ValidSceneLine]),
    {noreply, State};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

% @doc 关闭场景分线
handle_info({'close_line', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_cluster_scene{line_info = LineInfo} ->
            case maps:find(LineId, LineInfo) of
                {ok, {LinePid, _RoleNum, _SvrIds}} ->
                    svr_scene_agent:cast_scene(LinePid, 'close'),
                    erlang:send_after(3000, self(), {'del_scene_line', SceneId, LineId});
                _ ->
                    ?ERROR("Trying to close not existed Line: ~p of Scene: ~p", [LineId, SceneId]),
                    skip
            end;
        _ ->
            skip
    end,
    {noreply, State};

% @doc 删除场景分线数据
handle_info({'del_scene_line', SceneId, LineId}, State) ->
    EtsScene = lookup_ets(SceneId),
    #ets_cluster_scene{line_info = LineInfo} = EtsScene,
    LineInfoN = maps:remove(LineId, LineInfo),
    SvrLineN = case maps:size(LineInfoN) =:= 0 of
        false ->
            SyncAndUpdateFun = fun(SvrId, LineIds, AccMap) ->
                case lists:member(LineId, LineIds) of
                    true ->
                        lib_kf:cast_to_server(SvrId, svr_cluster_scene_agent, del_scene_line, [SceneId, LineId]);
                    false -> skip
                end,
                AccMap#{SvrId => lists:delete(LineId, LineIds)}
            end,
            maps:fold(SyncAndUpdateFun, #{}, EtsScene#ets_cluster_scene.svr_line);
        true ->
            #{}
    end,
    EtsSceneN = EtsScene#ets_cluster_scene{line_info = LineInfoN, svr_line = SvrLineN},
    update_ets(EtsSceneN),
    {noreply, State};

% @doc 踢出场景所有玩家
handle_info({'kick_all_role', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_cluster_scene{line_info = LineInfo} ->
            case maps:find(LineId, LineInfo) of
                {ok, {LinePid, _RoleNum, _SvrIds}} ->
                    case lib_scene_api:get_scene_roler_field(LinePid, #scene_role.pid) of
                        RolePids when is_list(RolePids) ->
                            [
                                RolePid ! {'passive_leave_scene', SceneId, LineId}
                                || RolePid <- RolePids, is_pid(RolePid)
                            ];
                        _ ->
                            ?ERROR("SceneId: ~p, LineId: ~p, LinePid: ~p abnormal !", [SceneId, LineId, LinePid]),
                            skip
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    {noreply, State};

handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------------
% 发送消息给集群分线管理进程
info(Msg) ->
    MgrPid = mgr_pid(),
    MgrPid ! Msg.

cast(Msg) ->
    MgrPid = mgr_pid(),
    gen_server:cast(MgrPid, Msg).

call(Req) ->
    MgrPid = mgr_pid(),
    gen_server:call(MgrPid, Req).

% 在集群节点创建分线
create_lines_in_clusters(Scene, GroupList) ->
    CreateFun = fun(GroupInfo, {AccLineInfo, AccSvrLine}) ->
        #group_info{group_id = GroupId, cluster_id = ClusterId, server_ids = SvrIds} = GroupInfo,
        LinePid = lib_kf:call_to_cluster(ClusterId, svr_scene_agent, start_line, [Scene, GroupId]),
        AccLineInfoN = maps:put(GroupId, {LinePid, 0, SvrIds}, AccLineInfo),
        SyncAndUpdateFun = fun(SvrId, AccMap) ->
            SvrNode = lib_kf:get_server_node(SvrId),
            SvrNode =/= undefined andalso
                lib_kf:cast_to_node(SvrNode, svr_cluster_scene_agent, new_scene_line, [Scene#scene.id, GroupId, LinePid, 0]),
            OriLines = maps:get(SvrId, AccMap, []),
            maps:put(SvrId, [GroupId | OriLines], AccMap)
        end,
        AccSvrLineN = lists:foldl(SyncAndUpdateFun, AccSvrLine, SvrIds),
        {AccLineInfoN, AccSvrLineN}
    end,
    lists:foldl(CreateFun, {#{}, #{}}, GroupList).

% 查找场景数据
lookup_ets(SceneId) ->
    case ets:lookup(?ETS_CLUSTER_SCENE_MGR, SceneId) of
        [#ets_cluster_scene{} = EtsScene] ->
            EtsScene;
        _Res ->
            undefined
    end.

% 更新场景数据
update_ets(EtsScene) ->
    ets:insert(?ETS_CLUSTER_SCENE_MGR, EtsScene).

% 为指定分组创建场景分线
do_create_scene_lines(SceneId, LineIds, #group_info{cluster_id = ClusterId} = GroupInfo) when ClusterId > 0 ->
    Scene = conf_scene:get(SceneId),
    EtsScene = case lookup_ets(SceneId) of
        undefined ->
            #scene{type = SceneType} = Scene,
            #ets_cluster_scene{scene_id = SceneId, scene_type = SceneType};
        EtsClusterScene ->
            EtsClusterScene
    end,
    SvrIds = GroupInfo#group_info.server_ids,
    DoCreateLineFun = fun(LineId, {AccEtsScene, PidAcc}) ->
        #ets_cluster_scene{line_info = LineInfo, svr_line = SvrLine} = AccEtsScene,
        case maps:is_key(LineId, LineInfo) of
            false ->
                LinePid = lib_kf:call_to_cluster(ClusterId, svr_scene_agent, start_line, [Scene, LineId]),
                TmpLineInfo = maps:put(LineId, {LinePid, 0, SvrIds}, LineInfo),
                UpdateFun = fun(SvrId, AccMap) ->
                    OriLines = maps:get(SvrId, AccMap, []),
                    maps:put(SvrId, [LineId | OriLines], AccMap)
                end,
                TmpSvrLine = lists:foldl(UpdateFun, SvrLine, SvrIds),
                {AccEtsScene#ets_cluster_scene{line_info = TmpLineInfo, svr_line = TmpSvrLine}, [LinePid | PidAcc]};
            true ->
                ?ERROR("Line: ~p of Scene: ~p already existed, skip create_scene_line !", [LineId, SceneId]),
                {AccEtsScene, PidAcc}
        end
    end,
    {EtsSceneN, LinePids} = lists:foldl(DoCreateLineFun, {EtsScene, []}, LineIds),
    SyncFun = fun(SvrId) ->
        SvrNode = lib_kf:get_server_node(SvrId),
        {SceneId, SceneLines} = do_get_valid_scene_line(SvrId, EtsSceneN),
        SvrNode =/= undefined andalso SceneLines =/= [] andalso
            lib_kf:cast_to_node(SvrNode, svr_cluster_scene_agent, update_scene_lines, [SceneId, SceneLines])
    end,
    lists:foreach(SyncFun, SvrIds),
    update_ets(EtsSceneN),
    LinePids;
do_create_scene_lines(_SceneId, _LineIds, #group_info{act_id = ActId, group_id = GroupId}) ->
    ?ERROR("ActId: ~p, GroupId: ~p hasn't been arrange cluster", [ActId, GroupId]),
    [];
do_create_scene_lines(SceneId, LineIds, _) ->
    ?ERROR("Create Scene: ~p Lines: ~p whith bad Act and Group", [SceneId, LineIds]),
    [].

% 获取游戏服所有可用场景分线
get_valid_scene_line(SvrId) ->
    GatherFun = fun(EtsScene, Acc) ->
        case do_get_valid_scene_line(SvrId, EtsScene) of
            {SceneId, Lines} when Lines =/= [] -> [{SceneId, Lines} | Acc];
            _ -> Acc
        end
    end,
    EtsClusterSceneL = ets:tab2list(?ETS_CLUSTER_SCENE_MGR),
    lists:foldl(GatherFun, [], EtsClusterSceneL).

do_get_valid_scene_line(SvrId, EtsClusterScene) ->
    #ets_cluster_scene{scene_id = SceneId, line_info = LineInfo, svr_line = SvrLine} = EtsClusterScene,
    case maps:get(SvrId, SvrLine, []) of
        [] ->
            {SceneId, []};
        LineIds ->
            Lines = [
                begin
                    {LinePid, RoleNum, _SvrIds} = maps:get(LineId, LineInfo),
                    {LineId, LinePid, RoleNum}
                end || LineId <- LineIds
            ],
            {SceneId, Lines}
    end.

mgr_pid() ->
    dist:whereis_name(global, ?MODULE).
