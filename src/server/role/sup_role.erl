%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     玩家进程监督树
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_role).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    start_link/0,
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

start_child(RoleId) ->
    supervisor:start_child(?SERVER, [RoleId]).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_role', {'svr_role', start_link, []},
         temporary, 2000, worker, ['svr_role']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

