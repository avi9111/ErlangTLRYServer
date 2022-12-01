%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [管理]
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_dynasty_war_mgr).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    stop_child/1,
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

stop_child(GroupID) ->
    _ = supervisor:terminate_child(?SERVER, GroupID),
    _ = supervisor:delete_child(?SERVER, GroupID),
    check_clean_data().

check_clean_data() ->
    WorkersNum = workers_num(),
    WorkersNum =:= 0 andalso lib_dynasty_war:clean_up().

workers_num() ->
    Counts = supervisor:count_children(?SERVER),
    util:prop_get_value(workers, Counts, 0).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_dynasty_war_mgr', {'svr_dynasty_war_mgr', start_link, []},
            transient, 2000, worker, ['svr_dynasty_war_mgr']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================

