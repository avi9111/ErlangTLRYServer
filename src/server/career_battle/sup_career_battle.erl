%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技
%%% @end
%%% Created : 31. 十月 2018 11:30
%%%-------------------------------------------------------------------
-module(sup_career_battle).

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
        {sup_career_battle_lounge, {sup_career_battle_lounge, start_link, []},
            permanent, 10000, supervisor, [sup_career_battle_lounge]},
        {sup_career_battle_bat, {sup_career_battle_bat, start_link, []},
            permanent, 10000, supervisor, [sup_career_battle_bat]},
        {svr_career_battle_mgr, {svr_career_battle_mgr, start_link, []},
            permanent, 10000, worker, [svr_career_battle_mgr]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

