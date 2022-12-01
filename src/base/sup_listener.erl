%%% ------------------------------------------------------
%%% @Module         : sup_listener
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.06.05
%%% @Description    : tcp listerner 监督者
%%% ------------------------------------------------------
-module(sup_listener).

-behaviour(supervisor).

-export([
    start_link/1
]).

-export([
    init/1
]).


-ifdef(async_net).

% 异步网络连接进程数
-define(ACCEPTOR_NUM, 5).

-else.

% 同步网络连接进程数
-define(ACCEPTOR_NUM, 10).

-endif.


%% Apis --------------------------------------------------
start_link(Port) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, Port).


%% Callbacks ---------------------------------------------
init(Port) ->
    SupFlags = {one_for_all, 10, 10},

    Children = [
        {sup_acceptor, {sup_acceptor, start_link, []},
            transient, infinity, supervisor, [sup_acceptor]},
        {svr_listener, {svr_listener, start_link, [?ACCEPTOR_NUM, Port]},
            transient, 100, worker, [svr_listener]}
    ],

    {ok, {SupFlags, Children}}.
