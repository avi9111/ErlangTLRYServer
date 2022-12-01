%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(sup_rank_svr).
-author("Ryuu").

-behaviour(supervisor).

%% API
-export([
    info_all/1,
    start_link/0,
    stop_child/1,
    start_child/1,
    get_rank_procs/0
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

%% @doc 启动排行榜进程
start_child(RankID) ->
    supervisor:start_child(?SERVER, [RankID]).

%% @doc 关闭子进程
stop_child(RankID) ->
    _ = supervisor:terminate_child(?SERVER, RankID),
    _ = supervisor:delete_child(?SERVER, RankID),
    ok.

%% @doc 向所有子进程发送消息
info_all(Info) ->
    [Pid ! Info || Pid <- get_rank_procs()].

get_rank_procs() ->
    dist:sup_children_pid(?SERVER).

%% =============================================================================
%% Supervisor callbacks
%% =============================================================================

init([]) ->
    SupFlags = {simple_one_for_one, 1000, 3600},

    Children = [
        {'svr_rank', {'svr_rank', start_link, []},
            permanent, 2000, worker, ['svr_rank']}
    ],

    {ok, {SupFlags, Children}}.

%% =============================================================================
%% Internal functions
%% =============================================================================
