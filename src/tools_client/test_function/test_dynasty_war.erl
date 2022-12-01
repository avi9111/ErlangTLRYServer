%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 10月 2019 17:01
%%%-------------------------------------------------------------------
-module(test_dynasty_war).
-author("Administrator").
-include("svr_client.hrl").
-define(TEST_MOD, ?MODULE).
%% {人数, {min, max}}
-define(ROLE_LEVELS, [{200, {35, 69}}, {80, {70, 79}}, {90, {80, 89}}, {80, {90, 99}}]).
%% API
-export([join/0, enter/1]).

join() ->
    _Sum = lists:sum([S || {S, _} <- ?ROLE_LEVELS]).

enter(MCliId) ->
    _CliId = ?to_cliid(?TEST_MOD, MCliId),
    _Bin = <<>>.



