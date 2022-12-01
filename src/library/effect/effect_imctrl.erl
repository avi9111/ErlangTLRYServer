%%-------------------------------------------------------
%% @File     : effect_imctrl
%% @Brief    : 解除控制效果
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_imctrl).

-include("battle.hrl").
-include("effect.hrl").

-export([
    on_add/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    #bt_state{effect_list = EffectList} = BtState,
    DelEffectAIds = [
        EId || #effect{id = EId, module = EMod} <- EffectList,
               lists:member(EMod, ?CONTROL_EFFECT_MODS)
    ],
    BtStateN = lib_effect_mgr:del_by_effect_aids(BtState, DelEffectAIds),
    BtStateN.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
