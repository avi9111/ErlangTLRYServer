%%-------------------------------------------------------
%% @File     : effect_crit
%% @Brief    : 暴击效果
%% @Author   : cablsbs
%% @Date     : 2018-12-18
%%-------------------------------------------------------

-module(effect_crit).

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
