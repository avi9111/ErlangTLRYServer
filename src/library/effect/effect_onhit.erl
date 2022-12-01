%%-------------------------------------------------------
%% @File     : effect_onhit
%% @Brief    : 命中触发效果
%% @Author   : cablsbs
%% @Date     : 2018-7-31
%%-------------------------------------------------------

-module(effect_onhit).

-include("log.hrl").
-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_hit/3,
    on_hit_p/3,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @doc 命中效果
% @spec on_hit(#effect{}, #bt_state{}, {IsCrit, HitNum, TotalInjury}) -> Ret.
% Ret   :: ok | #bt_state{}
on_hit(Effect, BtState, {IsCrit, HitNum, TotalInjury}) ->
    NowTimeMS = time:unixtime_ms(),
    case NowTimeMS >= Effect#effect.next_trig of
        true ->
            #effect{param = [Ratio, _, _]} = Effect,
            BtStateT = case is_trig(Ratio, IsCrit, HitNum) of
                true -> parse_effect_param(BtState, Effect, TotalInjury);
                _ -> BtState
            end,
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            EffectListN = lists:keystore(Effect#effect.id, #effect.id, BtStateT#bt_state.effect_list, EffectN),
            BtStateT#bt_state{effect_list = EffectListN};
        false ->
            ok
    end.

% @doc 命中效果(被动)
% @spec on_hit_p(#effect{}, #bt_state{}, {IsCrit, HitNum, TotalInjury}) -> Ret.
% Ret   :: ok | {#bt_state{}, #effect{}}
on_hit_p(Effect, BtState, {IsCrit, HitNum, TotalInjury}) ->
    NowTimeMS = time:unixtime_ms(),
    case NowTimeMS >= Effect#effect.next_trig of
        true ->
            #effect{param = [Ratio, _, _]} = Effect,
            BtStateN = case is_trig(Ratio, IsCrit, HitNum) of
                true -> parse_effect_param(BtState, Effect, TotalInjury);
                _ -> BtState
            end,
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            {BtStateN, EffectN};
        false ->
            ok
    end.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
get_add_effect(Eff, EffLv) ->
    case Eff of
        {EffectId, EffectLv} -> conf_effect:get(EffectId, EffectLv);
        {EffId} -> conf_effect:get(EffId, EffLv);
        _ -> undefined
    end.

is_trig(0, IsCrit, _HitNum) ->
    IsCrit;
is_trig(Ratio, _IsCrit, _HitNum) when is_integer(Ratio) ->
    util:is_bingo(Ratio);
is_trig({-1, RequireHitNum}, _IsCrit, HitNum) ->
    RequireHitNum =< HitNum;
is_trig(Ratio, _IsCrit, _HitNum) ->
    ?ERROR("Bad Ratio: ~p of onhit effect !", [Ratio]),
    false.

%% 解析效果
% 加效果
parse_effect_param(BtState, #effect{level = EffLv, param = [_R, ?EFF_ADD_SELF_EFFECT, Eff]}, _TotalInjury) ->
    case get_add_effect(Eff, EffLv) of
        #conf_effect{} = ConfEffect ->
            ObjKey = {BtState#bt_state.type, BtState#bt_state.id},
            lib_effect_mgr:add_effect(ObjKey, BtState, ConfEffect);
        _ ->
            BtState
    end;
% 将部分伤害转成治疗
parse_effect_param(BtState, #effect{param = [_R, ?HIT_SUCK_BLOOD, Ratio]}, TotalInjury) ->
    SuckedBlood = abs(TotalInjury) * Ratio div 10000,
    AtterKey = {BtState#bt_state.type, BtState#bt_state.id},
    lib_scene_cmd:scene_cmd('alter_obj_hp', {AtterKey, AtterKey, ?HARM_TYPE_EFFECT, SuckedBlood, time:unixtime_ms()}),
    BtState;
parse_effect_param(BtState, _Effect, _TotalInjury) ->
    BtState.
