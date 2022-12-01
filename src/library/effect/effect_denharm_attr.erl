%%-------------------------------------------------------
%% @File     : effect_denharm_attr
%% @Brief    : 守方受属性伤害加成(debuff)
%% @Author   : cablsbs
%% @Date     : 2019-2-20
%%-------------------------------------------------------

-module(effect_denharm_attr).

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
