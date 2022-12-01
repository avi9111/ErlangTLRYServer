%%-------------------------------------------------------
%% @File     : statem_flyitem_move.erl
%% @Brief    : 飞行道具移动状态
%% @Author   : cablsbs
%% @Date     : 2018-12-7
%%-------------------------------------------------------

-module(statem_flyitem_move).

-include("log.hrl").
-include("scene.hrl").
-include("proto/prot_902.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter([{ToX, ToY}, MoveType], State) ->
    #flyitem{x = NowX, y = NowY} = State,
    lib_obj_util:bcast_walk(ToX, ToY, MoveType, State),
    Gradient = lib_obj_util:calc_gradient(NowX, NowY, ToX, ToY),
    State#flyitem{to_xy = {ToX, ToY}, gradient = Gradient, move_type = MoveType}.

state_update(NowTimeMS, ElapseTime, State) when State#flyitem.expire_time > NowTimeMS ->
    #flyitem{
        x = CurX, y = CurY, to_xy = ToXY, float_xy = FloatXY,
        gradient = Gradient, speed = MoveSpeed, move_type = MoveType
    } = State,
    CalcRet = lib_obj_util:calc_move(true, FloatXY, ToXY, Gradient, MoveSpeed, MoveType, ElapseTime),
    {FloatXYN, ToXYN, GradientN, NewX, NewY} = CalcRet,
    StateN = State#flyitem{x = NewX, y = NewY, to_xy = ToXYN, float_xy = FloatXYN, gradient = GradientN},
    OldXY = lib_scene_map:get_xy(CurX, CurY),
    NewXY = lib_scene_map:get_xy(NewX, NewY),
    OldXY =:= NewXY orelse flyitem_move_bcast(State#flyitem.x, State#flyitem.y, StateN),
    if
        {NewX, NewY} =:= ToXY ->
            lib_statem:change_state(?STATE_DIE, [], #flyitem.statem, StateN);
        true ->
            StateN
    end;
state_update(_NowTimeMS, _ElapseTime, State) ->
    lib_statem:change_state(?STATE_DIE, [], #flyitem.statem, State).

state_quit(State) ->
    #flyitem{x = NowX, y = NowY, float_xy = FloatXY, to_xy = ToXY} = State,
    {NowX, NowY} =/= ToXY andalso lib_obj_util:bcast_walk(NowX, NowY, ?MT_STOP, State),
    State#flyitem{float_xy = FloatXY, gradient = {0, 0}, move_type = ?MT_STOP}.


%% Privates ---------------------------------------------
% 飞行道具移动广播
flyitem_move_bcast(OldX, OldY, #flyitem{id = FlyitemId, x = NewX, y = NewY} = State) ->
    DelFlyitemMsg = #bcast_del_flyitem{flyitem_ids = [FlyitemId]},
    {ok, DelFlyitemBin} = prot_msg:encode_msg(90258, DelFlyitemMsg),
    FlyitemSceneInfo = data_transfer:sc_flyitem_scene_info(State),
    AddFlyitemMsg = #bcast_add_flyitem_scene_info{flyitem_list = [FlyitemSceneInfo]},
    {ok, AddFlyitemBin} = prot_msg:encode_msg(90257, AddFlyitemMsg),
    lib_scene_map:obj_move_broadcast(NewX, NewY, OldX, OldY, DelFlyitemBin, AddFlyitemBin).
