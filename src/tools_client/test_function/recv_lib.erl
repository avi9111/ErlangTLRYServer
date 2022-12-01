%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 九月 2019 14:09
%%%-------------------------------------------------------------------
-module(recv_lib).
-author("Administrator").
-include("svr_client.hrl").
%% API
-compile(export_all).

route(Cmd) ->
    route_mod(Cmd div 100).

route_mod(900) ->
    test_login;
route_mod(902) ->
    test_scene;
route_mod(903) ->
    test_scene;
route_mod(901) ->
    test_scene;
route_mod(414) ->
    test_guild;
route_mod(426) ->
    test_role_prize;
route_mod(506) ->
    test_shop;
route_mod(531) ->
    test_shop;
route_mod(105) ->
    test_ret;
route_mod(_) ->
    test_default.


cli_monster(CliId) ->
    util:get_ets(?to_ets(CliId), 'monster', []).

role_scene_attr(CliId) ->
    util:get_ets(?to_ets(CliId), 'role_scene_attr', #notify_role_scene_attr{}).
