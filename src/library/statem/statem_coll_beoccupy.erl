%%-------------------------------------------------------
%% @File     : statem_coll_beoccupy.erl
%% @Brief    : 采集物被占领状态
%% @Author   : cablsbs
%% @Date     : 2018-9-11
%%-------------------------------------------------------
-module(statem_coll_beoccupy).

-include("scene.hrl").
-include("op_type.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------

state_enter([[RoleID | _]], #coll{type = ?COLL_TERRITORY, cid = CId} = State) ->
    #scene_role{realm = Realm} = lib_scene_agent:get_roler(RoleID),
    #{drop_id := DropId} = conf_coll:get(State#coll.cid),
    coll_event(RoleID, CId, DropId),
    svr_territory_battle:coll_fin(?SCENE_ID, ?LINE_ID, RoleID),
    State#coll{realm = Realm};
state_enter([RoleIds], #coll{type = ?COLL_SHARING, cid = CId} = State) ->
    #{drop_id := DropId} = conf_coll:get(State#coll.cid),
    [coll_event(RoleId, CId, DropId) || RoleId <- RoleIds],
    State;
state_enter([[RoleId]], #coll{type = ?COLL_MONOPOLY, disappear = IsDisappear, cid = CId} = State) ->
    #{drop_id := DropId} = conf_coll:get(State#coll.cid),
    coll_event(RoleId, CId, DropId),
    SceneId = ?SCENE_ID,
    lib_scene_catch_pet:coll_end(SceneId, CId, RoleId),
    if
        IsDisappear ->
            State;
        true ->
            #scene_role{name = RoleName} = lib_scene_agent:get_roler(RoleId),
            StateN = State#coll{belonger = #{id => RoleId, name => RoleName}},
            lib_obj_coll:bcast_state_change(StateN),
            StateN
    end.

state_update(_NowTimeMS, _ElapseTime, State) ->
    State.

state_quit(State) ->
    State.

%% Privates ---------------------------------------------

coll_event(RoleId, CId, DropId) ->
    % 更新当前采集
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{collecting = Collecting} = SceneRole,
    SceneRoleN = SceneRole#scene_role{collecting = 0},
    lib_scene_agent:put_roler(SceneRoleN),
    lib_drop_api:give_drop_asyn(RoleId, DropId, ?OPT_COLLECT),
    case ?SCENE_TYPE < ?SCENE_CLUSTER_BOUNDARY of
        true ->
            Quick = maps:get(quick, Collecting, false),
            lib_role:info_role(RoleId, {'coll_collect', #{scene => ?SCENE_ID, id => CId, quick => Quick}});
        _ ->
            ok
    end.
