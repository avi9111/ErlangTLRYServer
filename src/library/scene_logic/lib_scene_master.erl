%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     武林盟主 [挑战场景]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_scene_master).
-author("Ryuu").

-include("scene.hrl").

%% API
-export([
    init/1,
    mon_die/2,
    timeout/0,
    role_die/2,
    role_enter/2,
    role_leave/2
]).

%% @doc 初始化
%%init(?SCENE_ID_MASTER_CHAP) ->
%%    RoundTime = config:get_sys_config(arena_round_time) * 1000,
%%    Timer = erlang:send_after(RoundTime, self(), end_master_chap),
%%    erlang:put({?MODULE, timer}, Timer);
init(_) ->
    ignore.

%% @doc 玩家进入 ...
role_enter(?SCENE_ID_MASTER_CHAP, RoleID) ->
    RoundTime = config:get_sys_config(master_chap_time) * 1000,
    Timer = erlang:send_after(RoundTime, self(), end_master_chap),
    erlang:put({?MODULE, timer}, Timer),
    erlang:put({?MODULE, role_id}, RoleID);
role_enter(_, _RoleID) ->
    ignore.

%% @doc 玩家死亡
role_die(?SCENE_ID_MASTER_CHAP, _RoleID) ->
    battle_end(role_die);
role_die(_, _RoleID) ->
    ignore.

%% @doc 玩家离开
role_leave(?SCENE_ID_MASTER_CHAP, _RoleID) ->
    battle_end(role_leave);
role_leave(_, _RoleID) ->
    ignore.

%% @doc 怪物死亡
mon_die(?SCENE_ID_MASTER_CHAP, MonID) ->
    conf_master:is_master(MonID) andalso battle_end(mon_die);
mon_die(_, _MonID) ->
    ignore.

%% @doc 超时
timeout() ->
    battle_end(timeout).

%% @doc 退出, 超时, Boss 死亡
battle_end(Result) ->
    case erlang:get({?MODULE, battle_end}) of
        true ->
            ignore;
        _ ->
            handle_result(Result)
    end.

handle_result(_Result) ->
    erlang:put({?MODULE, battle_end}, true),
    case lib_scene_agent:get_scene_roler_ids() of
        [RoleID] ->
            Harm = lib_obj_role:get_total_harm(RoleID),
            svr_master:chap_result(RoleID, Harm),
            svr_scene_mgr:close_line(?SCENE_ID, ?LINE_ID),
            util:cancel_timer(erlang:erase({?MODULE, timer})),
            ok;
        _ ->
            ignore
    end.
