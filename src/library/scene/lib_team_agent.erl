%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     队伍
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_team_agent).
-author("Ryuu").

-include("scene_objs.hrl").
-include("proto/prot_420.hrl").

%% API
-export([
    is_team_near/4,
    send_to_team/2,
    get_role_team/1,
    get_team_role/1,
    get_team_info/1,
    get_scene_team/0
]).

%% Internal
-export([
    member_enter/2,
    member_leave/1,
    sync_team_hp/2,
    set_role_team/2,
    sync_team_pos/1,
    join_team_sync/1,
    set_team_follow/2,
    sync_team_speed/2,
    update_team_info/1
]).

%% @doc 发给同场景的队伍玩家
send_to_team(0, _Bin) ->
    ok;
send_to_team(TeamID, Bin) ->
    lib_scene_agent:send_to_scene_role(get_team_role(TeamID), Bin).

%% 是否全部队员在到齐
is_team_near(Member, X, Y, Dist) ->
    lists:all(fun(RoleID) ->
        case lib_scene_agent:get_roler(RoleID) of
            #scene_role{x = RX, y = RY} ->
                lib_battle_chk:check_distance({RX, RY}, {X, Y}, Dist);
            _ ->
                false
        end
    end, Member).

% @doc 加入队伍同步
join_team_sync(SceneRole) ->
    #scene_role{id = RoleID, team = TeamID} = SceneRole,
    Members = get_team_role(TeamID),
    Bin = collect_mem_data(lists:delete(RoleID, Members), <<>>),
    lib_role_send:send_to_role(SceneRole, Bin),
    sync_team_hp(SceneRole, true),
    sync_team_pos(SceneRole),
    sync_team_speed(RoleID, TeamID).

collect_mem_data([], Acc) ->
    Acc;
collect_mem_data([RoleID | T], Acc) ->
    case lib_scene_agent:get_roler(RoleID) of
        #scene_role{x = X, y = Y} = SceneRole ->
            Bin1 = lib_team:scene_attr(SceneRole),
            Bin2 = make_pos_bin(RoleID, X, Y),
            collect_mem_data(T, <<Bin1/binary, Bin2/binary, Acc/binary>>);
        _ ->
            collect_mem_data(T, Acc)
    end.

sync_team_hp(#scene_role{team = 0}, _) ->
    ignore;
sync_team_hp(SceneRole, Inst) ->
    #scene_role{id = RoleID, team = TeamID, hp = Hp} = SceneRole,
    util:action_limit({RoleID, sync_team_hp}, 1, fun() ->
        Bin = lib_team:scene_attr(SceneRole),
        send_to_team(TeamID, Bin)
    end, Inst orelse Hp =:= 0).

sync_team_pos(#scene_role{team = TeamID} = SceneRole) when TeamID > 0 ->
    #scene_role{id = RoleID, x = X, y = Y} = SceneRole,
    util:action_limit({RoleID, sync_team_pos}, 2, fun() ->
        send_to_team(TeamID, make_pos_bin(RoleID, X, Y))
    end);
sync_team_pos(_SceneRole) ->
    ignore.

make_pos_bin(RoleID, X, Y) ->
    Rec = #sc_team_sync_pos{role_id = RoleID, x = X, y = Y},
    {ok, Bin} = prot_msg:encode_msg(42065, Rec),
    Bin.

sync_team_speed(RoleID, TeamID) ->
    Roles = get_team_role(TeamID),
    sync_team_speed2(Roles, RoleID).

sync_team_speed2([], _RoleID) ->
    ok;
sync_team_speed2([MemID | T], RoleID) ->
    case lib_scene_agent:get_roler(MemID) of
        #scene_role{follow = Follow} when Follow =:= RoleID, MemID =/= RoleID ->
            set_team_follow(MemID, Follow);
        _ ->
            ignore
    end,
    sync_team_speed2(T, RoleID).

set_team_follow(RoleID, Follow) when is_integer(RoleID) ->
    set_team_follow(lib_scene_agent:get_roler(RoleID), Follow);
set_team_follow(#scene_role{} = SceneRole, Follow) ->
    #scene_role{attr = Attr, bt_attr = BtAttr, peffect_attr = PEffectAttr, effect_list = EffectList} = SceneRole,
    BtAttrT = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),

    SceneRole1 = SceneRole#scene_role{follow = Follow, bt_attr = BtAttrT},
    MoveSpeedN = lib_obj_role:recalc_move_speed(SceneRole1, BtAttr#bt_attr.move_speed),
    BtAttrN = (SceneRole1#scene_role.bt_attr)#bt_attr{move_speed = MoveSpeedN},
    SceneRoleN = SceneRole1#scene_role{bt_attr = BtAttrN},

    lib_scene_agent:put_roler(SceneRoleN);
set_team_follow(_, _) ->
    ignore.

member_enter(Role, #{id := TeamID} = TeamInfo) ->
    update_team_info(TeamInfo),
    join_team(Role, TeamID);
member_enter(_Role, _TeamInfo) ->
    ignore.

member_leave(#scene_role{id = RoleID, team = TeamID} = Role) when TeamID > 0 ->
    leave_team(Role, TeamID),
    lib_team_agent:sync_team_speed(RoleID, TeamID),
    erlang:erase({RoleID, sync_team_hp}),
    erlang:erase({RoleID, sync_team_pos});
member_leave(_Role) ->
    ignore.

set_role_team(RoleID, TeamInfo) when is_integer(RoleID) ->
    Role = lib_scene_agent:get_roler(RoleID),
    set_role_team(Role, TeamInfo);
set_role_team(Role, TeamInfo) when is_record(Role, scene_role) ->
    update_team_info(TeamInfo),
    #scene_role{id = RoleID, team = OTeamID} = Role,
    #{id := NTeamID} = TeamInfo,
    Role = lib_scene_agent:get_roler(RoleID),
    NewRole = Role#scene_role{team = NTeamID},
    lib_scene_agent:put_roler(NewRole),
    if
        NTeamID =:= OTeamID -> ignore;
        NTeamID > 0 -> join_team(NewRole, NTeamID);
        true -> leave_team(NewRole, OTeamID)
    end;
set_role_team(_Role, _TeamInfo) ->
    ignore.

%% #{id, members, online}
update_team_info(#{id := TeamID, version := IVersion} = TeamInfo) when TeamID > 0 ->
    case get_team_info(TeamID) of
        #{version := CVersion} when IVersion =< CVersion ->
            ignore;
        #{online := Online} ->
            set_team_info(TeamID, TeamInfo#{online => Online});
        _ ->
            set_team_info(TeamID, TeamInfo#{online => []})
    end;
update_team_info(_) ->
    ignore.

join_team(Role, TeamID) ->
    #scene_role{id = RoleID} = Role,
    TeamInfo = get_team_info(TeamID),
    #{online := Online} = TeamInfo,
    NewOnline = [RoleID | lists:delete(RoleID, Online)],
    set_team_info(TeamID, TeamInfo#{online => NewOnline}),
    join_team_sync(Role).

leave_team(Role, TeamID) ->
    #scene_role{id = RoleID} = Role,
    TeamInfo = get_team_info(TeamID),
    #{online := Online} = TeamInfo,
    case lists:delete(RoleID, Online) of
        [] -> del_team_info(TeamID);
        L -> set_team_info(TeamID, TeamInfo#{online => L})
    end.

get_role_team(RoleID) ->
    case lib_scene_agent:get_roler(RoleID) of
        #scene_role{team = TeamID} -> TeamID;
        _ -> 0
    end.

get_team_role(TeamID) ->
    case get_team_info(TeamID) of
        #{online := Online} -> Online;
        _ -> []
    end.

get_scene_team() ->
    [TeamInfo || {{team, _TeamID}, TeamInfo} <- erlang:get()].

get_team_info(TeamID) ->
    erlang:get({team, TeamID}).

set_team_info(TeamID, TeamInfo) ->
    erlang:put({team, TeamID}, TeamInfo).

del_team_info(TeamID) ->
    erlang:erase({team, TeamID}).
