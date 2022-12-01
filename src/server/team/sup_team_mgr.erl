%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%     组队
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_team_mgr).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    start_link/0,
    stop_child/1,
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

%% @doc 启动一个队伍管理进程
start_child(GroupID) ->
    supervisor:start_child(?SERVER, [GroupID]).

%% @doc 结束一个队伍管理进程
stop_child(GroupID) ->
    _ = supervisor:terminate_child(?SERVER, GroupID),
    _ = supervisor:delete_child(?SERVER, GroupID),
    ok.

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_team_mgr', {'svr_team_mgr', start_link, []},
            permanent, 2000, worker, ['svr_team_mgr']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
