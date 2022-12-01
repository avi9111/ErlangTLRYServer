%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     玩家监督树
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_role_mgr).
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
        {'sup_role', {'sup_role', start_link, []},
            permanent, 2000, supervisor, ['sup_role']},
        {'svr_role_agent', {'svr_role_agent', start_link, []},
            permanent, 2000, worker, ['svr_role_agent']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

