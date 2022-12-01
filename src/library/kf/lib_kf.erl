%%-------------------------------------------------------
%% @File     : lib_kf.erl
%% @Brief    : 跨服工具函数(少用rpc)
%% @Author   : cablsbs
%% @Date     : 2018-9-19
%%-------------------------------------------------------
-module(lib_kf).

-include("common.hrl").
-include("cluster.hrl").
-include("generator.hrl").
-include("ets_defines.hrl").

-export([
    get_server_node/1,

    call_to_center/3,
    cast_to_center/3,
    call_to_cluster/4,
    cast_to_cluster/4,
    call_to_server/4,
    cast_to_server/4,

    call_to_node/4,
    cast_to_node/4,

    create_kf_scene/4,
    create_kf_scenes/4,
    clear_kf_scene/2
]).


%% Apis -------------------------------------------------

% @doc 获取服务节点名
get_server_node(ServerId) ->
    case util_svr:get_server_type() of
        ?SERVER_TYPE_CENTER ->
            case ets:lookup(?ETS_SVR_INFO, ServerId) of
                [#svr_info{node = Node}] -> Node;
                _ -> undefined
            end;
        ?SERVER_TYPE_CLUSTER ->
            svr_group_agent:get_server_node(ServerId);
        ?SERVER_TYPE_GAME ->
            % node id game (TODO)
            undefined
    end.

% @doc 远程调用跨服中心执行逻辑
call_to_center(Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =/= ?NODE_ID_KFCENTER ->
            rpc_call_by_id(?NODE_ID_KFCENTER, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用跨服中心执行逻辑(异步)
cast_to_center(Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =/= ?NODE_ID_KFCENTER ->
            rpc_cast_by_id(?NODE_ID_KFCENTER, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用集群节点执行逻辑
call_to_cluster(ClusterId, Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =/= ClusterId ->
            rpc_call_by_id(ClusterId, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用集群节点执行逻辑(异步)
cast_to_cluster(ClusterId, Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    if
        NodeId =/= ClusterId ->
            rpc_cast_by_id(ClusterId, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用游戏服节点执行逻辑
call_to_server(ServerId, Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    ServerNum = config:get_server_num(),
    if
        NodeId > ?NODE_ID_GAME ->
            Node = get_server_node(ServerId),
            call_to_node(Node, Module, Fun, Args);
        ServerNum =/= ServerId ->
            Node = get_server_node(ServerId),
            call_to_node(Node, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用游戏服节点执行逻辑(异步)
cast_to_server(ServerId, Module, Fun, Args) ->
    NodeId = util_svr:get_node_id(),
    ServerNum = config:get_server_num(),
    if
        NodeId > ?NODE_ID_GAME ->
            Node = get_server_node(ServerId),
            cast_to_node(Node, Module, Fun, Args);
        ServerNum =/= ServerId ->
            Node = get_server_node(ServerId),
            cast_to_node(Node, Module, Fun, Args);
        true ->
            apply(Module, Fun, Args)
    end.

% @doc 远程调用游戏服节点执行逻辑
call_to_node(SvrNode, Module, Fun, Args) when SvrNode =/= undefined ->
    rpc:call(SvrNode, Module, Fun, Args);
call_to_node(_, Module, Fun, Args) ->
    ?ERROR("Bad rpc call: {M, F, A}: ~p", [{Module, Fun, Args}]),
    failed.

% @doc 远程调用游戏服节点执行逻辑
cast_to_node(SvrNode, Module, Fun, Args) when SvrNode =/= undefined ->
    rpc:cast(SvrNode, Module, Fun, Args);
cast_to_node(Node, Module, Fun, Args) ->
    ?ERROR("Bad rpc cast ~w: {M, F, A}: ~p", [Node, {Module, Fun, Args}]),
    failed.

create_kf_scene(SceneID, ActID, GroupID, LineID) ->
    svr_cluster_scene_mgr:create_scene_line(SceneID, ActID, GroupID, LineID).

create_kf_scenes(SceneID, ActID, GroupID, LineList) ->
    svr_cluster_scene_mgr:create_scene_lines(SceneID, ActID, GroupID, LineList).

clear_kf_scene(SceneID, LineID) ->
    svr_cluster_scene_mgr:kick_all_role(SceneID, LineID),
    svr_cluster_scene_mgr:close_line(SceneID, LineID),
    ok.

%% Privates ---------------------------------------------

rpc_call_by_id(Id, Mod, Fun, Arg) ->
    case ets:lookup(?ETS_NODE, Id) of
        [NodeInfo] ->
            rpc:call(NodeInfo#node_info.node, Mod, Fun, Arg);
        _ when Id =/= ?NODE_ID_KFCENTER ->
            case call_to_center(ets, lookup, [?ETS_NODE, Id]) of
                [#node_info{node = Node, cookie = Cookie} = NodeInfo] ->
                    erlang:set_cookie(Node, Cookie),
                    net_adm:ping(Node),
                    call_to_node(Node, Mod, Fun, Arg),
                    ets:insert(?ETS_NODE, NodeInfo);
                _ ->
                    rpc_failed
            end;
        _ ->
            ?ERROR("Not connect to center yet !!!"),
            rpc_failed
    end.

rpc_cast_by_id(Id, Mod, Fun, Arg) ->
    case ets:lookup(?ETS_NODE, Id) of
        [NodeInfo] ->
            rpc:cast(NodeInfo#node_info.node, Mod, Fun, Arg);
        _ when Id =/= ?NODE_ID_KFCENTER ->
            case call_to_center(ets, lookup, [?ETS_NODE, Id]) of
                [#node_info{node = Node, cookie = Cookie} = NodeInfo] ->
                    erlang:set_cookie(Node, Cookie),
                    net_adm:ping(Node),
                    cast_to_node(Node, Mod, Fun, Arg),
                    ets:insert(?ETS_NODE, NodeInfo);
                _ ->
                    rpc_failed
            end;
        _ ->
            ?ERROR("Not connect to center yet !!!"),
            rpc_failed
    end.
