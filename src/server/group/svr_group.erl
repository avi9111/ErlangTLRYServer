%%-------------------------------------------------------
%% @File     : svr_group.erl
%% @Brief    : 跨服分组管理
%% @Author   : cablsbs
%% @Date     : 2018-9-28
%%-------------------------------------------------------
-module(svr_group).

-behaviour(gen_server).

-include("common.hrl").
-include("cluster.hrl").
-include("ets_defines.hrl").

% -compile(export_all).

-export([
    p/0,
    call/1,
    cast/1,
    start_link/0,
    arrange_cluster/1,
    reload/0,
    reload/1,

    get_groups/1,
    get_group_info/2,
    get_group_cluster/2
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

% 分组初始化延时
-define(GROUP_INITIATE_DELAY, 4000).

% 分组进程状态
-record(group_st, {
    is_initiate = false,        % #{ ActId => [#group_info{}] }             % 分组数据
    act_groups = #{},           % #{ ActId => [#group_info{}] }             % 分组数据
    cluster_loading = []       % [{ClusterId, #{ {Act,Group}=>0 } }]       % cluster负载
}).


%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

arrange_cluster(ActId) ->
    gen_server:cast(?MODULE, {'arrange_cluster', ActId}).

% 重载分组
reload() ->
    gen_server:cast(?MODULE, 'reload').

% 重载单个活动分组
reload(ActId) ->
    gen_server:cast(?MODULE, {'reload', ActId}).

% 获取活动分组信息
get_groups(ActId) ->
    gen_server:call(?MODULE, {'get_groups', ActId}).

% 获取活动分组信息
get_group_info(ActId, GroupId) ->
    gen_server:call(?MODULE, {'get_group_info', ActId, GroupId}).

% 获取活动分组节点Id
get_group_cluster(ActId, GroupId) ->
    gen_server:call(?MODULE, {'get_group_cluster', ActId, GroupId}).

p() ->
    erlang:whereis(?MODULE).

call(Request) ->
    ?call(Request).

cast(Request) ->
    ?cast(Request).

%% Callbacks --------------------------------------------
init([]) ->
    erlang:process_flag(trap_exit, true),
    erlang:send_after(?GROUP_INITIATE_DELAY, self(), 'group_initiate'),
    {ok, #group_st{}}.

handle_call(Msg, _From, #group_st{is_initiate = false} = State) ->
    ?ERROR("Group Server no initiate yet ! Ignore Msg: ~p", [Msg]),
    {reply, ignore, State};

handle_call({'get_groups', ActId}, _From, State) ->
    GroupList = maps:get(ActId, State#group_st.act_groups, []),
    {reply, GroupList, State};

handle_call({'get_group_info', ActId, GroupId}, _From, State) ->
    GroupList = maps:get(ActId, State#group_st.act_groups, []),
    case lists:keyfind(GroupId, #group_info.group_id, GroupList) of
        #group_info{} = GInfo ->
            {reply, GInfo, State};
        _ ->
            {reply, undefined, State}
    end;

handle_call({'get_group_cluster', ActId, GroupId}, _From, State) ->
    ClusterId = do_get_cluster_id(ActId, GroupId, State#group_st.act_groups),
    {reply, ClusterId, State};

handle_call(Msg, _From, State) ->
    ?ERROR("Recv unexpected call msg: ~p", [Msg]),
    {reply, ok, State}.

handle_cast(Msg, #group_st{is_initiate = false} = State) ->
    ?ERROR("Group Server no initiate yet ! Ignore Msg: ~p", [Msg]),
    {noreply, State};

handle_cast({'arrange_cluster', ActId}, State) ->
    #group_st{act_groups = ActGroups, cluster_loading = Loading} = State,
    LoadingN0 = update_loading(Loading),
    GroupList = maps:get(ActId, ActGroups, []),
    {GroupListN, LoadingN} = do_arrange_act_cluster(GroupList, LoadingN0),
    ActGroupsN = maps:put(ActId, GroupListN, ActGroups),
    StateN = State#group_st{act_groups = ActGroupsN, cluster_loading = LoadingN},
    {noreply, StateN};

% TODO
handle_cast({'rearrange_cluster', _ActId}, State) ->
    {noreply, State};

handle_cast('reload', State) ->
    ActGroups = load_all_group_from_db(),
    StateN = State#group_st{act_groups = ActGroups},
    {noreply, StateN};

handle_cast({'reload', ActId}, State) ->
    GroupList = load_act_group_from_db(ActId),
    ActGroups = State#group_st.act_groups,
    ActGroupsN = maps:put(ActId, GroupList, ActGroups),
    StateN = State#group_st{act_groups = ActGroupsN},
    {noreply, StateN};

handle_cast({dispatch_activity, Mod, Activity}, State) ->
    dispatch_activity(State, Mod, Activity),
    {noreply, State};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

handle_info('group_initiate', State = #group_st{cluster_loading = OldLoading}) ->
    case update_loading(OldLoading) of
        [] ->
            erlang:send_after(?GROUP_INITIATE_DELAY, self(), 'group_initiate'),
            {noreply, State};
        Loading ->
            ActGroups = load_all_group_from_db(),
            %% #{ ActId => [#group_info{}] }, [{ClusterId, #{ {Act,Group}=>0 } }]
            {ActGroupsN, LoadingN} = do_arrange_cluster(ActGroups, Loading),
            StateN = State#group_st{
                is_initiate = true,
                act_groups = ActGroupsN,
                cluster_loading = LoadingN
            },
            notify_group_initiated(),
            {noreply, StateN}
    end;

handle_info(Msg, #group_st{is_initiate = false} = State) ->
    ?ERROR("Group Server no initiate yet ! Ignore Msg: ~p", [Msg]),
    {noreply, State};

handle_info(Msg, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Msg]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
load_all_group_from_db() ->
    KfGroupConfs = ?DB:get_all(<<"SELECT `act_id`, `group_id`, `server_id` FROM `base_kf_group`">>),
    GenMapFun = fun([ActId, GroupId, ServerId], AccMap) ->
        GroupList = maps:get(ActId, AccMap, []),
        GroupListN = case lists:keytake(GroupId, #group_info.group_id, GroupList) of
            {value, #group_info{server_ids = ServerIds} = GInfo, Rest} ->
                [GInfo#group_info{server_ids = [ServerId | ServerIds]} | Rest];
            _ ->
                GInfo = #group_info{act_id = ActId, group_id = GroupId, server_ids = [ServerId]},
                [GInfo | GroupList]
        end,
        AccMap#{ActId => GroupListN}
    end,
    lists:foldl(GenMapFun, #{}, KfGroupConfs).

load_act_group_from_db(ActId) ->
    Sql = io_lib:format("SELECT `group_id`, `server_id` FROM `base_kf_group` WHERE `act_id` = ~p", [ActId]),
    KfGroupConfs = ?DB:get_all(Sql),
    GenActFun = fun([GroupId, ServerId], AccGroupList) ->
        case lists:keytake(GroupId, #group_info.group_id, AccGroupList) of
            {value, #group_info{server_ids = ServerIds} = GInfo, Rest} ->
                [GInfo#group_info{server_ids = [ServerId | ServerIds]} | Rest];
            _ ->
                GInfo = #group_info{act_id = ActId, group_id = GroupId, server_ids = [ServerId]},
                [GInfo | AccGroupList]
        end
    end,
    lists:foldl(GenActFun, [], KfGroupConfs).

do_arrange_cluster(ActGroups, Loading) ->
    ActArrangeFun = fun(ActId, GroupList, {AccActGroups, AccLoading}) ->
        {GroupListN, AccLoadingN} = do_arrange_act_cluster(GroupList, AccLoading),
        AccActGroupsN = AccActGroups#{ActId => GroupListN},
        {AccActGroupsN, AccLoadingN}
    end,
    maps:fold(ActArrangeFun, {#{}, Loading}, ActGroups).

do_arrange_act_cluster([], Loading) ->
    ?ERROR("No Group need to arrange !"),
    {[], Loading};
do_arrange_act_cluster(GroupList, []) ->
    ?ERROR("No Cluster Nodes to arrange !"),
    {GroupList, []};
do_arrange_act_cluster(GroupList, Loading) ->
    ArrangeFun = fun(GInfo, {AccGroupList, AccLoading}) ->
        case GInfo#group_info.cluster_id of
            0 ->
                #group_info{act_id = ActId, group_id = GroupId} = GInfo,
                [{ClusterId, ArrangedMap} | Rest] = get_best_cluster_id(AccLoading),
                ArrangedMapN = ArrangedMap#{{ActId, GroupId} => 0},
                AccLoadingN = [{ClusterId, ArrangedMapN} | Rest],
                GInfoN = GInfo#group_info{cluster_id = ClusterId},
                lib_kf:cast_to_cluster(ClusterId, svr_group_agent, arrangement, [GInfo]),
                {[GInfoN | AccGroupList], AccLoadingN};
            _ClusterId ->
                AccGroupListN = [GInfo | AccGroupList],
                {AccGroupListN, AccLoading}
        end
    end,
    lists:foldl(ArrangeFun, {[], Loading}, GroupList).

% 获取最空闲(只考虑任务数)cluster
get_best_cluster_id(Loading) ->
    SortFun = fun({_CId1, Map1}, {_CId2, Map2}) -> maps:size(Map1) < maps:size(Map2) end,
    lists:sort(SortFun, Loading).

% 更新可用cluster
update_loading(Loading) ->
    ClusterNodes = ets:tab2list(?ETS_NODE),
    UpdateFun = fun(#node_info{id = ClusterId}, AccLoading) ->
        case lists:keymember(ClusterId, 1, AccLoading) of
            true -> AccLoading;
            false -> [{ClusterId, #{}} | AccLoading]
        end
    end,
    lists:foldl(UpdateFun, Loading, ClusterNodes).

notify_group_initiated() ->
    ModList = [
        svr_cluster_scene_mgr
    ],
    [Mod:group_initiated() || Mod <- ModList].

do_get_cluster_id(ActId, GroupId, ActGroups) ->
    GroupList = maps:get(ActId, ActGroups, []),
    case lists:keyfind(GroupId, #group_info.group_id, GroupList) of
        #group_info{cluster_id = ClusterId} -> ClusterId;
        _ -> 0
    end.

dispatch_activity(State, Mod, Activity) ->
    #{id := ActID, callback2 := Callback2} = Activity,
    #group_st{act_groups = Groups} = State,
    GroupList = maps:get(ActID, Groups, []),
    Fun = fun(#group_info{group_id = Gid, cluster_id = Cid, server_ids = Sids}) ->
        CActivity = Activity#{group_id => Gid, cluster => Cid},
        lib_kf:cast_to_cluster(Cid, svr_activity_mgr, Mod, [CActivity]),
        SActivity = CActivity#{callback => Callback2},
        [lib_kf:cast_to_server(Nid, svr_activity_mgr, Mod, [SActivity]) || Nid <- Sids],
        ok
    end,
    lists:foreach(Fun, GroupList).
