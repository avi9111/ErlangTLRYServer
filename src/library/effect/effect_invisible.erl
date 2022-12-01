%%-------------------------------------------------------
%% @File     : effect_invisible
%% @Brief    : 隐身效果
%% @Author   : cablsbs
%% @Date     : 2018-9-15
%%-------------------------------------------------------

-module(effect_invisible).

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
