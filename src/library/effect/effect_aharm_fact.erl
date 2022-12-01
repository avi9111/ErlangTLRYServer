%%-------------------------------------------------------
%% @File     : effect_aharm_fact
%% @Brief    : 主动伤害因子效果
%% @Author   : cablsbs
%% @Date     : 2018-12-24
%%-------------------------------------------------------

-module(effect_aharm_fact).

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
