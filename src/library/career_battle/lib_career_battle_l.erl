%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[休息室]
%%% @end
%%% Created : 31. 十月 2018 11:29
%%%-------------------------------------------------------------------
-module(lib_career_battle_l).

-include("ret_code.hrl").
-include("career_battle.hrl").
-include("ets_defines.hrl").
-include("proto/prot_512.hrl").
-include("op_type.hrl").
-include("common.hrl").

%% API
-export([
    enter/2,
    lounge_info/3,
    match/1
]).

enter(EnterInfo, #career_battle{room_id = RoomID}) ->
    #career_battle_role{id = RoleID} = EnterInfo,
    case util:get_ets(?ETS_CAREER_BATTLE, RoleID) of
        undefined ->
            update_role_data(RoleID, RoomID, EnterInfo);
        _ ->
            skip
    end,
    ok.

lounge_info(RoleID, RoleSid, State) ->
    RoleData = get_role_data(RoleID),
    #career_battle_role{
        battle_times = Times,
        score = Score,
        last_win_times = LastWinTimes,
        reward = RewardList
    } = RoleData,
    #{max_battle_times := MaxBattleTimes} = conf_career_battle_info:get(),
    Rec = #sc_career_battle_lounge_info{
        match_time = State#career_battle.match_time,
        score = Score,
        battle_times = Times,
        leave_times = MaxBattleTimes - Times,
        last_win_times = LastWinTimes,
        reward_list = RewardList
    },
    {ok, Bin} = prot_msg:encode_msg(51212, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

match(State) ->
    #career_battle{auto_id = AutoID, online = Online, bat_base_id = BaseID, room_id = LRoomID} = State,
    RoleList = sets:to_list(Online),
    #{max_battle_times := MaxTimes} = conf_career_battle_info:get(),
    RoleDataList =
    lists:foldl(fun(RoleID, Acc) ->
        RoleData = get_role_data(RoleID),
        case RoleData#career_battle_role.battle_times < MaxTimes of
            true ->
                [RoleData | Acc];
            _ ->
                Acc
        end
    end, [], RoleList),
    SortList = lib_role_career_battle:sort_rank(RoleDataList),
    Roles = [Data#career_battle_role.id || Data <- SortList],
    {NewAutoID, LeftRoles} = match_room(Roles, AutoID, BaseID, LRoomID),
    lists:foreach(fun(RoleID) ->
        air_round(RoleID, LRoomID)
    end, LeftRoles),
    {ok, State#career_battle{auto_id = NewAutoID}}.


match_room(RoleList, AutoID, BaseID, LRoomID) ->
    case RoleList =/= [] andalso length(RoleList) >= 2 of
        true ->
            {SplitList, Rest} = util:split_list(2, RoleList),
            NewAutoID = AutoID + 1,
            RoomID = BaseID + NewAutoID,
            start_room(RoomID, SplitList, LRoomID),
            match_room(Rest, NewAutoID, BaseID, LRoomID);
        _ ->
            {AutoID, RoleList}
    end.

start_room(RoomID, [RoleIDR, RoleIDB], LRoomID) ->
    SceneID = lib_role_career_battle:battle_scene(),
    svr_scene_mgr:add_scene_line_asyn(SceneID, RoomID),
    Roles = [{RoleIDR, born_pos(?CAMP_RED)}, {RoleIDB, born_pos(?CAMP_BLUE)}],
    sup_career_battle_bat:start_child([RoomID, SceneID, Roles, LRoomID]),
    ok.

%% 轮空处理
air_round(WinRoleID, LRoomID) ->
    RoleData = util:get_ets(?ETS_CAREER_BATTLE, WinRoleID),
    #career_battle_role{
        score = OldScore,
        battle_times = BattleTimes,
        last_win_times = LastWinTimes,
        grade = Grade
    } = RoleData,
    #{battle_reward := BattleReward} = conf_career_battle_info:get(),
    %% 胜利奖励
    {{WinAddScore, WinDropID}, _} = util:prop_get_value(Grade, BattleReward, {{0,0},{0,0}}),
    NewLastWinTimes = LastWinTimes + 1,
    %% 连胜积分
    #{get_score := GetScore} = conf_career_battle_win:get(Grade, NewLastWinTimes),
    TotalAddScore = WinAddScore + GetScore,
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
        defend_last_win = 0,
        extra_score = 0
    },
    {ok, Bin} = prot_msg:encode_msg(51217, Rec),
    lib_role_send:send_to_role(WinRoleID, Bin),
    ?TASK_EVENT(WinRoleID, {'career_battle_win', NewLastWinTimes}),
    util:put_ets(?ETS_CAREER_BATTLE_U, LRoomID, 1),
    ok.
%% ================================================

%% ================================================
%% @doc role data
get_role_data(RoleID) ->
    case util:get_ets(?ETS_CAREER_BATTLE, RoleID) of
        RoleData when is_record(RoleData, career_battle_role) -> RoleData;
        _ -> #career_battle_role{id = RoleID}
    end.

set_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_CAREER_BATTLE, RoleID, RoleData).

update_role_data(RoleID, RoomID, RoleData) ->
    util:put_ets(?ETS_CAREER_BATTLE_U, RoomID, 1),
    set_role_data(RoleID, RoleData).

born_pos(?CAMP_RED) ->
    config:get_sys_config(career_battle_born_pos_red);
born_pos(?CAMP_BLUE) ->
    config:get_sys_config(career_battle_born_pos_blue).