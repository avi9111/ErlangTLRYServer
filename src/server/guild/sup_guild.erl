%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% Created : 30. 五月 2016 17:26
%%% ----------------------------------------------------------------------------
-module(sup_guild).
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
        {sup_guild_svr, {sup_guild_svr, start_link, []},
            permanent, 10000, supervisor, [sup_guild_svr]},
        {svr_guild_mgr, {svr_guild_mgr, start_link, []},
            permanent, 10000, worker, [svr_guild_mgr]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
