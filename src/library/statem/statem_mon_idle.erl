%%-------------------------------------------------------
%% @File     : statem_mon_idle.erl
%% @Brief    : 怪物空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------
-module(statem_mon_idle).

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    State.

state_update(_NowTimeMS, _ElapseTime, State) ->
    State.

state_quit(State) ->
    State.


%% Privates ---------------------------------------------
