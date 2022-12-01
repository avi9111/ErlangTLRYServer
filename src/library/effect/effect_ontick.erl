%%-------------------------------------------------------
%% @File     : effect_ontick
%% @Brief    : 周期触发效果
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_ontick).

-include("log.hrl").
-include("skill.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("scene_objs.hrl").

-export([
    on_add/2,
    on_tick/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @spec on_tick(#effect{}, #bt_state{}) -> #bt_state{}.
on_tick(Effect, BtState) ->
    #effect{
        id = EffId, level = EffLv, caster = Caster,
        param = EffParam, options = Options
    } = Effect,
    ParseFun = fun({Ratio, Type, Args}, AccBtState) ->
        case util:is_bingo(Ratio) of
            true ->
                EffectData = {EffId, EffLv, Caster, Type, Args, Options},
                case parse_effect_param(EffectData, AccBtState) of
                    ok -> AccBtState;
                    AccBtStateN -> AccBtStateN
                end;
            false ->
                AccBtState
        end
    end,
    BtStateN = lists:foldl(ParseFun, BtState, EffParam),
    BtStateN.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
parse_effect_param({EffId, EffLv, Caster, ?EFF_TRIGGER_SKILL, Args, Options}, Atter) ->
    Skill = get_skill(Args, EffLv),
    #bt_state{type = AType, id = AId, x = AX, y = AY} = Atter,
    CasterFix = fix_caster(Caster, {AType, AId}),
    DeferKey = case CasterFix of
        {AType, AId} -> maps:get(target, Options, {0, 0});
        CasterFix -> maps:get(target, Options, {AType, AId})
    end,
    do_check_delete(Atter, EffId, Skill, DeferKey),
    lib_scene_cmd:scene_cmd('trig_battle', {CasterFix, DeferKey, {AX, AY}, Skill}),
    ok;
parse_effect_param({_EffId, EffLv, Caster, ?EFF_DYNAMIC_SKILL, {Dist, Skills}, _Options}, Atter) ->
    #bt_state{type = AType, id = AId, x = AX, y = AY} = Atter,
    ObjRoles = lib_scene_agent:get_circle_roler_for_battle(AX, AY, Dist),
    BtRoles = [data_transfer:to_bt_state(R) || R <- ObjRoles, R#scene_role.id =/= AId],
    ObjPets = lib_pet_agent:get_circle_pet_for_battle(AX, AY, Dist),
    BtPets = [data_transfer:to_bt_state(P) || P <- ObjPets, P#pet.id =/= AId],
    ObjMons = lib_mon_agent:get_circle_mon_for_battle(AX, AY, Dist),
    BtMons = [data_transfer:to_bt_state(M) || M <- ObjMons, M#mon.id =/= AId],
    ParFun = fun(BtState) -> lib_battle_aid:is_attackable(Atter, BtState) end,
    {BtRivalL, BtPartnerL} = lists:partition(ParFun, BtRoles ++ BtPets ++ BtMons),
    CasterFix = fix_caster(Caster, {AType, AId}),
    case dynamic_action(Skills, EffLv, BtPartnerL =/= [], BtRivalL =/= []) of
        {to_partner, Skill} ->
            #bt_state{type = DType, id = DId} = util:list_rand(BtPartnerL),
            lib_scene_cmd:scene_cmd('trig_battle', {CasterFix, {DType, DId}, {AX, AY}, Skill});
        {to_rival, Skill} ->
            #bt_state{type = DType, id = DId} = util:list_rand(BtRivalL),
            lib_scene_cmd:scene_cmd('trig_battle', {CasterFix, {DType, DId}, {AX, AY}, Skill});
        _ ->
            skip
    end,
    ok;
parse_effect_param({EffId, EffLv, _Caster, Type, Args, _Options}, _Atter) ->
    ?ERROR(
        "Bad effect config ! EffectId: ~p EffectLv: ~p, {Ratio, ~p, ~p}",
        [EffId, EffLv, Type, Args]
    ),
    ok.

get_skill(Args, EffLv) when is_integer(Args) ->
    {Args, EffLv};
get_skill(Args, _EffLv) ->
    Args.

fix_caster(0, AtterKey) ->
    AtterKey;
fix_caster(CasterKey, _AtterKey) ->
    CasterKey.

% 动态效果
dynamic_action(_Skills, _EffLv, false, false) ->
    {skip, undefined};
dynamic_action([{1, PartnerSkill}], EffLv, true, _HasRival) ->
    {to_partner, get_skill(PartnerSkill, EffLv)};
dynamic_action([{2, RivalSkill}], EffLv, _HasPartner, true) ->
    {to_rival, get_skill(RivalSkill, EffLv)};
dynamic_action([{1, PartnerSkill}, {2, _RivalSkill}], EffLv, true, false) ->
    {to_partner, get_skill(PartnerSkill, EffLv)};
dynamic_action([{1, _PartnerSkill}, {2, RivalSkill}], EffLv, false, true) ->
    {to_rival, get_skill(RivalSkill, EffLv)};
dynamic_action([{1, PartnerSkill}, {2, RivalSkill}], EffLv, true, true) ->
    case util:is_bingo(5000) of
        true -> {to_partner, get_skill(PartnerSkill, EffLv)};
        false -> {to_rival, get_skill(RivalSkill, EffLv)}
    end;
dynamic_action(Skills, _EffLv, _HasPartner, _HasRival) ->
    ?ERROR("bad effect args: ~p of dynamic_skill effect !", [Skills]),
    {skip, undefined}.

% 指定目标buff，当目标死亡或脱离攻击范围时，停止效果
do_check_delete(_Atter, _EffectAId, _Skill, {0, 0}) ->
    skip;
do_check_delete(#bt_state{type = AType, id = AId, x = X, y = Y}, EffectAId, {SkillId, SkillLv}, DeferKey) ->
    case lib_battle_aid:get_scene_obj_info(DeferKey) of
        SceneObjInfo when is_tuple(SceneObjInfo) ->
            #bt_state{hp = DHp, x = DX, y = DY}= data_transfer:to_bt_state(SceneObjInfo),
            if
                DHp =< 0 ->
                    lib_scene_cmd:scene_cmd('del_effect_by_aids', {{AType, AId}, [EffectAId]});
                true ->
                    case conf_skill:get_base(SkillId, SkillLv) of
                        #base_skill{att_area = [{?AREA_LINE, Dist} | _]} ->
                            lib_battle_chk:check_distance({X, Y}, {DX, DY}, Dist) orelse
                                lib_scene_cmd:scene_cmd('del_effect_by_aids', {{AType, AId}, [EffectAId]});
                        _ ->
                            skip
                    end
            end;
        _ ->
            lib_scene_cmd:scene_cmd('del_effect_by_aids', {{AType, AId}, [EffectAId]})
    end.
