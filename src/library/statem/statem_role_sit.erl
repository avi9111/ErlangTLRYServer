%%-------------------------------------------------------
%% @File     : statem_role_sit.erl
%% @Brief    : 人物打坐状态
%% @Author   : cablsbs
%% @Date     : 2018-11-17
%%-------------------------------------------------------
-module(statem_role_sit).

-include("role.hrl").
-include("battle.hrl").
-include("scene_objs.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, #scene_role{id = RoleId, x = X, y = Y, stat = Stat, stat_params = StatParams} = State) ->
    lib_obj_util:bcast_spec_stat(Stat, StatParams, ?BATTLE_ROLE, RoleId, X, Y),
    State.

state_update(NowTimeMs, _ElapseTime, #scene_role{id = RoleID, last_exp_time = LastExpTime, statem = Statem} = State) ->
    NowTime = erlang:floor(NowTimeMs/1000),
    #{during_time := SitTime, get_exp_time := TimeGap} = conf_guild_wine_practice:get(),
    case Statem#statem.state_time < SitTime of
        true when NowTime - LastExpTime > TimeGap ->
            lib_role:mod_info(RoleID, lib_role_guild_practice, add_exp),
            State#scene_role{last_exp_time = NowTime};
        true ->
            State;
        false ->
            lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, State)
    end.


state_quit(#scene_role{id = RoleID, x = X, y = Y, stat = Stat} = State) ->
    StatN = bit_map:unset(?SPEC_STAT_BIT_SIT, Stat),
    lib_role:mod_info(RoleID, lib_role_guild_practice, {stop_practice, StatN}),
    lib_obj_util:bcast_spec_stat(StatN, [], ?BATTLE_ROLE, RoleID, X, Y),
    State#scene_role{stat = StatN, stat_params = []}.


%% Privates ---------------------------------------------
