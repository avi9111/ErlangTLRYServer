%%-------------------------------------------------------
%% @File     : lib_scene_cmd.erl
%% @Brief    : 场景处理请求逻辑
%% @Author   : cablsbs
%% @Date     : 2018-6-27
%%-------------------------------------------------------
-module(lib_scene_cmd).

-include("log.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("ret_code.hrl").
-include("proto/prot_902.hrl").
-include("proto/prot_903.hrl").

-export([
    scene_cmd/2,
    scene_cmd/3,
    handle_cmd/2
]).

% @spec handle_cmd(Cmd, CmdArgs) -> ignore.
% Cmd               :: atom()
% CmdArgs           :: term()

%% Apis -------------------------------------------------
% @doc 场景cmd (After毫秒后执行Cmd)
% @spec scene_cmd(Cmd, CmdArgs) -> ok.
% Cmd       :: atom()
% CmdArgs   :: tuple()
scene_cmd(Cmd, CmdArgs) ->
    erlang:send(self(), {'handle_cmd', Cmd, CmdArgs}),
    ok.

% @doc 场景cmd (After毫秒后执行Cmd)
% @spec scene_cmd(Cmd, CmdArgs, After) -> ok.
% Cmd       :: atom()
% CmdArgs   :: tuple()
% After     :: integer()
scene_cmd(Cmd, CmdArgs, After) ->
    CmdTime = time:unixtime_ms() + After,
    TimeCmd = {CmdTime, Cmd, CmdArgs},
    TimeList = lib_scene_agent:get_time_list(),
    lib_scene_agent:put_time_list([TimeCmd | TimeList]),
    ok.

% @doc 角色移动
handle_cmd('move', {RoleId, CliX, CliY, ToX, ToY, MoveType, CResetIndex} = _MoveArgs) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{hp = Hp, reset_index = CResetIndex} = SceneRole when Hp > 0 ->
            case catch lib_obj_util:check_move(SceneRole) of
                true ->
%%                    io:format("Module:[~p], Line:[~p],  ...........:~p~n", [?MODULE, ?LINE, {CliX, CliY, ToX, ToY}]),
                    #scene_role{x = SvrX, y = SvrY} = SceneRole,
                    AbsX = if
                        MoveType =:= ?MT_STOP -> abs(SvrX - ToX);
                        true -> abs(SvrX - CliX)
                    end,
                    AbsY = if
                        MoveType =:= ?MT_STOP -> abs(SvrY - ToY);
                        true -> abs(SvrY - CliY)
                    end,
                    if
                        (AbsX + AbsY) > 10 ->
%%                            ?INFO("role move reset_point !~nCurPos: ~p,~nMoveArgs: ~p", [{SvrX, SvrY}, MoveArgs]),
                            SceneRoleN = SceneRole#scene_role{reset_index = CResetIndex + 1},
                            lib_scene_agent:put_roler(SceneRoleN),
                            lib_obj_util:reset_point(SceneRoleN, ?RESET_POS_MOVE);
                        true ->
                            MoveStArgs = [CliX, CliY, ToX, ToY, MoveType],
                            SceneRoleT = lib_obj_role:interrupt_collect(SceneRole, move),
                            SceneRoleN = lib_statem:change_state(?STATE_MOVE, MoveStArgs, #scene_role.statem, SceneRoleT),
                            lib_scene_agent:put_roler(SceneRoleN)
                    end;
                _CheckFail ->
%%                    ?INFO("Check role: ~p move failed ! Reason: ~p", [RoleId, CheckFail]),
                    skip
            end;
        _ ->
            skip
    end,
    ok;

% @doc 玩家结婚花轿巡游特殊移动
handle_cmd('marry_move', {RoleId, ToX, ToY, MoveType}) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{hp = Hp, x = CliX, y = CliY} = SceneRole when Hp > 0 ->
            MoveStArgs = [CliX, CliY, ToX, ToY, MoveType],
            SceneRoleT = lib_obj_role:interrupt_collect(SceneRole, move),
            SceneRoleN = lib_statem:change_state(?STATE_MOVE, MoveStArgs, #scene_role.statem, SceneRoleT),
            lib_scene_agent:put_roler(SceneRoleN);
        _ ->
            skip
    end;

% @doc 角色释放技能
handle_cmd('battle', {AtterKey, DeferKey, Skill, AssistX, AssistY}) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        [] ->
            skip;
        AtterObjInfo ->
            InSitStat = lib_statem:in_sit(AtterObjInfo),
            case data_transfer:to_bt_state(AtterObjInfo) of
                #bt_state{hp = Hp, mp = Mp, skill_list = SkillList, anger = Anger} = AtterBtState when Hp > 0, not InSitStat ->
                    SkillFix = case is_tuple(Skill) of
                        true -> Skill;
                        false -> lists:keyfind(Skill, #skill.id, SkillList)
                    end,
                    case lib_battle_base:goto_battle(AtterBtState, DeferKey, AssistX, AssistY, SkillFix) of
                        {false, _ErrCode, #bt_state{type = ?BATTLE_ROLE} = AtterT} ->
                            AtterObjInfoN = save_battle_to_scene(AtterObjInfo, AtterT),
                            NewSceneRoler = lib_obj_role:interrupt_collect(AtterObjInfoN, battle),
                            lib_scene_agent:put_roler(NewSceneRoler);
                        {true, #bt_state{id = RoleId, type = ?BATTLE_ROLE} = AtterT} ->
                            %% 根据条件触发伤害boss的活跃度项目
                            AtterObjInfoN = save_battle_to_scene(AtterObjInfo, AtterT),
                            #scene_role{mp = MpN, anger = AngerN} = AtterObjInfoN,
                            Mp =/= MpN andalso lib_obj_role:bcast_mp_change(AtterObjInfoN, MpN),
                            Anger =/= AngerN andalso lib_obj_role:notify_anger_change(RoleId, AngerN),
                            SceneRolerT0 = lib_obj_role:interrupt_collect(AtterObjInfoN, battle),
                            SceneRolerN = lib_statem:change_state(?STATE_ATTACK, [], #scene_role.statem, SceneRolerT0),
                            lib_scene_agent:put_roler(SceneRolerN);
                        {false, _ErrCode, #bt_state{type = ?BATTLE_MON} = AtterT} ->
                            AtterObjInfoN = save_battle_to_scene(AtterObjInfo, AtterT),
                            lib_mon_agent:put_mon(AtterObjInfoN);
                        {true, #bt_state{type = ?BATTLE_MON} = AtterT} ->
                            AtterObjInfoN = save_battle_to_scene(AtterObjInfo, AtterT),
                            lib_mon_agent:put_mon(AtterObjInfoN)
                    end;
                _ ->
                    skip
            end
    end,
    ok;

% @doc 宠物移动
handle_cmd('pet_move', {RoleId, PetId, CliX, CliY, ToX, ToY, MoveType, CResetIndex} = MoveArgs) ->
    case lib_pet_agent:get_pet(PetId) of
        #pet{hp = Hp, owner = #{id := RoleId}, reset_index = CResetIndex} = Pet when Hp > 0 ->
            case catch lib_obj_util:check_move(Pet) of
                true ->
                    #pet{x = SvrX, y = SvrY} = Pet,
                    AbsX = abs(SvrX - CliX),
                    AbsY = abs(SvrY - CliY),
                    if
                        (AbsX + AbsY) > 10 andalso (MoveType =/= ?MT_TRANSFER) ->
                            ?INFO("pet move reset_point !~nCurPos: ~p,~nMoveArgs: ~p", [{SvrX, SvrY}, MoveArgs]),
                            PetN = Pet#pet{reset_index = CResetIndex + 1},
                            lib_pet_agent:put_pet(PetN),
                            lib_obj_util:reset_point(PetN, ?RESET_POS_MOVE);
                        true ->
                            MoveStArgs = [CliX, CliY, ToX, ToY, MoveType],
                            PetN = lib_statem:change_state(?STATE_MOVE, MoveStArgs, #pet.statem, Pet),
                            lib_pet_agent:put_pet(PetN)
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok;

% @doc 宠物释放技能
handle_cmd('pet_battle', {AtterKey, DeferKey, Skill, AssistX, AssistY, OwnerId}) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        #pet{hp = Hp, owner = #{id := OwnerId}} = Pet when Hp > 0 ->
            AtterBtState = data_transfer:to_bt_state(Pet),
            case lib_battle_base:goto_battle(AtterBtState, DeferKey, AssistX, AssistY, Skill) of
                {false, _ErrCode, AtterT} ->
                    PetT = save_battle_to_scene(Pet, AtterT),
                    PetN = lib_statem:change_state(?STATE_ATTACK, [], #pet.statem, PetT),
                    lib_pet_agent:put_pet(PetN);
                {true, AtterT} ->
                    PetT = save_battle_to_scene(Pet, AtterT),
                    PetN = lib_statem:change_state(?STATE_ATTACK, [], #pet.statem, PetT),
                    lib_pet_agent:put_pet(PetN)
            end;
        _ ->
            skip
    end,
    ok;

% @doc 服务端触发技能
handle_cmd('trig_battle', {AtterKey, DeferKey, AssistXY, TrigSkill}) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            Atter = data_transfer:to_bt_state(SceneObjInfo),
            case lib_battle_base:trig_battle(Atter, DeferKey, AssistXY, TrigSkill) of
                {ok, AtterN} ->
                    SceneObjInfoN = save_battle_to_scene(SceneObjInfo, AtterN),
                    lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
                ok ->
                    ok
            end;
        _ ->
            ok
    end;

% @doc 技能的多段伤害处理
handle_cmd('skill_hit', {AtterKey, DeferKey, AssistXY, BaseSkill, TimePoint}) ->
    lib_battle_base:skill_hit(AtterKey, DeferKey, AssistXY, BaseSkill, TimePoint);

% @doc 间接触发释放技能
handle_cmd('trig_hit', {AtterKey, DeferKey, BaseSkill, AssistXY, TimePoint}) ->
    lib_battle_base:trig_hit(AtterKey, DeferKey, BaseSkill, AssistXY, TimePoint);

% @doc 使用技能增删效果
handle_cmd('use_skill_effect', {ObjKey, DeferKey, SkillIdLv, SelfBuff, DelEffectTypes}) ->
    case lib_battle_aid:get_scene_obj_info(ObjKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            BtState = data_transfer:to_bt_state(SceneObjInfo),
            BtStateT = lib_effect_mgr:del_by_effect_types(BtState, DelEffectTypes),
            BtStateN = lib_effect_util:add_skill_effect(BtStateT, ObjKey, SkillIdLv, SelfBuff, #{target => DeferKey}),
            SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        _ ->
            skip
    end;

% @doc 怪物复活
handle_cmd('revive_mon', {MId, Args}) ->
    lib_mon_agent:create_mon(MId, Args);

% @doc 全单位回满(满血，满蓝)
handle_cmd('all_unit_recover', RoleId) ->
    add_unit_hp_mp(RoleId, ?UINT32_MAX, ?UINT32_MAX, ?UINT32_MAX);

% @doc 单位回蓝回血
handle_cmd('add_unit_hp_mp', {RoleId, HVal, MVal, PetHVal}) ->
    add_unit_hp_mp(RoleId, HVal, MVal, PetHVal);

% @doc 添加效果
handle_cmd('add_effect', {Caster, Target, AddEffect}) ->
    lib_effect_util:add_effect(Caster, Target, AddEffect);

% @doc 添加多个效果
handle_cmd('add_effects', {Caster, Target, AddEffects}) ->
    lib_effect_util:add_effects(Caster, Target, AddEffects);

% @doc 删出效果(根据配置id)
handle_cmd('del_effect_by_id', {TargetKey, EffectId}) ->
    lib_effect_util:del_by_effect_ids(TargetKey, [EffectId]);

% @doc 删除效果(根据效果唯一id)
handle_cmd('del_effect_by_aids', {TargetKey, EffectAIds}) ->
    lib_effect_util:del_by_effect_aids(TargetKey, EffectAIds);

% @doc 删除效果(根据效果配置id列表)
handle_cmd('del_effects', {TargetKey, EffectIds}) ->
    lib_effect_util:del_by_effect_ids(TargetKey, EffectIds);

% @doc 处理额外技能
handle_cmd('extra_effect', {AtterKey, DeferKeys, ExtraEffects, ExtraChkArgs}) ->
    lib_battle_base:extra_effect(AtterKey, DeferKeys, ExtraEffects, ExtraChkArgs);

% @doc 蓄力技能
handle_cmd('pre_skill', {AtterKey, PreSkillArgs, Op, Skill, TimeStampMS}) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        #mon{hp = Hp} = Mon when Hp > 0 ->
            do_pre_skill(Mon, PreSkillArgs, Op, Skill, TimeStampMS);
        #scene_role{hp = Hp, skill_list = SkillList} = SceneRole when Hp > 0 ->
            SkillFix = case is_tuple(Skill) of
                true -> Skill;
                false -> lists:keyfind(Skill, #skill.id, SkillList)
            end,
            do_pre_skill(SceneRole, PreSkillArgs, Op, SkillFix, TimeStampMS);
        _ ->
            skip
    end;

% @doc 宠物蓄力技能(要验证归属者)
handle_cmd('pet_pre_skill', {AtterKey, PreSkillArgs, Op, Skill, TimeStampMS, OwnerId}) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        #pet{hp = Hp, owner = #{id := OwnerId}} = AtterObjInfo when Hp > 0 ->
            do_pre_skill(AtterObjInfo, PreSkillArgs, Op, Skill, TimeStampMS);
        _ ->
            skip
    end;

% @doc 位移技能的冲刺逻辑，使自身或攻击目标位移
handle_cmd('rush', {ResetList, ResetType}) ->% when is_integer(SkillId) ->
    RushFun = fun({{ToX, ToY}, ObjKey}) ->
        case lib_battle_aid:get_scene_obj_info(ObjKey) of
            #mon{hp = Hp} = Mon when Hp > 0 ->
                MonN = Mon#mon{
                    x = ToX, y = ToY, to_xy = {ToX, ToY}, float_xy = {ToX, ToY},
                    gradient = {0, 0}, move_type = ?MT_STOP
                },
                lib_mon_agent:put_mon(MonN),
                lib_obj_util:reset_point(MonN, ResetType);
            #scene_role{hp = Hp} = SceneRole when Hp > 0 ->
                SceneRoleT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, SceneRole),
                ResetIndexN = SceneRoleT#scene_role.reset_index + 1,
                SceneRoleN = SceneRoleT#scene_role{
                    to_xy = {ToX, ToY}, gradient = {0, 0},
                    move_type = ?MT_STOP, reset_index = ResetIndexN
                },
                lib_scene_agent:put_roler(SceneRoleN),
                lib_obj_util:reset_point(SceneRoleN, ResetType);
            #pet{hp = Hp} = Pet when Hp > 0 ->
                ResetIndexN = Pet#pet.reset_index + 1,
                PetN = Pet#pet{
                    x = ToX, y = ToY, to_xy = {ToX, ToY}, float_xy = {ToX, ToY},
                    gradient = {0, 0}, move_type = ?MT_STOP, reset_index = ResetIndexN
                },
                lib_pet_agent:put_pet(PetN),
                lib_obj_util:reset_point(PetN, ResetType);
            _ ->
                skip
        end
    end,
    lists:foreach(RushFun, ResetList);

% @doc 采集操作
handle_cmd('collect', {RoleId, CollId, Opt}) ->
    case lib_coll_agent:get_coll(CollId) of
        % 共享类型采集物
        #coll{type = Type, cid = CID, owner = Owner, realm = CRealm} = Coll when Type =:= ?COLL_SHARING orelse Type =:= ?COLL_TERRITORY ->
            SceneRole = lib_scene_agent:get_roler(RoleId),
            #scene_role{realm = RRealm} = SceneRole,
            OwnerCheck = collect_check(SceneRole, Owner),
            if
                Type =:= ?COLL_TERRITORY andalso CRealm =:= RRealm ->
                    ?ERROR_TOC(RoleId, ?RC_COLL_NEED_DIFF_REALM);
                OwnerCheck ->
                    Quick = maps:get(quick, Opt, false),
                    %% 领地战夺旗减少时间
                    CutPerc = maps:get(cut_perc, Opt, 0),
                    #coll{interruptable = Interruptable, collectors = Collectors} = Coll,
                    ConfColl = conf_coll:get(CID),
                    #{quick_dur := QuickDur, duration := Duration} = ConfColl,
                    AccTime = ?iif(Quick, Duration - QuickDur, 0),
                    CutTime = erlang:floor(Duration * CutPerc),
                    CollectorsN = lists:keystore(RoleId, 1, Collectors, {RoleId, time:unixtime_ms() - AccTime - CutTime}),
                    CollN = case (Coll#coll.statem)#statem.cur_state_id =:= ?STATE_BECOLLECT of
                        true ->
                            Coll#coll{collectors = CollectorsN};
                        false ->
                            lib_statem:change_state(?STATE_BECOLLECT, [RoleId], #coll.statem, Coll#coll{collectors = CollectorsN})
                    end,
                    lib_obj_util:bcast_collect_op(CollN, RoleId, ?COLL_OP_START),
                    lib_scene_agent:put_roler(SceneRole#scene_role{collecting = #{id => CollId, interruptable => Interruptable, quick => Quick}}),
                    lib_coll_agent:put_coll(CollN);
                is_integer(OwnerCheck) ->
                    ?ERROR_TOC(SceneRole, OwnerCheck);
                true ->
                    ?ERROR_TOC(RoleId, ?RC_COLL_ILLEGAL_COLLECT)
            end;
        % 独占类型采集物
        #coll{statem = Statem, owner = Owner} = Coll when Statem#statem.cur_state_id =/= ?STATE_BECOLLECT ->
            SceneRole = lib_scene_agent:get_roler(RoleId),
            OwnerCheck = collect_check(SceneRole, Owner),
            if
                OwnerCheck ->
                    Interruptable = Coll#coll.interruptable,
                    Collectors = [{RoleId, time:unixtime_ms()}],
                    CollT = Coll#coll{collectors = Collectors},
                    CollN = lib_statem:change_state(?STATE_BECOLLECT, [RoleId], #coll.statem, CollT),
                    lib_obj_util:bcast_collect_op(CollN, RoleId, ?COLL_OP_START),
                    lib_scene_agent:put_roler(SceneRole#scene_role{collecting = #{id => CollId, interruptable => Interruptable}}),
                    lib_coll_agent:put_coll(CollN);
                is_integer(OwnerCheck) ->
                    ?ERROR_TOC(SceneRole, OwnerCheck);
                true ->
                    ?ERROR_TOC(RoleId, ?RC_COLL_ILLEGAL_COLLECT)
            end;
        _ ->
            ?ERROR_TOC(RoleId, ?RC_COLL_ILLEGAL_COLLECT)
    end;

% @doc 切换场景模式
handle_cmd('change_scene_mode', {RoleId, Mode}) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{mode = OriMode, hp = Hp} = SceneRoler when Hp > 0, Mode =/= OriMode ->
            lib_scene_agent:put_roler(SceneRoler#scene_role{mode = Mode}),
            lib_pet_agent:update_pets_owner_fields(RoleId, [{mode, Mode}]);
        _ ->
            skip
    end,
    ok;

% @doc 死亡清除效果
handle_cmd('effect_dead_clear', ObjKey) ->
    lib_effect_util:dead_clear(ObjKey);

% @doc 异步处理被动中断采集
handle_cmd('collect_interrupted', RoleId) ->
    case lib_battle_aid:get_scene_obj_info({?BATTLE_ROLE, RoleId}) of
        #scene_role{collecting = Collecting} = SceneRole when Collecting =/= 0 ->
            SceneRoleN = lib_obj_role:interrupt_collect(SceneRole, be_ctrl),
            lib_battle_aid:put_scene_obj_info(SceneRoleN);
        _ ->
            skip
    end;

% @doc 修改对象血量逻辑(走技能伤害同步)
handle_cmd('alter_obj_hp', {AtterKey, DeferKey, HarmType, Injury, TimeStampMS}) ->
    lib_battle_base:alter_obj_hp(AtterKey, DeferKey, HarmType, Injury, TimeStampMS);

% @doc 修改角色蓝量逻辑
handle_cmd('alter_role_mp', {RoleId, DeltaMp}) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} = SceneRole ->
            SceneRoleN = lib_obj_role:alter_role_mp(SceneRole, DeltaMp),
            lib_scene_agent:put_roler(SceneRoleN);
        _ ->
            skip
    end;

% @doc 添加结婚buff
handle_cmd('check_add_marriage_effect', {RoleId, RMarryPSkillLv, MateId}) ->
    case lib_scene_agent:get_roler(MateId) of
        #scene_role{mod_pskills = ModPSkills} ->
            MMarryPSkillLv = lib_obj_role:get_marry_pskill_lv(ModPSkills),
            L1 = conf_marry_skill:get_effect(40000003, RMarryPSkillLv),
            L1 =/= [] andalso lib_effect_util:add_effect({?BATTLE_ROLE, RoleId}, {?BATTLE_ROLE, MateId}, erlang:hd(L1)),
            L2 = conf_marry_skill:get_effect(40000003, MMarryPSkillLv),
            L2 =/= [] andalso lib_effect_util:add_effect({?BATTLE_ROLE, MateId}, {?BATTLE_ROLE, RoleId}, erlang:hd(L2));
        _ ->
            skip
    end;

handle_cmd('check_del_marriage_effect', RoleId) ->
% @doc 移除结婚buff
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} ->
            [{EffectId, _Lv}] = conf_marry_skill:get_effect(40000003, 1),
            lib_effect_util:del_by_effect_ids({?BATTLE_ROLE, RoleId}, [EffectId]);
        _ ->
            skip
    end;

% @doc 珍兽分担主人伤害
handle_cmd('pet_partake', {PetId, PetInjury, AtterKey}) ->
    DeferKey = {?BATTLE_PET, PetId},
    HarmType = ?HARM_TYPE_PET_PARTAKE,
    TimeStampMS = time:unixtime_ms(),
    lib_battle_base:alter_obj_hp(AtterKey, DeferKey, HarmType, PetInjury, TimeStampMS);

% @doc 主动移除隐身效果
handle_cmd('del_invisible', ObjKey) ->
    case lib_battle_aid:get_scene_obj_info(ObjKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            BtState = data_transfer:to_bt_state(SceneObjInfo),
            BtStateN = lib_effect_util:del_invisible(BtState),
            SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        _ ->
            skip
    end;

% @doc 怪物被控制
handle_cmd('mon_be_ctrl', MonId) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{} = Mon ->
% 是否失明
            case lib_effect_util:is_blind(Mon) of
                true -> lib_obj_mon:mon_blind(Mon);
                false -> skip
            end;
        _ ->
            skip
    end;

% @doc 怪物恢复视力
handle_cmd('mon_has_sight', MonId) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{} = Mon ->
            case lib_effect_util:is_blind(Mon) of
                true -> skip;
                false -> lib_obj_mon:mon_has_sight(Mon)
            end;
        _ ->
            skip
    end;

% 默认匹配
handle_cmd(Cmd, Args) ->
    ?ERROR("Unexpected scene Cmd: ~p, Args: ~p", [Cmd, Args]).


%% Privates ---------------------------------------------
% 场景战斗回存
save_battle_to_scene(#mon{} = AtterObjInfo, Atter) ->
    #bt_state{
        x = X, y = Y, hp = Hp, attr = BtAttr, skill_cd = SkillCd,
        effect_list = EffectList, effect_cd = EffectCd, pre_skill = PreSkill
    } = Atter,
    AtterObjInfoN = AtterObjInfo#mon{
        x = X, y = Y, hp = Hp, bt_attr = BtAttr, skill_cd = SkillCd,
        effect_list = EffectList, effect_cd = EffectCd, pre_skill = PreSkill
    },
    AtterObjInfoN;
save_battle_to_scene(#scene_role{} = AtterObjInfo, Atter) ->
    #bt_state{
        x = X, y = Y, hp = Hp, mp = Mp, anger = Anger, attr = BtAttr,
        skill_cd = SkillCd, effect_list = EffectList, effect_cd = EffectCd,
        pre_skill = PreSkill, psdh_skill_his = PsdhSkillHis
    } = Atter,
    AtterObjInfoN = AtterObjInfo#scene_role{
        x = X, y = Y, hp = Hp, mp = Mp, anger = Anger, bt_attr = BtAttr,
        skill_cd = SkillCd, effect_list = EffectList, effect_cd = EffectCd,
        pre_skill = PreSkill, psdh_skill_his = PsdhSkillHis
    },
    AtterObjInfoN;
save_battle_to_scene(#pet{} = AtterObjInfo, Atter) ->
    #bt_state{
        x = X, y = Y, hp = Hp, attr = BtAttr, skill_cd = SkillCd,
        effect_list = EffectList, effect_cd = EffectCd, pre_skill = PreSkill
    } = Atter,
    AtterObjInfoN = AtterObjInfo#pet{
        x = X, y = Y, hp = Hp, bt_attr = BtAttr, skill_cd = SkillCd,
        effect_list = EffectList, effect_cd = EffectCd, pre_skill = PreSkill
    },
    AtterObjInfoN.

% 蓄力技能 - 开始
do_pre_skill(SceneObjInfo, PreSkillArgs, ?PRE_SKILL_BEG, #skill{} = Skill, TimeStampMS) ->
    #skill{id = SkillId, level = SkillLv} = Skill,
    {ObjType, ObjId, X, Y, FieldIndex, CurPreSkill, PreSkillConf} = case SceneObjInfo of
        #scene_role{id = RoleId, x = RX, y = RY, pre_skill = RCurPreSkill, skill_confs = SkillConfs} ->
            BaseSkill = case lists:keyfind(SkillId, #base_skill.id, SkillConfs) of
                false -> conf_skill:get_base(Skill#skill.id, Skill#skill.level);
                SkillConf -> SkillConf
            end,
            {?BATTLE_ROLE, RoleId, RX, RY, #scene_role.pre_skill, RCurPreSkill, BaseSkill};
        #pet{id = PetId, x = PX, y = PY, pre_skill = PCurPreSkill} ->
            BaseSkill = conf_skill:get_base(SkillId, SkillLv),
            {?BATTLE_PET, PetId, PX, PY, #pet.pre_skill, PCurPreSkill, BaseSkill};
        #mon{id = MonId, x = MX, y = MY, pre_skill = MCurPreSkill} ->
            BaseSkill = conf_skill:get_base(SkillId, SkillLv),
            {?BATTLE_MON, MonId, MX, MY, #mon.pre_skill, MCurPreSkill, BaseSkill}
    end,
    PreTime = PreSkillConf#base_skill.pre_time,
    case CurPreSkill of
        none ->
            NewPreSkill = {SkillId, TimeStampMS + PreTime, preparing},
            SceneObjInfoN = setelement(FieldIndex, SceneObjInfo, NewPreSkill),
            bcast_pre_skill(X, Y, ObjType, ObjId, PreSkillArgs, Skill),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        {OriSkillId, EndTimeMS, preparing} when OriSkillId =/= SkillId orelse EndTimeMS + 2500 < TimeStampMS ->
            NewPreSkill = {SkillId, TimeStampMS + PreTime, preparing},
            SceneObjInfoN = setelement(FieldIndex, SceneObjInfo, NewPreSkill),
            bcast_pre_skill(X, Y, ObjType, ObjId, PreSkillArgs, Skill),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        CurPreSkill ->
            skip
    end;
% 蓄力技能 - 正常结束
do_pre_skill(SceneObjInfo, PreSkillArgs, ?PRE_SKILL_END, #skill{} = Skill, NowTimeMS) ->
    {ObjType, ObjId, X, Y, FieldIndex, PreSkill} = case SceneObjInfo of
        #scene_role{id = RoleId, x = RX, y = RY, pre_skill = RCurPreSkill} ->
            {?BATTLE_ROLE, RoleId, RX, RY, #scene_role.pre_skill, RCurPreSkill};
        #pet{id = PetId, x = PX, y = PY, pre_skill = PCurPreSkill} ->
            {?BATTLE_PET, PetId, PX, PY, #pet.pre_skill, PCurPreSkill};
        #mon{id = MonId, x = MX, y = MY, pre_skill = MCurPreSkill} ->
            {?BATTLE_MON, MonId, MX, MY, #mon.pre_skill, MCurPreSkill}
    end,
    #skill{id = SkillId} = Skill,
    case PreSkill of
        {SkillId, EndTimeMS, preparing} when EndTimeMS < NowTimeMS + 250 ->
            % 蓄力技能 - 正常结束
            NewPreSkill = {SkillId, NowTimeMS + 3000, ready},
            SceneObjInfoN = setelement(FieldIndex, SceneObjInfo, NewPreSkill),
            bcast_pre_skill(X, Y, ObjType, ObjId, PreSkillArgs, Skill),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        {SkillId, _EndTimeMS, preparing} ->
            % 蓄力技能 - 异常提前结束(不广播)
            SceneObjInfoN = setelement(FieldIndex, SceneObjInfo, none),
            bcast_pre_skill(X, Y, ObjType, ObjId, PreSkillArgs, Skill),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        _ ->
            % 其他情况
            SceneObjInfoN = setelement(FieldIndex, SceneObjInfo, none),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN)
    end;
% 蓄力技能 - 取消蓄力(怪物用)
do_pre_skill(SceneObjInfo, PreSkillArgs, ?PRE_SKILL_CANCEL, Skill, _NowTimeMS) ->
    #mon{id = MonId, x = MX, y = MY} = SceneObjInfo,
    SceneObjInfoN = setelement(#mon.pre_skill, SceneObjInfo, none),
    bcast_pre_skill(MX, MY, ?BATTLE_MON, MonId, PreSkillArgs, Skill),
    lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
% 蓄力技能 (未定义操作)
do_pre_skill(#scene_role{id = RoleId}, _PreSkillArgs, Op, Skill, _NowTimeMS) ->
    ?ERROR("pre skill error !~nRoleId: ~p, Skill: ~p, Op: ~p", [RoleId, Skill, Op]),
    skip.

% 广播蓄力技能
bcast_pre_skill(X, Y, ObjType, ObjId, PreSkillArgs, Skill) ->
    #skill{id = SkillId, level = SkillLv, hero = Hero, legend = Legend} = Skill,
    {DeferType, DeferId, AssistX, AssistY, Op} = PreSkillArgs,
    Msg = #bcast_pre_skill{
        atter_type = ObjType, atter_id = ObjId, defer_type = DeferType,
        defer_id = DeferId, assist_x = AssistX, assist_y = AssistY, op = Op,
        skill_id = SkillId, skill_lv = SkillLv, hero = Hero, legend = Legend
    },
    {ok, Bin} = prot_msg:encode_msg(90304, Msg),
    lib_scene_agent:send_to_local_area_scene(X, Y, Bin).

% 采集条件检测
collect_check(#scene_role{id = RoleId, collecting = 0}, Owner) ->
    OwnerId = maps:get(id, Owner, 0),
    if
        OwnerId =:= 0 -> true;
        OwnerId =:= RoleId -> true;
        true -> ?RC_COLL_ILLEGAL_COLLECT
    end;
% 正在采集
collect_check(_SceneRole, _Owner) ->
    ?RC_COLL_IS_COLLECTING.

% 单位回蓝回血
add_unit_hp_mp(RoleId, HVal, MVal, PetHVal) ->
    case lib_scene_agent:get_roler(RoleId) of
        #scene_role{} = SceneRole ->
            SceneRoleT = lib_obj_role:alter_role_mp(SceneRole, MVal),
            lib_obj_util:add_obj_hp_restore(SceneRoleT, HVal),
            case lib_pet_agent:get_role_pet(RoleId) of
                #pet{} = Pet -> lib_obj_util:add_obj_hp_restore(Pet, PetHVal);
                _ -> ignore
            end;
        _ ->
            ignore
    end.
