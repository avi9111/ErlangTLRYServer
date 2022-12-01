%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     活动
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_activity).
-author("Ryuu").

-include("common.hrl").

-behaviour(supervisor).

%% API
-export([
    start_link/2,
    delete_child/1,
    stop_activity/1,
    start_activity/1
]).

%% Supervisor callbacks
-export([
    init/1
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API functions
%% =============================================================================

start_link(NodeID, SvrType) ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, [NodeID, SvrType]).

start_activity(ChildSpec) ->
    supervisor:start_child(?SERVER, ChildSpec).

%% 关闭活动,如果进程trap_exit,将terminate收到退出shutdown
stop_activity(ChildId) ->
    _ = supervisor:terminate_child(?SERVER, ChildId),
    _ = supervisor:delete_child(?SERVER, ChildId),
    ok.

delete_child(ChildId) ->
    _ = supervisor:delete_child(?SERVER, ChildId).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([NodeID, SvrType]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {svr_activity_mgr, {svr_activity_mgr, start_link, [NodeID, SvrType]},
            permanent, 10000, worker, [svr_activity_mgr]}
    ],

    Extras = if
        NodeID =:= ?NODE_ID_GAME -> %% 10
            [
                {svr_auction, {svr_auction, start_link, []},
                    permanent, 10000, worker, [svr_auction]},
                {svr_market, {svr_market, start_link, []},
                    permanent, 10000, worker, [svr_market]},
                {sup_guild_defend, {sup_guild_defend, start_link, []},
                    permanent, 10000, supervisor, [sup_guild_defend]},
                {sup_career_battle, {sup_career_battle, start_link, []},
                    permanent, 10000, supervisor, [sup_career_battle]},
                {sup_territory, {sup_territory, start_link, []},
                    permanent, 10000, supervisor, [sup_territory]},
                {svr_examine, {svr_examine, start_link, []},
                    permanent, 10000, worker, [svr_examine]},
                {sup_world_boss, {sup_world_boss, start_link, [NodeID]},
                    permanent, 10000, supervisor, [sup_world_boss]},
                {svr_vow, {svr_vow, start_link, []},
                    permanent, 10000, worker, [svr_vow]},
                {svr_marry_hall, {svr_marry_hall, start_link, []},
                    permanent, 10000, worker, [svr_marry_hall]},
%%                {sup_sword_fight, {sup_sword_fight, start_link, []},
%%                    permanent, 10000, supervisor, [sup_sword_fight]},
                {svr_lake_bandits, {svr_lake_bandits, start_link, []},
                    permanent, 10000, worker, [svr_lake_bandits]}
            ];
        NodeID =:= ?NODE_ID_KFCENTER -> %% 100
            [
            ];
        NodeID >= ?NODE_ID_CLUSTER -> %% 300+
            [
                {sup_dynasty_war, {sup_dynasty_war, start_link, []},
                    permanent, 10000, supervisor, [sup_dynasty_war]}
            ];
        true ->
            [
            ]
    end,

    {ok, {SupFlags, Children ++ Extras}}.

%% ===================================================================
%% Internal functions
%% ===================================================================
