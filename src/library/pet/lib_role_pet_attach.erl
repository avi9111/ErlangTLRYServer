%%-------------------------------------------------------
%% @File     : lib_role_pet_attach
%% @Brief    : 珍兽附体
%% @Author   : cablsbs
%% @Date     : 2018-11-7
%%-------------------------------------------------------
-module(lib_role_pet_attach).

-include("pet.hrl").
-include("role.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_410.hrl").

-export([
    init/1,
    save/1,
    get_attach/0,
    set_attach/1,
    get_fight/0,
    get_attr/0,
    update_pet_grid/2,
    remap_attach_grid/1,
    refresh_attach_fight/3
]).

-export([
    init_attachs/1,
    send_attach_list/1,
    pet_attach/3,
    pet_unattach/2,
    puton_internal/4,
    clear_internal/3,
    upgrade_internal/3
]).

% 进程字典键
-define(PET_ATTACH_KEY, {lib_role_pet, attach}).


%% Apis -------------------------------------------------
% @doc 初始化
init(#role_state{id = RoleId}) ->
    init_from_db(RoleId).

% @doc 保存
save(#role_state{id = RoleId}) ->
    PetAttach = get_attach(),
    save_to_db(RoleId, PetAttach).

get_attach() ->
    get(?PET_ATTACH_KEY).

set_attach(Attach) ->
    put(?PET_ATTACH_KEY, Attach#pet_attach{updated = true}).

% @doc 获取附体战力
get_fight() ->
    PetAttach = get_attach(),
    PetAttach#pet_attach.attach_fight.

% @doc 获取附体属性
get_attr() ->
    PetAttach = get_attach(),
    PetAttach#pet_attach.bt_attr.

% @doc 更新附体珍兽格子(珍兽格子变化)
update_pet_grid(AttachId, PetGrid) ->
    PetAttach = get_attach(),
    #pet_attach{role_id = RoleId, attach_list = AttachList} = PetAttach,
    AttachRec = lists:keyfind(AttachId, #attach_rec.id, AttachList),
    AttachRecN = AttachRec#attach_rec{pet_grid = PetGrid},
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN}),
    notify_attach_change(RoleId, AttachRecN).

% @doc 重新匹配格子(珍兽背包整理)
remap_attach_grid(PetList) ->
    PetAttachIds = [{AttachId, PGrid} || {PGrid, #{attach_id:=AttachId}} <- PetList, AttachId > 0],
    UpdateFun = fun(AttachRec) ->
        case lists:keyfind(AttachRec#attach_rec.id, 1, PetAttachIds) of
            false -> AttachRec;
            {_Id, PetGrid} -> AttachRec#attach_rec{pet_grid = PetGrid}
        end
    end,
    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachListN = lists:map(UpdateFun, AttachList),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN}),
    send_attach_list(PetAttach#pet_attach.role_id, AttachListN).

% @doc 单个刷新
refresh_attach_fight(RoleSid, AttachId, Pet) ->
    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRec = lists:keyfind(AttachId, #attach_rec.id, AttachList),
    AttachRecN = calc_attach_fight(Pet, AttachRec),
    notify_attach_change(RoleSid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list=AttachListN, attach_fight=AttachFight}).


%% Apis -------------------------------------------------
% @doc 发送珍兽附体列表
send_attach_list(RoleId) ->
    PetAttach = get_attach(),
    send_attach_list(RoleId, PetAttach#pet_attach.attach_list).

% @doc 珍兽附体
pet_attach(RoleState, AttachId, PetGrid) ->
    Pet = lib_role_pet:get_pet(PetGrid),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{star := Star, stat := Stat, level := PetLv} = Pet,
    Star > 0 orelse throw({error, ?RC_PET_BABY_PET_CANNOT_ATTACH}),
    Stat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    MinPetLv = conf_pet_common:get(pet_attach_level_lmt),
    PetLv >= MinPetLv orelse throw({error, ?RC_PET_LEVEL_LMT}),
    RoleLevelLmt = conf_pet_attach:get(AttachId),
    RoleState#role_state.level >= RoleLevelLmt orelse throw({error, ?RC_PET_ROLE_LEVEL_LMT}),

    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRecT = case lists:keyfind(AttachId, #attach_rec.id, AttachList) of
        false -> #attach_rec{id = AttachId, pet_grid = PetGrid};
        #attach_rec{pet_grid = 0} = AttachRec -> AttachRec#attach_rec{pet_grid = PetGrid};
        _AttachRec -> throw({error, ?RC_PET_ATTACH_NOT_EMPTY})
    end,
    AttachRecN = calc_attach_fight(Pet, AttachRecT),
    notify_attach_change(RoleState#role_state.sid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN, attach_fight = AttachFight}),
    lib_role_pet:pet_attached(RoleState#role_state.sid, PetGrid, AttachId),
    ok.

% @doc 珍兽解除附体
pet_unattach(RoleState, AttachId) ->
    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRecT = case lists:keyfind(AttachId, #attach_rec.id, AttachList) of
        #attach_rec{pet_grid = PetGrid} = AttachRec when PetGrid =/= 0 -> AttachRec;
        _ -> throw({error, ?RC_PET_NOT_ATTACHED})
    end,
    AttachRecN = AttachRecT#attach_rec{pet_grid = 0, fight = 0},
    notify_attach_change(RoleState#role_state.sid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN, attach_fight = AttachFight}),
    lib_role_pet:pet_unattached(RoleState#role_state.sid, AttachRecT#attach_rec.pet_grid),
    ok.

% @doc 装配内丹
puton_internal(RoleState, AttachId, InternalGrid, InternalId) ->
    LevelLmt = conf_pet_attach:get(AttachId),
    RoleState#role_state.level >= LevelLmt orelse throw({error, ?RC_PET_ROLE_LEVEL_LMT}),
    Material = conf_pet_internal:material(InternalId),
    is_integer(Material) orelse throw({error, ?RC_PET_NO_SUCH_INTERNAL}),
    CostItems = [{?AST_ITEM, [{Material, 1}]}],
    lib_role_assets:check_items_enough(RoleState, CostItems),

    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRecT = case lists:keyfind(AttachId, #attach_rec.id, AttachList) of
        false -> #attach_rec{id = AttachId};
        AttachRec -> AttachRec
    end,
    Internals = AttachRecT#attach_rec.internals,
    Internal = lists:keyfind(InternalGrid, 1, Internals),
    (Internal =:= false orelse element(2, Internal) =:= 0) orelse
      throw({error, ?RC_PET_INTERNAL_GRID_NOT_EMPTY}),
    lists:keymember(InternalId, 2, Internals) andalso throw({error, ?RC_PET_INTERNAL_REPEATED}),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_PUTON_INTERNAL),

    InternalN = {InternalGrid, InternalId, 1},
    InternalsN = lists:keystore(InternalGrid, 1, Internals, InternalN),
    AttachRecN = case AttachRecT#attach_rec.pet_grid of
        0 ->
            AttachRecT#attach_rec{internals = InternalsN};
        PetGrid ->
            Pet = lib_role_pet:get_pet(PetGrid),
            calc_attach_fight(Pet, AttachRecT#attach_rec{internals = InternalsN})
    end,
    notify_attach_change(RoleState#role_state.sid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN, attach_fight = AttachFight}),
    IsNeedRefresh = AttachRecN#attach_rec.pet_grid > 0,
    {ok, IsNeedRefresh, RoleStateN}.

% @doc 清除内丹
clear_internal(RoleState, AttachId, InternalGrid) ->
    LevelLmt = conf_pet_attach:get(AttachId),
    RoleState#role_state.level >= LevelLmt orelse throw({error, ?RC_PET_ROLE_LEVEL_LMT}),

    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRecT = case lists:keyfind(AttachId, #attach_rec.id, AttachList) of
        false -> #attach_rec{id = AttachId};
        AttachRec -> AttachRec
    end,
    Internals = AttachRecT#attach_rec.internals,
    Internal = lists:keyfind(InternalGrid, 1, Internals),
    Internal =/= false orelse throw({error, ?RC_PET_INTERNAL_GRID_EMPTY}),

    InternalsN = lists:keydelete(InternalGrid, 1, Internals),
    AttachRecN = case AttachRecT#attach_rec.pet_grid of
        0 ->
            AttachRecT#attach_rec{internals = InternalsN};
        PetGrid ->
            Pet = lib_role_pet:get_pet(PetGrid),
            calc_attach_fight(Pet, AttachRecT#attach_rec{internals = InternalsN})
    end,
    notify_attach_change(RoleState#role_state.sid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN, attach_fight = AttachFight}),
    IsNeedRefresh = AttachRecN#attach_rec.pet_grid > 0,
    {ok, IsNeedRefresh}.

% @doc 升级内丹
upgrade_internal(RoleState, AttachId, InternalGrid) ->
    LevelLmt = conf_pet_attach:get(AttachId),
    RoleState#role_state.level >= LevelLmt orelse throw({error, ?RC_PET_ROLE_LEVEL_LMT}),
    #pet_attach{attach_list = AttachList} = PetAttach = get_attach(),
    AttachRec = lists:keyfind(AttachId, #attach_rec.id, AttachList),
    is_record(AttachRec, attach_rec) orelse throw({error, ?RC_PET_BAD_UPGRADE_INTERNAL_REQ}),
    Internals = AttachRec#attach_rec.internals,
    Internal = lists:keyfind(InternalGrid, 1, Internals),
    Internal =/= false orelse throw({error, ?RC_PET_INTERNAL_GRID_EMPTY}),

    {InternalGrid, InternalId, InternalLv} = Internal,
    Material = conf_pet_internal:material(InternalId),
    is_integer(Material) orelse throw({error, ?RC_PET_NO_SUCH_INTERNAL}),

    {CostNum, Rate} = conf_pet_internal_level:upgrade_conf(InternalLv),
    CostItems = [{?AST_ITEM, [{Material, CostNum}]}],
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_PUTON_INTERNAL),

    InternalN = case util:is_bingo(Rate) of
        true -> setelement(3, Internal, InternalLv + 1);
        false -> Internal
    end,
    InternalLvN = element(3, InternalN),
    InternalLvN >= 3 andalso begin
        AttachName = conf_pet_attach:get_name(AttachId),
        InternalName = conf_pet_internal:get_name(InternalId),
        svr_rumor:publish(world, 21405, [RoleState#role_state.name, AttachName, InternalName, InternalLvN])
    end,

    InternalsN = lists:keystore(InternalGrid, 1, Internals, InternalN),
    AttachRecN = case AttachRec#attach_rec.pet_grid of
        0 ->
            AttachRec#attach_rec{internals = InternalsN};
        PetGrid ->
            Pet = lib_role_pet:get_pet(PetGrid),
            calc_attach_fight(Pet, AttachRec#attach_rec{internals = InternalsN})
    end,
    notify_attach_change(RoleState#role_state.sid, AttachRecN),
    AttachListN = lists:keystore(AttachId, #attach_rec.id, AttachList, AttachRecN),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachListN]),
    set_attach(PetAttach#pet_attach{attach_list = AttachListN, attach_fight = AttachFight}),
    IsNeedRefresh = AttachRecN#attach_rec.pet_grid > 0,
    {ok, IsNeedRefresh, RoleStateN}.


%% Privates ---------------------------------------------
init_from_db(RoleId) ->
    SQL = io_lib:format(?SQL_GET_ROLE_PET_ATTACHS, [RoleId]),
    RawAttachs = db:get_all(SQL),
    AttachList = init_attachs(RawAttachs),
    BtAttr = lib_role_attr:merge_attr([A#attach_rec.bt_attr || A <- AttachList]),
    AttachFight = lists:sum([A#attach_rec.fight || A <- AttachList]),
    PetAttach = #pet_attach{
        role_id = RoleId, attach_list = AttachList,
        bt_attr = BtAttr, attach_fight = AttachFight
    },
    put(?PET_ATTACH_KEY, PetAttach).

init_attachs(RawAttachs) ->
    PetBag = lib_role_pet:get_pet_bag(),
    PetAttachIds = [
        {AttachId, PetGrid}
        || {PetGrid, #{attach_id := AttachId}} <- maps:to_list(PetBag),
           AttachId > 0
    ],
    InitFun = fun([AttachId, InternalsBin]) ->
        Internals = type:bitstring_to_term(InternalsBin),
        case lists:keyfind(AttachId, 1, PetAttachIds) of
            false ->
                #attach_rec{id = AttachId, internals = Internals};
            {AttachId, PetGrid} ->
                Pet = maps:get(PetGrid, PetBag),
                AttachRecT = #attach_rec{id=AttachId, pet_grid=PetGrid, internals=Internals},
                calc_attach_fight(Pet, AttachRecT)
        end
    end,
    lists:map(InitFun, RawAttachs).

save_to_db(RoleId, #pet_attach{updated = true, attach_list = AttachList}) ->
    MakeDbDataFun = fun(#attach_rec{id = AttachId, internals = Internals, fight = Fight}) ->
        InternalsBin = type:term_to_bitstring(Internals),
        [RoleId, AttachId, InternalsBin, Fight]
    end,
    AttachDbList = lists:map(MakeDbDataFun, AttachList),
    db:insert_values(?SQL_SET_ROLE_PET_ATTACHS, ?SQL_SET_ROLE_PET_ATTACHS_FMT, AttachDbList);
save_to_db(_RoleId, _PetAttach) ->
    skip.

send_attach_list(RoleId, AttachList) ->
    CltAttachList = data_transfer:sc_clt_attachs(AttachList),
    RespRecord = #get_pet_attach_info_resp{attach_list = CltAttachList},
    {ok, RespBin} = prot_msg:encode_msg(41052, RespRecord),
    lib_role_send:send_to_role(RoleId, RespBin).

calc_attach_fight(Pet, AttachRec) ->
    #{cid := PetCId, level := PetLv, growup_rate := GRate, potens := Potens} = Pet,
    CarryLv = conf_pet:get_carry_lv(PetCId),
    Internals = AttachRec#attach_rec.internals,
    CalFun = fun({Grid, Dan, DanLv}) ->
        RequireCarryLv = conf_pet_internal_hole:get(Grid),
        case RequireCarryLv =< CarryLv orelse is_god_pet(PetCId) of
            true ->
                {AttrType, DQFact} = conf_pet_internal:get(Dan),
                DLFact = conf_pet_internal_level:level_fact(DanLv),
                AttrVal = conf_pet_internal_attr:to_bt_attr(AttrType, GRate, Potens, PetLv, DLFact, DQFact),
                {AttrType, AttrVal};
            _ ->
                {0, 0}
        end
    end,
    BtAttrL = lists:map(CalFun, Internals),
    BtAttr = [{Type, Val} || {Type, Val} <- BtAttrL, Type > 0],
    Fight = lib_role_attr:calc_battle_power(pet_attach, BtAttr, []),
    AttachRec#attach_rec{bt_attr = BtAttr, fight = Fight}.

notify_attach_change(RoleIdOrSid, AttachRec) ->
    CltAttach = data_transfer:sc_clt_attach(AttachRec),
    NotifyMsg = #notify_attach_change{attach = CltAttach},
    {ok, NotifyBin} = prot_msg:encode_msg(41058, NotifyMsg),
    lib_role_send:send_to_role(RoleIdOrSid, NotifyBin).

is_god_pet(PetCId) ->
    ActiveItems = conf_pet_god:active_items(PetCId),
    ActiveItems =/= undefined.
