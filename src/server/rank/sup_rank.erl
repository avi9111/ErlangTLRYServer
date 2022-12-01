%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_rank).
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
        {'sup_rank_svr', {sup_rank_svr, start_link, []},
            permanent, 10000, supervisor, [sup_rank_svr]},
        {'svr_rank_mgr', {svr_rank_mgr, start_link, []},
            permanent, 10000, worker, [svr_rank_mgr]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
