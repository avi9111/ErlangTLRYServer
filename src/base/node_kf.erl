%%-------------------------------------------------------
%% @File     : node_kf
%% @Brief    : 跨服节点(center + cloud)
%% @Author   : cablsbs
%% @Date     : 2018-9-18
%%-------------------------------------------------------
-module(node_kf).

-include("common.hrl").

-export([
    start/1,
    stop/0
]).


%% Apis -------------------------------------------------
start([NodeId]) ->
lager:error("node_kf Start() ip="),
    set_game_env(),
    Ip = config:get_server_ip(),
    Port = config:get_server_port(),
    start_services(Ip, Port, NodeId),
    svr_node_kf:start_heart_beat(),
    lager:error("node_kf Start() ip="),
    ?ERROR("node_kf start ~p port=~p",[Ip,Port]),
    ok.


stop() ->
    ok.


%% Privates ---------------------------------------------
start_services(IpStr, Port, NodeId) ->
    {ok, _} = supervisor:start_child(?SUP,
        {svr_kf, {svr_kf, start_link, [NodeId]},
            permanent, 10000, worker, [svr_kf]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_node_kf, {svr_node_kf, start_link, [[IpStr, Port, NodeId]]},
            permanent, 10000, supervisor, [svr_node_kf]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_scene, {sup_scene, start_link, [NodeId]},
            permanent, 10000, supervisor, [sup_scene]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_timer, {sup_timer, start_link, [NodeId]},
            permanent, 10000, supervisor, [sup_timer]}),
    % 根据节点类型开启场景
    if
        NodeId =:= ?NODE_ID_KFCENTER -> %% 100
            {ok, _} = supervisor:start_child(?SUP,
                {svr_hot_agent, {svr_hot_agent, start_link, []},
                    permanent, 10000, worker, [svr_hot_agent]}),
            {ok, _} = supervisor:start_child(?SUP,
                {svr_group, {svr_group, start_link, []},
                    permanent, 10000, worker, [svr_group]}),
            % TODO
            % {ok, _} = supervisor:start_child(?SUP,
            %     {sup_world_boss, {sup_world_boss, start_link, [NodeId]},
            %         permanent, 10000, supervisor, [sup_world_boss]}),
            {ok, _} = supervisor:start_child(?SUP,
                {sup_activity, {sup_activity, start_link, [NodeId, ?SERVER_TYPE_CENTER]},
                    permanent, 10000, supervisor, [sup_activity]}),
            ok;
        true ->
            {ok, _} = supervisor:start_child(?SUP,
                {svr_group_agent, {svr_group_agent, start_link, []},
                    permanent, 10000, worker, [svr_group_agent]}),
            {ok, _} = supervisor:start_child(?SUP,
                {sup_activity, {sup_activity, start_link, [NodeId, ?SERVER_TYPE_CLUSTER]},
                    permanent, 10000, supervisor, [sup_activity]}),
            ok
    end,
    ok.

set_game_env() ->
    {ok, IpList} = inet:getif(),
    Ip = element(1, hd(IpList)),
    IpStr = inet:ntoa(Ip),
    application:set_env(?APP_NAME, server_ip, IpStr),
    application:set_env(?APP_NAME, server_port, 0),
    ok.
