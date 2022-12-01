%%-------------------------------------------------------
%% @File     : lib_effect_util
%% @Brief    : buff工具箱
%% @Author   : cablsbs
%% @Date     : 2017-9-2
%%-------------------------------------------------------

-module(lib_effect_util).

-include("skill.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("effect.hrl").
-include("scene_objs.hrl").

-export([
    add_effect/3,
    add_effects/3,
    add_skill_effect/5,
    del_by_effect_aids/2,
    del_by_effect_ids/2,
    del_onetime_crit/2,
    del_invisible/1,
    dead_clear/1,

    get_effects_by_kind/3,
    get_effects_by_mod/3,
    get_effects_by_types/2,
    get_invisble_effect_aids/1,
    gen_new_effect/4,
    parse_effect_attr/3,
    attr_effect_accumulator/2,
    calc_passive_effect_attr/1,
    get_onbectrl_reduce/1,

    is_stun_or_immobil/1,
    is_stun/1,
    is_immobil/1,
    is_blind/1,
    is_skimmune/2,
    is_sklmt/1,
    is_invincible/1,
    is_harmimmune/1,
    is_crit/1,
    has_mod_effect/2,
    has_kind_effect/2,
    has_type_effect/2
]).


%% triggers
-export([
    on_use_skill/3,
    on_hit_target/4,
    on_be_ctrl/1,
    on_hp_change/3,
    on_move/1,
    on_def/5
]).


%% Apis -------------------------------------------------
% @doc 添加效果
% @spec add_effect(CasterKey, TargetKey, AddEffect) -> ignore.
% CasterKye = TargetKey :: {ObjType :: integer(), ObjId :: integer()}
% AddEffect             :: {EffectId :: integer(), EffectLv :: integer()}.
add_effect(CasterKey, TargetKey, {EffectId, EffectLv}) ->
    case lib_battle_aid:get_scene_obj_info(TargetKey) of
        [] ->
            skip;
        SceneObjInfo ->
            case conf_effect:get(EffectId, EffectLv) of
                #conf_effect{} = ConfEffect ->
                    BtState = data_transfer:to_bt_state(SceneObjInfo),
                    BtStateN = lib_effect_mgr:add_effect(CasterKey, BtState, ConfEffect, #{}),
                    SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN),
                    lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
                _ ->
                    skip
            end
    end.

% @doc 添加多个效果
% @spec add_effects(CasterKey, TargetKey, Effects) -> ignore.
% CasterKye = TargetKey :: {ObjType :: integer(), ObjId :: integer()}
% Effects               :: [{integer(), integer()}]
add_effects(CasterKey, TargetKey, Effects) ->
    case lib_battle_aid:get_scene_obj_info(TargetKey) of
        [] ->
            skip;
        SceneObjInfo ->
            AddEffectFun = fun({EffectId, EffectLv}, AccBtState) ->
                case conf_effect:get(EffectId, EffectLv) of
                    #conf_effect{} = ConfEffect ->
                        lib_effect_mgr:add_effect(CasterKey, AccBtState, ConfEffect, #{});
                    _ ->
                        AccBtState
                end
            end,
            BtState = data_transfer:to_bt_state(SceneObjInfo),
            BtStateN = lists:foldl(AddEffectFun, BtState, Effects),
            SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN)
    end.

% @doc 添加技能效果
% @spec add_skill_effect(BtState, CasterKey, SkillIdLv, Effects, Options) -> BtStateN.
% BtState = BtStateN            :: #bt_state{}
% CasterKey                     :: {ObjType, ObjId}
% ObjType = ObjId               :: integer()
% SkillIdLv                     :: {SkillId, SkillLv}
% SkillId = SkillLv             :: integer()
% Effects                       :: [Effect]
% Effect                        :: {Ratio, EffectId} | {Ratio, EffectId, EffectLv}
% Ratio = EffectId = EffectLv   :: integer()
% Options                       :: #{ Key => Val }
add_skill_effect(BtState, CasterKey, SkillIdLv, [{Ratio, EffectId} | Rest], Options) ->
    case util:is_bingo(Ratio) of
        true ->
            EffectLv = element(2, SkillIdLv),
            BtStateN = do_add_skill_effect(BtState, CasterKey, SkillIdLv, EffectId, EffectLv, Options),
            add_skill_effect(BtStateN, CasterKey, SkillIdLv, Rest, Options);
        false ->
            add_skill_effect(BtState, CasterKey, SkillIdLv, Rest, Options)
    end;
add_skill_effect(BtState, CasterKey, SkillIdLv, [{Ratio, EffectId, EffectLv} | Rest], Options) ->
    case util:is_bingo(Ratio) of
        true ->
            BtStateN = do_add_skill_effect(BtState, CasterKey, SkillIdLv, EffectId, EffectLv, Options),
            add_skill_effect(BtStateN, CasterKey, SkillIdLv, Rest, Options);
        false ->
            add_skill_effect(BtState, CasterKey, SkillIdLv, Rest, Options)
    end;
add_skill_effect(BtState, _CasterKey, _BaseSkill, [], _Options) ->
    BtState.

% @doc 根据自增id，删除effect
% @spec del_by_effect_aids(SceneObjInfo, EffectAIds) ->
% SceneObjInfo          :: #mon{} | #scene_role{} | #pet{}
% EffectAIds            :: [integer()]
del_by_effect_aids({_, _} = ObjKey, EffectIds) ->
    case lib_battle_aid:get_scene_obj_info(ObjKey) of
        [] ->
            skip;
        SceneObjInfo ->
            SceneObjInfoN = del_by_effect_aids(SceneObjInfo, EffectIds),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN)
    end;
del_by_effect_aids(SceneObjInfo, EffectIds) ->
    BtState = data_transfer:to_bt_state(SceneObjInfo),
    BtStateN = lib_effect_mgr:del_by_effect_aids(BtState, EffectIds),
    data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN).

% @doc 根据effect配置id，删除effect
% @spec del_by_effect_ids(ObjKey, EffectIds) -> ignore.
% ObjKey                :: {Type, Id}
% Type = Id = EffectId  :: [integer()]
del_by_effect_ids({_, _} = ObjKey, EffectIds) ->
    case lib_battle_aid:get_scene_obj_info(ObjKey) of
        [] ->
            skip;
        SceneObjInfo ->
            SceneObjInfoN = del_by_effect_ids(SceneObjInfo, EffectIds),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN)
    end;
% @spec del_by_effect_ids(SceneObjInfo, EffectIds) -> SceneObjInfoN.
% SceneObjInfo = SceneObjInfoN  :: #mon{} | #scene_role{} | #pet{}
% EffectIds                     :: [integer()]
del_by_effect_ids(SceneObjInfo, EffectIds) ->
    BtState = data_transfer:to_bt_state(SceneObjInfo),
    BtStateN = lib_effect_mgr:del_by_effect_ids(BtState, EffectIds),
    data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN).

% @doc 删除单次暴击效果
del_onetime_crit(#bt_state{type = ObjType, id = ObjId, effect_list = EffectList}, SkillId) when SkillId =/= 10040016 ->
    case lists:keyfind(?EFFECT_ID_ONETIME_CRIT, #effect.eff_id, EffectList) of
        #effect{id = AId} -> del_by_effect_aids({ObjType, ObjId}, [AId]);
        _ -> skip
    end;
del_onetime_crit(_BtState, _SkillId) ->
    skip.

% @doc 删除所有隐身buff
% @spec del_invisible(BtState) -> BtStateN.
% BtState = BtStateN    :: #bt_state{}
del_invisible(BtState) ->
    AIds = [
        E#effect.id || E <- BtState#bt_state.effect_list,
        E#effect.module =:= effect_invisible
    ],
    lib_effect_mgr:del_by_effect_aids(BtState, AIds).


% @doc 死亡清理
dead_clear(ObjKey) ->
    case lib_battle_aid:get_scene_obj_info(ObjKey) of
        [] ->
            skip;
        SceneObjInfo ->
            BtState = data_transfer:to_bt_state(SceneObjInfo),
            EffectAIds = [
                E#effect.id || E <- BtState#bt_state.effect_list,
                E#effect.dead_clear
            ],
            BtStateN = lib_effect_mgr:del_by_effect_aids(BtState, EffectAIds),
            SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtStateN),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN)
    end.


% @doc 获取身上 kind 为 Kind 的效果
% @spec get_effects_by_kind(EffectKind, EffectList, PEffectMap) -> EffectListOfKind.
% EffectKind                    :: integer()
% PEffectMap                    :: #{ EffectMod => EffectList }
% EffectList = EffectListOfKind :: [#effect{}]
get_effects_by_kind(EffectKind, EffectList, PEffectMap) ->
    FilterFun = fun(Effect) -> Effect#effect.kind =:= EffectKind end,
    EffectListOfKind = lists:filter(FilterFun, EffectList),
    EffectMod = ?efkind_to_mod(EffectKind),
    PEffectList = lists:filter(FilterFun, maps:get(EffectMod, PEffectMap, [])),
    EffectListOfKind ++ PEffectList.

% @doc 获取身上 module 为 Mod 的效果
% @spec get_effects_by_mod(EffectMod, EffectList, PEffectMap) -> EffectListOfMod.
% EffectMod                         :: atom()
% PEffectList                       :: #{ EffectMod => EffectList }
% EffectList = EffectListOfMod      :: [#effect{}]
get_effects_by_mod(EffectMod, EffectList, PEffectMap) ->
    FilterFun = fun(Effect) -> Effect#effect.module =:= EffectMod end,
    EffectListOfMod = lists:filter(FilterFun, EffectList),
    PEffectList = maps:get(EffectMod, PEffectMap, []),
    EffectListOfMod ++ PEffectList.

% @doc 获取指定Types的所有效果
get_effects_by_types(EffectTypes, EffectList) ->
    FilterFun = fun(#effect{group_type = {_, EffType}}) -> lists:member(EffType, EffectTypes) end,
    lists:filter(FilterFun, EffectList).

% @doc 获取隐身效果唯一id列表
get_invisble_effect_aids(EffectList) ->
    [E#effect.id || E <- EffectList, E#effect.module =:= effect_invisible].


% @doc 生成Effect
gen_new_effect(NowTimeMS, Caster, ConfEffect, Options) ->
    AId = gen_effect_id(),
    #conf_effect{
        id = EffId, level = EffLv, kind = EffKind, type = EffType, duration = Duration,
        interval = Interval, trig_cd = TrigCd, param = Param, remove_act = RemoveAct, dead_clear = DeadClear
    } = ConfEffect,
    LengthenTime = calc_lengthen_effect_time(Caster, EffKind, EffType, Duration),
    ExpireTime = ?iif(Duration =:= 0, 0, LengthenTime + NowTimeMS),
    NextTick = ?iif(Interval =:= 0, 0, Interval + NowTimeMS),
    GroupType = {ConfEffect#conf_effect.group, ConfEffect#conf_effect.type},
    IsDeadClear = DeadClear =:= 1,
    #effect{
        id = AId, eff_id = EffId, level = EffLv, kind = EffKind,
        module = ?efkind_to_mod(ConfEffect#conf_effect.kind), expire_time = ExpireTime,
        next_tick = NextTick, interval = Interval, trig_cd = TrigCd,
        caster = Caster, param = Param, remove_act = RemoveAct, group_type = GroupType,
        dead_clear = IsDeadClear, options = Options
    }.

% 计算效果属性加成
% @spec parse_effect_attr(PEffectAttr, EffectList, Attr) ->
% PEffectAttr       :: #{ AttrKey => {AttrIndex, PlusParam, MulParam, MulAddParam} }
% EffectList         :: #{ EffectId => #effect{} }
% Attr              :: #bt_attr{}
parse_effect_attr(PEffectAttr, EffectList, Attr) ->
    AttrEffectList = get_effects_by_mod(effect_attr, EffectList, #{}),
    AttrPlus = attr_effect_accumulator(PEffectAttr, AttrEffectList),
    DoParseFun = fun(_Key, {AttrIndex, PlusParam, MulParam, MulAddParam}, AttrAcc) ->
        OAttrValue = element(AttrIndex + 1, AttrAcc),
        RAttrValueT = (OAttrValue * MulParam + PlusParam) * (1 + MulAddParam),
        RAttrValue = max(0, trunc(RAttrValueT)),
        setelement(AttrIndex + 1, AttrAcc, RAttrValue)
    end,
    AttrN = maps:fold(DoParseFun, Attr, AttrPlus),
    AttrN.


% @doc 属性效果累加器
% @spec attr_effect_accumulator(AccEffectAttr, AttrEffectList) -> AccEffectAttrN.
% AccEffectAttr     :: #{ AttrKey => {AttrIndex, PlusParam, MulParam, MulAddParam} }
% AttrEffectList    :: [#effect{}]
attr_effect_accumulator(AccEffectAttr, AttrEffectList) ->
    ParseParamFun = fun({AttrIndex, PlusParam, MulParam, MulAddParam}, AccAttrPlus) ->
        case maps:find(AttrIndex, AccAttrPlus) of
            {ok, {AttrIndex, PlusParamAcc, MulParamAcc, MulAddParamAdd}} ->
                PlusParamAccN = PlusParamAcc + PlusParam,
                MulParamAccN = (1 + MulParam) * MulParamAcc,
                MulAddParamAddN = MulAddParamAdd + MulAddParam,
                maps:put(AttrIndex, {AttrIndex, PlusParamAccN, MulParamAccN, MulAddParamAddN}, AccAttrPlus);
            _ ->
                maps:put(AttrIndex, {AttrIndex, PlusParam, (1 + MulParam), MulAddParam}, AccAttrPlus)
        end
    end,
    ParseEffectFun = fun(#effect{param = EffectParam}, AccAttrPlus) ->
        lists:foldl(ParseParamFun, AccAttrPlus, EffectParam)
    end,
    lists:foldl(ParseEffectFun, AccEffectAttr, AttrEffectList).

% @doc 被动技能属性效果
% @spec calc_passive_effect_attr(PassiveEffectMap) -> PEffectAttr.
% PEffectAttr       :: #{ AttrKey => {AttrIndex, PlusParam, MulParam, MulAddParam} }
% PassiveEffectMap  :: #{ Mod => EffectList }
% EffectList        :: [#effect{}]
calc_passive_effect_attr(PassiveEffectList) ->
    AttrEffectList = maps:get(effect_attr, PassiveEffectList, []),
    attr_effect_accumulator(#{}, AttrEffectList).

% @doc 被控制伤害减免
get_onbectrl_reduce(#bt_state{effect_list = EffectList, peffect_map = PEffectMap}) ->
    OnBeCtrlEffects = get_effects_by_mod(effect_onbectrl, EffectList, PEffectMap),
    case OnBeCtrlEffects of
        [] ->
            0;
        OnBeCtrlEffects ->
            ChkFun = fun(Kind) -> has_kind_effect(Kind, EffectList) end,
            IsBeCtrl = lists:any(ChkFun, ?CONTROL_EFFECT_KINDS),
            case IsBeCtrl of
                false ->
                    0;
                true ->
                    SumFun = fun(#effect{param = Param}, Acc) ->
                        case lists:keyfind(?ONBECTRL_REDUCE_HURT, 1, Param) of
                            {?ONBECTRL_REDUCE_HURT, RedPerc} -> Acc + RedPerc;
                            _ -> Acc
                        end
                    end,
                    lists:foldl(SumFun, 0, OnBeCtrlEffects)
            end
    end.

% @doc 是否眩晕或定身
is_stun_or_immobil(Obj) ->
    is_stun(Obj) orelse is_immobil(Obj).

% @doc 是否眩晕
is_stun(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_cstun, EffectList);
is_stun(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_cstun, EffectList);
is_stun(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_cstun, EffectList);
is_stun(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_cstun, EffectList).

% @doc 是否定身
is_immobil(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_immobil, EffectList);
is_immobil(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_cimmobil, EffectList);
is_immobil(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_cimmobil, EffectList);
is_immobil(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_cimmobil, EffectList).

% @doc 是否失明
is_blind(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_cblind, EffectList);
is_blind(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_cblind, EffectList);
is_blind(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_cblind, EffectList);
is_blind(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_cblind, EffectList).

% @doc 是否技能免疫(无敌，并能释放技能)
is_skimmune(#bt_state{effect_list = EffectList}, SkillId) ->
    SkillImmuneEffectList = get_effects_by_mod(effect_skimmune, EffectList, #{}),
    ChkFun = fun(#effect{param = Param}) ->
        Param =:= [-1] orelse lists:member(SkillId, Param)
    end,
    lists:any(ChkFun, SkillImmuneEffectList).

% @doc 是否散功
is_sklmt(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_csklmt, EffectList);
is_sklmt(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_csklmt, EffectList);
is_sklmt(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_csklmt, EffectList);
is_sklmt(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_csklmt, EffectList).

% @doc 释放伤害免疫
is_invincible(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_invincible, EffectList);
is_invincible(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_invincible, EffectList);
is_invincible(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_invincible, EffectList);
is_invincible(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_invincible, EffectList).

% @doc 是否免疫伤害
is_harmimmune(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_harmimmune, EffectList).

% @doc 是否暴击
is_crit(#bt_state{effect_list = EffectList}) ->
    has_mod_effect(effect_crit, EffectList);
is_crit(#mon{effect_list = EffectList}) ->
    has_mod_effect(effect_crit, EffectList);
is_crit(#scene_role{effect_list = EffectList}) ->
    has_mod_effect(effect_crit, EffectList);
is_crit(#pet{effect_list = EffectList}) ->
    has_mod_effect(effect_crit, EffectList).

% @doc 是否有某类效果
has_mod_effect(EffectMod, EffectList) ->
    CheckFun = fun(#effect{module = EffMod}) -> EffMod =:= EffectMod end,
    lists:any(CheckFun, EffectList).

% @doc 是否有某种效果 (不等同于 has_mod_effect, 因为不同kind可能会对应同一个mod)
has_kind_effect(EffectKind, EffectList) ->
    CheckFun = fun(#effect{kind = EffKind}) -> EffKind =:= EffectKind end,
    lists:any(CheckFun, EffectList).

% @doc 是否有某类效果
has_type_effect(EffectType, EffectList) ->
    CheckFun = fun(#effect{group_type = {_, EffType}}) -> EffType =:= EffectType end,
    lists:any(CheckFun, EffectList).


%% Triggers ----------------------------------------------
% @doc 使用技能逻辑
% @spec on_use_skill(BtState, DeferKey, BaseSkill) -> ok.
% BtState           :: #bt_state{}
% DeferKey          :: {DeferType :: integer(), DeferId :: integer()}
% BaseSkill         :: #base_skill{}
on_use_skill(BtState, DeferKey, BaseSkill) ->
    #bt_state{effect_list = EffectList} = BtState,
    ObjKey = {BtState#bt_state.type, BtState#bt_state.id},
    has_mod_effect(effect_invisible, EffectList) andalso lib_scene_cmd:scene_cmd('del_invisible', ObjKey),

    % 自身增删效果
    SkillIdLv = {BaseSkill#base_skill.id, BaseSkill#base_skill.level},
    #base_skill{self_buff = SelfBuff, del_self_buff_types = DelEffectTypes} = BaseSkill,
    (SelfBuff =/= [] orelse DelEffectTypes =/= []) andalso
        lib_scene_cmd:scene_cmd('use_skill_effect', {ObjKey, DeferKey, SkillIdLv, SelfBuff, DelEffectTypes}),
    ok.

% @doc 命中目标逻辑
% @spec on_hit_target(BtState, IsCrit, HitNum, TotalInjury) -> ok.
on_hit_target(BtState, IsCrit, HitNum, TotalInjury) ->
    #bt_state{effect_list = EffectList, peffect_map = PEffectMap} = BtState,
    OnHitEffects = get_effects_by_mod(effect_onhit, EffectList, #{}),
    OnHitFun = fun(Effect, {Updated, AccBtState}) ->
        case effect_onhit:on_hit(Effect, AccBtState, {IsCrit, HitNum, TotalInjury}) of
            ok -> {Updated, AccBtState};
            AccBtStateN -> {true, AccBtStateN}
        end
    end,
    {IsUpdatedT, BtStateT} = lists:foldl(OnHitFun, {false, BtState}, OnHitEffects),

    % 被动技能效果
    OnHitPEffects = maps:get(effect_onhit, PEffectMap, []),
    OnHitPFun = fun(Effect, {Updated, AccBtState, AccEffectL}) ->
        case effect_onhit:on_hit_p(Effect, AccBtState, {IsCrit, HitNum, TotalInjury}) of
            ok -> {Updated, AccBtState, [Effect | AccEffectL]};
            {AccBtStateN, EffectN} -> {true, AccBtStateN, [EffectN | AccEffectL]}
        end
    end,
    {IsUpdated, BtStateN, OnHitPEffectsN} = lists:foldl(OnHitPFun, {IsUpdatedT, BtStateT, []}, OnHitPEffects),
    IsUpdated andalso begin
        PEffectMapN = maps:put(effect_onhit, OnHitPEffectsN, PEffectMap),
        do_update_restore(BtStateN#bt_state{peffect_map = PEffectMapN})
    end,
    ok.

% @doc 被控制效果逻辑
% @spec on_be_ctrl(BtState) -> BtStateN
% BtState = BtStateN    :: #bt_state{}
on_be_ctrl(BtState) ->
    BtState#bt_state.type =:= ?BATTLE_ROLE andalso
        lib_scene_cmd:scene_cmd('collect_interrupted', BtState#bt_state.id),
    BtState#bt_state.type =:= ?BATTLE_MON andalso
        lib_scene_cmd:scene_cmd('mon_be_ctrl', BtState#bt_state.id),
    BtStateN = del_guilding_effects(BtState),
    BtStateN.

% @doc 血量变化
% @spec on_hp_change(OriHp, NewHp, BtStateOrObjInfo) -> BtStateOrObjInfoN.
% OriHp = NewHp     :: integer()
% BtStateOrObjInfo  :: #bt_state{} | #scene_role{} | #pet{} | #mon{}
% BtStateOrObjInfoN :: #bt_state{} | #scene_role{} | #pet{} | #mon{}
% 血量变化 - 血量未改变
% 血量变化 - 扣血
on_hp_change(OriHp, NewHp, BtStateOrObjInfo) when OriHp > NewHp ->
    if
        is_record(BtStateOrObjInfo, bt_state) ->
            handle_onhp_effect(OriHp, BtStateOrObjInfo);
        true ->
            BtState = data_transfer:to_bt_state(BtStateOrObjInfo),
            BtStateN = handle_onhp_effect(OriHp, BtState),
            SceneObjInfoN = data_transfer:to_scene_obj_info(BtStateOrObjInfo, BtStateN),
            if
                BtStateN#bt_state.hp > 0 -> SceneObjInfoN;
                true -> obj_die(SceneObjInfoN)
            end
    end;
on_hp_change(OriHp, NewHp, BtStateOrObjInfo) when OriHp =:= NewHp ->
    BtStateOrObjInfo;
% 血量变化 - 加血
on_hp_change(_OriHp, _NewHp, BtStateOrObjInfo) ->
    BtStateOrObjInfo.

% @doc 角色移动效果逻辑
% @spec on_move(SceneRole) -> SceneRoleN.
% SceneRole = SceneRoleN    :: #scene_role{}
on_move(#scene_role{effect_list = EffectList} = SceneRole) ->
    AIds = [E#effect.id || E <- EffectList, lists:member(E#effect.eff_id, ?DEL_ON_BE_CTRL)],
    case AIds of
        [] -> SceneRole;
        AIds -> del_by_effect_aids(SceneRole, AIds)
    end;
on_move(SceneObjInfo) ->
    ?ERROR("Unexpected function call ~p:~p(~p)!", [?MODULE, ?FUNCTION_NAME, SceneObjInfo]),
    SceneObjInfo.

% @doc 受击效果逻辑
% @spec on_def(BaseSkill, IsCrit, Injury, AtterKey, Defer) -> {InjuryN, DeferN}.
% BaseSkill             :: #base_skill{}
% IsCrit                :: boolean()
% Injury = InjuryN      :: integer()
% AtterKey              :: {ObjType, Id}
% Defer = DeferN        :: #bt_state{}
on_def(BaseSkill, IsCrit, Injury, AtterKey, BtState) ->
    BtStateT0 = del_invisible(BtState),                                                     % 删除隐身效果
    BtStateT1 = del_stun(BtStateT0),                                                        % 删除眩晕效果
    BtStateT2 = case BaseSkill#base_skill.category of                                       % 随机去除一个增益buff
        ?SKILL_CATEGORY_DEL_ASSIST_EFF -> do_del_assist_effect(BtStateT1, 1);
        _ -> BtStateT1
    end,

    #bt_state{effect_list = EffectList, peffect_map = PEffectMap} = BtStateT2,
    OnDefEffects = get_effects_by_mod(effect_ondef, EffectList, #{}),
    OnDefFun = fun(Effect, {AccInjury, AccBtState}) ->
        case effect_ondef:on_def(Effect, AccBtState, {IsCrit, AccInjury, AtterKey}) of
            ok -> {AccInjury, AccBtState};
            AccN -> AccN
        end
    end,
    {InjuryT, BtStateT3} = lists:foldl(OnDefFun, {Injury, BtStateT2}, OnDefEffects),

    % 被动技能效果
    OnDefPEffects = maps:get(effect_ondef, PEffectMap, []),
    OnDefPFun = fun(Effect, {AccInjury, AccBtState, AccEffectL}) ->
        case effect_ondef:on_def_p(Effect, AccBtState, {IsCrit, AccInjury, AtterKey}) of
            ok -> {AccInjury, AccBtState, [Effect | AccEffectL]};
            {AccInjuryN, AccBtStateN, EffectN} -> {AccInjuryN, AccBtStateN, [EffectN | AccEffectL]}
        end
    end,
    {InjuryN, BtStateN, OnDefPEffectsN} = lists:foldl(OnDefPFun, {InjuryT, BtStateT3, []}, OnDefPEffects),
    PEffectMapN = maps:put(effect_ondef, OnDefPEffectsN, PEffectMap),
    {InjuryN, BtStateN#bt_state{peffect_map = PEffectMapN}}.


%% Privates ---------------------------------------------
% 删除所有引导型技能buff
del_guilding_effects(BtState) ->
    AIds = [
        E#effect.id || E <- BtState#bt_state.effect_list,
        lists:member(E#effect.eff_id, ?DEL_ON_BE_CTRL)
    ],
    lib_effect_mgr:del_by_effect_aids(BtState, AIds).

% 删除受击移除的眩晕buff
del_stun(BtState) ->
    AIds = [
        E#effect.id || E <- BtState#bt_state.effect_list,
                       E#effect.module =:= effect_cstun,
                       E#effect.param =:= [1]
    ],
    lib_effect_mgr:del_by_effect_aids(BtState, AIds).

% 效果自增id (非场景进程id生成被动效果，id统一为0)
gen_effect_id() ->
    case get({effect, auto_id}) of
        undefined -> 0;
        AutoId -> put({effect, auto_id}, AutoId + 1)
    end.

% 删除Num个增益buff，只删除动态buff
do_del_assist_effect(BtState, Num) ->
    #bt_state{effect_list = EffectList} = BtState,
    AttrAddEffectList = get_effects_by_kind(?EFFECT_ATTR_ADD, EffectList, #{}),
    PlusEffects = get_effects_by_types(?PLUS_EFFECT_TYPES, EffectList),
    EffectAIds = [E#effect.id || E <- AttrAddEffectList ++ PlusEffects],
    if
        EffectAIds =:= [] -> BtState;
        Num =:= 0 -> lib_effect_mgr:del_by_effect_aids(BtState, EffectAIds);
        true -> lib_effect_mgr:del_by_effect_aids(BtState, lists:sublist(EffectAIds, Num))
    end.

% 处理血量条件效果
handle_onhp_effect(OriHp, BtState) ->
    #bt_state{effect_list = EffectList, peffect_map = PEffectMap} = BtState,
    OnHpEffects = get_effects_by_kind(?EFFECT_ONHP, EffectList, #{}),
    HandleFun = fun(Effect, AccBtState) ->
        case effect_onhp:on_hp_change(Effect, AccBtState, OriHp) of
            ok -> AccBtState;
            AccBtStateN -> AccBtStateN
        end
    end,
    BtStateT1 = lists:foldl(HandleFun, BtState, OnHpEffects),

    % 被动技能效果
    OnHpPEffects = maps:get(effect_onhp, PEffectMap, []),
    HandleFunP = fun(Effect, {AccBtState, AccEffect}) ->
        case effect_onhp:on_hp_change_p(Effect, AccBtState, OriHp) of
            ok -> {AccBtState, [Effect | AccEffect]};
            {AccBtStateN, EffectN} -> {AccBtStateN, [EffectN | AccEffect]}
        end
    end,
    {BtStateN, OnHpPEffectsN} = lists:foldl(HandleFunP, {BtStateT1, []}, OnHpPEffects),
    PEffectMapN = maps:put(effect_onhp, OnHpPEffectsN, PEffectMap),
    BtStateN#bt_state{peffect_map = PEffectMapN}.

% 添加技能效果
do_add_skill_effect(BtState, CasterKey, {SkillId, SkillLv}, EffectId, EffectLv, Options) ->
    case conf_effect:get(EffectId, EffectLv) of
        #conf_effect{} = ConfEffect ->
            lib_effect_mgr:add_effect(CasterKey, BtState, ConfEffect, Options);
        _ ->
            ?ERROR("No such Effect: ~p on SkillId: ~p, SkillLv: ~p", [{EffectId, EffectLv}, SkillId, SkillLv]),
            BtState
    end.

% 更新后回存
do_update_restore(#bt_state{type = ObjType, id = ObjId} = BtState) ->
    case lib_battle_aid:get_scene_obj_info({ObjType, ObjId}) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            SceneObjInfoN = data_transfer:to_scene_obj_info(SceneObjInfo, BtState),
            lib_battle_aid:put_scene_obj_info(SceneObjInfoN);
        _ ->
            ?ERROR("Unexpected branch of do_update_restore !"),
            skip
    end.

% 计算时间增益
calc_lengthen_effect_time(_Caster, _EffKind, _EffType, 0) ->
    0;
calc_lengthen_effect_time({0,0}, _EffKind, _EffType, Duration) ->
    Duration;
calc_lengthen_effect_time(Caster, EffKind, EffType, Duration) ->
    LengthenEffects = case lib_battle_aid:get_scene_obj_info(Caster) of
        #scene_role{peffect_map = PEffectMap} -> maps:get(effect_lengthen, PEffectMap, []);
        #pet{peffect_map = PEffectMap} -> maps:get(effect_lengthen, PEffectMap, []);
        _ -> []
    end,
    case LengthenEffects of
        [] ->
            Duration;
        LengthenEffects ->
            SumFun = fun(#effect{param = [Kinds, Types, Lengthen]}, Acc) ->
                case lists:member(EffKind, Kinds) orelse lists:member(EffType, Types) of
                    true -> Acc + Lengthen;
                    false -> Acc
                end
            end,
            LengthenX = lists:foldl(SumFun, 10000, LengthenEffects),
            Duration * LengthenX div 10000
    end.

% 场景对象血量变化导致死亡
obj_die(SceneObjInfo) ->
    NowTimeMS = time:unixtime_ms(),
    if
        is_record(SceneObjInfo, scene_role) -> lib_obj_role:on_die(#bt_return_atter{}, NowTimeMS, SceneObjInfo);
        is_record(SceneObjInfo, pet) -> lib_obj_pet:on_die(#bt_return_atter{}, NowTimeMS, SceneObjInfo);
        is_record(SceneObjInfo, mon) -> lib_obj_mon:on_die(#bt_return_atter{}, NowTimeMS, SceneObjInfo)
    end.
