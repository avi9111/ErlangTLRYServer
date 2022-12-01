%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. 九月 2019 14:59
%%%-------------------------------------------------------------------
-module(pressure_test).
-author("Administrator").

%% API
-compile(export_all).
%% 场景, 人数
-include("svr_client.hrl").
-include("common.hrl").
%% {场景Id, [{人数, 类型, 一次随机最大人数, 一次随机最小人数}]}
-define(LUO_YANG, {10000, [{99, ?RUN_TYPE, 20, 10}]}).
-define(LUO_YANG2, {10000, [{99, ?RUN_TYPE, 20, 10}]}).
-define(XUAN_WU_DAO, {40011, [{200, ?RUN_TYPE, 20, 10}, {1000, ?ATTACK_TYPE, 20, 10}]}).
-define(SCENES, [?LUO_YANG, ?XUAN_WU_DAO]).
-define(LEVEL_LIMIT, 1).
-define(LEVEL, 70).

test() ->
    spawn(fun() -> presure() end).

%% 综合压测
presure() ->
    g_table(),
    SceneNum = util:list_disorder(generate_type(?SCENES)),
    lists:foreach(fun({SceneId, Num, Type}) ->
        lists:foreach(fun(_) ->
            CliId = generate_id(SceneId),
            svr_client:login(CliId, CliId),
            timer:sleep(3000),
            Ets = ?to_ets(CliId),
            try
                {_Name, _ServerNum, _ServerTime, _Gender, Level, _Exp} = util:get_ets(Ets, 'role'),
                Level < ?LEVEL andalso test_role:cheat(CliId, ?LEVEL),
                test_req:cs_change_scene(CliId, SceneId),
                timer:sleep(200),
                test_role:cheat(CliId, "full_mp"),
                test_role:cheat(CliId, "full_hp"),
                ?INFO("presure, CliId:~p, SceneId:~p, name:~p", [CliId, SceneId, CliId]),
                test_role:cheat(CliId, "powerful"),
                case Type of
                    ?ATTACK_TYPE ->
                        client_trig:type_init({CliId, ?INIT_ATTACK_POS, Type, 0, 0});
                    _ ->
                        client_trig:type_init({CliId, ?IDLE_STATE, Type, 0, 0})
                end
            catch
                _:_ ->
                    delete(CliId),
                    ok
            end
        end, lists:seq(1, Num))
    end, SceneNum),
    ?p("init", "presure successful").

save() ->
    spawn(fun() ->
        g_table(),
        SceneNum = util:list_disorder(generate_type([?LUO_YANG2])),
        lists:foreach(fun({SceneId, Num, _Type}) ->
            lists:foreach(fun(_) ->
                CliId = generate_id(SceneId),
                svr_client:login(CliId, CliId),
                timer:sleep(100)
%%                test_role:cheat(CliId, ?LEVEL)
            end, lists:seq(1, Num))
        end, SceneNum),
        test_goods:test_goods(),
        io:format("presure successful..................~n"),
        game:stop()
    end).


delete(CliId) ->
    SceneId = util:get_ets(?MODULE, CliId),
    ets:delete(?MODULE, CliId),
    List = util:get_ets(?MODULE, SceneId),
    ets:insert(?MODULE, {SceneId, lists:delete(CliId, List)}).

scene_id(CliId) ->
    util:get_ets(?MODULE, CliId).

generate_id(SceneId) ->
    Id = util:get_ets(?MODULE, 'id'),
    ets:insert(?MODULE, {'id', Id + 1}),
    CliId = ?to_cliid(?MODULE, Id),
    ets:insert(?MODULE, {CliId, SceneId}),
    L = util:get_ets(?MODULE, SceneId, []),
    Ids = util:get_ets(?MODULE, 'cli_ids', []),
    ets:insert(?MODULE, {'cli_ids', [Id | Ids]}),
    ets:insert(?MODULE, {SceneId, [Id | L]}),
    CliId.

g_table() ->
    ets:new(?MODULE, [named_table, public]),
    case file:consult("./config/test.config") of
        {ok, [List]} when is_list(List) ->
            Ip = util:prop_get_value(ip, List),
            Port = util:prop_get_value(port, List),
            ServerId = util:prop_get_value(server_id, List),
            Node = util:prop_get_value(node, List),
            Cookie = util:prop_get_value(cookie, List),
            erlang:set_cookie(Node, Cookie),
            net_kernel:connect_node(Node),
            ets:insert(?MODULE, {'id', 1}),
            ets:insert(?MODULE, {'server_config', {Ip, Port, ServerId, Node, Cookie}});
        Err ->
            throw({"error, config", Err})
    end.

server_config() ->
    util:get_ets(?MODULE, 'server_config', 'none').

server_node() ->
    element(4, util:get_ets(?MODULE, 'server_config')).

all_cliids() ->
    util:get_ets(?MODULE, 'cli_ids').

generate_type(Scenes) ->
    lists:foldl(fun({SceneId, List}, Acc) ->
        L = generate_type_(List, []),
        [{SceneId, Num, Type} || {Num, Type} <- L] ++ Acc
    end, [], Scenes).

generate_type_([{0, _, _, _} | T], Acc) ->
    generate_type_(T, Acc);
generate_type_([{Num, Type, OneMax, OneMin} | T], Acc) ->
    RandNum = util:rand(1, Num),
    Cur = case RandNum > OneMax of
        true ->
            OneMax;
        _ ->
            ?iif(RandNum < OneMin, OneMin, RandNum)
    end,
    generate_type_([{max(Num - Cur, 0), Type, OneMax, OneMin} | T], [{Cur, Type} | Acc]);
generate_type_([], Acc) ->
    Acc.



enter_lmt([{?LEVEL_LIMIT, Lv} | _], ?LEVEL_LIMIT) ->
    Lv;
enter_lmt(_, _) ->
    throw(error).