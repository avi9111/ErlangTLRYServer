%%--------------------------------------------
%% @Module         : sup_acceptor
%% @Author         : cablsbs
%% @Email          :
%% @Created        : 2011.06.01
%% @Description    : tcp acceptor 监督进程
%%--------------------------------------------
-module(sup_acceptor).

-behaviour(supervisor).

%% Apis --------------------------------------
-export([
    start_link/0
]).

%% Callbacks ---------------------------------
-export([
    init/1
]).


-ifdef(async_net).

% 异步网络连接进程
-define(ACCEPTOR_SPEC, {
    svr_acceptor_async, {svr_acceptor_async, start_link, []},
    transient, brutal_kill, worker, [svr_acceptor_async]

}).

-else.

% 同步网络连接进程
-define(ACCEPTOR_SPEC, {
    svr_acceptor_sync, {svr_acceptor_sync, start_link, []},
    transient, brutal_kill, worker, [svr_acceptor_sync]
}).

-endif.


%% Apis --------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% Callbacks ---------------------------------
init([]) ->
    SupFlags = {simple_one_for_one, 10, 10},
    Children = [?ACCEPTOR_SPEC],
    {ok, {SupFlags, Children}}.


%% Privates ----------------------------------
