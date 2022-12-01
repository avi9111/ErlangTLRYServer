%%-------------------------------------------------------
%% @File     : statem_mon_stockpile.erl
%% @Brief    : 怪物蓄力状态
%% @Author   : cablsbs
%% @Date     : 2018-12-27
%%-------------------------------------------------------
-module(statem_mon_stockpile).

-include("log.hrl").
-include("skill.hrl").
-include("scene_objs.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
% 蓄力技能
state_enter([PreTime, BattleCmd], #mon{statem = Statem} = State) ->
    StateArgs = #{timeout => PreTime, battle_cmd => BattleCmd},
    StatemN = Statem#statem{state_args = StateArgs},
    State#mon{statem = StatemN};
% 引导技能
state_enter([PreTime], #mon{statem = Statem} = State) ->
    StateArgs = #{timeout => PreTime},
    StatemN = Statem#statem{state_args = StateArgs},
    State#mon{statem = StatemN}.

% 超时时，结束蓄力
state_update(_NowTimeMS, _ElapseTime, #mon{statem = Statem} = State) ->
    #statem{state_args = StateArgs, state_time = StateTime} = Statem,
    #{timeout := Timeout} = StateArgs,
    BattleCmd = maps:get(battle_cmd, StateArgs, undefined),
    InSpecialStat = lib_obj_mon:in_special_stat(State),
    if
        InSpecialStat ->
            case BattleCmd of
                {AtterKey, {DType, DId}, Skill, DX, DY} ->
                    Op = ?PRE_SKILL_CANCEL,
                    NowTimeMS = time:unixtime_ms(),
                    PreSkillArgs = {DType, DId, DX, DY, Op},
                    PreSkillCmd = {AtterKey, PreSkillArgs, Op, Skill, NowTimeMS},
                    lib_scene_cmd:scene_cmd('pre_skill', PreSkillCmd);
                BattleCmd ->
                    skip
            end,
            lib_statem:change_state(?STATE_IDLE, [], #mon.statem, State);
        true ->
            case StateArgs of
                #{timeout := Timeout, battle_cmd := BattleCmd} when StateTime + 1400 >= Timeout ->% {ok, Timeout} when StateTime + 200 >= Timeout ->
                    {AtterKey, {DType, DId}, Skill, DX, DY} = BattleCmd,
                    Op = ?PRE_SKILL_END,
                    NowTimeMS = time:unixtime_ms(),
                    PreSkillArgs = {DType, DId, DX, DY, Op},
                    PreSkillCmd = {AtterKey, PreSkillArgs, Op, Skill, NowTimeMS},
                    lib_scene_cmd:scene_cmd('pre_skill', PreSkillCmd),
                    lib_scene_cmd:scene_cmd('battle', BattleCmd),
                    StateArgsN = maps:remove(battle_cmd, StateArgs),
                    State#mon{statem = Statem#statem{state_args = StateArgsN}};
                #{timeout := Timeout} when StateTime >= Timeout ->
                    lib_statem:change_state(?STATE_IDLE, [], #mon.statem, State);
                #{timeout := _Timeout} ->
                    State;
                _ ->
                    ?ERROR("Should not arrive here !!!"),
                    State
            end
    end.

state_quit(State) ->
    State.


%% Privates ---------------------------------------------
