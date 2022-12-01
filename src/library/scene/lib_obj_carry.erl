%%-------------------------------------------------------
%% @File     : lib_obj_carry
%% @Brief    : 镖车OBJ
%% @Author   : cablsbs
%% @Date     : 2018-11-23
%%-------------------------------------------------------
-module(lib_obj_carry).

-include("scene.hrl").
-include("guild_carry.hrl").
-include("common.hrl").
-include("role.hrl").
-include("battle.hrl").
-include("proto/prot_902.hrl").

-export([
    init/3,
    on_update/3,
    on_delete/1,

    check_owner_distance/2
]).


%% Apis -------------------------------------------------
% @doc 初始化
init(RoleCarry, Owner, Type) ->
    #{
        quality := Quality, carry_line := CarryLine,
        scene_id := SceneId, x := X, y := Y,
        path_index := PathIndex, expire_time := ExpireTime
    } = RoleCarry,
    CId = conf_guild_carry_reward:get_carry(Quality),
    #{speed := Speed} = conf_carry:get(CId),
    CarryId = gen_auto_id(),
    #{path := Path} = conf_guild_carry_scene:get_carry_scene(CarryLine, SceneId),
    ToXY = lists:nth(PathIndex, Path),
    Carry = #carry{
        id = CarryId, cid = CId, type = Type,
        owner = Owner, speed = Speed,
        x = X, y = Y, float_xy = {X, Y},
        path_index = PathIndex, path = Path,
        expire_time = ExpireTime
    },
    CarrySceneInfo = data_transfer:sc_carry_scene_info(Carry),
    CarrySceneMsg = #bcast_add_carry_scene_info{carry_list = [CarrySceneInfo]},
    {ok, BinData} = prot_msg:encode_msg(90253, CarrySceneMsg),
    broadcast(Carry, BinData),
    %% 花轿逻辑
    Type =:= ?CARRY_TYPE_MARRY andalso handle_marry_parade(Owner, Speed, X, Y),
    StateN = lib_statem:change_state(?STATE_MOVE, [ToXY, ?MT_WALK], #carry.statem, Carry),
    lib_carry_agent:put_carry(StateN),
    RoleId = maps:get(id, Owner),
    RoleCarryMap = lib_scene_agent:get_carry_map(),
    RoleCarryMapN = RoleCarryMap#{RoleId => CarryId},
    lib_scene_agent:put_carry_map(RoleCarryMapN),
    {ok, StateN}.


% @doc 每个handle_update执行一次
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State                     :: #carry{}
on_update(NowTimeMS, ElapseTime, #carry{type = Type} = State) when Type =:= ?CARRY_TYPE_GUILD ->
    NowTime = NowTimeMS div 1000,
    if
        State#carry.expire_time > NowTime ->
            case lib_statem:update(NowTimeMS, ElapseTime, #carry.statem, State) of
                #carry{statem = #statem{cur_state_id = ?STATE_DIE}} = StateT ->
                    #carry{x = X, y = Y, owner = #{id := RoleId}} = StateT,
                    case check_owner_distance(RoleId, {X, Y}) of
                        true ->
                            % 传送并删除
                            lib_role_guild_carry:next_scene(RoleId),
                            on_delete(StateT);
                        false ->
                            StateN = check_restore(StateT),
                            lib_carry_agent:put_carry(StateN)
                    end;
                StateT ->
                    StateN = check_restore(StateT),
                    lib_carry_agent:put_carry(StateN)
            end;
        true ->
            #carry{owner = #{id := RoleId}} = State,
            lib_role_guild_carry:timeout(RoleId),
            on_delete(State)
    end,
    ok;
on_update(NowTimeMS, ElapseTime, State) ->
    NowTime = NowTimeMS div 1000,
    if
        State#carry.expire_time > NowTime ->
            case lib_statem:update(NowTimeMS, ElapseTime, #carry.statem, State) of
                #carry{statem = #statem{cur_state_id = ?STATE_DIE}} = StateT ->
                    #carry{owner = #{couples := Couples}} = StateT,
                    %% 到达终点
                    lists:foreach(fun(RoleID) ->
                        case lib_scene_agent:get_roler(RoleID) of
                            #scene_role{attr = Attr, stat = Stat, x = X, y = Y, peffect_attr = PEffectAttr, effect_list = EffectList} = SceneRole ->
                                BtAttrT = lib_effect_util:parse_effect_attr(PEffectAttr, EffectList, Attr),
                                SceneRoleT = SceneRole#scene_role{bt_attr = BtAttrT},
                                MoveSpeedN = lib_obj_role:recalc_move_speed(SceneRoleT, Attr#bt_attr.move_speed),
                                StatN = bit_map:unset(?SPEC_STAT_BIT_MARRY, Stat),
                                BtAttrN = (SceneRoleT#scene_role.bt_attr)#bt_attr{move_speed = MoveSpeedN},
                                SceneRoleN = SceneRoleT#scene_role{bt_attr = BtAttrN, stat = StatN},
                                lib_scene_agent:put_roler(SceneRoleN),
                                lib_obj_util:bcast_spec_stat(StatN, ?BATTLE_ROLE, RoleID, X, Y),
                                lib_obj_util:bcast_speed_change(SceneRoleN, MoveSpeedN),
                                lib_role_marry_rite:finish_parade(RoleID)
                        end
                    end, Couples),
                    lib_carry_agent:set_marry_carry_flag(0),
                    on_delete(StateT);
                StateT ->
                    lib_carry_agent:put_carry(StateT)
            end;
        true ->
            on_delete(State)
    end,
    ok.


% @doc 删除场景数据并广播
% @spec on_delete(State) -> ok.
% State         :: #carry{}
on_delete(#carry{id = CarryId, owner = #{id := RoleId}} = Carry) ->
    DelMsg = #bcast_del_carry{carry_ids = [CarryId]},
    {ok, DelBin} = prot_msg:encode_msg(90254, DelMsg),
    broadcast(Carry, DelBin),
    lib_carry_agent:del_carry(CarryId),
    RoleCarryMap = lib_scene_agent:get_carry_map(),
    RoleCarryMapN = maps:remove(RoleId, RoleCarryMap),
    lib_scene_agent:put_carry_map(RoleCarryMapN),
    ok.

% @doc 检测与主人的距离
check_owner_distance(OwnerId, XY) ->
    case lib_scene_agent:get_roler(OwnerId) of
        #scene_role{x = RX, y = RY} ->
            Distance = 20,
            lib_battle_chk:check_distance(XY, {RX, RY}, Distance);
        _ ->
            false
    end.

%% Privates ---------------------------------------------
% 场景镖车自增id
gen_auto_id() ->
    AutoId = get({carry, auto_id}),
    put({carry, auto_id}, AutoId + 1).

% 镖车信息广播
broadcast(#carry{x = X, y = Y}, BinData) ->
    case lib_scene_agent:is_bcast_scene() of
        true -> lib_scene_agent:send_to_local_scene(BinData);
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BinData)
    end.

% 镖车信息回存
check_restore(State) ->
    UpdateCounter = lib_obj_util:update_counter(State#carry.update_counter),
    case UpdateCounter rem 25 == 0 of
        false ->
            State#carry{update_counter = UpdateCounter};
        true ->
            #{id := RoleId} = State#carry.owner,
            #carry{x = X, y = Y, path_index = PathIndex} = State,
            lib_role_guild_carry:restore_carry(RoleId, PathIndex, X, Y),
            State#carry{update_counter = UpdateCounter}
    end.

%% 处理花轿初始化
handle_marry_parade(Owner, Speed, X, Y) ->
    lib_carry_agent:set_marry_carry_flag(1),
    Couples = maps:get(couples, Owner, []),
    lists:foreach(fun(ID) ->
        case lib_scene_agent:get_roler(ID) of
            #scene_role{bt_attr = BtAttr, gender = Gender, stat = Stat} = SceneRole ->
                StatN = bit_map:set(?SPEC_STAT_BIT_MARRY, Stat),
                SceneRoleN = SceneRole#scene_role{bt_attr = BtAttr#bt_attr{move_speed = Speed}, stat = StatN},
                lib_scene_agent:put_roler(SceneRoleN),
                FromXY = ?iif(Gender =:= ?MALE, {X + 5, Y + 5}, {X, Y}),
                lib_obj_role:same_scene_transfer(ID, FromXY),
                lib_obj_role:update_pets_speed(ID, Speed),
                lib_obj_util:bcast_speed_change(SceneRoleN, Speed),
                lib_obj_util:bcast_spec_stat(StatN, ?BATTLE_ROLE, ID, X, Y);
            _ ->
                skip
        end
    end, Couples).