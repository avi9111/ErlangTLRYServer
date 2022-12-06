%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     root sup
%%% @end
%%% ----------------------------------------------------------------------------
-module(vtnemo_sup).

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
lager:error("vtnemo super link()"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
lager:error("vtnemo init()"),
    SupFlags = {one_for_one, 1000, 3600},
%%    Children = [
%%        {auto_hot, {auto_hot, start_link, []},
%%            permanent, 10000, worker, [auto_hot]}
%%    ],
%%    {ok, {SupFlags, Children}}.
  {ok, {SupFlags, []}}.
%% =============================================================================
%% Internal functions
%% =============================================================================

