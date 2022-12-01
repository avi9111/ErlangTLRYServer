%%-------------------------------------------------------
%% @File     : svr_node
%% @Brief    : 游戏逻辑节点(维护游戏节点与跨服中心的连接状态, 10 <-> 100)
%% @Author   : cablsbs
%% @Date     : 2018-9-18
%%-------------------------------------------------------
-module(svr_node).

-include("common.hrl").
-include("cluster.hrl").
-include("ets_defines.hrl").

-behaviour(gen_server).

-export([
    start_link/1,
    start_heart_beat/0,
    add_cluster_node/1
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
start_link([IpStr, Port, Id]) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [IpStr, Port, Id], []).

start_heart_beat() ->
    erlang:send_after(5000, ?MODULE, 'heart_beat').

add_cluster_node(NodeInfo) ->
    gen_server:cast(?MODULE, {'add_cluster_node', NodeInfo}).


%% Callbacks --------------------------------------------
init([IpStr, Port, NodeId]) ->
    NowTime = time:unixtime(),
    init_server_state(NodeId, NowTime),

    % 登记自己的节点并开始心跳
    NodeName = node(),
    Cookie = erlang:get_cookie(),
    State = #node_info{id = NodeId, ip = IpStr, port = Port, node = NodeName, cookie = Cookie, time = NowTime},
    {ok, State}.

handle_call(Req, _From, State) ->
    ?ERROR("Recv unexpected call request: ~p", [Req]),
    {reply, undefined, State}.

handle_cast({'add_cluster_node', NodeInfo}, State) ->
    ?INFO("Connection between ~p and ~p established !", [node(), NodeInfo#node_info.node]),
    ets:insert(?ETS_NODE, NodeInfo),
    {noreply, State};

handle_cast(Msg, State) ->
    ?ERROR("Recv unexpected cast msg: ~p", [Msg]),
    {noreply, State}.

% 心跳
handle_info('heart_beat', State) ->
    erlang:send_after(?HEART_BEAT_INTERVAL, self(), 'heart_beat'),
    case ets:lookup(?ETS_NODE, ?NODE_ID_KFCENTER) of
        [#node_info{node = CenterNode}] ->
            case net_adm:ping(CenterNode) of
                pong ->
                    ClusterNodeInfos = [NodeInfo || NodeInfo <- ets:tab2list(?ETS_NODE)],
                    do_ping_clusters(ClusterNodeInfos);
                _ ->
                    ?INFO("Connection between ~p and ~p losted !", [node(), CenterNode]),
                    ets:delete(?ETS_NODE, ?NODE_ID_KFCENTER)
            end;
        _ ->
            case ?DB:get_row(<<"SELECT `node_id`, `name`, `cookie` FROM `base_kf` WHERE `node_id` = 100">>) of
                [?NODE_ID_KFCENTER, NodeStr, CookieStr] ->
                    CenterNode = type:object_to_atom(NodeStr),
                    CenterCookie = type:object_to_atom(CookieStr),
                    erlang:set_cookie(CenterNode, CenterCookie),
                    case net_adm:ping(CenterNode) of
                        pong ->
                            ?INFO("Connection between ~p and ~p established !", [node(), CenterNode]),
                            ServerNum = config:get_server_num(),
                            #node_info{ip = Ip, node = SelfNode, port = Port, cookie = Cookie} = State,
                            % 将跨服中心节点加入已知节点列表
                            NodeInfo = #node_info{id = ?NODE_ID_KFCENTER, node = CenterNode, cookie = CenterCookie},
                            ets:insert(?ETS_NODE, NodeInfo),
                            % 游戏服接入跨服中心
                            CliConnArgs = [ServerNum, SelfNode, Cookie, Ip, Port, "default_name"],
                            lib_kf:cast_to_center(svr_node_kf, cli_conn, [CliConnArgs]);
                        _ ->
                            skip
                    end;
                [] ->
                    skip
            end
    end,
    {noreply, State};

handle_info(Info, State) ->
    ?ERROR("Recv unexpected info msg: ~p", [Info]),
    {noreply, State}.

terminate(_R, State) ->
    ServerNum = config:get_server_num(),
    lib_kf:cast_to_center(svr_node_kf, cli_down, [ServerNum]),
    {ok, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
% 初始化服务器状态
init_server_state(NodeId, NowTime) ->
    % 开服时间
    OpenTime = case ?DB:get_row(<<"SELECT `cf_value` FROM `base_game` WHERE `cf_name`='version'">>) of
        [] ->
            NowTime;
        [String] ->
            [Y, M, D | _] = string:tokens(binary_to_list(String), "-"),
            Year = list_to_integer(Y),
            Month = list_to_integer(M),
            Day = list_to_integer(D),
            time:unixtime({{Year, Month, Day}, {0, 0, 0}})
    end,

    % 合服时间及次数
    {MergeTime, MergeCount} = case ?DB:get_row(<<"SELECT `time`, `merge_count` FROM `merge_count` ORDER BY `time` DESC LIMIT 1">>) of
        [MergeTimeDB, MergeCountDB] when is_integer(MergeTimeDB), is_integer(MergeCountDB) ->
            {MergeTimeDB, MergeCountDB};
        _ -> {0, 0}
    end,

    PioneerLv = util_svr:def_pioneer_lv(),

    % 初始化ServerStates
    ServerStates = [
        #server_state{name = node_id, value = NodeId},
        #server_state{name = server_type, value = ?SERVER_TYPE_GAME},
        #server_state{name = open_time, value = OpenTime},
        #server_state{name = merge_count, value = MergeCount},
        #server_state{name = merge_time, value = MergeTime},
        #server_state{name = start_time, value = NowTime},
        #server_state{name = is_closing_svr, value = false},
        #server_state{name = pioneer_lv, value = PioneerLv}
    ],
    ets:insert(?ETS_SERVER_STATE, ServerStates).

do_ping_clusters([#node_info{id = NodeId, node = NodeName} | Rest]) when NodeId >= ?NODE_ID_CLUSTER ->
    case net_adm:ping(NodeName) of
        pong ->
            skip;
        _ ->
            ?INFO("Connection between ~p and ~p losted !", [node(), NodeName]),
            ets:delete(?ETS_NODE, NodeId)
    end,
    do_ping_clusters(Rest);
do_ping_clusters([_ | Rest]) ->
    do_ping_clusters(Rest);
do_ping_clusters([]) ->
    ok.
