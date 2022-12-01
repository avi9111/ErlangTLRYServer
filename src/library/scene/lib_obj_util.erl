%%-------------------------------------------------------
%% @File     : lib_obj_util.erl
%% @Brief    : 场景对象工具箱
%% @Author   : cablsbs
%% @Date     : 2018-7-3
%%-------------------------------------------------------

-module(lib_obj_util).

-include("scene.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("effect.hrl").
-include("proto/prot_902.hrl").
-include("proto/prot_903.hrl").

-export([
    get_owner_id/1,
    get_mon_init_hp/1,

    check_move/1,
    calc_move/7,
    calc_gradient/4,
    bcast_walk/4,
    bcast_die/4,
    bcast_speed_change/2,
    bcast_hp_change/6,
    bcast_collect_op/3,
    bcast_exterior_change/6,
    bcast_artifact_change/4,
    bcast_warrior_soul_change/4,
    bcast_spec_stat/5,
    bcast_spec_stat/6,
    update_counter/1,
    reset_point/2,

    set_obj_xy/4,
    add_obj_hp/2,
    add_obj_hp_restore/2,
    update_scene_harm/5,
    update_scene_cure/3,
    del_obj_harm_and_cure/1
]).

% 速度转换为逻辑速度
-define(LOGIC_SPEED(Speed), Speed / 24).

%% Apis -------------------------------------------------
%% @doc 获取主人id
get_owner_id({?BATTLE_ROLE, RoleID}) ->
    RoleID;
get_owner_id({?BATTLE_PET, PetID}) ->
    lib_pet_agent:get_owner_id(PetID);
get_owner_id(_) ->
    0.


%% @doc 获取怪物初始血量
get_mon_init_hp(MId) ->
    case conf_mon:get(MId) of
        #mon{attr = #bt_attr{hp_lim = HpLim}} -> HpLim;
        _ -> 0
    end.

% @doc 移动条件检测(检测定身及眩晕等状态)
check_move(Obj) ->
    StunOrImmoble = lib_effect_util:is_stun_or_immobil(Obj),
    StunOrImmoble andalso throw({false, stun}),

    InSitStat = lib_statem:in_sit(Obj),
    InSitStat andalso throw({false, in_sit}),
    true.

% @doc 计算移动逻辑
calc_move(NonBlocking, {FromX, FromY}, {ToX, ToY}, {GX, GY} = Gradient, Speed, MoveType, ElapseTime) ->
    SceneId = ?SCENE_ID,
    MoveSpeed = get_move_speed(Speed, MoveType),
    Distance = MoveSpeed * ElapseTime / 1000,
    FloatXT = FromX + Distance * GX,
    FloatYT = FromY + Distance * GY,
    FloatX = ?iif(abs(FromX - ToX) =< abs(FromX - FloatXT), ToX, FloatXT),
    FloatY = ?iif(abs(FromY - ToY) =< abs(FromY - FloatYT), ToY, FloatYT),
    NewX = trunc(FloatX),
    NewY = trunc(FloatY),
    case NonBlocking orelse lib_scene_sign:is_walk_pos(SceneId, NewX, NewY) of
        true ->
            GradientN = ?iif(FloatX =:= ToX andalso FloatY =:= ToY, {0, 0}, Gradient),
            {{FloatX, FloatY}, {ToX, ToY}, GradientN, NewX, NewY};
        false ->
            ToXN = trunc(FromX),
            ToYN = trunc(FromY),
            {{ToXN, ToYN}, {ToXN, ToYN}, {0, 0}, ToXN, ToYN}
    end.

%% @doc 计算斜率
% X =:= ToX
calc_gradient(X, Y, X, ToY) ->
    case Y == ToY of
        true -> {0, 0};
        false -> {0, ?iif(ToY > Y, 1, -1)}
    end;
% X =/= ToX and Y =:= ToY
calc_gradient(X, Y, ToX, Y) ->
    {?iif(ToX > X, 1, -1), 0};
% X =/= ToX and Y =/= ToY
calc_gradient(X, Y, ToX, ToY) ->
    Dx = ToX - X,
    Dy = ToY - Y,
    Dis = math:sqrt(Dy * Dy + Dx * Dx),
    {Dx / Dis, Dy / Dis}.

bcast_walk(ToX, ToY, MoveType, #pet{id = PetId, x = NowX, y = NowY}) ->
    do_bcast_walk({bcast_obj_walk, ?BATTLE_PET, PetId, NowX, NowY, ToX, ToY, MoveType});
% 主角
bcast_walk(ToX, ToY, MoveType, #scene_role{id = RoleId, x = NowX, y = NowY} = SceneRole) when RoleId > ?MAX_ROBOT_ID ->
    do_bcast_walk({bcast_obj_walk, ?BATTLE_ROLE, RoleId, NowX, NowY, ToX, ToY, MoveType}),
    lib_team_agent:sync_team_pos(SceneRole);
% 机器人
bcast_walk(ToX, ToY, MoveType, #scene_role{id = RoleId, x = NowX, y = NowY, owner = Owner}) ->
    BCastWalkMsg = {bcast_obj_walk, ?BATTLE_ROLE, RoleId, NowX, NowY, ToX, ToY, MoveType},
    {ok, BCastWalkBin} = prot_msg:encode_msg(90201, BCastWalkMsg),
    OwnerSid = maps:get(sid, Owner, undefined),
    lib_role_send:send_to_sid(OwnerSid, BCastWalkBin),
    lib_scene_agent:send_to_local_area_scene_except(NowX, NowY, BCastWalkBin, OwnerSid);
bcast_walk(ToX, ToY, MoveType, #mon{id = MonId, x = NowX, y = NowY}) ->
    do_bcast_walk({bcast_obj_walk, ?BATTLE_MON, MonId, NowX, NowY, ToX, ToY, MoveType});
bcast_walk(ToX, ToY, MoveType, #carry{id = CarryId, x = NowX, y = NowY}) ->
    do_bcast_walk({bcast_obj_walk, ?BATTLE_CARRY, CarryId, NowX, NowY, ToX, ToY, MoveType});
bcast_walk(ToX, ToY, MoveType, #flyitem{id = FlyitemId, x = NowX, y = NowY}) ->
    do_bcast_walk({bcast_obj_walk, ?BATTLE_FLYITEM, FlyitemId, NowX, NowY, ToX, ToY, MoveType}).

bcast_die(Type, Id, X, Y) ->
    BCastDieMsg = #bcast_obj_die{type = Type, id = Id},
    {ok, BCastDieBin} = prot_msg:encode_msg(90248, BCastDieMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastDieBin).

bcast_speed_change(#scene_role{id = RoleId, x = X, y = Y}, MoveSpeed) ->
    do_bcast_speed_change(?BATTLE_ROLE, RoleId, X, Y, MoveSpeed);
bcast_speed_change(#pet{id = PetId, x = X, y = Y}, MoveSpeed) ->
    do_bcast_speed_change(?BATTLE_PET, PetId, X, Y, MoveSpeed);
bcast_speed_change(#mon{id = MonId, x = X, y = Y}, MoveSpeed) ->
    do_bcast_speed_change(?BATTLE_MON, MonId, X, Y, MoveSpeed).

% @doc 通知血量变化
bcast_hp_change(X, Y, ObjType, ObjId, Hp, HpLim) ->
    BCastHpChangeMsg = #bcast_obj_hp_change{type = ObjType, id = ObjId, hp = Hp, hp_lim = HpLim},
    {ok, BCastHpChangeBin} = prot_msg:encode_msg(90243, BCastHpChangeMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastHpChangeBin).

% @doc 广播采集行为
bcast_collect_op(#coll{id = CollId, x = X, y = Y}, RoleId, Op) ->
    BCastCollectMsg = #bcast_collect{role_id = RoleId, coll_id = CollId, op = Op},
    {ok, BCastCollectBin} = prot_msg:encode_msg(90321, BCastCollectMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastCollectBin).

% @doc 30分钟计数器
update_counter(UpdateCounter) ->
    (UpdateCounter + 1) rem 9000.

% @doc 重置坐标
reset_point(#scene_role{id = RoleId, sid = RoleSid, x = SvrX, y = SvrY, reset_index = ResetIndex} = SceneRole, ResetType) ->
    Msg = #reset_point{
        obj_type = ?BATTLE_ROLE, obj_id = RoleId, x = SvrX, y = SvrY,
        reset_type = ResetType, reset_index = ResetIndex
    },
    {ok, BinData} = prot_msg:encode_msg(90203, Msg),
    lib_role_send:send_to_sid(RoleSid, BinData),
    lib_team_agent:sync_team_pos(SceneRole),
    case lib_scene_agent:is_bcast_scene() of
        false -> lib_scene_agent:send_to_local_area_scene(SvrX, SvrY, BinData);
        true -> lib_scene_agent:send_to_local_scene(BinData)
    end;
reset_point(#pet{id = PetId, x = SvrX, y = SvrY, reset_index = ResetIndex}, ResetType) ->
    Msg = #reset_point{
        obj_type = ?BATTLE_PET, obj_id = PetId, x = SvrX, y = SvrY,
        reset_type = ResetType, reset_index = ResetIndex
    },
    {ok, BinData} = prot_msg:encode_msg(90203, Msg),
    lib_scene_agent:send_to_local_area_scene(SvrX, SvrY, BinData);
reset_point(#mon{id = MonId, x = SvrX, y = SvrY}, ResetType) ->
    Msg = #reset_point{
        obj_type = ?BATTLE_MON, obj_id = MonId, x = SvrX, y = SvrY,
        reset_type = ResetType, reset_index = 1
    },
    {ok, BinData} = prot_msg:encode_msg(90203, Msg),
    lib_scene_agent:send_to_local_area_scene(SvrX, SvrY, BinData).

% @doc 设置场景对象坐标
set_obj_xy(X, Y, FloatXY, #mon{x = OriX, y = OriY} = Obj) ->
    OldXY = lib_scene_map:get_xy(OriX, OriY),
    NewXY = lib_scene_map:get_xy(X, Y),
    ObjN = Obj#mon{x = X, y = Y, float_xy = FloatXY, to_xy = {X, Y}},
    OldXY =:= NewXY orelse lib_obj_mon:mon_move_bcast(OriX, OriY, ObjN),
    ObjN;
set_obj_xy(X, Y, FloatXY, #scene_role{x = OriX, y = OriY} = Obj) ->
    OldXY = lib_scene_map:get_xy(OriX, OriY),
    NewXY = lib_scene_map:get_xy(X, Y),
    ObjN = Obj#scene_role{x = X, y = Y, float_xy = FloatXY, to_xy = {X, Y}},
    OldXY =:= NewXY orelse lib_obj_role:role_move_bcast(OriX, OriY, ObjN),
    ObjN;
set_obj_xy(X, Y, FloatXY, #pet{x = OriX, y = OriY} = Obj) ->
    OldXY = lib_scene_map:get_xy(OriX, OriY),
    NewXY = lib_scene_map:get_xy(X, Y),
    ObjN = Obj#pet{x = X, y = Y, float_xy = FloatXY, to_xy = {X, Y}},
    OldXY =:= NewXY orelse lib_obj_pet:pet_move_bcast(OriX, OriY, ObjN),
    ObjN.

% @doc 修改场景对象血量
% @spec add_obj_hp(SceneObjInfo, DeltaHp) -> SceneObjInfoN.
% SceneObjInfo  :: #scene_role{} | #pet{} | #mon{}
% SceneObjInfoN :: #scene_role{} | #pet{} | #mon{}
% DeltaHp       :: integer()
add_obj_hp(#scene_role{id = RoleId, hp = Hp, x = X, y = Y, bt_attr = BtAttr} = SceneRole, DeltaHp) when Hp > 0 ->
    HpLim = BtAttr#bt_attr.hp_lim,
    HpN = max(0, min(Hp + DeltaHp, HpLim)),
    bcast_hp_change(X, Y, ?BATTLE_ROLE, RoleId, HpN, HpLim),
    lib_effect_util:on_hp_change(Hp, HpN, SceneRole#scene_role{hp = HpN});
add_obj_hp(#pet{id = PetId, hp = Hp, x = X, y = Y, bt_attr = BtAttr} = Pet, DeltaHp) when Hp > 0 ->
    HpLim = BtAttr#bt_attr.hp_lim,
    HpN = max(0, min(Hp + DeltaHp, HpLim)),
    bcast_hp_change(X, Y, ?BATTLE_PET, PetId, HpN, HpLim),
    lib_effect_util:on_hp_change(Hp, HpN, Pet#pet{hp = HpN});
add_obj_hp(#mon{id = MonId, hp = Hp, x = X, y = Y, bt_attr = BtAttr} = Mon, DeltaHp) when Hp > 0 ->
    HpLim = BtAttr#bt_attr.hp_lim,
    HpN = max(0, min(Hp + DeltaHp, HpLim)),
    bcast_hp_change(X, Y, ?BATTLE_MON, MonId, HpN, HpLim),
    lib_effect_util:on_hp_change(Hp, HpN, Mon#mon{hp = HpN});
add_obj_hp(Obj, _DeltaHp) ->
    Obj.

% @doc 修改场景对象血量,修改完回存(直接增加和减少，如金创药效果， 此函数不会中断玩家的操作)
% @spec add_obj_hp_restore(SceneObjInfo, DeltaHp) -> ok.
% SceneObjInfo  :: #scene_role{} | #pet{} | #mon{}
% DeltaHp       :: integer()
add_obj_hp_restore(SceneObjInfo, DeltaHp) ->
    SceneObjInfoN = add_obj_hp(SceneObjInfo, DeltaHp),
    lib_battle_aid:put_scene_obj_info(SceneObjInfoN),
    ok.

% @doc 更新场景总输出 (统计使用)
update_scene_harm(Key, OwnerId, DeferMId, Harm, NewHp) ->
    (Harm > 0 andalso OwnerId > 0) andalso begin
        svr_dynasty_war_bat:hurt_role(?SCENE_ID, ?LINE_ID, OwnerId, Harm),
        svr_career_battle_bat:hurt_role(?SCENE_ID, ?LINE_ID, OwnerId, Harm),
        svr_territory_battle:hurt_role(?SCENE_ID, ?LINE_ID, OwnerId, Harm),
        DeferMId > 0 andalso begin
            svr_world_boss_layer:update_harm(OwnerId, ?SCENE_ID, ?LINE_ID, DeferMId, Harm),
            svr_guild_defend:update_harm(OwnerId, ?SCENE_ID, ?LINE_ID, Harm),
            lib_scene_jousts:mon_hurt(OwnerId, ?SCENE_ID, Harm, NewHp)
        end
    end,
    HarmMap = lib_scene_agent:get_harm_map(),
    AccHarm = maps:get(Key, HarmMap, 0),
    HarmMapN = HarmMap#{Key => AccHarm + Harm},
    lib_scene_agent:put_harm_map(HarmMapN).

% @doc 更新场景总治疗 (统计使用)
update_scene_cure(Key, OwnerId, Cure) ->
    svr_world_boss_layer:update_cure(OwnerId, ?SCENE_ID, ?LINE_ID, Cure),
    Cure > 0 andalso svr_guild_defend:update_cure(OwnerId, ?SCENE_ID, ?LINE_ID, Cure),
    CureMap = lib_scene_agent:get_cure_map(),
    AccCure = maps:get(Key, CureMap, 0),
    CureMapN = CureMap#{Key => AccCure + Cure},
    lib_scene_agent:put_cure_map(CureMapN).

% @doc 删除对象伤害及治疗数据
del_obj_harm_and_cure(ObjKey) ->
    SceneType = ?SCENE_TYPE,
    case lists:member(SceneType, ?NORMAL_SCENE_TYPES) of
        false ->
            HarmMap = lib_scene_agent:get_harm_map(),
            HarmMapN = maps:remove(ObjKey, HarmMap),
            lib_scene_agent:put_harm_map(HarmMapN),

            RecoverMap = lib_scene_agent:get_cure_map(),
            RecoverMapN = maps:remove(ObjKey, RecoverMap),
            lib_scene_agent:put_cure_map(RecoverMapN);
        true ->
            skip
    end.

%% @doc 广播玩家外观变化
bcast_exterior_change(RoleID, Type, ID, Stat, X, Y) ->
    BCastExteriorChange = #bcast_exterior_change{role_id = RoleID, type = Type, id = ID, stat = Stat},
    {ok, BCastSpecStateBin} = prot_msg:encode_msg(90255, BCastExteriorChange),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastSpecStateBin).

% @doc 广播特殊状态
bcast_spec_stat(Stat, Type, RoleId, X, Y) ->
    bcast_spec_stat(Stat, [], Type, RoleId, X, Y).

bcast_spec_stat(Stat, StatParams, Type, RoleId, X, Y) ->
    BCastSpecStateMsg = #bcast_obj_spec_state{type = Type, id = RoleId, state = Stat, state_params = StatParams},
    {ok, BCastSpecStateBin} = prot_msg:encode_msg(90252, BCastSpecStateMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastSpecStateBin).

% @doc 神器幻化切换广播
bcast_artifact_change(RoleId, Artifact, X, Y) ->
    BCastArtifactChangeMsg = #bcast_artifact_change_avatar{role_id = RoleId, artifact = Artifact},
    {ok, BCastArtifactChangeBin} = prot_msg:encode_msg(90259, BCastArtifactChangeMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastArtifactChangeBin).

% @doc 武魂幻化切换广播
bcast_warrior_soul_change(RoleId, WarriorSoul, X, Y) ->
    BCastWarriorSoulChangeMsg = #bcast_warrior_soul_change_avatar{role_id = RoleId, warrior_soul = WarriorSoul},
    {ok, BCastWarriorSoulChangeBin} = prot_msg:encode_msg(90261, BCastWarriorSoulChangeMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastWarriorSoulChangeBin).

%% Privates ---------------------------------------------

% 这里要算移动类型
get_move_speed(Speed, _MoveType) ->
    ?LOGIC_SPEED(Speed).

do_bcast_walk(#bcast_obj_walk{cx = CX, cy = CY} = BCastWalkMsg) ->
    {ok, BCastWalkBin} = prot_msg:encode_msg(90201, BCastWalkMsg),
    lib_scene_agent:send_to_local_area_scene(CX, CY, BCastWalkBin).

do_bcast_speed_change(ObjType, ObjId, X, Y, MoveSpeed) ->
    BCastMoveSpeedMsg = #bcast_move_speed_change{obj_type = ObjType, obj_id = ObjId, move_speed = MoveSpeed},
    {ok, BCastMoveSpeedBin} = prot_msg:encode_msg(90249, BCastMoveSpeedMsg),
    lib_scene_agent:send_to_local_area_scene(X, Y, BCastMoveSpeedBin).
