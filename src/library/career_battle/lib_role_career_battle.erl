%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     门派竞技[玩家]
%%% @end
%%% Created : 31. 十月 2018 11:26
%%%-------------------------------------------------------------------
-module(lib_role_career_battle).

-include("role.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("op_type.hrl").
-include("career_battle.hrl").
-include("proto/prot_512.hrl").
-include("keyvalue.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

%% API
-export([
    do/3,
    enter/1,
    leave/1,
    lounge_info/1,
    leave_battle_room/1,
    get_reward/2,
    role_logout/1
]).

-export([
    make_bat_room_base/2,
    make_bat_room_id/3,
    make_bat_room_id/2,
    make_lounge_room_id/2,
    decode_bat_room_id/1,
    decode_lounge_room_id/1,
    wait_scene/0,
    battle_scene/0,
    sort_rank/1,
    make_client_sort_rank/1,
    get_room_data/1,
    get_room_data/2,
    handle_info/2
]).

do(51201, PS, _Req) ->
    enter(PS);
do(51203, PS, _Req) ->
    leave(PS);
do(51205, PS, #cs_career_battle_reward{times = Times}) ->
    get_reward(PS, Times);
do(51207, PS, _Req) ->
    TopInfo = lib_role_kv:get_kv(0, ?KEY_CAREER_BATTLE_TOP, []),
    Rec = #sc_career_battle_top{info = TopInfo},
    {ok, Bin} = prot_msg:encode_msg(51208, Rec),
    lib_role_send:send_to_sid(PS#role_state.sid, Bin),
    ok;
do(51211, PS, _Req) ->
    lounge_info(PS);
do(51213, PS, #cs_career_battle_rank{career = Career, grade = Grade}) ->
    get_rank(PS, Career, Grade);
do(51218, PS, _Req) ->
    leave_battle_room(PS);
do(_, _, _) ->
    skip.

handle_info('set_battle_flag', #role_state{stat = Stat} = PS) ->
    ForbidTime = config:get_sys_config(career_battle_forbid_time),
    lib_role:mod_after(ForbidTime * 1000, ?MODULE, 'cancel_battle_flag'),
    NewStat = bit_map:set(?SPEC_STAT_BIT_FORBID, Stat),
    PS#role_state{stat = NewStat};
handle_info('cancel_battle_flag', #role_state{stat = Stat} = PS) ->
    NewStat = bit_map:unset(?SPEC_STAT_BIT_FORBID, Stat),
    PS#role_state{stat = NewStat};
handle_info(_, _) ->
    skip.

enter(PS) ->
    case catch check_enter(PS) of
        {ok, SceneID} ->
            #role_state{id = RoleID, career = Career, level = Lv, guild_name = GuildName, sid = RoleSid, combat_power = Fight, personal = Personal} = PS,
            #{icon := Icon} = Personal,
            #{stage := Stage} = conf_career_battle_info:get(),
            Grade = util:get_zone_config(Stage, Lv),
            RoomID = make_lounge_room_id(Career, Grade),
            EnterInfo = #career_battle_role{
                id = RoleID,
                guild_name = GuildName,
                career = Career,
                grade = Grade,
                fight = Fight,
                icon = Icon
            },
            svr_career_battle_lounge:enter(RoomID, EnterInfo),
            {ToX, ToY} = lib_scene_api:get_scene_born_pos(SceneID),
            lib_scene_api:change_scene_async(RoleID, SceneID, RoomID, ToX, ToY),
            Rec = #sc_career_battle_enter{},
            {ok, Bin} = prot_msg:encode_msg(51202, Rec),
            lib_role_send:send_to_sid(RoleSid, Bin),
            lib_role_daily:add_counter(RoleID, ?KEY_DAILY_CAREER_BATTLE_ENTER_TIMES, 1),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS) ->
    SceneId = (PS#role_state.role_scene)#role_scene.scene_id,
    Lv = PS#role_state.level,
    NeedLv = conf_activity_hall:get_open_lv(5),
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    lib_scene_check:ensure_in_normal_scene(SceneId),
    EnterTimes = lib_role_kv:get_counter(PS#role_state.id, ?KEY_DAILY_CAREER_BATTLE_ENTER_TIMES),
    EnterTimes =:= 0 orelse erlang:throw({error, ?RC_CAREER_BATTLE_ALREADY_JOIN}),
    in_activity_check(PS, false).

leave(PS) ->
    case catch in_activity_check(PS, true) of
        {ok, _} ->
            do_leave(PS);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

do_leave(PS) ->
    #role_state{sid = RoleSid, id = RoleID, role_scene = RoleScene} = PS,
    #role_scene{line_id = RoomID} = RoleScene,
    svr_career_battle_lounge:leave(RoomID, RoleID),
    Rec = #sc_career_battle_leave{},
    {ok, Bin} = prot_msg:encode_msg(51204, Rec),
    lib_role_send:send_to_sid(RoleSid, Bin),
    lib_scene_api:return_scene(PS).

lounge_info(PS) ->
    case catch in_activity_check(PS, true) of
        {ok, _} ->
            #role_state{id = RoleID, career = Career, level = Lv, sid = RoleSid} = PS,
            #{stage := Stage} = conf_career_battle_info:get(),
            Grade = util:get_zone_config(Stage, Lv),
            RoomID = make_lounge_room_id(Career, Grade),
            svr_career_battle_lounge:lounge_info(RoomID, RoleID, RoleSid),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

get_rank(PS, Career, Grade) ->
    case catch check_get_rank(PS) of
        ok ->
            svr_career_battle_mgr:get_rank(PS#role_state.id, PS#role_state.sid, Career, Grade),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_rank(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID} = RoleScene,
    Ongoing = lib_activity:is_ongoing(?ACT_ID_CAREER_BATTLE),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    WSceneID = wait_scene(),
    BSceneID = battle_scene(),
    NowInScene = (CurSceneID =:= WSceneID) orelse (CurSceneID =:= BSceneID),
    NowInScene orelse erlang:throw({error, ?RC_CAREER_BATTLE_NOT_IN_SCENE}),
    ok.

leave_battle_room(PS) ->
    case catch check_leave_battle_room(PS) of
        {ok, RoomID} ->
            svr_career_battle_bat:leave(RoomID, PS#role_state.id, ?WAY_BY_LEAVE),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_leave_battle_room(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = RoomID} = RoleScene,
    BSceneID = battle_scene(),
    BSceneID =:= SceneID orelse erlang:throw({error, ?RC_CAREER_BATTLE_NOT_IN_BAT_SCENE}),
    {ok, RoomID}.

%% 领取奖励
get_reward(PS, Times) ->
    case catch check_get_reward(PS, Times) of
        {ok, DropID} ->
            lib_drop_api:give_drop_asyn(PS#role_state.id, DropID, ?OPT_CAREER_BATTLE),
            Rec = #sc_career_battle_reward{times = Times},
            {ok, Bin} = prot_msg:encode_msg(51206, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_get_reward(PS, Times) ->
    in_activity_check(PS, true),
    #role_state{id = RoleID} = PS,
    RoleData = util:get_ets(?ETS_CAREER_BATTLE, RoleID),
    #career_battle_role{reward = RewardList, grade = Grade, battle_times = BattleTimes} = RoleData,
    not lists:member(Times, RewardList) orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_GOT_REWARD}),
    BattleTimes >= Times orelse erlang:throw({error, ?RC_CAREER_BATTLE_NOT_ACHIEVE_TIMES}),
    DropID = conf_career_battle_times:get(Grade, Times),
    DropID =/= 0 orelse erlang:throw({error, ?RC_KF_DAILY_CHARGE_CONF_NOT_FOUND}),
    NewRewardList = [Times | RewardList],
    NewRoleData = RoleData#career_battle_role{reward = NewRewardList},
    util:put_ets(?ETS_CAREER_BATTLE, RoleID, NewRoleData),
    {ok, DropID}.


role_logout(PS) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID, line_id = RoomID} = RoleScene,
    BSceneID = battle_scene(),
    LSceneID = wait_scene(),
    if
        BSceneID =:= SceneID ->
            svr_career_battle_bat:leave(RoomID, PS#role_state.id, ?WAY_BY_LOGOUT);
        LSceneID =:= SceneID ->
            do_leave(PS);
        true ->
            ok
    end.

%% =========================Private======================

in_activity_check(PS, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID} = RoleScene,
    Ongoing = lib_activity:is_scheduled(?ACT_ID_CAREER_BATTLE),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    SceneID = wait_scene(),
    NowInScene = CurSceneID =:= SceneID,
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_CAREER_BATTLE_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_CAREER_BATTLE_ALREADY_IN_SCENE}),
    {ok, SceneID}.

wait_scene() ->
    #{lounge_scene := WaitScene} = conf_career_battle_info:get(),
    WaitScene.

battle_scene() ->
    #{battle_scene := BattleScene} = conf_career_battle_info:get(),
    BattleScene.

%% 生成休息室ID
make_lounge_room_id(Career, Grade) ->
    Career * 100 + Grade.

decode_lounge_room_id(RoomID) ->
    Career = RoomID div 100,
    Grade = RoomID - Career * 100,
    {Career, Grade}.

%% 生成战斗室ID
make_bat_room_id(AutoID, Career, Grade) ->
    BaseID = make_bat_room_base(Career, Grade),
    make_bat_room_id(AutoID, BaseID).
make_bat_room_id(AutoID, BaseID) ->
    AutoID + BaseID.

%% 生成战斗室基准值
make_bat_room_base(Career, Grade) ->
    Career * 100000 + Grade * 10000.

decode_bat_room_id(RoomID) ->
    Career = RoomID div 100000,
    Grade = (RoomID - Career * 100000) div 10000,
    {Career, Grade}.

get_room_data(RoomID) ->
    {Career, Grade} = decode_lounge_room_id(RoomID),
    get_room_data(Career, Grade).
%%get_room_data(Career, Grade) ->
%%    SelectMS = ets:fun2ms(
%%        fun({_, #career_battle_role{career = C, grade = G, score = Score} = RoleData})
%%            when C =:= Career andalso G =:= Grade andalso Score > 0 -> RoleData
%%        end),
%%    DataList = ets:select(?ETS_CAREER_BATTLE, SelectMS),
%%    sort_rank(DataList).
get_room_data(Career, Grade) ->
    SelectMS = ets:fun2ms(
        fun({_, #career_battle_role{career = C, grade = G, score = Score}} = Data)
            when C =:= Career andalso G =:= Grade andalso Score > 0 -> Data
        end),
    DataList = ets:select(?ETS_CAREER_BATTLE, SelectMS),
    FilterList = [RoleData || {_, RoleData} <- DataList],
    sort_rank(FilterList).

%% @doc 排序
sort_rank(List) ->
    Fun = fun(A, B) -> compare_rank(A, B) end,
    lists:sort(Fun, List).

compare_rank(RankA, RankB) ->
    #career_battle_role{time = TimeA, score = ScoreA} = RankA,
    #career_battle_role{time = TimeB, score = ScoreB} = RankB,
    cmp([{ScoreA, ScoreB}, {TimeB, TimeA}]).

cmp([]) ->
    true;
cmp([{Ka, Kb} | T]) ->
    if
        Ka > Kb -> true;
        Ka < Kb -> false;
        true -> cmp(T)
    end.

%% 生成客户端协议数据
make_client_sort_rank(List) ->
    assign_rank(List, [], 1).

assign_rank([], Acc, _Rank) ->
    lists:reverse(Acc);
assign_rank([RoleData | T], Acc, Rank) ->
    #career_battle_role{id = RoleID, score = Score, guild_name = GuildName, icon = Icon} = RoleData,
    RoleName = lib_cache:get_role_name(RoleID),
    NewAcc = [{Rank, RoleID, RoleName, GuildName, Score, Icon} | Acc],
    assign_rank(T, NewAcc, Rank + 1).