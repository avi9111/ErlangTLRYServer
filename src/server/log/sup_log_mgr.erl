%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     日志
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_log_mgr).
-author("Ryuu").

-include("sys_log.hrl").

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
        {svr_sys_log, {svr_sys_log, start_link, []},
            permanent, 10000, worker, [svr_sys_log]}
    ],
    Extra = [
        {svr_file_log, {svr_file_log, start_link, [ID, Options]},
            permanent, 10000, worker, [svr_file_log]}
        || {ID, Options} <- ?FILE_LOGS
    ],

    {ok, {SupFlags, Children ++ Extra}}.

%% ===================================================================
%% Internal functions
%% ===================================================================

