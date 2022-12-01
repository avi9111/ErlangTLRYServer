%%-------------------------------------------------------
%% @File     : lib_obj_pet
%% @Brief    : 宠物OBJ(包括宠物、侠客、小师妹等)
%% @Author   : cablsbs
%% @Date     : 2018-7-19
%%-------------------------------------------------------
-module(lib_obj_pet).

-include("scene.hrl").
-include("battle.hrl").
-include("common.hrl").
-include("proto/prot_902.hrl").

-export([
    init/2,
    on_update/3,
    on_beattack/2,
    on_delete/1,
    on_die/3,

    hide_pet/1,
    show_pet/3,
    gen_pet_attr/2,
    pet_switch_pos_fix/4,
    pet_move_bcast/3
]).


%% Apis -------------------------------------------------
% @doc 初始化
init(Pet, SceneRole) ->
    PetId = gen_auto_id(),
    #scene_role{
        id = RoleId, x = RX, y = RY, name = RoleName,
        server_num = ServerNum, guild = Guild, team = Team, realm = Realm,
        mode = Mode, sid = RoleSid, bt_attr = OwnerAttr, attackable = Attackable,
        rival_guild_map = RivalGuildMap, hostile_guild_set = HostileGuildSet,
        header = Header
    } = SceneRole,

    SceneId = ?SCENE_ID,
    BornXY = {PetX, PetY} = lib_scene_sign:rand_pos(SceneId, RX, RY, ?PET_BORN_OFFSET),
    Owner = #{
        id => RoleId, sid => RoleSid, name => RoleName, mode => Mode,
        server_num => ServerNum, guild => Guild, team => Team, realm => Realm,
        attackable => Attackable, rival_guild_map => RivalGuildMap,
        hostile_guild_set => HostileGuildSet, header => Header
    },

    MoveSpeed = OwnerAttr#bt_attr.move_speed,
    AttrN = (Pet#pet.attr)#bt_attr{move_speed = MoveSpeed},
    BtAttrN = (Pet#pet.bt_attr)#bt_attr{move_speed = MoveSpeed},
    PetN = Pet#pet{
        id = PetId, x = PetX, y = PetY, born_xy = BornXY,
        float_xy = BornXY, owner = Owner,
        attr = AttrN, bt_attr = BtAttrN
    },
    lib_pet_agent:put_pet(PetN),
    PetN.


% @doc 每个handle_update执行一次(移动、血量、目标、buff等逻辑)
% @spec on_update(NowTimeMS, ElapseTime, State) -> ok.
% NowTimeMS = ElapseTime    :: integer()
% State = StateN            :: #pet{}
on_update(NowTimeMS, ElapseTime, State) ->
    State1 = lib_statem:update(NowTimeMS, ElapseTime, #pet.statem, State),
    State2 = lib_effect_mgr:tick_effect(NowTimeMS, State1),
    UpdateCounter = lib_obj_util:update_counter(State#pet.update_counter),
    StateN = State2#pet{update_counter = UpdateCounter},
    lib_pet_agent:put_pet(StateN),
    ok.


% @doc 被攻击后回写
% @spec on_beattack({BtReturn, NowTimeMS}, State) -> ignore.
% BtReturn          :: #bt_return{}
% NowTimeMS         :: integer()
% State             :: #pet{}
% 宠物未死亡
on_beattack({BtReturn, NowTimeMS}, State) when State#pet.hp > 0 ->
    #bt_return{
        hp = NewHpT, bt_attr = NewBtAttr, peffect_map = PEffectMap,
        effect_list = EffectList, effect_cd = EffectCd, shield = Shield
    } = BtReturn,
    NewHp = max(0, NewHpT),
    StateT = State#pet{
        hp = NewHp, bt_attr = NewBtAttr, peffect_map = PEffectMap,
        effect_list = EffectList, effect_cd = EffectCd,
        shield = Shield
    },

    StateN = case NewHp =< 0 of
        false -> StateT;                                                % 宠物受击
        true -> on_die(BtReturn#bt_return.atter, NowTimeMS, StateT)     % 宠物死亡, 不删除对象数据
    end,
    lib_pet_agent:put_pet(StateN),
    ok;
% 宠物已经死亡
on_beattack({_BtReturn, _NowTimeMS}, _State) ->
    skip.

% @doc 删除场景数据
on_delete(#pet{id = PetId} = State) ->
    Msg = #bcast_del_pet{pet_ids = [PetId]},
    {ok, BinData} = prot_msg:encode_msg(90237, Msg),
    broadcast(State, BinData),
    lib_pet_agent:del_pet(State#pet.id),
    lib_obj_util:del_obj_harm_and_cure({?BATTLE_PET, PetId}),
    ok.

% @doc 怪物死亡处理 TODO restore hp
on_die(Atter, NowTimeMS, State) ->
    lib_statem:change_state(?STATE_DIE, [Atter, NowTimeMS], #pet.statem, State).

% @doc 隐藏珍兽
hide_pet(#pet{statem = #statem{cur_state_id = CurStateId}} = Pet) ->
    PetT = lib_obj_util:set_obj_xy(-1, -1, {-1, -1}, Pet),
    case CurStateId of
        ?STATE_MOVE -> lib_statem:change_state(?STATE_IDLE, [], #pet.statem, PetT);
        _ -> PetT#pet{gradient = {0, 0}}
    end.

% @doc 显现珍兽
show_pet(OwnerX, OwnerY, Pet) ->
    SceneId = ?SCENE_ID,
    {ToX, ToY} = lib_scene_sign:rand_pos(SceneId, OwnerX, OwnerY, ?PET_BORN_OFFSET),
    PetT = lib_obj_util:set_obj_xy(ToX, ToY, {ToX, ToY}, Pet),
    lib_obj_util:bcast_walk(ToX, ToY, ?MT_TRANSFER, Pet),
    PetT#pet{gradient = {0, 0}, move_type = ?MT_STOP}.

% @doc 生成宠物属性
gen_pet_attr([{AttrType, Perc} | Rest], Attr) ->
    AttrIndex = AttrType + 1,
    AttrVal = element(AttrIndex, Attr),
    AttrValN = trunc(AttrVal * Perc / 10000),
    AttrN = setelement(AttrIndex, Attr, AttrValN),
    gen_pet_attr(Rest, AttrN);
gen_pet_attr([], Attr) ->
    Attr.

% @doc 重连/顶号 珍兽位置修正
pet_switch_pos_fix(OwnerX, OwnerY, RoleId, RoleSid) ->
    case lib_pet_agent:get_role_pet(RoleId) of
        #pet{x = PX, y = PY, owner = Owner} = Pet ->
            SquareSum = lib_battle_aid:square(OwnerX - PX) + lib_battle_aid:square(OwnerY - PY),
            case SquareSum >= 162 of
                true ->
                    OwnerN = maps:put(sid, RoleSid, Owner),
                    PetT = show_pet(OwnerX, OwnerY, Pet#pet{reset_index = 0, owner = OwnerN}),
                    PetN = lib_statem:change_state(?STATE_IDLE, [], #pet.statem, PetT),
                    lib_pet_agent:put_pet(PetN);
                false ->
                    PetN = Pet#pet{reset_index = 0},
                    lib_pet_agent:put_pet(PetN)
            end;
        _ ->
            skip
    end.

% @doc 宠物位移广播
pet_move_bcast(OldX, OldY, #pet{id = PetId, x = NewX, y = NewY, owner = #{sid:=OwnerSId}} = State) ->
    PetLeaveMsg = #bcast_del_pet{pet_ids = [PetId]},
    {ok, RemovePetBin} = prot_msg:encode_msg(90237, PetLeaveMsg),
    PetSceneInfo = data_transfer:sc_pet_scene_info(State),
    AddPetMsg = #bcast_add_pet_scene_info{pet_list = [PetSceneInfo]},
    {ok, AddPetBin} = prot_msg:encode_msg(90236, AddPetMsg),
    lib_scene_map:pet_move_broadcast(NewX, NewY, OldX, OldY, RemovePetBin, AddPetBin, OwnerSId).


%% Privates ---------------------------------------------
% 场景宠物自增id
gen_auto_id() ->
    AutoId = get({pet, auto_id}),
    put({pet, auto_id}, AutoId + 1).

% 宠物信息广播
broadcast(#pet{x = X, y = Y}, BinData) ->
    case lib_scene_agent:is_bcast_scene() of
        true -> lib_scene_agent:send_to_local_scene(BinData);
        false -> lib_scene_agent:send_to_local_area_scene(X, Y, BinData)
    end.
