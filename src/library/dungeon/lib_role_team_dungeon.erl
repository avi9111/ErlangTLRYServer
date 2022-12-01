%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     组队副本
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_team_dungeon).
-author("Ryuu").

-include("role.hrl").
-include("ret_code.hrl").
-include("dungeon.hrl").
-include("activity.hrl").
-include("keyvalue.hrl").
-include("proto/prot_252.hrl").


-export([
    enter/2,
    get_member_status/2
]).

enter(PS, DungID) ->
    case catch check_create(PS, DungID) of
        {true, RoleID, Members, ConfDungLv} ->
            case sup_dungeon:start_child([Members, RoleID, 1, ConfDungLv, []]) of
                {ok, _} ->
                    Rec = #sc_dung_enter_team{dung_id = DungID},
                    {ok, Bin} = prot_msg:encode_msg(25224, Rec),
                    lib_role_send:send_to_role(PS, Bin);
                Err ->
                    ?ERROR("start dung error ~w", [Err])
            end;
        {false, Status} ->
            Rec = #sc_dung_team_status{status = Status},
            {ok, Bin} = prot_msg:encode_msg(25229, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_create(PS, DungID) ->
    #role_state{id = RoleID, team_id = TeamID, guild_id = GuildID} = PS,
    ConfDung = conf_dungeon:get(DungID),
    #{mem_num := MinNum, type := DungType} = ConfDung,
    lib_dungeon_util:is_team_dung(DungID) orelse erlang:throw({error, ?RC_DUNG_NOT_TEAM_DUNG}),
    TeamInfo = lib_team:get_team_info(TeamID),
    TeamInfo =/= undefined orelse erlang:throw({error, ?RC_TEAM_HAVE_NO_TEAM}),
    #{members := Members, leader := Leader, mem_num := MemNum, robots := Robots} = TeamInfo,
    RoleID =:= Leader orelse erlang:throw({error, ?RC_TEAM_LEADER_CAN_OPERATE}),
    AllowRobotDungIds = config:get_sys_config(dung_allow_robot),
    Robots =:= [] orelse lists:member(DungID, AllowRobotDungIds) orelse erlang:throw({error, ?RC_TEAM_HAVE_ROBOTS}),
    MemNum + length(Robots) >= MinNum orelse erlang:throw({error, ?RC_DUNG_MEM_NUM_LIMIT}),
    IsHeroDung = lists:member(DungID, ?HERO_DUNG_ID_LIST),
    if
        DungType =:= ?DUNG_TEAM_CHESSBOARD ->
            lib_activity:is_ongoing(?ACT_ID_CHESSBOARD) orelse erlang:throw({error, ?RC_ACTIVITY_NOT_GOING});
        DungType =:= ?DUNG_TEAM_SH ->
            GuildID > 0 andalso check_guild_team_dung(DungID, GuildID, Members),
            Robots =:= [] orelse erlang:throw({error, ?RC_TEAM_HAVE_ROBOTS});
        IsHeroDung ->
            svr_hero_dungeon:today_hero_dung_id() =:= DungID orelse erlang:throw({error, ?RC_INVALID_ARGS});
        true ->
            skip
    end,
    {Status, TotalLv} = collect_member_status([PS | lists:delete(RoleID, Members)], ConfDung, [], 0),
    case check_status(Status) of
        {true, Roles} ->
            AvgLv = erlang:floor(TotalLv / MemNum),
            ConfDungTeam = conf_dungeon_team:get({DungID, AvgLv}),
            #{dung_lv := DungLv} = ConfDungTeam,
            ConfDungLv = conf_dungeon_lv:get({DungID, DungLv}),
            ConfDungLv =/= undefined orelse erlang:throw({error, ?RC_DUNG_LEVEL_NOT_FOUND}),
            {true, RoleID, Roles, ConfDungLv};
        _ ->
            {false, Status}
    end.

check_guild_team_dung(DungID, GuildID, Members) ->
    Res = lists:all(fun(RoleID) ->
        lib_cache:get_role_guild(RoleID) =:= GuildID
    end, Members),
    Res orelse erlang:throw({error, ?RC_DUNG_NEED_GUILD_MEMBER}),
    CurDungID = lib_guild:get_cur_dung_id(GuildID),
    CurDungID =:= DungID orelse erlang:throw({error, ?RC_DUNG_PREV_NOT_PASS}),
    ok.

collect_member_status([], _ConfDung, SAcc, LAcc) ->
    {SAcc, LAcc};
collect_member_status([Role | T], ConfDung, SAcc, LAcc) ->
    case catch (
        case is_record(Role, role_state) of
            true -> get_member_status(Role, ConfDung);
            _ -> lib_role:apply_call3(Role, {?MODULE, get_member_status, [ConfDung]})
        end
    ) of
        {ok, Status, Level} ->
            collect_member_status(T, ConfDung, [Status | SAcc], Level + LAcc);
        offline ->
            Name = lib_cache:get_role_name(Role),
            Status = {Role, Name, 0, 0, 0, 0, 0, 0},
            collect_member_status(T, ConfDung, [Status | SAcc], LAcc);
        _ ->
            erlang:throw({error, ?RC_DUNG_ENTER_FAIL})
    end.

get_member_status(PS, ConfDung) ->
    #role_state{id = RoleID, name = Name, role_scene = RoleScene, level = RoleLv,
        hp = Hp, stat = Stat} = PS,
    #{id := DungID, npc := NpcID, enter_lv := EnterLv, chal_times := MaxChalTimes,
        assist_times := MaxAssistTimes} = ConfDung,
    NearNpc = ?iif(NpcID > 0, lib_scene_api:is_nearby_npc(RoleScene, [NpcID]), true),
    Distance = ?iif(NearNpc, 1, 0),
    Level = ?iif(RoleLv >= EnterLv, 1, 0),
    case lib_dungeon_util:is_sh_team_dung(DungID) of
        true ->
            DungInfo = lib_role_dungeon:get_dung_info(RoleID, ?DUNG_ID_SH_1);
        _ ->
            DungInfo = lib_role_dungeon:get_dung_info(RoleID, DungID)
    end,
    #{chal_times := ChalTimes, assist_times := AssistTimes} = DungInfo,
    RoleData = lib_team:get_role_data(RoleID),
    #{assist := DungMode} = RoleData,
    Alive = ?iif(Hp > 0, 1, 0),
    if
        DungMode =:= 0 andalso ChalTimes < MaxChalTimes ->
            Assist = 0, Times = 1;
        DungMode =:= 0 andalso AssistTimes < MaxAssistTimes ->
            Assist = 1, Times = 1;
        DungMode =:= 0 ->
            Assist = 1, Times = 0;
        AssistTimes < MaxAssistTimes ->
            Assist = 1, Times = 1;
        true ->
            Assist = 1, Times = 0
    end,
    case bit_map:is_set(?SPEC_STAT_BIT_HANGING, Stat) of
        false ->
            Status = {RoleID, Name, Distance, Level, Assist, Times, Alive, 1};
        _ ->
            Status = {RoleID, Name, 0, 0, 0, 0, 0, 0}
    end,
    {ok, Status, RoleLv}.

check_status(L) ->
    check_status(L, [], 0).

check_status([], _Acc, 0) ->
    false;
check_status([], Acc, _TAcc) ->
    {true, Acc};
check_status([Status | T], Acc, TAcc) ->
    {RoleID, _Name, Distance, Level, Assist, Times, Alive, Online} = Status,
    case Level > 0 andalso Distance > 0 andalso Alive > 0 andalso Times > 0
        andalso Online > 0 of
        false ->
            false;
        _ ->
            NewAcc = [?dungeon_enter#{role_id => RoleID, assist => Assist > 0} | Acc],
            NewTAcc = ?iif(Assist =:= 0, TAcc + 1, TAcc),
            check_status(T, NewAcc, NewTAcc)
    end.
