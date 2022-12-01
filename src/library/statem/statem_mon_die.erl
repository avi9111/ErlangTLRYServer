%%-------------------------------------------------------
%% @File     : statem_mon_die.erl
%% @Brief    : 怪物死亡状态
%% @Author   : cablsbs
%% @Date     : 2018-7-13
%%-------------------------------------------------------
-module(statem_mon_die).

-include("scene.hrl").
-include("battle.hrl").
-include("op_type.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).

%% Callbacks --------------------------------------------

% 怪物被杀
state_enter([Atter, NowTimeMS], State) ->
    #mon{mid = MId, x = X, y = Y, revive = Revive, harm_map = HarmMap, killer = AtterKey} = State,
    SceneId = ?SCENE_ID, LineID = ?LINE_ID, SceneType = ?SCENE_TYPE,
    lib_obj_util:bcast_die(?BATTLE_MON, State#mon.id, X, Y),
    OwnerId = Atter#bt_return_atter.owner_id,
    Attackers = maps:keys(HarmMap),
    FirstAtt = lib_scene_agent:get_first_att(State#mon.functional_data),
    send_mon_drop(State, FirstAtt),
    kill_mon_event(AtterKey, Attackers, SceneId, SceneType, MId),
    svr_dungeon:mon_die(SceneId, LineID, State),
    svr_world_boss_layer:mon_die_check(OwnerId, SceneId, ?LINE_ID, MId),
    lib_scene_master:mon_die(SceneId, MId),
    lib_scene_lake:mon_die(SceneId, MId, HarmMap, FirstAtt),
    lib_scene_jousts:mon_die(SceneId, FirstAtt, X, Y, OwnerId),
    lib_scene_catch_pet:mon_die(SceneId, MId, X, Y, OwnerId),
    svr_guild_defend:mon_die(SceneId, State#mon.mid, ?LINE_ID),
    case Revive =:= 0 orelse lists:member(SceneType, [?SCENE_DUNGEON]) of
        true ->
            skip;
        false ->
            #mon{args = Args} = State,
            ReviveCmd = {NowTimeMS + Revive, 'revive_mon', {MId, Args}},
            TimeList = lib_scene_agent:get_time_list(),
            TimeListN = [ReviveCmd | TimeList],
            lib_scene_agent:put_time_list(TimeListN)
    end,
    StateT = lib_ai_trigger:die(AtterKey, State),
    StateT#mon{hp = 0};
% 怪物自杀/牺牲
state_enter([], #mon{id = MonId, x = X, y = Y} = State) ->
    lib_obj_util:bcast_die(?BATTLE_MON, State#mon.id, X, Y),
    StateT = lib_ai_trigger:die({?BATTLE_MON, MonId}, State),
    StateT#mon{hp = 0}.

state_update(_NowTime, _ElapseTime, State) ->
    State.

state_quit(State) ->
    State.

%% Privates ---------------------------------------------

%% @doc 怪物掉落
send_mon_drop(#mon{drop = DropId} = Mon, FirstAtt) when FirstAtt > 0 ->
    send_mon_drop2(Mon, FirstAtt, DropId);
send_mon_drop(_State, _) ->
    skip.

send_mon_drop2(Mon, RoleID, DropID) ->
    #mon{x = MonX, y = MonY, mid = MID} = Mon,
    SceneID = ?SCENE_ID,
    LineID = ?LINE_ID,
    IsTeamDung = lib_dungeon_util:is_team_scene(SceneID),
    case lib_scene_agent:get_roler(RoleID) of
        _ when IsTeamDung ->
            svr_dungeon:mon_drop(SceneID, LineID, DropID, MID);
        #scene_role{team = TeamID} when TeamID > 0 ->
            team_drop(TeamID, SceneID, MonX, MonY, DropID, MID);
        _ ->
            lib_role:mod_info(RoleID, lib_role_kill_mon_exp, {mon_exp, MID}),
            lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_MON_DROP)
    end.

%% @doc 组队掉落模式
team_drop(TeamID, SceneID, MonX, MonY, DropID, MID) ->
    SceneType = lib_scene_api:get_scene_type(SceneID),
    Dist = config:get_sys_config(team_mon_drop_dist),
    RoleList = lib_team_agent:get_team_role(TeamID),
    send_team_drop(RoleList, SceneType, Dist, MonX, MonY, DropID, MID).

send_team_drop([], _SceneType, _Dist, _MonX, _MonY, _DropID, _MID) ->
    ok;
send_team_drop([RoleID | T], SceneType, Dist, MonX, MonY, DropID, MID) ->
    Role = lib_scene_agent:get_roler(RoleID),
    #scene_role{id = RoleID, x = RoleX, y = RoleY} = Role,
    Drop = if
        SceneType =:= ?SCENE_MAINCITY orelse SceneType =:= ?SCENE_OUTSIDE ->
            util:in_distance(RoleX, RoleY, MonX, MonY, Dist);
        true ->
            true
    end,
    Drop andalso begin
        lib_drop_api:give_drop_asyn(RoleID, DropID, ?OPT_MON_DROP),
        lib_role:mod_info(RoleID, lib_role_kill_mon_exp, {mon_exp, MID})
    end,
    send_team_drop(T, SceneType, Dist, MonX, MonY, DropID, MID).

kill_mon_event(_KillerKey, _Attackers, _SceneId, SceneType, _MonId)
    when SceneType >= ?SCENE_CLUSTER_BOUNDARY ->
    ignore;
kill_mon_event(_Killer, Attackers, SceneId, ?SCENE_OUTSIDE, MonId) ->
    RoleIds = calc_role_ids(Attackers, sets:new()),
    [
        lib_role:info_role(RoleId, {'kill_mon', SceneId, MonId})
        || RoleId <- RoleIds
    ];
kill_mon_event(KillerKey, _Attackers, SceneId, _SceneType, MonId) ->
    RoleId = lib_obj_util:get_owner_id(KillerKey),
    RoleId =/= 0 andalso lib_role:info_role(RoleId, {'kill_mon', SceneId, MonId}).

calc_role_ids([AtterKey | Rest], RoleIdSet) ->
    RoleIdSetN = case lib_obj_util:get_owner_id(AtterKey) of
        0 -> RoleIdSet;
        RoleId -> sets:add_element(RoleId, RoleIdSet)
    end,
    calc_role_ids(Rest, RoleIdSetN);
calc_role_ids([], RoleIdSet) ->
    sets:to_list(RoleIdSet).
