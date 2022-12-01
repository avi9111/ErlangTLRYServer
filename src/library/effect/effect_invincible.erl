%%-------------------------------------------------------
%% @File     : effect_invincible
%% @Brief    : 无敌效果(免疫伤害和效果，不能释放技能)
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_invincible).

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
