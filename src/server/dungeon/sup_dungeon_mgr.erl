%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_dungeon_mgr).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    start_link/0,
    stop_child/1,
    start_child/1,
    delete_child/1
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

delete_child(ChildID) ->
    _ = supervisor:delete_child(?SERVER, ChildID).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_dungeon, {sup_dungeon, start_link, []},
            permanent, 10000, supervisor, [sup_dungeon]},
        {svr_hero_dungeon, {svr_hero_dungeon, start_link, []},
            permanent, 10000, worker, [svr_hero_dungeon]}
    ],

    {ok, {SupFlags, Children}}.

%% ===================================================================
%% Internal functions
%% ===================================================================

