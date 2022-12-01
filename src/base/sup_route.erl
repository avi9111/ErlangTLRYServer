%%%-----------------------------------
%%% @Module         : sup_route
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.06.05
%%% @Description    : 客户端socket托管进程 监督者
%%%-----------------------------------
-module(sup_route).

-behaviour(supervisor).

-export([
    start_link/0
]).

-export([
    init/1
]).

% 客户端网络连接进程
-define(CLIENT_SPEC, {
    svr_route, {svr_route, start_link, []},
    temporary, brutal_kill, worker, [svr_route]
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
