%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     演武堂场景内逻辑
%%% @end
%%% Created : 15. 十一月 2018 19:38
%%%-------------------------------------------------------------------
-module(lib_scene_jousts).

-include("role.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("mask.hrl").
-include("ret_code.hrl").
-include("jousts_hall.hrl").
-include("proto/prot_517.hrl").

%% API
-export([
    mon_die/5,
    mon_hurt/4,
    role_die/5,
    mon_check/2,
    poison_check/1,
    add_exp_timing/1
]).


%% 怪物死亡
mon_die(SceneID, FirstAtt, X, Y, KillerRole) ->
    SceneIDs = conf_jousts_hall_war:get_scenes(),
    case lists:member(SceneID, SceneIDs) of
        true ->
            BossScenes = conf_jousts_hall_war:get_war_scenes(?ROUND_FOUR),
            FirstAttTeam = lib_team_agent:get_role_team(FirstAtt),
            case lists:member(SceneID, BossScenes) of
                true ->
                    svr_jousts_hall_battle:boss_die(SceneID, KillerRole);
                false when FirstAttTeam > 0 ->
                    #{distance := Distance} = conf_jousts_hall_info:get(),
                    AreaRoles = lib_scene_agent:get_scene_roler_fields_dist([#scene_role.team, #scene_role.hp, #scene_role.id], X, Y, Distance),
                    AddScoreRoles =
                    lists:foldl(fun([TeamID, Hp, RoleID], Acc) ->
                        case TeamID =:= FirstAttTeam andalso Hp > 0 of
                            true ->
                                [RoleID | Acc];
                            _ ->
                                Acc
                        end
                    end, [], AreaRoles),
                    AddScoreRoles =/= [] andalso svr_jousts_hall_battle:mon_die(SceneID, AddScoreRoles);
                _ ->
                    FirstAttN = ?iif(FirstAtt =:= 0, KillerRole, FirstAtt),
                    svr_jousts_hall_battle:mon_die(SceneID, [FirstAttN])
            end;
        _ ->
            skip
    end.

%% BOSS被攻击
mon_hurt(RoleID, SceneID, Hurt, NewHp) ->
    BossScenes = conf_jousts_hall_war:get_war_scenes(?ROUND_FOUR),
    case lists:member(SceneID, BossScenes) of
        true ->
            #scene_role{guild = GuildID} = lib_scene_agent:get_roler(RoleID),
            case GuildID > 0 of
                true ->
                    svr_jousts_hall_battle:boss_hurt(SceneID, GuildID, Hurt, NewHp);
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

role_die(SceneID, DieRoleID, X, Y, KillerID) ->
    SceneIDs = conf_jousts_hall_war:get_scenes(),
    case lists:member(SceneID, SceneIDs) of
        true when KillerID > 0 ->
            #scene_role{team = KillerTeamID} = lib_scene_agent:get_roler(KillerID),
            case KillerTeamID > 0 of
                true ->
                    #{distance := Distance} = conf_jousts_hall_info:get(),
                    AreaRoles = lib_scene_agent:get_scene_roler_fields_dist([#scene_role.team, #scene_role.hp, #scene_role.id], X, Y, Distance),
                    AddScoreRoles =
                    lists:foldl(fun([TeamID, Hp, RoleID], Acc) ->
                        case TeamID =:= KillerTeamID andalso Hp > 0 of
                            true ->
                                [RoleID | Acc];
                            _ ->
                                Acc
                        end
                    end, [], AreaRoles),
                    AddScoreRoles =/= [] andalso svr_jousts_hall_battle:role_die(SceneID, DieRoleID, AddScoreRoles);
                _ ->
                    svr_jousts_hall_battle:role_die(SceneID, DieRoleID, [KillerID])
            end;
        true ->
            svr_jousts_hall_battle:role_die(SceneID, DieRoleID, []);
        _ ->
            skip
    end.

mon_check(SceneID, #mon{functional_data = FData, x = X, y = Y} = Mon) ->
    MonScenes = conf_jousts_hall_war:get_mon_scenes(),
    case lists:member(SceneID, MonScenes) of
        true ->
            #{distance := Dist} = conf_jousts_hall_info:get(),
            FirstAtt = lib_scene_agent:get_first_att(FData),
            FTeamID = lib_team_agent:get_role_team(FirstAtt),
            case FirstAtt > 0 of
                true when FTeamID > 0 ->
                    AreaRoles = lib_scene_agent:get_scene_roler_fields_dist([#scene_role.team, #scene_role.hp], X, Y, Dist),
                    IsNear =
                    lists:any(fun([TeamID, Hp]) ->
                        Hp > 0 andalso TeamID =:= FTeamID
                    end, AreaRoles),
                    ?iif(IsNear, Mon, Mon#mon{functional_data = FData#{first_att => 0}});
                _ ->
                    AreaRoles = lib_scene_agent:get_scene_roler_fields_dist([#scene_role.id, #scene_role.hp], X, Y, Dist),
                    IsNear =
                        lists:any(fun([RoleID, Hp]) ->
                            Hp > 0 andalso FirstAtt =:= RoleID
                    end, AreaRoles),
                    ?iif(IsNear, Mon, Mon#mon{functional_data = FData#{first_att => 0}})
            end;
        _ ->
            Mon
    end.

%% 加经验
add_exp_timing(SceneID) ->
    #{foyer_scene := LSceneID} = conf_jousts_hall_info:get(),
    MonScenes = conf_jousts_hall_war:get_mon_scenes(),
    case SceneID =:= LSceneID orelse lists:member(SceneID, MonScenes) of
        true ->
            RoleList = lib_scene_agent:get_scene_roler(),
            [begin
                 #scene_role{level = Lv} = lib_scene_agent:get_roler(RoleID),
                 #{foyer_scene := LSceneID} = conf_jousts_hall_info:get(),
                 #{jousts_hall_add_exp := LAddExp, jousts_battle_add_exp := BAddExp} = conf_level:get(Lv),
                 AddExp = ?iif(SceneID =:= LSceneID, LAddExp, BAddExp),
                 lib_role:mod_info(RoleID, lib_role_jousts_hall, {add_exp, AddExp})
             end || #scene_role{id = RoleID, hp = Hp} <- RoleList, Hp > 0
            ];
        _ ->
            skip
    end.


%% 检测是否在毒圈
poison_check(SceneID) ->
    RoleList = lib_scene_agent:get_scene_roler(),
    PoisonEffectFun = fun(SceneRole) ->
        #scene_role{id = RoleID, x = X, y = Y, hp = Hp, bt_attr = #bt_attr{hp_lim = HpLim}} = SceneRole,
        case is_in_poison(SceneID, X, Y) andalso Hp > 0 of
            true ->
                Key = {?BATTLE_ROLE, RoleID},
                Injury = erlang:floor(HpLim * 5 / 100),
                NowTimeMS = time:unixtime_ms(),
                lib_scene_cmd:handle_cmd('alter_obj_hp', {Key, Key, ?HARM_TYPE_POISON, -Injury, NowTimeMS});
            _ -> skip
        end
    end,
    lists:foreach(PoisonEffectFun, RoleList),
    ok.

is_in_poison(SceneID, X, Y) ->
    PosMask = conf_scene_mask:get_pos_mask(SceneID, X, Y),
    bit_map:is_set(?MASK_SELF_1, PosMask).
