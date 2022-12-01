%%-------------------------------------------------------
%% @File     : statem_role_move.erl
%% @Brief    : 人物移动状态
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------

-module(statem_role_move).

-include("log.hrl").
-include("scene.hrl").
-include("proto/prot_902.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).

% 机器人无条件传送限制
-define(ROBOT_TRANSFER_LMT, 200).

%% Callbacks --------------------------------------------
% role stop
state_enter([CliX, CliY, ToX, ToY, ?MT_STOP], State) ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            StateT = lib_obj_util:set_obj_xy(CliX, CliY, {ToX, ToY}, State),
            lib_obj_util:bcast_walk(ToX, ToY, ?MT_STOP, StateT),
            StateT#scene_role{to_xy = {ToX, ToY}, gradient = {0, 0}, move_type = ?MT_STOP}
    end;
% role walk
state_enter([CliX, CliY, ToX, ToY, ?MT_WALK], #scene_role{hp = Hp} = State) when Hp > 0 ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            StateT = lib_effect_util:on_move(State),
            StateT1 = lib_obj_util:set_obj_xy(CliX, CliY, {CliX, CliY}, StateT),
            lib_obj_util:bcast_walk(ToX, ToY, ?MT_WALK, StateT1),
            {GX, GY} = lib_obj_util:calc_gradient(CliX, CliY, ToX, ToY),
            StateT1#scene_role{to_xy = {ToX, ToY}, gradient = {GX, GY}, move_type = ?MT_WALK}
    end;
% role jump
state_enter([CliX, CliY, ToX, ToY, ?MT_JUMP], #scene_role{hp = Hp} = State) when Hp > 0 ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    IsJumpPath = lib_scene_agent:is_jump_path({{CliX, CliY}, {ToX, ToY}}),
    if
        StunOrImmobil ->
            State;
        IsJumpPath ->
            StateT = lib_obj_util:set_obj_xy(CliX, CliY, {ToX, ToY}, State),
            lib_obj_util:bcast_walk(ToX, ToY, ?MT_JUMP, StateT),
            StateN = StateT#scene_role{to_xy = {ToX, ToY}, gradient = {0, 0}, move_type = ?MT_STOP},
            lib_team:sync_leader_pos(StateN#scene_role{x = ToX, y = ToY}, ?SCENE_ID),
            StateN;
        true ->
            State
    end;
% robot transfer(宠物距离角色超过25格,客户端可以直接传送宠物到身边)
state_enter([_CliX, _CliY, ToX, ToY, ?MT_TRANSFER], #scene_role{id = RoleId, hp = Hp} = State) when RoleId =< ?MAX_ROBOT_ID andalso Hp > 0 ->
    OwnerId = maps:get(id, State#scene_role.owner),
    #scene_role{x = RX, y = RY} = lib_scene_agent:get_roler(OwnerId),
    SquareSum = lib_battle_aid:square(ToX - RX) + lib_battle_aid:square(ToY - RY),
    case SquareSum =< ?ROBOT_TRANSFER_LMT of
        true ->
            StateT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, State),
            lib_obj_util:bcast_walk(ToX, ToY, ?MT_TRANSFER, State),
            StateT#scene_role{to_xy = {ToX, ToY}, gradient = {0, 0}, move_type = ?MT_STOP};
        false ->
            State
    end;
% role dead
state_enter(_MoveArgs, State) ->
    State.

state_update(_NowTime, ElapseTime, State) ->
    #scene_role{
        x = RX, y = RY, float_xy = FloatXY, to_xy = ToXY,
        gradient = Gradient, bt_attr = #bt_attr{move_speed = MoveSpeed},
        move_type = MoveType
    } = State,
    {FloatXYN, ToXYN, GradientN, NewX, NewY} =
        lib_obj_util:calc_move(false, FloatXY, ToXY, Gradient, MoveSpeed, MoveType, ElapseTime),
%%    ToXY =/= ToXYN andalso
%%        ?INFO(
%%            "Role: ~p Move Blocked !~nFrom ~p to ~p was blocked at ~p",
%%            [State#scene_role.id, {RX, RY}, ToXY, ToXYN]
%%        ),
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, {NewX, NewY}, State),
            ResetIndexN = StateT#scene_role.reset_index + 1,
            StateN = StateT#scene_role{
                to_xy = {NewX, NewY}, gradient = {0, 0}, move_type = ?MT_STOP,
                reset_index = ResetIndexN
            },
            lib_obj_util:reset_point(StateN, ?RESET_POS_BE_CTRL),
            lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, StateN);
        true ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, FloatXYN, State),
            StateN = StateT#scene_role{to_xy = ToXYN, gradient = GradientN},
            case {NewX, NewY} =:= ToXYN of
                true -> lib_statem:change_state(?STATE_IDLE, [], #scene_role.statem, StateN);
                false -> StateN
            end
    end.

state_quit(#scene_role{x = NowX, y = NowY} = State) ->
    State#scene_role{
        to_xy = {NowX, NowY}, gradient = {0, 0},
        float_xy = {NowX, NowY}, move_type = ?MT_STOP
    }.


%% Privates ----------------------------------------------------
