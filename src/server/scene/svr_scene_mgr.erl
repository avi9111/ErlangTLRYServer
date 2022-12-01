%%-------------------------------------------------------
%% @File     : svr_scene_mgr.erl
%% @Brief    : 游戏服场景管理进程
%% @Author   : cablsbs
%% @Date     : 2018-6-21
%%-------------------------------------------------------
-module(svr_scene_mgr).

-behaviour(gen_server).

-include("scene.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("ets_defines.hrl").

-export([
    p/0,
    call/1,
    cast/1,
    info/1,

    start_link/0,
    add_scene_line/1,           % 开场景分线(活动等逻辑) - 同步,不指定分线
    add_scene_line/2,           % 开场景分线(活动等逻辑) - 同步,指定分线
    add_scene_line_asyn/1,      % 开场景分线(活动等逻辑) - 异步,指定分线
    add_scene_line_asyn/2,      % 开场景分线(活动等逻辑) - 异步,指定分线

    scene_cleared/2,            % 清除场景分线完毕
    close_scene/1,              % 关闭场景
    close_line/2,               % 关闭场景分线
    close_line_later/3,         % 延时关闭场景分线

    get_line_num/1,             % 获取分线数量
    get_line_id/1,              % 获取分线id
    get_line_pid/2,             % 获取分线pid
    get_line_info/1,            % 获取场景分线信息

    kick_all_role/1,            % 踢出场景所有玩家
    kick_all_role/2,            % 踢出场景分线所有玩家
    kick_all_role_later/3       % 延时踢出场景分线所有玩家
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


% 分线玩家分配情况
% 场景管理进程
-record(scene_mgr_st, {
}).


%% Apis -------------------------------------------------------
% @doc 进程Id
p() ->
    erlang:whereis(?MODULE).

% @doc call
call(Msg) ->
    Pid = p(),
    is_pid(Pid) andalso gen_server:call(Pid, Msg).

% @doc cast
cast(Msg) ->
    Pid = p(),
    is_pid(Pid) andalso gen_server:cast(Pid, Msg).

% @doc info
info(Msg) ->
    Pid = p(),
    is_pid(Pid) andalso Pid ! Msg.

% @doc 启动场景管理进程
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

% @doc 开场景分线(同步调用，返回{分线id, 分线pid})
add_scene_line(SceneId) ->
    call({'add_scene_line', SceneId}).

% @doc 开场景分线(同步调用，返回{分线id, 分线pid})
add_scene_line(SceneId, LineId) ->
    call({'add_scene_line', SceneId, LineId}).

% @doc 增开该场景分线 - 异步
add_scene_line_asyn(SceneId) ->
    cast({'add_scene_line_asyn', SceneId}).

% @doc 增开场景分线(指定分线id) - 异步调用
% @spec 注意：若LineId已存在，忽略此调用
add_scene_line_asyn(SceneId, LineId) ->
    cast({'add_scene_line_asyn', SceneId, LineId}).

% @doc 关场景
close_scene(SceneId) ->
    info({'close_scene', SceneId}).

% @doc 关场景分线
close_line(SceneId, LineId) ->
    info({'close_line', SceneId, LineId}).

% @doc 延时关场景分线
close_line_later(SceneId, LineId, Wait) ->
    erlang:send_after(Wait, ?MODULE, {'close_line', SceneId, LineId}).

% @doc 清场景完毕
scene_cleared(SceneId, LineId) ->
    cast({'scene_cleared', SceneId, LineId}).

% @doc 获取分线数量
get_line_num(SceneId) ->
    call({'get_line_num', SceneId}).

% @doc 获取分线Id
get_line_id(SceneId) ->
    case lib_scene_api:is_cluster_scene(SceneId) of
        false -> call({'get_line_id', SceneId});
        true -> svr_cluster_scene_agent:get_line_id(SceneId)
    end.

% @doc 获取分线Id
get_line_pid(SceneId, LineId) ->
    case lib_scene_api:is_cluster_scene(SceneId) of
        false -> do_get_line_pid(SceneId, LineId);
        true -> svr_cluster_scene_agent:get_line_pid(SceneId, LineId)
    end.

% @doc 获取场景分线信息
get_line_info(SceneId) ->
    case lib_scene_api:is_cluster_scene(SceneId) of
        false -> do_get_line_info(SceneId);
        true -> svr_cluster_scene_agent:get_line_info(SceneId)
    end.

% @doc 踢出场景所有玩家
kick_all_role(SceneId) ->
    info({'kick_all_role', SceneId}).

% @doc 踢出场景所有玩家
kick_all_role(SceneId, LineId) ->
    info({'kick_all_role', SceneId, LineId}).

% @doc 延时踢出场景所有玩家
kick_all_role_later(SceneId, LineId, Wait) ->
    erlang:send_after(Wait, ?MODULE, {'kick_all_role', SceneId, LineId}).

%% Callbacks --------------------------------------------------
init([]) ->
    process_flag(trap_exit, true),
    process_flag(priority, high),
    check_scenes_config(),
    erlang:send_after(3 * 1000, self(), 'open_active_scenes'),
    {ok, #scene_mgr_st{}}.

handle_call({'get_line_num', SceneId}, _FROM, State) ->
    LineNum = case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} -> maps:size(LinePids);
        _ -> 0
    end,
    {reply, LineNum, State};

% 获取最佳分线(?BALANCE_SCENE_TYPES中的场景类型才可使用这个函数)
handle_call({'get_line_id', SceneId}, _FROM, State) ->
    LineId = case lib_scene_api:is_balance_scene(SceneId) of
        true ->
            case lookup_ets(SceneId) of
                #ets_scene{line_pids = LinePids, role_lmt = RoleLim} = EtsScene ->
                    LineNum = maps:size(LinePids),
                    if
                        LineNum =:= 1 ->
                            [{LineIdT, RoleNum}] = EtsScene#ets_scene.distribute,
                            RoleNum >= RoleLim andalso add_scene_line_asyn(SceneId),
                            LineIdT;
                        true ->
                            {LineIdT, RoleNum, DistributeN} = get_best_line_id(EtsScene),
                            (LineNum * (RoleLim - RoleNum)) > min(LineNum + 1, 10) orelse add_scene_line_asyn(SceneId),
                            EtsSceneN = EtsScene#ets_scene{distribute = DistributeN},
                            update_ets(EtsSceneN),
                            LineIdT
                    end;
                _ ->
                    {LineIdT, _LinePid} = do_add_scene_line(SceneId),
                    LineIdT
            end;
        false ->
            ?ERROR("Unexpected get_line_id of scene: ~p request !", [SceneId]),
            ?DYN_LINE_ID
    end,
    {reply, LineId, State};

% @doc 增开场景分线 - 同步
handle_call({'add_scene_line', SceneId}, _From, State) ->
    CreateRet = do_add_scene_line(SceneId),
    {reply, CreateRet, State};

% @doc 开场景指定分线(指定分线id) - 同步
handle_call({'add_scene_line', SceneId, LineId}, _From, State) ->
    CreateRet = do_add_scene_line(SceneId, LineId),
    {reply, CreateRet, State};

% 默认匹配
handle_call(Msg, _FROM, State) ->
    ?ERROR("Recv unexpected call msg: ~p", [Msg]),
    {reply, undefined, State}.

% @doc 增开场景分线 - 异步
handle_cast({'add_scene_line_asyn', SceneId}, State) ->
    do_add_scene_line(SceneId),
    {noreply, State};

% @doc 增开场景分线(指定分线id) - 异步
handle_cast({'add_scene_line_asyn', SceneId, LineId}, State) ->
    do_add_scene_line(SceneId, LineId),
    {noreply, State};

% @doc 场景完毕(重新初始化完毕)
handle_cast({'scene_cleared', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{distribute = Distribute} = EtsScene ->
            DistributeN = lists:keystore(LineId, 1, Distribute, {LineId, 0}),
            EtsSceneN = EtsScene#ets_scene{distribute = DistributeN},
            update_ets(EtsSceneN);
        _ ->
            ?ERROR("Not found #ets_scene{} of Scene: ~p, Line: ~p while scene_cleared", [SceneId, LineId])
    end,
    {noreply, State};

% @doc 更新场景分线人数
handle_cast({'update_role_num', SceneId, LineId, RoleNum}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{distribute = Distribute} = EtsScene ->
            case lists:keytake(LineId, 1, Distribute) of
                {value, {LineId, _RoleNum}, Rest} ->
                    DistributeN = [{LineId, RoleNum} | Rest],
                    NewEtsScene = EtsScene#ets_scene{distribute = DistributeN},
                    update_ets(NewEtsScene);
                false ->
                    ?ERROR("No such line update_role_num of SceneId: ~p, LineId: ~p", [SceneId, LineId])
            end;
        _ ->
            ?ERROR("Not found #ets_scene{} while update_role_num of SceneId: ~p, LineId: ~p", [SceneId, LineId])
    end,
    {noreply, State};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.


% @doc 关闭场景
handle_info({'close_scene', SceneId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} ->
            [
                svr_scene_agent:cast_scene(LinePid, 'close')
                || {_LineId, LinePid} <- maps:to_list(LinePids)
            ],
            ets:delete(?ETS_SCENE_MGR, SceneId);
        _ ->
            ?ERROR("Trying to close not existed Scene: ~p", [SceneId])
    end,
    {noreply, State};

% @doc 关闭场景分线
handle_info({'close_line', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} = EtsScene ->
            case maps:find(LineId, LinePids) of
                {ok, LinePid} -> close_scene_line_logic(EtsScene, LinePid, LineId);
                _ -> ?ERROR("Trying to close not existed Line: ~p of Scene: ~p", [SceneId, LineId])
            end;
        _ ->
            ?ERROR("Not found #ets_scene{} while close_line of SceneId: ~p, LineId: ~p", [SceneId, LineId])
    end,
    {noreply, State};

handle_info('open_active_scenes', State) ->
    LoadSceneFun = fun(SceneId, TmpEtsSceneL) ->
        Scene = conf_scene:get(SceneId),
        #scene{type = SceneType, role_lmt = RoleLmtC} = Scene,
        LineNum = get_open_lines(SceneType, SceneId),
        Distribute = [{Index, 0} || Index <- lists:seq(1, LineNum)],
        RoleLmt = ?iif(RoleLmtC =:= 0, 60, RoleLmtC),
        LinePidList = [
            {LineId, svr_scene_agent:start_line(Scene, LineId)}
            || LineId <- lists:seq(1, LineNum)
        ],
        LinePids = maps:from_list(LinePidList),
        EtsScene = #ets_scene{
            scene_id = SceneId, scene_type = SceneType, auto_line_id = LineNum + 1,
            line_pids = LinePids, distribute = Distribute,
            role_lmt = RoleLmt, role_lmt_s = ceil(RoleLmt * 0.75)
        },
        [EtsScene | TmpEtsSceneL]
    end,
    SceneIds = conf_scene:get_active_scene_ids(?NODE_ID_GAME),
    AllEtsScene = lists:foldl(LoadSceneFun, [], SceneIds),
    ets:insert(?ETS_SCENE_MGR, AllEtsScene),
    svr_ban:open_entrance_delay(5000),
    {noreply, State};

handle_info({'kick_all_role', SceneId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} ->
            [
                do_kick_all_role(SceneId, LineId, LinePid)
                || {LineId, LinePid} <- maps:to_list(LinePids)
            ],
            % erlang:send_after(1500, self(), {'clear_scene', SceneId}),
            ok;
        _ ->
            skip
    end,
    {noreply, State};

handle_info({'kick_all_role', SceneId, LineId}, State) ->
    case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} ->
            LinePid = maps:get(LineId, LinePids, undefined),
            do_kick_all_role(SceneId, LineId, LinePid),
            % erlang:send_after(1500, self(), {'clear_scene', SceneId, LineId});
            ok;
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
do_get_line_pid(SceneId, LineId) ->
    case lookup_ets(SceneId) of
        #ets_scene{line_pids = LinePids} ->
            maps:get(LineId, LinePids, undefined);
        _Res ->
            undefined
    end.

do_get_line_info(SceneId) ->
    case lookup_ets(SceneId) of
        #ets_scene{distribute = Distribute} ->
            Distribute;
        _Res ->
            ?ERROR("Unexpected ets_scene data: ~p of Scene: ~p", [_Res, SceneId]),
            undefined
    end.

% @doc 获取玩家最少的分线Id
% @spec get_best_line_id(#ets_scene{}) -> {LineId, RoleInLineN, DistributeN} | DistributeN.
% LineId = RoleInLineN    :: integer()
% DistributeN             :: [{LineId, RoleInLine}]
% 当前场景人数不饱和，直接使用
get_best_line_id(#ets_scene{role_lmt_s = RoleLmtS, distribute = [{LineId, RoleNum} | _] = Distribute}) when RoleNum < RoleLmtS ->
    {LineId, RoleNum, Distribute};
% 取出玩家最少的分线Id
get_best_line_id(#ets_scene{distribute = Distribute}) ->
    DistributeSorted = lists:keysort(2, Distribute),
    {LineId, RoleNum} = hd(DistributeSorted),
    {LineId, RoleNum, DistributeSorted}.

lookup_ets(SceneId) ->
    case ets:lookup(?ETS_SCENE_MGR, SceneId) of
        [#ets_scene{} = EtsScene] ->
            EtsScene;
        _Res ->
            undefined
    end.

lookup_ets_default(SceneId) ->
    case ets:lookup(?ETS_SCENE_MGR, SceneId) of
        [#ets_scene{} = EtsScene] ->
            EtsScene;
        _Res ->
            #scene{type = Type, role_lmt = RoleLmt} = conf_scene:get(SceneId),
            #ets_scene{
                scene_id = SceneId, scene_type = Type,
                role_lmt = RoleLmt, role_lmt_s = ceil(RoleLmt * 0.75)
            }
    end.

update_ets(EtsScene) ->
    ets:insert(?ETS_SCENE_MGR, EtsScene).

% @doc 新场景分线逻辑
do_add_scene_line(SceneId) ->
    case conf_scene:get(SceneId) of
        #scene{} = Scene ->
            EtsScene = lookup_ets_default(SceneId),
            add_scene_line_logic(EtsScene, Scene, ?DYN_LINE_ID);
        _ ->
            ?ERROR("Bad SceneId: ~p, config not found !", [SceneId]),
            {?DYN_LINE_ID, undefined}
    end.

% @doc 新场景分线逻辑(指定分线)
do_add_scene_line(SceneId, LineId) ->
    case conf_scene:get(SceneId) of
        #scene{} = Scene ->
            EtsScene = lookup_ets_default(SceneId),
            #ets_scene{distribute = Distribute, line_pids = LinePids} = EtsScene,
            case lists:keymember(LineId, 1, Distribute) of
                false ->
                    add_scene_line_logic(EtsScene, Scene, LineId);
                true ->
                    ?ERROR("Create Scene: ~p line failed ! Line: ~p already existed !", [SceneId, LineId]),
                    {LineId, maps:get(LineId, LinePids)}
            end;
        _ ->
            ?ERROR("Bad SceneId: ~p, config not found !", [SceneId]),
            {?DYN_LINE_ID, undefined}
    end.

% @doc 开分线逻辑
add_scene_line_logic(EtsScene, #scene{id = SceneId}, LineId) ->
    #ets_scene{auto_line_id = ALineId, line_pids = LinePids, distribute = Distribute} = EtsScene,
    {NewALineId, NewLineId} = ?iif(LineId =:= ?DYN_LINE_ID, {ALineId + 1, ALineId}, {ALineId, LineId}),
    NewLinePid = svr_scene_agent:start_line(SceneId, NewLineId),
    LinePidsN = LinePids#{NewLineId => NewLinePid},
    EtsSceneN = EtsScene#ets_scene{
        auto_line_id = NewALineId, line_pids = LinePidsN,
        distribute = [{NewLineId, 0} | Distribute]
    },
    update_ets(EtsSceneN),
    {NewLineId, NewLinePid}.

% @doc 关分线逻辑
close_scene_line_logic(#ets_scene{scene_id = SceneId} = EtsScene, LinePid, LineId) ->
    svr_scene_agent:cast_scene(LinePid, 'close'),
    LinePidsN = maps:remove(LineId, EtsScene#ets_scene.line_pids),
    case maps:size(LinePidsN) of
        0 ->
            ets:delete(?ETS_SCENE_MGR, SceneId);
        _Size ->
            DistributeN = lists:keydelete(LineId, 1, EtsScene#ets_scene.distribute),
            EtsSceneN = EtsScene#ets_scene{line_pids = LinePidsN, distribute = DistributeN},
            update_ets(EtsSceneN)
    end.

% @doc 获取初始分线数量
get_open_lines(_SceneType, SceneId) ->
    OpenDays = util:get_open_days(),
    case lists:keyfind(SceneId, 1, ?NEW_SCENE_NUM_LIST) of
        _ when SceneId =:= ?SCENE_ID_LAKE_BANDITS -> 3; %% 镜湖剿匪特殊需求
        {SceneId, LineNum} when OpenDays < 5 -> LineNum;
        {SceneId, _LineNum} when OpenDays < 15 -> 5;
        _ -> 1
    end.

% @doc 踢出分线内所有玩家, 1.5S后清理场景
do_kick_all_role(SceneId, LineId, LinePid) when is_pid(LinePid) ->
    RolePids = lib_scene_api:get_scene_roler_field(LinePid, #scene_role.pid),
    [
        RolePid ! {'passive_leave_scene', SceneId, LineId}
        || RolePid <- RolePids, is_pid(RolePid)
    ];
do_kick_all_role(_SceneId, _LineId, _LinePid) ->
    skip.

check_scenes_config() ->
    ChkSceneFun = fun(SceneId) ->
        #scene{width = Width, height = Height} = conf_scene:get(SceneId),
        {MaxX, MaxY} = conf_scene_mask:get_max_pos(SceneId),
        if
            Width =:= MaxX andalso Height =:= MaxY ->
                SceneMask = conf_scene_mask:get_mask(SceneId),
                if
                    SceneMask =:= {} ->
                        ?ERROR("Mask of Scene: ~p not found !", [SceneId]);
                    true ->
                        RowNum = size(SceneMask),
                        RowNum =/= MaxY andalso ?ERROR("SceneId: ~p, MaxY: ~p, RowNum: ~p", [SceneId, MaxY, RowNum]),
                        ColNum = size(element(1, SceneMask)),
                        ColNum =/= MaxX andalso ?ERROR("SceneId: ~p, MaxX: ~p, ColNum: ~p", [SceneId, MaxX, ColNum])
                end;
            true ->
                MaxX =/= Width andalso ?ERROR("SceneId: ~p MaxX: ~p, Width: ~p", [SceneId, MaxX, Width]),
                MaxY =/= Height andalso ?ERROR("SceneId: ~p MaxY: ~p, Height: ~p", [SceneId, MaxY, Height])
        end
    end,
    SceneIds = conf_scene:get_all_id(),
    lists:foreach(ChkSceneFun, SceneIds).
