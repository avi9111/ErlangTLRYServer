%%-------------------------------------------------------
%% @File     : effect_harmimmune
%% @Brief    : 伤害免疫效果(只免疫伤害，不免疫效果，自身不受影响)
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_harmimmune).

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
