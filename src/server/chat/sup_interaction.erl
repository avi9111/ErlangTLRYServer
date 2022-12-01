%% ----------------------------------------------------------------------------
%% @author Ryuu
%% @copyright (C) 2016, <COMPANY>
%% @doc
%%     交互系统
%% @end
%% ----------------------------------------------------------------------------
-module(sup_interaction).
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
        {svr_filter, {svr_filter, start_link, []},
            permanent, 10000, worker, [svr_filter]},
        {svr_cache, {svr_cache, start_link, []},
            permanent, 10000, worker, [svr_cache]},
        {svr_chat, {svr_chat, start_link, []},
            permanent, 10000, worker, [svr_chat]},
        {svr_rumor, {svr_rumor, start_link, []},
            permanent, 10000, worker, [svr_rumor]},
        {svr_mail, {svr_mail, start_link, []},
            permanent, 10000, worker, [svr_mail]},
        {sup_guild, {sup_guild, start_link, []},
            permanent, 10000, supervisor, [sup_guild]},
        {svr_title, {svr_title, start_link, []},
            permanent, 10000, worker, [svr_title]},
        {svr_friend, {svr_friend, start_link, []},
            permanent, 10000, worker, [svr_friend]},
        {svr_marriage, {svr_marriage, start_link, []},
            permanent, 10000, worker, [svr_marriage]},
        {svr_sworn, {svr_sworn, start_link, []},
            permanent, 10000, worker, [svr_sworn]},
        {svr_mentor, {svr_mentor, start_link, []},
            permanent, 10000, worker, [svr_mentor]},
        {svr_team_mgr, {svr_team_mgr, start_link, []},
            permanent, 10000, worker, [svr_team_mgr]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
