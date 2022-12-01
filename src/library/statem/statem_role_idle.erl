%%-------------------------------------------------------
%% @File     : statem_role_idle.erl
%% @Brief    : 人物空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------

-module(statem_role_idle).

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
