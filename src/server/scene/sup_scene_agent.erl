%%--------------------------------------------
%% @Module         : sup_scene_agent.erl
%% @Author         : cablsbs
%% @Created        : 2018-06-25
%% @Description    : svr_scene_agent 监督进程
%%--------------------------------------------
-module(sup_scene_agent).

-behaviour(supervisor).

%% Apis --------------------------------------
-export([
    start_link/0
]).

%% Callbacks ---------------------------------
-export([
    init/1
]).


%% Apis --------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


%% Callbacks ---------------------------------
init([]) ->
    SupFlags = {simple_one_for_one, 5, 60},
    Children = [
        {svr_scene_agent, {svr_scene_agent, start_link, []},
        transient, 2000, worker, [svr_scene_agent]}
    ],
    {ok, {SupFlags, Children}}.


%% Privates ----------------------------------
