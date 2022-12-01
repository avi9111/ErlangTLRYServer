%%-------------------------------------------------------
%% @File     : statem_flyitem_die.erl
%% @Brief    : 飞行道具死亡状态
%% @Author   : cablsbs
%% @Date     : 2018-12-7
%%-------------------------------------------------------

-module(statem_flyitem_die).

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    State.

state_update(_NowTime, _ElapseTime, State) ->
    State.

state_quit(State) ->
    State.
