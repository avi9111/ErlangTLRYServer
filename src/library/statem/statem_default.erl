%%-------------------------------------------------------
%% @File     : statem_default.erl
%% @Brief    : 未定义状态机状态
%% @Author   : cablsbs
%% @Date     : 2018-7-19
%%-------------------------------------------------------

-module(statem_default).

-include("log.hrl").
-include("scene_objs.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    ?ERROR("bad statem stat !"),
    ?ERROR("~p", [erlang:get_stacktrace()]),
    quit_state_to_idle(State).

state_update(_NowTime, _ElapseTime, State) ->
    State.

state_quit(State) ->
    State.


%% Privates ---------------------------------------------
%% 退出未定义状态
quit_state_to_idle(#mon{} = State) ->
    lib_statem:change_state(?STATE_IDLE, [], #mon.statem, State);
quit_state_to_idle(#scene_role{} = State) ->
    lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, State);
quit_state_to_idle(#pet{} = State) ->
    lib_statem:change_state(?STATE_IDLE, [], #pet.statem, State).
