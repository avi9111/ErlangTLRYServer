%%-------------------------------------------------------
%% @File     : statem_carry_die.erl
%% @Brief    : 镖车死亡状态
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------

-module(statem_carry_die).

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
