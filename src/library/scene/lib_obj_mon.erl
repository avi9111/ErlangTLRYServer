%%-------------------------------------------------------
%% @File     : lib_obj_mon
%% @Brief    : 怪物OBJ
%% @Author   : cablsbs
%% @Date     : 2018-7-2
%%-------------------------------------------------------
-module(lib_obj_mon).

-include("scene.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("proto/prot_902.hrl").

-export([
    init/1,
    on_update/3,
    on_beattack/2,
    on_delete/1,
    on_die/3,

    self_kill/1,
    mon_blind/1,
    mon_has_sight/1,
    in_special_stat/1,
    children_sacrify/2,
    mon_move_bcast/3
]).

%% Apis -------------------------------------------------

% @doc 初始化
init([MTypeId, Args] = MonInit) ->
    case conf_mon:get(MTypeId) of
        #mon{attr = ConfAttr, born_xy = BornXY, realm = CRealm} = M ->
            MonId = gen_auto_id(),
            {X, Y} = correct_born_pos(BornXY, lists:keyfind(xy, 1, Args)),
            Attr = correct_mon_attr(ConfAttr, lists:keyfind(attr, 1, Args)),
            Owner = util:prop_get_value(owner, Args, #{}),
            Realm = util:prop_get_value(realm, Args, CRealm),
            AiData = maps:from_list([{K, V} || {K, V} <- Args, lists:member(K, [parent])]),

            BtAttr = Attr,
            Hp = BtAttr#bt_attr.hp_lim,
            MonT = M#mon{
                id = MonId, x = X, y = Y, hp = Hp, owner = Owner, realm = Realm,
                to_xy = {X, Y}, float_xy = {X, Y}, born_xy = {X, Y}, attr = Attr,
                bt_attr = BtAttr, born_time = time:unixtime_ms(), args = Args,
                ai_data = AiData
            },
            Mon = lib_ai_util:init(MonT, Args),
            %% 是否需要在生成的时候广播
            case lib_scene_agent:is_bcast_mon() of
                true ->
                    MonSceneInfo = data_transfer:sc_mon_scene_info(Mon),
                    MonSceneMsg = #bcast_add_mon_scene_info{mon_list = [MonSceneInfo]},
                    {ok, BinData} = prot_msg:encode_msg(90234, MonSceneMsg),
                    broadcast(Mon, BinData);
                _ ->
                    skip
            end,
            lib_mon_agent:put_mon(Mon),
            {ok, Mon};
        _ ->
            ?ERROR_FUNC_CALL([MonInit]),
            {error, bad_mon_id}
    end.

% @doc 每个handle_update执行一次(移动、血量、目标、buff等逻辑)
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State                     :: #mon{}
on_update(NowTimeMS, ElapseTime, State) ->
    State1 = lib_statem:update(NowTimeMS, ElapseTime, #mon.statem, State),
    State2 = lib_effect_mgr:tick_effect(NowTimeMS, State1),
    UpdateCounter = lib_obj_util:update_counter(State#mon.update_counter),
    State3 = case UpdateCounter rem 150 =:= 0 of
        true -> hp_recover(State2);
        false -> State2
    end,
    State4 = lib_scene_lake:mon_check(?SCENE_ID, State3),           %% 镜湖剿匪
    StateT = lib_scene_jousts:mon_check(?SCENE_ID, State4),         %% 演武堂

    InSpecialStat = in_special_stat(StateT),
    StateT1 = if
        InSpecialStat -> StateT;
        true -> mon_ai_pace(NowTimeMS, StateT)
    end,
    StateN = StateT1#mon{update_counter = UpdateCounter},
    lib_mon_agent:put_mon(StateN),
    ok.

% @doc 被攻击后回写
% @spec on_beattack({BtReturn, NowTimeMS}, State) -> ignore.
% BtReturn          :: #bt_return{}
% NowTimeMS         :: integer()
% State             :: #mon{}
%% 怪物未死亡
on_beattack({BtReturn, NowTimeMS}, State) when State#mon.hp > 0 ->
    #mon{x = MX, y = MY, functional_data = FData} = State,
    XY1 = lib_scene_map:get_xy(MX, MY),
    #bt_return{x = X, y = Y} = BtReturn,
    XY2 = lib_scene_map:get_xy(X, Y),
    XY2 =:= XY1 orelse lib_scene_map:repel_user_broadcast(XY1, XY2, State),

    #bt_return{hp = NewHp, bt_attr = NewBtAttr, atter = Atter} = BtReturn,
    #bt_return_atter{type = AtterType, id = AtterID, owner_id = AtterOwner} = Atter,
    AtterKey = {AtterType, AtterID},

    % update harm list
    HarmMapN = lib_battle_aid:update_harm(State#mon.harm_map, AtterKey, State#mon.hp - NewHp),
    OldFirstAtt = lib_scene_agent:get_first_att(State),
    if
        OldFirstAtt =:= 0 andalso AtterType =:= ?BATTLE_ROLE ->
            FirstAtt = AtterID, IsFirstAtt = true;
        OldFirstAtt =:= 0 andalso AtterType =:= ?BATTLE_PET ->
            FirstAtt = AtterOwner, IsFirstAtt = true;
        true ->
            FirstAtt = OldFirstAtt, IsFirstAtt = false
    end,
    IsFirstAtt andalso begin
        bcast_first_att(State#mon{functional_data = FData#{first_att => FirstAtt}})
    end,
    svr_guild_defend:tripod_hurt(?SCENE_ID, State#mon.mid, ?LINE_ID, NewHp),
    case BtReturn#bt_return.hp > 0 of
        true ->
            #bt_return{effect_list = EffectList, effect_cd = EffectCd, shield = Shield} = BtReturn,
            StateT = State#mon{
                hp = NewHp, x = X, y = Y, last_beatt_time = NowTimeMS, bt_attr = NewBtAttr,
                harm_map = HarmMapN, effect_list = EffectList, effect_cd = EffectCd,
                shield = Shield, functional_data = FData#{first_att => FirstAtt}
            },
            % ai触发
            CurStateId = lib_statem:get_cur_state_id(#mon.statem, StateT),
            StateN = case lists:member(CurStateId, [?STATE_MOVE, ?STATE_IDLE]) of
                true -> lib_ai_trigger:be_attack(AtterKey, StateT);
                false -> StateT
            end,
            lib_mon_agent:put_mon(StateN);
        false -> %% 怪物死亡
            StateT = State#mon{
                hp = 0, x = X, y = Y, shield = undefined, harm_map = HarmMapN,
                killer = AtterKey, functional_data = FData#{first_att => FirstAtt}
            },
            StateN = on_die(Atter, NowTimeMS, StateT),
            on_delete(StateN)
    end,
    ok;
%% 怪物已经死亡
on_beattack({_BtReturn, _NowTimeMS}, _State) ->
    skip.

% @doc 删除场景数据
on_delete(State) ->
    clear_summon_mon(State),
    update_parent_children(State#mon.id, State#mon.ai_data),
    {ok, BinData} = prot_msg:encode_msg(90235, #bcast_del_mon{mon_ids = [State#mon.id]}),
    broadcast(State, BinData),
    lib_mon_agent:del_mon(State#mon.id),
    ok.

% @doc 怪物死亡处理
on_die(Atter, NowTimeMS, State) ->
    lib_statem:change_state(?STATE_DIE, [Atter, NowTimeMS], #mon.statem, State).

% @doc 怪物移动逻辑
mon_move_bcast(OldX, OldY, #mon{id = MonId, x = NewX, y = NewY} = State) ->
    DelMonMsg = #bcast_del_mon{mon_ids = [MonId]},
    {ok, DelMonBin} = prot_msg:encode_msg(90235, DelMonMsg),
    MonSceneInfo = data_transfer:sc_mon_scene_info(State),
    AddMonMsg = #bcast_add_mon_scene_info{mon_list = [MonSceneInfo]},
    {ok, AddMonBin} = prot_msg:encode_msg(90234, AddMonMsg),
    lib_scene_map:obj_move_broadcast(NewX, NewY, OldX, OldY, DelMonBin, AddMonBin).

% @doc 怪物自杀
self_kill(MonId) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{} = Mon ->
            MonN = lib_statem:change_state(?STATE_DIE, [], #mon.statem, Mon#mon{hp = 0}),
            lib_obj_mon:on_delete(MonN);
        _ ->
            skip
    end.

% @doc 怪物失明
mon_blind(#mon{x = X, y = Y} = Mon) ->
    SceneId = ?SCENE_ID,
    GenPosFun = fun(_, Acc) ->
        case Acc of
            [{LastX, LastY} | _] ->
                {ToX, ToY} = lib_scene_sign:rand_pos(SceneId, LastX, LastY, 8),
                [{ToX, ToY} | Acc];
            _ ->
                [lib_scene_sign:rand_pos(SceneId, X, Y, 8)]
        end
    end,
    PosList = lists:reverse(lists:foldl(GenPosFun, [], lists:seq(1, 25))),
    MonN = lib_statem:change_state(?STATE_MOVE, [path, PosList], #mon.statem, Mon),
    lib_mon_agent:put_mon(MonN).

% @doc 怪物恢复视力
mon_has_sight(Mon) ->
    MonN = lib_statem:change_state(?STATE_IDLE, [], #mon.statem, Mon),
    lib_mon_agent:put_mon(MonN).

% @doc 怪物特殊状态检测
in_special_stat(Mon) ->
    lib_effect_util:is_stun(Mon) orelse lib_effect_util:is_blind(Mon) orelse Mon#mon.is_back.

% @doc 子怪物牺牲回补
children_sacrify(MonId, [RecHp, RecHpPerc]) ->
    case lib_mon_agent:get_mon(MonId) of
        #mon{hp = Hp, bt_attr = BtAttr} = Mon when Hp > 0 ->
            HpLim = BtAttr#bt_attr.hp_lim,
            TotalRecHp = RecHp + (HpLim * RecHpPerc div 100),
            lib_obj_util:add_obj_hp_restore(Mon, TotalRecHp);
        _ ->
            skip
    end.

%% Privates ---------------------------------------------

% 场景怪物自增id
gen_auto_id() ->
    AutoId = get({mon, auto_id}),
    put({mon, auto_id}, AutoId + 1).

% @doc 怪物信息广播
broadcast(#mon{x = X, y = Y}, BinData) ->
    case lib_scene_agent:is_bcast_scene() of
        true -> lib_scene_agent:send_to_local_scene(BinData);
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BinData)
    end.

% @doc 血量恢复
hp_recover(#mon{hp = Hp} = Mon) when Hp =< 0 ->
    Mon;
hp_recover(#mon{target = Target} = Mon) when is_tuple(Target) ->
    Mon;
hp_recover(#mon{hp = Hp, bt_attr = BtAttr} = Mon) ->
    #bt_attr{hp_lim = HpLim, hp_rec = HpRec} = BtAttr,
    if
        HpLim > Hp -> lib_obj_util:add_obj_hp(Mon, ceil(HpRec * HpLim / 10000));
        true -> Mon
    end.

% @doc 修正出生位置(默认读配置，可以通过{xy, {X, Y}}参数设置)
correct_born_pos(DefaultBornPos, false) ->
    DefaultBornPos;
correct_born_pos(_DefaultBornPos, {xy, BornPos}) ->
    BornPos.

% @doc 修正怪物属性(默认读配置，可以通过{xy, {X, Y}}参数设置)
correct_mon_attr(ConfAttr, false) ->
    ConfAttr;
correct_mon_attr(_ConfAttr, {attr, Attr}) ->
    lib_role_attr:attr_to_record(bt_attr, Attr).

clear_summon_mon(#mon{ai_data = AiData} = Mon) ->
    ChildMonIds = maps:get(children, AiData, []),
    lib_mon_agent:clear_scene_mon_by_ids(ChildMonIds, true),
    AiDataN = maps:put(children, [], AiData),
    Mon#mon{ai_data = AiDataN}.

update_parent_children(MonId, AiData) ->
    case maps:get(parent, AiData, undefined) of
        undefined ->
            skip;
        {ActionId, PMonId} ->
            lib_ai_util:update_parent_children(PMonId, {'child_die', ActionId, MonId})
    end.

% @doc ai相关逻辑
mon_ai_pace(NowTimeMS, State) ->
    CurStateId = lib_statem:get_cur_state_id(#mon.statem, State),
    StateT = case lists:member(CurStateId, [-1, ?STATE_MOVE, ?STATE_IDLE]) of
        true -> lib_ai_trigger:time_drive(NowTimeMS, State);
        false -> State
    end,
    IsInvincible = lib_effect_util:is_invincible(StateT),
    case lists:member(CurStateId, [?STATE_MOVE, ?STATE_IDLE]) of
        true when (not IsInvincible) -> trace_target(NowTimeMS, StateT);
        _ -> StateT
    end.

% @doc 怪物追击目标逻辑
% 可被攻击、有追击目标,或能再次追击
trace_target(NowTimeMS, #mon{target = Target, ai_data = AiData, attackable = Attackable} = State) when Attackable > 0 ->
    TraceExpire = maps:get(trace_expire, AiData, 0),
    UnlockTarget = maps:get(unlock_target, AiData, 0),
    if
        TraceExpire =:= 0 -> % 未初始化
            State;
        TraceExpire =< NowTimeMS -> % 追击结束
            lib_ai_util:stop_trace(State);
        NowTimeMS < UnlockTarget andalso Target =/= losted -> % 索敌CD内
            case is_tuple(Target) of
                true -> lib_ai_util:check_attack(NowTimeMS, Target, State);     % 当前有目标，攻击当前目标
                false -> State                                                  % 当前无目标，跳过
            end;
        true -> % 索敌CD外，进入索敌逻辑
            TraceRet = lib_ai_util:find_new_target(State),
            if
                TraceRet =:= undefined ->
                    AiDataT = AiData#{unlock_target => NowTimeMS + 1800},
                    StateT = State#mon{target = undefined, ai_data = AiDataT},
                    case Target of
                        losted -> back_to_bornpos(StateT);
                        Target -> StateT
                    end;
                true ->
                    % 更新目标
                    {NewTarget, LockTime} = TraceRet,
                    UnlockTargetN = NowTimeMS + LockTime,
                    AiDataN = AiData#{unlock_target => UnlockTargetN},
                    StateN = State#mon{target = NewTarget, ai_data = AiDataN},
                    lib_ai_util:check_attack(NowTimeMS, NewTarget, StateN)
            end
    end;
% 不可攻击的怪物，不进行追击
trace_target(_NowTimeMS, State) ->
    State.

% 返回出生点并回满血
back_to_bornpos(Mon) ->
    #mon{born_xy = {ToX, ToY}, bt_attr = #bt_attr{hp_lim = HpLim}, functional_data = FData} = Mon,
    MonN0 = lib_obj_util:add_obj_hp(Mon#mon{is_back = true}, HpLim),
    MonN = ?iif(lib_scene_api:is_notify_first_att_scene(?SCENE_ID), MonN0#mon{functional_data = FData#{first_att => 0}}, MonN0),
    bcast_first_att(MonN),
    lib_statem:change_state(?STATE_MOVE, [ToX, ToY, ?MT_WALK], #mon.statem, MonN).

%% 通知首次被攻击值改变(仅限野外，挂机，副本场景)
bcast_first_att(#mon{id = ID, mid = MID, functional_data = FData} = Mon) ->
    SceneID = ?SCENE_ID,
    case lib_scene_api:is_notify_first_att_scene(SceneID) of
        true ->
            FirstAtt = lib_scene_agent:get_first_att(FData),
            MsgRecord = #bcast_mon_first_att{id = ID, mid = MID, first_att = FirstAtt},
            {ok, Bin} = prot_msg:encode_msg(90263, MsgRecord),
            broadcast(Mon, Bin);
        _ ->
            skip
    end.
