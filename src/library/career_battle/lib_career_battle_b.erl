%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[战斗]
%%% @end
%%% Created : 31. 十月 2018 11:29
%%%-------------------------------------------------------------------
-module(lib_career_battle_b).

-include("career_battle.hrl").
-include("common.hrl").
-include("ets_defines.hrl").
-include("proto/prot_512.hrl").
-include("op_type.hrl").

%% API
-export([
    init/1,
    hurt_role/2,
    kill_role/1,
    battle_end/0,
    leave/2
]).

%% 初始化
init([RoomID, SceneID, Roles, LRoomID]) ->
    #{battle_time := BattleTime} = conf_career_battle_info:get(),
    Now = time:unixtime(),
    Opt = [{full_hpmp, 0}],
    Data =
        lists:foldl(fun({RoleID, {X, Y}}, Acc) ->
            lib_scene_api:change_scene_async(RoleID, SceneID, RoomID, X, Y, Opt),
            Rec = #sc_career_battle_enter_bat{battle_end = Now + BattleTime},
            {ok, Bin} = prot_msg:encode_msg(51215, Rec),
            lib_role_send:send_to_role(RoleID, Bin),
            [{RoleID, 0} | Acc]
        end, [], Roles),
    [lib_role:mod_info(RoleID, lib_role_career_battle, 'set_battle_flag') || {RoleID, _} <- Roles],
    set_battle_data(Data),
    set_bat_room_id(RoomID, LRoomID),
    set_bat_flag(0),
    ok.

%% 自然结束
battle_end() ->
    [{RoleIDA, HurtA}, {RoleIDB, HurtB}] = get_battle_data(),
    {WinRoleID, LoseRoleID} = ?iif(HurtA > HurtB, {RoleIDA, RoleIDB}, {RoleIDB, RoleIDA}),
    battle_end_handle(WinRoleID, LoseRoleID, ?WAY_BY_END).

%% 玩家输出
hurt_role(RoleID, Hurt) ->
    case get_bat_flag() of
        0 ->
            Data = get_battle_data(),
            OldHurt = util:prop_get_value(RoleID, Data),
            NewHurt = OldHurt + Hurt,
            NewData = lists:keystore(RoleID, 1, Data, {RoleID, NewHurt}),
            set_battle_data(NewData),
            broad_hurt(RoleID, Data, false),
            ok;
        _ ->
            skip
    end.


%% 玩家被击杀
kill_role(WinRoleID) ->
    case get_bat_flag() of
        0 ->
            Data = get_battle_data(),
            {value, {_, _}, [{LoseRoleID, _}]} = lists:keytake(WinRoleID, 1, Data),
            battle_end_handle(WinRoleID, LoseRoleID, ?WAY_BY_END);
        _ ->
            skip
    end.


%% 玩家主动离开
leave(LoseRoleID, Type) ->
    case get_bat_flag() of
        0 ->
            Data = get_battle_data(),
            {value, {_, _}, [{WinRoleID, _}]} = lists:keytake(LoseRoleID, 1, Data),
            battle_end_handle(WinRoleID, LoseRoleID, Type);
        _ ->
            skip
    end.

battle_end_handle(WinRoleID, LoseRoleID, LeaveType) ->
    battle_res(?BATTLE_WIN, WinRoleID, LoseRoleID, LeaveType),
    battle_res(?BATTLE_LOSE, LoseRoleID, WinRoleID, LeaveType),
    {BatRoomID, LRoomID} = get_bat_room_id(),
    BSceneID = lib_role_career_battle:battle_scene(),
    set_bat_flag(1),
    %% 战斗结束 倒计时10秒清理场景
    erlang:spawn(
        fun() ->
            timer:sleep(10000),
            erlang:erase({?MODULE, data}),
            SceneID = lib_role_career_battle:wait_scene(),
            {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
            Opt = [{full_hpmp, 0}],
            lib_scene_api:change_scene_async(WinRoleID, SceneID, LRoomID, X, Y, Opt),
            ?iif(LeaveType =:= ?WAY_BY_END, lib_scene_api:change_scene_async(LoseRoleID, SceneID, LRoomID, X, Y, Opt), skip),
            svr_scene_mgr:close_line(BSceneID, BatRoomID),
            sup_career_battle_bat:stop_child(svr_career_battle_bat:p(BatRoomID)),
            util:put_ets(?ETS_CAREER_BATTLE_U, LRoomID, 1)
        end
    ).

%% 战斗结束
battle_res(?BATTLE_WIN, WinRoleID, LoseRoleID, _Leave) ->
    RoleData = util:get_ets(?ETS_CAREER_BATTLE, WinRoleID),
    #career_battle_role{fight = DeferFight, last_win_times = DeferLastWin} = util:get_ets(?ETS_CAREER_BATTLE, LoseRoleID),
    #career_battle_role{
        score = OldScore,
        fight = Fight,
        battle_times = BattleTimes,
        last_win_times = LastWinTimes,
        grade = Grade
    } = RoleData,
    #{battle_reward := BattleReward} = conf_career_battle_info:get(),
    %% 胜利奖励
    {{WinAddScore, WinDropID}, _} = util:prop_get_value(Grade, BattleReward, {{0, 0}, {0, 0}}),
    %% 已弱胜强积分
    AddExtraScore = conf_career_battle_score:get(Grade, DeferFight / Fight * 100),
    NewLastWinTimes = LastWinTimes + 1,
    %% 连胜积分
    #{get_score := GetScore} = conf_career_battle_win:get(Grade, NewLastWinTimes),
    %% 打断对方连胜积分
    #{defend_get_score := DefendGetScore} = conf_career_battle_win:get(Grade, NewLastWinTimes),
    TotalAddScore = WinAddScore + AddExtraScore + GetScore + DefendGetScore,
    NewScore = OldScore + TotalAddScore,
    NewBattleTimes = BattleTimes + 1,
%%    lib_role:mod_info(WinRoleID, lib_role_guild_question, {battle_drop, WinDropID}),
    lib_drop_api:give_drop_asyn(WinRoleID, WinDropID, ?OPT_CAREER_BATTLE),
    NewRoleData = RoleData#career_battle_role{
        score = NewScore,
        battle_times = NewBattleTimes,
        last_win_times = NewLastWinTimes,
        time = time:unixtime()
    },
    util:put_ets(?ETS_CAREER_BATTLE, WinRoleID, NewRoleData),
    Rec = #sc_career_battle_bat_end{
        res = ?BATTLE_WIN,
        last_win_times = NewLastWinTimes,
        defend_last_win = DeferLastWin,
        extra_score = AddExtraScore,
        leave_time = time:unixtime() + 10
    },
    {ok, Bin} = prot_msg:encode_msg(51217, Rec),
    lib_role_send:send_to_role(WinRoleID, Bin),
    ?TASK_EVENT(WinRoleID, {'career_battle_win', NewLastWinTimes}),
    ok;
battle_res(?BATTLE_LOSE, LoseRoleID, _WinRoleID, ?WAY_BY_END) ->
    RoleData = util:get_ets(?ETS_CAREER_BATTLE, LoseRoleID),
    #career_battle_role{
        score = OldScore,
        battle_times = BattleTimes,
        grade = Grade
    } = RoleData,
    #{battle_reward := BattleReward} = conf_career_battle_info:get(),
    %% 失败奖励
    {_, {LoseAddScore, LoseDropID}} = util:prop_get_value(Grade, BattleReward, {{0, 0}, {0, 0}}),
    NewScore = OldScore + LoseAddScore,
    NewBattleTimes = BattleTimes + 1,
%%    lib_role:mod_info(LoseRoleID, lib_role_guild_question, {battle_drop, LoseDropID}),
    lib_drop_api:give_drop_asyn(LoseRoleID, LoseDropID, ?OPT_CAREER_BATTLE),
    NewRoleData = RoleData#career_battle_role{
        score = NewScore,
        battle_times = NewBattleTimes,
        last_win_times = 0,
        time = time:unixtime()
    },
    util:put_ets(?ETS_CAREER_BATTLE, LoseRoleID, NewRoleData),
    Rec = #sc_career_battle_bat_end{
        res = ?BATTLE_LOSE,
        last_win_times = 0,
        defend_last_win = 0,
        extra_score = 0,
        leave_time = time:unixtime() + 10
    },
    {ok, Bin} = prot_msg:encode_msg(51217, Rec),
    lib_role_send:send_to_role(LoseRoleID, Bin),
    ok;
battle_res(?BATTLE_LOSE, LoseRoleID, _WinRoleID, ?WAY_BY_LEAVE) ->
    Rec = #sc_career_battle_bat_end{
        res = ?BATTLE_LOSE,
        last_win_times = 0,
        defend_last_win = 0,
        extra_score = 0,
        leave_time = time:unixtime()
    },
    {ok, Bin} = prot_msg:encode_msg(51217, Rec),
    lib_role_send:send_to_role(LoseRoleID, Bin),
    SceneID = lib_role_career_battle:wait_scene(),
    {X, Y} = lib_scene_api:get_scene_born_pos(SceneID),
    {_, LRoomID} = get_bat_room_id(),
    lib_scene_api:change_scene_async(LoseRoleID, SceneID, LRoomID, X, Y),
    ok;
battle_res(?BATTLE_LOSE, _, _, _) ->
    ok.

%% 广播玩家的伤害
%% @doc
broad_hurt(RoleID, Data, Instance) ->
    Fun = fun() ->
        {value, {_, Hurt}, [{OtherID, DeferHurt}]} = lists:keytake(RoleID, 1, Data),
        Rec = #sc_career_battle_update_hurt{
            hurt = Hurt,
            defer_hurt = DeferHurt
        },
        {ok, Bin} = prot_msg:encode_msg(51216, Rec),
        lib_role_send:send_to_role(RoleID, Bin),
        Rec2 = #sc_career_battle_update_hurt{
            hurt = DeferHurt,
            defer_hurt = Hurt
        },
        {ok, Bin2} = prot_msg:encode_msg(51216, Rec2),
        lib_role_send:send_to_role(OtherID, Bin2)
    end,
    action_limit(RoleID, 0.25, Fun, Instance).

action_limit(Key, Span, Fun, Instance) ->
    Now = time:unixtime(),
    case erlang:get({action_limit, Key}) of
        Time when (is_integer(Time) andalso Now - Time < Span) andalso not Instance ->
            ignore;
        _ ->
            erlang:put({action_limit, Key}, Now),
            Fun()
    end.

set_battle_data(Data) ->
    erlang:put({?MODULE, data}, Data).

get_battle_data() ->
    erlang:get({?MODULE, data}).

set_bat_room_id(RoomID, LRoomID) ->
    erlang:put({?MODULE, id}, {RoomID, LRoomID}).

get_bat_room_id() ->
    erlang:get({?MODULE, id}).

set_bat_flag(Flag) ->
    erlang:put({?MODULE, flag}, Flag).

get_bat_flag() ->
    erlang:get({?MODULE, flag}).
