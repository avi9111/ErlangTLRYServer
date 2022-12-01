%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     领地战
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_territory_battle).
-author("Ryuu").

-include("common.hrl").
-include("activity.hrl").
-include("ret_code.hrl").
-include("territory.hrl").
-include("proto/prot_311.hrl").

%% API
-export([
    init/1,
    loop/2,
    coll_fin/1,
    get_rank/1,
    beat_drum/4,
    hurt_role/2,
    heal_role/2,
    kill_role/2,
    settle_up/1,
    role_enter/1,
    occupy_room/2
]).


init([LineID]) ->
    svr_timer:register(),
    SceneID = lib_territory_mgr:battle_scene(),
    {_, LinePid} = svr_scene_mgr:add_scene_line(SceneID, LineID),
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    #{roles := Roles} = RoomInfo,
    init_roles(Roles, SceneID, LineID),
    #{id => LineID, line_id => LineID, line_pid => LinePid, stage => ?TERRITORY_STAGE_BATTLE}.

init_roles([], _SceneID, _LineID) ->
    ok;
init_roles([RoleID | T], SceneID, LineID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{camp_id := CampID} = RoleData,
    {X, Y} = lib_territory_mgr:born_pos(CampID),
    Opts = [{realm, CampID}],
    lib_scene_api:change_scene_async(RoleID, SceneID, LineID, X, Y, Opts),
    init_roles(T, SceneID, LineID).

settle_up(State) ->
    #{id := LineID} = State,
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    settle_up(RoomInfo, 0),
    State#{stage => ?TERRITORY_STAGE_SETTLED}.

settle_up(#{finish := true, winner := Winner, key := LineID} = RoomInfo, _) ->
    svr_territory_mgr:upload_result(LineID, RoomInfo, Winner),
    Winner;
settle_up(RoomInfo, Winner) ->
    svr_timer:unregister(),
    #{key := LineID, id := RoomID, guilds := Guilds} = RoomInfo,
    NewRoomInfo = RoomInfo#{finish => true, winner => Winner},
    lib_territory_mgr:set_room_info(LineID, NewRoomInfo),
    Guilds1 = [{CampID, GuildID} || {CampID, GuildID} <- Guilds, GuildID > 0],
    room_settle_rumor(?TERRITORY_CAMPS, RoomID, Guilds1, Winner),
    svr_scene_mgr:close_line(lib_territory_mgr:battle_scene(), LineID),
    svr_territory_mgr:upload_result(LineID, NewRoomInfo, Winner),
    Winner.

room_settle_rumor(_, _RoomID, Guilds, _Winner) when length(Guilds) < 2 ->
    ignore;
room_settle_rumor(_, _RoomID, _Guilds, 0) ->
    ok;
room_settle_rumor([], _RoomID, _Guilds, _Winner) ->
    ok;
room_settle_rumor([CampID | T], RoomID, Guilds, Winner) ->
    OppoCamp = lib_territory_mgr:oppo_camp(CampID),
    GuildID = util:prop_get_value(CampID, Guilds, 0),
    OppoGuild = util:prop_get_value(OppoCamp, Guilds, 0),
    RoomName = conf_territory_room:get_name(RoomID),
    OppoName = lib_guild:get_guild_name(OppoGuild),
    case CampID =:= Winner of
        true ->
            Rumor = config:get_sys_config(territory_room_win_rumor);
        _ ->
            Rumor = config:get_sys_config(territory_room_lose_rumor)
    end,
    svr_rumor:publish({guild, GuildID}, Rumor, [RoomName, OppoName]),
    room_settle_rumor(T, RoomID, Guilds, Winner).

loop(State, Now) ->
    #{id := LineID} = State,
    if
        Now rem 5 =:= 1 ->
            refresh_rank(LineID);
        true ->
            ignore
    end.

refresh_rank(LineID) ->
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    #{roles := Roles} = RoomInfo,
    RoleList = sort_data(lists:map(fun lib_territory_mgr:get_role_data/1, Roles)),
    RankList = assign_rank(RoleList, 1, []),
    NewRoomInfo = RoomInfo#{rank_list => RankList},
    lib_territory_mgr:set_room_info(LineID, NewRoomInfo).

sort_data(RoleList) ->
    Fun = fun(RoleA, RoleB) ->
        #{score := ScoreA, kill := KillA, time := TimeA} = RoleA,
        #{score := ScoreB, kill := KillB, time := TimeB} = RoleB,
        util:cmp([{ScoreA, ScoreB}, {KillA, KillB}, {TimeB, TimeA}])
    end,
    lists:sort(Fun, RoleList).

assign_rank([], _Rank, Acc) ->
    lists:reverse(Acc);
assign_rank([Data | T], Rank, Acc) ->
    #{id := RoleID, name := Name, score := Score, kill := Kill} = Data,
    assign_rank(T, Rank + 1, [{Rank, RoleID, Name, Kill, Score} | Acc]).

hurt_role(RoleID, Hp) ->
    add_hurt_score(RoleID, Hp).

heal_role(RoleID, Hp) ->
    add_hurt_score(RoleID, Hp).

add_hurt_score(RoleID, Hp) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{score := Score} = RoleData,
    NewData = RoleData#{score => Score + Hp},
    lib_territory_mgr:set_role_data(RoleID, NewData).

kill_role(RoleID, _TargetID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{kill := Kill} = RoleData,
    NewKill = Kill + 1,
    NewData = RoleData#{kill => NewKill},
    lib_territory_mgr:set_role_data(RoleID, NewData).

coll_fin(RoleID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{line_id := LineID, camp_id := CampID} = RoleData,
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    Now = time:unixtime(),
    #{flag_r := RFlag} = RoomInfo,
    util:cancel_timer(RFlag),
    Ref = erlang:make_ref(),
    TRef = erlang:send_after(?OCCUPY_TIME * 1000, self(), {occupy_room, LineID, Ref}),
    NewRoomInfo = RoomInfo#{flag => CampID, occupy => Now, flag_r => TRef, occupy_r => Ref},
    lib_territory_mgr:set_room_info(LineID, NewRoomInfo),
    Rec = #sc_territory_notify_flag{flag = CampID, occupy = Now},
    {ok, Bin} = prot_msg:encode_msg(31134, Rec),
    lib_scene_api:send_to_scene(lib_territory_mgr:battle_scene(), LineID, Bin),
    ok.

occupy_room(LineID, Ref) ->
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    case RoomInfo of
        #{finish := Fin, flag := CampID, occupy_r := ORef}
            when Fin =/= true andalso Ref =:= ORef ->
            settle_up(RoomInfo, CampID);
        _ ->
            ignore
    end.

role_enter(RoleID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{line_id := LineID, camp_key := CampKey} = RoleData,
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    #{flag := Flag, occupy := Occupy, guilds := Guilds} = RoomInfo,
    CampInfo = lib_territory_mgr:get_camp_info(CampKey),
    #{drums := Drums} = CampInfo,
    Rec = #sc_territory_scene_battle{
        flag = Flag, occupy = Occupy, drums = Drums,
        camps = convert_camp_guilds(Guilds, [])
    },
    {ok, Bin} = prot_msg:encode_msg(31132, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

convert_camp_guilds([], Acc) ->
    Acc;
convert_camp_guilds([{CampID, GuildID} | T], Acc) ->
    Name = lib_guild:get_guild_name(GuildID),
    convert_camp_guilds(T, [{CampID, GuildID, Name} | Acc]).

beat_drum(State, RoleID, Type, BuffLv) ->
    #{line_pid := LinePid} = State,
    case catch check_beat_drum(RoleID, Type) of
        {ok, CampKey, CampInfo, Roles, BuffID} ->
            lib_territory_mgr:set_camp_info(CampKey, CampInfo),
            notify_drum(CampKey, CampInfo),
            [lib_scene_api:add_role_effect(LinePid, RID, BuffID, BuffLv) || RID <- Roles],
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_beat_drum(RoleID, ID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{camp_key := CampKey} = RoleData,
    CampInfo = lib_territory_mgr:get_camp_info(CampKey),
    #{drums := Drums, roles := Roles} = CampInfo,
    ConfDrum = conf_territory_drum:get(ID),
    ConfDrum =/= undefined orelse erlang:throw({error, ?RC_TERRITORY_DRUM_NOT_FOUND}),
    #{buff := BuffID} = ConfDrum,
    lists:member(ID, Drums) andalso erlang:throw({error, ?RC_TERRITORY_DRUM_BEAT}),
    NewCampInfo = CampInfo#{drums => [ID | Drums]},
    {ok, CampKey, NewCampInfo, Roles, BuffID}.

notify_drum(_CampKey, CampInfo) ->
    #{id := CampID, drums := Drum, line_id := LineID} = CampInfo,
    Rec = #sc_territory_notify_drum{
        camp = CampID, drums = Drum
    },
    {ok, Bin} = prot_msg:encode_msg(31135, Rec),
    lib_scene_api:send_to_scene(lib_territory_mgr:battle_scene(), LineID, Bin),
    ok.

get_rank(RoleID) ->
    RoleData = lib_territory_mgr:get_role_data(RoleID),
    #{line_id := LineID} = RoleData,
    RoomInfo = lib_territory_mgr:get_room_info(LineID),
    #{rank_list := RankList} = RoomInfo,
    Rec = #sc_territory_rank{ranks = RankList},
    {ok, Bin} = prot_msg:encode_msg(31120, Rec),
    lib_role_send:send_to_role(RoleID, Bin).
