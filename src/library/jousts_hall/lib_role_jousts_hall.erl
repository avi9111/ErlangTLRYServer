%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂[玩家进程]
%%% @end
%%% Created : 13. 十一月 2018 19:28
%%%-------------------------------------------------------------------
-module(lib_role_jousts_hall).

-include("role.hrl").
-include("op_type.hrl").
-include("keyvalue.hrl").
-include("ret_code.hrl").
-include("activity.hrl").
-include("jousts_hall.hrl").
-include("proto/prot_517.hrl").

%% API
-export([
    do/3,
    handle_info/2,
    role_logout/1,
    event/2
]).

do(51701, PS, _Req) ->
    enter(PS);
do(51703, PS, _Req) ->
    leave_l(PS);
do(51705, PS, _Req) ->
    leave_b(PS);
do(51710, PS, _Req) ->
    info(PS);
do(51714, PS, _Req) ->
    get_rank(PS);
do(51717, PS, _Req) ->
    get_score(PS);
do(_, _, _) ->
    skip.

event(PS, 'team_changed') ->
    team_changed(PS);
event(_, _) ->
    skip.

handle_info({add_exp, AddExp}, PS) ->
    lib_role_assets:add_items_notify(PS, [{?AST_EXP, AddExp}], ?OPT_JOUSTS_HALL);
handle_info(_, _) ->
    skip.

%% @doc 进入休息室
enter(PS) ->
    case catch check_enter(PS) of
        {ok, _SceneID} ->
            #role_state{
                id = RoleID,
                team_id = TeamID,
                guild_id = GuildID,
                guild_name = GuildName,
                sid = RoleSid,
                career = Career,
                level = Lv
            } = PS,
            EnterInfo = ?jousts_l_role_data#{
                id => RoleID,
                lv => Lv,
                career => Career,
                team_id => TeamID,
                guild_id => GuildID,
                guild_name => GuildName
            },
            lib_role_daily:add_counter(RoleID, ?KEY_DAILY_JOUSTS_HALL_ENTER_TIMES, 1),
            svr_jousts_hall_lounge:enter(RoleID, RoleSid, EnterInfo),
            lib_role_daily_lively:trigger_event(RoleID, 8, 1),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_enter(PS) ->
    #role_state{id = RoleID, team_id = TeamID, level = Lv, guild_id = GuildID} = PS,
    EnterTimes = lib_role_kv:get_counter(RoleID, ?KEY_DAILY_JOUSTS_HALL_ENTER_TIMES),
    EnterTimes =:= 0 orelse erlang:throw({error, ?RC_JOUSTS_HALL_ALREADY_JOIN}),
    case TeamID > 0 of
        true ->
            TeamInfo = lib_team:get_team_info(TeamID),
            Robots = maps:get(robots, TeamInfo, []),
            Robots =:= [] orelse erlang:throw({error, ?RC_TEAM_HAVE_ROBOTS});
        _ ->
            skip
    end,
    SceneId = (PS#role_state.role_scene)#role_scene.scene_id,
    lib_scene_check:ensure_in_normal_scene(SceneId),
    #{lv := NeedLv} = conf_jousts_hall_info:get(),
    Lv >= NeedLv orelse erlang:throw({error, ?RC_LEVEL_GIFT_LV_LIMIT}),
    case GuildID > 0 of
        true ->
            (time:unixtime() - lib_guild:get_join_time(RoleID) >= ?ONE_DAY_SECONDS) orelse
                erlang:throw({error, ?RC_JOUSTS_HALL_JOIN_GUILD_TIME_NOT_ENOUGH});
        _ ->
            skip
    end,
    ?MAKE_SURE(svr_jousts_hall_lounge:get_stat()),
    in_activity_check(PS, ?TYPE_ALL, false).

%% @doc 离开休息室
leave_l(PS) ->
    case catch in_activity_check(PS, ?TYPE_LOUNGE, true) of
        {ok, _} ->
            svr_jousts_hall_lounge:leave(PS#role_state.id),
            Rec = #sc_jousts_hall_leave_l{},
            {ok, Bin} = prot_msg:encode_msg(51704, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            lib_scene_api:return_scene(PS);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 离开战斗场景
leave_b(PS) ->
    case catch in_activity_check(PS, ?TYPE_BATTLE, true) of
        {ok, CurScene} ->
            svr_jousts_hall_battle:leave(CurScene, PS#role_state.id, 1),
            Rec = #sc_jousts_hall_leave_b{},
            {ok, Bin} = prot_msg:encode_msg(51706, Rec),
            lib_role_send:send_to_sid(PS#role_state.sid, Bin),
            ok;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

info(PS) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    Scenes = conf_jousts_hall_war:get_scenes(),
    IsInLScene = SceneID =:= ForyerScene,
    IsInBScene = lists:member(SceneID, Scenes),
    if
        IsInLScene ->
            svr_jousts_hall_lounge:info(RoleSid);
        IsInBScene ->
            svr_jousts_hall_battle:info(SceneID, RoleID, RoleSid);
        true ->
            skip
    end.

get_rank(PS) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    Scenes = conf_jousts_hall_war:get_scenes(),
    IsInBScene = lists:member(SceneID, Scenes),
    if
        IsInBScene ->
            svr_jousts_hall_battle:get_rank(SceneID, RoleID, RoleSid);
        true ->
            skip
    end.

get_score(PS) ->
    #role_state{id = RoleID, sid = RoleSid, role_scene = RoleScene} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    Scenes = conf_jousts_hall_war:get_scenes(),
    IsInLScene = SceneID =:= ForyerScene,
    IsInBScene = lists:member(SceneID, Scenes),
    if
        IsInLScene ->
            svr_jousts_hall_lounge:get_score(RoleID, RoleSid);
        IsInBScene ->
            svr_jousts_hall_battle:get_score(SceneID, RoleID, RoleSid);
        true ->
            skip
    end.

in_activity_check(PS, ?TYPE_ALL, InScene) ->
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    Scenes = conf_jousts_hall_war:get_scenes(),
    AllScene = [ForyerScene | Scenes],
    in_activity_check(PS, AllScene, InScene);
in_activity_check(PS, ?TYPE_LOUNGE, InScene) ->
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    in_activity_check(PS, [ForyerScene], InScene);
in_activity_check(PS, ?TYPE_BATTLE, InScene) ->
    Scenes = conf_jousts_hall_war:get_scenes(),
    in_activity_check(PS, Scenes, InScene);
in_activity_check(PS, AllScene, InScene) ->
    #role_state{role_scene = RoleScene} = PS,
    #role_scene{scene_id = CurSceneID} = RoleScene,
    Ongoing = lib_activity:is_ongoing(?ACT_ID_JOUSTS_HALL),
    Ongoing orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING}),
    NowInScene = lists:member(CurSceneID, AllScene),
    (InScene =:= true andalso not NowInScene) andalso erlang:throw({error, ?RC_CAREER_BATTLE_NOT_IN_SCENE}),
    (InScene =:= false andalso NowInScene) andalso erlang:throw({error, ?RC_CAREER_BATTLE_ALREADY_IN_SCENE}),
    {ok, CurSceneID}.

%% 离线
role_logout(#role_state{id = RoleID, role_scene = #role_scene{scene_id = SceneID}} = _PS) ->
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    Scenes = conf_jousts_hall_war:get_scenes(),
    IsInLScene = SceneID =:= ForyerScene,
    IsInBScene = lists:member(SceneID, Scenes),
    if
        IsInLScene ->
            svr_jousts_hall_lounge:leave(RoleID);
        IsInBScene ->
            svr_jousts_hall_battle:leave(SceneID, RoleID, 2);
        true ->
            skip
    end.

team_changed(PS) ->
    #role_state{id = RoleID, role_scene = RoleScene, team_id = TeamID} = PS,
    #role_scene{scene_id = SceneID} = RoleScene,
    #{foyer_scene := ForyerScene} = conf_jousts_hall_info:get(),
    Scenes = conf_jousts_hall_war:get_scenes(),
    IsInLScene = SceneID =:= ForyerScene,
    IsInBScene = lists:member(SceneID, Scenes),
    if
        IsInLScene ->
            svr_jousts_hall_lounge:team_changed(RoleID, TeamID);
        IsInBScene ->
            svr_jousts_hall_battle:team_changed(SceneID, RoleID, TeamID);
        true ->
            skip
    end.