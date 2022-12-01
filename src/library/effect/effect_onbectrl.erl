%%-------------------------------------------------------
%% @File     : effect_onbectrl
%% @Brief    : 被控制触发效果
%% @Author   : cablsbs
%% @Date     : 2019-2-21
%%-------------------------------------------------------

-module(effect_onbectrl).

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
