%%-------------------------------------------------------
%% @File     : svr_node_kf
%% @Brief    : 跨服节点(维护跨服集群间的连接状态, 100 <-> 300+, 300+之间是互通的)
%% @Author   : cablsbs
%% @Date     : 2018-9-18
%%-------------------------------------------------------
-module(svr_node_kf).

-include("common.hrl").
-include("cluster.hrl").
-include("ets_defines.hrl").

-behaviour(gen_server).

-export([
    p/0,
    start_link/1,
    start_heart_beat/0,
    add_node/1,
    del_node/1,
    get_all_node/0,
    is_center/0,
    cli_conn/1,
    cli_down/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

%% Apis -------------------------------------------------
start_link([IpStr, Port, NodeId]) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [IpStr, Port, NodeId], []).

start_heart_beat() ->
    erlang:send_after(3000, ?MODULE, 'heart_beat').

% @doc 新节点加入
add_node(FromNodeInfo) ->
    info({add_node, FromNodeInfo}).

% @doc 删除节点
del_node(Id) ->
    info({del_node, Id}).

% @doc 获取所有节点列表(列表中不包括本节点)
get_all_node() ->
    NodeInfoList = ets:tab2list(?ETS_NODE),
    [NodeInfo || NodeInfo <- NodeInfoList].


% @doc 判断是否中心节点(100节点)
is_center() ->
    util_svr:is_kfcenter().

% @doc 游戏逻辑节点接入
cli_conn(CliInfo) ->
    gen_server:cast(?MODULE, {'cli_conn', CliInfo}).

% @doc 游戏逻辑节点关闭
cli_down(ServerId) ->
    gen_server:cast(?MODULE, {'cli_down', ServerId}).

info(Info) ->
    ?info(Info).

p() ->
    erlang:whereis(?MODULE).


%% Callbacks --------------------------------------------
init([IpStr, _Port, NodeId]) ->
    NowTime = time:unixtime(),
    init_server_state(NodeId, NowTime),

    % 登记自己的节点并开始心跳
    NowTime = time:unixtime(),
    Cookie = erlang:get_cookie(),
    NodeName = node(),
    add_node_into_db([NodeId, NodeName, Cookie, IpStr, NowTime]),
    State = #node_info{id = NodeId, node = NodeName, cookie = Cookie, ip = IpStr, time = NowTime},
    {ok, State}.

handle_call(_R, _FROM, State) ->
    {reply, ok, State}.

% 游戏节点接入跨服中心
handle_cast({'cli_conn', [ServerId, NodeName, Cookie, Ip, Port, SvrName]}, State) ->
    SvrInfo = #svr_info{
        svr_id = ServerId, node = NodeName, cookie = Cookie,
        ip = Ip, port = Port, name = SvrName
    },
    ets:insert(?ETS_SVR_INFO, SvrInfo),
    bcast_cli_conn(SvrInfo),
    svr_cluster_scene_mgr:sync_scene_lines(ServerId),
    {noreply, State};

% 游戏节点断开和跨服中心连接 TODO
handle_cast({'cli_down', ServerId}, State) ->
    ets:delete(?ETS_SVR_INFO, ServerId),
    bcast_cli_down(ServerId),
    {noreply, State};

handle_cast(_R, State) ->
    {noreply, State}.

% 心跳(广播自己)
handle_info('heart_beat', State) ->
    erlang:send_after(?HEART_BEAT_INTERVAL, self(), 'heart_beat'),
    Sql = io_lib:format("SELECT `node_id`, `node`, `cookie`, `ip`, `time` FROM `base_node_kf` WHERE `node_id` != ~p", [State#node_info.id]),
    ExistedNodes = ?DB:get_all(Sql),
    do_add_nodes(ExistedNodes, State),
    {noreply, State};

% 新节点加入
handle_info({add_node, FromNodeInfo}, State) ->
    ets:insert(?ETS_NODE, FromNodeInfo),
    {noreply, State};

% 删除已知节点
handle_info({del_node, DelNodeId}, State) ->
    ets:delete(?ETS_NODE, DelNodeId),
    {noreply, State};

handle_info(_Reason, State) ->
    {noreply, State}.

terminate(_R, #node_info{id = NodeId} = State) when NodeId > 0 ->
    del_node_from_db(NodeId),
    rpc_cast_del_node(NodeId),
    {ok, State};
terminate(_R, State) ->
    ?ERROR("crash before initiate"),
    {ok, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
% 加入服务器集群
add_node_into_db([Id, NodeName, Cookie, Ip, Time]) ->
    SqlFmt = <<"REPLACE INTO `base_node_kf` (`node_id`, `node`, `cookie`, `ip`, `time`) VALUES (~p, '~s', '~s', '~s', ~p)">>,
    Sql = io_lib:format(SqlFmt, [Id, NodeName, Cookie, Ip, Time]),
    ?DB:execute(Sql).

% 退出服务器集群
del_node_from_db(Id) ->
    Sql = io_lib:format(<<"DELETE FROM `base_node_kf` WHERE `node_id` = ~p">>, [Id]),
    ?DB:execute(Sql).

% 初始化服务器状态
init_server_state(NodeId, _NowTime) ->
    SvrType = ?iif(NodeId =:= ?NODE_ID_KFCENTER, ?SERVER_TYPE_CENTER, ?SERVER_TYPE_CLUSTER),
    ServerStates = [
        #server_state{name = node_id, value = NodeId},
        #server_state{name = server_type, value = SvrType}
    ],
    ets:insert(?ETS_SERVER_STATE, ServerStates).

% @doc 通知其他节点关闭本节点
rpc_cast_del_node(SelfNodeId) ->
    ExistedNodes = ets:tab2list(?ETS_NODE),
    do_del_nodes(ExistedNodes, SelfNodeId).

% 通知已启动节点添加当前节点
do_add_nodes([[Id, NodeNameDb, NodeCookieDb, Ip, Time] | Rest], SelfNode) ->
    NodeName = type:object_to_atom(NodeNameDb),
    NodeCookie = type:object_to_atom(NodeCookieDb),
    NodeIp = type:object_to_list(Ip),
    case net_adm:ping(NodeName) of
        pong ->
            % 向首次连接的300节点发送已连接的服务器列表
            case ets:member(?ETS_NODE, Id) of
                false when SelfNode#node_info.id =:= ?NODE_ID_KFCENTER ->
                    ?INFO("Connection between ~p and ~p established !", [node(), NodeName]),
                    SvrInfoList = ets:tab2list(?ETS_SVR_INFO),
                    lib_kf:cast_to_node(NodeName, svr_group_agent, init_svr_infos, [SvrInfoList]);
                _ ->
                    skip
            end,
            NodeInfo = #node_info{
                id = Id,
                node = NodeName, cookie = NodeCookie,
                ip = NodeIp, time = Time
            },
            ets:insert(?ETS_NODE, NodeInfo),                            % 加入已知节点列表
            rpc:cast(NodeName, svr_node_kf, add_node, [SelfNode]);      % 通知已有的节点加入自己
        pang ->
            case ets:member(?ETS_NODE, Id) of
                true ->
                    % 连接断开
                    ?INFO("Connection between ~p and ~p losted !", [node(), NodeName]),
                    ets:delete(?ETS_NODE, Id);
                false ->
                    skip
            end
    end,
    do_add_nodes(Rest, SelfNode);
do_add_nodes([], _SelfNodeArgs) ->
    ok.

% 通知已连接节点删除当前节点
do_del_nodes([#node_info{id = SelfNodeId} | Rest], SelfNodeId) ->
    do_del_nodes(Rest, SelfNodeId);
do_del_nodes([#node_info{node = NodeName} | Rest], SelfNodeId) ->
    rpc:cast(NodeName, svr_node_kf, del_node, [SelfNodeId]),
    do_del_nodes(Rest, SelfNodeId);
do_del_nodes([], _SelfNodeId) ->
    ok.

% 广播到所有300节点添加游戏服节点信息
bcast_cli_conn(SvrInfo) ->
    [
        lib_kf:cast_to_node(ClusterNode, svr_group_agent, cli_conn, [SvrInfo])
        || #node_info{node = ClusterNode} <- ets:tab2list(?ETS_NODE)
    ].

% 广播到所有300节点移除游戏服节点信息
bcast_cli_down(ServerId) ->
    [
        lib_kf:cast_to_node(ClusterNode, svr_group_agent, cli_down, [ServerId])
        || #node_info{node = ClusterNode} <- ets:tab2list(?ETS_NODE)
    ].
