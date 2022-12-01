%%-------------------------------------------------------
%% @File     : lib_obj_flyitem
%% @Brief    : 飞行道具OBJ
%% @Author   : cablsbs
%% @Date     : 2018-12-7
%%-------------------------------------------------------
-module(lib_obj_flyitem).

-include("log.hrl").
-include("scene.hrl").
-include("battle.hrl").
-include("proto/prot_902.hrl").

-export([
    init/1,
    on_update/3,
    on_delete/1
]).


%% Apis -------------------------------------------------
% @doc 初始化
init([ConfFlyitem, {AtterType, AtterId}, {X, Y}, ToXY, SkillLv]) ->
    #{
        id := CId, type:= Type, radii := Radii, speed := Speed, duration := Duration,
        tick_beg := TickBeg, tick_gap := TickGap, tick_act := TickAct
    } = ConfFlyitem,
    Owner = #{id => AtterId, type => AtterType},

    FlyitemId = gen_auto_id(),
    NowTimeMS = time:unixtime_ms(),
    ExpireTime = NowTimeMS + Duration,
    NextTick = NowTimeMS + max(TickBeg, TickGap),
    InCage = get_in_cage_objs(Type, Radii, {X, Y}),
    Flyitem = #flyitem{
        id = FlyitemId, cid = CId, type = Type, radii = Radii, speed = Speed,
        x = X, y = Y, float_xy = {X, Y}, owner = Owner, skill_lv = SkillLv,
        tick_gap = TickGap, next_tick = NextTick, tick_act = TickAct,
        expire_time = ExpireTime, in_cage = InCage
    },

    FlyitemSceneInfo = data_transfer:sc_flyitem_scene_info(Flyitem),
    FlyitemSceneMsg = #bcast_add_flyitem_scene_info{flyitem_list = [FlyitemSceneInfo]},
    {ok, BinData} = prot_msg:encode_msg(90257, FlyitemSceneMsg),
    broadcast(Flyitem, BinData),

    StateN = if
        Speed =:= 0 -> lib_statem:change_state(?STATE_IDLE, [], #flyitem.statem, Flyitem);
        true -> lib_statem:change_state(?STATE_MOVE, [ToXY, ?MT_WALK], #flyitem.statem, Flyitem)
    end,
    lib_flyitem_agent:put_flyitem(StateN),
    {ok, StateN}.

% @doc 每个handle_update执行一次
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State                     :: #flyitem{}
on_update(NowTimeMS, ElapseTime, State) ->
    case lib_statem:update(NowTimeMS, ElapseTime, #flyitem.statem, State) of
        #flyitem{statem = #statem{cur_state_id = ?STATE_DIE}} = StateT ->
            on_delete(StateT);
        StateT ->
            StateN = flyitem_tick(StateT, NowTimeMS),
            lib_flyitem_agent:put_flyitem(StateN)
    end,
    ok.

% @doc 删除场景数据并广播
% @spec on_delete(State) -> ok.
% State         :: #flyitem{}
on_delete(#flyitem{id = FlyitemId} = Flyitem) ->
    DelMsg = #bcast_del_flyitem{flyitem_ids = [FlyitemId]},
    {ok, DelBin} = prot_msg:encode_msg(90258, DelMsg),
    broadcast(Flyitem, DelBin),
    lib_flyitem_agent:del_flyitem(FlyitemId),
    ok.

%% Privates ---------------------------------------------
% 场景飞行道具自增id
gen_auto_id() ->
    AutoId = get({flyitem, auto_id}),
    put({flyitem, auto_id}, AutoId + 1).

% 普通飞行道具tick (释放技能)
flyitem_tick(#flyitem{type = ?FLYITEM_DEFAULT, next_tick = NextTick} = State, NowTimeMS) when NowTimeMS >= NextTick ->
    #flyitem{x = X, y = Y, tick_act = TickAct, skill_lv = SkillLv, owner = #{type:=OwnerType, id:=OwnerId}} = State,
    TrigSkill = case TickAct of
        {-1, SkillId} -> {SkillId, SkillLv};
        {-1, SkillId, SkillLevel} -> {SkillId, SkillLevel};
        _ -> undefined
    end,
    case is_tuple(TrigSkill) of
        true ->
            AtterKey = {OwnerType, OwnerId},
            lib_scene_cmd:scene_cmd('trig_battle', {AtterKey, {0, 0}, {X, Y}, TrigSkill}),
            NextTickN = NextTick + State#flyitem.tick_gap,
            State#flyitem{next_tick = NextTickN};
        _ ->
            ?ERROR("Unexpect tick_act: ~p of flyitem: ~p", [TickAct, State#flyitem.cid]),
            State#flyitem{next_tick = undefined}
    end;
% 牢笼飞行道具tick (施加buff)
flyitem_tick(#flyitem{type = ?FLYITEM_CAGE, next_tick = NextTick} = State, NowTimeMS) when NowTimeMS >= NextTick ->
    #flyitem{x = X, y = Y, tick_act = TickAct, skill_lv = SkillLv, owner = #{type:=OwnerType, id:=OwnerId}} = State,
    TrigSkill = case TickAct of
        {0, EffId} -> {EffId, SkillLv};
        {0, EffId, EffLv} -> {EffId, EffLv};
        _ -> undefined
    end,
    case is_tuple(TrigSkill) of
        true ->
            AtterKey = {OwnerType, OwnerId},
            {InCageN, DeferList} = calc_cage_flyitem_defer_list(State),
            [
                lib_scene_cmd:scene_cmd('trig_battle', {AtterKey, DeferKey, {X, Y}, TrigSkill})
                || DeferKey <- DeferList
            ],
            NextTickN = NextTick + State#flyitem.tick_gap,
            State#flyitem{in_cage = InCageN, next_tick = NextTickN};
        _ ->
            ?ERROR("Unexpect tick_act: ~p of flyitem: ~p", [TickAct, State#flyitem.cid]),
            State#flyitem{next_tick = undefined}
    end;
flyitem_tick(State, _NowTimeMS) ->
    State.

% 飞行道具信息广播
broadcast(#flyitem{x = X, y = Y}, BinData) ->
    case lib_scene_agent:is_bcast_scene() of
        true -> lib_scene_agent:send_to_local_scene(BinData);
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BinData)
    end.

% 计算牢笼飞行道具目标
calc_cage_flyitem_defer_list(#flyitem{x = X, y = Y, radii = Radii, in_cage = InCage}) ->
    InCageN = get_in_cage_objs(?FLYITEM_CAGE, Radii, {X, Y}),
    EnterSet = sets:subtract(InCageN, InCage),
    LeaveSet = sets:subtract(InCage, InCageN),
    DeferSet = sets:union(EnterSet, LeaveSet),
    DeferList = sets:to_list(DeferSet),
    {InCageN, DeferList}.

get_in_cage_objs(?FLYITEM_CAGE, Radii, {X, Y}) when Radii > 0 ->
    MonKeys = [
        {?BATTLE_MON, M#mon.id}
        || M <- lib_mon_agent:get_circle_mon_for_battle(X, Y, Radii)
    ],
    RoleKeys = [
        {?BATTLE_ROLE, R#scene_role.id}
        || R <- lib_scene_agent:get_circle_roler_for_battle(X, Y, Radii)
    ],
    PetKeys = [
        {?BATTLE_PET, P#pet.id}
        || P <- lib_pet_agent:get_circle_pet_for_battle(X, Y, Radii)
    ],
    sets:from_list(MonKeys ++ RoleKeys ++ PetKeys);
get_in_cage_objs(_Type, _Radii, _Center) ->
    undefined.
