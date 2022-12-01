%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[休息室管理监督者]
%%% @end
%%% Created : 31. 十月 2018 14:34
%%%-------------------------------------------------------------------
-module(sup_career_battle_lounge).

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

start_child(RoomID) ->
    supervisor:start_child(?SERVER, [RoomID]).

stop_child(Pid) ->
    _ = supervisor:terminate_child(?SERVER, Pid).

stop_all() ->
    [stop_child(Proc) || Proc <- children_procs()].

%% @doc 向所有Boss进程发送消息
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
        {'svr_career_battle_lounge', {'svr_career_battle_lounge', start_link, []},
            transient, 2000, worker, ['svr_career_battle_lounge']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================