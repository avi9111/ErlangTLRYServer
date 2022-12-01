%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     马贼任务
%%% @end
%%% Created : 18. 十月 2018 14:54
%%%-------------------------------------------------------------------
-module(lib_role_daily_thief).

-include("role.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("team.hrl").
-include("vow.hrl").
-include("proto/prot_510.hrl").

-record(thief, {
    daily_times = 0,
    exp_time = 0,
    roraty_time = 0,
    get_times = 0,      %% 马贼宝箱奖励领取次数
    last_check = 0,
    index = 0,          %% 奇遇转盘选择ID
    list = [],          %% 可抽取奖励
    updated = false,

    times = 0,
    scene_id = 0,
    line_pid = 0,
    x = 0,
    y = 0,
    state = 0,
    target_id = 0,      %% 当state为2时，发送马贼怪物ID
    npc_id = 0
}).

-define(THIEF_STATE_NOT, 0).      %% 未接任务
-define(THIEF_STATE_ONGOING, 1).  %% 进行中
-define(THIEF_STATE_CREATE, 2).   %% 已召出马贼
-define(THIEF_STATE_FINISH, 3).   %% 此轮结束

%% API
-export([
    do/3,
    event/2,
    handle_info/2,
    init/1,
    info/1,
    get_task/1,
    near/1,
    exp_adventure/1,
    roraty_adventure/1,
    cross_day/1,
    save/1,
    check_role_limit/2,
    kill_mon/2,
    get_daily_times/0
]).

do(51001, PS, _Req) ->
    info(PS);
do(51003, PS, _Req) ->
    get_task(PS);
do(51005, PS, _Req) ->
    near(PS);
do(51009, PS, _Req) ->
    exp_adventure(PS);
do(51011, PS, _Req) ->
    roraty_adventure(PS);
do(51013, PS, _Req) ->
    cancel_task(PS);
do(51016, PS, _Req) ->
    handle_task(PS);
do(51020, PS, _Req) ->
    get_roraty_adventure(PS);
do(51022, PS, _Req) ->
    get_exp_adventure(PS);
do(_, _, _) ->
    skip.

event(PS, 'team_changed') ->
    team_changed(PS);
event(_, _) ->
    skip.

%% @doc 杀死马贼
handle_info(all_member_kill_thief, PS) ->
    all_member_kill_thief(PS);
%% @doc 队长触发奇遇
handle_info({leader_adventure_event, LvConf}, PS) ->
    leader_adventure_event(PS, LvConf);
%% @doc 队员触发转盘奇遇(可能)
handle_info({team_member_roraty_adventure, RoratyTime}, PS) ->
    team_member_roraty_adventure(PS, RoratyTime);
%% @doc 所有人触发经验奇遇(可能)
handle_info({all_member_exp_adventure, ExpTime}, PS) ->
    all_member_exp_adventure(PS, ExpTime);
%% @doc 离开场景处理
handle_info({leave_scene, SceneId}, PS) ->
    leave_scene(PS, SceneId);
handle_info({'thief_kill_mon', MID}, PS) ->
    maybe_kill_thief(PS, MID);
handle_info(_, _) ->
    skip.

kill_mon(RoleID, MID) ->
    lib_role:mod_info(RoleID, lib_role_daily_thief, {'thief_kill_mon', MID}).

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_db_data(RoleID),
    #thief{last_check = LastCheck} = RoleData,
    RoleDataN =
        case time:is_today(LastCheck) of
            true ->
                RoleData;
            _ ->
                RoleData#thief{daily_times = 0, last_check = time:unixtime(), get_times = 0, updated = true}
        end,
    set_role_data(RoleID, RoleDataN).

%% @doc 信息
info(#role_state{sid = RoleSid, team_id = TeamID}) ->
    RoleData = get_role_data(TeamID),
    send_info(RoleSid, RoleData).

send_info(RoleSid, RoleData) ->
    #thief{
        times = Times,
        daily_times = DailyTimes,
        scene_id = SceneID,
        x = X,
        y = Y,
        state = State,
        exp_time = ExpTime,
        roraty_time = RoratyTime,
        target_id = TargetID,
        npc_id = NpcID,
        index = Index,
        list = IDList
    } = RoleData,
    MsgRecord = #sc_daily_thief_info{
        times = Times,
        daily_times = DailyTimes,
        scene_id = SceneID,
        x = X,
        y = Y,
        state = State,
        exp_time = ExpTime,
        roraty_time = RoratyTime,
        target_id = TargetID,
        npc_id = NpcID,
        index = Index,
        roraty_list = handle_id_list(IDList)
    },
    {ok, Bin} = prot_msg:encode_msg(51002, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 接任务
get_task(PS) ->
    case catch check_get_task(PS) of
        ok ->
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_get_task(PS) ->
    #role_state{id = RoleID, level = Lv, team_id = TeamID, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = LineID, x = X, y = Y} = RoleScene,
    is_func_open(Lv) orelse erlang:throw({error, ?RC_THIEF_FUNC_NOT_OPEN}),
    #{open_lv := OpenLv, team_min_role := MinRole} = conf_daily_thief:get(),
    TeamID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_TEAM}),
    #{leader := Leader, members := Members, mem_num := MenNum, robots := Robots} = lib_team:get_team_info(TeamID),
    Robots =:= [] orelse erlang:throw({error, ?RC_TEAM_HAVE_ROBOTS}),
    MenNum >= MinRole orelse erlang:throw({error, ?RC_TEAM_MEN_NUM_NOT_ENOUGH}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    check_member_status(lists:delete(RoleID, Members), OpenLv),
    lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),
    RoleData = get_role_data(TeamID),
    #thief{state = State} = RoleData,
    State =:= ?THIEF_STATE_NOT orelse erlang:throw({error, ?RC_THIEF_HAVE_TASK}),
    StateN = ?THIEF_STATE_ONGOING,
    MinLv = get_team_min_lv(Members),
    #{npc_pos := PosList} = conf_daily_thief:get(),
    List = util:get_zone_config(PosList, MinLv),
    NpcID = util:list_rand(List),
    MsgRecord = #sc_daily_thief_get{
        npc_id = NpcID,
        state = StateN
    },
    {ok, Bin} = prot_msg:encode_msg(51004, MsgRecord),
    lib_team:broadcast(TeamID, Bin),
    ThiefData = #{state => StateN, npc_id => NpcID},
    leader_sync_thief_data(TeamID, ThiefData),
    ok.

check_member_status([], _) -> ok;
check_member_status([RoleID | T], Lv) ->
    case catch lib_role:apply_call3(RoleID, {?MODULE, check_role_limit, [Lv]}) of
        ok ->
            check_member_status(T, Lv);
        {error, Code} ->
            erlang:throw({error, Code})
    end.

check_role_limit(PS, NeedLv) ->
    catch check_role_limit2(PS, NeedLv).

check_role_limit2(PS, NeedLv) ->
    #role_state{level = Lv} = PS,
    Lv >= NeedLv orelse erlang:throw({error, ?RC_THIEF_MEMBER_LV_NOT_ENOUGH}),
    ok.

%% 创建马贼
near(PS) ->
    case catch check_near(PS) of
        ok ->
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_near(PS) ->
    #role_state{id = RoleID, role_scene = RoleScene, level = Lv, name = Name, team_id = TeamID} = PS,
    is_func_open(Lv) orelse erlang:throw({error, ?RC_THIEF_FUNC_NOT_OPEN}),
    TeamID > 0 orelse erlang:throw({error, ?RC_CHAT_NOT_IN_TEAM}),
    #{leader := Leader, members := Members} = lib_team:get_team_info(TeamID),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    #role_scene{scene_id = SceneID, line_id = LineID, line_pid = LinePid} = RoleScene,
    RoleData = get_role_data(TeamID),
    #thief{state = State, npc_id = NpcID} = RoleData,
    {_, X, Y} = lib_scene_api:get_npc_pos(NpcID),
%%    lib_scene_api:is_nearby_npc(RoleScene, NpcID) orelse erlang:throw({error, ?RC_DUNG_FAR_FROM_NPC}),
    lib_scene_api:is_team_near(Members, SceneID, LineID, X, Y) orelse erlang:throw({error, ?RC_TREASURE_MAP_TEAM_NOT_TOGHER}),
    State =:= ?THIEF_STATE_ONGOING orelse erlang:throw({error, ?RC_THIEF_FIRST_GET_TASK}),
    AvgLv = get_team_avg_lv(Members),
    #{thief_mon_id := ThiefMIdList} = conf_daily_thief_by_lv:get(AvgLv),
    MonID = util:list_rand(ThiefMIdList),
    Args = [{xy, {X, Y}}, {owner, #{id => RoleID, name => Name, team => TeamID}}],
    MID = lib_scene_api:create_mon(MonID, LinePid, Args),
    StateN = ?THIEF_STATE_CREATE,
    ThiefData = #{state => StateN, line_pid => LinePid, target_id => MID, scene_id => SceneID, x => X, y => Y},
    leader_sync_thief_data(TeamID, ThiefData),
    MsgRecord = #sc_daily_thief_near{state = StateN, target_id = MID},
    {ok, Bin} = prot_msg:encode_msg(51006, MsgRecord),
    lib_team:broadcast(TeamID, Bin),
    ok.

%% 杀死马贼
maybe_kill_thief(PS, MonID) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    ThiefMonList = config:get_sys_config(daily_thief_id_list),
    AdvenMonList = config:get_sys_config(daily_thief_adventure_list),
    IsThiefMon = lists:member(MonID, ThiefMonList),
    IsAdvenMon = lists:member(MonID, AdvenMonList),
    TeamInfo = lib_team:get_team_info(TeamID),
    Leader = ?iif(is_map(TeamInfo), maps:get(leader, TeamInfo, 0), 0),
    if
        IsThiefMon andalso is_map(TeamInfo) andalso RoleID =:= Leader ->
            kill_thief(PS);
        IsAdvenMon andalso is_map(TeamInfo) andalso RoleID =:= Leader ->
            kill_adven_mon(PS);
        true ->
            skip
    end.

kill_thief(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    RoleData = get_role_data(TeamID),
    #thief{times = Times, npc_id = NpcID} = RoleData,
    Conf = conf_daily_thief:get(),
    #{one_round_times := RoundTimes} = Conf,
    #{members := Members, leader := Leader} = lib_team:get_team_info(TeamID),
    MinLv = get_team_min_lv(Members),
    LvConf = conf_daily_thief_by_lv:get(MinLv),
    NewTimes = Times + 1,
    StateN = ?iif(NewTimes >= RoundTimes, ?THIEF_STATE_FINISH, ?THIEF_STATE_ONGOING),
    ThiefData = #{state => StateN, times => NewTimes},
    leader_sync_thief_data(TeamID, ThiefData),
    lib_team:mod_info(TeamID, ?MODULE, 'all_member_kill_thief'),
    case RoleID =:= Leader of
        true ->
            leader_adventure_event(PS, LvConf);
        _ ->
            lib_role:mod_info(Leader, ?MODULE, {'leader_adventure_event', LvConf})
    end,
    %% 自动接取下一次任务
    case StateN =:= ?THIEF_STATE_ONGOING of
        true ->
            #{npc_pos := PosList} = conf_daily_thief:get(),
            List = util:get_zone_config(PosList, MinLv),
            NewNpcID = util:list_rand(lists:delete(NpcID, List)),
            ThiefData2 = #{npc_id => NewNpcID},
            leader_sync_thief_data(TeamID, ThiefData2),
            MsgRecord = #sc_daily_thief_get{
                npc_id = NewNpcID,
                state = StateN
            },
            {ok, Bin} = prot_msg:encode_msg(51004, MsgRecord),
            lib_team:broadcast(TeamID, Bin);
        _ ->
            %% 配置表出问题 先写死
            BoxTimes = lib_role_kv:get_kv(RoleID, ?KEY_DAILY_THIEF_LEADER_REWARD, 0),
            BoxTimes =:= 0 andalso begin
                lib_drop_api:give_drop_asyn(RoleID, 340001, ?OPT_DAILY_THIEF),
                lib_role_kv:set_kv(RoleID, ?KEY_DAILY_THIEF_LEADER_REWARD, 1)
            end,
            MsgRecord = #sc_daily_thief_get{state = StateN},
            {ok, Bin} = prot_msg:encode_msg(51004, MsgRecord),
            lib_team:broadcast(TeamID, Bin)
    end,
    ok.

%% 击杀马贼事件
all_member_kill_thief(PS) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene, team_id = TeamID, level = Lv} = PS,
    #role_scene{line_pid = LinePid, x = X, y = Y} = RoleScene,
    RoleData = get_role_data(TeamID),
    TeamInfo = lib_team:get_team_info(TeamID),
    IsLeader = case TeamInfo of
        #{leader := Leader} when Leader =:= RoleID -> true;
        _ -> false
    end,
    #thief{daily_times = DailyTimes, get_times = GetTimes, line_pid = TLinePid, x = TX, y = TY, state = State, times = Times} = RoleData,
%%    Dist = config:get_sys_config(team_mon_drop_dist),
    {NewRoleData, NewPS} =
        case TLinePid =:= LinePid andalso util:in_distance(X, Y, TX, TY, 50) of
            true ->
                NewDailyTimes = DailyTimes + 1,
                LvConf = conf_daily_thief_by_lv:get(Lv),
                #{thief_normal_reward := NorReward, thief_mul_reward := MulReward, thief_box_reward := BoxReward} = LvConf,
                Conf = conf_daily_thief:get(),
                #{mul_reward_times := MulRewardTimes, thief_reward_times := ThiefRewardTimes, one_round_times := RoundTimes} = Conf,
                AddAssets = ?iif(NewDailyTimes =< MulRewardTimes, util:prop_get_value(NewDailyTimes, MulReward), exp_effect(RoleID, util:prop_get_value(Times, NorReward))),
                {Reward, NewGetTimes} = ?iif((State =:= ?THIEF_STATE_FINISH andalso (GetTimes < ThiefRewardTimes)), {BoxReward, GetTimes + 1}, {0, GetTimes}),
                Reward > 0 andalso lib_drop_api:give_drop_asyn(RoleID, Reward, ?OPT_DAILY_THIEF),
                PS1 = lib_role_assets:add_items_notify(PS, AddAssets, ?OPT_DAILY_THIEF),
                lib_role_daily_lively:trigger_event(RoleID, 1011, 1),
                lib_role_marriage:part_team_act(RoleID, 1011, ?OPT_DAILY_THIEF),
                ?TASK_EVENT(RoleID, {'part_thief', NewDailyTimes =:= RoundTimes, IsLeader}),
                lib_role_mentor:is_team_with_mentor(PS) andalso ?TASK_EVENT(RoleID, 'mentor_thief'),
                {RoleData#thief{daily_times = NewDailyTimes, get_times = NewGetTimes}, PS1};
            _ ->
                {RoleData, PS}
        end,
    MsgRecord = #sc_daily_thirf_kill{
        times = Times,
        daily_times = NewRoleData#thief.daily_times
    },
    {ok, Bin} = prot_msg:encode_msg(51007, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    update_role_data(RoleID, NewRoleData),
    lib_role:mod_info(RoleID, lib_role_vow, {trigger, ?DEED_TYPE_THIEF, 0, 0}),
    {ok, NewPS}.

%% 单倍奖励收经验衰减影响
exp_effect(RoleID, Assets) ->
    lists:map(fun({Type, Value}) ->
        case Type =:= ?AST_EXP of
            true ->
                #{kill_num := KillList} = conf_kill_mon_exp_info:get(),
                KillMonNum = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_KILL_MON_COUNTER),
                Perc1 = util:get_zone_config(KillList, KillMonNum),
                {Type, max(1, erlang:floor(Value * (Perc1 / 100)))};
            _ ->
                {Type, Value}
        end
    end, Assets).

%% 队长触发奇遇
leader_adventure_event(PS, LvConf) ->
    #role_state{id = RoleID, sid = RoleSid, name = Name, team_id = TeamID, level = Lv} = PS,
    RoleData = get_role_data(TeamID),
    #thief{line_pid = TLinePid, scene_id = TSceneID, x = TX, y = TY} = RoleData,
    Conf = conf_daily_thief:get(),
    #{adventure_mon_weight := MonWeight, adventure_roraty_weight := RoratyWeight, roraty_last_time := RoratyLastTime} = Conf,
    ExpMaxTimes = config:get_sys_config(daily_thief_exp_max_times),
    RoratyMaxTimes = config:get_sys_config(daily_thief_roraty_max_times),
    ExpTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DAILY_THIEF_EXP),
    RoratyTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DAILY_THIEF_RORATY),
    IsTriggerRoraty = ?iif(RoratyTimes < RoratyMaxTimes, util:is_bingo(RoratyWeight, 10000), false),
    IsTriggerMon = ?iif(ExpTimes < ExpMaxTimes, util:is_bingo(MonWeight, 10000), false),
    case IsTriggerRoraty of
        true ->
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_DAILY_THIEF_RORATY, RoratyTimes + 1),
            Time = time:unixtime(),
            RoratyTime = Time + RoratyLastTime,
            lib_team:mod_info(TeamID, ?MODULE, {team_member_roraty_adventure, RoratyTime}, [RoleID]),
            IDList = get_id_list(Lv),
            MsgRecord = #sc_daily_thief_trigger_roraty{
                roraty_time = RoratyTime,
                roraty_list = handle_id_list(IDList)
            },
            {ok, Bin} = prot_msg:encode_msg(51018, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            update_role_data(RoleID, RoleData#thief{roraty_time = RoratyTime, list = IDList});
        _ when IsTriggerMon ->
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_DAILY_THIEF_EXP, ExpTimes + 1),
            #{adventure_mon_id := MonID} = LvConf,
            Args = [{xy, {TX, TY}}, {owner, #{id => RoleID, name => Name, team => TeamID}}],
            %% 创建白马义从
            MID = lib_scene_api:create_mon(MonID, TLinePid, Args),
            MsgRecord = #sc_daily_thief_refersh_adven{x = TX, y = TY, scene_id = TSceneID, target_id = MID},
            {ok, Bin} = prot_msg:encode_msg(51015, MsgRecord),
            lib_team:broadcast(TeamID, Bin),
            svr_rumor:publish(world, 20201, [Name]),
            ok;
        _ ->
            skip
    end.

%% 队员触发转盘奇遇
team_member_roraty_adventure(PS, RoratyTime) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene, team_id = TeamID, level = Lv} = PS,
    #role_scene{line_pid = LinePid, x = X, y = Y} = RoleScene,
    RoleData = get_role_data(TeamID),
    #thief{line_pid = TLinePid, x = TX, y = TY} = RoleData,
    RoratyMaxTimes = conf_sys_config:get(daily_thief_roraty_max_times),
    RoratyTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DAILY_THIEF_RORATY),
    Dist = config:get_sys_config(team_mon_drop_dist),
    case RoratyTimes < RoratyMaxTimes andalso TLinePid =:= LinePid andalso util:in_distance(X, Y, TX, TY, Dist) of
        true ->
            lib_role_kv:set_kv(RoleID, ?KEY_DAILY_DAILY_THIEF_RORATY, RoratyTimes + 1),
            IDList = get_id_list(Lv),
            NewRoleData = RoleData#thief{roraty_time = RoratyTime, list = IDList},
            MsgRecord = #sc_daily_thief_trigger_roraty{
                roraty_time = RoratyTime,
                roraty_list = handle_id_list(IDList)
            },
            {ok, Bin} = prot_msg:encode_msg(51018, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin),
            update_role_data(RoleID, NewRoleData);
        _ ->
            skip
    end.

%% 击杀白马义从
kill_adven_mon(PS) ->
    #role_state{team_id = TeamID} = PS,
    #{exp_last_time := ExpLastTime} = conf_daily_thief:get(),
    Now = time:unixtime(),
    ExpTime = Now + ExpLastTime,
    lib_team:mod_info(TeamID, ?MODULE, {all_member_exp_adventure, ExpTime}),
    ok.

%% 队员触发经验奇遇
all_member_exp_adventure(PS, ExpTime) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene, team_id = TeamID} = PS,
    #role_scene{line_pid = LinePid, x = X, y = Y} = RoleScene,
    RoleData = get_role_data(TeamID),
    #thief{line_pid = TLinePid, x = TX, y = TY} = RoleData,
    ExpMaxTimes = config:get_sys_config(daily_thief_exp_max_times),
    ExpTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_DAILY_THIEF_EXP),
    Dist = config:get_sys_config(team_mon_drop_dist),
    RealExpTime =
        case ExpTimes < ExpMaxTimes andalso TLinePid =:= LinePid andalso util:in_distance(X, Y, TX, TY, Dist) of
            true ->
                lib_role_kv:set_kv(RoleID, ?KEY_DAILY_DAILY_THIEF_EXP, ExpTimes + 1),
                NewRoleData = RoleData#thief{exp_time = ExpTime},
                update_role_data(RoleID, NewRoleData),
                ExpTime;
            _ ->
                time:unixtime() - 1
        end,
    MsgRecord = #sc_daily_thief_kill_horse{
        exp_time = RealExpTime
    },
    {ok, Bin} = prot_msg:encode_msg(51008, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin),
    ok.

%% 经验奇遇
exp_adventure(PS) ->
    case catch check_exp_adventure(PS) of
        {ok, ExpTime, AddExp} ->
            set_exp(AddExp),
            MsgRecord = #sc_daily_thief_exp_adven{exp_time = ExpTime, exp = AddExp},
            {ok, Bin} = prot_msg:encode_msg(51010, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_exp_adventure(PS) ->
    #role_state{team_id = TeamID, level = Lv} = PS,
    RoleData = get_role_data(TeamID),
    #thief{exp_time = ExpTime} = RoleData,
    Now = time:unixtime(),
    ExpTime >= Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    #{adventure_exp_stage := ExpStage} = conf_daily_thief_by_lv:get(Lv),
    {MinExp, MaxExp} = ExpStage,
    AddExp = util:rand(MinExp, MaxExp),
    {ok, ExpTime, AddExp}.

%% 领取经验奖励
get_exp_adventure(PS) ->
    case catch check_get_exp_adventure(PS) of
        {ok, RoleData, AddExp} ->
            NewPS = lib_role_assets:add_items_notify(PS, [{?AST_EXP, AddExp}], ?OPT_DAILY_THIEF),
            update_role_data(PS#role_state.id, RoleData),
            set_exp(0),
            MsgRecord = #sc_daily_thief_exp_adven_get{exp_time = RoleData#thief.exp_time, exp = AddExp},
            {ok, Bin} = prot_msg:encode_msg(51023, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            {ok, NewPS};
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

check_get_exp_adventure(PS) ->
    #role_state{team_id = TeamID} = PS,
    RoleData = get_role_data(TeamID),
    #thief{exp_time = ExpTime} = RoleData,
    Now = time:unixtime(),
    ExpTime >= Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    Exp = get_exp(),
    NewExpTime = Now - 10,
    NewRoleData = RoleData#thief{exp_time = NewExpTime},
    {ok, NewRoleData, Exp}.

%% 转盘奇遇选择
roraty_adventure(PS) ->
    case catch check_roraty_adventure(PS) of
        {ok, RoleData, Index} ->
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_daily_thief_roraty_adven{index = Index},
            {ok, Bin} = prot_msg:encode_msg(51012, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

%% 转盘奇遇
check_roraty_adventure(PS) ->
    #role_state{team_id = TeamID} = PS,
    RoleData = get_role_data(TeamID),
    #thief{roraty_time = RoratyTime, list = List} = RoleData,
    Now = time:unixtime(),
    RoratyTime >= Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    List =/= [] orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    {Index, _, _} = util:rand_by_weight(List, 3),
    NewRoleData = RoleData#thief{index = Index},
    {ok, NewRoleData, Index}.

%% 转盘奇遇
get_roraty_adventure(PS) ->
    case catch check_get_roraty_adventure(PS) of
        {ok, RoleData, Index, DropID} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_DAILY_THIEF),
            update_role_data(PS#role_state.id, RoleData),
            MsgRecord = #sc_daily_thief_roraty_adven_get{index = Index, roraty_time = RoleData#thief.roraty_time},
            {ok, Bin} = prot_msg:encode_msg(51021, MsgRecord),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            svr_rumor:publish(world, 20202, [PS#role_state.name] ++ lib_drop_base:format_drop(DropID)),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS#role_state.id, Code)
    end.

%% 转盘奇遇
check_get_roraty_adventure(PS) ->
    #role_state{team_id = TeamID, level = Lv} = PS,
    RoleData = get_role_data(TeamID),
    #thief{roraty_time = RoratyTime, index = Index} = RoleData,
    Now = time:unixtime(),
    Index > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    RoratyTime >= Now orelse erlang:throw({error, ?RC_THIEF_ADVENTURE_OVER_TIME}),
    #{adventure_roraty_reward := RewardList} = conf_daily_thief_by_lv:get(Lv),
    {_, DropID, _} = lists:keyfind(Index, 1, RewardList),
    NewRoratyTime = Now - 10,
    NewRoleData = RoleData#thief{index = 0, roraty_time = NewRoratyTime, list = []},
    {ok, NewRoleData, Index, DropID}.

%% @doc 取消任务
cancel_task(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{leader := Leader} = lib_team:get_team_info(TeamID),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_THIEF_ONLY_LEADER_CAN_CANCEL}),
    RoleData = get_role_data(TeamID),
    #thief{state = State} = RoleData,
    State =/= ?THIEF_STATE_NOT orelse erlang:throw({error, ?RC_THIEF_NOT_HAVA_TASK}),
    reset_task(TeamID, 1).

%% @doc 交任务
handle_task(PS) ->
    #role_state{id = RoleID, team_id = TeamID} = PS,
    TeamID > 0 orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{leader := Leader} = lib_team:get_team_info(TeamID),
    RoleData = get_role_data(TeamID),
    #thief{state = State} = RoleData,
    State =:= ?THIEF_STATE_FINISH orelse erlang:throw({error, ?RC_THIEF_TIMES_NOT_ENOUGH}),
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    reset_task(TeamID, 2).

%% @doc 重置任务
reset_task(TeamID, Type) ->
    ThiefData = ?thief_data,
    leader_sync_thief_data(TeamID, ThiefData),
    MsgRecord = #sc_daily_thief_cancel{
        scene_id = 0,
        x = 0,
        y = 0,
        times = 0,
        state = ?THIEF_STATE_NOT,
        target_id = 0,
        type = Type
    },
    {ok, Bin} = prot_msg:encode_msg(51014, MsgRecord),
    lib_team:broadcast(TeamID, Bin),
    ok.

leave_scene(#role_state{team_id = TeamID, id = RoleID}, SceneID) when TeamID > 0 ->
    #{leader := Leader} = lib_team:get_team_info(TeamID),
    RoleData = get_role_data(TeamID),
    #thief{
        state = State,
        scene_id = TSceneID
    } = RoleData,
    case Leader =:= RoleID andalso SceneID =:= TSceneID andalso State =:= ?THIEF_STATE_CREATE of
        true ->
            ThiefData = #{state => ?THIEF_STATE_ONGOING},
            leader_sync_thief_data(TeamID, ThiefData),
            MsgRecord = #sc_daily_thief_task_back{
                state = ?THIEF_STATE_ONGOING
            },
            {ok, Bin} = prot_msg:encode_msg(51019, MsgRecord),
            lib_team:broadcast(TeamID, Bin);
        _ ->
            skip
    end;
leave_scene(_, _) ->
    skip.

team_changed(PS) ->
    #role_state{team_id = TeamID, sid = RoleSid} = PS,
    RoleData = get_role_data(TeamID),
    #thief{state = State, npc_id = NpcID} = RoleData,
    case TeamID =:= 0 of
        true ->
            MsgRecord = #sc_daily_thief_cancel{
                scene_id = 0,
                x = 0,
                y = 0,
                times = 0,
                state = ?THIEF_STATE_NOT,
                target_id = 0,
                type = 1
            },
            {ok, Bin} = prot_msg:encode_msg(51014, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin);
        false when State > ?THIEF_STATE_NOT ->
            MsgRecord = #sc_daily_thief_get{
                npc_id = NpcID,
                state = State
            },
            {ok, Bin} = prot_msg:encode_msg(51004, MsgRecord),
            lib_role_send:send_to_sid(RoleSid, Bin);
        _ ->
            skip
    end.

cross_day(PS) ->
    #role_state{id = RoleID, sid = RoleSid, team_id = TeamID} = PS,
    RoleData = get_role_data(TeamID),
    NewRoleData = RoleData#thief{
        daily_times = 0,
        get_times = 0,
        last_check = time:unixtime()
    },
    update_role_data(RoleID, NewRoleData),
    send_info(RoleSid, NewRoleData).

%% 获取队伍最低等级
get_team_min_lv(Members) ->
    lists:foldl(fun(Member, Acc) ->
        MenLv = lib_cache:get_role_level(Member),
        ?iif(Acc =:= 0, MenLv, min(MenLv, Acc))
    end, 0, Members).

%% 获取队伍平均等级
get_team_avg_lv(Members) ->
    MemLv =
        lists:foldl(fun(Member, Acc) ->
            Acc + lib_cache:get_role_level(Member)
        end, 0, Members),
    MemNum = length(Members),
    erlang:floor(MemLv / MemNum).

%% 队长同步马贼队伍信息
leader_sync_thief_data(TeamID, ThiefData) ->
    TeamInfo = lib_team:get_team_info(TeamID),
    #{thief_data := OldThiefData} = TeamInfo,
    NewThiefData = maps:merge(OldThiefData, ThiefData),
    NewTeamInfo = TeamInfo#{thief_data => NewThiefData},
    lib_team:set_team_info(TeamID, NewTeamInfo),
    ok.

sync_to_member_thief_data(TeamID, RoleData) ->
    TeamInfo = lib_team:get_team_info(TeamID),
    #{thief_data := ThiefData} = TeamInfo,
    #{
        scene_id := SceneID,
        line_pid := LinePid,
        x := X,
        y := Y,
        times := Times,
        state := State,
        target_id := TargetID,
        npc_id := NpcID
    } = ThiefData,
    RoleData#thief{
        scene_id = SceneID,
        line_pid = LinePid,
        x = X,
        y = Y,
        state = State,
        target_id = TargetID,
        times = Times,
        npc_id = NpcID
    }.

is_func_open(Lv) ->
    #{open_lv := OpenLv} = conf_daily_thief:get(),
    Lv >= OpenLv.

get_daily_times() ->
    RoleData = get_role_data(),
    #thief{daily_times = DailyTimes} = RoleData,
    DailyTimes.

update_role_data(RoleID, Data) ->
    set_role_data(RoleID, Data#thief{updated = true}).

set_role_data(_RoleID, Data) ->
    erlang:put({?MODULE, role_data}, Data).

get_role_data(TeamID) ->
    RoleData = erlang:get({?MODULE, role_data}),
    ?iif(TeamID > 0, sync_to_member_thief_data(TeamID, RoleData), RoleData).
get_role_data() ->
    erlang:get({?MODULE, role_data}).

handle_id_list(IDList) ->
    [ID || {ID, _, _} <- IDList].

get_id_list(Lv) ->
    #{adventure_roraty_reward := RewardList} = conf_daily_thief_by_lv:get(Lv),
    util:list_rand_n(RewardList, 8).

%% 获取本次可领取经验
get_exp() ->
    case erlang:get({?MODULE, exp}) of
        Exp when is_integer(Exp) -> Exp;
        _ -> 0
    end.

set_exp(Exp) ->
    erlang:put({?MODULE, exp}, Exp).

%% 下线保存
save(PS) ->
    RoleData = get_role_data(),
    #thief{updated = Updated} = RoleData,
    ?iif(Updated, save_data(PS#role_state.id, RoleData), skip).

save_data(RoleID, RoleData) ->
    #thief{
        daily_times = DailyTimes,
        exp_time = ExpTime,
        roraty_time = RoratyTime,
        get_times = GetTimes,
        index = Index,
        last_check = LastCheck
    } = RoleData,
    save_role_data(RoleID, DailyTimes, ExpTime, RoratyTime, GetTimes, Index, LastCheck).

-define(SQL_GET_ROLE_DATA, <<"select `daily_times`, `exp_time`, `roraty_time`, `get_times`, `index`, `last_check` from `role_daily_thief` where `role_id` = ~w">>).
get_role_db_data(RoleID) ->
    SQL = io_lib:format(?SQL_GET_ROLE_DATA, [RoleID]),
    case ?DB:get_row(SQL) of
        [DailyTimes, ExpTime, RoratyTime, GetTimes, Index, LastCheck] ->
            #thief{
                daily_times = DailyTimes,
                exp_time = ExpTime,
                roraty_time = RoratyTime,
                get_times = GetTimes,
                index = Index,
                last_check = LastCheck
            };
        [] ->
            #thief{last_check = time:unixtime()}
    end.

-define(SQL_SET_ROLE_DATA, <<"replace into `role_daily_thief`(`role_id`, `daily_times`, `exp_time`, `roraty_time`, `get_times`, `index`, `last_check`) values(~w, ~w, ~w, ~w, ~w, ~w, ~w)">>).
save_role_data(RoleID, DailyTimes, ExpTime, RoratyTime, GetTimes, Index, LastCheck) ->
    SQL = io_lib:format(?SQL_SET_ROLE_DATA, [RoleID, DailyTimes, ExpTime, RoratyTime, GetTimes, Index, LastCheck]),
    ?DB:execute(SQL).

