%%-------------------------------------------------------
%% @File     : svr_scene
%% @Brief    : 场景监督者
%% @Author   : cablsbs
%% @Date     : 2018-6-21
%%-------------------------------------------------------
-module(sup_scene).

-behaviour(supervisor).

-include("common.hrl").

-export([
    start_link/1
]).

-export([
    init/1
]).


%% Apis --------------------------------------------------------
start_link(NodeId) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, [NodeId]).


%% Callbacks ---------------------------------------------------
init([?NODE_ID_GAME]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_scene_agent, {sup_scene_agent, start_link, []},
            permanent, 10000, supervisor, [sup_scene_agent]},
        {svr_change_scene, {svr_change_scene, start_link, []},
            permanent, 10000, worker, [svr_change_scene]},
        {svr_scene_mgr, {svr_scene_mgr, start_link, []},
            permanent, 10000, worker, [svr_scene_mgr]},
        {svr_cluster_scene_agent, {svr_cluster_scene_agent, start_link, []},
            permanent, 10000, worker, [svr_cluster_scene_agent]}
    ],
    {ok, {SupFlags, Children}};
init([?NODE_ID_KFCENTER]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {svr_cluster_scene_mgr, {svr_cluster_scene_mgr, start_link, []},
            permanent, 10000, worker, [svr_cluster_scene_mgr]}
    ],
    {ok, {SupFlags, Children}};
init([_NodeId]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_scene_agent, {sup_scene_agent, start_link, []},
            permanent, 10000, supervisor, [sup_scene_agent]}
    ],
    {ok, {SupFlags, Children}}.
