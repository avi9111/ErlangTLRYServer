%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     vtnemo 入口
%%% @end
%%% ----------------------------------------------------------------------------
-module(vtnemo_app).

-behaviour(application).

-include("log.hrl").
-include("common.hrl").

%% Application callbacks
-export([
    start/2,
    prep_stop/1,
    stop/1
]).

%% =============================================================================
%% API
%% =============================================================================

start(_StartType, _StartArgs) ->
lager:error("vtnemo Start() 111 ip="),
    case vtnemo_sup:start_link() of
        {ok, Pid} ->
            start_node(),
            {ok, Pid};
        Error ->
            Error
    end.

prep_stop(_State) ->
    stop_node(),
    ok.

stop(_State) ->
    ok.

%% =============================================================================
%% Internal functions
%% =============================================================================

start_node() ->
lager:error("vtnemo Start_node() 222 ip="),
    [NodeIDStr | _] = init:get_plain_arguments(),
    NodeID = list_to_integer(NodeIDStr),
    if
        NodeID >= ?NODE_ID_GAME andalso NodeID < ?NODE_ID_KFCENTER ->
            node_logic:start([NodeID]);
        NodeID >= ?NODE_ID_KFCENTER -> % TODO to be implement
            node_kf:start([NodeID]);
        true ->
            ignore
    end,
    ok.

stop_node() ->
    [NodeIDStr | _] = init:get_plain_arguments(),
    NodeID = list_to_integer(NodeIDStr),
    ?INFO("stoping node ~w:~w", [NodeID, node()]),
    if
        NodeID >= ?NODE_ID_GAME andalso NodeID < ?NODE_ID_KFCENTER ->
            node_logic:stop();
        true ->
            ignore
    end.
