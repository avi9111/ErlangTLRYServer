%%-------------------------------------------------------
%% @File     : svr_group_agent.erl
%% @Brief    : 活动代理(每个300节点一个，负责300与服务器节点的连接)
%% @Author   : cablsbs
%% @Date     : 2018-9-29
%%-------------------------------------------------------
-module(svr_group_agent).

-include("common.hrl").
-include("cluster.hrl").
-include("ets_defines.hrl").

-behaviour(gen_server).

-export([
    start_link/0,
    cli_conn/1,
    cli_down/1,
    init_svr_infos/1,
    arrangement/1
]).

-export([
    get_server_node/1
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

% 连接器进程状态
-record(group_agent_st, {
    node_info = #node_info{},   % 此节点信息
    svr_infos = #{},            % #{ {SvrId => #svr_info{} }
    ginfos = #{},               % #{ {AId, GId} => #group_info{} }
    connected = sets:new(),     % 已跟此节点联通的服
    arranged = sets:new()       % 已到此节点分配的服
}).

-define(CHECK_CONNECT_INTERVER, 120000).

%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

% @doc 游戏服接入
cli_conn(SvrNode) ->
    gen_server:cast(?MODULE, {'cli_conn', SvrNode}).

% @doc 游戏服关闭
cli_down(ServerId) ->
    gen_server:cast(?MODULE, {'cli_down', ServerId}).

% @doc 首次脸上跨服中心，初始化服务器信息
init_svr_infos(SvrInfoList) ->
    gen_server:cast(?MODULE, {'init_svr_infos', SvrInfoList}).

% @doc 新指派分组
arrangement(GInfo) ->
    gen_server:cast(?MODULE, {'arrangement', GInfo}).

% @doc 查询游戏服节点
get_server_node(ServerId) ->
    gen_server:call(?MODULE, {'get_server_node', ServerId}).


%% Callbacks --------------------------------------------
init([]) ->
    erlang:send_after(?CHECK_CONNECT_INTERVER, self(), 'interval_connect_check'),
    SelfNodeInfo = sys:get_state(svr_node_kf),
    {ok, #group_agent_st{node_info = SelfNodeInfo}}.

handle_call({'get_server_node', ServerId}, _From, State) ->
    SvrNode = case maps:find(ServerId, State#group_agent_st.svr_infos) of
        {ok, #svr_info{node = Node}} -> Node;
        _ -> undefined
    end,
    {reply, SvrNode, State};

handle_call(_Msg, _From, State) ->
    {reply, ok, State}.

handle_cast({'cli_conn', SvrInfo}, State) ->
    #group_agent_st{
        node_info = SelfNodeInfo, svr_infos = SvrInfos,
        connected = Connected, arranged = Arranged
    } = State,
    SvrInfos = State#group_agent_st.svr_infos,
    SvrInfosN = maps:put(SvrInfo#svr_info.svr_id, SvrInfo, SvrInfos),
    ConnectedN = check_connect_cli(Connected, Arranged, SvrInfo, SelfNodeInfo),
    StateN = State#group_agent_st{
        svr_infos = SvrInfosN,
        connected = ConnectedN
    },
    {noreply, StateN};

handle_cast({'cli_down', ServerId}, State) ->
    #group_agent_st{
        svr_infos = SvrInfos,
        connected = Connected
    } = State,
    SvrInfosN = maps:remove(ServerId, SvrInfos),
    ConnectedN = sets:del_element(ServerId, Connected),
    StateN = State#group_agent_st{
        svr_infos = SvrInfosN,
        connected = ConnectedN
    },
    {noreply, StateN};

handle_cast({'init_svr_infos', SvrInfoList}, State) ->
    SvrInfoKvList = [{SvrInfo#svr_info.svr_id, SvrInfo} || SvrInfo <- SvrInfoList],
    SvrInfos = maps:from_list(SvrInfoKvList),
    StateN = State#group_agent_st{svr_infos = SvrInfos},
    {noreply, StateN};

handle_cast({'arrangement', GInfo}, State) ->
    #group_agent_st{
        node_info = SelfNodeInfo, svr_infos = SvrInfos, ginfos = GInfos,
        connected = Connected, arranged = Arranged
    } = State,
    #group_info{act_id = ActId, group_id = GroupId, server_ids = SvrIds} = GInfo,
    GInfosN = maps:put({ActId, GroupId}, GInfo, GInfos),
    UpdateArrangedConnectedFun = fun(SvrId, {AccArranged, AccConnected}) ->
        case sets:is_element(SvrId, AccArranged) of
            true ->
                {AccArranged, AccConnected};
            false ->
                SvrInfo = maps:get(SvrId, SvrInfos, undefined),
                AccArrangedN = sets:add_element(SvrId, AccArranged),
                AccConnectedN = do_connect_cli(AccConnected, SvrInfo, SelfNodeInfo),
                {AccArrangedN, AccConnectedN}
        end
    end,
    {ArrangedN, ConnectedN} = lists:foldl(UpdateArrangedConnectedFun, {Arranged, Connected}, SvrIds),
    StateN = State#group_agent_st{
        ginfos = GInfosN,
        connected = ConnectedN,
        arranged = ArrangedN
    },
    {noreply, StateN};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info('interval_connect_check', State) ->
    erlang:send_after(?CHECK_CONNECT_INTERVER, self(), 'interval_connect_check'),
    #group_agent_st{connected = Connected, arranged = Arranged} = State,
    NotConnected = sets:subtract(Arranged, Connected),
    ConnectedN = case sets:size(NotConnected) > 0 of
        true ->
            #group_agent_st{
                node_info = SelfNodeInfo,
                svr_infos = SvrInfos
            } = State,
            DoConnectFun = fun(SvrId, AccConnected) ->
                SvrInfo = maps:get(SvrId, SvrInfos, undefined),
                check_connect_cli(AccConnected, Arranged, SvrInfo, SelfNodeInfo)
            end,
            sets:fold(DoConnectFun, Connected, NotConnected);
        false ->
            Connected
    end,
    StateN = State#group_agent_st{connected = ConnectedN},
    {noreply, StateN};

handle_info(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
check_connect_cli(Connected, Arranged, #svr_info{svr_id = ServerId} = SvrInfo, SelfNodeInfo) ->
    case sets:is_element(ServerId, Arranged) of
        true -> do_connect_cli(Connected, SvrInfo, SelfNodeInfo);
        false -> Connected
    end;
check_connect_cli(Connected, _Arranged, _SvrInfo, _SelfNodeInfo) ->
    Connected.

do_connect_cli(Connected, #svr_info{svr_id = ServerId, node = Node, cookie = Cookie}, SelfNodeInfo) ->
    erlang:set_cookie(Node, Cookie),
    case net_adm:ping(Node) of
        pong ->
            rpc:cast(Node, svr_node, add_cluster_node, [SelfNodeInfo]),
            sets:add_element(ServerId, Connected);
        _ ->
            Connected
    end;
do_connect_cli(Connected, _SvrInfo, _SelfNodeInfo) ->
    Connected.
