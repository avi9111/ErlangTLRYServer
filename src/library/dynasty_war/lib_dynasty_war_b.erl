%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_dynasty_war_b).
-author("Ryuu").

-include("mask.hrl").
-include("title.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("scene_objs.hrl").
-include("dynasty_war.hrl").
-include("proto/prot_307.hrl").

%% API
-export([
    info/1,
    init/1,
    loop/2,
    born_pos/1,
    hurt_role/2,
    kill_role/3,
    stop_clear/1,
    timer_score/2,
    switch_state/2,
    timer_score_async/2
]).

%% @doc info
info(State) ->
    #{room_id := RoomID} = State,
    [
        {state, State},
        {room_info, get_room_info(RoomID)}
    ].

%% @doc init
init([RoomInfo, Camps, Roles]) ->
    #{id := RoomID, group_id := GroupID, scene_id := SceneID, line_id := LineID,
        scene_pid := ScenePid} = RoomInfo,
    set_room_info(RoomID, RoomInfo),
    [set_camp_info(CampID, CampInfo) || {CampID, CampInfo} <- Camps],
    erlang:put(all_role_data, dict:from_list(Roles)),
    svr_timer:register(),
    BornPoses = [{?CAMP_SONG, born_pos(?CAMP_SONG)}, {?CAMP_LIAO, born_pos(?CAMP_LIAO)}],
    push_to_scene(Roles, BornPoses, SceneID, LineID),
    State = ?dynasty_war_room_state#{
        group_id => GroupID, room_id => RoomID, scene_id => SceneID,
        line_id => LineID, scene_pid => ScenePid
    },
    switch_state(State, ?STAGE_0).

push_to_scene([], _BornPoses, _SceneID, _LineID) ->
    ok;
push_to_scene([{_, RoleData} | T], BornPoses, SceneID, LineID) ->
    #{id := RoleID, node := Node, camp_id := CampID} = RoleData,
    {X, Y} = util:prop_get_value(CampID, BornPoses),
    Options = [{realm, CampID}, {header, ?HEADER(camp_title(CampID), 0)}],
    lib_kf:cast_to_node(Node, lib_scene_api, change_scene_async, [
        RoleID, SceneID, LineID, X, Y, Options
    ]),
    push_to_scene(T, BornPoses, SceneID, LineID).

%% @doc change state
switch_state(State, ?STAGE_0) ->
    switch_state(State, ?STAGE_1);
switch_state(State, Stage) when Stage >= ?STAGE_1 andalso Stage =< ?STAGE_6 ->
    Conf = conf_dynasty_war_stage:get(Stage),
    #{span := Span} = Conf,
    start_state_timer(Span, Stage + 1),
    erlang:put(current_state, Stage),
    notify_stage(State, Stage, Span),
    State#{stage => Stage};
switch_state(State, ?STAGE_7) -> %% battle end
    svr_timer:unregister(),
    erlang:put(battle_end, true),
    erlang:send_after(15 * 1000, self(), stop_clear),
    notify_stage(State, ?STAGE_7, 0),
    RoomInfo = refresh_rank(State, true),
    #{rank_dict := RoleRank, role_set := RoleSet} = RoomInfo,
    {WinCamp, CampScores, WinScores} = get_win_camp(),
    MailID = config:get_sys_config(dynasty_war_settle_mail),
    {List, RankList} = settle_up_roles(sets:to_list(RoleSet), RoleRank, WinCamp, WinScores, MailID, [], []),
    notify_result(List, WinCamp, CampScores, RankList),
    State#{stage => ?STAGE_7}.

notify_stage(State, Stage, Span) ->
    Rec = #sc_dynasty_war_stage{stage = Stage, span = Span},
    {ok, Bin} = prot_msg:encode_msg(30711, Rec),
    broadcast_to_scene(State, Bin).

settle_up_roles([], _RoleRank, _WinCamp, _WinScores, _MailID, Acc, RankAcc) ->
    {Acc, RankAcc};
settle_up_roles([RoleID | T], RoleRank, WinCamp, WinScores, MailID, Acc, RankAcc) ->
    RoleData = get_role_data(RoleID),
    #{name := Name, server_id := ServerID, node := _Node, camp_id := RoleCamp,
        hurt := Hurt, career := Career, score := Score, sid := Sid} = RoleData,
    Rank = util:dict_find(RoleID, RoleRank, 0),
    ScoreR = conf_dynasty_war_rank:get(Rank),
    ScoreW = util:prop_get_value(RoleCamp, WinScores, 0),
    TScore = Score + ScoreR + ScoreW,
    Reward = conf_dynasty_war_score:get(TScore),
    lib_role:mod_info(RoleID, lib_role_dynasty_war, {settle_up, Reward, RoleCamp =:= WinCamp}),
    RankRec = {Rank, RoleID, Name, ServerID, Career, RoleCamp, Hurt, Score, ScoreR, ScoreW},
    Rec = #sc_dynasty_war_settle_up{camp = RoleCamp, score = TScore, reward = Reward},
    settle_up_roles(T, RoleRank, WinCamp, WinScores, MailID, [{Sid, Rec} | Acc], [RankRec | RankAcc]).

notify_result([], _WinCamp, _CampScores, _RankList) ->
    ok;
notify_result([{Sid, Rec0} | T], WinCamp, CampScores, RankList) ->
    Rec1 = Rec0#sc_dynasty_war_settle_up{
        win_camp = WinCamp, camp_score = CampScores, rank_list = RankList
    },
    {ok, Bin} = prot_msg:encode_msg(30714, Rec1),
    lib_role_send:send_to_role(Sid, Bin),
    notify_result(T, WinCamp, CampScores, RankList).

start_state_timer(Time, NextState) ->
    stop_state_timer(),
    Ref = erlang:send_after(Time * 1000, self(), {switch_state, NextState}),
    erlang:put(state_timer, Ref).

stop_state_timer() ->
    case erlang:erase(state_timer) of
        undefined -> ignore;
        Ref -> timer:cancel(Ref)
    end.

%% @doc
stop_clear(State) ->
    #{scene_id := SceneID, line_id := LineID} = State,
    lib_kf:clear_kf_scene(SceneID, LineID),
    ok.

%% @doc 秒循环
loop(State, Now) ->
    if
        Now rem 5 =:= 1 -> interval_add_score(State);
        Now rem 20 =:= 3 -> refresh_rank(State, true);
        true -> ignore
    end,
    refresh_camp_score(State),
    ok.

%% @doc 刷新阵营积分
refresh_camp_score(State) ->
    Rec = #sc_dynasty_score{
        camp_score = get_camp_scores()
    },
    {ok, Bin} = prot_msg:encode_msg(30712, Rec),
    broadcast_to_scene(State, Bin).

%% @doc 定时加积分 [异步]
interval_add_score(State) ->
    #{scene_id := SceneID, line_id := LineID, scene_pid := ScenePid} = State,
    svr_scene_agent:apply_cast(ScenePid, ?MODULE, timer_score_async, [SceneID, LineID]).

timer_score_async(SceneID, LineID) ->
    ZoneRoles = collect_zone_role(SceneID, LineID),
    svr_dynasty_war_bat:timer_score(LineID, ZoneRoles).

collect_zone_role(SceneID, _LineID) ->
    RoleList = lib_scene_agent:get_scene_roler(),
    collect_zone_role(RoleList, SceneID, dict:new()).

collect_zone_role([], _SceneID, Acc) ->
    dict:to_list(Acc);
collect_zone_role([Role | T], SceneID, Acc) ->
    #scene_role{id = RoleID, x = X, y = Y} = Role,
    Zone = get_zone(SceneID, X, Y),
    NewAcc = dict:append(Zone, RoleID, Acc),
    collect_zone_role(T, SceneID, NewAcc).

timer_score(State, ZoneRoles) ->
    #{stage := Stage} = State,
    Conf = conf_dynasty_war_stage:get(Stage),
    #{zones := Zones} = Conf,
    [begin
        Score = util:prop_get_value(Zone, Zones, 0),
        Score > 0 andalso add_roles_score(State, Roles, Score, 0)
    end || {Zone, Roles} <- ZoneRoles],
    ok.

%% @doc refresh rank
refresh_rank(State, Broad) ->
    #{room_id := RoomID} = State,
    RoomInfo = get_room_info(RoomID),
    RoomInfo1 = refresh_role_rank(RoomInfo),
    set_room_info(RoomID, RoomInfo1),
    distribute_rank(State, RoomInfo1, Broad),
    RoomInfo1.

refresh_role_rank(RoomInfo) ->
    #{role_set := RoleSet} = RoomInfo,
    RoleList = sets:to_list(RoleSet),
    {RankList, RankDict, CacheList} = refresh_role_rank2(RoleList),
    RoomInfo#{
        rank_list => RankList, cache_rank => CacheList, rank_dict => RankDict
    }.

refresh_role_rank2(RoleList) ->
    Fun1 = fun(RoleKey, Acc) ->
        RoleData = get_role_data(RoleKey),
        #{hurt := Hurt, kill := Kill, score := Score} = RoleData,
        [{{-Hurt, -Kill, -Score, RoleKey}, RoleData} | Acc]
    end,
    List = lists:foldl(Fun1, [], RoleList),
    SortList = lists:sort(List),
    refresh_score_rank3(SortList, 1, [], dict:new(), []).

refresh_score_rank3([], _Rank, RankAcc, RankDict, CacheAcc) ->
    {lists:reverse(RankAcc), RankDict, lists:reverse(CacheAcc)};
refresh_score_rank3([Item | T], Rank, RankAcc, RankDict, CacheAcc) ->
    {_, RoleData} = Item,
    #{id := RoleID, name := Name, server_id := ServerID, hurt := Hurt,
        career := Career, score := Score, score_r := ScoreR, score_w := ScoreW,
        camp_id := CampID} = RoleData,
    Rec1 = #{
        rank => Rank, role_id => RoleID, role_name => Name, score => Score, career => Career
    },
    Rec2 = {Rank, RoleID, Name, ServerID, Career, CampID, Hurt, Score, ScoreR, ScoreW},
    NewRank = Rank + 1,
    NewRankAcc = [Rec1 | RankAcc],
    NewRankDict = dict:store(RoleID, Rank, RankDict),
    NewCacheAcc = [Rec2 | CacheAcc],
    refresh_score_rank3(T, NewRank, NewRankAcc, NewRankDict, NewCacheAcc).

distribute_rank(State, RoomInfo, Broad) ->
    Broad andalso begin
        #{cache_rank := CacheRankR} = RoomInfo,
        Rec = #sc_dynasty_war_rank{
            rank_list = CacheRankR,
            camp_score = get_camp_scores()
        },
        {ok, Bin} = prot_msg:encode_msg(30713, Rec),
        broadcast_to_scene(State, Bin)
    end.

%% @doc 攻击玩家
hurt_role(RoleID, Hurt) ->
    RoleData = get_role_data(RoleID),
    #{hurt := NowHurt} = RoleData,
    NewHurt = erlang:floor(NowHurt + Hurt),
    NewData = RoleData#{hurt => NewHurt},
    set_role_data(RoleID, NewData).

%% @doc 击杀玩家
kill_role(State, RoleID, TargetID) ->
    RoleData = get_role_data(RoleID),
    #{kill := Kill, cont_kill := ContKill, last_kill := LastKill, name := RoleName} = RoleData,
    Now = time:unixtime(),
    {NewContKill, NewLastKill} = new_continue_kill(Now, ContKill, LastKill),
    NewKill = Kill + 1,
    NewData = RoleData#{
        kill => NewKill, cont_kill => NewContKill, last_kill => NewLastKill
    },
    set_role_data(RoleID, NewData),
    KillRumor = conf_dynasty_war_kill:get(NewContKill),
    KillRumor > 0 andalso publish_rumor(State, KillRumor, [RoleName]),
    TargetData = get_role_data(TargetID),
    NewTargetData = TargetData#{cont_kill => 0, last_kill => 0},
    set_role_data(TargetID, NewTargetData),
    ok.

new_continue_kill(Now, ContKill, LastKill) ->
    case LastKill =:= 0 orelse ContKill =:= 0 orelse
        (not continue_kill_expired(Now, LastKill)) of
        true -> {ContKill + 1, Now};
        _ -> {1, Now}
    end.

continue_kill_expired(Now, LastKill) ->
    CD = config:get_sys_config(dynamic_war_cont_kill_cd),
    Now - LastKill >= CD.

%% @doc publish rumor
publish_rumor(State, Rumor, Args) ->
    Bin = lib_rumor:encode({}, Rumor, Args),
    broadcast_to_scene(State, Bin).

%% -----------------------------------------------------------------------------
%% 积分
%% -----------------------------------------------------------------------------

%% @doc 增加积分
add_roles_score(State, RoleKey, Score, OpType) when is_integer(RoleKey) ->
    add_roles_score(State, [RoleKey], Score, OpType);
add_roles_score(_State, [], _Score, _OpType) ->
    ok;
add_roles_score(State, [Role | Tail], Score, OpType) ->
    add_role_score(State, Role, Score, OpType),
    add_roles_score(State, Tail, Score, OpType).

add_role_score(_State, RoleKey, 0, _OpType) ->
    RoleKey;
add_role_score(State, RoleKey, Score, OpType) when is_integer(RoleKey) ->
    RoleData = get_role_data(RoleKey),
    NewData = add_role_score(State, RoleData, Score, OpType),
    set_role_data(RoleKey, NewData);
add_role_score(_State, RoleData, Score0, _OpType) ->
    #{score := CurScore, last_notify := LastNotify, camp_id := CampID} = RoleData,
    NewScore = erlang:max(erlang:floor(CurScore + Score0), 0),
    Score = NewScore - CurScore,
    Now = time:unixtime(),
    Notify = Now - LastNotify >= 1,
    NewLastNotify = ?iif(Notify, Now, LastNotify),
    NewRoleData = RoleData#{
        score => NewScore, last_notify => NewLastNotify
    },
    add_camp_score(CampID, Score),
    notify_role_score(RoleData, Score, NewScore),
    NewRoleData.

notify_role_score(RoleData, AScore, TScore) ->
    Rec = #sc_dynasty_role_score{add = AScore, score = TScore},
    {ok, Bin} = prot_msg:encode_msg(30715, Rec),
    lib_role_send:send_to_role(RoleData, Bin).

add_camp_score(CampID, Score) ->
    SvrInfo = get_camp_info(CampID),
    #{score := CurScore} = SvrInfo,
    NewScore = erlang:max(erlang:floor(CurScore + Score), 0),
    NewSvrInfo = SvrInfo#{score => NewScore},
    set_camp_info(CampID, NewSvrInfo).

%% -----------------------------------------------------------------------------
%% 消息
%% -----------------------------------------------------------------------------

broadcast_to_scene(State, Bin) ->
    #{scene_id := _SceneID, line_id := _LineID, scene_pid := ScenePid} = State,
    lib_scene_api:send_to_scene(ScenePid, Bin).

%% -----------------------------------------------------------------------------

get_zone(SceneID, X, Y) ->
    case conf_scene_mask:get_pos_mask(SceneID, X, Y) of
        V when (V bsr ?MASK_SELF_1) band 1 =:= 1 ->
            ?ZONE_YUN;
        V when (V bsr ?MASK_SELF_2) band 1 =:= 1 ->
            ?ZONE_DAI;
        V when (V bsr ?MASK_SELF_3) band 1 =:= 1 ->
            ?ZONE_YAN;
        _ ->
            0
    end.

born_pos(?CAMP_SONG) ->
    config:get_sys_config(dynasty_war_born_pos_song);
born_pos(?CAMP_LIAO) ->
    config:get_sys_config(dynasty_war_born_pos_liao).

camp_title(?CAMP_SONG) ->
    ?TITLE_ID_DYNASTY_WAR_SONG;
camp_title(?CAMP_LIAO) ->
    ?TITLE_ID_DYNASTY_WAR_LIAO.

get_camp_scores() ->
    CampSong = get_camp_info(?CAMP_SONG),
    CampLiao = get_camp_info(?CAMP_LIAO),
    #{score := ScoreS} = CampSong,
    #{score := ScoreL} = CampLiao,
    [{?CAMP_SONG, ScoreS}, {?CAMP_LIAO, ScoreL}].

get_win_camp() ->
    CampScores = get_camp_scores(),
    [{?CAMP_SONG, ScoreS}, {?CAMP_LIAO, ScoreL}] = CampScores,
    WinScore = config:get_sys_config(dynasty_war_score_win),
    LoseScore = config:get_sys_config(dynasty_war_score_lose),
    DrawScore = config:get_sys_config(dynasty_war_score_draw),
    if
        ScoreS =:= ScoreL ->
            WinCamp = 0,
            WinScores = [{?CAMP_SONG, DrawScore}, {?CAMP_LIAO, DrawScore}];
        ScoreS > ScoreL ->
            WinCamp = ?CAMP_SONG,
            WinScores = [{?CAMP_SONG, WinScore}, {?CAMP_LIAO, LoseScore}];
        true ->
            WinCamp = ?CAMP_LIAO,
            WinScores = [{?CAMP_SONG, LoseScore}, {?CAMP_LIAO, WinScore}]
    end,
    {WinCamp, [{?CAMP_SONG, ScoreS}, {?CAMP_LIAO, ScoreL}], WinScores}.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 获取所有玩家数据 dict
get_all_role_data() ->
    case erlang:get(all_role_data) of
        undefined -> dict:new();
        V -> V
    end.

%% @doc 玩家数据
get_role_data(RoleID) ->
    Dict = get_all_role_data(),
    case dict:find(RoleID, Dict) of
        {ok, V} -> V;
        _ -> ?dynasty_war_room_role#{id => RoleID}
    end.

set_role_data(RoleID, RoleData) ->
    Dict = get_all_role_data(),
    NewDict = dict:store(RoleID, RoleData, Dict),
    erlang:put(all_role_data, NewDict).

%% @doc 阵营信息
get_camp_info(CampID) ->
    case erlang:get({camp_info, CampID}) of
        CampInfo when is_map(CampInfo) ->
            CampInfo;
        _ ->
            ?dynasty_war_room_camp#{id => CampID}
    end.

set_camp_info(CampID, CampInfo) ->
    erlang:put({camp_info, CampID}, CampInfo).

%% @doc 房间/战斗数据
get_room_info(RoomID) ->
    case erlang:get(room_info) of
        RoomInfo when is_map(RoomInfo) ->
            RoomInfo;
        _ ->
            ?dynasty_war_room_info#{id => RoomID}
    end.

set_room_info(_RoomID, RoomInfo) ->
    erlang:put(room_info, RoomInfo).
