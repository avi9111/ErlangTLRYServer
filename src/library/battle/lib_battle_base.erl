%%-------------------------------------------------------
%% @File     : lib_battle_base
%% @Brief    : 战斗基础过程函数
%% @Author   : cablsbs
%% @Date     : 2018-7-6
%%-------------------------------------------------------
-module(lib_battle_base).

-include("role.hrl").
-include("skill.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("ret_code.hrl").
-include("proto/prot_903.hrl").

-export([
    goto_battle/5,
    trig_battle/4,
    skill_hit/5,
    trig_hit/5,
    extra_effect/4,
    alter_obj_hp/5,
    bcast_attack/3
]).

% @doc 发起战斗 处理主动技能，副技能
% @spec goto_battle(Atter, DeferKey, AssistX, AssistY, Skill) -> BattleResult.
% Result            :: {true, AtterN} | {false, Error, AtterN}
% Atter = AtterN    :: #bt_state{}
% DeferKey          :: {DeferType :: 1 | 2 , DeferId :: integer()}
% AssistX = AssistY :: integer()
% Skill         :: #skill{}
goto_battle(Atter, DeferKey, AssistX, AssistY, #skill{} = Skill) ->
    NowTimeMS = time:unixtime_ms(),
    case catch lib_battle_chk:check_use_skill(Atter, DeferKey, {AssistX, AssistY}, Skill, NowTimeMS) of
        {true, BaseSkill, AtterChecked} ->
            use_skill(AtterChecked, DeferKey, AssistX, AssistY, BaseSkill, NowTimeMS);
        {false, SkillError} ->
%%            ?INFO("check_use_skill error: ~p", [{SkillError, Skill}]),
            {false, SkillError, Atter}
    end;
% @doc 竞技场，对手玩家攻击使用的是 SkillId
% goto_battle(Atter, DeferKey, AssistX, AssistY, SkillId) when is_integer(SkillId) ->
%     Skill = lists:keyfind(SkillId, #skill.id, Atter#bt_state.skill_list),
%     goto_battle(Atter, DeferKey, AssistX, AssistY, Skill);
goto_battle(Atter, _DeferKey, _AssistX, _AssistY, Skill) ->
%%    ?INFO("check_use_skill: ~p error !", [Skill]),
    {false, ?RC_SKILL_NOT_FOUND, Atter}.


% @doc 服务端逻辑触发的战斗(如飞行道具、效果等触发技能)
% @spec trig_battle(Atter, DeferKey, AssistXY, Skill) -> BattleResult.
% BattleResult      :: {ok, AtterN} | ok
% Atter = AtterN    :: #bt_state{}
% DeferKey          :: {DeferType :: 1 | 2 , DeferId :: integer()}
% AssistXY          :: {integer(), integer()}
% Skill             :: {integer(), integer()}
trig_battle(Atter, DeferKey, {AssistX, AssistY} = AssistXY, {SkillId, SkillLv}) ->
    AtterKey = {Atter#bt_state.type, Atter#bt_state.id},
    case conf_skill:get_base(SkillId, SkillLv) of
        #base_skill{att_times = AttTimes} = BaseSkill ->
            NowTimeMS = time:unixtime_ms(),
            SeqTimeFun = fun(TimeGap, {AccTimePoint, AccTimeList}) ->
                ExecTime = NowTimeMS + TimeGap,
                CmdArgs = {AtterKey, DeferKey, AssistXY, BaseSkill, AccTimePoint},
                {AccTimePoint + 1, [{ExecTime, 'trig_hit', CmdArgs} | AccTimeList]}
            end,
            TimeList = lib_scene_agent:get_time_list(),
            {_Index, TimeListN} = lists:foldl(SeqTimeFun, {1, TimeList}, AttTimes),
            lib_scene_agent:put_time_list(TimeListN),

            % 广播释放技能
            SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, AssistX, AssistY),
            bcast_attack(AtterKey, DeferKey, AssistX, AssistY, BaseSkill, 1, SidList),
            {ok, Atter};
        _ ->
            ?ERROR(
                "AtterKey: ~p trig undefined skill: ~p, StackTrace: ~p",
                [AtterKey, {SkillId, SkillLv}, erlang:get_stacktrace()]
            ),
            ok
    end.

% @doc 技能的多段伤害处理
% @spec 所有对Atter的更新，都要从进程字典里面取出，更新后马上写回进程字典
% @spec skill_hit(AtterKey, DeferKey, BaseSkill, AssistXY, TimePoint) -> ok.
% AtterKey = DeferKey           :: {Type, Id}
% AssistXY                      :: {X, Y}
% Type = Id = X = Y = TimePoint :: integer()
% BaseSkill                     :: #base_skill{}
% 飞行道具技能(创建飞行道具)
skill_hit(AtterKey, DeferKey, AssistXY, #base_skill{flyitems = Flyitems} = BaseSkill, _TimePoint) when Flyitems =/= [] ->
    create_flyitems(AtterKey, DeferKey, BaseSkill, AssistXY),
    ok;
% 常规技能
skill_hit(AtterKey, DeferKey, AssistXY, #base_skill{category = Category} = BaseSkill, TimePoint) when Category =< ?SKILL_CATEGORY_PET ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        [] ->
            skip;
        % 人物、怪物及珍兽普通技能逻辑(不改变自己属性)
        AtterInfo ->
            AtterT = data_transfer:to_bt_state(AtterInfo),                              % 攻方结构转换
            Atter = calc_bt_attr_addon(AtterT, BaseSkill),                              % 技能前置属性加成
            DefList = get_def_list(Atter, DeferKey, AssistXY, BaseSkill, TimePoint),    % 选择目标,并更新宣战列表

            % 计算伤害
            {DefAfBtList, {_, TotalInjury, SuckedBlood, HitNum, IsCrit}} = lists:mapfoldl(
                fun(DeferX, {IsMain, AccInjury, AccSuckedBlood, AccHitNum, AccIsCrit}) ->
                    {BattleSingleRet, TInjury, TIsCrit, HarmType} =
                        battle_single(Atter, DeferX, BaseSkill, TimePoint, IsMain),
                    {AccInjuryN, AccHitNumN} = case TInjury =< 0 andalso is_hit(HarmType) of
                        true -> {TInjury + AccInjury, AccHitNum + 1};
                        false -> {AccInjury, AccHitNum}
                    end,
                    #base_skill{suck_blood_ratio = SuckBloodRatio, suck_blood_fact = SuckBloodFact} = BaseSkill,
                    AccSuckedBloodN = case TInjury < 0 andalso util:is_bingo(SuckBloodRatio) of
                        true -> trunc(-TInjury * SuckBloodFact) + AccSuckedBlood;
                        false -> AccSuckedBlood
                    end,
                    AccIsCritN = AccIsCrit orelse TIsCrit,
                    {BattleSingleRet, {false, AccInjuryN, AccSuckedBloodN, AccHitNumN, AccIsCritN}}
                end, {true, 0, 0, 0, false}, DefList
            ),

            % 第一段伤害才有可能继续以下判断
            #base_skill{id = SkillId, level = SkillLv, extra_buff = ExtraBuff} = BaseSkill,
            (TimePoint =:= 1 andalso TotalInjury =< 0) andalso begin
                lib_effect_util:on_hit_target(Atter, IsCrit, HitNum, TotalInjury),
                Category =/= ?SKILL_CATEGORY_SPURTING andalso                                               % 触发溅射技能
                    check_trigger_spurting_skill(Atter, DeferKey, SkillLv, AssistXY),
                ExtraBuff =:= {} orelse begin                                                               % 额外buff计算
                    ExtraChkArgs = #{
                        is_crit => IsCrit, hit_num => HitNum, skill_lv => SkillLv,
                        atter_xy => {Atter#bt_state.x, Atter#bt_state.y}
                    },
                    DeferKeys = [{DType, DId} || #bt_state{type = DType, id = DId} <- DefList],
                    lib_scene_cmd:scene_cmd('extra_effect', {AtterKey, DeferKeys, ExtraBuff, ExtraChkArgs})
                end
            end,

            % 吸血回血逻辑
            NowTimeMS = time:unixtime_ms(),
            #base_skill{rec_blood_ratio = RecBloodRatio, rec_blood_perc = RecBloodPerc} = BaseSkill,
            (SuckedBlood > 0 orelse util:is_bingo(RecBloodRatio)) andalso begin
                AtterAtt = lib_battle_aid:get_att(Atter),
                SuckedBloodN = SuckedBlood + (RecBloodPerc * HitNum * AtterAtt) div 10000,
                lib_scene_cmd:scene_cmd('alter_obj_hp', {AtterKey, AtterKey, ?HARM_TYPE_SKILL, SuckedBloodN, NowTimeMS})
            end,

            % 移除一次暴击buff
            IsCrit andalso lib_effect_util:del_onetime_crit(Atter, SkillId),

            % 吸气回气逻辑
            #base_skill{rec_magic_ratio = RecMagicRatio, rec_magic_perc = RecMagicPerc} = BaseSkill,
            util:is_bingo(RecMagicRatio) andalso do_suck_magic_logic(AtterKey, RecMagicPerc),

            % 暴击移除技能cd
            IsCrit andalso crit_remove_skill_cd(AtterKey, BaseSkill#base_skill.remove_cd),

            % 技能特殊效果
            if
                Category =:= ?SKILL_CATEGORY_POS orelse BaseSkill#base_skill.pos_type =/= 0 ->
                    do_pos_skill_logic(Atter, DeferKey, DefAfBtList, BaseSkill, AssistXY);                  % 位移技能
                Category =:= ?SKILL_CATEGORY_DUPLICATE ->
                    do_duplicate_skill_logic(AtterKey, DeferKey, BaseSkill, AssistXY);                      % 复刻技能
                true ->
                    skip
            end,
            TimePoint =:= 1 andalso lib_effect_util:on_use_skill(Atter, DeferKey, BaseSkill),               % 使用技能逻辑(尽可能放在后面)

            % 广播及回存
            #bt_state{x = AtterX, y = AtterY} = Atter,
            SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, AtterX, AtterY),
            bcast_battle_harm(Atter, DefAfBtList, AssistXY, BaseSkill, SidList),
            [update_defer_info(Atter, DeferN, HarmSeq, SkillId, NowTimeMS) || {HarmSeq, _, DeferN} <- DefAfBtList]
    end,
    ok;
% 珍兽特殊技能效果
skill_hit(AtterKey, DeferKey, AssistXY, #base_skill{category = Category} = BaseSkill, _TimePoint) when Category =< ?SKILL_CATEGORY_PET_EFFECT ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        [] ->
            skip;
        #pet{id = PetId} = AtterInfo ->
            % 珍兽辅助技能(同时改变自己和目标的属性)
            Atter = data_transfer:to_bt_state(AtterInfo),
            #base_skill{to_obj = ToObj, att_area = [AttArea|_]} = BaseSkill,
            case lib_battle_aid:get_target_list(Atter, DeferKey, AssistXY, ToObj, AttArea) of
                [#bt_state{id = DeferId} | _] when Category =:= ?SKILL_CATEGORY_PET_ATTR ->
                    pet_attr_assist(AtterInfo, DeferId, BaseSkill);
                [DeferBtState | _] when Category =:= ?SKILL_CATEGORY_PET_EFFECT ->
                    pet_effect_assist({?BATTLE_PET, PetId}, DeferBtState, BaseSkill);
                DeferList ->
                    ?ERROR("Get defer list failed: ~p", [DeferList])
            end;
        _ ->
            ?ERROR("Bad skill hit request !")
    end,
    ok.

% @doc 飞行道具/buff发动技能
% @spec trig_hit(AtterKey, DeferKey, BaseSkill, AssistXY, TimePoint) -> ok.
% AtterKey  = DeferKey          :: {Type, Id}
% DeferKey                      :: {Type, Id}
% AssistXY                      :: {X, Y}
% Type = Id = X = Y = TimePoint :: integer()
% BaseSkill                     :: #base_skill{}
trig_hit(AtterKey, DeferKey, AssistXY, BaseSkill, TimePoint) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        [] ->
            skip;
        AtterObjInfo ->
            Atter = data_transfer:to_bt_state(AtterObjInfo),
            {AssistX, AssistY} = AssistXY,
            AtterT = Atter#bt_state{x = AssistX, y = AssistY},
            DefList = get_def_list(AtterT, DeferKey, AssistXY, BaseSkill, TimePoint),                           % 选择目标,并更新宣战列表

            % 计算伤害并处理技能效果
            {DefAfBtList, _} = lists:mapfoldl(
                fun(DeferX, {AccHitNum, IsMain}) ->
                    {BattleSingleRet, TInjury, _, HarmType} = battle_single(Atter, DeferX, BaseSkill, 1, IsMain),
                    AccHitNumN = case TInjury =< 0 andalso is_hit(HarmType) of
                        true -> AccHitNum + 1;
                        false -> AccHitNum
                    end,
                    {BattleSingleRet, {AccHitNumN, false}}
                end, {0, true}, DefList
            ),
            TimePoint =:= 1 andalso lib_effect_util:on_use_skill(Atter, DeferKey, BaseSkill),

            % 广播及回存
            NowTimeMS = time:unixtime_ms(),
            SkillId = BaseSkill#base_skill.id,
            SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, AssistX, AssistY),
            bcast_battle_harm(Atter, DefAfBtList, AssistXY, BaseSkill, SidList),
            [update_defer_info(Atter, DeferN, HarmSeq, SkillId, NowTimeMS) || {HarmSeq, _, DeferN} <- DefAfBtList]
    end,
    ok.

% @doc 技能额外效果
extra_effect(AtterKey, DeferKeys, {{?EXTRA_EF_OBJ_SELF, CondType, Cond}, {ToObj, Effect}}, ChkArgs) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            Atter = data_transfer:to_bt_state(SceneObjInfo),
            case lib_battle_chk:check_extra_ef_cond(Atter, CondType, Cond, ChkArgs) of
                true ->
                    AddEffect = case is_integer(Effect) of
                        true -> {Effect, maps:get(skill_lv, ChkArgs, 1)};
                        false -> Effect
                    end,
                    case ToObj of
                        ?EXTRA_EF_OBJ_SELF ->
                            lib_effect_util:add_effect(AtterKey, AtterKey, AddEffect);
                        ?EXTRA_EF_OBJ_TARGET ->
                            [lib_effect_util:add_effect(AtterKey, DeferKey, AddEffect) || DeferKey <- DeferKeys]
                    end;
                _ ->
                    skip
            end;
        _ ->
            skip
    end;
extra_effect(AtterKey, DeferKeys, {{?EXTRA_EF_OBJ_TARGET, CondType, Cond}, {_ToObj, Effect}}, ChkArgs) ->
    AddEffect = case is_integer(Effect) of
        true -> {Effect, maps:get(skill_lv, ChkArgs, 1)};
        false -> Effect
    end,
    [
        begin
            case lib_battle_aid:get_scene_obj_info(DeferKey) of
                DeferSceneInfo when is_tuple(DeferSceneInfo) ->
                    Defer = data_transfer:to_bt_state(DeferSceneInfo),
                    CheckRet = lib_battle_chk:check_extra_ef_cond(Defer, CondType, Cond, ChkArgs),
                    CheckRet andalso lib_effect_util:add_effect(AtterKey, DeferKey, AddEffect);
                _ ->
                    skip
            end
        end || DeferKey <- DeferKeys
    ];
extra_effect(_AtterKey, _DeferKeys, _ExtraEffect, _ChkArgs) ->
    ?ERROR("Bad extra_buff conf: ~p", [_ExtraEffect]),
    ok.

% @doc 修改场景对象血量(用于直接增加和减少，如血量效果和反震伤害， 此函数会中断玩家的操作)
alter_obj_hp(AtterKey, DeferKey, HarmType, Injury, TimeStampMS) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        AtterSceneInfo when is_tuple(AtterSceneInfo) ->
            case lib_battle_aid:get_scene_obj_info(DeferKey) of
                DeferSceneInfo when is_tuple(DeferSceneInfo) ->
                    Atter = data_transfer:to_bt_state(AtterSceneInfo),
                    Defer = data_transfer:to_bt_state(DeferSceneInfo),
                    #bt_state{hp = DeferHp, x = X, y = Y} = Defer,
                    DeferHpLim = (Defer#bt_state.attr)#bt_attr.hp_lim,

                    % 锁血逻辑(只锁扣血)
                    InjuryN = case Injury < 0 of
                        true ->
                            MaxHarm = effect_lockhp:get_defer_lock_harm(Defer),
                            max(Injury, -MaxHarm);
                        _ ->
                            Injury
                    end,

                    DeferHpN = min(max(0, DeferHp + InjuryN), DeferHpLim),
                    DeferT = Defer#bt_state{hp = DeferHpN},
                    DeferN = lib_effect_util:on_hp_change(DeferHp, DeferHpN, DeferT),

                    DefAfBtList = [{[{HarmType, InjuryN}], {X,Y}, DeferN}],
                    SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, X, Y),
                    bcast_battle_harm(Atter, DefAfBtList, {0,0}, #base_skill{}, SidList),
                    update_defer_info(Atter, DeferN, [{HarmType, InjuryN}], 1, TimeStampMS);
                _ ->
                    skip
            end;
        _ ->
            skip
    end.

% @doc 广播释放技能()
bcast_attack(#mon{id = MonId, x = X, y = Y}, SkillId, SkillLv) ->
    BaseSkill = conf_skill:get_base(SkillId, SkillLv),
    SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, X, Y),
    bcast_attack({?BATTLE_MON, MonId}, {0,0}, X, Y, BaseSkill, 0, SidList).


%% Privates ---------------------------------------------
% @doc 使用主动技能
% @spec use_skill(Atter, DeferKey, AssistX, AssistY, BaseSkill, NowTimeMS) -> {true AtterN}.
% Atter = AtterN                :: #bt_state{}
% DeferKey                      :: {DeferType :: 1 | 2 , DeferId :: integer()}
% AssistX = AssistY = NowTimeMS :: integer()
% BaseSkill                     :: #base_skill{}
% NowTimeMS                     :: integer()
use_skill(Atter, DeferKey, AssistX, AssistY, BaseSkill, NowTimeMS) ->
    %% 主动技能或者副技能才处理
    #bt_state{x = AtterX, y = AtterY} = Atter,
    AtterKey = {Atter#bt_state.type, Atter#bt_state.id},
    SidList = lib_scene_agent:get_scene_roler_field_area(#scene_role.sid, AtterX, AtterY),
    bcast_attack(AtterKey, DeferKey, AssistX, AssistY, BaseSkill, 0, SidList),                             % 广播释放技能
    SeqTimeFun = fun(TimeGap, {AccTimePoint, AccTimeList}) ->
        ExecTime = NowTimeMS + TimeGap,
        CmdArgs = {AtterKey, DeferKey, {AssistX, AssistY}, BaseSkill, AccTimePoint},
        {AccTimePoint + 1, [{ExecTime, 'skill_hit', CmdArgs} | AccTimeList]}
    end,
    TimeList = lib_scene_agent:get_time_list(),                                                         % 取出 time_list
    {_TimePint, TimeListN} = lists:foldl(SeqTimeFun, {1, TimeList}, BaseSkill#base_skill.att_times),    % 更新 time_list
    lib_scene_agent:put_time_list(TimeListN),                                                           % 回存 time_list
    {true, Atter}.

battle_single(Atter, Defer, BaseSkill, TimePoint, IsMainTarget) ->
    DeferXY0 = {Defer#bt_state.x, Defer#bt_state.y},
    AtterKey = {Atter#bt_state.type, Atter#bt_state.id},
    SecureConst = conf_battle_const:get_secure(),
    AoeConst = maps:get(aoe, SecureConst),

    #base_skill{id = SkillId, target_buff = TargetBuff, repel = Repels} = BaseSkill,
    IsSkImmune = lib_effect_util:is_skimmune(Defer, SkillId),                                           % 治疗不免疫
    IsInvincible = lib_effect_util:is_invincible(Defer),
    IsImmune = IsSkImmune orelse IsInvincible orelse lib_effect_util:is_harmimmune(Defer),
    {HarmType, InjuryT0, IsCrit} = case IsImmune of
        true when BaseSkill#base_skill.sp =/= ?SKILL_SP_CURE ->
            {?HARM_TYPE_IMMUNE, 0, false};
        _ ->
            InjuryFactor = ?iif(IsMainTarget orelse Defer#bt_state.type == ?BATTLE_MON, 1, AoeConst / 10000),
            {HarmTypeX, InjuryC0} = lib_battle_aid:cal_injury(Atter, Defer, BaseSkill),
            InjuryC = erlang:ceil(InjuryC0 * InjuryFactor),
            IsCritC = HarmTypeX =:= ?HARM_TYPE_CRIT,
            {HarmTypeX, InjuryC, IsCritC}
    end,

    % 受击触发效果、受击增删效果
    {InjuryT1, DeferT0} = case InjuryT0 =< 0 andalso is_hit(HarmType)of
        true -> lib_effect_util:on_def(BaseSkill, IsCrit, InjuryT0, AtterKey, Defer);
        false -> {InjuryT0, Defer}
    end,

    % 技能增删效果
    DeferKey = {Defer#bt_state.type, Defer#bt_state.id},
    DeferT1 = case IsSkImmune orelse IsInvincible orelse HarmType =:= ?HARM_TYPE_DODGE of
        true ->
            DeferT0;
        false ->
            SkillIdLv = {SkillId, BaseSkill#base_skill.level},
            DeferT01 = lib_effect_mgr:del_by_effect_types(DeferT0, BaseSkill#base_skill.del_buff_types),
            case TimePoint =:= 1 andalso is_hit(HarmType) of
                true -> lib_effect_util:add_skill_effect(DeferT01, AtterKey, SkillIdLv, TargetBuff, #{target => DeferKey});
                false -> DeferT01
            end
    end,

    % 护盾效果
    NowTimeMS = time:unixtime_ms(),
    {HarmTypeFixed, InjuryN, DeferT2} = case DeferT1#bt_state.shield of
        {ShieldId, ShieldVal, ShieldCureRatio} when InjuryT1 < 0 ->
            ShieldValN = ShieldVal + InjuryT1,
            {InjuryT12, DeferT12} = case ShieldValN =< 0 of
                false ->
                    ShieldCureHp = abs(InjuryT1) * ShieldCureRatio div 10000,
                    ShieldCureArgs = {AtterKey, DeferKey, ?HARM_TYPE_SHIELD_CURE, ShieldCureHp, NowTimeMS},
                    lib_scene_cmd:scene_cmd('alter_obj_hp', ShieldCureArgs),
                    ShieldN = {ShieldId, ShieldValN, ShieldCureRatio},
                    DeferT11 = DeferT1#bt_state{shield = ShieldN},
                    {0, DeferT11};
                true ->
                    DeferT11 = lib_effect_mgr:del_by_effect_aids(DeferT1, [ShieldId]),
                    {ShieldValN, DeferT11}
            end,
            {?HARM_TYPE_SHIELD, InjuryT12, DeferT12};
        _ ->
            {HarmType, InjuryT1, DeferT1}
    end,
    HpN = max(0, min((Defer#bt_state.attr)#bt_attr.hp_lim, Defer#bt_state.hp + InjuryN)),
    DeferT3 = DeferT2#bt_state{hp = HpN},

    % 吸气效果
    ChangedHp = DeferT3#bt_state.hp - Defer#bt_state.hp,
    #bt_state{type = DeferType, mp = DMp, attr = #bt_attr{mp_lim = DMpLim}} = DeferT3,
    #base_skill{suck_magic_ratio=SuckMagicRatio, suck_magic_fact=SuckMagicFact, suck_magic_perc=SuckMagicPerc} = BaseSkill,
    IsSuckMagic = util:is_bingo(SuckMagicRatio),
    DeferT4 = if
        IsSuckMagic andalso DeferType =:= ?BATTLE_ROLE ->
            SuckMagic = if
                ChangedHp < 0 -> min(DMp, trunc(-ChangedHp*SuckMagicFact + DMpLim*SuckMagicPerc/10000));
                true -> 0
            end,
            DeferT3#bt_state{mp = DMp - SuckMagic};
        true ->
            DeferT3
    end,

    % 击退效果
    RepelDist = ?iif(Repels == [], 0, lists:nth(TimePoint, Repels)),
    AtterXY = {Atter#bt_state.x, Atter#bt_state.y},
    DeferXY = {DeferT0#bt_state.x, DeferT0#bt_state.y},
    {DX, DY} = lib_battle_aid:get_repel_dist(AtterXY, DeferXY, RepelDist, ?SCENE_ID),
    DeferT5 = DeferT4#bt_state{x = DX, y = DY},

    % 血量触发效果
    DeferN = lib_effect_util:on_hp_change(Defer#bt_state.hp, DeferT5#bt_state.hp, DeferT5),

    % 输出统计
    (IsImmune orelse Atter#bt_state.type =:= ?BATTLE_MON) orelse begin
        OwnerId = case Atter#bt_state.type of
            ?BATTLE_PET -> Atter#bt_state.owner_id;
            ?BATTLE_ROLE -> Atter#bt_state.id;
            _ -> 0
        end,

        SceneType = ?SCENE_TYPE,
        IsNormalScene = lists:member(SceneType, ?NORMAL_SCENE_TYPES),
        if
            IsNormalScene ->
                skip;
            ChangedHp < 0 ->
                DeferMId = ?iif(is_map(DeferN#bt_state.minfo), maps:get(mid, DeferN#bt_state.minfo, 0), 0),
                lib_obj_util:update_scene_harm(AtterKey, OwnerId, DeferMId, -ChangedHp, DeferN#bt_state.hp);
            ChangedHp > 0 ->
                lib_obj_util:update_scene_cure(AtterKey, OwnerId, ChangedHp);
            true ->
                skip
        end
    end,
    HarmSeq = [{HarmTypeFixed, InjuryN}],
    {{HarmSeq, DeferXY0, DeferN}, ChangedHp, IsCrit, HarmTypeFixed}.

% 计算前置属性加成
calc_bt_attr_addon(#bt_state{level = Level} = BtState, #base_skill{id = SkillId, level = SkillLv, sp = ?SKILL_SP_PRE_ATTR}) ->
    case conf_skill_pre_attr:get(SkillId, SkillLv) of
        #{type := ?PRE_ATTR_CONST, bt_attr := BtAttrL} ->
            SumFun = fun({K, V}, Attr) ->
                Index = K + 1,
                Fact = conf_skill:pet_assist_fact(SkillId, SkillLv),
                Val = trunc(V * (1 + Fact*(Level-1))) + element(Index, Attr),
                setelement(Index, Attr, Val)
            end,
            AttrN = lists:foldl(SumFun, BtState#bt_state.attr, BtAttrL),
            BtState#bt_state{attr = AttrN};
        #{type := ?PRE_ATTR_RATIO, bt_attr_ratio := BtAttrRatioL} ->
            MulFun = fun({K, V}, Attr) ->
                Index = K + 1,
                Val = trunc(element(Index, Attr) * (1 + V / 10000)),
                setelement(Index, Attr, Val)
            end,
            AttrN = lists:foldl(MulFun, BtState#bt_state.attr, BtAttrRatioL),
            BtState#bt_state{attr = AttrN};
        _ ->
            BtState
    end;
calc_bt_attr_addon(BtState, _BaseSkill) ->
    BtState.

%% 广播角色释放技能
bcast_attack({AtterType, AtterId}, {DeferType, DeferId}, AssistX, AssistY, BaseSkill, IsTrig, SidList) ->
    #base_skill{id = SkillId, level = SkillLv, hero = Hero, legend = Legend} = BaseSkill,
    BCastAttackMsg = #bcast_attack{
        atter_type = AtterType, atter_id = AtterId, defer_type = DeferType,
        defer_id = DeferId, skill_id = SkillId, skill_lv = SkillLv,
        hero = Hero, legend = Legend, is_trig = IsTrig,
        assist_x = AssistX, assist_y = AssistY
    },
    {ok, BCastAttackBin} = prot_msg:encode_msg(90301, BCastAttackMsg),
    [lib_role_send:send_to_sid(Sid, BCastAttackBin) || Sid <- SidList].


%% 广播战斗协议数据
bcast_battle_harm(_Atter, [], _AssistXY, _BaseSkill, _SidList) ->
    skip;
bcast_battle_harm(Atter, DefList, {AssistX, AssistY}, BaseSkill, SidList) ->
    #base_skill{id = SkillId, level = SkillLv, hero = Hero, legend = Legend} = BaseSkill,
    MsgDefList = [#ud_defer{
        defer_type = DefBtState#bt_state.type,
        defer_id = DefBtState#bt_state.id,
        defer_x = ?iif(DX0 =:= DefBtState#bt_state.x, 0, DefBtState#bt_state.x),
        defer_y = ?iif(DY0 =:= DefBtState#bt_state.y, 0, DefBtState#bt_state.y),
        defer_hp = DefBtState#bt_state.hp,
        hurt_seq = HurtSeq
    } || {HurtSeq, {DX0, DY0}, DefBtState} <- DefList],
    BCastBattleHarmMsg = #bcast_battle_harm{
        atter_type = Atter#bt_state.type,
        atter_id = Atter#bt_state.id,
        assist_x = AssistX,
        assist_y = AssistY,
        atter_x = Atter#bt_state.x,
        atter_y = Atter#bt_state.y,
        skill_id = SkillId,
        skill_lv = SkillLv,
        hero = Hero,
        legend = Legend,
        defer_list = MsgDefList
    },
    {ok, BCastBattleHarmBin} = prot_msg:encode_msg(90302, BCastBattleHarmMsg),
    [lib_role_send:send_to_sid(Sid, BCastBattleHarmBin) || Sid <- SidList].

update_defer_info(Atter, Defer, HarmSeq, SkillId, NowTime) ->
    #bt_state{type = AtterType, id = AtterId, guild = AGuild, minfo = AMInfo} = Atter,
    OwnerId = case AtterType of
        ?BATTLE_PET -> Atter#bt_state.owner_id;
        ?BATTLE_ROLE -> AtterId;
        _ -> 0
    end,
    AMId = ?iif(is_map(AMInfo), maps:get(mid, AMInfo, 0), 0),
    BtRetAtter = #bt_return_atter{
        type = AtterType, id = AtterId, guild_id = AGuild, mid = AMId, owner_id = OwnerId,
        name = Atter#bt_state.name, skill_id = SkillId, team = Atter#bt_state.team
    },

    #bt_state{type = DeferType, id = DeferId, minfo = DMInfo} = Defer,
    DMId = ?iif(is_map(DMInfo), maps:get(mid, DMInfo, 0), 0),
    BattleReturn = #bt_return{
        type = DeferType, id = DeferId, mid = DMId, hp = Defer#bt_state.hp, mp = Defer#bt_state.mp,
        x = Defer#bt_state.x, y = Defer#bt_state.y, bt_attr = Defer#bt_state.attr, harm_seq = HarmSeq,
        peffect_map = Defer#bt_state.peffect_map, effect_list = Defer#bt_state.effect_list,
        effect_cd = Defer#bt_state.effect_cd, shield = Defer#bt_state.shield, atter = BtRetAtter
    },
    %% 更新防守方数据
    lib_battle_aid:update_defer_scene_info({DeferType, DeferId}, BattleReturn, NowTime).

list_rand_n([], _N) ->
    [];
list_rand_n([MainTarget], _N) ->
    [MainTarget];
list_rand_n([MainTarget | List], N) ->
    [MainTarget | util:list_rand_n(List, N - 1)].

%% 位移技能逻辑
% 位移技能(对目标)
do_pos_skill_logic(Atter, DeferKey, DefList, #base_skill{pos_type = ?POS_SKILL_REVERSE, level = SkillLv} = PosSkill, _AssistXY) ->
    SceneId = ?SCENE_ID,
    #bt_state{type = AType, id = AId, x = AtterX, y = AtterY} = Atter,
    GenResetListFun = fun({_, _, #bt_state{type = DType, id = DId, x = DX, y = DY}}, AccRestList) ->
        case lib_scene_sign:gen_path(SceneId, {AtterX, AtterY}, {DX, DY}) of
            Path when length(Path) > 3 ->
                [{lists:nth(3, Path), {DType, DId}} | AccRestList];
            _ ->
                AccRestList
        end
    end,
    ResetList = lists:foldl(GenResetListFun, [], DefList),
    #base_skill{pos_time = Time, pos_skill = TSkill} = PosSkill,
    if
        ResetList =:= [] -> skip;
        true -> self() ! {'pos_skill', {AType, AId}, DeferKey, {AtterX, AtterY}, {TSkill, SkillLv}, Time, ResetList, ?RESET_POS_SKILL_PASSIVE}
    end;
% 常规位移技能
do_pos_skill_logic(#bt_state{type = AType, id = AId}, DeferKey, _DefList, PosSkill, AssistXY) ->
    SceneId = ?SCENE_ID,
    {AssistX, AssistY} = AssistXY,
    case lib_scene_sign:is_walk_pos(SceneId, AssistX, AssistY) of
        true ->
            AtterKey = {AType, AId},
            RushList = [{AssistXY, AtterKey}],
            #base_skill{level = SkillLv, pos_time = Time, pos_skill = TSkill} = PosSkill,
            self() ! {'pos_skill', AtterKey, DeferKey, AssistXY, {TSkill, SkillLv}, Time, RushList, ?RESET_POS_SKILL_ACTIVE};
        false ->
            ?ERROR("PosSkill Dest Pos Unwalkable! Scene: ~p, Pos: ~p", [SceneId, AssistXY])
    end.

% 技能复刻逻辑
do_duplicate_skill_logic(AtterKey, DeferKey, BaseSkill, AssistXY) ->
    #base_skill{level = SkillLv, dup_ratio = Ratio, dup_skill = TriggerSkillId} = BaseSkill,
    case util:rand_by_weight(Ratio, 1) of
        {_Weight, Times} when Times > 0 ->
            TrigSkill = {TriggerSkillId, SkillLv},
            [
                lib_scene_cmd:scene_cmd('trig_battle', {AtterKey, DeferKey, AssistXY, TrigSkill})
                || _ <- lists:duplicate(1, Times)
            ];
        _ ->
            skip
    end.

% 吸气技能逻辑
do_suck_magic_logic({?BATTLE_ROLE, _} = AtterKey, RecMagicPerc) ->
    case lib_battle_aid:get_scene_obj_info(AtterKey) of
        #scene_role{mp = Mp, bt_attr = #bt_attr{mp_lim = MpLim}} = AtterInfo ->
            AddMagic = RecMagicPerc * MpLim div 10000,
            MpN = min(Mp + AddMagic, MpLim),
            lib_scene_agent:put_roler(AtterInfo#scene_role{mp = MpN}),
            lib_obj_role:bcast_mp_change(AtterInfo, MpN);
        _ ->
            skip
    end;
do_suck_magic_logic(_AtterKey, _RecMagicPerc) ->
    skip.

% 检测触发溅射技能
check_trigger_spurting_skill(Atter, DeferKey, SkillLv, AssistXY) ->
    #bt_state{type = AtterType, id = AtterId, effect_list = EffectList, peffect_map = PEffectMap} = Atter,
    SpurtingEffectList = lib_effect_util:get_effects_by_mod(effect_spurting, EffectList, PEffectMap),
    case SpurtingEffectList of
        [#effect{param = SpurtingParam} | _] ->
            AtterKey = {AtterType, AtterId},
            SkillTuple = case SpurtingParam of
                [{SkId, SkLv} | _] -> {SkId, SkLv};
                SkId when is_integer(SkId) -> {SkId, SkillLv}
            end,
            lib_scene_cmd:scene_cmd('trig_battle', {AtterKey, DeferKey, AssistXY, SkillTuple});
        _ ->
            skip
    end.

% 珍兽技能-属性辅助
pet_attr_assist(Atter, DeferId, BaseSkill) ->
    #base_skill{id = SkillId, level = SkillLv} = BaseSkill,
    case conf_skill_attr_assist:get(SkillId, SkillLv) of
        {CostHpRate, AssistType, AssistFact} when AssistType =< 2 ->
            Defer = lib_battle_aid:get_scene_obj_info({?BATTLE_ROLE, DeferId}),
            #pet{hp = AttHp, bt_attr = #bt_attr{hp_lim = AttHpLim}} = Atter,
            AttCostHp = min(AttHp - 1, AttHpLim * CostHpRate div 10000),
            case AssistType of
                1 ->
                    % 血量辅助
                    lib_obj_util:add_obj_hp_restore(Defer, trunc(AssistFact * AttCostHp));
                2 ->
                    % 气量辅助
                    #scene_role{mp = DefMp, bt_attr = #bt_attr{mp_lim = DefMpLim}} = Defer,
                    DefMpN = min(DefMp + trunc(AssistFact * AttCostHp), DefMpLim),
                    DefMpN =/= DefMp andalso begin
                        DeferN = Defer#scene_role{mp = DefMpN},
                        lib_scene_agent:put_roler(DeferN),
                        lib_obj_role:bcast_mp_change(DeferN, DefMpN)
                    end
            end,
            lib_obj_util:add_obj_hp_restore(Atter, -AttCostHp);
        AssistConf ->
            ?ERROR("Unexpected attr assist config ! SkillId: ~p, SkillLv: ~p, AssistConf: ~p", [SkillId, SkillLv, AssistConf])
    end.

% 珍兽技能-效果辅助
pet_effect_assist(AtterKey, Defer, BaseSkill) ->
    #base_skill{id = SkillId, level = SkillLv} = BaseSkill,
    case conf_skill_effect_assist:get(SkillId, SkillLv) of
        {AddEffects, DelEffectKinds, DelEffectTypes} ->
            #bt_state{id = DeferId, effect_list = DefEffectList} = Defer,
            GetDelEffIdsFun1 = fun(EfKind, AccAIds) ->
                Effects = lib_effect_util:get_effects_by_kind(EfKind, DefEffectList, #{}),
                [E#effect.id || E <- Effects] ++ AccAIds
            end,
            DelEffectAIdsT1 = lists:foldl(GetDelEffIdsFun1, [], DelEffectKinds),

            GetDelEffIdsFun2 = fun(#effect{id = EffectAId, group_type = {_Group, EffectType}}, AccAIds) ->
                case lists:member(EffectType, DelEffectTypes) of
                    true -> [EffectAId | AccAIds];
                    false -> AccAIds
                end
            end,
            DelEffectAIdsT2 = lists:foldl(GetDelEffIdsFun2, DelEffectAIdsT1, DefEffectList),
            DelEffectAIds = util:list_uniq(DelEffectAIdsT2),
            lib_effect_util:del_by_effect_aids({?BATTLE_ROLE, DeferId}, DelEffectAIds),
            lib_effect_util:add_effects(AtterKey, {?BATTLE_ROLE, DeferId}, AddEffects);
        _ ->
            ?ERROR("Unexpected effect assist config ! SkillId: ~p, SkillLv: ~p", [SkillId, SkillLv])
    end.

% 怪物创建飞行道具
create_flyitems({?BATTLE_MON, _} = AtterKey, DeferKey, BaseSkill, AssistXY) ->
    #base_skill{category = Category, level = SkillLv, flyitems = FlyitemCIds} = BaseSkill,
    if
        % 在所有目标下创建飞行道具
        Category =:= ?SKILL_CATEGORY_FLYITEM_UNDER_OBJS ->
            DefList = case lib_battle_aid:get_scene_obj_info(AtterKey) of
                [] ->
                    skip;
                AtterInfo ->
                    Atter = data_transfer:to_bt_state(AtterInfo),
                    get_def_list(Atter, DeferKey, AssistXY, BaseSkill, 1)
            end,
            [
                lib_flyitem_agent:create_flyitem(hd(FlyitemCIds), {DX, DY}, AtterKey, {DType, DId}, SkillLv)
                || #bt_state{type = DType, id = DId, x = DX, y = DY} <- DefList
            ];
        % 随机一组飞行道具, 这种技能分类的飞行道具列表是嵌套列表
        Category =:= ?SKILL_CATEGORY_FLYITEM_RANDOM_SET ->
            SelectedFlyitemCIds = hd(util:list_disorder(FlyitemCIds)),
            [
                lib_flyitem_agent:create_flyitem(FlyitemCId, AssistXY, AtterKey, DeferKey, SkillLv)
                || FlyitemCId <- SelectedFlyitemCIds
            ];
        % 常规飞行道具
        true ->
            [
                lib_flyitem_agent:create_flyitem(FlyitemCId, AssistXY, AtterKey, DeferKey, SkillLv)
                || FlyitemCId <- FlyitemCIds
            ]
    end;
% 人物/珍兽创建飞行道具
create_flyitems(AtterKey, DeferKey, #base_skill{level=SkillLv, flyitems = FlyitemCIds}, AssistXY) ->
    [
        lib_flyitem_agent:create_flyitem(FlyitemCId, AssistXY, AtterKey, DeferKey, SkillLv)
        || FlyitemCId <- FlyitemCIds
    ].

% 获取攻击列表，并检测宣战数据
get_def_list(Atter, DeferKey, AssistXY, BaseSkill, TimePoint) ->
    #base_skill{to_obj = ToObj, att_area = AttAreas, att_num = AttNum} = BaseSkill,
    AttArea = lists:nth(TimePoint, AttAreas),
    DefListT = case lib_battle_aid:get_target_list(Atter, DeferKey, AssistXY, ToObj, AttArea) of
         DefListT0 when BaseSkill#base_skill.sp =:= ?SKILL_SP_CURE ->
             [Defer || #bt_state{hp = Hp, attr = #bt_attr{hp_lim = HpLim}} = Defer <- DefListT0, Hp < HpLim];
         DefListT0 ->
             DefListT0
    end,
    DefList = list_rand_n(DefListT, AttNum),

    % 更新宣战数据
    #bt_state{
        type = AtterType, id = AtterId, mode = AMode,
        realm = ARealm, team = ATeam, guild = Guild, attackable = Attackable
    } = Atter,
    IsAddRival = lib_scene_agent:is_add_rival(),
    AOwnerId = if
        not IsAddRival -> 0;
        ARealm =/= 0 -> 0;
        AMode =:= ?MODE_PEACE -> 0;
        AtterType =:= ?BATTLE_ROLE -> AtterId;
        AtterType =:= ?BATTLE_PET -> Atter#bt_state.owner_id;
        true -> 0
    end,
    case AOwnerId > 0 of
        true ->
            NowTime = time:unixtime(),
            DefRoleIds = [
                ?iif(Bt#bt_state.type =:= ?BATTLE_ROLE, Bt#bt_state.id, Bt#bt_state.owner_id)
                || Bt <- DefList,
                   Bt#bt_state.type =/= ?BATTLE_MON,
                   Bt#bt_state.mode =:= ?MODE_PEACE,
                   (ATeam =/= Bt#bt_state.team orelse (AMode =/= ?MODE_TEAM orelse ATeam =:= 0)),
                   (AMode =/= ?MODE_GUILD orelse (Guild =/= Bt#bt_state.guild orelse Guild =:= 0)),
                   not sets:is_element(Bt#bt_state.id, Attackable),
                   not sets:is_element(Bt#bt_state.owner_id, Attackable),
                   maps:get(Guild, Bt#bt_state.rival_guild_map, 0) < NowTime,
                   not lib_battle_chk:check_hostile(Atter, Bt)
            ],
            DefRoleIds =/= [] andalso gen_server:cast(self(), {'update_declare', AOwnerId, DefRoleIds});
        false ->
            skip
    end,
    DefList.

% 暴击移除技能cd
crit_remove_skill_cd(AtterKey, RemoveCdList) when RemoveCdList =/= [] ->
    RemoveSkillIds = [SkillId || {R, SkillId} <- RemoveCdList, R =:= 0],
    if
        RemoveSkillIds =/= [] ->
            case lib_battle_aid:get_scene_obj_info(AtterKey) of
                #scene_role{sid = RoleSid, skill_cd = SkillCdMap} = SceneRole ->
                    NotifyClearCdMsg = #notify_clear_skill_cd{skill_ids = RemoveSkillIds},
                    {ok, NotifyClearCdBin} = prot_msg:encode_msg(90310, NotifyClearCdMsg),
                    lib_role_send:send_to_sid(RoleSid, NotifyClearCdBin),
                    SkillCdMapN = maps:without(RemoveSkillIds, SkillCdMap),
                    SceneRoleN = SceneRole#scene_role{skill_cd = SkillCdMapN},
                    lib_scene_agent:put_roler(SceneRoleN);
                _ ->
                    skip
            end;
        true ->
            skip
    end;
crit_remove_skill_cd(_AtterKey, []) ->
    skip.

is_hit(?HARM_TYPE_IMMUNE) -> false;
is_hit(?HARM_TYPE_DODGE) -> false;
is_hit(_) -> true.
