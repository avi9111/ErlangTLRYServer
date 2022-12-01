%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派进程
%%% @end
%%% Created : 30. 五月 2016 17:26
%%% ----------------------------------------------------------------------------
-module(sup_guild_svr).
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

%% @doc 启动帮派进程
start_child(GuildID) ->
    supervisor:start_child(?SERVER, [GuildID]).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    AChild = {'svr_guild', {'svr_guild', start_link, []},
        temporary, 2000, worker, ['svr_guild']},

    {ok, {SupFlags, [AChild]}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
