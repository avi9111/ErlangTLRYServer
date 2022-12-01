%%-------------------------------------------------------
%% @File     : statem_mon_attack.erl
%% @Brief    : 怪物攻击状态
%% @Author   : cablsbs
%% @Date     : 2018-7-2
%%-------------------------------------------------------

-module(statem_mon_attack).

-include("scene.hrl").
-include("skill.hrl").
-include("battle.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter([{{DType, DId} = Target, DX, DY}, SkillId, SkillLv], State) ->
    #mon{id = MonId, x = MX, y = MY} = State,
    lib_obj_util:bcast_walk(MX, MY, ?MT_STOP, State),
    Skill = #skill{id = SkillId, level = SkillLv},
    BattleCmd = {{?BATTLE_MON, MonId}, Target, Skill, DX, DY},
    case conf_skill:get_base(SkillId, SkillLv) of
        #base_skill{pre_time = PreTime} when PreTime > 0 ->
            Op = ?PRE_SKILL_BEG,
            Time = time:unixtime_ms(),
            PreSkillArgs = {DType, DId, DX, DY, Op},
            PreSkillCmd = {{?BATTLE_MON, MonId}, PreSkillArgs, Op, Skill, Time},
            lib_scene_cmd:scene_cmd('pre_skill', PreSkillCmd),
            lib_statem:change_state(?STATE_STOCKPILE, [PreTime + 1400, BattleCmd], #mon.statem, State);
        _ ->
            lib_scene_cmd:scene_cmd('battle', BattleCmd),
            State
    end.

state_update(_NowTimeMS, _ElapseTime, #mon{statem = #statem{state_time = StateTime}} = State) when StateTime < 1400 ->
    State;
state_update(_NowTimeMS, _ElapseTime, State) ->
    StateN = lib_statem:change_state(?STATE_IDLE, [], #mon.statem, State),
    StateN.

state_quit(State) ->
    State.
