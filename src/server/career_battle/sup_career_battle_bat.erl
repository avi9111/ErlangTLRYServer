%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[战斗]
%%% @end
%%% Created : 31. 十月 2018 11:37
%%%-------------------------------------------------------------------
-module(sup_career_battle_bat).

-behaviour(supervisor).

%% API
-export([
    info_all/1,
    stop_all/0,
    start_link/0,
    stop_child/1,
    start_child/1,
    children_procs/0
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

stop_child(Pid) ->
    _ = supervisor:terminate_child(?SERVER, Pid).

stop_all() ->
    [stop_child(Proc) || Proc <- children_procs()].

info_all(Info) ->
    [Pid ! Info || Pid <- children_procs()].

children_procs() ->
    [Child || {_Id, Child, _Type, _Modules} <- supervisor:which_children(?SERVER)].

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_career_battle_bat', {'svr_career_battle_bat', start_link, []},
            transient, 2000, worker, ['svr_career_battle_bat']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
