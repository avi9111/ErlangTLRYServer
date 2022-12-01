%%%-----------------------------------
%%% @Module         : sup_client_recv
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2019.03.01
%%% @Description    : 压测客户端 socket托管进程 监督者
%%%-----------------------------------
-module(sup_client_recv).

-behaviour(supervisor).

-export([
    start_link/0
]).

-export([
    init/1
]).

% 客户端网络连接进程
-define(CLIENT_SPEC, {
    recv_loop, {recv_loop, start_link, []},
    temporary, brutal_kill, worker, [recv_loop]
}).


%% Apis ----------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% Callbacks -----------------------------------------------
init([]) ->
    SupFlags = {simple_one_for_one, 0, 1},

    Children = [?CLIENT_SPEC],

    {ok, {SupFlags, Children}}.


%% Privates ------------------------------------------------
