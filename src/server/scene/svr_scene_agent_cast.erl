%%-------------------------------------------------------
%% @File     : svr_scene_agent_cast.erl
%% @Brief    : 场景进程 cast消息处理
%% @Author   : cablsbs
%% @Date     : 2018-6-22
%%-------------------------------------------------------
-module(svr_scene_agent_cast).

-export([handle_cast/2]).

-include("attr.hrl").
-include("role.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("exterior.hrl").
-include("ret_code.hrl").
-include("proto/prot_901.hrl").
-include("proto/prot_902.hrl").


-define(ROBOT_MON_IDS, [
    500101, 500201, 500301, 500401,
    500102, 500202, 500302, 500402,
    500103, 500203, 500303, 500403,
    500104, 500204, 500304, 500404
]).


%% Apis -------------------------------------------------
% @doc 把命令压入队列
handle_cast({'push_cmd', Cmd}, State) ->
    lib_scene_agent:push_cmd(Cmd),
    {noreply, State};

% @doc 更战斗属性信息
handle_cast({'update', {'scene_bt_attr', RoleId, Level, Attr, CombatPower}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{gm_rate = GmRate, pet_addon = PetAddon, peffect_attr = PEffectAttr, effect_list = EffectList} = SceneRole ->
            BtAttrT0 = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),
            BtAttrT1 = lib_role_attr:add_attr(BtAttrT0, PetAddon),
            BtAttrT2 = lib_role_attr:mul_attr(BtAttrT1, GmRate),
            HpLim = max(1, BtAttrT2#bt_attr.hp_lim),
            BtAttrT3 = BtAttrT2#bt_attr{
                hp_lim = HpLim,
                att_speed = BtAttrT1#bt_attr.att_speed,
                move_speed = BtAttrT1#bt_attr.move_speed
            },
            BtAttrT = lib_role_attr:alter_attrs(BtAttrT3, SceneRole#scene_role.gm_attrs),
            SceneRoleT = SceneRole#scene_role{level = Level, attr = Attr, bt_attr = BtAttrT, combat_power = CombatPower},
            MoveSpeedN = lib_obj_role:recalc_move_speed(SceneRoleT, Attr#bt_attr.move_speed),
            BtAttrN = BtAttrT#bt_attr{move_speed = MoveSpeedN},

            % 推送属性变化
            BtAttrChangeMsg = #notify_bt_attr_change{scene_bt_attr = BtAttrN},
            {ok, BtAttrChangeBin} = prot_msg:encode_msg(90120, BtAttrChangeMsg),
            lib_role_send:send_to_sid(SceneRole#scene_role.sid, BtAttrChangeBin),

            % 广播战力、速度、血量变化
            #scene_role{hp = Hp, mp = Mp, x = X, y = Y, bt_attr = BtAttr} = SceneRole,
            {HpN, MpN} = case Level > SceneRole#scene_role.level of
                true -> {BtAttrN#bt_attr.hp_lim, BtAttrN#bt_attr.mp_lim};
                false -> {Hp, Mp}
            end,
            SceneRoleN = SceneRoleT#scene_role{hp = HpN, mp = MpN, bt_attr = BtAttrN},

            RoleInfoChangeMsg = #bcast_role_info_change{
                role_id = RoleId, level = Level, combat_power = CombatPower,
                hp = HpN, hp_lim = BtAttrN#bt_attr.hp_lim, move_speed = MoveSpeedN
            },
            {ok, RoleInfoChangeBin} = prot_msg:encode_msg(90251, RoleInfoChangeMsg),
            lib_scene_agent:send_to_local_area_scene(X, Y, RoleInfoChangeBin),

            % 通知角色蓝量变化
            BtAttr#bt_attr.mp_lim =/= BtAttrN#bt_attr.mp_lim andalso lib_obj_role:bcast_mp_change(SceneRoleN, MpN),
            lib_scene_agent:put_roler(SceneRoleN);
        [] ->
            skip
    end,
    {noreply, State};

% @doc 更新模块被动辅助技能
handle_cast({'update', {'mod_pskills', RoleId, ModPSkillsN}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{skill_list = SkillList, mod_pskills = ModPSkills, mate_id = MateId} = SceneRole ->
            check_update_marry_skill_effect(RoleId, MateId, ModPSkills, ModPSkillsN),
            PEffectMap = lib_skill_util:gen_passive_effects(SkillList ++ ModPSkillsN),
            PEffectAttr = lib_effect_util:calc_passive_effect_attr(PEffectMap),
            SceneRolerN = SceneRole#scene_role{
                mod_pskills = ModPSkillsN,
                peffect_attr = PEffectAttr,
                peffect_map = PEffectMap
            },
            lib_scene_agent:put_roler(SceneRolerN);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 更新角色技能列表
handle_cast({'update', {'skill_list', RoleId, SkillList, SkillConfs}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{mod_pskills = ModPSkills} = SceneRole ->
            PEffectMap = lib_skill_util:gen_passive_effects(SkillList ++ ModPSkills),
            PEffectAttr = lib_effect_util:calc_passive_effect_attr(PEffectMap),
            SceneRolerN = SceneRole#scene_role{
                skill_list = SkillList,
                skill_confs = SkillConfs,
                peffect_attr = PEffectAttr,
                peffect_map = PEffectMap
            },
            lib_scene_agent:put_roler(SceneRolerN);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 更新帮派数据
handle_cast({'update', {'guild', RoleId, GuildId, GuildName}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y} = SceneRole ->
            bcast_guild_info_change(RoleId, X, Y, GuildId, GuildName),
            SceneRoleN = SceneRole#scene_role{guild = GuildId, guild_name = GuildName},
            lib_scene_agent:put_roler(SceneRoleN),
            lib_pet_agent:update_pets_owner_fields(RoleId, [{guild, GuildId}, {guild_name, GuildName}]);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 更新杀气数据
handle_cast({'update', {'murderous', RoleId, Murderous}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y} = SceneRole ->
            bcast_murderous_change(RoleId, X, Y, Murderous),
            SceneRoleN = SceneRole#scene_role{murderous = Murderous},
            lib_scene_agent:put_roler(SceneRoleN),
            lib_pet_agent:update_pets_owner_fields(RoleId, [{murderous, Murderous}]);
        _ ->
            skip
    end,
    {noreply, State};

%% @doc 更新玩家帮派宣战or敌对or运镖状态以及同步到宠物owner字段
handle_cast({'update', {'update_role_and_pet', RoleId, RoleKvList, PetKvList}}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} ->
            lib_scene_agent:update_scene_roler_fields(RoleId, RoleKvList),
            lib_pet_agent:update_pets_owner_fields(RoleId, PetKvList);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 个人宣战
handle_cast({'declare_war', RoleId, RivalId}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{sid = RoleSid, name = RoleName, declare_map = DeclareMap, attackable = Attackable} = SceneRole ->
            lib_scene_agent:is_role_in_scene(RivalId) andalso begin
                NowTimeMS = time:unixtime_ms(),
                DeclareExpire = conf_battle_common:get(declare_expire) + NowTimeMS,
                gen_server:cast(self(), {'be_declare_war', [RivalId], RoleId, RoleName, DeclareExpire}),
                DeclareMapN = maps:put(RivalId, DeclareExpire, DeclareMap),
                AttackableN = sets:add_element(RivalId, Attackable),
                lib_scene_agent:put_roler(SceneRole#scene_role{declare_map = DeclareMapN, attackable = AttackableN}),
                lib_pet_agent:update_pets_owner_fields(RoleId, [{attackable, AttackableN}]),
                sets:is_element(RivalId, Attackable) orelse lib_obj_role:notify_add_rival(RoleSid, RivalId)
            end;
        _ ->
            skip
    end,
    {noreply, State};

% @doc 更新个人宣战
handle_cast({'update_declare', RoleId, RivalIds}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{sid = RoleSid, name = RoleName, declare_map = DeclareMap, rival_map = RivalMap, attackable = Attackable} = SceneRole ->
            NowTimeMS = time:unixtime_ms(),
            DeclareExpire = conf_battle_common:get(declare_expire) + NowTimeMS,
            UpdateDeclareFun = fun(RivalId, {AccDeclare, AccAttackable, AccUpdatedDeclare} = Acc) ->
                case maps:is_key(RivalId, RivalMap) of
                    true ->
                        Acc;
                    false ->
                        AccDeclareN = maps:put(RivalId, DeclareExpire, AccDeclare),
                        AccAttackableN = sets:add_element(RivalId, AccAttackable),
                        {AccDeclareN, AccAttackableN, [RivalId | AccUpdatedDeclare]}
                end
            end,
            {DeclareMapN, AttackableN, UpdatedDeclare} = lists:foldl(UpdateDeclareFun, {DeclareMap, Attackable, []}, RivalIds),
            UpdatedDeclare =/= [] andalso begin
                gen_server:cast(self(), {'be_declare_war', UpdatedDeclare, RoleId, RoleName, DeclareExpire}),
                lib_scene_agent:put_roler(SceneRole#scene_role{declare_map = DeclareMapN, attackable = AttackableN}),
                sets:size(Attackable) < sets:size(AttackableN) andalso begin
                    lib_pet_agent:update_pets_owner_fields(RoleId, [{attackable, AttackableN}]),
                    lib_obj_role:notify_rivals(RoleSid, sets:to_list(AttackableN))
                end
            end;
        _ ->
            skip
    end,
    {noreply, State};

% @doc 被宣战及和平被攻击
handle_cast({'be_declare_war', RoleIds, RivalId, RivalName, DeclareExpire}, State) ->
    UpdateFun = fun(RoleId) ->
        case lib_scene_agent:get_roler(RoleId) of
            #scene_role{sid = RoleSid, rival_map = RivalMap, attackable = Attackable} = SceneRole ->
                RivalMapN = maps:put(RivalId, DeclareExpire, RivalMap),
                AttackableN = sets:add_element(RivalId, Attackable),
                lib_scene_agent:put_roler(SceneRole#scene_role{rival_map = RivalMapN, attackable = AttackableN}),
                lib_pet_agent:update_pets_owner_fields(RoleId, [{attackable, AttackableN}]),
                maps:is_key(RivalId, RivalMap) orelse lib_obj_role:notify_be_declare(RoleSid, RivalId, RivalName);
            _ ->
                skip
        end
    end,
    lists:foreach(UpdateFun, RoleIds),
    {noreply, State};

% @doc 被杀死，解除双方对战状态
handle_cast({'del_attackable', RoleId, RivalId}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{sid = RoleSid, declare_map = DeclareMap, rival_map = RivalMap, attackable = Attackable} = SceneRole ->
            DeclareMapN = maps:remove(RivalId, DeclareMap),
            RivalMapN = maps:remove(RivalId, RivalMap),
            AttackableN = sets:del_element(RivalId, Attackable),
            SceneRoleN = SceneRole#scene_role{
                declare_map = DeclareMapN, rival_map = RivalMapN,
                attackable = AttackableN
            },
            lib_scene_agent:put_roler(SceneRoleN),
            lib_pet_agent:update_pets_owner_fields(RoleId, [{attackable, AttackableN}]),
            lib_obj_role:notify_del_rival(RoleSid, RivalId);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 角色离开场景
handle_cast({'leave', RoleId}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{guild = GuildId, mate_id = MateId} = SceneRole ->
            #scene{id = SceneId, line = LineId} = State,
            MateId > 0 andalso lib_scene_cmd:scene_cmd('check_del_marriage_effect', MateId),
            lib_scene_master:role_leave(SceneId, RoleId),
            lib_obj_role:on_delete(SceneRole),
            lib_role_guild_defend:role_leave(RoleId, LineId, SceneId),
            lib_role_guild_wine_act:leave_seat(SceneId, RoleId, GuildId), % 帮派行酒令离开领地
            lib_role:mod_info(RoleId, lib_role_daily_thief, {leave_scene, SceneId}),
            lib_scene_arena:role_leave(State#scene.type, RoleId),
            svr_world_boss_layer:leave_field(SceneId, LineId, RoleId),
            svr_lake_bandits:leave(RoleId, LineId, SceneId),
            svr_dungeon:leave(SceneId, LineId, RoleId),
            svr_dynasty_war_mgr:leave(SceneId, LineId, RoleId),
            svr_territory_mgr:leave(SceneId, RoleId),
            lib_scene_agent:is_monopoly_scene() orelse update_role_num(SceneId, LineId);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 给场景所有角色发送信息
handle_cast({'send_to_scene', Bin}, State) ->
    lib_scene_agent:send_to_local_scene(Bin),
    {noreply, State};

% @doc 给场景所有角色发送信息
handle_cast({'send_to_scene_except', Bin, List}, State) ->
    lib_scene_agent:send_to_scene_except(Bin, List),
    {noreply, State};

% @doc 给场景所有角色发送信息(延时)
handle_cast({'send_to_scene_later', Bin, MilliSec}, State) ->
    lib_scene_agent:send_to_local_scene_later(Bin, MilliSec),
    {noreply, State};

% @doc 给场景九宫格角色发送信息
handle_cast({'send_to_area_scene', X, Y, Bin}, State) ->
    lib_scene_agent:send_to_local_area_scene(X, Y, Bin),
    {noreply, State};

% @doc 给场景九宫格角色周围其他角色发送信息
handle_cast({'send_to_role_area_scene', RoleId, Bin, Except}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y} when Except =:= [] ->
            lib_scene_agent:send_to_local_area_scene(X, Y, Bin);
        #scene_role{x = X, y = Y} ->
            lib_scene_agent:send_to_local_area_scene_except(X, Y, Bin, Except);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 角色加载场景
handle_cast({'load_scene', SceneRole, Pet, TeamInfo}, State) ->
    #scene_role{id = RoleID, sid = RoleSid} = SceneRole,
    SceneID = ?SCENE_ID, LineID = ?LINE_ID,
    case lib_scene_agent:get_roler(SceneRole#scene_role.id) of
        [] ->
            objs_init(SceneRole, Pet, TeamInfo, State),
            IsTeamScene = lib_dungeon_util:is_team_scene(SceneID),
            (IsTeamScene andalso SceneRole#scene_role.team > 0)
                andalso check_create_dung_robot(SceneRole),
            Switch = false;
        #scene_role{id = RoleId, x = RX, y = RY, stat = Stat} = CurSceneRole ->
            StatN = bit_map:unset(?SPEC_STAT_BIT_HANGING, Stat),
            SceneRoleN = CurSceneRole#scene_role{sid = RoleSid, stat = StatN},
            lib_scene_agent:put_roler(SceneRoleN),
            lib_obj_pet:pet_switch_pos_fix(RX, RY, RoleId, RoleSid),
            notify_scene_attr_and_attackable(SceneRoleN),
            lib_obj_role:switch_send(SceneRoleN),
            lib_team_agent:member_enter(SceneRoleN, TeamInfo),
            Switch = true
    end,
    svr_dungeon:enter(SceneID, LineID, RoleID, not Switch),
    svr_territory_mgr:role_enter(SceneID, RoleID),
    svr_territory_battle:role_enter(SceneID, LineID, RoleID),
    {noreply, State};

% @doc 角色断线状态
handle_cast({'hanging', RoleId}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y, stat = Stat} = SceneRole ->
            StatN = bit_map:set(?SPEC_STAT_BIT_HANGING, Stat),
            case lib_pet_agent:get_role_pet(RoleId) of
                #pet{} = Pet ->
                    PetN = lib_obj_pet:hide_pet(Pet),
                    lib_pet_agent:put_pet(PetN);
                _ ->
                    skip
            end,
            SceneRoleT = SceneRole#scene_role{stat = StatN},
            SceneRoleN = lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, SceneRoleT),
            lib_scene_agent:put_roler(SceneRoleN),
            lib_obj_util:bcast_spec_stat(StatN, ?BATTLE_ROLE, RoleId, X, Y);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 创建镖车
handle_cast({'create_carry', RoleCarry, Owner, Type}, State) ->
    lib_obj_carry:init(RoleCarry, Owner, Type),
    {noreply, State};

% @doc 删除镖车
handle_cast({'delete_carry', RoleId}, State) ->
    CarryId = lib_scene_agent:get_role_carry_id(RoleId),
    if
        CarryId > 0 -> del_role_carry(CarryId);
        true -> skip
    end,
    {noreply, State};

% @doc 外观坐骑
handle_cast({'ext_horse', RoleID, HorseID, Flag}, State) ->
    case lib_scene_agent:get_roler(RoleID) of
        #scene_role{bt_attr = BtAttr, x = X, y = Y, exteriors = Exteriors, team = TeamID} = SceneRole ->
            OldFlag =
                case lists:keyfind(?EXT_TYPE_HORSE, 1, Exteriors) of
                    false ->
                        ?EXT_HIDE;
                    {_, _, OldFlagT} ->
                        OldFlagT
                end,
            NewFlag = ?iif(Flag >= 0, Flag, ?iif(OldFlag =:= 0, 1, 0)),
            ExteriorsN = lists:keystore(?EXT_TYPE_HORSE, 1, Exteriors, {?EXT_TYPE_HORSE, HorseID, NewFlag}),
            SceneRoleT =
                case NewFlag of
                    ?EXT_HIDE ->
                        #scene_role{attr = Attr, peffect_attr = PEffectAttr, gm_rate = GmRate, effect_list = EffectList} = SceneRole,
                        BtAttrT0 = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),
                        BtAttrT1 = lib_role_attr:mul_attr(BtAttrT0, GmRate),
                        HpLim = max(1, BtAttrT1#bt_attr.hp_lim),
                        BtAttrT2 = BtAttrT1#bt_attr{
                            hp_lim = HpLim,
                            att_speed = BtAttrT0#bt_attr.att_speed,
                            move_speed = BtAttrT0#bt_attr.move_speed
                        },
                        BtAttrT = lib_role_attr:alter_attrs(BtAttrT2, SceneRole#scene_role.gm_attrs),
                        SceneRole#scene_role{exteriors = ExteriorsN, bt_attr = BtAttrT};
                    ?EXT_SHOW ->
                        DelEffectAIds = lib_effect_util:get_invisble_effect_aids(SceneRole#scene_role.effect_list),
                        DelEffectAIds =/= [] andalso lib_scene_cmd:scene_cmd('del_effect_by_aids', {{?BATTLE_ROLE, RoleID}, DelEffectAIds}),
                        SceneRole#scene_role{exteriors = ExteriorsN}
                end,
            CalcHorseID = ?iif(NewFlag =:= ?EXT_SHOW andalso HorseID > 0, HorseID, 0),
            MoveSpeedN = lib_obj_role:recalc_move_speed(SceneRoleT, BtAttr#bt_attr.move_speed, CalcHorseID),
            BtAttrN = (SceneRoleT#scene_role.bt_attr)#bt_attr{move_speed = MoveSpeedN},
            SceneRoleN = SceneRoleT#scene_role{bt_attr = BtAttrN},
            lib_obj_util:bcast_exterior_change(RoleID, ?EXT_TYPE_HORSE, HorseID, NewFlag, X, Y),
            lib_scene_agent:put_roler(SceneRoleN),
            lib_team_agent:sync_team_speed(RoleID, TeamID);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 巡游状态改变
handle_cast({'marry_parade', Type, RoleID}, State) ->
    case lib_scene_agent:get_roler(RoleID) of
        #scene_role{stat = Stat, x = X, y = Y} = SceneRole ->
            StatN =
                ?iif(
                    Type =:= 1,
                    bit_map:set(?SPEC_STAT_BIT_MARRY, Stat),
                    bit_map:unset(?SPEC_STAT_BIT_MARRY, Stat)
                ),
            SceneRoleN = SceneRole#scene_role{stat = StatN},
            lib_scene_agent:put_roler(SceneRoleN),
            lib_obj_util:bcast_spec_stat(StatN, ?BATTLE_ROLE, RoleID, X, Y);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 竞技场对手数据
handle_cast({'init_arena_rival', RivalRole, RivalPets}, State) ->
    lib_scene_arena:init_arena_rival(RivalRole, RivalPets),
    {noreply, State};

% @doc 宠物休息
handle_cast({'pet_leave', RoleId}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{sid = RoleSid} = SceneRole ->
            lib_obj_role:clear_pet_effect(SceneRole),
            case lib_pet_agent:get_role_pet(RoleId) of
                #pet{id = PetId} = Pet ->
                    PetLeaveMsg = #notify_pet_leave{pet_id = PetId},
                    {ok, Bin} = prot_msg:encode_msg(90129, PetLeaveMsg),
                    lib_role_send:send_to_sid(RoleSid, Bin),
                    del_scene_pet(RoleId, Pet);
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    {noreply, State};

% @doc 珍兽上阵
handle_cast({'pet_enter', RoleId, Pet}, State) ->
    ScenePet = data_transfer:to_scene_pet(Pet),
    add_scene_pet(RoleId, ScenePet),
    {noreply, State};

% @doc 珍兽数据更新
handle_cast({'pet_update', RoleId, Pet}, State) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{} = ScenePet ->
            #pet{
                id = PetId, x = PetX, y = PetY, born_xy = BornXY,
                float_xy = FloatXY, owner = Owner, attr = OldAttr, bt_attr = OldBtAttr
            } = ScenePet,
            NewScenePetT = data_transfer:to_scene_pet(Pet),
            #pet{attr = Attr, bt_attr = BtAttr} = NewScenePetT,
            NewScenePet = NewScenePetT#pet{
                id = PetId, x = PetX, y = PetY,
                born_xy = BornXY, float_xy = FloatXY, owner = Owner,
                attr = Attr#bt_attr{move_speed = OldAttr#bt_attr.move_speed},
                bt_attr = BtAttr#bt_attr{move_speed = OldBtAttr#bt_attr.move_speed}
            },
            lib_pet_agent:put_pet(NewScenePet);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 切换神器幻化
handle_cast({'artifact_change', RoleId, Artifact}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y} = SceneRole ->
            SceneRoleT = SceneRole#scene_role{artifact = Artifact},
            lib_scene_agent:put_roler(SceneRoleT),
            lib_obj_util:bcast_artifact_change(RoleId, Artifact, X, Y);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 切换武魂幻化
handle_cast({'warrior_soul_change', RoleId, WarriorSoul}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{x = X, y = Y} = SceneRole ->
            SceneRoleT = SceneRole#scene_role{warrior_soul = WarriorSoul},
            lib_scene_agent:put_roler(SceneRoleT),
            lib_obj_util:bcast_warrior_soul_change(RoleId, WarriorSoul, X, Y);
        _ ->
            skip
    end,
    {noreply, State};

% @doc 关闭场景
handle_cast('close', #scene{id = SceneId, line = LineId} = State) ->
    RolePids = lib_scene_agent:get_scene_roler_field(#scene_role.pid),
    [
        RolePid ! {'passive_leave_scene', SceneId, LineId}
        || RolePid <- RolePids, is_pid(RolePid)
    ],
    erlang:send_after(3000, self(), 'terminate'),
    {noreply, State};

% @doc 清理场景
handle_cast('clear_scene', State) ->
    catch lib_mon_agent:clear_scene_mon(false),
    lib_scene_agent:reinit_scene(State),
    svr_scene_mgr:scene_cleared(State#scene.id, State#scene.line),
    StateN = lib_scene_agent:start_scene_timers(State),
    {noreply, StateN};

handle_cast({'revive_mate', RoleId, MateId, Perc}, State) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{hp = Hp, x = X, y = Y, team = TeamId} when Hp > 0 andalso TeamId =/= 0 ->
            case lib_scene_agent:get_roler(MateId) of
                #scene_role{hp = 0, x = MateX, y = MateY, team = TeamId} = SceneRoleM ->
                    case lib_battle_chk:check_distance({X, Y}, {MateX, MateY}, 20) of
                        true -> do_revive_mate(SceneRoleM, Perc);
                        false -> ?ERROR_TOC(RoleId, ?RC_MARRY_MATE_NOT_NEARBY)
                    end;
                #scene_role{hp = MHp} ->
                    if
                        MHp > 0 -> ?ERROR_TOC(RoleId, ?RC_MARRY_MATE_NOT_DEAD);
                        true -> ?ERROR_TOC(RoleId, ?RC_MARRY_PARADE_MATE_NOT_IN_TEAM)
                    end;
                _ ->
                    ?ERROR_TOC(RoleId, ?RC_MARRY_MATE_NOT_IN_SAME_SCENE)
            end;
        _ ->
            skip
    end,
    {noreply, State};

handle_cast({change_scene_role_mode, Mode}, State) ->
    RoleIds = lib_scene_agent:get_scene_roler_ids(),
    [lib_scene_cmd:handle_cmd('change_scene_mode', {RoleId, Mode}) || RoleId <- RoleIds],
    MsgRecord = #change_scene_mode_resp{scene_mode = Mode},
    {ok, Bin} = prot_msg:encode_msg(90113, MsgRecord),
    lib_scene_agent:send_to_local_scene(Bin),
    {noreply, State};

%% 场景GM
handle_cast({'gm', Cmd, Args}, State) ->
    do_handle_scene_gm(Cmd, Args),
    {noreply, State};

%% 默认匹配
handle_cast(Msg, #scene{id = SceneId, line = LineId} = State) ->
    ?ERROR("Recv unexpected cast Msg: ~p in {SceneId: ~p, Line: ~p}", [Msg, SceneId, LineId]),
    {noreply, State}.


%% Privates ----------------------------------------------
% @doc 场景GM命令处理
do_handle_scene_gm('full_hp', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    lib_obj_util:add_obj_hp_restore(SceneRole, ?UINT32_MAX);
do_handle_scene_gm('full_mp', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{bt_attr = #bt_attr{mp_lim = MpLim}} = SceneRole,
    SceneRoleN = lib_obj_role:alter_role_mp(SceneRole, MpLim),
    lib_scene_agent:put_roler(SceneRoleN),
    lib_obj_role:bcast_mp_change(SceneRoleN, MpLim);
do_handle_scene_gm('empty_hp', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    DeltaHp = 100 - SceneRole#scene_role.hp,
    lib_obj_util:add_obj_hp_restore(SceneRole, DeltaHp);
do_handle_scene_gm('empty_mp', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    SceneRoleN = SceneRole#scene_role{mp = 1},
    lib_scene_agent:put_roler(SceneRoleN),
    lib_obj_role:bcast_mp_change(SceneRoleN, 1);
do_handle_scene_gm('powerful', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{gm_attrs = GmAttrs, bt_attr = BtAttr} = SceneRole,
    GmRateN = SceneRole#scene_role.gm_rate * 20,
    PowerfulAttrT = lib_role_attr:mul_attr(BtAttr, GmRateN),
    PowerfulAttrT1 = PowerfulAttrT#bt_attr{
        hp_lim = max(1, PowerfulAttrT#bt_attr.hp_lim),
        mp_lim = BtAttr#bt_attr.mp_lim,
        att_speed = BtAttr#bt_attr.att_speed,
        move_speed = BtAttr#bt_attr.move_speed
    },
    PowerfulAttr = lib_role_attr:alter_attrs(PowerfulAttrT1, GmAttrs),
    HpLim = max(1, PowerfulAttr#bt_attr.hp_lim),
    SceneRoleT = SceneRole#scene_role{hp = HpLim, gm_rate = GmRateN, bt_attr = PowerfulAttr},
    lib_obj_util:add_obj_hp_restore(SceneRoleT, HpLim);
do_handle_scene_gm('oripower', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{attr = Attr} = SceneRole,
    SceneRoleT = SceneRole#scene_role{gm_rate = 1, gm_attrs = [], bt_attr = Attr},
    lib_obj_util:add_obj_hp_restore(SceneRoleT, Attr#bt_attr.hp_lim);
do_handle_scene_gm('weakness', RoleId) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{gm_attrs = GmAttrs, bt_attr = BtAttr} = SceneRole,
    GmRateN = SceneRole#scene_role.gm_rate * 0.05,
    WeaknessAttrT = lib_role_attr:mul_attr(BtAttr, GmRateN),
    WeaknessHpLim = max(1, WeaknessAttrT#bt_attr.hp_lim),
    WeaknessAttrT1 = WeaknessAttrT#bt_attr{
        hp_lim = WeaknessHpLim,
        mp_lim = BtAttr#bt_attr.mp_lim,
        att_speed = BtAttr#bt_attr.att_speed,
        move_speed = BtAttr#bt_attr.move_speed
    },
    WeaknessAttr = lib_role_attr:alter_attrs(WeaknessAttrT1, GmAttrs),
    SceneRoleT = SceneRole#scene_role{gm_rate = GmRateN, bt_attr = WeaknessAttr},
    lib_obj_util:add_obj_hp_restore(SceneRoleT, WeaknessHpLim);
do_handle_scene_gm('alter_attr', {RoleId, AttrIndex, AttrVal}) ->
    SceneRole = lib_scene_agent:get_roler(RoleId),
    #scene_role{gm_attrs = GmAttrs, bt_attr = BtAttr} = SceneRole,
    GmAttrsN = lists:keystore(AttrIndex + 1, 1, GmAttrs, {AttrIndex + 1, AttrVal}),
    BtAttrN = lib_role_attr:alter_attrs(BtAttr, GmAttrsN),
    SceneRoleT = SceneRole#scene_role{gm_attrs = GmAttrsN, bt_attr = BtAttrN},
    case AttrIndex of
        ?ATTR_HP_LIM -> lib_obj_util:add_obj_hp_restore(SceneRoleT, AttrVal);
        AttrIndex -> lib_scene_agent:put_roler(SceneRoleT)
    end;
do_handle_scene_gm('add_effect', {RoleId, EffectId, EffectLv}) ->
    ObjKey = {?BATTLE_ROLE, RoleId},
    lib_scene_cmd:handle_cmd('add_effect', {ObjKey, ObjKey, {EffectId, EffectLv}});
do_handle_scene_gm('add_peffect', {RoleId, EffectId, EffectLv}) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{id = PetId} ->
            ObjKey = {?BATTLE_PET, PetId},
            lib_scene_cmd:handle_cmd('add_effect', {ObjKey, ObjKey, {EffectId, EffectLv}});
        _ ->
            skip
    end;
do_handle_scene_gm('del_effect', {RoleId, EffectId}) ->
    ObjKey = {?BATTLE_ROLE, RoleId},
    lib_effect_util:del_by_effect_ids(ObjKey, [EffectId]);
do_handle_scene_gm('del_peffect', {RoleId, EffectId}) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{id = PetId} ->
            ObjKey = {?BATTLE_PET, PetId},
            lib_effect_util:del_by_effect_ids(ObjKey, [EffectId]);
        _ ->
            skip
    end;
do_handle_scene_gm('summon', {MonId, Args}) ->
    lib_mon_agent:create_mon(MonId, Args);
do_handle_scene_gm('reload_mons', _) ->
    lib_mon_agent:clear_scene_mon(true),
    erlang:send_after(2000, self(), 'load_mons');
do_handle_scene_gm('presure_test', {{X, Y}, MonNum}) ->
    SceneId = ?SCENE_ID,
    MonList = [
        begin
            {MaxX, MaxY} = conf_scene_mask:get_max_pos(SceneId),
            TX = util:rand(max(1, X - 12), min(X + 12, MaxX)),
            TY = util:rand(max(1, Y - 12), min(Y + 12, MaxY)),
            {MX, MY} = lib_scene_sign:rand_pos(SceneId, TX, TY, 6),
            {util:list_rand(?ROBOT_MON_IDS), MX, MY}
        end
        || _ <- lists:seq(1, MonNum)
    ],
    lib_mon_agent:load_mons_by_group(MonList);
do_handle_scene_gm('create_coll', {CollId, {X, Y}}) ->
    lib_coll_agent:create_coll(CollId, X, Y, []);
do_handle_scene_gm(Cmd, Args) ->
    ?ERROR("Undefined Scene GM ! Cmd: ~p, Args: ~p", [Cmd, Args]).

% @doc 删除角色单个宠物(下阵宠物)
del_scene_pet(RoleId, Pet) ->
    lib_obj_pet:on_delete(Pet),
    RolePetMap = lib_scene_agent:get_pet_map(),
    RolePetMapN = maps:remove(RoleId, RolePetMap),
    lib_scene_agent:put_pet_map(RolePetMapN).

% @doc 删除角色镖车
del_role_carry(CarryId) ->
    Carry = lib_carry_agent:get_carry(CarryId),
    lib_obj_carry:on_delete(Carry).

% @doc 场景添加宠物(角色宠物上阵)
add_scene_pet(RoleId, ScenePet) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} = SceneRole ->
            case lib_pet_agent:get_role_pet(RoleId) of
                #pet{} = OldPet -> lib_obj_pet:on_delete(OldPet);
                _ -> skip
            end,
            PetN = lib_obj_pet:init(ScenePet, SceneRole),

            % 通知此玩家，添加宠物技能
            lib_obj_role:send_pet_skills(SceneRole#scene_role.sid, [PetN]),

            % 通知此玩家，加载宠物
            PetSceneInfos = data_transfer:sc_pet_scene_info_list([PetN]),
            OwnerAddPetMsg = #bcast_add_pet_scene_info{pet_list = PetSceneInfos},
            {ok, AddPetBin} = prot_msg:encode_msg(90236, OwnerAddPetMsg),
            lib_role_send:send_to_sid(SceneRole#scene_role.sid, AddPetBin),

            % 通知场景内的玩家，有宠物进入场景
            case lib_scene_agent:is_bcast_scene() of
                false -> lib_scene_agent:send_to_local_area_scene(PetN#pet.x, PetN#pet.y, AddPetBin);
                true -> lib_scene_agent:send_to_local_scene(AddPetBin)
            end,

            RolePetMap = lib_scene_agent:get_pet_map(),
            RolePetMapN = maps:put(RoleId, [PetN#pet.id], RolePetMap),
            lib_scene_agent:put_pet_map(RolePetMapN),
            lib_obj_role:append_pet_effect(PetN, SceneRole);
        _ ->
            skip
    end.

% @doc 同步场景人数
update_role_num(SceneId, LineId) ->
    MgrPid = get(mgr_pid),
    RoleNum = lib_scene_agent:get_scene_roler_num(),
    gen_server:cast(MgrPid, {'update_role_num', SceneId, LineId, RoleNum}).

% @doc 推送角色场景属性
notify_scene_attr_and_attackable(SceneRole) ->
    #scene_role{
        hp = Hp, mp = Mp, mode = Mode, realm = Realm, attackable = Attackable,
        bt_attr = #bt_attr{hp_lim = HpLim, mp_lim = MpLim, move_speed = MoveSpeed},
        header = Header
    } = SceneRole,
    NotifyAttrMsg = #notify_role_scene_attr{
        hp = Hp, hp_lim = HpLim, mp = Mp, mp_lim = MpLim,
        move_speed = MoveSpeed, mode = Mode, realm = Realm,
        header = Header
    },
    {ok, NotifyAttrBin} = prot_msg:encode_msg(90102, NotifyAttrMsg),
    NotifyRivalsMsg = #notify_rivals{rival_ids = sets:to_list(Attackable)},
    {ok, NotifyRivalsBin} = prot_msg:encode_msg(90115, NotifyRivalsMsg),
    NotifyBin = <<NotifyAttrBin/binary, NotifyRivalsBin/binary>>,
    lib_role_send:send_to_sid(SceneRole#scene_role.sid, NotifyBin).

% @doc 角色(及珍兽)进入场景初始化
objs_init(SceneRole, Pet, TeamInfo, Scene) ->
    #scene{id = SceneId, line = LineId, type = SceneType} = Scene,
    ModeFixed = lib_scene_api:fix_scene_mode(Scene, SceneRole#scene_role.mode),

    % 初始化角色及其宠物数据
    #scene_role{
        id = RoleId, hp = Hp, mp = Mp, attr = Attr, guild = GuildId,
        pet_addon = PetAddon, peffect_attr = PEffectAttr, effect_list = EffectList,
        mod_pskills = ModPSkills, exteriors = Exteriors, mate_id = MateId
    } = SceneRole,
    BtAttrT = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),
    ExteriorsN = lib_role_exterior:fix_horse_stat(SceneId, Exteriors),
    SceneRoleT = SceneRole#scene_role{bt_attr = BtAttrT, exteriors = ExteriorsN},
    MoveSpeed = lib_obj_role:recalc_move_speed(SceneRoleT, Attr#bt_attr.move_speed),
    BtAttrN1 = (SceneRoleT#scene_role.bt_attr)#bt_attr{move_speed = MoveSpeed},
    BtAttrN = lib_role_attr:add_attr(BtAttrN1, PetAddon),
    HpFix = max(100, min(Hp, BtAttrN#bt_attr.hp_lim)),      % 切场景后，从死亡切回残血
    MpFix = min(Mp, BtAttrN#bt_attr.mp_lim),
    SceneRoleT1 = SceneRoleT#scene_role{hp = HpFix, mp = MpFix, mode = ModeFixed, bt_attr = BtAttrN},
    Pets = ?iif(Pet =/= undefined, [Pet], []),
    {ok, SceneRoleN} = lib_obj_role:init(SceneRoleT1, Pets),

    % 场景玩法特殊逻辑
    lib_scene_master:role_enter(SceneId, RoleId),                                   % 武林盟主
    lib_role:mod_info(RoleId, lib_role_daily_robber, {check_create_mon, SceneId}),  % 逞凶打图
    lib_scene_check:check_practice(SceneRoleN),                                     % 帮派练功
    lib_role_guild_wine_act:enter_seat(SceneId, RoleId, GuildId),                   % 帮派行酒令
    lib_scene_arena:role_enter(SceneType, RoleId, SceneRole#scene_role.sid),

    % 场景数据更新及同步
    lib_scene_agent:is_role_in_scene(MateId) andalso begin
        MarryPSkillLv = lib_obj_role:get_marry_pskill_lv(ModPSkills),
        lib_scene_cmd:scene_cmd('check_add_marriage_effect', {RoleId, MarryPSkillLv, MateId})
    end,
    lib_scene_agent:is_monopoly_scene() orelse update_role_num(SceneId, LineId),    % 更新场景人数
    notify_scene_attr_and_attackable(SceneRoleN),                                   % 推送场景属性
    lib_team_agent:member_enter(SceneRoleN, TeamInfo),
    ok.

% 创建组队副本机器人
check_create_dung_robot(#scene_role{id = RoleId, team = TeamId} = SceneRole) ->
    case lib_team:get_team_info(TeamId) of
        #{robots := Robots, leader := RoleId} ->
            #scene_role{sid = RoleSid, level = Level, x = X, y = Y} = SceneRole,
            RobotLevel = max(1, (Level div 10) * 10),
            SceneRobots = init_robots(Robots, RoleId, RoleSid, TeamId, {X, Y}, RobotLevel),
            lib_obj_role:send_robot_skills(RoleSid, SceneRobots),
            [lib_obj_role:notify_load_self(SceneRobot, false) || SceneRobot <- SceneRobots];
        _ ->
            skip
    end.

% 初始化组队机器人
init_robots(RobotIds, RoleId, RoleSid, TeamId, {X, Y}, RobotLevel) ->
    GenRobotFun = fun(RobotId) ->
        % ObjId = lib_scene_agent:gen_robot_id(),
        ConfAttrs = conf_team_robot_attr:get(RobotLevel),
        AttrList = [
            {Idx, Val + util:rand(-Rand, Rand)}
            || {Idx, Val, Rand} <- ConfAttrs
        ],
        BtAttr = lib_role_attr:attr_to_record(bt_attr, AttrList),
        {BornX, BornY} = lib_scene_sign:rand_pos(?SCENE_ID, X, Y, 4),
        {Career, Name, SkillIds} = conf_team_robot:get_robot_conf(RobotId),
        SkillList = [#skill{id = SkillId, level = RobotLevel} || SkillId <- SkillIds],
        CombatPower = lib_role_attr:calc_combat_power(#base_attr{}, BtAttr, SkillList),
        Owner = #{id => RoleId, sid => RoleSid},
        SceneRobot = #scene_role{
            id = RobotId, career = Career, name = Name, level = RobotLevel, combat_power = CombatPower,
            owner = Owner, x = BornX, y = BornY, hp = BtAttr#bt_attr.hp_lim, mp = BtAttr#bt_attr.mp_lim,
            bt_attr = BtAttr, skill_list = SkillList, realm = 1, team = TeamId
        },
        lib_scene_agent:put_roler(SceneRobot),
        SceneRobot
    end,
    lists:map(GenRobotFun, RobotIds).

% 广播杀气变化
bcast_murderous_change(RoleId, X, Y, Murderous) ->
    Msg = #bcast_murderous_change{role_id = RoleId, murderous = Murderous},
    {ok, Bin} = prot_msg:encode_msg(90256, Msg),
    lib_scene_agent:send_to_local_area_scene(X, Y, Bin).

% 帮派信息变化通知
bcast_guild_info_change(RoleId, X, Y, Guild, GuildName) ->
    Msg = #bcast_guild_info_change{role_id = RoleId, guild = Guild, guild_name = GuildName},
    {ok, Bin} = prot_msg:encode_msg(90260, Msg),
    lib_scene_agent:send_to_local_area_scene(X, Y, Bin).

% 更新结婚技能被动效果
check_update_marry_skill_effect(RoleId, MateId, ModPSkills, ModPSkillsN) ->
    MarryPSkillLv = lib_obj_role:get_marry_pskill_lv(ModPSkills),
    MarryPSkillLvN = lib_obj_role:get_marry_pskill_lv(ModPSkillsN),
    if
        MarryPSkillLv < MarryPSkillLvN ->
            lib_scene_agent:is_role_in_scene(MateId) andalso
                lib_scene_cmd:scene_cmd('check_add_marriage_effect', {RoleId, MarryPSkillLvN, MateId});
        MarryPSkillLv > MarryPSkillLvN ->
            lib_scene_cmd:scene_cmd('check_del_marriage_effect', RoleId);
        true ->
            skip
    end.

% 复活配偶
do_revive_mate(#scene_role{id = RoleId, revive_type = ReviveType} = SceneRole, Perc) ->
    lib_obj_role:set_revive_perc_by_mate(RoleId, Perc),
    ReviveTypeN = bit_map:set(?REVIVE_BIT_BY_MATE, ReviveType),
    SceneRoleT = SceneRole#scene_role{revive_type = ReviveTypeN},
    SceneRoleN = lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, SceneRoleT),
    lib_team_agent:sync_team_hp(SceneRoleN, true),
    lib_scene_agent:put_roler(SceneRoleN).
