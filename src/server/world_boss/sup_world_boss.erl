%%% ------------------------------------------------------
%%% @Module         : sup_world_boss
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.10.15
%%% @Description    : 世界boss活动 监督者
%%% ------------------------------------------------------
-module(sup_world_boss).

-behaviour(supervisor).

-export([
    start_link/1
]).

-export([
    init/1
]).


%% Apis --------------------------------------------------
start_link(NodeId) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, [NodeId]).


%% Callbacks ---------------------------------------------
init([NodeId]) ->
    SupFlags = {one_for_one, 10, 10},

    Children = [
        {sup_world_boss_layer, {sup_world_boss_layer, start_link, []},
            permanent, 10000, supervisor, [sup_scene_agent]},
        {svr_world_boss_mgr, {svr_world_boss_mgr, start_link, [NodeId]},
            permanent, 10000, worker, [svr_world_boss_mgr]},
        {svr_dice, {svr_dice, start_link, []},
            permanent, 10000, worker, [svr_dice]}
    ],

    {ok, {SupFlags, Children}}.
