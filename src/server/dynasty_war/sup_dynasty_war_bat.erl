%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [战斗]
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_dynasty_war_bat).
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

start_child(GroupID) ->
    supervisor:start_child(?SERVER, [GroupID]).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_dynasty_war_bat', {'svr_dynasty_war_bat', start_link, []},
            transient, 2000, worker, ['svr_dynasty_war_bat']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
