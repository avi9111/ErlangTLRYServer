%%-------------------------------------------------------
%% @File     : effect_default
%% @Brief    : 未定义效果
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------

-module(effect_default).

-include("log.hrl").

-export([
    on_add/2,
    on_del/2
]).


%% Apis -------------------------------------------------
% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_add(Effect, BtState) ->
    ?ERROR("No such kind of effect: ~p", [Effect]),
    BtState.

% @spec on_add(#effect{}, #bt_state{}) -> #bt_state{}.
on_del(Effect, BtState) ->
    ?ERROR("No such kind of effect: ~p", [Effect]),
    BtState.
