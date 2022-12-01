%%-------------------------------------------------------
%% @File     : statem_coll_idle.erl
%% @Brief    : 采集物空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-9-11
%%-------------------------------------------------------

-module(statem_coll_idle).

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
