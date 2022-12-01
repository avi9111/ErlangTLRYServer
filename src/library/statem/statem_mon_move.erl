%%-------------------------------------------------------
%% @File     : statem_mon_move.erl
%% @Brief    : 怪物移动状态
%% @Author   : cablsbs
%% @Date     : 2018-6-28
%%-------------------------------------------------------

-module(statem_mon_move).

-include("log.hrl").
-include("scene.hrl").
-include("proto/prot_902.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
%% 按路径走
state_enter([path, Path], State) ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            MoveType = ?MT_WALK,
            case Path =/= [] of
                true ->
                    [{ToX, ToY} | Rest] = Path,
                    #mon{x = NowX, y = NowY} = State,
                    case ToX =/= NowX orelse NowY =/= ToY of
                        true -> lib_obj_util:bcast_walk(ToX, ToY, MoveType, State);
                        false -> skip
                    end,
                    Gradient = lib_obj_util:calc_gradient(NowX, NowY, ToX, ToY),
                    State#mon{to_xy = {ToX, ToY}, gradient = Gradient, move_type = MoveType, path = Rest};
                false ->
                    State
            end
    end;
% 按坐标走 - 不算路径
state_enter([ToX, ToY, MoveType], State) ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            #mon{x = NowX, y = NowY} = State,
            case ToX =/= NowX orelse NowY =/= ToY of
                true ->
                    lib_obj_util:bcast_walk(ToX, ToY, MoveType, State),
                    Gradient = lib_obj_util:calc_gradient(NowX, NowY, ToX, ToY),
                    State#mon{to_xy = {ToX, ToY}, gradient = Gradient, move_type = MoveType};
                false ->
                    State#mon{to_xy = {ToX, ToY}, move_type = MoveType}
            end
    end;
% 按坐标走
state_enter([ToX, ToY], State) ->
    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            State;
        true ->
            SceneId = ?SCENE_ID,
            #mon{x = NowX, y = NowY} = State,
            case lib_scene_sign:is_line_through(SceneId, {NowX, NowY}, {ToX, ToY}) of
                true when ToX =/= NowX orelse NowY =/= ToY ->
                    lib_obj_util:bcast_walk(ToX, ToY, ?MT_WALK, State),
                    Gradient = lib_obj_util:calc_gradient(NowX, NowY, ToX, ToY),
                    State#mon{to_xy = {ToX, ToY}, gradient = Gradient, move_type = ?MT_WALK};
                true ->
                    State#mon{to_xy = {ToX, ToY}, move_type = ?MT_WALK};
                false ->
                    MS1 = time:unixtime_ms(),
                    Path = lib_scene_sign:get_a_star_path(NowX, NowY, ToX, ToY, ?ASTAR_SEARCH_DEPTH),
                    MS2 = time:unixtime_ms(),
                    MS1 < MS2 andalso ?ERROR("Waste more than ~pms to gen this path:~n~p", [MS2 - MS1, Path]),
                    state_enter([path, Path], State)
            end
    end.

state_update(_NowTimeMS, ElapseTime, State) ->
    #mon{
        to_xy = ToXY, float_xy = FloatXY, gradient = Gradient,
        bt_attr = #bt_attr{move_speed = MoveSpeed}, move_type = MoveType
    } = State,
    {FloatXYN, ToXYN, GradientN, NewX, NewY} =
        lib_obj_util:calc_move(true, FloatXY, ToXY, Gradient, MoveSpeed, MoveType, ElapseTime),

    StunOrImmobil = lib_effect_util:is_stun_or_immobil(State),
    if
        StunOrImmobil ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, {NewX, NewY}, State),
            StateN = StateT#mon{to_xy = {NewX, NewY}, gradient = {0, 0}, move_type = ?MT_STOP},
            lib_obj_util:reset_point(StateN, ?RESET_POS_BE_CTRL),
            lib_statem:change_state(?STATE_IDLE, [], #mon.statem, StateN);
        true ->
            StateT = lib_obj_util:set_obj_xy(NewX, NewY, FloatXYN, State),
            StateN = StateT#mon{to_xy = ToXYN, gradient = GradientN},
            if
                {NewX, NewY} =:= ToXYN andalso StateN#mon.path =:= [] ->
                    lib_statem:change_state(?STATE_IDLE, [], #mon.statem, StateN);
                {NewX, NewY} =:= ToXYN andalso StateN#mon.path =/= [] ->
                    state_enter([path, StateN#mon.path], StateN);
                true ->
                    StateN
            end
    end.

state_quit(State) ->
    #mon{x = NowX, y = NowY, born_xy = BornXY} = State,
    IsBack = case {NowX, NowY} of
        BornXY -> false;
        _ -> State#mon.is_back
    end,
    State#mon{
        to_xy = {NowX, NowY}, float_xy = {NowX, NowY}, gradient = {0, 0},
        is_back = IsBack, move_type = ?MT_STOP, path = []
    }.


%% Privates ---------------------------------------------
