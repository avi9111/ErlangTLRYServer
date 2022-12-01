%%%-----------------------------------
%%% @Module         : sup_client
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2019.03.01
%%% @Description    : 压测客户端进程
%%%-----------------------------------
-module(sup_client).

-behaviour(supervisor).

-export([
    start_link/0
]).

-export([
    init/1
]).

% 客户端网络连接进程
-define(CLIENT_SPEC, {
    svr_client, {svr_client, start_link, []},
    temporary, brutal_kill, worker, [svr_client]
}).


%% Apis ----------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% Callbacks -----------------------------------------------
init([]) ->
    SupFlags = {simple_one_for_one, 10, 10},

    Children = [?CLIENT_SPEC],

    {ok, {SupFlags, Children}}.


%% Privates ------------------------------------------------
