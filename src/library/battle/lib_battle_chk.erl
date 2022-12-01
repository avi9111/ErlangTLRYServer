%%-------------------------------------------------------
%% @File     : lib_battle_chk.erl
%% @Brief    : 战斗检验模块
%% @Author   : cablsbs
%% @Date     : 2018-12-19
%%-------------------------------------------------------
-module(lib_battle_chk).

-include("log.hrl").
-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("ret_code.hrl").
-include("proto/prot_903.hrl").

-export([
    check_use_skill/5,
    check_extra_ef_cond/4,
    check_circle_area/3,
    check_distance/3,
    check_hostile/2
]).


%% Apis -------------------------------------------------
% @doc 使用技能条件检测(包括cd, mp, 作用类型等), 并更新Atter(检测通过时，更新Atter)
% @spec check_use_skill(Atter, DeferKey, Skill, NowMS) -> {true, BaseSkill, AtterN} | {false, RetCode}
% Atter = AtterN        :: #bt_state{}
% DeferKey              :: {ObjType :: integer(), ObjId :: integer()}
% Skill                 :: #skill{}
% BaseSkill             :: #base_skill{}
% RetCode               :: integer()
check_use_skill(Atter, _DeferKey, AssistXY, #skill{id = SkillId, level = SkillLv}, NowTimeMS) ->
    BaseSkill = case Atter#bt_state.type of
        ?BATTLE_ROLE ->
            case lists:keyfind(SkillId, #base_skill.id, Atter#bt_state.skill_confs) of
                false -> conf_skill:get_base(SkillId, SkillLv);
                SkillConf -> SkillConf
            end;
        _ ->
            conf_skill:get_base(SkillId, SkillLv)
    end,
    is_record(BaseSkill, base_skill) orelse begin
        ?ERROR("Cannot get #base_skill{} ! AtterType: ~p, AtterId: ~p, SkillId: ~p", [Atter#bt_state.type, Atter#bt_state.id, SkillId]),
        throw({false, ?RC_SKILL_NOT_FOUND})
    end,
    IgnCtrl = is_ign_ctrl(BaseSkill),
    IsStun = (not IgnCtrl) and lib_effect_util:is_stun(Atter),
    IsStun andalso throw({false, ?RC_SKILL_IN_STUN}),
    IsInvincible = lib_effect_util:is_invincible(Atter),
    IsInvincible andalso throw({false, ?RC_SKILL_IN_INVINCIBLE}),
    case maps:get(SkillId, Atter#bt_state.skill_cd, 0) of
        SkillValidTime when SkillValidTime > NowTimeMS ->
            {false, ?RC_SKILL_COOLINGDOWN};
        _ ->
            #bt_state{x = AtterX, y = AtterY, pre_skill = PreSkill} = Atter,
            PreSkillChk = check_pre_skill(SkillId, PreSkill, NowTimeMS),
            case BaseSkill of
                #base_skill{type = SkillType} when SkillType =:= ?SKILL_TYPE_PASSIVE ->
                    {false, ?RC_SKILL_NOT_ACTIVE_SKILL};
                #base_skill{pre_time = PreTime} when PreTime > 0 andalso PreSkillChk =/= passed ->
                    {false, ?RC_SKILL_PRE_SKILL_NOT_READY};
                #base_skill{id = SkillId, cd = SkillCd, type = SkillType, category = Category, mp = Mp, anger = CostAnger} = BaseSkill ->
                    % 排山倒海技能特殊逻辑
                    IsRole = Atter#bt_state.type =:= ?BATTLE_ROLE,
                    {CostMp, PsdhSkillHisN} = case is_psdh_skill(SkillId, SkillCd) of
                        true ->
                            Expired = NowTimeMS - 15000,
                            PsdhSkillHis = [NowTimeMS | [Time || Time <- Atter#bt_state.psdh_skill_his, Time >= Expired]],
                            {Mp * min(10, length(PsdhSkillHis)), PsdhSkillHis};
                        false when IsRole ->
                            {Mp, Atter#bt_state.psdh_skill_his};
                        false ->
                            {0, []}
                    end,
                    Atter#bt_state.mp >= CostMp orelse throw({false, ?RC_SKILL_NO_ENOUGH_MP}),
                    IgnoreAnger = lists:member(?SCENE_ID, ?SCENE_IGNORE_ANGER),
                    (not IsRole) orelse IgnoreAnger orelse Atter#bt_state.anger >= CostAnger orelse throw({false, ?RC_SKILL_NO_ENOUGH_ANGER}),

                    IsSkillLmt = (not IgnCtrl) andalso SkillType =:= ?SKILL_TYPE_ACTIVE andalso lib_effect_util:is_sklmt(Atter),
                    IsSkillLmt andalso throw({false, ?RC_SKILL_CSKILL_LIMIT}),
                    Category =:= ?SKILL_CATEGORY_POS andalso check_pos_skill(BaseSkill, {AtterX, AtterY}, AssistXY),
                    Category =:= ?SKILL_CATEGORY_PET_ATTR andalso check_pet_attr(Atter, BaseSkill),

                    PreSkillN = none,                                                                                               % 发动任何技能会中断蓄力技能
                    MpN = Atter#bt_state.mp - CostMp,                                                                               % 剩余蓝量
                    AngerN = case CostAnger > 0 of
                        true -> 0;
                        false -> min(100, Atter#bt_state.anger + 1)
                    end,
                    SkillCdN = update_skill_cd(Atter#bt_state.id, Atter#bt_state.skill_cd, BaseSkill, NowTimeMS),                                      % 技能cd
                    AtterN = Atter#bt_state{
                        mp = MpN, anger = AngerN, pre_skill = PreSkillN,
                        skill_cd = SkillCdN, psdh_skill_his = PsdhSkillHisN
                    },
                    {true, BaseSkill, AtterN}
            end
    end.


% @doc 技能特殊效果条件判断
% 血量不高于MaxHpPerc(万分比)
check_extra_ef_cond(#bt_state{hp = Hp, attr = BtAttr}, ?EXTRA_EF_COND_HP_LE, MaxHpPerc, _ChkArgs) ->
    HpPerc = Hp * 10000 div BtAttr#bt_attr.hp_lim,
    HpPerc =< MaxHpPerc;
% 血量不低于MinHpPerc(万分比)
check_extra_ef_cond(#bt_state{hp = Hp, attr = BtAttr}, ?EXTRA_EF_COND_HP_GE, MinHpPerc, _ChkArgs) ->
    HpPerc = Hp * 10000 div BtAttr#bt_attr.hp_lim,
    HpPerc >= MinHpPerc;
% 身上有EffectId效果
check_extra_ef_cond(#bt_state{effect_list = EffectList}, ?EXTRA_EF_COND_EFFECT_ID, EffectId, _ChkArgs) ->
    lists:keymember(EffectId, #effect.eff_id, EffectList);
% 身上有EffectKind的效果
check_extra_ef_cond(#bt_state{effect_list = EffectList}, ?EXTRA_EF_COND_EFFECT_KIND, EffKind, _ChkArgs) ->
    lib_effect_util:has_kind_effect(EffKind, EffectList);
% 本次技能是否暴击
check_extra_ef_cond(_BtState, ?EXTRA_EF_COND_CRIT, 1, CheckArgs) ->
    maps:get(is_crit, CheckArgs, false);
% 命中N个目标
check_extra_ef_cond(_BtState, ?EXTRA_EF_COND_HIT_NUM, HitNum, CheckArgs) ->
    maps:get(hit_num, CheckArgs, 0) >= HitNum;
% 距离不大于 Dist
check_extra_ef_cond(#bt_state{x = X, y = Y}, ?EXTRA_EF_COND_DIST_WITHIN, Dist, CheckArgs) ->
    AtterXY = maps:get(atter_xy, CheckArgs, {-Dist, -Dist}),
    check_distance({X, Y}, AtterXY, Dist);
% 身上有EffectType的效果
check_extra_ef_cond(#bt_state{effect_list = EffectList}, ?EXTRA_EF_COND_EFFECT_TYPE, EffType, _ChkArgs) ->
    lib_effect_util:has_type_effect(EffType, EffectList).


% @doc 检测圆形范围技能有消息
% @spec check_circle_area(Offset, Point1, Point2) -> {X, Y, IsPass}.
% Point1 = Point2       :: {X, Y}
% Offset = X = Y        :: integer()
% IsPass                :: boolean()
check_circle_area(0, _AssistXY, {AtterX, AtterY}) ->
    {AtterX, AtterY, true};
check_circle_area(Offset, {AssistX, AssistY}, {AtterX, AtterY}) ->
    IsPass = check_distance({AtterX, AtterY}, {AssistX, AssistY}, Offset),
    {AssistX, AssistY, IsPass}.


% @doc 通用距离检查
% @spec check_distance(Point1, Point2, Dist) -> boolean().
% Point1 = Point2   :: {X, Y}
% X = Y = Dist      :: integer()
check_distance({X1, Y1}, {X2, Y2}, Area) ->
    lib_battle_aid:square(X1 - X2) + lib_battle_aid:square(Y1 - Y2) =< lib_battle_aid:square(Area).

% @doc 敌对判断
% @spec check_hostile(Atter, Defer) -> boolean().
% Atter = Defer     :: #bt_state{}
check_hostile(Atter, Defer) ->
    #bt_state{guild = AGuild, hostile_guild_set = AHostileGuildSet, in_stat = AInStat} = Atter,
    #bt_state{guild = DGuild, hostile_guild_set = DHostileGuildSet, in_stat = DInStat} = Defer,
    (sets:is_element(DGuild, AHostileGuildSet) andalso bit_map:is_set(?BIT_IN_CARRY, DInStat)) orelse
        (sets:is_element(AGuild, DHostileGuildSet) andalso bit_map:is_set(?BIT_IN_CARRY, AInStat)).


%% Privates ---------------------------------------------
% @doc 是否无视控制技能
is_ign_ctrl(#base_skill{category = ?SKILL_CATEGORY_IGN_CTRL}) ->
    true;
is_ign_ctrl(_) ->
    false.

% @doc 蓄力技能条件检测
check_pre_skill(SkillId, {SkillId, ValidTimeMS, ready}, NowTimeMS) when NowTimeMS =< ValidTimeMS -> passed;
check_pre_skill(_SkillId, _PreSkill, _NowTimeMS) -> failed.

% @doc 位移技能条件检测
check_pos_skill(BaseSkill, {AtterX, AtterY}, {AssistX, AssistY}) ->
    SceneId = ?SCENE_ID,
    #base_skill{pos_dist = MaxDist} = BaseSkill,
    ToFar = lib_battle_aid:square(MaxDist) < lib_battle_aid:square(AtterX - AssistX) + lib_battle_aid:square(AtterY - AssistY),
    ToFar andalso throw({false, ?RC_SKILL_POS_SKILL_TOO_FAR}),
    LineThrough = lib_scene_sign:is_line_through(SceneId, {AtterX, AtterY}, {AssistX, AssistY}),
    LineThrough orelse throw({false, ?RC_SKILL_POS_SKILL_BLOCKED}),
    true.

% @doc 珍兽属性辅助(检测珍兽血量)
check_pet_attr(Atter, #base_skill{id = SkillId, level = SkillLv}) ->
    #bt_state{hp = Hp, attr = #bt_attr{hp_lim = HpLim}} = Atter,
    HpRate = Hp * 10000 div HpLim,
    case conf_skill_attr_assist:get(SkillId, SkillLv) of
        {CostHpRate, _, _} when CostHpRate < HpRate -> true;
        _ -> throw({false, ?RC_SKILL_NO_ENOUGH_HP})
    end.

% 排山倒海 0cd技能
is_psdh_skill(10020018, 0) ->
    true;
is_psdh_skill(_SkillId, _SkillCd) ->
    false.

%% 更新技能cd
update_skill_cd(_AtterId, SkillCdMap, #base_skill{id = Id, cd = Cd, remove_cd = []}, NowTimeMS) ->
    NextValidTime = NowTimeMS + Cd,
    maps:put(Id, NextValidTime, SkillCdMap);
update_skill_cd(AtterId, SkillCdMap, #base_skill{id = Id, cd = Cd, remove_cd = RemoveCdList}, NowTimeMS) ->
    NextValidTime = NowTimeMS + Cd,
    SkillCdMapT = maps:put(Id, NextValidTime, SkillCdMap),
    case [SkillId || {R, SkillId} <- RemoveCdList, util:is_bingo(R)] of
        [] ->
            SkillCdMapT;
        RemoveSkillIds ->
            NotifyClearCdMsg = #notify_clear_skill_cd{skill_ids = RemoveSkillIds},
            {ok, NotifyClearCdBin} = prot_msg:encode_msg(90310, NotifyClearCdMsg),
            lib_role_send:send_to_role(AtterId, NotifyClearCdBin),
            maps:without(RemoveSkillIds, SkillCdMapT)
    end.
