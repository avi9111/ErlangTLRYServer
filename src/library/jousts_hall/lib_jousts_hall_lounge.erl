%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂
%%% @end
%%% Created : 13. 十一月 2018 19:28
%%%-------------------------------------------------------------------
-module(lib_jousts_hall_lounge).

-include("role.hrl").
-include("scene.hrl").
-include("ret_code.hrl").
-include("jousts_hall.hrl").
-include("title.hrl").
-include("proto/prot_517.hrl").
-include("proto/prot_901.hrl").

%% API
-export([
    start_activity/1,
    stop_activity/0,
    enter/4,
    leave/1,
    info/2,
    swich_stage/2,
    collect_round_res/2,
    get_score/2,
    die_enter/2,
    team_changed/2
]).

-export([
    boss_wait/2,
    boss_refresh/2,
    finish/1
]).

-export([
    change_scene_role_mod_async/1,
    send_roles_to_war/3
]).
%% ===========================data==========================
%% @doc 获取所有玩家数据 dict
get_all_role_data() ->
    case erlang:get(all_role_data) of
        undefined -> dict:new();
        V -> V
    end.

set_all_role_data(Dict) ->
    erlang:put(all_role_data, Dict).

%% @doc 获取玩家数据 #{}
get_role_data(RoleID) ->
    Dict = get_all_role_data(),
    case dict:find(RoleID, Dict) of
        {ok, V} -> V;
        _ -> ?jousts_l_role_data#{id => RoleID}
    end.

%% @doc 设置玩家数据
set_role_data(RoleID, RoleData) ->
    Dict = get_all_role_data(),
    NewDict = dict:store(RoleID, RoleData, Dict),
    set_all_role_data(NewDict).

%% @doc 删除玩家数据
remove_role_data(RoleID) ->
    Dict = get_all_role_data(),
    NewDict = dict:erase(RoleID, Dict),
    set_all_role_data(NewDict).

%% ==================================API=============================

%% ==================================休息室相关==================================
start_activity(State) ->
    Ref = erlang:send_after(?PRAPARE_TIME * 1000, self(), {stage, ?BAT_STAGE_PREPARE}),
    State#jousts_l{ref = Ref, start_battle_time = time:unixtime() + ?PRAPARE_TIME}.

stop_activity() ->
    ok.

enter(RoleID, RoleSid, EnterInfo, State) ->
    #jousts_l{scene_id = SceneID, lines_num = _LinesNum} = State,
    set_role_data(RoleID, EnterInfo),
    Rec = #sc_jousts_hall_enter{},
    {ok, Bin} = prot_msg:encode_msg(51702, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    {ToX, ToY} = lib_scene_api:get_scene_born_pos(SceneID),
    lib_scene_api:change_scene_async(RoleID, SceneID, 0, ToX, ToY),
    State.

%% 玩家死亡or主动进入休息室
die_enter(RoleID, Score) ->
    RoleData = ?jousts_l_role_data#{id => RoleID, score => Score},
    set_role_data(RoleID, RoleData),
    ok.

%% @doc 离开休息室
leave(RoleID) ->
    remove_role_data(RoleID).

info(RoleSid, State) ->
    #jousts_l{war_id = WarID, start_battle_time = Time, is_finish = IsFinish} = State,
    RoleStat =
    if
        IsFinish =:= 1 ->
            2;
        WarID > 0 ->
            1;
        true ->
            0
    end,
    Rec = #sc_jousts_hall_wait_info{is_out = RoleStat, enter_time = Time},
    {ok, Bin} = prot_msg:encode_msg(51711, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

get_score(RoleID, RoleSid) ->
    RoleData = get_role_data(RoleID),
    #{score := Score} = RoleData,
    Rec = #sc_jousts_hall_score{score = Score},
    {ok, Bin} = prot_msg:encode_msg(51718, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 队伍变化
team_changed(RoleID, TeamID) ->
    RoleData = get_role_data(RoleID),
    NewRoleData = RoleData#{team_id => TeamID},
    set_role_data(RoleID, NewRoleData),
    ok.

%% 状态切换
swich_stage(Stage, State) ->
    if
        Stage =:= ?BAT_STAGE_PREPARE ->
            prapare(State, Stage);
        ?REFRESH_MON(Stage) ->
            refresh_mon(State, Stage);
        Stage =:= ?BAT_STAGE_POISON_CIRCLE ->
            refresh_poison(State, Stage);
        Stage =:= ?BAT_STAGE_WAIT ->
            wait(State, Stage);
        Stage =:= ?BAT_STAGE_NEXT ->
            next(State);
        Stage =:= ?BOSS_STAGE_WAIT ->
            boss_wait(State, Stage);
        Stage =:= ?BOSS_STAGE_REFRESH ->
            boss_refresh(State, Stage);
        Stage =:= ?BOSS_STAGE_POISON_CIRCLE ->
            refresh_poison(State, Stage);
        Stage =:= ?BOSS_STAGE_FINISH ->
            finish(State);
        true ->
            State
    end.

%% =====================================前三轮相关======================================
%% @doc 进入战斗场景
%% 仅限于从休息室进入第一轮
prapare(State, CurStage) ->
    AllRoleData = get_all_role_data(),
    set_all_role_data(dict:new()),
    prapare(State, CurStage, AllRoleData).
%% 每一轮进入下一轮调用
prapare(State, CurStage, AllRoleData) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    NewWarID = WarID + 1,
    SceneIDs = conf_jousts_hall_war:get_war_scenes(NewWarID),
    SceneNum = length(SceneIDs),
    send_roles_to_war(AllRoleData, SceneIDs, SceneNum),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    info_to_childs(NewWarID, {prapare, NewWarID, CurStage, StageEndTime}),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{war_id = NewWarID, stage = CurStage, ref = NewRef}.

send_roles_to_war(AllRoleDataT, SceneIDs, SceneNum) ->
    AllRoleData = ?iif(is_list(AllRoleDataT), AllRoleDataT, dict:to_list(AllRoleDataT)),
    %% 组合组队与单人列表
    {Teams, Singles} =
        lists:foldl(fun({_, RoleData} = Data, {TeamAcc, SingleAcc}) ->
            #{team_id := TeamID} = RoleData,
            case TeamID > 0 of
                true ->
                    case lists:keyfind(TeamID, 1, TeamAcc) of
                        {_, Team} ->
                            {lists:keystore(TeamID, 1, TeamAcc, {TeamID, [Data | Team]}), SingleAcc};
                        _ ->
                            {lists:keystore(TeamID, 1, TeamAcc, {TeamID, [Data]}), SingleAcc}
                    end;
                _ ->
                    {TeamAcc, [Data | SingleAcc]}
            end
        end, {[], []}, AllRoleData),
    #{born_pos := BornPos} = conf_jousts_hall_info:get(),
    %% 将所有休息室玩家分别传入各个场景
    split_and_enter_battle(SceneNum, Teams, SceneIDs, BornPos),
    split_and_enter_battle(SceneNum, Singles, SceneIDs, BornPos).

refresh_mon(State, CurStage) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    WorldLv = util_svr:get_world_lv(),
    #{mon_id := MTypeID} = conf_jousts_hall:get(WorldLv),
    #{mon_pos := MonPos} = conf_jousts_hall_info:get(),
    %% 在指定场景刷怪
    lists:foreach(fun(SceneID) ->
        lists:foreach(fun({X, Y}) ->
            Args = [{xy, {X, Y}}],
            lib_scene_api:create_mon_async(MTypeID, SceneID, 1, Args)
        end, MonPos)
    end, SceneIDs),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    notify_stage_change(SceneIDs, CurStage, StageEndTime, WarID),
    CurStage =:= ?BAT_STAGE_REFRESH_ONE andalso change_scene_role_mod(SceneIDs, ?MODE_GUILD),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{stage = CurStage, ref = NewRef}.

%% 此函数适用于四轮战场
refresh_poison(State, CurStage) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    notify_stage_change(SceneIDs, CurStage, StageEndTime, WarID),
    info_to_childs(SceneIDs, poison_begin),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{stage = CurStage, ref = NewRef}.

wait(State, CurStage) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    notify_stage_change(SceneIDs, CurStage, StageEndTime, WarID),
    change_scene_role_mod(SceneIDs, ?MODE_PEACE),
    info_to_childs(SceneIDs, poison_end),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{stage = CurStage, ref = NewRef}.

next(State) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    info_to_childs(SceneIDs, enter_next_war),
    State#jousts_l{ref = undefined}.

collect_round_res(RoleList, State) ->
    #jousts_l{round_res = RoundRes, round_times = Times, war_id = WarID} = State,
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    SceneNum = length(SceneIDs),
    NewTimes = Times + 1,
    NewRonudRes = RoundRes ++ RoleList,
    CurStage = ?iif(WarID =:= ?ROUND_THREE, ?BOSS_STAGE_PREPARE, ?BAT_STAGE_PREPARE),
    case NewTimes >= SceneNum of
        true ->
            prapare(State#jousts_l{round_res = [], round_times = 0}, CurStage, NewRonudRes);
        _ ->
            State#jousts_l{round_res = NewRonudRes, round_times = NewTimes}
    end.

%% ==========================第四轮相关===============================
boss_wait(State, CurStage) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    notify_stage_change(SceneIDs, CurStage, StageEndTime, WarID),
    change_scene_role_mod(SceneIDs, ?MODE_GUILD),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{stage = CurStage, ref = NewRef}.

boss_refresh(State, CurStage) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    WorldLv = util_svr:get_world_lv(),
    #{boss_id := MTypeID} = conf_jousts_hall:get(WorldLv),
    #{boss_pos := BossPos} = conf_jousts_hall_info:get(),
    {X, Y} = BossPos,
    lists:foreach(fun(SceneID) ->
        Args = [{xy, {X, Y}}],
        lib_scene_api:create_mon_async(MTypeID, SceneID, 1, Args)
    end, SceneIDs),
    {StageTime, StageEndTime} = get_stage_time(CurStage),
    %% 通知指定场景玩家流程变化
    notify_stage_change(SceneIDs, CurStage, StageEndTime, WarID),
    info_to_childs(SceneIDs, {refresh_boss, MTypeID}),
    NewRef = make_new_ref(CurStage, StageTime),
    State#jousts_l{stage = CurStage, ref = NewRef}.

finish(State) ->
    #jousts_l{war_id = WarID, ref = Ref} = State,
    util:cancel_timer(Ref),
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    info_to_childs(SceneIDs, finish),
    State#jousts_l{is_finish = 1}.

%% ==========================private=================================

split_and_enter_battle(_, [], _, _) -> ok;
split_and_enter_battle(SceneNum, List, SceneIDs, BornPos) ->
    {SplitList, Rest} = util:rand_split_list(SceneNum, List),
    split_and_enter_battle_helper(SplitList, SceneIDs, BornPos),
    split_and_enter_battle(SceneNum, Rest, SceneIDs, BornPos).

split_and_enter_battle_helper([], _, _) -> ok;
split_and_enter_battle_helper(_, [], _) -> ok;
%% 组队情况
split_and_enter_battle_helper([{_, RoleList} | T], [SceneID | Left], BornPos) when is_list(RoleList) ->
    {X, Y} = util:list_rand(BornPos),
    lists:foreach(fun({RoleID, RoleData}) ->
        Options = header_opt(RoleData),
        lib_scene_api:change_scene_async(RoleID, SceneID, 1, X, Y, Options),
        svr_jousts_hall_battle:enter(SceneID, RoleID, RoleData)
    end, RoleList),
    split_and_enter_battle_helper(T, Left, BornPos);
%% 单人情况
split_and_enter_battle_helper([{RoleID, RoleData} | T], [SceneID | Left], BornPos) ->
    Options = header_opt(RoleData),
    {X, Y} = util:list_rand(BornPos),
    lib_scene_api:change_scene_async(RoleID, SceneID, 1, X, Y, Options),
    svr_jousts_hall_battle:enter(SceneID, RoleID, RoleData),
    split_and_enter_battle_helper(T, Left, BornPos).

header_opt(RoleData) ->
    #{score := Score} = RoleData,
    [{header, ?HEADER(?TITLE_ID_JOUSTS, max(40, Score))}, {full_hpmp, 0}].

%% 给指定的进程发消息
info_to_childs(WarID, Info) when is_integer(WarID) ->
    SceneIDs = conf_jousts_hall_war:get_war_scenes(WarID),
    info_to_childs(SceneIDs, Info);
info_to_childs(SceneIDs, Info) ->
    sup_jousts_hall_battle:info_select_children(Info, SceneIDs),
    ok.

notify_stage_change(SceneIDs, Stage, StageEndTime, WarID) ->
    Rec = #sc_jousts_hall_stage_change{war_id = WarID, stage = Stage, end_time = StageEndTime, is_new_war = 0},
    {ok, Bin} = prot_msg:encode_msg(51716, Rec),
    lists:foreach(fun(SceneID) ->
        lib_scene_api:send_to_scene(SceneID, 1, Bin)
    end, SceneIDs).

get_stage_time(Stage) ->
    #{stage := NorStage} = conf_jousts_hall_info:get(),
    StageTime = util:prop_get_value(Stage, NorStage),
    StageEndTime = time:unixtime() + StageTime,
    {StageTime, StageEndTime}.

make_new_ref(Stage, StageTime) ->
    NextStage = Stage + 1,
    erlang:send_after(StageTime * 1000, self(), {stage, NextStage}).

change_scene_role_mod(SceneIds, Mode) ->
    [svr_scene_agent:apply_cast(SceneId, 1, ?MODULE, change_scene_role_mod_async, [Mode]) || SceneId <- SceneIds].

%% @doc 场景进程逻辑 改变场景内所有玩家攻击模式
change_scene_role_mod_async(Mode) ->
    RoleIds = lib_scene_agent:get_scene_roler_ids(),
    [lib_scene_cmd:handle_cmd('change_scene_mode', {RoleId, Mode}) || RoleId <- RoleIds],
    MsgRecord = #change_scene_mode_resp{scene_mode = Mode},
    {ok, Bin} = prot_msg:encode_msg(90113, MsgRecord),
    lib_scene_agent:send_to_scene_role(RoleIds, Bin),
    ok.
