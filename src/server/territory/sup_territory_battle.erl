%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_territory_battle).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    stop_all/0,
    info_all/1,
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

start_child(Args) ->
    supervisor:start_child(?SERVER, [Args]).

info_all(Info) ->
    dist:sup_info_child(?MODULE, Info).

stop_all() ->
    [stop_child(Proc) || Proc <- dist:sup_children_pid(?MODULE)].

stop_child(Pid) ->
    _ = supervisor:terminate_child(?SERVER, Pid),
    ok.

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_territory_battle', {'svr_territory_battle', start_link, []},
            transient, 2000, worker, ['svr_territory_battle']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================


