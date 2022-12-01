%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     node_logic
%%% @end
%%% ----------------------------------------------------------------------------
-module(node_logic).
-author("Ryuu").

-include("common.hrl").

%% API
-export([
    stop/0,
    start/1
]).


%% @doc
start([NodeId]) ->
lager:error("node_logic Start() ip="),
    set_game_env(),
    Ip = config:get_server_ip(),
    Port = config:get_server_port(),
    start_services(Ip, Port, NodeId),
    svr_node:start_heart_beat(),
    ok;
start(_) ->
    ok.

start_services(IPStr, Port, NodeID) ->
    {ok, _} = supervisor:start_child(?SUP,
        {sup_listener, {sup_listener, start_link, [Port]},
            permanent, 10000, supervisor, [sup_listener]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_route, {sup_route, start_link, []},
            permanent, 10000, supervisor, [sup_route]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_logic, {svr_logic, start_link, [NodeID]},
            permanent, 10000, worker, [svr_logic]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_node, {svr_node, start_link, [[IPStr, Port, NodeID]]},
            permanent, 10000, worker, [svr_node]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_hot_agent, {svr_hot_agent, start_link, []},
            permanent, 10000, worker, [svr_hot_agent]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_client, {sup_client, start_link, []},
            permanent, 10000, worker, [sup_client]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_client_recv, {sup_client_recv, start_link, []},
            permanent, 10000, worker, [sup_client_recv]}),
    %% 以上是基础服务，添加服务加在后面
    {ok, _} = supervisor:start_child(?SUP,
        {sup_timer, {sup_timer, start_link, [NodeID]},
            permanent, 10000, supervisor, [sup_timer]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_generator, {sup_generator, start_link, []},
            permanent, 10000, supervisor, [sup_generator]}),
    sup_generator:start_logic(),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_ban, {svr_ban, start_link, []},
            permanent, 10000, worker, [svr_ban]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_global_data, {svr_global_data, start_link, []},
            permanent, 10000, worker, [svr_global_data]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_scene, {sup_scene, start_link, [NodeID]},
            permanent, 10000, supervisor, [sup_scene]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_activity, {sup_activity, start_link, [NodeID, ?SERVER_TYPE_GAME]},
            permanent, 10000, supervisor, [sup_activity]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_interaction, {sup_interaction, start_link, []},
            permanent, 10000, supervisor, [sup_interaction]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_log_mgr, {sup_log_mgr, start_link, []},
            permanent, 10000, supervisor, [sup_log_mgr]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_rank, {sup_rank, start_link, []},
            permanent, 10000, supervisor, [sup_rank]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_dungeon_mgr, {sup_dungeon_mgr, start_link, []},
            permanent, 10000, supervisor, [sup_dungeon_mgr]}),
    {ok, _} = supervisor:start_child(?SUP,
        {sup_role_mgr, {sup_role_mgr, start_link, []},
            permanent, 10000, supervisor, [sup_role_mgr]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_recharge, {svr_recharge, start_link, []},
            permanent, 10000, worker, [svr_recharge]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_pet_hatch, {svr_pet_hatch, start_link, []},
            permanent, 10000, worker, [svr_pet_hatch]}),
    {ok, _} = supervisor:start_child(?SUP,
        {client_trig, {client_trig, start_link, []},
            permanent, 10000, worker, [client_trig]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_role_delete, {svr_role_delete, start_link, []},
            permanent, 10000, worker, [svr_role_delete]}),
    {ok, _} = supervisor:start_child(?SUP,
        {svr_merge, {svr_merge, start_link, []},
            permanent, 10000, worker, [svr_merge]}),
    ok.

%% @doc
stop() ->
    ?INFO("step 1: kickoff all players"),
    util_svr:set_closing_svr(),
    svr_ban:close_entrance(),
    spawn(lib_login, stop_all, []),
    wait_for_stop_all(),
    ?INFO("step 2: permanent modules"),
    ?TRY_CATCH(svr_friend:permanent()),
    ?TRY_CATCH(svr_sworn:permanent()),
    ?TRY_CATCH(svr_mentor:permanent()),
    ?TRY_CATCH(svr_guild_mgr:permanent()),
    ?TRY_CATCH(svr_rank_mgr:permanent()),
    ?TRY_CATCH(svr_auction:permanent()),
    ?TRY_CATCH(svr_pet_hatch:permanent()),
    ?TRY_CATCH(svr_market:permanent()),
    ?TRY_CATCH(svr_marriage:permanent()),
    ?TRY_CATCH(svr_vow:permanent()),
    ?TRY_CATCH(svr_role_delete:permanent()),
    ?INFO("step 3: all done"),
    ok.

wait_for_stop_all() ->
    util:sleep(5000),
    case lib_role_agent:online_num() of
        0 ->
            ok;
        RestOnline ->
            ?INFO("~p players still online, still waiting !!!", [RestOnline]),
            wait_for_stop_all()
    end.

set_game_env() ->
    case ?DB:get_all("SELECT `cf_name`, `cf_value` FROM `base_game` WHERE `cf_name` IN ('sid', 'ip', 'port')") of
        SvrConfs when length(SvrConfs) =:= 3 ->
            do_set_game_env(SvrConfs);
        _ ->
            throw(set_server_num_failed)
    end.

do_set_game_env([[<<"sid">>, RawSvrNum] | Rest]) ->
    SvrNum = type:bitstring_to_term(RawSvrNum),
    application:set_env(?APP_NAME, server_num, SvrNum),
    do_set_game_env(Rest);
do_set_game_env([[<<"ip">>, RawIp] | Rest]) ->
    IpStr = bitstring_to_list(RawIp),
    application:set_env(?APP_NAME, server_ip, IpStr),
    do_set_game_env(Rest);
do_set_game_env([[<<"port">>, RawPort] | Rest]) ->
    Port = type:bitstring_to_term(RawPort),
    application:set_env(?APP_NAME, server_port, Port),
    do_set_game_env(Rest);
do_set_game_env([]) ->
    ok.
