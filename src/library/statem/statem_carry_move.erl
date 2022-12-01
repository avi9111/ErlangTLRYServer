%%-------------------------------------------------------
%% @File     : statem_carry_move.erl
%% @Brief    : 镖车移动状态
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------

-module(statem_carry_move).

-include("log.hrl").
-include("scene.hrl").
-include("guild_carry.hrl").
-include("proto/prot_902.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter([{ToX, ToY}, MoveType], State) ->
    #carry{x = NowX, y = NowY, type = Type, owner = Owner} = State,
    lib_obj_util:bcast_walk(ToX, ToY, MoveType, State),
    case Type =:= ?CARRY_TYPE_MARRY of
        true ->
            Couples = maps:get(couples, Owner, []),
            [lib_scene_cmd:scene_cmd('marry_move', {RoleID, ToX, ToY, MoveType}) || RoleID <- Couples];
        _ ->
            skip
    end,
    Gradient = lib_obj_util:calc_gradient(NowX, NowY, ToX, ToY),
    State#carry{to_xy = {ToX, ToY}, gradient = Gradient, move_type = MoveType}.

state_update(_NowTimeMS, ElapseTime, #carry{owner = #{id := OwnerId}, type = Type} = State) ->
    #carry{
        x = CurX, y = CurY, to_xy = ToXY, float_xy = FloatXY,
        gradient = Gradient, speed = MoveSpeed, move_type = MoveType,
        owner = #{id := OwnerId}
    } = State,
    CalcRet = lib_obj_util:calc_move(true, FloatXY, ToXY, Gradient, MoveSpeed, MoveType, ElapseTime),
    {FloatXYN, ToXYN, GradientN, NewX, NewY} = CalcRet,
    StateN = State#carry{x = NewX, y = NewY, to_xy = ToXYN, float_xy = FloatXYN, gradient = GradientN},
    OldXY = lib_scene_map:get_xy(CurX, CurY),
    NewXY = lib_scene_map:get_xy(NewX, NewY),
    OldXY =:= NewXY orelse carry_move_bcast(State#carry.x, State#carry.y, StateN),
    if
        {NewX, NewY} =:= ToXY ->
            lib_statem:change_state(?STATE_IDLE, [], #carry.statem, StateN);
        Type =:= ?CARRY_TYPE_GUILD ->
            case lib_obj_carry:check_owner_distance(OwnerId, {NewX, NewY}) of
                true -> StateN;
                false -> lib_statem:change_state(?STATE_IDLE, [], #carry.statem, StateN)
            end;
        true ->
            StateN
    end.

state_quit(State) ->
    #carry{x = NowX, y = NowY, float_xy = FloatXY, to_xy = ToXY} = State,
    {NowX, NowY} =/= ToXY andalso lib_obj_util:bcast_walk(NowX, NowY, ?MT_STOP, State),
    State#carry{float_xy = FloatXY, gradient = {0, 0}, move_type = ?MT_STOP}.


%% Privates ---------------------------------------------
% 镖车移动广播
carry_move_bcast(OldX, OldY, #carry{id = CarryId, x = NewX, y = NewY} = State) ->
    DelCarryMsg = #bcast_del_carry{carry_ids = [CarryId]},
    {ok, DelCarryBin} = prot_msg:encode_msg(90254, DelCarryMsg),
    CarrySceneInfo = data_transfer:sc_carry_scene_info(State),
    AddCarryMsg = #bcast_add_carry_scene_info{carry_list = [CarrySceneInfo]},
    {ok, AddCarryBin} = prot_msg:encode_msg(90253, AddCarryMsg),
    lib_scene_map:obj_move_broadcast(NewX, NewY, OldX, OldY, DelCarryBin, AddCarryBin).
