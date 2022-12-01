%%-------------------------------------------------------
%% @File     : effect_efimmune
%% @Brief    : 效果免疫效果
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_efimmune).

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
