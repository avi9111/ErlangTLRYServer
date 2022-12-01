%%-------------------------------------------------------
%% @File     : statem_pet_idle.erl
%% @Brief    : 宠物空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-7-19
%%-------------------------------------------------------

-module(statem_pet_idle).

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
