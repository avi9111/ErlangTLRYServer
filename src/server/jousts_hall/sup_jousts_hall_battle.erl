%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂(前三轮)
%%% @end
%%% Created : 13. 十一月 2018 19:27
%%%-------------------------------------------------------------------
-module(sup_jousts_hall_battle).
-behaviour(supervisor).

%% API
-export([
    info_all/1,
    stop_all/0,
    start_link/0,
    stop_child/1,
    start_child/1,
    children_procs/0,
    info_select_children/2
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

%% 给部分子进程发消息
info_select_children(Info, SceneIDs) ->
    Pids = [svr_jousts_hall_battle:p(SceneID) || SceneID <- SceneIDs],
    [Pid ! Info || Pid <- Pids].

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_jousts_hall_battle', {'svr_jousts_hall_battle', start_link, []},
            transient, 2000, worker, ['svr_jousts_hall_battle']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
