%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%     Timer
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_timer).
-author("Ryuu").

-include("common.hrl").

-behaviour(supervisor).

%% API
-export([
    start_link/1
]).

%% Supervisor callbacks
-export([
    init/1
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API functions
%% =============================================================================

start_link(NodeID) ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, [NodeID]).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([NodeID]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {svr_timer, {svr_timer, start_link, []},
            permanent, 10000, worker, [svr_timer]}
    ],

    Extras = if
        NodeID =:= ?NODE_ID_GAME ->     % 10
            [
                {svr_global_timer, {svr_global_timer, start_link, [NodeID]},
                    permanent, 10000, worker, [svr_global_timer]}
            ];
        NodeID =:= ?NODE_ID_KFCENTER -> % 100
            [
                {svr_global_timer, {svr_global_timer, start_link, [NodeID]},
                    permanent, 10000, worker, [svr_global_timer]}
            ];
        true ->                         % 300+
            []
    end,

    {ok, {SupFlags, Children ++ Extras}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
