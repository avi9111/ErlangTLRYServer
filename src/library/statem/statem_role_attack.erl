%%-------------------------------------------------------
%% @File     : statem_role_attack.erl
%% @Brief    : 人物攻击状态
%% @Author   : cablsbs
%% @Date     : 2018-7-13
%%-------------------------------------------------------

-module(statem_role_attack).

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
