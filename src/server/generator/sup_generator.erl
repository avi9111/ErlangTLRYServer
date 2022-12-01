%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     ID生成
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_generator).
-author("Ryuu").

-include("generator.hrl").

-behaviour(supervisor).

%% API
-export([
    start_link/0,
    start_child/1,
    start_logic/0
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

start_logic() ->
    [start_child(Type) || Type <- ?GEN_LOGIC].

start_child(Type) ->
    supervisor:start_child(?SERVER, [Type]).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {svr_generator, {svr_generator, start_link, []},
            permanent, 2000, worker, [svr_generator]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
