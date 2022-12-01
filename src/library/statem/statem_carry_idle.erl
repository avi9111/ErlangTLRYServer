%%-------------------------------------------------------
%% @File     : statem_carry_idle.erl
%% @Brief    : 镖车空闲状态
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------

-module(statem_carry_idle).

-include("scene.hrl").
-include("guild_carry.hrl").
-include("battle.hrl").

-export([
    state_enter/2,
    state_update/3,
    state_quit/1
]).


%% Callbacks --------------------------------------------
state_enter(_Param, State) ->
    State.

state_update(_NowTimeMS, _ElapseTime, State) ->
    #carry{
        x = X, y = Y, to_xy = ToXY,
        owner = #{id := OwnerId},
        statem = Statem, type = Type
    } = State,
    if
        Type =:= ?CARRY_TYPE_GUILD -> %% 帮派运镖
            case lib_obj_carry:check_owner_distance(OwnerId, {X, Y}) of
                true when {X, Y} =:= ToXY ->
                    #carry{path = Path, path_index = PathIndex} = State,
                    PathSize = length(Path),
                    if
                        PathSize > PathIndex ->
                            PathIndexN = PathIndex + 1,
                            ToXYN = lists:nth(PathIndexN, Path),
                            StateT = State#carry{to_xy = ToXYN, path_index = PathIndexN},
                            lib_role_guild_carry:restore_carry(OwnerId, PathIndex, X, Y),
                            lib_statem:change_state(?STATE_MOVE, [ToXYN, ?MT_WALK], #carry.statem, StateT);
                        Statem#statem.state_time > 1000 ->
                            lib_statem:change_state(?STATE_DIE, [], #carry.statem, State);
                        true ->
                            State
                    end;
                true ->
                    lib_statem:change_state(?STATE_MOVE, [ToXY, ?MT_WALK], #carry.statem, State);
                false ->
                    State
            end;
        Type =:= ?CARRY_TYPE_MARRY ->   %% 结婚巡游
            case {X, Y} =:= ToXY of
                true ->
                    #carry{path = Path, path_index = PathIndex, owner = Owner} = State,
                    PathSize = length(Path),
                    if
                        PathSize > PathIndex ->
                            parade_gen_obj(PathIndex, Owner),
                            PathIndexN = PathIndex + 1,
                            ToXYN = lists:nth(PathIndexN, Path),
                            StateT = State#carry{to_xy = ToXYN, path_index = PathIndexN},
                            lib_statem:change_state(?STATE_MOVE, [ToXYN, ?MT_WALK], #carry.statem, StateT);
                        Statem#statem.state_time > 1000 ->
                            lib_statem:change_state(?STATE_DIE, [], #carry.statem, State);
                        true ->
                            State
                    end;
                _ ->
                    lib_statem:change_state(?STATE_MOVE, [ToXY, ?MT_WALK], #carry.statem, State)
            end;
        true ->
            State
    end.


state_quit(State) ->
    State.


parade_gen_obj(PathIndex, Owner) ->
    #{parade_gift := GiftList, parade_firework := FWList} = conf_marry_hall_info:get(),
    case lists:keyfind(PathIndex, 1, GiftList) of
        {_, CollID, Num, PosList} ->
            Pos = util:list_rand_n(PosList, Num),
            [lib_coll_agent:create_coll(CollID, CollX, CollY, []) || {CollX, CollY} <- Pos];
        _ ->
            skip
    end,
    RoleID = maps:get(id, Owner, 0),
    case lists:keyfind(PathIndex, 1, FWList) of
        {_, FlyItemID, FWX, FWY} ->
            lib_flyitem_agent:create_flyitem(FlyItemID, {FWX, FWY}, {?BATTLE_ROLE, RoleID}, {?BATTLE_ROLE, RoleID}, 1);
        _ ->
            skip
    end.