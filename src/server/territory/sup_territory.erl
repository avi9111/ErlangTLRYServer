%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_territory).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    start_link/0,
    stop_child/1,
    start_child/1
]).

%% Supervisor callbacks
-export([
    init/1
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API functions
%% =============================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_child(ChildSpec) ->
    supervisor:start_child(?SERVER, ChildSpec).

stop_child(ChildID) ->
    _ = supervisor:terminate_child(?SERVER, ChildID),
    _ = supervisor:delete_child(?SERVER, ChildID),
    ok.

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_territory_battle, {sup_territory_battle, start_link, []},
            permanent, 10000, supervisor, [sup_territory_battle]},
        {svr_territory, {svr_territory, start_link, []},
            permanent, 10000, worker, [svr_territory]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

