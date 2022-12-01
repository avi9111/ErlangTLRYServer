%%-------------------------------------------------------
%% @File     : effect_pcure_fact
%% @Brief    : 被动治疗因子效果
%% @Author   : cablsbs
%% @Date     : 2018-12-18
%%-------------------------------------------------------

-module(effect_pcure_fact).

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
