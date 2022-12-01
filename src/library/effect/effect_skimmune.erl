%%-------------------------------------------------------
%% @File     : effect_skimmune
%% @Brief    : 技能免疫效果(免疫伤害和效果，自身不受影响)
%%           ，特别地: 全技能免疫相当于无敌，且自身不受影响
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_skimmune).

-export([
    on_add/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(_Effect, BtState) ->
    BtState.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(_Effect, BtState) ->
    BtState.


%% Privates ---------------------------------------------
