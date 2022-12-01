%%-------------------------------------------------------
%% @File   : effect_onhp
%% @Brief  : 血量条件触发效果
%% @Author : cablsbs
%% @Date   : 2018-8-3
%%-------------------------------------------------------

-module(effect_onhp).

-include("log.hrl").
-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_hp_change/3,
    on_hp_change_p/3,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @doc 血量变化
% @spec on_add_hp(#effect{}, #bt_state{}, OriHp) -> #bt_state{}.
% OriHp     :: integer()
on_hp_change(#effect{param = [HpPerc | EffParam]} = Effect, BtState, OriHp) ->
    OriHpPerc = OriHp * 100 div (BtState#bt_state.attr)#bt_attr.hp_lim,
    NowHpPerc = BtState#bt_state.hp * 100 div (BtState#bt_state.attr)#bt_attr.hp_lim,
    NowTimeMS = time:unixtime_ms(),
    if
        OriHpPerc >= HpPerc andalso NowHpPerc < HpPerc andalso NowTimeMS >= Effect#effect.next_trig ->
            #effect{id = EffId, level = EffLv} = Effect,
            BtStateT = handle_effect(BtState, EffId, EffLv, EffParam),
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            EffectListN = lists:keystore(Effect#effect.id, #effect.id, BtState#bt_state.effect_list, EffectN),
            BtStateT#bt_state{effect_list = EffectListN};
        true ->
            ok
    end.

on_hp_change_p(#effect{param = [HpPerc | EffParam]} = Effect, BtState, OriHp) ->
    OriHpPerc = OriHp * 100 div (BtState#bt_state.attr)#bt_attr.hp_lim,
    NowHpPerc = BtState#bt_state.hp * 100 div (BtState#bt_state.attr)#bt_attr.hp_lim,
    NowTimeMS = time:unixtime_ms(),
    if
        OriHpPerc >= HpPerc andalso NowHpPerc < HpPerc andalso NowTimeMS >= Effect#effect.next_trig ->
            #effect{id = EffId, level = EffLv} = Effect,
            BtStateT = handle_effect(BtState, EffId, EffLv, EffParam),
            EffectN = Effect#effect{next_trig = NowTimeMS + Effect#effect.trig_cd},
            {BtStateT, EffectN};
        true ->
            ok
    end.


% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
handle_effect(BtState, EffId, EffLv, EffParam) ->
    ParseFun = fun({Ratio, Type, Args}, AccBtState) ->
        case util:is_bingo(Ratio) of
            true ->
                EffectData = {EffId, EffLv, Type, Args},
                case parse_effect_param(EffectData, AccBtState) of
                    ok -> AccBtState;
                    AccBtStateN -> AccBtStateN
                end;
            false ->
                AccBtState
        end
    end,
    lists:foldl(ParseFun, BtState, EffParam).

parse_effect_param({_EffId, EffLv, ?EFF_ADD_SELF_EFFECT, Args}, Defer) ->
    case get_effect(Args, EffLv) of
        #conf_effect{} = ConfEffect ->
            #bt_state{type = DType, id = DId} = Defer,
            lib_effect_mgr:add_effect({DType, DId}, Defer, ConfEffect, #{});
        _ ->
            ?ERROR("Get effect conf failed ! Effect: ~p, DefaultEffectLv: ~p", [Args, EffLv]),
            ok
    end;
parse_effect_param({_EffId, _EffLv, ?ONHP_LOCK_HP, Percent}, #bt_state{hp = Hp, attr = Attr} = Defer) ->
    HpN = max(Hp, Percent * Attr#bt_attr.hp_lim div 100),
    Defer#bt_state{hp = HpN};
parse_effect_param({EffId, EffLv, Type, Args}, _) ->
    ?ERROR(
        "Bad effect config ! EffectId: ~p EffectLv: ~p, {Ratio, ~p, ~p}",
        [EffId, EffLv, Type, Args]
    ),
    ok.

get_effect(EffectId, DefaultEffectLv) when is_integer(EffectId) ->
    conf_effect:get(EffectId, DefaultEffectLv);
get_effect({EffectId, EffectLv}, _DefaultEffectLv) ->
    conf_effect:get(EffectId, EffectLv).
