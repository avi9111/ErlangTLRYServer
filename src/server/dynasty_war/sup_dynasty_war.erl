%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_dynasty_war).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    start_link/0
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

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_dynasty_war_mgr, {sup_dynasty_war_mgr, start_link, []},
            permanent, 10000, supervisor, [sup_dynasty_war_mgr]},
        {sup_dynasty_war_bat, {sup_dynasty_war_bat, start_link, []},
            permanent, 10000, worker, [sup_dynasty_war_bat]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

