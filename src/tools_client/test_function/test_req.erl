%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%         客户端请求
%%% @end
%%% Created : 26. 九月 2019 10:25
%%%-------------------------------------------------------------------
-module(test_req).
-author("Administrator").
-include("svr_client.hrl").
%% API
-export([cs_walk/1, cs_walk/3, auto_walk/5, auto_walk/4, cs_battle/1, cs_monster/1, cs_change_scene/2]).

%% 行走
cs_walk(CliId) ->
    test_scene:walk(CliId, ?DEFAULT_POS, ?DEFAULT_POS).
cs_walk(CliId, ToX, ToY) ->
    test_scene:walk(CliId, ToX, ToY).

auto_walk(CliId, Type, MonId, ToX, ToY) ->
    test_scene:auto_walk(CliId, Type, MonId, ToX, ToY).
%% 自动寻路
auto_walk(CliId, Type, ToX, ToY) ->
    test_scene:auto_walk(CliId, Type, ToX, ToY).

cs_battle(CliId) ->
    test_battle:attack(CliId, ?DEFAULT_POS, ?DEFAULT_POS, ?DEFAULT_POS).

cs_monster(CliId) ->
    test_monster:get_monsters(CliId).

cs_change_scene(CliId, ScenedId) ->
    cs_change_scene(CliId, ScenedId, ?DYN_LINE).
cs_change_scene(CliId, ScenedId, LineId) ->
    Ets = ?to_ets(CliId),
    Bin = <<
        ScenedId:32,
        LineId:64
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 90208, Bin).


