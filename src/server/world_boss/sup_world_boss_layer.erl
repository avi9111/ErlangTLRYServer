%%% ------------------------------------------------------
%%% @Module         : sup_world_boss_layer
%%% @Author         : cablsbs
%%% @Email          :
%%% @Created        : 2018.10.15
%%% @Description    : 世界boss领地 监督者
%%% ------------------------------------------------------
-module(sup_world_boss_layer).

-behaviour(supervisor).

-export([
    start_link/0,
    start_layer/1,
    summon_boss/1,
    clear_boss_and_settle/0,
    clear_boss_without_settle/0,
    clear_layer/0,
    settle_up/0
]).

-export([
    init/1
]).


%% Apis --------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_layer(LayerId) ->
    supervisor:start_child(sup_world_boss_layer, [LayerId]).

summon_boss(WorldLv) ->
    dist:sup_info_child(?MODULE, {'summon_boss', WorldLv}).

clear_boss_and_settle() ->
    dist:sup_info_child(?MODULE, 'clear_boss_and_settle').

clear_boss_without_settle() ->
    dist:sup_info_child(?MODULE, 'clear_boss_without_settle').

clear_layer() ->
    dist:sup_info_child(?MODULE, 'clear_layer').

settle_up() ->
    dist:sup_info_child(?MODULE, 'settle_up').


%% Callbacks ---------------------------------------------
init([]) ->
    SupFlags = {simple_one_for_one, 10, 10},
    Children = [
        {svr_world_boss_layer, {svr_world_boss_layer, start_link, []},
        transient, 2000, worker, [svr_world_boss_layer]}
    ],
    {ok, {SupFlags, Children}}.
