%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     镜湖剿匪场景内逻辑
%%% @end
%%% Created : 05. 十一月 2018 15:39
%%%-------------------------------------------------------------------
-module(lib_scene_lake).

-include("scene.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("lake_bandits.hrl").
-include("proto/prot_513.hrl").

-define(LAKE_MON_TYPE_DRAGON, 1).   %% 大龙
-define(LAKE_MON_TYPE_LDRAGON, 2).  %% 小龙

%% API
-export([
    role_die/4,
    filter_target/4,
    mon_check/2,
    mon_die/4,
    add_dragon_buff/2,
    send_mon_info/1
]).

add_dragon_buff(MID, BuffID) ->
    set_dragon_mid(MID),
    Key = {?BATTLE_MON, MID},
    lib_effect_util:add_effect(Key, Key, {BuffID, 1}).

%% 玩家死亡
role_die(?SCENE_ID_LAKE_BANDITS, RoleID, X, Y) ->
    #{trace_range := Dist} = conf_lake_bandits_info:get(),
    MonList = lib_mon_agent:get_scene_mons_by_area(X, Y, Dist),
    Fun = fun(Mon) ->
        #mon{id = MID, harm_map = HarmMap} = Mon,
        NewHarmMap = maps:put({?BATTLE_ROLE, RoleID}, 0, HarmMap),
        lib_mon_agent:update_mon(MID, [{#mon.harm_map, NewHarmMap}])
    end,
    lists:foreach(Fun, MonList);
role_die(_, _, _, _) ->
    skip.

%% 判断是否能攻击大龙
filter_target(MInfo, AtterLv, MonLv, RoleID) ->
    MTypeID = maps:get(mid, MInfo, 0),
    DragonIDList = conf_lake_bandits_mon:get_dragon_ids(),
    IsDragon = lists:member(MTypeID, DragonIDList),
    LDragonList = conf_lake_bandits_mon:get_little_dragon_ids(),
    IsLDragon = lists:keymember(MTypeID, 1, LDragonList),
    if
        IsDragon ->
            ClamIDs = conf_lake_bandits_mon:get_clam_ids(),
            FDragonIDs = conf_lake_bandits_mon:get_flood_dragon_ids(),
            Res = lib_mon_agent:get_scene_mon_num_by_mids(FDragonIDs ++ ClamIDs) > 0,
            Res andalso ?ERROR_TOC(RoleID, ?RC_LAKE_BANDITS_BOSS_CANNOT_ATTACK),
            not Res;
        IsLDragon andalso (AtterLv < MonLv) ->
            ?ERROR_TOC(RoleID, ?RC_LAKE_BANDITS_LV_NOT_ENOUGH),
            false;
        true ->
            true
    end.

%% 怪物归属者检测
mon_check(?SCENE_ID_LAKE_BANDITS, #mon{id = MID, mid = MTypeID, x = X, y = Y, last_beatt_time = LastTime} = Mon) ->
    #{trace_range := Dist} = conf_lake_bandits_info:get(),
    AreaRoles = lib_scene_agent:get_scene_roler_fields_dist([#scene_role.id, #scene_role.hp], X, Y, Dist),
    IsTimeOut = (time:unixtime_ms() - LastTime > 20 * 1000),
    InitHp = lib_scene_api:get_mon_hp(MTypeID),
    case IsTimeOut of
        true -> %% 超过10秒没有被攻击,回满血
            Mon#mon{harm_map = maps:new(), hp = InitHp};
        _ ->
            #mon{harm_map = HarmMap, hp = Hp} = Mon,
            NewHarmList = merge_harm_list(HarmMap, AreaRoles, true),
            #{calc_belong_hp_perc := CalcHpPerc} = conf_lake_bandits_info:get(),
            calc_belong_and_notify(MID, NewHarmList, erlang:floor(Hp / InitHp * 100), CalcHpPerc),
            NewHarmMap = maps:from_list(NewHarmList),
            Mon#mon{harm_map = NewHarmMap}
    end;
mon_check(_, Mon) ->
    Mon.

%% 怪物死亡
mon_die(?SCENE_ID_LAKE_BANDITS, MTypeID, HarmMap, FirstAtt) ->
    DragonIDList = conf_lake_bandits_mon:get_dragon_ids(),
    WorldLv = util_svr:get_world_lv(),
    svr_lake_bandits:mon_die(?SCENE_ID_LAKE_BANDITS, ?LINE_ID, MTypeID),
    IsDargon = lists:member(MTypeID, DragonIDList),
    maybe_del_dragon_buff(IsDargon),
    case IsDargon of
        true ->
            HarmList = merge_harm_list(HarmMap, [], false),
            SortFun = fun({_, V1}, {_, V2}) -> V1 > V2 end,
            [{{_, RoleID}, _} | _] = lists:sort(SortFun, HarmList),
            svr_rumor:publish(world, 20602, [lib_cache:get_role_name(RoleID)]),
            #{dragon_reward := DropID} = conf_lake_bandits_mon:get(WorldLv),
            maybe_team_send(RoleID, 1101, DropID);
        _ ->
            DropID = calc_reward(WorldLv, MTypeID),
            maybe_team_send(FirstAtt, 1102, DropID)
    end;
mon_die(_, _, _, _) ->
    skip.

%% 删除大龙BUFF
maybe_del_dragon_buff(false) ->
    ClamIDs = conf_lake_bandits_mon:get_clam_ids(),
    FDragonIDs = conf_lake_bandits_mon:get_flood_dragon_ids(),
    Res = (lib_mon_agent:get_scene_mon_num_by_mids(FDragonIDs ++ ClamIDs) - 1) =:= 0,
    #{dragon_buff := DragonBuff} = conf_lake_bandits_info:get(),
    MID = get_dragon_mid(),
    Res andalso lib_effect_util:del_by_effect_ids({?BATTLE_MON, MID}, [DragonBuff]);
maybe_del_dragon_buff(true) ->
    skip.

%% 同步大小龙位置
send_mon_info(?SCENE_ID_LAKE_BANDITS) ->
    AllMons = lib_mon_agent:get_scene_mon_fields([#mon.mid, #mon.x, #mon.y, #mon.level]),
    DragonIDList = conf_lake_bandits_mon:get_dragon_ids(),
    LDragonList = conf_lake_bandits_mon:get_little_dragon_ids(),
    MonInfo =
        lists:foldl(fun([Mid, MX, MY, MLv], Acc) ->
            IsDragon = lists:member(Mid, DragonIDList),
            IsLDragon = lists:keymember(Mid, 1, LDragonList),
            if
                IsDragon ->
                    [{?LAKE_MON_TYPE_DRAGON, MX, MY, MLv} | Acc];
                IsLDragon ->
                    [{?LAKE_MON_TYPE_LDRAGON, MX, MY, MLv} | Acc];
                true ->
                    Acc
            end
    end, [], AllMons),
    Rec = #sc_lake_bandits_dragon_info{info = MonInfo},
    {ok, Bin} = prot_msg:encode_msg(51317, Rec),
    lib_scene_agent:send_to_local_scene(Bin),
    ok;
send_mon_info(_) ->
    skip.
%%======================data=====================
maybe_team_send(RoleID, MailID, DropID) ->
    TeamID = lib_team_agent:get_role_team(RoleID),
    case TeamID > 0 of
        true ->
            Members = lib_team_agent:get_team_role(TeamID),
            lists:foreach(fun(TRoleID) ->
                svr_mail:sys2p(TRoleID, MailID, DropID, ?OPT_LAKE_BANDITS)
            end, Members);
        _ ->
            svr_mail:sys2p(RoleID, MailID, DropID, ?OPT_LAKE_BANDITS)
    end.

%% 计算奖励
calc_reward(WorldLv, MTypeID) ->
    ClamIDs = conf_lake_bandits_mon:get_clam_ids(),
    FloodDragonIDs = conf_lake_bandits_mon:get_flood_dragon_ids(),
    #{
        clam_reward := ClamReward,
        flood_dragon_reward := FDragonReward,
        little_dragon_reward := LDragonreward
    } = conf_lake_bandits_mon:get(WorldLv),
    IsClam = lists:member(MTypeID, ClamIDs),
    IsFDragon = lists:member(MTypeID, FloodDragonIDs),
    if
        IsClam ->
            ClamReward;
        IsFDragon ->
            FDragonReward;
        true ->
            LDragonreward
    end.

%% 检测归属者或者造成伤害玩家是否在附近并且存活
judge(RoleID, AreaRoles) ->
    lists:any(fun([ID, Hp]) ->
        RoleID =:= ID andalso Hp > 0
    end, AreaRoles).

%% 计算伤害列表
merge_harm_list(HarmMap, AreaRoles, NeedJudge) ->
    HarmList = maps:to_list(HarmMap),
    lists:foldl(fun({{ObjType, ObjID}, Harm} = Data, Acc) ->
        case ObjType of
            ?BATTLE_ROLE ->
                case (not NeedJudge) orelse judge(ObjID, AreaRoles) of
                    true ->
                        case lists:keyfind({ObjType, ObjID}, 1, Acc) of
                            {_, OldHarm} ->
                                lists:keystore({ObjType, ObjID}, 1, Acc, {{ObjType, ObjID}, Harm + OldHarm});
                            _ ->
                                [Data | Acc]
                        end;
                    _ ->
                        Acc
                end;
            ?BATTLE_PET ->
                OwnerID = lib_pet_agent:get_scene_pet_owner(ObjID),
                case (not NeedJudge) orelse judge(OwnerID, AreaRoles) of
                    true ->
                        case lists:keyfind({?BATTLE_ROLE, OwnerID}, 1, Acc) of
                            {_, OldHarm} ->
                                lists:keystore({?BATTLE_ROLE, OwnerID}, 1, Acc, {{?BATTLE_ROLE, OwnerID}, Harm + OldHarm});
                            _ ->
                                [Data | Acc]
                        end;
                    _ ->
                        Acc
                end;
            _ ->
                Acc
        end
    end, [], HarmList).

%% 计算归属者
calc_belong_and_notify(MID, HarmList, HpPerc, CalcHpPerc) when HpPerc >= CalcHpPerc orelse HarmList =:= [] -> %% 超过百分之75的血量没有归属者
    notify(MID, 0);
calc_belong_and_notify(MID, HarmList, _, _) ->
    SortFun = fun({_, V1}, {_, V2}) -> V1 > V2 end,
    [{{_, RoleID}, _} | _] = lists:sort(SortFun, HarmList),
    notify(MID, RoleID).

notify(MID, RoleID) ->
    MsgRecord = #sc_lake_bandits_dragon_belong{role_id = RoleID, mon_id = MID},
    {ok, Bin} = prot_msg:encode_msg(51311, MsgRecord),
    lib_scene_agent:send_to_local_scene(Bin).

set_dragon_mid(MID) ->
    erlang:put({?MODULE, dragon_mid}, MID).

get_dragon_mid() ->
    erlang:get({?MODULE, dragon_mid}).
