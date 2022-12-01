%%-------------------------------------------------------
%% @File     : statem_pet_move.erl
%% @Brief    : 宠物移动状态
%% @Author   : cablsbs
%% @Date     : 2018-7-19
%%-------------------------------------------------------

-module(statem_pet_move).

-include("log.hrl").
-include("scene.hrl").
-include("proto/prot_902.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).

% 宠物无条件传送限制
-define(PET_TRANSFER_LMT, 200).


%% Callbacks --------------------------------------------
% pet stop
state_enter([CliX, CliY, _ToX, _ToY, ?MT_STOP], State) ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            StateT = lib_obj_util:set_obj_xy(CliX, CliY, {CliX, CliY}, State),
            lib_obj_util:bcast_walk(CliX, CliY, ?MT_STOP, StateT),
            State#pet{to_xy = {CliX, CliY}, gradient = {0, 0}, move_type = ?MT_STOP}
    end;
% pet transfer(宠物距离角色超过25格,客户端可以直接传送宠物到身边)
state_enter([_CliX, _CliY, ToX, ToY, ?MT_TRANSFER], State) when State#pet.hp > 0 ->
    OwnerId = maps:get(id, State#pet.owner),
    #scene_role{x = RX, y = RY} = lib_scene_agent:get_roler(OwnerId),
    SquareSum = lib_battle_aid:square(ToX - RX) + lib_battle_aid:square(ToY - RY),
    case SquareSum =< ?PET_TRANSFER_LMT of
        true ->
            StateT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, State),
            lib_obj_util:bcast_walk(ToX, ToY, ?MT_TRANSFER, State),
            StateT#pet{to_xy = {ToX, ToY}, gradient = {0, 0}, move_type = ?MT_STOP};
        false ->
            State
    end;
% pet walk
state_enter([CliX, CliY, ToX, ToY, MoveType], State) when State#pet.hp > 0 ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            StateT = lib_obj_util:set_obj_xy(CliX, CliY, {CliX, CliY}, State),
            lib_obj_util:bcast_walk(ToX, ToY, MoveType, StateT),
            {GX, GY} = lib_obj_util:calc_gradient(CliX, CliY, ToX, ToY),
            StateT#pet{to_xy = {ToX, ToY}, gradient = {GX, GY}, move_type = MoveType}
    end;
% pet dead
state_enter(_MoveArgs, State) ->
    State.

state_update(_NowTime, ElapseTime, State) ->
    #pet{
        x = PX, y = PY, float_xy = FloatXY, to_xy = ToXY,
        gradient = Gradient, bt_attr = #bt_attr{move_speed = MoveSpeed},
        move_type = MoveType
    } = State,
    {FloatXYN, ToXYN, GradientN, NewX, NewY} =
        lib_obj_util:calc_move(false, FloatXY, ToXY, Gradient, MoveSpeed, MoveType, ElapseTime),
    ToXY =/= ToXYN andalso
        ?INFO(
            "Pet: ~p Move Blocked !~nFrom ~p to ~p was blocked at ~p",
            [State#pet.id, {PX, PY}, ToXY, ToXYN]
        ),
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, {NewX, NewY}, State),
            ResetIndexN = StateT#pet.reset_index + 1,
            StateN = StateT#pet{
                to_xy = {NewX, NewY}, gradient = {0, 0}, move_type = ?MT_STOP,
                reset_index = ResetIndexN
            },
            lib_obj_util:reset_point(StateN, ?RESET_POS_BE_CTRL),
            lib_statem:change_state(?STATE_IDLE, [], #pet.statem, StateN);
        true ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, FloatXYN, State),
            StateN = StateT#pet{to_xy = ToXYN, gradient = GradientN},
            case {NewX, NewY} =:= ToXYN of
                true -> lib_statem:change_state(?STATE_IDLE, [], #pet.statem, StateN);
                false -> StateN
            end
    end.

state_quit(#pet{x = NowX, y = NowY} = State) ->
    State#pet{
        to_xy = {NowX, NowY}, gradient = {0, 0},
        float_xy = {NowX, NowY}, move_type = ?MT_STOP
    }.


%% Privates ----------------------------------------------------
