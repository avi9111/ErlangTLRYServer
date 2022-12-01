%%-------------------------------------------------------
%% @File     : statem_mon_stay.erl
%% @Brief    : 怪物初始停留状态
%% @Author   : cablsbs
%% @Date     : 2018-7-2
%%-------------------------------------------------------

-module(statem_mon_stay).

-include("scene_objs.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).

% % 怪物出生初始状态持续时间
% -define(MON_INIT_STAY, 5000).

%% Callbacks --------------------------------------------
state_enter([StayTime], #mon{statem = Statem} = State) ->
    StateArgs = #{timeout => StayTime},
    StatemN = Statem#statem{state_args = StateArgs},
%     State#mon{statem = StatemN};
% state_enter([], #mon{statem = Statem} = State) ->
%     StateArgs = #{timeout => ?MON_INIT_STAY},
%     StatemN = Statem#statem{state_args = StateArgs},
    State#mon{statem = StatemN}.

state_update(_NowTime, _ElapseTime, #mon{statem = Statem} = State) ->
    #statem{state_args = StateArgs, state_time = StateTime} = Statem,
    Timeout = maps:get(timeout, StateArgs, 0),
    case StateTime >= Timeout of
        true -> lib_statem:change_state(?STATE_IDLE, [], #mon.statem, State);
        false -> State
    end.

state_quit(State) ->
    State.
