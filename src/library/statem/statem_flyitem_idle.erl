%%-------------------------------------------------------
%% @File     : statem_flyitem_idle.erl
%% @Brief    : 飞行道具空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-12-7
%%-------------------------------------------------------

-module(statem_flyitem_idle).

-include("scene.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    State.

state_update(NowTimeMS, _ElapseTime, State) when State#flyitem.expire_time > NowTimeMS ->
    State;
state_update(_NowTimeMS, _ElapseTime, State) ->
    lib_statem:change_state(?STATE_DIE, [], #flyitem.statem, State).

state_quit(State) ->
    State.
