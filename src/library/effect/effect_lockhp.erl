%%-------------------------------------------------------
%% @File     : effect_lockhp
%% @Brief    : 锁血效果
%% @Author   : cablsbs
%% @Date     : 2019-2-21
%%-------------------------------------------------------

-module(effect_lockhp).

-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_del/2,
    get_defer_lock_harm/1
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.

% @doc 守方锁血效果保护
% @spec get_defer_lock_harm(#bt_state{}) -> MaxHarm.
% MaxHarm       :: integer().
get_defer_lock_harm(#bt_state{hp = Hp, attr = BtAttr, effect_list = EffectList}) ->
    case lib_effect_util:get_effects_by_mod(effect_lockhp, EffectList, #{}) of
        [] ->
            2100000000;
        [#effect{param = [LockRatio]} | _] ->
            MinHp = LockRatio * BtAttr#bt_attr.hp_lim div 10000,
            max(0, Hp - MinHp)
    end.


%% Privates ---------------------------------------------
