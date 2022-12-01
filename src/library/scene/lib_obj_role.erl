%%-------------------------------------------------------
%% @File     : lib_obj_role
%% @Brief    : 人物OBJ
%% @Author   : cablsbs
%% @Date     : 2018-6-29
%%-------------------------------------------------------
-module(lib_obj_role).

-include("log.hrl").
-include("role.hrl").
-include("skill.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("exterior.hrl").
-include("proto/prot_901.hrl").
-include("proto/prot_902.hrl").
-include("proto/prot_903.hrl").

-export([
    init/2,
    on_update/3,
    on_beattack/2,
    on_delete/1,
    on_die/3,

    del_role_pets/1,
    get_total_harm/1,
    alter_role_mp/2,
    clear_belonger/1,
    clear_pet_effect/1,
    same_scene_transfer/2,
    append_pet_effect/2,
    interrupt_collect/2,
    get_revive_perc_by_mate/1,
    set_revive_perc_by_mate/2,
    get_marry_pskill_lv/1
]).

-export([
    switch_send/1,
    send_pet_skills/2,
    send_robot_skills/2,
    role_move_bcast/3,
    mod_pskill_change/2,
    recalc_move_speed/2,
    recalc_move_speed/3,
    bcast_mp_change/2,
    notify_anger_change/2,
    notify_add_rival/2,
    notify_del_rival/2,
    notify_be_declare/3,
    notify_rivals/2,
    notify_load_self/2,
    update_pets_speed/2
]).


%% Apis -------------------------------------------------
% @doc 进入场景初始化数据, 场景同步
% @spec init(#scene_role{}, Pets) -> {ok, #scene_role{}}.
% Pets :: [#pet{}]
init(SceneRole, Pets) ->
    del_role_pets(SceneRole#scene_role.id),
    OwnerPets = [lib_obj_pet:init(Pet, SceneRole) || Pet <- Pets],
    OwnerPets =:= [] orelse begin
        RolePetMap = lib_scene_agent:get_pet_map(),
        RolePetIds = [PetId || #pet{id = PetId} <- OwnerPets],
        RolePetMapN = maps:put(SceneRole#scene_role.id, RolePetIds, RolePetMap),
        lib_scene_agent:put_pet_map(RolePetMapN)
    end,

    % 场景aoi
    lib_scene_agent:put_roler(SceneRole),
    notify_load_objs(SceneRole, <<>>),
    {ok, SceneRole}.

% @doc 每个handle_update执行一次
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State                     :: #scene_role{}
on_update(NowTimeMS, ElapseTime, State) when State#scene_role.id > ?MAX_ROBOT_ID ->
    #scene_role{id = RoleId, sid = RoleSid} = State,
    UpdateCounter = lib_obj_util:update_counter(State#scene_role.update_counter),
    State1 = lib_statem:update(NowTimeMS, ElapseTime, #scene_role.statem, State),
    State2 = lib_effect_mgr:tick_effect(NowTimeMS, State1#scene_role{update_counter = UpdateCounter}),

    % 每30秒, 发送战斗统计数据
    SceneType = ?SCENE_TYPE,
    IsNormalScene = lists:member(SceneType, ?NORMAL_SCENE_TYPES),
    (not IsNormalScene) andalso (UpdateCounter rem 150 == 0) andalso send_harm_statistics(RoleId, RoleSid),

    % 每2秒逻辑
    StateN = case UpdateCounter rem 10 =:= 0 of
        true ->
            #scene_role{
                id = RoleId, x = X, y = Y, reset_index = ResetIndex,
                hp = Hp, mp = Mp, pid = RolePid, bt_attr = #bt_attr{hp_lim = HpLim}
            } = State2,
            SceneData = {X, Y, ResetIndex},
            PetData = lib_pet_agent:pet_restore_data(RoleId),
            RestoreData = {SceneData, Hp, HpLim, Mp, PetData},
            erlang:send(RolePid, {'scene_restore', RestoreData}),
            check_attackable(State2, NowTimeMS);                    % 检测可攻击对象
        false ->
            State2
    end,
    lib_scene_agent:put_roler(StateN),
    ok;
on_update(NowTimeMS, ElapseTime, State) ->
    UpdateCounter = lib_obj_util:update_counter(State#scene_role.update_counter),
    State1 = lib_statem:update(NowTimeMS, ElapseTime, #scene_role.statem, State),
    State2 = lib_effect_mgr:tick_effect(NowTimeMS, State1#scene_role{update_counter = UpdateCounter}),
    lib_scene_agent:put_roler(State2),
    ok.

% @doc 被攻击后回写
% @spec on_beattack({BtReturn, NowTimeMS}, State) -> ignore.
% BtReturn          :: #bt_return{}
% NowTimeMS         :: integer()
% State             :: #scene_role{}
on_beattack({BtReturn, NowTimeMS}, #scene_role{hp = Hp, mp = Mp} = State) when Hp > 0 ->
    #bt_return{
        hp = NewHpT, mp = NewMp, bt_attr = NewBtAttr, peffect_map = PEffectMap,
        effect_list = EffectList, effect_cd = EffectCd, shield = Shield
    } = BtReturn,
    NewHp = max(0, NewHpT),
    StateT = State#scene_role{
        hp = NewHp, mp = NewMp, bt_attr = NewBtAttr, peffect_map = PEffectMap,
        effect_list = EffectList, effect_cd = EffectCd, shield = Shield
    },
    lib_team_agent:sync_team_hp(StateT, false),
    case NewHp =< 0 of
        false ->
            %% 人物受击
            StateN = interrupt_collect(StateT, beattack),
            NewMp =/= Mp andalso bcast_mp_change(StateN, NewMp),
            lib_scene_agent:put_roler(StateN);
        true ->
            %% 人物死亡
            StateN = on_die(BtReturn#bt_return.atter, NowTimeMS, StateT),
            lib_scene_agent:put_roler(StateN)
    end,
    ok;
on_beattack({_BtReturn, _NowTimeMS}, State) ->
    lib_scene_agent:put_roler(State),
    State.

% @doc 删除场景角色数据
% @spec on_delete(State) -> ok.
% State     :: #scene_role{}
on_delete(State) ->
    #scene_role{id = RoleId, x = X, y = Y} = State,
    interrupt_collect(State, leave),
    clear_belonger(State#scene_role.id),
    {ok, DelRoleBin} = prot_msg:encode_msg(90233, #bcast_del_role{role_ids = [RoleId]}),
    del_role_pets(RoleId),
    del_role_owner_mon(RoleId),
    case lib_scene_agent:is_bcast_scene() of
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, DelRoleBin);
        true -> lib_scene_agent:send_to_local_scene(DelRoleBin)
    end,
    lib_scene_agent:del_roler(RoleId),
    lib_obj_util:del_obj_harm_and_cure({?BATTLE_ROLE, RoleId}),
    lib_team_agent:member_leave(State),
    ok.

% @doc 角色死亡处理
on_die(Atter, NowTimeMS, State) ->
    StateT = lib_obj_role:interrupt_collect(State, dead),
    lib_obj_role:clear_belonger(StateT#scene_role.id),
    lib_statem:change_state(?STATE_DIE, [Atter, NowTimeMS], #scene_role.statem, StateT).

% @doc 角色离开场景，删除角色携带的宠物数据
del_role_pets(RoleId) ->
    RolePetMap = lib_scene_agent:get_pet_map(),
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{} = Pet ->
            lib_obj_pet:on_delete(Pet),
            RolePetMapN = maps:remove(RoleId, RolePetMap),
            lib_scene_agent:put_pet_map(RolePetMapN);
        _ ->
            skip
    end.

%% @doc 角色离开场景，删除角色所归属的怪物
del_role_owner_mon(RoleId) ->
    MonIDs = lib_mon_agent:get_scene_owner_mon_ids(RoleId),
    lib_mon_agent:clear_scene_mon_by_ids(MonIDs, true).

% @doc 检测采集中断
interrupt_collect(#scene_role{collecting = 0} = SceneRole, _InterruptType) ->
    SceneRole;
interrupt_collect(#scene_role{collecting = Collecting} = SceneRole, InterruptType) ->
    #{interruptable := Interruptable} = Collecting,
    if
        InterruptType =/= beattack ->           % move or attack or dead or leave or battle or be_ctrl
            cancel_collect(SceneRole);
        Interruptable ->                        % beattack and collecting interruptable coll
            cancel_collect(SceneRole);
        true ->                                 % simply beattack
            SceneRole
    end.

% @doc 设置伴侣复活回复百分比
get_revive_perc_by_mate(RoleId) ->
    case erase({mate_revive_perc, RoleId}) of
        undefined -> 10;
        Perc -> Perc
    end.

% @doc 读取伴侣复活回复百分比
set_revive_perc_by_mate(RoleId, Perc) ->
    put({mate_revive_perc, RoleId}, Perc).

% @doc 获取结婚被动技能等级
get_marry_pskill_lv(ModPSkills) ->
    case lists:keyfind(40000003, #skill.id, ModPSkills) of
        #skill{level = LvN} -> LvN;
        _ -> 0
    end.

% @doc 添加珍兽辅助属性
append_pet_effect(Pet, SceneRole) ->
    #scene_role{career = Career} = SceneRole,
    PetAddon = lib_role_attr:base_to_bt_attr(Career, Pet#pet.base_attr),
    SceneRoleN = SceneRole#scene_role{pet_addon = PetAddon},
    lib_scene_agent:put_roler(SceneRoleN).

% @doc 顶号登陆发送数据
switch_send(#scene_role{hp = Hp, statem = Statem} = SceneRole) ->
    % 复活面板
    NotifyDieBin = case Hp =:= 0 of
        true ->
            NowTime = time:unixtime(),
            StatTime = Statem#statem.state_time,
            DieTime = NowTime - StatTime div 1000,
            DieMsg = #notify_role_die{die_time = DieTime},
            element(2, prot_msg:encode_msg(90106, DieMsg));
        false ->
            <<>>
    end,

    % 发送机器人技能列表
    IsTeamScene = lib_dungeon_util:is_team_scene(?SCENE_ID),
    (IsTeamScene andalso SceneRole#scene_role.team > 0)
        andalso check_send_robot_skills(SceneRole),

    % 效果列表
    AddEffectListBin = lib_effect_mgr:gen_effect_list_bin(SceneRole),
    ExtraBin = <<NotifyDieBin/binary, AddEffectListBin/binary>>,        % 额外协议数据
    notify_load_objs(SceneRole, ExtraBin),                              % 场景aoi
    ok.

% @doc 发送宠物技能列表
send_pet_skills(RoleSid, Pets) ->
    GenPetSkillsFun = fun
        (#pet{id = PetId, skill_list = SkillL} = Pet) ->
            SkillCd = maps:to_list(Pet#pet.skill_cd),
            Skills = [{SkillId, SkillLv} || #skill{id = SkillId, level = SkillLv} <- SkillL],
            #obj_skill{type = ?BATTLE_PET, id = PetId, skill_cd = SkillCd, skill_list = Skills};
        (PetId) ->
            Pet = lib_pet_agent:get_pet(PetId),
            SkillCd = maps:to_list(Pet#pet.skill_cd),
            #pet{id = PetId, skill_list = SkillL} = Pet,
            Skills = [{SkillId, SkillLv} || #skill{id = SkillId, level = SkillLv} <- SkillL],
            #obj_skill{type = ?BATTLE_PET, id = PetId, skill_cd = SkillCd, skill_list = Skills}
    end,
    PetSkills = lists:map(GenPetSkillsFun, Pets),
    PetSkillMsg = #notify_obj_skills{obj_skills = PetSkills},
    {ok, PetSkillBin} = prot_msg:encode_msg(90111, PetSkillMsg),
    lib_role_send:send_to_sid(RoleSid, PetSkillBin).

% @doc 发送机器人技能列表
send_robot_skills(RoleSid, SceneRobots) ->
    RobotSkills = [
        begin
            SkillL = [{S#skill.id, S#skill.level} || S <- SkillList],
            #obj_skill{type = ?BATTLE_ROLE, id = RobotId, skill_list = SkillL}
        end || #scene_role{id = RobotId, skill_list = SkillList} <- SceneRobots
    ],
    RobotSkills =/= [] andalso begin
        ObjSkillMsg = #notify_obj_skills{obj_skills = RobotSkills},
        {ok, ObjSkillBin} = prot_msg:encode_msg(90111, ObjSkillMsg),
        lib_role_send:send_to_sid(RoleSid, ObjSkillBin)
    end,
    ok.

% @doc 角色位置切换广播逻辑
role_move_bcast(OldX, OldY, #scene_role{id = RoleId, x = NewX, y = NewY, sid = RoleSid} = State) ->
    RoleLeaveMsg = #bcast_del_role{role_ids = [RoleId]},
    {ok, BinDataRemove} = prot_msg:encode_msg(90233, RoleLeaveMsg),
    RoleSceneInfo = data_transfer:sc_role_scene_info(State),
    AddRoleMsg = #bcast_add_role_scene_info{role_list = [RoleSceneInfo]},
    {ok, BinDataAdd} = prot_msg:encode_msg(90232, AddRoleMsg),
    OwnerSid = maps:get(sid, State#scene_role.owner, undefined),
    lib_scene_map:role_move_broadcast(NewX, NewY, OldX, OldY, BinDataRemove, BinDataAdd, RoleId, RoleSid, OwnerSid),
    lib_team_agent:sync_team_pos(State).

% @doc 角色被动辅助技能更新
mod_pskill_change(SceneRole, ModPSkills) ->
    SkillList = SceneRole#scene_role.skill_list,
    PEffectMap = lib_skill_util:gen_passive_effects(SkillList ++ ModPSkills),
    PEffectAttr = lib_effect_util:calc_passive_effect_attr(PEffectMap),
    SceneRole#scene_role{
        peffect_attr = PEffectAttr,
        peffect_map = PEffectMap
    }.

% @doc 重算移动速度(每次重算属性后都要计算)
recalc_move_speed(SceneRole, OriSpeed) ->
    HorseID = get_horse_stat(SceneRole#scene_role.exteriors),
    recalc_move_speed(SceneRole, OriSpeed, HorseID).

% @doc 重算移动速度
recalc_move_speed(SceneRole, OriSpeed, HorseID) ->
    #scene_role{id = RoleId, attr = Attr, bt_attr = BtAttr, follow = Follow} = SceneRole,
    MoveSpeed = Attr#bt_attr.move_speed,
    MoveSpeed1 = case HorseID > 0 of
        true ->
            AddPerc = conf_exterior_horse:get(HorseID),
            MoveSpeed + ceil(MoveSpeed * AddPerc / 100);
        _ ->
            BtMoveSpeed = BtAttr#bt_attr.move_speed,
            min(2 * MoveSpeed, BtMoveSpeed)
    end,
    MoveSpeedN = get_move_speed(RoleId, Follow, MoveSpeed1),
    case MoveSpeedN =/= OriSpeed of
        true ->
            update_pets_speed(RoleId, MoveSpeedN),
            lib_obj_util:bcast_speed_change(SceneRole, MoveSpeedN);
        false ->
            skip
    end,
    MoveSpeedN.

get_move_speed(RoleID, Leader, MoveSpeed)
    when Leader =:= 0 orelse RoleID =:= Leader ->
    MoveSpeed;
get_move_speed(_RoleID, Leader, MoveSpeed) ->
    case lib_scene_agent:get_roler(Leader) of
        #scene_role{bt_attr = #bt_attr{move_speed = LeaderSpeed}} ->
            LeaderSpeed;
        _ ->
            MoveSpeed
    end.

% @doc 通知蓝量变化
bcast_mp_change(#scene_role{id = RoleId, x = X, y = Y, bt_attr = BtAttr}, Mp) ->
    MpLim = BtAttr#bt_attr.mp_lim,
    BCastMpChangeMsg = #bcast_mp_change{role_id = RoleId, mp = Mp, mp_lim = MpLim},
    {ok, BCastMpChangeBin} = prot_msg:encode_msg(90244, BCastMpChangeMsg),
    case lib_scene_agent:is_bcast_scene() of
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BCastMpChangeBin);
        true -> lib_scene_agent:send_to_local_scene(BCastMpChangeBin)
    end.

% @doc 通知怒气变化
notify_anger_change(RoleId, Anger) when RoleId > ?MAX_ROBOT_ID ->
    NotifyAngerChangeMsg = #notify_anger_change{anger = Anger},
    {ok, NotifyAngerChangeBin} = prot_msg:encode_msg(90128, NotifyAngerChangeMsg),
    lib_role_send:send_to_role(RoleId, NotifyAngerChangeBin);
notify_anger_change(_RoleId, _Anger) ->
    skip.

% @doc 通知添加仇敌
notify_add_rival(Sid, RivalId) ->
    AddRivalMsg = #notify_add_rival{rival_id = RivalId},
    {ok, AddRivalBin} = prot_msg:encode_msg(90116, AddRivalMsg),
    lib_role_send:send_to_sid(Sid, AddRivalBin).

% @doc 通知删除仇敌
notify_del_rival(Sid, RivalId) ->
    DelRivalMsg = #notify_del_rival{rival_id = RivalId},
    {ok, DelRivalBin} = prot_msg:encode_msg(90117, DelRivalMsg),
    lib_role_send:send_to_sid(Sid, DelRivalBin).

% @doc 通知被宣战
notify_be_declare(Sid, RivalId, RivalName) ->
    AddRivalMsg = #notify_add_rival{rival_id = RivalId},
    {ok, AddRivalBin} = prot_msg:encode_msg(90116, AddRivalMsg),
    BeDeclareMsg = #notify_be_declare_war{role_id = RivalId, name = RivalName},
    {ok, BeDeclareBin} = prot_msg:encode_msg(90118, BeDeclareMsg),
    lib_role_send:send_to_sid(Sid, <<AddRivalBin/binary, BeDeclareBin/binary>>).

% @doc 通知添加仇敌
notify_rivals(Sid, Rivals) ->
    NotifyRivalsMsg = #notify_rivals{rival_ids = Rivals},
    {ok, NotifyRivalsBin} = prot_msg:encode_msg(90115, NotifyRivalsMsg),
    lib_role_send:send_to_sid(Sid, NotifyRivalsBin).

% @doc 通知其他人加载自己
notify_load_self(#scene_role{x = RX, y = RY} = SceneRole, IsBcastScene) ->
    RoleSceneInfo = data_transfer:sc_role_scene_info(SceneRole),
    AddRoleMsg = #bcast_add_role_scene_info{role_list = [RoleSceneInfo]},
    {ok, AddRoleBin} = prot_msg:encode_msg(90232, AddRoleMsg),
    case IsBcastScene of
        false -> lib_scene_agent:send_to_local_area_scene_except(RX, RY, AddRoleBin, []);
        true -> lib_scene_agent:send_to_scene_except(AddRoleBin, [])
    end,
    ok.

% @doc 获取玩家总伤害
get_total_harm(RoleID) ->
    RoleKey = {?BATTLE_ROLE, RoleID},
    HarmMap = lib_scene_agent:get_harm_map(),
    RoleHarm = maps:get(RoleKey, HarmMap, 0),
    RoleHarm.

% @doc 修改角色蓝量逻辑
alter_role_mp(SceneRole, MVal) when is_record(SceneRole, scene_role) ->
    #scene_role{hp = Hp, mp = Mp, bt_attr = BtAttr} = SceneRole,
    MpLim = BtAttr#bt_attr.mp_lim,
    case Hp > 0 of
        true ->
            NewMp = max(0, min(Mp + MVal, MpLim)),
            Mp =/= NewMp andalso bcast_mp_change(SceneRole, Mp),
            SceneRole#scene_role{mp = NewMp};
        _ ->
            SceneRole
    end.

%% Privates ---------------------------------------------
% 同步更新角色宠物速度
update_pets_speed(RoleId, MoveSpeed) ->
    RolePetIds = lib_scene_agent:get_role_pet_ids(RoleId),
    UpdateFun = fun(PetId) ->
        case lib_pet_agent:get_pet(PetId) of
            #pet{bt_attr = BtAttr} = Pet ->
                lib_obj_util:bcast_speed_change(Pet, MoveSpeed),
                BtAttrN = BtAttr#bt_attr{move_speed = MoveSpeed},
                PetN = Pet#pet{bt_attr = BtAttrN},
                lib_pet_agent:put_pet(PetN);
            _ ->
                skip
        end
    end,
    lists:foreach(UpdateFun, RolePetIds).

get_horse_stat(Exteriors) ->
    case lists:keyfind(?EXT_TYPE_HORSE, 1, Exteriors) of
        {_, ID, ?EXT_SHOW} ->
            ID;
        _ ->
            0
    end.

% 发送玩家单位伤害统计
send_harm_statistics(RoleId, RoleSid) ->
    RoleKey = {?BATTLE_ROLE, RoleId},
    HarmMap = lib_scene_agent:get_harm_map(),
    RoleHarm = maps:get(RoleKey, HarmMap, 0),
    RolePetIds = lib_scene_agent:get_role_pet_ids(RoleId),
    PetHarmL = [{?BATTLE_PET, PetId, maps:get({?BATTLE_PET, PetId}, HarmMap, 0)} || PetId <- RolePetIds],
    CureMap = lib_scene_agent:get_cure_map(),
    RoleCure = maps:get(RoleKey, CureMap, 0),
    PetRecoverL = [{?BATTLE_PET, PetId, maps:get({?BATTLE_PET, PetId}, CureMap, 0)} || PetId <- RolePetIds],

    StatisticsMsg = #notify_battle_statistics{
        harm_statistics = [{?BATTLE_ROLE, RoleId, RoleHarm} | PetHarmL],
        recover_statistics = [{?BATTLE_ROLE, RoleId, RoleCure} | PetRecoverL]
    },
    {ok, StatisticsBin} = prot_msg:encode_msg(90309, StatisticsMsg),
    lib_role_send:send_to_sid(RoleSid, StatisticsBin).

% 中断采集逻辑
cancel_collect(#scene_role{id = RoleId, collecting = #{id := CollId}} = SceneRole) ->
    case lib_coll_agent:get_coll(CollId) of
        #coll{collectors = Collectors, statem = Statem} = Coll ->
            lib_obj_util:bcast_collect_op(Coll, RoleId, ?COLL_OP_STOP),
            CollectorsN = lists:keydelete(RoleId, 1, Collectors),
            CollN = case CollectorsN =:= [] andalso Statem#statem.cur_state_id =/= ?STATE_BEOCCUPY of
                true -> lib_statem:change_state(?STATE_IDLE, [], #coll.statem, Coll#coll{collectors = CollectorsN});
                false -> Coll#coll{collectors = CollectorsN}
            end,
            lib_coll_agent:put_coll(CollN);
        _ ->
            ?ERROR("CollId: ~p not found !!!", [CollId])
    end,
    SceneRole#scene_role{collecting = 0}.

% @doc 清除角色占有的采集物归属者数据
clear_belonger(RoleId) ->
    {OwnedColls, OccupiedColls} = lib_coll_agent:get_colls_by_role(RoleId),
    [lib_obj_coll:on_delete(Coll) || Coll <- OwnedColls],
    [lib_obj_coll:do_clear_belonger(Coll) || Coll <- OccupiedColls].

% @doc 清除珍兽辅助属性及效果
clear_pet_effect(#scene_role{mod_pskills = ModPSkills} = SceneRole) ->
    % 清除珍兽辅助技能、珍兽辅助效果、珍兽属性加成
    SceneRoleT = case lists:keytake(?SKILL_ID_PET_LOYALTY, #skill.id, ModPSkills) of
        {value, _, ModPSkillsN} -> lib_obj_role:mod_pskill_change(SceneRole, ModPSkillsN);
        false -> SceneRole
    end,
    SceneRoleN = SceneRoleT#scene_role{pet_addon = []},
    lib_scene_agent:put_roler(SceneRoleN).

% @doc 角色同场景传送
same_scene_transfer(RoleId, {ToX, ToY}) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{hp = Hp, reset_index = ResetIndex} = SceneRole when Hp > 0 ->
            ResetIndexN = ResetIndex + 1,
            SceneRoleT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, SceneRole),
            SceneRoleT1 = SceneRoleT#scene_role{reset_index = ResetIndexN},
            lib_obj_util:reset_point(SceneRoleT1, ?RESET_POS_TRANSFER),
            SceneRoleN = lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, SceneRoleT1),
            lib_scene_agent:put_roler(SceneRoleN);
        _ ->
            skip
    end.

% @doc 场景aoi
notify_load_objs(SceneRole, ExtraBin) ->
    IsBcastScene = lib_scene_agent:is_bcast_scene(),
    #scene_role{id = RoleId, sid = RoleSid} = SceneRole,
    OwnerPets = case lib_pet_agent:get_role_pet(RoleId) of
        #pet{} = Pet -> [Pet];
        _ -> []
    end,
    send_pet_skills(RoleSid, OwnerPets),

    % 通知周围玩家，加载自己及宠物
    #scene_role{x = RX, y = RY} = SceneRole,
    OwnerPetSceneInfos = data_transfer:sc_pet_scene_info_list(OwnerPets),
    OwnerAddPetMsg = #bcast_add_pet_scene_info{pet_list = OwnerPetSceneInfos},
    {ok, OwnerAddPetBin} = prot_msg:encode_msg(90236, OwnerAddPetMsg),
    case IsBcastScene of
        false -> lib_scene_agent:send_to_local_area_scene_except(RX, RY, OwnerAddPetBin, RoleSid);
        true -> lib_scene_agent:send_to_scene_except(OwnerAddPetBin, [RoleId])
    end,
    notify_load_self(SceneRole, IsBcastScene),

    {
        BCastSceneRolers, BCastScenePets, BCastSceneMons,
        BCastSceneColls, BCastSceneCarrys, BCastSceneFlyitems
    } = case IsBcastScene of
        false ->
            {
                lib_scene_map:get_broadcast_roler(RX, RY),
                lib_scene_map:get_broadcast_pet(RX, RY),
                lib_scene_map:get_broadcast_mon(RX, RY),
                lib_scene_map:get_broadcast_coll(RX, RY),
                lib_scene_map:get_broadcast_carry(RX, RY),
                lib_scene_map:get_broadcast_flyitem(RX, RY)
            };
        true ->
            {
                lib_scene_agent:get_scene_roler(),
                lib_pet_agent:get_scene_pet(),
                lib_mon_agent:get_scene_mon(),
                lib_coll_agent:get_scene_coll(),
                lib_carry_agent:get_scene_carry(),
                lib_flyitem_agent:get_scene_flyitem()
            }
    end,

    % 通知玩家加载其他玩家
    AddRoleInfosBin = case BCastSceneRolers of
        [] ->
            <<>>;
        BCastSceneRolers ->
            RoleSceneInfos = data_transfer:sc_role_scene_info_list(BCastSceneRolers),
            RoleSceneInfosMsg = #bcast_add_role_scene_info{role_list = RoleSceneInfos},
            {ok, RoleSceneInfosBin} = prot_msg:encode_msg(90232, RoleSceneInfosMsg),
            RoleSceneInfosBin
    end,

    % 通知玩家加载宠物
    AddPetInfosBin = case BCastScenePets of
        [] ->
            <<>>;
        BCastScenePets ->
            PetSceneInfos = data_transfer:sc_pet_scene_info_list(BCastScenePets),
            PetSceneInfosMsg = #bcast_add_pet_scene_info{pet_list = PetSceneInfos},
            element(2, prot_msg:encode_msg(90236, PetSceneInfosMsg))
    end,

    % 通知玩家加载怪物
    AddMonInfosBin = case BCastSceneMons of
        [] ->
            <<>>;
        BCastSceneMons ->
            MonSceneInfos = data_transfer:sc_mon_scene_info_list(BCastSceneMons),
            MonSceneInfosMsg = #bcast_add_mon_scene_info{mon_list = MonSceneInfos},
            element(2, prot_msg:encode_msg(90234, MonSceneInfosMsg))
    end,

    % 通知玩家加载采集物
    AddCollInfosBin = case BCastSceneColls of
        [] ->
            <<>>;
        BCastSceneColls ->
            CollSceneInfos = data_transfer:sc_coll_scene_info_list(BCastSceneColls),
            CollSceneInfosMsg = #bcast_add_coll_scene_info{coll_list = CollSceneInfos},
            element(2, prot_msg:encode_msg(90239, CollSceneInfosMsg))
    end,

    % 通知玩家加载镖车
    AddCarryInfosBin = case BCastSceneCarrys of
        [] ->
            <<>>;
        BCastSceneCarrys ->
            CarrySceneInfos = data_transfer:sc_carry_scene_info_list(BCastSceneCarrys),
            CarrySceneInfosMsg = #bcast_add_carry_scene_info{carry_list = CarrySceneInfos},
            element(2, prot_msg:encode_msg(90253, CarrySceneInfosMsg))
    end,

    % 通知玩家加载飞行道具
    AddFlyitemInfosBin = case BCastSceneFlyitems of
        [] ->
            <<>>;
        BCastSceneFlyitems ->
            FlyitemSceneInfos = data_transfer:sc_flyitem_scene_info_list(BCastSceneFlyitems),
            FlyitemSceneInfosMsg = #bcast_add_flyitem_scene_info{flyitem_list = FlyitemSceneInfos},
            element(2, prot_msg:encode_msg(90257, FlyitemSceneInfosMsg))
    end,

    AddObjBinary = <<
        AddRoleInfosBin/binary, AddPetInfosBin/binary, AddMonInfosBin/binary,
        AddCollInfosBin/binary, AddCarryInfosBin/binary, AddFlyitemInfosBin/binary,
        ExtraBin/binary
    >>,
    lib_role_send:send_to_sid(RoleSid, AddObjBinary),
    ok.

% 可攻击对象检测
check_attackable(SceneRole, NowTimeMS) ->
    #scene_role{declare_map = DeclareMap, rival_map = RivalMap, attackable = Attackable} = SceneRole,
    FilterFun = fun(_RId, Expire) -> Expire > NowTimeMS end,
    DeclareMapN = maps:filter(FilterFun, DeclareMap),
    RivalMapN = maps:filter(FilterFun, RivalMap),
    AttackableListN = maps:keys(DeclareMapN) ++ maps:keys(RivalMapN),
    AttackableN = sets:from_list(AttackableListN),
    case sets:size(Attackable) > sets:size(AttackableN) of
        true ->
            #scene_role{id = RoleId, sid = RoleSid} = SceneRole,
            notify_rivals(RoleSid, AttackableListN),
            lib_pet_agent:update_pets_owner_fields(RoleId, [{'attackable', AttackableN}]),
            SceneRole#scene_role{declare_map = DeclareMapN, rival_map = RivalMapN, attackable = AttackableN};
        false ->
            SceneRole#scene_role{declare_map = DeclareMapN, rival_map = RivalMapN}
    end.

check_send_robot_skills(#scene_role{id = RoleId, team = TeamId} = SceneRole) ->
    case lib_team:get_team_info(TeamId) of
        #{robots := Robots, leader := RoleId} ->
            SceneRobots = [lib_scene_agent:get_roler(RobotId) || RobotId <- Robots],
            send_robot_skills(SceneRole#scene_role.sid, SceneRobots);
        _ ->
            skip
    end.
