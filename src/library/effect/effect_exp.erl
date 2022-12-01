%%-------------------------------------------------------
%% @File     : effect_exp
%% @Brief    : 经验效果
%% @Author   : cablsbs
%% @Date     : 2018-8-3
%%-------------------------------------------------------

-module(effect_exp).

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
