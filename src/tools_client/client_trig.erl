%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 九月 2019 19:48
%%%-------------------------------------------------------------------
-module(client_trig).
-author("Administrator").

-behavior(gen_server).
%%%=======================EXPORT=======================
%%-compile(export_all).
-export([register/2, unregister/1, type_init/1, monster_die/2, obj_walk/4, init_ok/0]).
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).
-export([dist/4]).
-include("svr_client.hrl").
%%%=======================INCLUDE======================

%%%=======================RECORD=======================
-record(state, {ets}).
%%%=======================DEFINE=======================
-define(ATTACK_AREA, 50).
-define(RUN_DIST, 3).
-define(TRIG_TIME, 1500).
-define(RESET_TIME, 1000 * 60 * 10). %% 十分钟重置一次
-define(WEIGHT, 2000).
%%%=================EXPORTED FUNCTIONS=================
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init_ok() ->
    gen_server:cast(?MODULE, {'init_ok'}).

type_init(Args) ->
    gen_server:cast(?MODULE, {'register', Args}).

register(CliId, Type) ->
    gen_server:cast(?MODULE, {'register', {CliId, ?IDLE_STATE, Type, 0, 0}}).

unregister(Clid) ->
    gen_server:cast(?MODULE, {'unregister', Clid}).

monster_die(CliId, MonIds) ->
    gen_server:cast(?MODULE, {'monster_die', {CliId, MonIds}}).

obj_walk(CliId, MonId, CurX, CurY) ->
    case ets:lookup(?MODULE, CliId) of
        [] ->
            ok;
        [Ele] ->
            {Cast, Args} = case Ele of
                {_, State, Type, MonId, Path, {MonX, MonY}, Next} ->
                    case MonX =/= CurX orelse MonY =/= CurY of
                        true ->
                            {true, {CliId, State, Type, MonId, Path, {CurX, CurY}, Next}};
                        _ ->
                            {false, false}
                    end;
                {_, State, Type, MonId, {MonX, MonY}} ->
                    case MonX =/= CurX orelse MonY =/= CurY of
                        true ->
                            {true, {CliId, State, Type, MonId, {CurX, CurY}}};
                        _ ->
                            {false, false}
                    end;
                _ ->
                    {false, false}
            end,
            Cast andalso gen_server:cast(?MODULE, {'obj_walk', Args})
    end.

init(_) ->
    erlang:send_after(?TRIG_TIME, self(), 'trig'),
    erlang:send_after(?RESET_TIME, self(), 'reset'),
    {ok, #state{ets = ets:new(?MODULE, [named_table])}}.

handle_call(_Req, _From, State) ->
    {noreply, State}.

handle_cast({'monster_die', {CliId, MonIds}}, #state{ets = Table} = State) ->
    ?dev_print('monster_die', "monster_die", {CliId, MonIds}),
%%    io:format("Module:[~p], Line:[~p],  ...........:~p~n", [?MODULE, ?LINE, MonIds]),
    case ets:lookup(Table, CliId) of
        [Ele] ->
%%            io:format("Module:[~p], Line:[~p],  erlang:element(4, Ele)...........:~p~n", [?MODULE, ?LINE, erlang:element(4, Ele)]),
            lists:member(erlang:element(4, Ele), MonIds) andalso
                ets:insert(Table, {CliId, ?IDLE_STATE, ?ATTACK_TYPE, 0, 0});
        _ ->
            ok
    end,
    {noreply, State};
handle_cast({'obj_walk', Args}, #state{ets = Ets} = State) ->
    ets:insert(Ets, Args),
    {noreply, State};
handle_cast({'register', Args}, #state{ets = Ets} = State) ->
    ets:insert(Ets, Args),
    {noreply, State};
handle_cast({'unregister', CliId}, #state{ets = Ets} = State) ->
    ets:delete(Ets, CliId),
    {noreply, State};
handle_cast({'init_ok'}, State) ->
    erlang:send_after(?TRIG_TIME, self(), 'trig'),
    {noreply, State};
handle_cast(_Req, State) ->
    {noreply, State}.

handle_info('trig', #state{ets = Table} = State) ->
    try
        ets_foreach(ets:first(Table), Table)
    catch
        R1:R2 ->
            ?ERROR("trig_error:, R1:~p, R2:~p, error:~p", [R1, R2, erlang:get_stacktrace()])
    end,
    erlang:send_after(?TRIG_TIME, self(), 'trig'),
    {noreply, State};
handle_info('reset', #state{ets = Table} = State) ->
    try
        reset_foreach(ets:first(Table), Table)
    catch
        R1:R2 ->
            ?ERROR("trig_error:, R1:~p, R2:~p, error:~p", [R1, R2, erlang:get_stacktrace()])
    end,
    erlang:send_after(?RESET_TIME, self(), 'reset'),
    {noreply, State};
handle_info(_Req, State) ->
    {noreply, State}.

code_change(_, State, _) ->
    {ok, State}.

terminate(Reason, _State) ->
    ?ERROR("Client_trig_terminate, Reason:~p", [Reason]),
    ok.

ets_foreach('$end_of_table', _Table) ->
    ok;
ets_foreach(CliId, Table) ->
    [Ele] = ets:lookup(Table, CliId),
    trig(Ele, Table, CliId),
    ets_foreach(ets:next(Table, CliId), Table).

reset_foreach('$end_of_table', _Table) ->
    ok;
reset_foreach(CliId, Table) ->
    [Ele] = ets:lookup(Table, CliId),
%%    test_role:cheat(CliId, "powerful"),
    case element(3, Ele) of
        ?RUN_TYPE ->
            ets:insert(Table, {CliId, ?IDLE_STATE, ?RUN_TYPE, 0, 0});
        ?ATTACK_TYPE ->
            ets:insert(Table, {CliId, ?IDLE_STATE, ?ATTACK_TYPE, 0, 0})
    end,
    reset_foreach(ets:next(Table, CliId), Table).

trig(Ele, Table, CliId) ->
    case erlang:element(3, Ele) of
        ?ATTACK_TYPE ->
            trig_attack(Ele, Table, CliId);
        ?RUN_TYPE ->
            trig_run(Ele, Table, CliId);
%%        ?DEST_TYPE ->
%%            trig_dest(Ele, Table, CliId);
        _ ->
            trig_default(Ele, Table, CliId)
    end.

trig_attack({_, ?INIT_ATTACK_POS, ?ATTACK_TYPE, _, _}, _Table, CliId) -> %% 攻击型, 初始时,先到指定坐标
    test_req:auto_walk(CliId, ?ATTACK_TYPE, ?DEFAULT_POS, ?DEFAULT_POS);
trig_attack({_, ?IDLE_STATE, ?ATTACK_TYPE, 0, _}, Table, CliId) -> %% 攻击型, 没有攻击目标
    Ets = ?to_ets(CliId),
    attack(Table, CliId, Ets),
    ok;
trig_attack({_, ?RUN_STATE, ?ATTACK_TYPE, MonId, {MonX, MonY}}, Table, CliId) ->
    Ets = ?to_ets(CliId),
    case MonId =/= 0 of
        true ->
            {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
            DistPow = lib_battle_aid:square(MonX - X) + lib_battle_aid:square(MonY - Y),
            case DistPow =< ?ATTACK_AREA of
                true ->
                    ets:insert(Table, {CliId, ?ATTACK_STATE, ?ATTACK_TYPE, MonId, {MonX, MonY}}),
                    test_battle:attack(CliId, MonId, MonX, MonY),
                    ok;
                _ ->
                    test_req:cs_walk(CliId, MonX, MonY),
                    ok
            end;
        _ ->
            ets:insert(Table, {CliId, ?IDLE_STATE, ?ATTACK_TYPE, 0, 0})
    end;
trig_attack({_, ?PATH_STATE, ?ATTACK_TYPE, MonId, [], {MonX, MonY}, _}, Table, CliId) ->
    case MonId =/= 0 of
        true ->
            Ets = ?to_ets(CliId),
            {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
            DistPow = dist(X, Y, MonX, MonY),
            case DistPow =< ?ATTACK_AREA of
                true ->
                    ets:insert(Table, {CliId, ?ATTACK_STATE, ?ATTACK_TYPE, MonId, {MonX, MonY}}),
                    test_battle:attack(CliId, MonId, MonX, MonY),
                    ok;
                _ ->
                    test_req:cs_walk(CliId, MonX, MonY),
                    ok
            end;
        _ ->
            ets:insert(Table, {CliId, ?IDLE_STATE, ?ATTACK_TYPE, 0, 0})
    end;
trig_attack({_, ?PATH_STATE, ?ATTACK_TYPE, MonId, [{MonX, MonY} | Rest], MonPos, _}, Table, CliId) ->
    ets:insert(Table, {CliId, ?PATH_STATE, ?ATTACK_TYPE, MonId, Rest, MonPos, {MonX, MonY}}),
    test_req:cs_walk(CliId, MonX, MonY);
trig_attack({_, ?ATTACK_STATE, ?ATTACK_TYPE, MonId, {MonX, MonY}}, _Table, CliId) ->
    Random = util:rand(1, 10000),
    Random < ?WEIGHT andalso begin
        test_role:cheat(CliId, "full_hp"),
        test_role:cheat(CliId, "full_mp")
    end,
%%    io:format("Module:[~p], Line:[~p],  ...........:~p~n", [?MODULE, ?LINE, {MonId, MonX, MonY}]),
    auto_attack(CliId, MonId, MonX, MonY),
    ok.

trig_run({_, ?IDLE_STATE, ?RUN_TYPE, _, _}, _Table, CliId) ->
    Random = util:rand(1, 10000),
    Random < ?WEIGHT andalso begin
        test_role:cheat(CliId, "full_hp"),
        test_role:cheat(CliId, "full_mp")
    end,
    test_req:auto_walk(CliId, ?RUN_TYPE, ?DEFAULT_POS, ?DEFAULT_POS);
trig_run({_, ?PATH_STATE, Type, [], _}, Table, CliId) ->
    case Type of
        ?RUN_TYPE ->
            ets:insert(Table, {CliId, ?IDLE_STATE, Type, [], 0});
        _ ->
            ets:delete(Table, CliId)
    end;
trig_run({_, ?PATH_STATE, Type, [{NX, NY} | Rest], _}, Table, CliId) ->
    ?dev_print(trig_run_3, "trig_run", {NX, NY}),
    test_req:cs_walk(CliId, NX, NY),
    ets:insert(Table, {CliId, ?PATH_STATE, Type, Rest, {NX, NY}});
trig_run(Ele, _, _) ->
    ?DEBUG("client_trig_run: ele:~p,  cli_id~", [Ele]).
%%trig_run({_, ?PATH_STATE, Type, [{NX, NY} | Rest], {PreX, PreY}}, Table, CliId) ->
%%    ?dev_print(trig_run_3, "trig_run", {NX, NY}),
%%    Ets = ?to_ets(CliId),
%%    {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
%%    io:format("Module:[~p], Line:[~p],  dist...........:~p~n", [?MODULE, ?LINE, dist(X, Y, PreX, PreY)]),
%%    dist(X, Y, PreX, PreY) =< ?RUN_DIST andalso begin
%%        ets:insert(Table, {CliId, ?PATH_STATE, Type, Rest, {NX, NY}}),
%%        test_req:cs_walk(CliId, NX, NY)
%%    end;

trig_default(Ele, _Table, CliId) ->
    ?DEBUG("client_trig_trig_default: ele:~p,  cli_id~", [Ele, CliId]),
    ok.

auto_attack(CliId, MonId, MonX, MonY) ->
    Ets = ?to_ets(CliId),
    {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
%%    io:format("Module:[~p], Line:[~p],  {X, Y}...........:~p~n", [?MODULE, ?LINE, {X, Y}]),
%%    io:format("Module:[~p], Line:[~p],  {MonX, MonY, X, Y}...........:~p~n", [?MODULE, ?LINE, {MonX, MonY}]),
    case dist(X, Y, MonX, MonY) =< ?ATTACK_AREA of
        true ->
            test_battle:attack(CliId, MonId, MonX, MonY);
        _ ->
            test_req:auto_walk(CliId, ?ATTACK_TYPE, MonId, MonX, MonY)
    end.

attack(Table, CliId, Ets) ->
    try
        {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
        case test_monster:get_monsters(CliId) of
            [] ->
                ok;
            Monsters ->
                {MonId, MonX, MonY} = util:list_rand(Monsters),
                DistPow = lib_battle_aid:square(MonX - X) + lib_battle_aid:square(MonY - Y),
                case DistPow =< ?ATTACK_AREA of
                    true ->
                        ets:insert(Table, {CliId, ?ATTACK_STATE, ?ATTACK_TYPE, MonId, {MonX, MonY}}),
                        test_battle:attack(CliId, MonId, MonX, MonY),
                        ok;
                    _ ->
                        test_req:auto_walk(CliId, ?ATTACK_TYPE, MonId, MonX, MonY)
                end
        end
    catch
        R1:R2 ->
            ?ERROR("client_trig_error, r1:~p, r2:~p, stack:~p", [R1, R2, erlang:get_stacktrace()])
    end.

auto_walk(CliId, NX, NY, PreX, PreY) ->
    Ets = ?to_ets(CliId),
    {_SceneId, _LineId, X, Y, _} = util:get_ets(Ets, 'scene'),
    case dist(X, Y, PreX, PreY) =< ?RUN_DIST of
        true ->
            test_req:cs_walk(CliId, NX, NY);
        _ ->
            test_req:cs_walk(CliId, PreX, PreY)
    end.

dist(X, Y, ToX, ToY) ->
    lib_battle_aid:square(ToX - X) + lib_battle_aid:square(ToY - Y).