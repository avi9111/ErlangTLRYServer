%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂
%%% @end
%%% Created : 13. 十一月 2018 19:27
%%%-------------------------------------------------------------------
-module(sup_jousts_hall).

%% API
-export([
    start_link/0
]).

%% Supervisor callbacks
-export([
    init/1,
    stop_activity/1,
    delete_child/1
]).

-define(SERVER, ?MODULE).

%% =============================================================================
%% API functions
%% =============================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% 关闭活动,如果进程trap_exit,将terminate收到退出shutdown
stop_activity(ChildId) ->
    _ = supervisor:terminate_child(?SERVER, ChildId),
    _ = supervisor:delete_child(?SERVER, ChildId),
    ok.

delete_child(ChildId) ->
    _ = supervisor:delete_child(?SERVER, ChildId).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {one_for_one, 1000, 3600},

    Children = [
        {sup_jousts_hall_battle, {sup_jousts_hall_battle, start_link, []},
            temporary, 10000, supervisor, [sup_jousts_hall_battle]},
%%        {svr_jousts_hall_boss, {svr_jousts_hall_boss, start_link, []},
%%            permanent, 10000, worker, [svr_jousts_hall_boss]},
        {svr_jousts_hall_lounge, {svr_jousts_hall_lounge, start_link, []},
            temporary, 10000, worker, [svr_jousts_hall_lounge]}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
