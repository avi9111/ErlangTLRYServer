%%-------------------------------------------------------
%% @File     : lib_ai_util.erl
%% @Brief    : 怪物AI工具函数
%% @Author   : cablsbs
%% @Date     : 2018-11-28
%%-------------------------------------------------------
-module(lib_ai_util).

-include("ai.hrl").
-include("scene.hrl").
-include("battle.hrl").

-include("log.hrl").

-export([
    init/2,
    stop_trace/1,
    check_attack/3,
    find_new_target/1,
    rand_pos_within_area/3,
    update_parent_children/2
]).


%% Apis -------------------------------------------------
% @doc 初始化触发器
init(#mon{ai_group = AiGroup} = Mon, Args) ->
    AiTriggers = gen_triggers(AiGroup),
    AiData = init_ai_data(Args),
    Mon#mon{ai_triggers = AiTriggers, ai_data = AiData}.

% @doc 停止追击
stop_trace(#mon{ai_data = AiData} = Mon) ->
    AiDataN = AiData#{trace_expire => 0, trace_type => 0, trace_args => [], unlock_target => 0},
    Mon#mon{ai_data = AiDataN, target = undefined}.

% @doc 检测攻击
check_attack(NowTimeMS, Target, State) ->
    case is_can_attack(Target, NowTimeMS, State) of
        {{SkillId, SkillLv, _}, DX, DY} ->
            lib_statem:change_state(?STATE_ATTACK, [{State#mon.target, DX, DY}, SkillId, SkillLv], #mon.statem, State);
        {false, DX, DY} ->
            SceneId = ?SCENE_ID,
            Offset = min(State#mon.att_area - 1, 5),
            {RandX, RandY} = lib_scene_sign:rand_pos(SceneId, DX, DY, Offset),
            lib_statem:change_state(?STATE_MOVE, [RandX, RandY, ?MT_WALK], #mon.statem, State);
        wait_till_skill_ready ->
            State;
        losted ->
            #mon{ai_data = AiData} = State,
            AiDataN = AiData#{unlock_target => NowTimeMS+1800},
            State#mon{target = losted, ai_data = AiDataN}
    end.

% @doc 寻找新的攻击目标 - 最近目标
find_new_target(#mon{x = X, y = Y, ai_data = #{trace_type := ?MTR_NEAREST, trace_args := {LockTime}}} = State) ->
    NearestFun = fun
        (#scene_role{id = RoleId, x = RX, y = RY}, Tmp) ->
            update_nearest(X, Y, {?BATTLE_ROLE, RoleId}, RX, RY, Tmp);
        (#pet{id = PetId, x = PX, y = PY}, Tmp) ->
            update_nearest(X, Y, {?BATTLE_PET, PetId}, PX, PY, Tmp);
        (#mon{id = MonId, x = MX, y = MY}, Tmp) ->
            update_nearest(X, Y, {?BATTLE_MON, MonId}, MX, MY, Tmp);
        (_, Tmp) ->
            Tmp
    end,
    {InSightRoleL, InSightPetL, InSightMonL} = get_in_sight_objs(State),
    NearestR = lists:foldl(NearestFun, {undefined, 1000}, InSightRoleL),
    NearestRP = lists:foldl(NearestFun, NearestR, InSightPetL),
    case lists:foldl(NearestFun, NearestRP, InSightMonL) of
        {undefined, _} -> undefined;
        {TargetKey, _} -> {TargetKey, LockTime}
    end;
%% 寻找新的攻击目标 - 随机目标
find_new_target(#mon{ai_data = #{trace_type := ?MTR_RANDOM, trace_args := {LockTime}}} = State) ->
    random_target(LockTime, State);
%% 寻找新的攻击目标 - 伤害最多
find_new_target(#mon{ai_data = #{trace_type := ?MTR_HARM_MOST, trace_args := {LockTime}}} = State) ->
    #mon{x = X, y = Y, sight_area = SightArea, trace_area = TraceArea, harm_map = HarmMap} = State,
    HarmMapAlive = filte_dead_target(TraceArea, SightArea, {X, Y}, HarmMap),
    case maps:size(HarmMapAlive) of
        0 ->
            random_target(LockTime, State);
        _MapSize ->
            SortFun = fun({_K1, H1}, {_K2, H2}) -> H1 > H2 end,
            [{TargetKey, _} | _] = lists:sort(SortFun, maps:to_list(HarmMapAlive)),
            {TargetKey, LockTime}
    end;
%% 寻找新的攻击目标 - 伤害权重
find_new_target(#mon{ai_data = #{trace_type := ?MTR_HARM_RATIO, trace_args := {Ratio, LockTime}}} = State) ->
    #mon{x = X, y = Y, sight_area = SightArea, trace_area = TraceArea, harm_map = HarmMap} = State,
    HarmMapAlive = filte_dead_target(TraceArea, SightArea, {X, Y}, HarmMap),
    case maps:size(HarmMapAlive) of
        0 ->
            random_target(LockTime, State);
        MapSize ->
            RatioFix = lists:sublist(Ratio, MapSize),
            SortFun = fun({_K1, H1}, {_K2, H2}) -> H1 > H2 end,
            SortedHarm = lists:sort(SortFun, maps:to_list(HarmMapAlive)),
            {Rank, _} = util:rand_by_weight(RatioFix, 2),
            TargetKey = element(1, lists:nth(Rank, SortedHarm)),
            #mon{
                x = X, y = Y, born_xy = BornXY,
                sight_area = SightArea, trace_area = TraceArea
            } = State,
            case check_target_key({X,Y}, BornXY, SightArea, TraceArea, TargetKey) of
                true -> {TargetKey, LockTime};
                false -> undefined
            end
    end;
%% 寻找新的攻击目标 - 伤害随机
find_new_target(#mon{harm_map = HarmMap, ai_data = #{trace_type := ?MTR_HARM_RANDOM, trace_args := {LockTime}}} = State) ->
    #mon{x = X, y = Y, sight_area = SightArea, trace_area = TraceArea, harm_map = HarmMap} = State,
    HarmMapAlive = filte_dead_target(TraceArea, SightArea, {X, Y}, HarmMap),
    case maps:size(HarmMapAlive) of
        0 ->
            random_target(LockTime, State);
        Size ->
            #mon{
                x = X, y = Y, born_xy = BornXY,
                sight_area = SightArea, trace_area = TraceArea
            } = State,
            TargetKey = lists:nth(util:rand(1, Size), maps:keys(HarmMapAlive)),
            case check_target_key({X,Y}, BornXY, SightArea, TraceArea, TargetKey) of
                true -> {TargetKey, LockTime};
                false -> undefined
            end
    end;
%% 寻找新的攻击目标 - 怪物优先
find_new_target(#mon{ai_data = #{trace_type := ?MTR_MON_ORDER, trace_args := {MIds, LockTime}}} = State) ->
    % 找不到怪物找人
    case select_target_by_mon_order(State, MIds) of
        undefined ->
            InSightRole = get_in_sight_role(State),
            RoleNum = length(InSightRole),
            if
                RoleNum > 0 ->
                    #scene_role{id = TargetId} = lists:nth(util:rand(1, RoleNum), InSightRole),
                    {{?BATTLE_ROLE, TargetId}, LockTime};
                true ->
                    undefined
            end;
        TargetKey ->
            {TargetKey, LockTime}
    end;
%% 寻找新的攻击目标 - 职业优先
find_new_target(#mon{ai_data = #{trace_type := ?MTR_CAREER_ORDER, trace_args := {CareerList, LockTime}}} = State) ->
    InSightRole = get_in_sight_role(State),
    case select_target_by_career_order(InSightRole, CareerList) of
        undefined -> undefined;
        TargetKey -> {TargetKey, LockTime}
    end;
%% 寻找新的攻击目标 - 职业权重
find_new_target(#mon{ai_data = #{trace_type := ?MTR_CAREER_RATIO, trace_args := {CareerRatio, LockTime}}} = State) ->
    InSightRole = get_in_sight_role(State),
    CareerRatioR = case length(CareerRatio) of
        Size when Size > 1 ->
            {CareerRatioRH, [Last]} = util:rand_by_weight_return_rest(CareerRatio, 2, Size - 1),
            lists:reverse([Last | CareerRatioRH]);
        _ ->
            CareerRatio
    end,
    CareerList = [Career || {Career, _} <- CareerRatioR],
    case select_target_by_career_order(InSightRole, CareerList) of
        undefined -> undefined;
        TargetKey -> {TargetKey, LockTime}
    end.

% @doc 随机一个位置
% @spec 范围随机，随机3次，如果随机不到可走位置，返回当前位置
rand_pos_within_area(SceneId, {X, Y}, Radius) ->
    MinX = max(1, X - Radius),
    MinY = max(1, Y - Radius),
    {CMaxX, CMaxY} = conf_scene_mask:get_max_pos(SceneId),
    MaxX = min(X + Radius, CMaxX),
    MaxY = min(Y + Radius, CMaxY),
    case do_rand_pos(SceneId, X, Y, MinX, MinY, MaxX, MaxY, 3) of
        undefined -> {X, Y};
        ToXY -> ToXY
    end.

% @doc 更新boss召唤的怪物数据(更新子怪物列表、ai_cd)
update_parent_children(PMonId, {'child_die', ActionId, ChildId}) ->
    case lib_mon_agent:get_mon(PMonId) of
        #mon{ai_data = AiData} = PMon ->
            Children = maps:get(children, AiData, []),
            case lists:keytake(ActionId, 1, Children) of
                {value, {ActionId, ChildIds}, Rest} ->
                    ChildIdsN = lists:delete(ChildId, ChildIds),
                    PMonN = case ChildIdsN of
                        [] ->
                            {Cd, _, _, _} = conf_ai_action:get(ActionId),
                            AiDataN = maps:put(children, Rest, AiData),
                            AiCdN = maps:put(ActionId, time:unixtime_ms() + Cd, PMon#mon.ai_cd),
                            PMon#mon{ai_data = AiDataN, ai_cd = AiCdN};
                        ChildIdsN ->
                            ChildrenN = [{ActionId, ChildIdsN} | Rest],
                            AiDataN = maps:put(children, ChildrenN, AiData),
                            PMon#mon{ai_data = AiDataN}
                    end,
                    lib_mon_agent:put_mon(PMonN);
                _ ->
                    skip
            end;
        _ ->
            skip
    end.


%% Privates ---------------------------------------------
% gen_triggers(_) -> [].
gen_triggers(0) ->
    [];
gen_triggers(AiGroup) ->
    Triggers = conf_ai:get(AiGroup),
    GenTrigger = fun({TriggerId, ActionId}) ->
        {TrigType, TrigArgs} = conf_ai_trigger:get(TriggerId),
        {ActionCd, PreActId, ActionType, ActionArgs} = conf_ai_action:get(ActionId),
        #trigger{
            trigger_type = TrigType, trigger_args = TrigArgs,
            action_id = ActionId, pre_act_id = PreActId, action_cd = ActionCd,
            action_type = ActionType, action_args = ActionArgs
        }
    end,
    lists:map(GenTrigger, Triggers).

init_ai_data(Args) ->
    AiDataP = case lists:keyfind(parent, 1, Args) of
        {parent, Parent} -> #{parent => Parent};
        _ -> #{}
    end,
    AiDataP.

do_rand_pos(SceneId, X, Y, MinX, MinY, MaxX, MaxY, Retry) when Retry > 0 ->
    ToX = util:rand(MinX, MaxX),
    ToY = util:rand(MinY, MaxY),
    if
        ToX =:= X andalso ToY =:= Y ->
            do_rand_pos(SceneId, X, Y, MinX, MinY, MaxX, MaxY, Retry - 1);
        true ->
            case lib_scene_sign:is_walk_pos(SceneId, ToX, ToY) of
                true -> {ToX, ToY};
                false -> do_rand_pos(SceneId, X, Y, MinX, MinY, MaxX, MaxY, Retry-1)
            end
    end;
do_rand_pos(_SceneId, _X, _Y, _MinX, _MinY, _MaxX, _MaxY, _Retry) ->
    undefined.

%% 是否可以发动攻击
% @spec is_can_attack(Target, NowTimeMS, State) -> false | {false, DX, DY} | {{SkillId, SkillLv, Perc}, DX, DY}.
% Target                    :: {ObjType :: integer(), ObjId :: integer()}
% NowTimeMS = DX = DY       :: integer()
% SkillId = SkillLv = Perc  :: integer()
% State                     :: #mon{}
%% 有目标，且目标未死亡
is_can_attack(Target, NowTimeMS, #mon{x = X, y = Y, att_area = AttArea} = State) ->
    case lib_battle_aid:get_scene_obj_info(alive_xy, Target) of
        {DX, DY} = DeferXY ->
            DistPow = lib_battle_aid:square(DX - X) + lib_battle_aid:square(DY - Y),
            case DistPow =< lib_battle_aid:square(AttArea) of
                true ->
                    #mon{skill_list = SkillList, skill_cd = SkillCd} = State,
                    case get_ready_skill(DistPow, NowTimeMS, SkillList, SkillCd) of
                        [] -> wait_till_skill_ready;
                        ReadyList -> {util:rand_by_weight(ReadyList, 3), DX, DY}
                    end;
                false ->
                    WithinTraceArea = lib_battle_chk:check_distance(DeferXY, State#mon.born_xy, State#mon.trace_area),
                    WithinSightArea = lib_battle_chk:check_distance(DeferXY, {State#mon.x, State#mon.y}, State#mon.sight_area),
                    case WithinTraceArea andalso WithinSightArea of
                        true -> {false, DX, DY};
                        false -> losted
                    end
            end;
        _ ->
            losted
    end.

%% 获取怪物就绪技能
get_ready_skill(DistPow, NowTimeMS, SkillList, SkillCdMap) ->
    [
        {SkillId, SkillLv, Perc}
        || {SkillId, SkillLv, Perc, SkillArea} <- SkillList,
        DistPow =< lib_battle_aid:square(SkillArea),
        maps:get(SkillId, SkillCdMap, 0) =< NowTimeMS
    ].

update_nearest(X, Y, DKey, DX, DY, {_ObjKey, TmpDistPow} = Tmp) ->
    DistPow = lib_battle_aid:square(X - DX) + lib_battle_aid:square(Y - DY),
    case DistPow < TmpDistPow of
        true -> {DKey, DistPow};
        false -> Tmp
    end.

% 检测目标有消息(存活,在视野内,在追击范围内)
check_target_key(XY, BornXY, SightArea, TraceArea, TargetKey) ->
    case lib_battle_aid:get_scene_obj_info(alive_xy, TargetKey) of
        {_DX, _DY} = DeferPos ->
            lib_battle_chk:check_distance(XY, DeferPos, SightArea) andalso
                lib_battle_chk:check_distance(BornXY, DeferPos, TraceArea);
        _ -> false
    end.

get_in_sight_objs(State) ->
    InSightRoleL = get_in_sight_role(State),
    InSightPetL = get_in_sight_pet(State),
    InSightMonL = get_in_sight_mon(State),
    {InSightRoleL, InSightPetL, InSightMonL}.

get_in_sight_role(State) ->
    #mon{
        x = X, y = Y, realm = Realm, born_xy = BornXY,
        trace_area = TraceArea, sight_area = SightArea
    } = State,
    OwnerId = maps:get(id, State#mon.owner, 0),
    SightRoleL = lib_scene_agent:get_circle_roler_for_battle(X, Y, SightArea),
    [
        R || #scene_role{x = RX, y = RY, hp = RHp, realm = RRealm} = R <- SightRoleL,
             RHp > 0, ?MATCH_REALM(Realm, RRealm), ?MATCH_OWNER(OwnerId, R#scene_role.id),
             lib_battle_chk:check_distance({X, Y}, {RX, RY}, SightArea),
             lib_battle_chk:check_distance(BornXY, {RX, RY}, TraceArea)
    ].

get_in_sight_pet(State) ->
    #mon{
        x = X, y = Y, realm = Realm, born_xy = BornXY,
        trace_area = TraceArea, sight_area = SightArea
    } = State,
    OwnerId = maps:get(id, State#mon.owner, 0),
    SightPetL = lib_pet_agent:get_circle_pet_for_battle(X, Y, SightArea),
    [
        P || #pet{x = PX, y = PY, hp = PHp, owner = #{id := POwnerId, realm := PRealm}} = P <- SightPetL,
             PHp > 0, ?MATCH_REALM(Realm, PRealm), ?MATCH_OWNER(OwnerId, POwnerId),
             lib_battle_chk:check_distance({X, Y}, {PX, PY}, SightArea),
             lib_battle_chk:check_distance(BornXY, {PX, PY}, TraceArea)
    ].

get_in_sight_mon(State) ->
    #mon{
        x = X, y = Y, realm = Realm, born_xy = BornXY,
        trace_area = TraceArea, sight_area = SightArea
    } = State,
    SightMonL = lib_mon_agent:get_circle_mon_for_battle(X, Y, SightArea),
    [
        M || #mon{x = MX, y = MY, hp = MHp, realm = MRealm} = M <- SightMonL,
             MHp > 0, Realm =/= MRealm,
             lib_battle_chk:check_distance({X, Y}, {MX, MY}, SightArea),
             lib_battle_chk:check_distance(BornXY, {MX, MY}, TraceArea)
    ].

select_target_by_mon_order(_, []) ->
    undefined;
select_target_by_mon_order(#mon{x = X, y = Y, realm = Realm, trace_area = TraceArea, sight_area = SightArea} = Mon, [MId | Rest]) ->
    case lib_mon_agent:get_scene_mons_by_mid(MId, 1) of
        [Target] ->
            #mon{id = MonId, hp = MHp, x = MX, y = MY, realm = MRealm, born_xy = BornXY} = Target,
            if
                MHp =< 0 -> select_target_by_mon_order(Mon, Rest);
                Realm =:= MRealm -> select_target_by_mon_order(Mon, Rest);
                true ->
                    InSight = lib_battle_chk:check_distance({X, Y}, {MX, MY}, SightArea),
                    InArea = lib_battle_chk:check_distance(BornXY, {MX, MY}, TraceArea),
                    if
                        not InSight -> select_target_by_mon_order(Mon, Rest);
                        not InArea -> select_target_by_mon_order(Mon, Rest);
                        true -> {?BATTLE_MON, MonId}
                    end
            end;
        _ ->
            select_target_by_mon_order(Mon, Rest)
    end.

select_target_by_career_order([], _) ->
    undefined;
select_target_by_career_order(_, []) ->
    undefined;
select_target_by_career_order(SceneRoleL, [Career | Rest]) ->
    case lists:keyfind(Career, #scene_role.career, SceneRoleL) of
        #scene_role{id = RoleId} -> {?BATTLE_ROLE, RoleId};
        _ -> select_target_by_career_order(SceneRoleL, Rest)
    end.

% 随机目标(视野内目标)
random_target(LockTime, Mon) ->
    {InSightRoleL, InSightPetL, InSightMonL} = get_in_sight_objs(Mon),
    AllObjs = InSightRoleL ++ InSightPetL ++ InSightMonL,
    case AllObjs of
        [] ->
            undefined;
        AllObjs ->
            TargetKey = case lists:nth(util:rand(1, length(AllObjs)), AllObjs) of
                #scene_role{id = TargetId} -> {?BATTLE_ROLE, TargetId};
                #pet{id = TargetId} -> {?BATTLE_PET, TargetId};
                #mon{id = TargetId} -> {?BATTLE_MON, TargetId}
            end,
            {TargetKey, LockTime}
    end.

% 过滤已经死亡或距离过远的目标
filte_dead_target(TraceArea, SightArea, MonXY, HarmMap) ->
    FilterFun = fun(K, _V) ->
        case lib_battle_aid:get_scene_obj_info(alive_xy, K) of
            {_, _} = TargetXY ->
                lib_battle_chk:check_distance(MonXY, TargetXY, SightArea) andalso
                    lib_battle_chk:check_distance(MonXY, TargetXY, TraceArea);
            _ ->
                false
        end
    end,
    maps:filter(FilterFun, HarmMap).
