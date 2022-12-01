%%-------------------------------------------------------
%% @File     : effect_cblind
%% @Brief    : 失明效果(控制类)
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_cblind).

-include("battle.hrl").

-export([
    on_add/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtStateN = lib_effect_util:on_be_ctrl(BtState),
    BtStateN.

% @spec on_del(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, #bt_state{type = ?BATTLE_MON, id = MonId} = BtState) ->
    lib_scene_cmd:scene_cmd('mon_has_sight', MonId),
    BtState;
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
