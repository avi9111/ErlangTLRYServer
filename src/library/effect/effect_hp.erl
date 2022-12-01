%%-------------------------------------------------------
%% @File     : effect_hp
%% @Brief    : 加减血效果
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_hp).

-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_tick/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(#effect{interval = Interval} = Effect, BtState) ->
    case Interval of
        0 -> do_hp_effect(Effect, BtState);
        _ -> skip
    end,
    BtState.

% @spec on_tick(#effect{}, #bt_state{}) -> #bt_state{}.
on_tick(Effect, BtState) ->
    do_hp_effect(Effect, BtState),
    BtState.

% @spec on_del(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
do_hp_effect(#effect{caster = CasterKey, param = [HpConst, HpPerc, AttPerc]}, BtState) ->
    Att = lib_battle_aid:get_att(BtState),
    #bt_state{
        type = DeferType, id = DeferId, hp = Hp,
        attr = #bt_attr{hp_lim = HpLim}
    } = BtState,
    HpPercNum = trunc(HpPerc * HpLim / 10000),
    AttPercNum = trunc(AttPerc * Att / 10000),
    HpN = min(Hp + HpConst + HpPercNum + AttPercNum, HpLim),
    case HpN - Hp of
        DeltaHp when DeltaHp =/= 0 ->
            DeferKey = {DeferType, DeferId},
            NowTimeMS = time:unixtime_ms(),
            lib_scene_cmd:scene_cmd('alter_obj_hp', {CasterKey, DeferKey, ?HARM_TYPE_EFFECT, DeltaHp, NowTimeMS});
        _ ->
            skip
    end.
