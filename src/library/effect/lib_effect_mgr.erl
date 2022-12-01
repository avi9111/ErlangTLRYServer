%%-------------------------------------------------------
%% @File     : lib_effect_mgr
%% @Brief    : 效果管理
%% @Author   : cablsbs
%% @Date     : 2018-8-2
%%-------------------------------------------------------
-module(lib_effect_mgr).

-include("log.hrl").
-include("battle.hrl").
-include("effect.hrl").
-include("scene_objs.hrl").
-include("proto/prot_902.hrl").

-export([
    add_effect/3,
    add_effect/4,
    del_by_effect_ids/2,
    del_by_effect_aids/2,
    del_by_effect_types/2,
    tick_effect/2,

    gen_effect_list_bin/1
]).

-define(ADD_EFFECT, 1).
-define(DEL_EFFECT, 2).


%% Apis -------------------------------------------------
% @doc 添加buff
% @spec add_effect(Caster, Target, ConfEffect) -> TargetN.
% Caster            :: {ObjType :: integer(), ObjId :: integer()}
% Target = TargetN  :: #bt_state{}
% ConfEffect        :: #conf_effect{}
add_effect(Caster, Target, ConfEffect) ->
    add_effect(Caster, Target, ConfEffect, #{}).

% @doc 添加buff
% @spec add_effect(Caster, Target, ConfEffect, Options) -> TargetN.
% Caster            :: {ObjType :: integer(), ObjId :: integer()}
% Target = TargetN  :: #bt_state{}
% ConfEffect        :: #conf_effect{}
% Options           :: #{}
add_effect(Caster, Target, ConfEffect, Options) ->
    NowTimeMS = time:unixtime_ms(),
    case catch chk_add_effect(Target, ConfEffect, NowTimeMS) of
        true ->
            OptionsFix = case lists:member(ConfEffect#conf_effect.type, ?EFFECT_TYPE_SPECIFY_TARGET) of
                true -> Options;
                _ -> maps:remove(target, Options)
            end,
            {UpdatedEffects, AddEffects, DelEffects, BtState1} =
                calc_add_effect(NowTimeMS, Caster, Target, ConfEffect, OptionsFix),
            on_update_effects(UpdatedEffects, BtState1),
            BtState2 = on_del_effects(DelEffects, BtState1),
            on_add_effects(AddEffects, BtState2);
        false ->
            Target
    end.

% @doc 删除效果 (根据效果配置id)
% @spec del_by_effect_ids(Target, EffectIds) -> TargetN.
% Target = TargetN  :: #bt_state{}
% EffectIds         :: [integer()]
del_by_effect_ids(Target, EffectIds) ->
    ParFun = fun(#effect{eff_id = EffId}) -> lists:member(EffId, EffectIds) end,
    {DelEffects, EffectListN} = lists:partition(ParFun, Target#bt_state.effect_list),
    TargetT1 = on_del_effects(DelEffects, Target#bt_state{effect_list = EffectListN}),
    handle_effect_remove_act(TargetT1, DelEffects).

% @doc 删除buff
% @spec del_by_effect_aids(Target, EffectAIds) -> TargetN.
% Target = TargetN  :: #bt_state{}
% EffectAIds        :: [integer()]
del_by_effect_aids(Target, []) ->
    Target;
del_by_effect_aids(Target, EffectAIds) ->
    ParFun = fun(#effect{id = AId}) -> lists:member(AId, EffectAIds) end,
    {DelEffects, EffectListN} = lists:partition(ParFun, Target#bt_state.effect_list),
    TargetT1 = on_del_effects(DelEffects, Target#bt_state{effect_list = EffectListN}),
    handle_effect_remove_act(TargetT1, DelEffects).

% @doc 删除buff types
% @spec del_by_effect_types(Target, EffectTypes) -> TargetN.
% Target = TargetN  :: #bt_state{}
% EffectId          :: integer() | [integer()]
del_by_effect_types(Target, []) ->
    Target;
del_by_effect_types(Target, EffectTypes) ->
    ParFun = fun(#effect{group_type = {_, Type}}) -> lists:member(Type, EffectTypes) end,
    {DelEffects, EffectListN} = lists:partition(ParFun, Target#bt_state.effect_list),
    TargetT1 = on_del_effects(DelEffects, Target#bt_state{effect_list = EffectListN}),
    handle_effect_remove_act(TargetT1, DelEffects).

% @doc buff周期检测(触发效果及检测过期)
tick_effect(NowTimeMS, ObjInfo) ->
    BtState = data_transfer:to_bt_state(ObjInfo),
    #bt_state{peffect_map = PEffectMap, effect_list = EffectList} = BtState,

    % 普通效果
    OnTickFun = fun(Effect, Acc) -> do_tick_effect(Effect, Acc) end,
    {BtStateT0, ExpiredEffects, _} = lists:foldl(OnTickFun, {BtState, [], NowTimeMS}, EffectList),

    % 被动技能效果
    POnTickFun = fun(_Mod, EffectL, Acc) -> lists:foldl(OnTickFun, Acc, EffectL) end,
    {BtStateT1, _} = maps:fold(POnTickFun, {BtStateT0, NowTimeMS}, PEffectMap),

    BtStateT2 = case ExpiredEffects of
        [] -> BtStateT1;
        ExpiredEffects -> on_del_effects(ExpiredEffects, BtStateT1)
    end,
    BtStateN = handle_effect_remove_act(BtStateT2, ExpiredEffects),
    ObjInfoN = data_transfer:to_scene_obj_info(ObjInfo, BtStateN),
    ObjInfoN.

% @doc 生成动态效果列表协议数据，用于通知重登客户端加载
gen_effect_list_bin(#scene_role{id = RoleId, effect_list = EffectList}) ->
    AddFun = fun(Effect, AccBin) ->
        {ok, Bin} = make_effect_change_bin(Effect, ?ADD_EFFECT, {?BATTLE_ROLE, RoleId}),
        <<AccBin/binary, Bin/binary>>
    end,
    lists:foldl(AddFun, <<>>, EffectList).


%% Privates ---------------------------------------------
%% 添加效果检测
chk_add_effect(#bt_state{type = ObjType}, #conf_effect{to_obj = ToObjType}, _NowTimeMS) when (ToObjType =/= ?BATTLE_BOTH andalso ToObjType =/= ObjType) ->
    false;
chk_add_effect(#bt_state{hp = Hp}, #conf_effect{dead_clear = 1}, _NowTimeMS) when Hp =< 0 ->
    false;
chk_add_effect(ObjBtState, ConfEffect, NowTimeMS) ->
    case do_chk_effect_cd(ConfEffect#conf_effect.id, ObjBtState#bt_state.effect_cd, NowTimeMS) of
        true -> do_chk_effect_immune(ConfEffect, ObjBtState#bt_state.effect_list);
        false -> false
    end.

%% 检测效果cd
do_chk_effect_cd(EffectId, EffectCdMap, NowTimeMS) ->
    ValidTime = maps:get(EffectId, EffectCdMap, 0),
    ValidTime < NowTimeMS.

%% 检测是否效果免疫
do_chk_effect_immune(#conf_effect{kind = EffectKind, type = EffectType}, EffectList) ->
    CheckFun = fun
        (#effect{module = effect_efimmune, param = ImmuneParam}) ->
            Chker = fun({Ratio, Kind, Type}) ->
                util:is_bingo(Ratio) andalso (Kind =:= EffectKind orelse Type =:= EffectType)
            end,
            lists:any(Chker, ImmuneParam);
        (#effect{module = effect_imctrl}) ->
            lists:member(EffectKind, ?CONTROL_EFFECT_KINDS);
        (_Effect) ->
            false
    end,
    not lists:any(CheckFun, EffectList).

%% 根据叠加规则，计算添加buff、删除buff
calc_add_effect(NowTimeMS, Caster, BtState, ConfEffect, Options) ->
    #conf_effect{
        id = EffectId, level = EffectLv, cd = EffectCd,
        group = EffectGroup, group_rule = GroupRule,
        type = EffectType, type_rule = TypeRule
    } = ConfEffect,
    #bt_state{effect_list = EffectList, effect_cd = EffectCdMap} = BtState,

    % group rule
    {DelEffects1, EffectList1} = case GroupRule of
        ?GROUP_GONGCUN -> {[], EffectList};
        ?GROUP_FUGAI -> partition_effect_by_group(EffectGroup, EffectList)
    end,

    % type rule
    {UpdatedEffects, AddEffects, DelEffects2, EffectListN, EffectCdMapN} = case TypeRule of
        ?TYPE_GONGCUN ->
            NewEffect = lib_effect_util:gen_new_effect(NowTimeMS, Caster, ConfEffect, Options),
            EffectCdMapT = maps:put(EffectId, NowTimeMS + EffectCd, EffectCdMap),
            case lists:keyfind(EffectId, #effect.eff_id, EffectList1) of
                #effect{level = OLevel} = OEffect when OLevel < EffectLv ->
                    EffectListT = lists:keystore(EffectId, #effect.eff_id, EffectList1, NewEffect),
                    {[], [NewEffect], [OEffect], EffectListT, EffectCdMapT};
                #effect{} ->
                    {[], [], [], EffectList1, EffectCdMapT};
                _ ->
                    EffectListT = [NewEffect | EffectList1],
                    {[], [NewEffect], [], EffectListT, EffectCdMapT}
            end;
        ?TYPE_FUGAI ->
            {SameTypeEffests, EffectListT0} = partition_effect_by_type(EffectType, EffectList1),
            NewEffect = lib_effect_util:gen_new_effect(NowTimeMS, Caster, ConfEffect, Options),
            EffectCdMapT = maps:put(EffectId, NowTimeMS + EffectCd, EffectCdMap),
            EffectListT = [NewEffect | EffectListT0],
            {[], [NewEffect], SameTypeEffests, EffectListT, EffectCdMapT};
        ?TYPE_WUXIAO ->
            case lib_effect_util:has_type_effect(ConfEffect#conf_effect.type, EffectList1) of
                false ->
                    NewEffect = lib_effect_util:gen_new_effect(NowTimeMS, Caster, ConfEffect, Options),
                    EffectCdMapT = maps:put(EffectId, NowTimeMS + EffectCd, EffectCdMap),
                    EffectListT = [NewEffect | EffectList1],
                    {[], [NewEffect], [], EffectListT, EffectCdMapT};
                true ->
                    {[], [], [], EffectList1, EffectCdMap}
            end;
        ?TYPE_DIEJIA ->
            EffectCdMapT = maps:put(EffectId, NowTimeMS + EffectCd, EffectCdMap),
            case lists:keyfind(EffectId, #effect.eff_id, EffectList1) of
                #effect{expire_time = ExpTime} = Effect ->
                    EffectN = Effect#effect{expire_time = ExpTime + ConfEffect#conf_effect.duration},
                    EffectListT = lists:keystore(EffectId, #effect.eff_id, EffectList1, EffectN),
                    {[EffectN], [], [], EffectListT, EffectCdMapT};
                _ when ConfEffect#conf_effect.level =< 200 ->
                    NewEffect = lib_effect_util:gen_new_effect(NowTimeMS, Caster, ConfEffect, Options),
                    EffectListT = [NewEffect | EffectList1],
                    {[], [NewEffect], [], EffectListT, EffectCdMapT};
                _ ->
                    {[], [], [], EffectList1, EffectCdMap}
            end;
        ?TYPE_OVERLAY ->
            {SameTypeEffests, _EffectListT0} = partition_effect_by_type(EffectType, EffectList1),
            case length(SameTypeEffests) < ConfEffect#conf_effect.overlay of
                true ->
                    EffectCdMapT = maps:put(EffectId, NowTimeMS + EffectCd, EffectCdMap),
                    NewEffect = lib_effect_util:gen_new_effect(NowTimeMS, Caster, ConfEffect, Options),
                    EffectListT = [NewEffect | EffectList1],
                    {[], [NewEffect], [], EffectListT, EffectCdMapT};
                false ->
                    {[], [], [], EffectList1, EffectCdMap}
            end
    end,
    BtStateN = BtState#bt_state{effect_list = EffectListN, effect_cd = EffectCdMapN},
    {UpdatedEffects, AddEffects, DelEffects1 ++ DelEffects2, BtStateN}.


%% OnUpdate
on_update_effects(UpdatedEffects, ObjBtState) ->
    #bt_state{type = ObjType, id = ObjId, x = X, y = Y} = ObjBtState,
    GenMsgFun = fun(Effect, AccBin) ->
        {ok, Bin} = make_effect_change_bin(Effect, ?ADD_EFFECT, {ObjType, ObjId}),
        <<AccBin/binary, Bin/binary>>
    end,
    UpdatedBin = lists:foldl(GenMsgFun, <<>>, UpdatedEffects),
    lib_scene_agent:send_to_local_area_scene(X, Y, UpdatedBin).


%% OnDel
on_del_effects(ToDelEffects, ObjBtState) ->
    #bt_state{type = ObjType, id = ObjId, owner_id = OwnerId, x = X, y = Y} = ObjBtState,
    DelFun = fun
        (#effect{eff_id = EffId, module = Mod} = Effect, {AccBin, AccEffectIds, AccBtState}) ->
            {ok, Bin} = make_effect_change_bin(Effect, ?DEL_EFFECT, {ObjType, ObjId}),
            AccBtStateN = Mod:on_del(Effect, AccBtState),
            {<<AccBin/binary, Bin/binary>>, [EffId | AccEffectIds], AccBtStateN}
    end,
    {DelBin, DelEffectIds, ObjBtStateN} = lists:foldl(DelFun, {<<>>, [], ObjBtState}, ToDelEffects),
    lib_scene_agent:send_to_local_area_scene(X, Y, DelBin),

    % 通知主人，珍兽效果删除
    ObjType =:= ?BATTLE_PET andalso lib_scene_agent:send_to_scene_role([OwnerId], DelBin),
    ObjType =:= ?BATTLE_MON andalso erlang:send(self(), {'mon_del_effects', ObjId, DelEffectIds}),
    ObjBtStateN.

%% OnAdd
on_add_effects(ToAddEffects, ObjBtState) ->
    #bt_state{type = ObjType, id = ObjId} = ObjBtState,
    AddFun = fun(#effect{module = Mod} = Effect, {AccBin, AccBtState}) ->
        {ok, Bin} = make_effect_change_bin(Effect, ?ADD_EFFECT, {ObjType, ObjId}),
        AccBtStateN = Mod:on_add(Effect, AccBtState),
        {<<AccBin/binary, Bin/binary>>, AccBtStateN}
    end,
    {AddBin, ObjBtStateN} = lists:foldl(AddFun, {<<>>, ObjBtState}, ToAddEffects),

    % 有可能位置发生改变
    #bt_state{x = X, y = Y} = ObjBtStateN,
    lib_scene_agent:send_to_local_area_scene(X, Y, AddBin),
    ObjBtStateN.

make_effect_change_bin(Effect, ?ADD_EFFECT, {ObjType, ObjId}) ->
    #effect{
        id = AId, eff_id = EffId, level = EffectLv,
        caster = {CasterType, CasterId}, expire_time = ExpireTime
    } = Effect,
    ChangeMsg = #bcast_buff_change{
        caster_type = CasterType, caster_id = CasterId,
        to_type = ObjType, to_id = ObjId,
        buff_aid = AId, buff_id = EffId, buff_lv = EffectLv,
        buff_expire = ExpireTime, change_type = ?ADD_EFFECT
    },
    prot_msg:encode_msg(90230, ChangeMsg);
make_effect_change_bin(#effect{id = AId}, ?DEL_EFFECT, {ObjType, ObjId}) ->
    ChangeMsg = #bcast_buff_change{
        to_type = ObjType, to_id = ObjId,
        buff_aid = AId, change_type = ?DEL_EFFECT
    },
    prot_msg:encode_msg(90230, ChangeMsg).


update_effect_list(#effect{id = AId, expire_time = ExpTime}, EffectList, NowTimeMS) when ExpTime =< NowTimeMS andalso ExpTime =/= 0 ->
    lists:keydelete(AId, #effect.id, EffectList);
update_effect_list(Effect, EffectList, NowTimeMS) ->
    #effect{id = AId, next_tick = NextTick, interval = Interval} = Effect,
    case NextTick > 0 andalso NextTick =< NowTimeMS of
        true ->
            EffectN = Effect#effect{next_tick = NowTimeMS + Interval},
            lists:keystore(AId, #effect.id, EffectList, EffectN);
        false ->
            EffectList
    end.

% @spec partition_effect_by_group(Group, EffectList) -> {EffectList1, EffectList2}.
% Group         :: integer()
% EffectList    :: [#effect{}]
partition_effect_by_group(Group, EffectList) ->
    ParFun = fun(#effect{group_type = {G, _}}) -> G =:= Group end,
    lists:partition(ParFun, EffectList).

% @spec partition_effect_by_type(Type, EffectList) -> {EffectList1, EffectList2}.
% Type          :: integer()
% EffectList    :: [#effect{}]
partition_effect_by_type(Type, EffectList) ->
    ParFun = fun(#effect{group_type = {_, T}}) -> T =:= Type end,
    lists:partition(ParFun, EffectList).

% don't check expired tick
do_tick_effect(Effect, {AccBtState, NowTimeMS}) ->
    #effect{module = EffMod, next_tick = NextTick} = Effect,
    AccBtStateT = case (NextTick > 0 andalso NextTick =< NowTimeMS) andalso
        erlang:function_exported(EffMod, on_tick, 2) of
        true -> EffMod:on_tick(Effect, AccBtState);
        false -> AccBtState
    end,
    EffectListN = update_effect_list(Effect, AccBtStateT#bt_state.effect_list, NowTimeMS),
    AccBtStateN = AccBtStateT#bt_state{effect_list = EffectListN},
    {AccBtStateN, NowTimeMS};
% check expired tick
do_tick_effect(Effect, {AccBtState, Expired, NowTimeMS}) ->
    #effect{
        module = EffMod,
        expire_time = ExpTime,
        next_tick = NextTick
    } = Effect,
    AccBtStateT =
        case (NextTick > 0 andalso NextTick =< NowTimeMS) andalso
            erlang:function_exported(EffMod, on_tick, 2) of
            true -> EffMod:on_tick(Effect, AccBtState);
            false -> AccBtState
        end,
    EffectListN = update_effect_list(Effect, AccBtStateT#bt_state.effect_list, NowTimeMS),
    AccBtStateN = AccBtStateT#bt_state{effect_list = EffectListN},
    ExpiredN = case ExpTime > NowTimeMS of
        true -> Expired;
        false -> [Effect | Expired]
    end,
    {AccBtStateN, ExpiredN, NowTimeMS}.

% 执行移除效果的触发逻辑
handle_effect_remove_act(#bt_state{hp = Hp, type = ObjType, id = ObjId} = BtState, RemovedEffects) when Hp > 0 ->
    ObjKey = {ObjType, ObjId},
    RemoveActs = [RemoveAct || #effect{remove_act = RemoveAct} <- RemovedEffects, RemoveAct =/= []],
    HandleActFun = fun({?ONREMOVE_ADD_EFF, {EffId, EffLv}}, AccBtState) ->
        case conf_effect:get(EffId, EffLv) of
            #conf_effect{} = ConfEffect ->
                add_effect(ObjKey, AccBtState, ConfEffect, #{});
            _ ->
                ?ERROR("No such EffectId: ~p, EffectLv: ~p conf on remove_act !", [EffId, EffLv]),
                AccBtState
        end
    end,
    lists:foldl(HandleActFun, BtState, lists:concat(RemoveActs));
handle_effect_remove_act(BtState, _RemovedEffects) ->
    BtState.
