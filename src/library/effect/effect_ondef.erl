%%-------------------------------------------------------
%% @File     : effect_defer
%% @Brief    : 防守效果
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_ondef).

-include("log.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("scene_objs.hrl").

-export([
    on_add/2,
    on_def/3,
    on_def_p/3,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @doc 受击
% @spec on_def(Effect, Defer, {IsCrit, Injury, AtterKey}) -> {InjuryN, DeferN}.
% Effect            :: #effect{}
% Defer = DeferN    :: #bt_state{}
% AtterKey          :: {ObjType, Id}
% IsCrit            :: boolean()
% Injury = InjuryN  :: integer()
on_def(Effect, BtState, {IsCrit, Injury, AtterKey}) ->
    NowTimeMS = time:unixtime_ms(),
    case NowTimeMS >= Effect#effect.next_trig of
        true ->
            #effect{id = EffId, level = EffLv, param = [Ratio, Type, Args]} = Effect,
            {InjuryN, BtStateT} = case util:is_bingo(Ratio) of
                true ->
                    EffectData = {EffId, EffLv, Type, Args},
                    case parse_effect_param(EffectData, BtState, {IsCrit, Injury, AtterKey}) of
                        ok -> {Injury, BtState};
                        ParseRet -> ParseRet
                    end;
                false ->
                    {Injury, BtState}
            end,
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            EffectListN = lists:keystore(Effect#effect.id, #effect.id, BtState#bt_state.effect_list, EffectN),
            BtStateN = BtStateT#bt_state{effect_list = EffectListN},
            {InjuryN, BtStateN};
        false ->
            ok
    end.

% @doc 受击(被动)
% @spec on_def_p(Effect, Defer, {IsCrit, Injury, AtterKey}) -> ok | {InjuryN, DeferN}.
% Effect            :: #effect{}
% Defer = DeferN    :: #bt_state{}
% AtterKey          :: {ObjType, Id}
% IsCrit            :: boolean()
% Injury = InjuryN  :: integer()
on_def_p(Effect, BtState, {IsCrit, Injury, AtterKey}) ->
    NowTimeMS = time:unixtime_ms(),
    case NowTimeMS >= Effect#effect.next_trig of
        true ->
            #effect{id = EffId, level = EffLv, param = [Ratio, Type, Args]} = Effect,
            {InjuryN, BtStateN} = case util:is_bingo(Ratio) of
                true ->
                    EffectData = {EffId, EffLv, Type, Args},
                    case parse_effect_param(EffectData, BtState, {IsCrit, Injury, AtterKey}) of
                        ok -> {Injury, BtState};
                        ParseRet -> ParseRet
                    end;
                false ->
                    {Injury, BtState}
            end,
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            {InjuryN, BtStateN, EffectN};
        false ->
            ok
    end.


% @spec on_del(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
parse_effect_param({_EffId, EffLv, ?EFF_TRIGGER_SKILL, Args}, Defer, {_IsCrit, _Injury, AtterKey}) ->
    Skill = case is_integer(Args) of
        true -> {Args, EffLv};
        false -> Args
    end,
    #bt_state{type = DType, id = DId, x = DX, y = DY} = Defer,
    lib_scene_cmd:scene_cmd('trig_battle', {{DType, DId}, AtterKey, {DX, DY}, Skill}),
    ok;
parse_effect_param({_EffId, _EffLv, ?DEF_PET_MEAT_WALL, Args}, Defer, {_IsCrit, Injury, AtterKey}) ->
    DId = Defer#bt_state.id,
    case lib_pet_agent:get_role_pet(DId) of
        #pet{id = PetId, hp = PetHp} when PetHp > 0 ->
            {PetPerc, SelfPerc} = Args,
            PetInjury = Injury * PetPerc div 10000,
            lib_scene_cmd:scene_cmd('pet_partake', {PetId, PetInjury, AtterKey}),
            InjuryN = Injury * SelfPerc div 10000,
            {InjuryN, Defer};
        _ ->
            ok
    end;
parse_effect_param({_EffId, EffLv, ?DEF_SELF_EFFECT, Args}, Defer, {_IsCrit, Injury, _AtterKey}) ->
    case get_effect(Args, EffLv) of
        #conf_effect{} = ConfEffect ->
            #bt_state{type = DType, id = DId} = Defer,
            DeferN = lib_effect_mgr:add_effect({DType, DId}, Defer, ConfEffect, #{}),
            {Injury, DeferN};
        _ ->
            ?ERROR("Get effect conf failed ! Effect: ~p, DefaultEffectLv: ~p", [Args, EffLv]),
            ok
    end;
parse_effect_param({_EffId, EffLv, ?DEF_ATTER_EFFECT, Args}, Defer, {_IsCrit, _Injury, AtterKey}) ->
    AddEffect = case is_integer(Args) of
        true -> {Args, EffLv};
        false -> Args
    end,
    #bt_state{type = DType, id = DId} = Defer,
    lib_effect_util:add_effect({DType, DId}, AtterKey, AddEffect),
    ok;
parse_effect_param({_EffId, _EffLv, ?DEF_SHOCK_BACK, Args}, Defer, {_IsCrit, Injury, AtterKey}) ->
    NowTimeMS = time:unixtime_ms(),
    DeferKey = {Defer#bt_state.type, Defer#bt_state.id},
    lib_scene_cmd:scene_cmd('alter_obj_hp', {DeferKey, AtterKey, ?HARM_TYPE_SHOCKBACK, trunc(Args * Injury), NowTimeMS}),
    ok;
parse_effect_param({_EffId, _EffLv, ?DEF_PET_LOYALTY, Args}, Defer, {IsCrit, Injury, AtterKey}) ->
    if
        IsCrit ->
            DId = Defer#bt_state.id,
            case lib_pet_agent:get_role_pet(DId) of
                #pet{id = PetId, hp = PetHp} when PetHp > 0 ->
                    {PetPerc, SelfPerc} = Args,
                    PetInjury = Injury * PetPerc div 10000,
                    lib_scene_cmd:scene_cmd('pet_partake', {PetId, PetInjury, AtterKey}),
                    InjuryN = Injury * SelfPerc div 10000,
                    {InjuryN, Defer};
                _ ->
                    ok
            end;
        true ->
            ok
    end;
parse_effect_param({_EffId, _EffLv, ?DEF_HP_PROTECT, {MaxHarmPerc}}, Defer, {_IsCrit, Injury, _AtterKey}) ->
    #bt_state{attr = #bt_attr{hp_lim = HpLim}} = Defer,
    InjuryN = max(- (HpLim * MaxHarmPerc div 10000), Injury),
    {InjuryN, Defer};
parse_effect_param({_EffId, _EffLv, ?DEF_MP_PARTAKE, {PartakePerc, PartakeFact}}, Defer, {_IsCrit, Injury, _AtterKey}) ->
    case Defer of
        #bt_state{type = ?BATTLE_ROLE, id = RoleId, mp = Mp} ->
            PartakeInjury0 = Injury * PartakePerc div 10000,
            AlterMp = trunc(PartakeInjury0 * PartakeFact),
            case Mp + AlterMp of
                NewMp when NewMp > 0 ->
                    lib_scene_cmd:scene_cmd('alter_role_mp', {RoleId, AlterMp}),
                    {trunc(Injury - PartakeInjury0), Defer};
                _ ->
                    lib_scene_cmd:scene_cmd('alter_role_mp', {RoleId, -Mp}),
                    PartakeInjury = - trunc(Mp * PartakeFact),
                    {Injury - PartakeInjury, Defer}
            end;
        _ ->
            ok
    end;
parse_effect_param({EffId, EffLv, Type, Args}, _, _) ->
    ?ERROR(
        "Bad effect config ! EffectId: ~p EffectLv: ~p, {Ratio, ~p, ~p}",
        [EffId, EffLv, Type, Args]
    ),
    ok.

get_effect(EffectId, DefaultEffectLv) when is_integer(EffectId) ->
    conf_effect:get(EffectId, DefaultEffectLv);
get_effect({EffectId, EffectLv}, _DefaultEffectLv) ->
    conf_effect:get(EffectId, EffectLv).
