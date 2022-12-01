%%-------------------------------------------------------
%% @File     : lib_role_pet
%% @Brief    : 珍兽
%% @Author   : cablsbs
%% @Date     : 2018-10-31
%%-------------------------------------------------------
-module(lib_role_pet).

-include("log.hrl").
-include("pet.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("skill.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("scene_objs.hrl").
-include("proto/prot_410.hrl").

-export([
    init/1,
    save/1,
    event/2,
    role_login/1,
    role_logout/1,
    get_fight/1,
    get_attr/1,
    handle_info/2
]).

% 辅助
-export([
    get_pet/1,
    set_pet/4,

    kill_mon_exp/4,
    add_pet_exp/3,
    scene_restore/1,
    pet_skill_lv/1,
    get_current_pet/0,
    pet_attached/3,
    pet_unattached/2,
    pet_assist_skills/0,
    pet_destroy/3,
    get_lv_pet_num/1,
    get_lv_savvy_num/1,
    get_lv_skill_num/1,
    check_scene_npc_distance/2,

    add_pets/3,
    del_pets/3,
    init_pets/1,
    can_add_pets/1,
    get_bag_room/0,
    is_pets_enough/1,
    is_room_enough/1,
    is_bag_full/0
]).


%% API
-export([
    get_pet_bag/0,
    get_pet_depot/0,
    get_depot_pet/1,
    upgrade_savvy/2,
    upgrade_growup/2,
    active_pet_with_gid/2,
    active_pet_with_effect/3,
    pet_fight/2,
    pet_rest/1,
    free_pet/2,
    withdraw_pet/2,
    depot_pet/2,
    use_pill/2,

    get_hatch_info/1,
    hatch_pet_req/2,
    pet_hatch_cancel/2,
    pet_hatch_on/3,
    pet_hatch_off/2,
    pet_hatch_lock/2,
    pet_hatch_unlock/2,
    pet_hatch_start/2,
    pet_hatch_self/3,
    send_hatched_lucky/1,
    get_hatched_pet/2,

    learn_skill/4,
    forget_skill/3,
    upgrade_skill/4,
    pet_inherit/4,
    pet_rename/3,
    active_god_pet/2,
    god_pet_awaken/2
]).


%% Apis -------------------------------------------------

init(#role_state{id = RoleId}) ->
    init_from_db(RoleId).

save(#role_state{id = RoleId}) ->
    RoleData = get_role_data(),
    save_to_db(RoleId, RoleData).

% 事件处理
event(#role_state{id = RoleId}, {timer, ?TIMER_DEFAULT}) ->
    RoleData = get_role_data(),
    save_to_db(RoleId, RoleData);
event(_RoleState, _Event) ->
    skip.

role_login(#role_state{id = RoleId}) ->
    #{in_hatching := InHatching} = get_role_data(),
    InHatching > 0 andalso svr_pet_hatch:role_login(RoleId).

role_logout(#role_state{id = RoleId}) ->
    #{in_hatching := InHatching} = get_role_data(),
    InHatching > 0 andalso svr_pet_hatch:role_logout(RoleId).

% @doc 获取珍兽提供战力
get_fight(_RoleId) ->
    #{pet_fight := PetFight} = get_role_data(),
    AttachFight = lib_role_pet_attach:get_fight(),
    PetFight + AttachFight.

% @doc 获取珍兽提供属性
get_attr(_RoleId) ->
    lib_role_pet_attach:get_attr().

% 珍兽升级
handle_info({'pet_level_up', LevelN, ExpN}, RoleState) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    case maps:get(1, PetBag, undefined) of
        #{hp := Hp, stat := ?PET_STAT_FIGHT} = FirstPet ->
            FirstPetT0 = check_digestion_skill(FirstPet#{level => LevelN, exp => ExpN}),
            FirstPetT1 = calc_pet_fight(FirstPetT0),

            HpLim = util:prop_get_value(?ATTR_HP_LIM, maps:get(bt_attr, FirstPetT1), Hp),
            FirstPetN = FirstPetT1#{hp => HpLim},
            PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, 1, FirstPetN, PetBag),
            NewPetFight = maps:get(fight, FirstPetN),
            RoleDataT = calc_max_fight_pet(RoleState, RoleData, FirstPetN),
            set_role_data(RoleDataT#{pet_bag => PetBagN, pet_fight => NewPetFight}),
            RoleStateN = lib_role_attr:refresh_combat_power(RoleState),
            #role_state{id = RoleId, role_scene = RoleScene} = RoleState,
            lib_scene_api:pet_update(RoleScene, RoleId, FirstPetN),
            {ok, RoleStateN};
        _ ->
            ?ERROR("Pet not fight !"),
            ok
    end;
% 珍兽上阵
handle_info('pet_fight', RoleState) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    case maps:get(1, PetBag, undefined) of
        #{stat := ?PET_STAT_REST} = FirstPet ->
            PetFight = maps:get(fight, FirstPet),
            FirstPetN = FirstPet#{stat => ?PET_STAT_FIGHT},
            PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, 1, FirstPetN, PetBag),
            RoleDataN = RoleData#{pet_bag => PetBagN, fight_ref => undefined, pet_fight => PetFight},
            set_role_data(RoleDataN),

            % 出战珍兽数据(快捷访问)
            FightPet = data_transfer:to_fight_pet(FirstPet, ?fight_pet),
            #role_state{id = RoleId, role_scene = RoleScene} = RoleState,
            set_fight_pet(FightPet),
            lib_scene_api:pet_enter(RoleScene, RoleId, FirstPet),
            lib_scene_api:update('mod_pskills', RoleState),
            RoleStateN = lib_role_attr:refresh_combat_power(RoleState),
            {ok, RoleStateN};
        _ ->
            set_role_data(RoleData#{fight_ref => undefined}),
            ?ERROR("Pet enter failed !"),
            ok
    end;
% 删除被孵化的珍兽宝宝
handle_info('del_hatched_pet', RoleState) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    PetListT = [
        Pet || #{stat:=Stat} = Pet <- maps:values(PetBag),
        Stat =/= ?PET_STAT_HATCHING
    ],
    PetListN = resort_pet_list(PetListT),
    lib_role_pet_attach:remap_attach_grid(PetListN),
    PetBagN = maps:from_list(PetListN),
    ToDelGrids = lists:seq(maps:size(PetBagN) + 1, maps:size(PetBag)),
    [del_pet_db(RoleState#role_state.id, ?PET_BAG, Grid) || Grid <- ToDelGrids],
    set_role_data(RoleData#{pet_bag => PetBagN}),
    router_410:response(41001, RoleState, PetListN),
    ok;
% 返还被孵化的珍兽宝宝(取消或被动取消)
handle_info('return_hatched_pet', RoleState) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    ReturnFun = fun({Grid, Pet}) ->
        Stat = maps:get(stat, Pet),
        case Stat =:= ?PET_STAT_HATCHING of
            true -> {Grid, Pet#{stat => ?PET_STAT_REST}};
            false -> {Grid, Pet}
        end
    end,
    PetListN = lists:map(ReturnFun, maps:to_list(PetBag)),
    PetBagN = maps:from_list(PetListN),
    set_role_data(RoleData#{in_hatching => 0, pet_bag => PetBagN}),
    router_410:response(41001, RoleState, PetListN),
    ok;
% 生成孵化成功的珍兽
handle_info({'do_gen_hatched_pet', Args, RestNum}, RoleState) ->
    case catch do_gen_hatched_pet(RoleState, Args) of
        {ok, RoleDataT} ->
            InHatching = ?iif(RestNum > 0, 1, 0),
            RoleDataN = RoleDataT#{in_hatching => InHatching},
            set_role_data(RoleDataN);
        {error, RetCode} ->
            % TODO 避免出现这种情况
            ?ERROR("Should not arrive here ! GenPetArgs: ~p", [Args]),
            ?ERROR_TOC(RoleState#role_state.id, RetCode)
    end,
    ok;
%% 通过捕捉激活珍兽
handle_info({active_pet_by_catch, GEffect}, RoleState) ->
    case catch active_pet_with_effect(RoleState, GEffect, true) of
        ok ->
            ok;
        {error, RetCode} ->
            ?ERROR_TOC(RoleState#role_state.id, RetCode)
    end;
handle_info(_ModInfo, _RoleState) ->
    ?ERROR("Recv unexpected ModInfo: ~p", [_ModInfo]),
    ok.

%% Apis -------------------------------------------------

% @doc 获取珍兽
get_pet(Grid) ->
    #{pet_bag:=PetBag} = get_role_data(),
    maps:get(Grid, PetBag, undefined).

% @doc 更新珍兽
set_pet(RoleSid, Grid, ChangeType, Pet) ->
    #{pet_bag:=PetBag} = RoleData = get_role_data(),
    PetBagN = maps:put(Grid, Pet, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}),
    notify_pet_change(RoleSid, ?PET_BAG, ChangeType, [{Grid, Pet}]).

% @doc 使用珍兽经验丹
use_pill(PS, Exp) ->
    #role_state{level = RoleLv} = PS,
    FightPet = get_fighting_pet(),
    is_map(FightPet) orelse erlang:throw({error, ?RC_PET_NO_FIGHT_PET}),
    #{level := PetLv, hp := Hp} = FightPet,
    PetLv > 0 andalso Hp > 0 orelse erlang:throw({error, ?RC_PET_NO_FIGHT_PET}),
    PetLv =< RoleLv + 5 orelse erlang:throw({error, ?RC_PET_ALREADY_MAX_LV}),
    add_pet_exp(PS, FightPet, Exp, ?OPT_USE_GOODS),
    ok.

kill_mon_exp(PS, MonLv, LvEffect, Exp) ->
    case get_fighting_pet() of
        #{level := Level, hp := Hp} = FightPet when Level > 0 andalso Hp > 0 ->
            LvDiffPerc = util:get_zone_config(LvEffect, MonLv - Level),
            MonExp = erlang:floor(Exp * (LvDiffPerc / 100)),
            add_pet_exp(PS, FightPet, MonExp, ?OPT_KILL_MON_EXP);
        _ ->
            ignore
    end.

% @doc 珍兽加经验
add_pet_exp(PS, AddExp, OpType) ->
    case get_fighting_pet() of
        #{level := Level, hp := Hp} = FightPet when Level > 0 andalso Hp > 0 ->
            add_pet_exp(PS, FightPet, AddExp, OpType);
        _ ->
            ignore
    end.

add_pet_exp(PS, FightPet, AddExp0, OpType) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    #{level := Level, exp := Exp} = FightPet,
    DlAddExp = lib_role_kill_mon_exp:dl_dan_addition(RoleID, AddExp0, OpType),
    AddExp = AddExp0 + DlAddExp,
    {LevelN, ExpN, IsSync} = calc_pet_level(FightPet, RoleLv + 5, AddExp, false),
    if
        LevelN =:= Level andalso ExpN =:= Exp ->
            ?ERROR_TOC(RoleID, ?RC_PET_NO_MORE_EXP);
        true ->
            notify_pet_level_exp(RoleID, LevelN, ExpN, AddExp, DlAddExp)
    end,
    NewFightPet = if
        LevelN > Level ->
            lib_role:mod_info(RoleID, ?MODULE, {'pet_level_up', LevelN, ExpN}),
            FightPet#{level => LevelN, exp => ExpN};
        true ->
            FightPet#{exp => ExpN}
    end,
    set_fight_pet(NewFightPet),
    IsSync andalso sync_fight_pet(RoleID, NewFightPet),
    ok.

% @doc 场景回存
scene_restore([]) ->
    skip;
scene_restore(PetData) ->
    UpdateFun = fun({Field, Value}, AccFightPet) ->
        maps:put(Field, Value, AccFightPet)
    end,
    FightPet = get_fight_pet(),
    FightPetN = lists:foldl(UpdateFun, FightPet, PetData),
    set_fight_pet(FightPetN).

% @doc 珍兽技能等级
pet_skill_lv(SkillId) ->
    case get_fight_pet() of
        #{skill_list := SkillList} -> util:prop_get_value(SkillId, SkillList, 0);
        _ -> 0
    end.

% @doc 珍兽附体成功
pet_attached(RoleSid, Grid, AttachId) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag),
    PetN = Pet#{stat=>?PET_STAT_ATTACHED, attach_id=>AttachId},
    PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_UPDATE, Grid, PetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}).

% @doc 珍兽取消附体
pet_unattached(RoleSid, Grid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag),
    PetN = Pet#{stat=>?PET_STAT_REST, attach_id=>0},
    PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_UPDATE, Grid, PetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}).

% @doc 出战珍兽辅助技能
pet_assist_skills() ->
    case pet_skill_lv(?SKILL_ID_PET_LOYALTY) of
        Lv when Lv > 0 ->
            [#skill{id = ?SKILL_ID_PET_LOYALTY, level = Lv}];
        _ ->
            []
    end.

% @doc 销毁珍兽
pet_destroy(RoleId, RoleSid, PetGrid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    case maps:get(PetGrid, PetBag, undefined) of
        #{stat := ?PET_STAT_REST, star := 0} ->
            do_del_pet(RoleId, RoleSid, RoleData, PetGrid),
            ok;
        #{stat := PetStat, star := PetStar} ->
            if
                PetStat =/= ?PET_STAT_REST ->
                    {error, ?RC_PET_NOT_A_REST_PET};
                PetStar > 0 ->
                    {error, ?RC_PET_NOT_A_BABY_PET};
                true ->
                    {error, ?RC_PET_NO_SUCH_PET}
            end;
        _ ->
            {error, ?RC_PET_NO_SUCH_PET}
    end.

% @doc 检测与孵化npc的距离
check_scene_npc_distance(#role_state{role_scene = RoleScene}, SceneId) ->
    case RoleScene#role_scene.scene_id =:= SceneId of
        true ->
            NpcList = conf_pet_common:get(hatch_npc),
            {ok, lib_scene_api:is_nearby_npc(RoleScene, NpcList)};
        false ->
            {ok, false}
    end.

%% @doc 增加珍兽
add_pets(PS, List, _OpType) ->
    RoleData = get_role_data(),
    #{pet_bag := PetBag} = RoleData,
    {NewBag, Pets} = do_add_pets(maps:size(PetBag), ?PET_BAG_SIZE, List, PetBag, []),
    set_role_data(RoleData#{pet_bag => NewBag}),
    notify_pet_change(PS#role_state.sid, ?PET_BAG, ?PET_CHANGE_NEW, Pets),
    ok.

%% @doc 删除珍兽
del_pets(PS, [Grid], _OpType) ->
    #role_state{id = RoleID, sid = RoleSid} = PS,
    RoleData = get_role_data(),
    do_del_pet(RoleID, RoleSid, RoleData, Grid);
del_pets(PS, List, _OpType) ->
    RoleData = get_role_data(),
    #{pet_bag := PetBag} = RoleData,
    NewBag = do_del_pets(List, PetBag),
    PetListN = resort_pet_list(maps:to_list(NewBag)),
    lib_role_pet_attach:remap_attach_grid(PetListN),
    PetBagN = maps:from_list(PetListN),
    ToDelGrids = lists:seq(maps:size(PetBagN) + 1, maps:size(PetBag)),
    [del_pet_db(PS#role_state.id, ?PET_BAG, Grid) || Grid <- ToDelGrids],
    set_role_data(RoleData#{pet_bag => PetBagN}),
    router_410:response(41001, PS, PetListN),
    ok.

%% @doc 是否可以加珍兽
can_add_pets(List) ->
    #{pet_bag := PetBag} = get_role_data(),
    maps:size(PetBag) + length(List) =< ?PET_BAG_SIZE.

%% @doc 获取珍兽背包空间
get_bag_room() ->
    #{pet_bag := PetBag} = get_role_data(),
    erlang:max(?PET_BAG_SIZE - maps:size(PetBag), 0).

%% @doc 珍兽背包是否足够
is_room_enough(List) ->
    get_bag_room() >= length(List).

%% @doc 珍兽是否足够
is_pets_enough(List) ->
    #{pet_bag := PetBag} = get_role_data(),
    is_pets_enough2(List, PetBag).

%% @doc 珍兽背包是否已满
is_bag_full() ->
    #{pet_bag := PetBag} = get_role_data(),
    maps:size(PetBag) >= ?PET_BAG_SIZE.
%% Apis -------------------------------------------------

%%% 珍兽基础协议处理(背包、仓库、出战、成长等)
% @doc 获取珍兽背包
get_pet_bag() ->
    RoleData = get_role_data(),
    maps:get(pet_bag, RoleData).

% @doc 获取珍兽仓库
get_pet_depot() ->
    RoleData = get_role_data(),
    maps:get(pet_depot, RoleData).

% @doc 获取仓库指定珍兽
get_depot_pet(Grid) ->
    #{pet_depot := PetDepot} = get_role_data(),
    maps:get(Grid, PetDepot, undefined).

% @doc 提升珍兽悟性
upgrade_savvy(RoleState, Grid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := PetCId, name := PetName, stat := Stat, star := Star, savvy_lv := SavvyLv} = Pet,
    Stat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    Star > 0 orelse throw({error, ?RC_PET_BABY_CAN_NOT_UPGRADE_SAVVY}),
    #{quality := PetQuality, max_savvy_lv := MaxSavvyLv} = conf_pet:get(PetCId),
    if
        SavvyLv < MaxSavvyLv ->
            skip;
    % 普通珍兽
        PetQuality =:= ?PQ_NORMAL ->
            throw({error, ?RC_PET_ALREADY_MAX_SAVVY});
    % 神兽
        true ->
            Awaken = maps:get(awaken, Pet, 0),
            GodPetMaxSavvy = conf_pet_god_awaken:max_savvy_lv(PetCId, Awaken),
            SavvyLv < GodPetMaxSavvy orelse throw({error, ?RC_PET_ALREADY_MAX_SAVVY})
    end,
    {Cost, Ratio, FailDownTo} = conf_pet_savvy:upgrade_conf(SavvyLv),
    CostItems = [{?AST_ITEM, Cost}],
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_UPGRADE_SAVVY),
    SavvyLvN = case util:is_bingo(Ratio) of
        true ->
            SavvyLvNT = SavvyLv + 1,
            SavvyLvNT >= 9 andalso svr_rumor:publish(world, 21406, [RoleState#role_state.name, PetName, SavvyLvNT]),
            SavvyLvNT;
        false ->
            FailDownTo
    end,

    if
        SavvyLvN =/= SavvyLv ->
            #{growup_lv := GrowupLv, potential := PetPoten} = Pet,
            PetTitle = gen_pet_title(PetCId, Star, SavvyLvN, GrowupLv, PetPoten),
            #role_state{id = RoleId, sid = RoleSid} = RoleStateN,
            RetCode = case SavvyLvN =< SavvyLv of
                true ->
                    ?ERROR_TOC(RoleId, ?RC_PET_UPGRADE_SAVVY_FAILED),
                    ?RC_FAILED;
                false ->
                    ?ERROR_TOC(RoleId, ?RC_PET_UPGRADE_SAVVY_SUCCEED),
                    ?RC_SUCCEED
            end,

            PetN = calc_pet_fight(Pet#{title => PetTitle, savvy_lv => SavvyLvN}),
            PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_UPDATE, Grid, PetN, PetBag),
            RoleDataT = calc_max_fight_pet(RoleState, RoleData, PetN),
            set_role_data(RoleDataT#{pet_bag => PetBagN}),
            ?TASK_EVENT(RoleId, {'upgrade_savvy', not (SavvyLvN =< SavvyLv)}),
            {ok, RetCode, RoleStateN};
        true ->
            {ok, ?RC_FAILED, RoleStateN}
    end.

% @doc 提升珍兽成长等级
upgrade_growup(RoleState, Grid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := PetCId, name := PetName, stat := Stat, star := Star, growup_lv := GrowupLv} = Pet,
    Stat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    Star =:= 0 orelse throw({error, ?RC_PET_ONLY_BABY_CAN_UPGRADE_GROWUP}),
    GrowupLv < 5 orelse throw({error, ?RC_PET_ALREADY_MAX_GROWUP}),
    GrowupId = conf_pet:get_growup_id(PetCId),
    GrowupConf = conf_pet_growup:growup_conf(GrowupId, GrowupLv),
    is_map(GrowupConf) orelse throw({error, ?RC_PET_BAD_GROWUP_CONF}),
    #{upgrade_rate := UpgradeRate, upgrade_cost := Item} = GrowupConf,
    CostItems = [{?AST_ITEM, [Item]}],
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_UPGRADE_GROW),
    GrowupLvN = case util:is_bingo(UpgradeRate) of
        true -> GrowupLv + 1;
        false -> GrowupLv
    end,
    GrowupLvN =:= 5 andalso svr_rumor:publish(world, 21401, [RoleState#role_state.name, PetName]),
    ?TASK_EVENT(RoleState, {pet_grow, GrowupLvN}),
    if
        GrowupLv =/= GrowupLvN ->
            #role_state{id = RoleId, sid = RoleSid} = RoleStateN,
            #{growup := GrowupRateN} = conf_pet_growup:growup_conf(GrowupId, GrowupLvN),
            PetN = calc_pet_fight(Pet#{growup_lv => GrowupLvN, growup_rate => GrowupRateN}),
            PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_UPDATE, Grid, PetN, PetBag),
            ?ERROR_TOC(RoleId, ?RC_PET_UPGRADE_GROWUP_SUCCEED),
            RoleDataT = calc_max_fight_pet(RoleState, RoleData, PetN),
            set_role_data(RoleDataT#{pet_bag => PetBagN}),
            {ok, ?RC_SUCCEED, RoleStateN};
        true ->
            ?ERROR_TOC(RoleStateN#role_state.id, ?RC_PET_UPGRADE_GROWUP_FAILED),
            {ok, ?RC_FAILED, RoleStateN}
    end.

active_pet_with_gid(RoleState, Gid) ->
    GEffect = conf_goods_effect:get(Gid),
    Costs = [{?AST_ITEM, [{Gid, 1}]}],
    lib_role_assets:check_items_enough(RoleState, Costs),
    active_pet_with_effect(RoleState, GEffect, false),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, Costs, ?OPT_PET_ACTIVE),
    {ok, RoleStateN}.

% @doc 道具激活珍兽
active_pet_with_effect(RoleState, GEffect, Catch) ->
    #role_state{sid = RoleSid} = RoleState,
    check_active_effect(GEffect),
    RoleData = get_role_data(),
    PetBag = maps:get(pet_bag, RoleData, #{}),
    Grid = maps:size(PetBag) + 1,
    Grid =< ?PET_BAG_SIZE orelse throw({error, ?RC_PET_BAG_IS_FULL}),

    {PetCId, {MinStar, MaxStar}, {GrowupLvMin, GrowupLvMax}} = GEffect,
    PetBaseConf = conf_pet:get(PetCId),
    is_map(PetBaseConf) orelse throw({error, ?RC_PET_NO_SUCH_PET_CONF}),
    case maps:get(quality, PetBaseConf) of
        ?PQ_GOD -> check_god_pet_repeat(PetBag, maps:get(pet_depot, RoleData, #{}), PetCId);
        _PQ -> skip
    end,

    AtkType = maps:get(atk_type, PetBaseConf),
    {InitAttrL, PetPoten} = gen_attr_poten(PetCId),
    PetStar = util:rand(MinStar, MaxStar),
    GrowupLv = util:rand(GrowupLvMin, GrowupLvMax),
    GrowupId = conf_pet:get_growup_id(PetCId),
    GrowupConf = conf_pet_growup:growup_conf(GrowupId, GrowupLv),
    is_map(GrowupConf) orelse throw({error, ?RC_PET_BAD_GROWUP_CONF}),
    PetTitle = gen_pet_title(PetCId, 0, 0, GrowupLv, PetPoten),

    GrowupRate = maps:get(growup, GrowupConf, 0),
    PetNameC = conf_pet:get_name(PetCId),
    PetName = unicode:characters_to_binary(PetNameC),
    PetT0 = ?pet#{
        cid => PetCId, title => PetTitle, name => PetName,
        star => PetStar, atk_type => AtkType,
        growup_lv => GrowupLv, growup_rate => GrowupRate,
        potential => PetPoten, init_attr => InitAttrL
    },
    PetT1 = check_digestion_skill(PetT0),
    #{bt_attr := BtAttrL} = PetT2 = calc_pet_fight(PetT1),
    Pet = PetT2#{hp => util:prop_get_value(?ATTR_HP_LIM, BtAttrL, 0)},
    PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_NEW, Grid, Pet, PetBag),
    RoleDataT = calc_max_fight_pet(RoleState, RoleData, Pet),
    RoleDataN = RoleDataT#{pet_bag => PetBagN},
    set_role_data(RoleDataN),
    ?TASK_EVENT(RoleState, 'upgrade_pet'),
    Catch andalso begin
        CarryLv = conf_pet:get_carry_lv(PetCId),
        ?TASK_EVENT(RoleState, {'catch_pet', CarryLv})
    end,
    ok.

% @doc 珍兽出战
pet_fight(RoleState, Grid) ->
    RoleData = get_role_data(),
    #{fight_ref := CurrentRef, pet_bag := PetBag} = RoleData,
    CurrentRef =:= undefined orelse throw({error, ?RC_PET_WAIT_FOR_PET_FIGHT_PLZ}),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #role_state{id = RoleId, role_scene = RoleScene, level = Level} = RoleState,
    #{cid := Cid, stat := PetStat} = Pet,
    conf_pet:get_carry_lv(Cid) > Level andalso throw({error, ?RC_PET_CARRY_LV_LIMIT}),
    PetStat =:= ?PET_STAT_FIGHT andalso throw({error, ?RC_PET_ALREADY_ON_FIGHT}),
    PetStat =:= ?PET_STAT_HATCHING andalso throw({error, ?RC_PET_IS_HATCING}),
    PetStat =:= ?PET_STAT_ATTACHED andalso throw({error, ?RC_PET_ALREADY_ON_ATTACHED}),
    UpdatedPets = if
        Grid =/= 1 ->
            case maps:get(1, PetBag) of
                #{stat := ?PET_STAT_FIGHT} = FirstPet ->
                    FirstPetN = restore_fight_pet(FirstPet),
                    lib_scene_api:pet_leave(RoleScene, RoleId),
                    lib_scene_api:update('mod_pskills', RoleState),
                    [{1, Pet}, {Grid, FirstPetN}];
                #{attach_id := PetAttachId} = FirstPet ->
                    #{attach_id := PetAttachId} = FirstPet,
                    PetAttachId > 0 andalso lib_role_pet_attach:update_pet_grid(PetAttachId, Grid),
                    [{1, Pet}, {Grid, FirstPet}];
                FirstPet when is_map(FirstPet) ->
                    [{1, Pet}, {Grid, FirstPet}]
            end;
        true ->
            []
    end,
    notify_pet_change(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, UpdatedPets),

    PetBagN = maps:merge(PetBag, maps:from_list(UpdatedPets)),
    Ref = lib_role:mod_info(RoleState#role_state.id, ?MODULE, 'pet_fight'),
    set_role_data(RoleData#{fight_ref => Ref, pet_bag => PetBagN}),

    % 上阵珍兽改变事件
    ?EVENT(RoleState#role_state.id, 'cur_pet_update'),
    ok.

% @doc 珍兽休息
pet_rest(RoleState) ->
    RoleData = get_role_data(),
    #{fight_ref := CurrentRef, pet_bag := PetBag} = RoleData,
    CurrentRef =:= undefined orelse throw({error, ?RC_PET_WAIT_FOR_PET_FIGHT_PLZ}),
    FirstPet = maps:get(1, PetBag, undefined),
    is_map(FirstPet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    maps:get(stat, FirstPet) =:= ?PET_STAT_FIGHT orelse throw({error, ?RC_PET_ALREADY_ON_REST}),
    #role_state{id = RoleId, role_scene = RoleScene} = RoleState,
    FirstPetN = restore_fight_pet(FirstPet),
    lib_scene_api:pet_leave(RoleScene, RoleId),
    lib_scene_api:update('mod_pskills', RoleState),
    PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, 1, FirstPetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN, pet_fight => 0}),
    % 上阵珍兽改变事件
    ?EVENT(RoleId, 'cur_pet_update'),
    ok.

% @doc 放生珍兽
free_pet(PS, Grid) ->
    #role_state{id = RoleID} = PS,
    #{pet_bag := PetBag} = get_role_data(),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := PetCId, stat := Stat, growup_rate := GrowupRate, level := PetLv} = Pet,
    Stat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    #{quality := PetQuality} = conf_pet:get(PetCId),
    PetQuality =/= ?PQ_GOD orelse throw({error, ?RC_PET_GOD_CANNOT_FREE}),
    CarryLv = conf_pet:get_carry_lv(PetCId),
    ExpBase = conf_pet_free:free_conf(CarryLv, GrowupRate),
    TotalExp = erlang:floor(ExpBase * conf_pet_level:exp_factor(PetLv)),
    PillID = conf_pet_common:get(pet_exp_pill_id),
    PillExp = conf_pet_common:get(pet_exp_pill_max),
    Costs = [{?AST_PET_C, [Grid]}],
    CItems0 = lib_role_goods:get_items_by_ids(RoleID, ?BAG_ID_ITEM, [PillID]),
    {CItems1, NItems} = make_pills(CItems0, TotalExp, PillExp, PillID, []),
    Rewards = [{?AST_ITEM, NItems}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    lib_role_goods:set_cell_items(RoleID, ?BAG_ID_ITEM, CItems1, ?OPT_PET_FREE),
    PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_PET_FREE),
    PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_PET_FREE),
    {ok, PS2}.

make_pills([], TExp, MExp, ID, Acc) ->
    {Acc, make_pills2(TExp, MExp, ID, [])};
make_pills([Item | T], TExp, MExp, ID, Acc) ->
    #{effect := CExp, num := Num} = Item,
    case Num =:= 1 andalso CExp < MExp of
        true ->
            Exp = erlang:min(TExp, MExp - CExp),
            Pill = Item#{effect => CExp + Exp},
            make_pills(T, TExp - Exp, MExp, ID, [Pill | Acc]);
        _ ->
            make_pills(T, TExp, MExp, ID, Acc)
    end.

make_pills2(0, _MExp, _ID, Acc) ->
    Acc;
make_pills2(_TExp, 0, _ID, Acc) ->
    Acc;
make_pills2(TExp, MExp, ID, Acc) ->
    Exp = erlang:min(TExp, MExp),
    Pill = ?goods_basic#{id => ID, num => 1, effect => Exp},
    make_pills2(TExp - Exp, MExp, ID, [Pill | Acc]).

% @doc 从仓库取出珍兽
withdraw_pet(RoleState, DepotGrid) ->
    #{pet_bag := PetBag, pet_depot := PetDepot} = RoleData = get_role_data(),
    BagGrid = maps:size(PetBag) + 1,
    BagGrid =< ?PET_BAG_SIZE orelse throw({error, ?RC_PET_BAG_IS_FULL}),
    Pet = maps:get(DepotGrid, PetDepot, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),

    PetDepotT = take_pet(RoleState#role_state.sid, ?PET_DEPOT, DepotGrid, PetDepot),
    PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, BagGrid, Pet, PetBag),
    DepotNum = maps:size(PetDepot),
    PetDepotN = maps:remove(DepotNum, PetDepotT),
    del_pet_db(RoleState#role_state.id, ?PET_DEPOT, DepotNum),
    notify_del_pet(RoleState#role_state.sid, ?PET_DEPOT, [DepotNum]),
    set_role_data(RoleData#{pet_bag => PetBagN, pet_depot => PetDepotN}),
    ok.

% @doc 把珍兽存入仓库
depot_pet(RoleState, BagGrid) ->
    RoleData = get_role_data(),
    #{pet_bag := PetBag, depot_size := DepotSize, pet_depot := PetDepot} = RoleData,
    DepotGrid = maps:size(PetDepot) + 1,
    DepotGrid =< (DepotSize + ?INIT_DEPOT_SIZE) orelse throw({error, ?RC_PET_DEPOT_IS_FULL}),
    Pet = maps:get(BagGrid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    PetStat = maps:get(stat, Pet),
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),

    PetBagT = take_pet(RoleState#role_state.sid, ?PET_BAG, BagGrid, PetBag),
    PetDepotN = store_pet(RoleState#role_state.sid, ?PET_DEPOT, ?PET_CHANGE_UPDATE, DepotGrid, Pet, PetDepot),
    BagNum = maps:size(PetBag),
    PetBagN = maps:remove(BagNum, PetBagT),
    del_pet_db(RoleState#role_state.id, ?PET_BAG, BagNum),
    notify_del_pet(RoleState#role_state.sid, ?PET_BAG, [BagNum]),
    set_role_data(RoleData#{pet_bag => PetBagN, pet_depot => PetDepotN}),
    ok.

%%% 孵化相关协议处理
get_hatch_info(RoleState) ->
    svr_pet_hatch:get_hatch_info(RoleState#role_state.id),
    ok.

% 孵化请求
hatch_pet_req(RoleState, Type) ->
    #{in_hatching := InHatching, pet_bag := PetBag} = RoleData = get_role_data(),
    InHatching =:= 0 orelse throw({error, ?RC_PET_BAD_HATCH_REQ}),
    maps:size(PetBag) > 0 orelse throw({error, ?RC_PET_NO_PET_IN_BAG}),
    IsNearBy = check_npc_distance(RoleState),
    IsNearBy orelse throw({error, ?RC_PET_NOT_NEARBY_NPC}),
    RoleIds = if
        Type =:= ?HATCH_TEAM ->
            RoleId = RoleState#role_state.id,
            TeamInfo = lib_team:get_role_team(RoleId),
            is_map(TeamInfo) orelse throw({error, ?RC_PET_HAS_NO_TEAM}),
            #{leader := Leader, members := Members} = TeamInfo,
            RoleId =:= Leader orelse throw({error, ?RC_PET_NOT_TEAM_LEADER}),
            length(Members) =:= 2 orelse throw({error, ?RC_PET_TEAM_MEMBER_LIMIT}),
            [ParnerId] = lists:delete(RoleId, Members),
            SceneId = (RoleState#role_state.role_scene)#role_scene.scene_id,
            CheckMFA = {?MODULE, check_scene_npc_distance, [SceneId]},
            IsParnerArrived = lib_role:apply_call2(ParnerId, CheckMFA),
            IsParnerArrived =:= true orelse throw({error, ?RC_PET_PARTNER_NOT_ARRIVE}),
            [RoleState#role_state.id, ParnerId];
        true ->
            [RoleState#role_state.id]
    end,
    svr_pet_hatch:book_hatch(Type, RoleIds),
    set_role_data(RoleData#{in_hatching => 1}),
    ok.

% 取消孵化
pet_hatch_cancel(RoleState, HatchId) ->
    svr_pet_hatch:pet_hatch_cancel(HatchId, RoleState#role_state.id),
    ok.

% 选中珍兽
pet_hatch_on(RoleState, HatchId, Grid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{star := Star, stat := PetStat} = Pet,
    Star =:= 0 orelse throw({error, ?RC_PET_NOT_A_BABY_PET}),
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    svr_pet_hatch:pet_hatch_on(HatchId, RoleState#role_state.id, Pet),
    PetBagN = PetBag#{Grid => Pet#{stat := ?PET_STAT_HATCHING}},
    RoleDataN = RoleData#{in_hatching => 1, pet_bag => PetBagN},
    set_role_data(RoleDataN),
    ok.

pet_hatch_off(RoleState, HatchId) ->
    #{in_hatching := InHatching} = get_role_data(),
    InHatching =:= 1 orelse throw({error, ?RC_PET_NOT_IN_HATCHING}),
    svr_pet_hatch:pet_hatch_off(HatchId, RoleState#role_state.id),
    ok.

pet_hatch_lock(RoleState, HatchId) ->
    #{in_hatching := InHatching} = get_role_data(),
    InHatching =:= 1 orelse throw({error, ?RC_PET_NOT_IN_HATCHING}),
    svr_pet_hatch:pet_hatch_lock(HatchId, RoleState#role_state.id),
    ok.

pet_hatch_unlock(RoleState, HatchId) ->
    #{in_hatching := InHatching} = get_role_data(),
    InHatching =:= 1 orelse throw({error, ?RC_PET_NOT_IN_HATCHING}),
    svr_pet_hatch:pet_hatch_unlock(HatchId, RoleState#role_state.id),
    ok.

pet_hatch_start(RoleState, HatchId) ->
    RoleId = RoleState#role_state.id,
    #{in_hatching := InHatching} = get_role_data(),
    InHatching =:= 1 orelse throw({error, ?RC_PET_NOT_IN_HATCHING}),
    TeamInfo = lib_team:get_role_team(RoleId),
    is_map(TeamInfo) orelse throw({error, ?RC_PET_HAS_NO_TEAM}),
    #{leader := Leader, members := Members} = TeamInfo,
    RoleId =:= Leader orelse throw({error, ?RC_PET_NOT_TEAM_LEADER}),
    length(Members) =:= 2 orelse throw({error, ?RC_PET_TEAM_MEMBER_LIMIT}),
    svr_pet_hatch:pet_hatch_start(HatchId, RoleId),
    [?TASK_EVENT(MemID, 'start_hatch') || MemID <- Members],
    ok.

% 单人孵化
pet_hatch_self(RoleState, HatchId, Grids) ->
    #role_state{id = RoleID} = RoleState,
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    SelectedMap = maps:with(Grids, PetBag),
    Pets = [{Grid, Pet} || {Grid, #{stat := Stat, star := Star} = Pet} <- maps:to_list(SelectedMap),
        Stat =:= ?PET_STAT_REST, Star =:= 0],
    length(Grids) =:= length(Pets) orelse throw({error, ?RC_PET_BAD_HATCH_REQ}),
    case Pets of
        [{G1, #{cid := CId1} = Pet1}, {G2, #{cid := CId2} = Pet2}] ->
            CId1 =:= CId2 orelse throw({error, ?RC_PET_HATCH_REQUIRE_SAME_PET}),
            svr_pet_hatch:pet_hatch_self(HatchId, RoleState#role_state.id, [Pet1, Pet2]),
            PetBagN = PetBag#{
                G1 => Pet1#{stat => ?PET_STAT_HATCHING},
                G2 => Pet2#{stat => ?PET_STAT_HATCHING}
            },
            RoleDataN = RoleData#{pet_bag => PetBagN},
            set_role_data(RoleDataN),
            ?TASK_EVENT(RoleID, 'start_hatch'),
            ok;
        [{Grid, #{cid := PetCId, growup_lv := GrowupLv} = HatchPet}] ->
            GrowupId = conf_pet:get_growup_id(PetCId),
            PayHatch = conf_pet_growup:get_pay_hatch(GrowupId, GrowupLv),
            lib_role_assets:check_items_enough(RoleState, PayHatch),
            RoleStateN = lib_role_assets:cost_items_notify(RoleState, PayHatch, ?OPT_PET_PAY_HATCH),
            svr_pet_hatch:pet_hatch_self(HatchId, RoleState#role_state.id, [HatchPet]),
            HatchPetN = HatchPet#{stat => ?PET_STAT_HATCHING},
            PetBagN = maps:put(Grid, HatchPetN, PetBag),
            RoleDataN = RoleData#{pet_bag => PetBagN},
            set_role_data(RoleDataN),
            ?TASK_EVENT(RoleID, 'start_hatch'),
            {ok, RoleStateN};
        _ ->
            {error, ?RC_PET_BAD_HATCH_REQ}
    end.

% 获取孵化幸运值
send_hatched_lucky(RoleSid) ->
    RoleData = get_role_data(),
    Lucky = maps:get(lucky, RoleData, 0),
    do_send_hatched_lucky(RoleSid, Lucky).

% 领取孵化的珍兽
get_hatched_pet(RoleState, HatchId) ->
    #{pet_bag := PetBag} = get_role_data(),
    PetGrid = maps:size(PetBag) + 1,
    PetGrid =< ?PET_BAG_SIZE orelse throw({error, ?RC_PET_BAG_IS_FULL}),
    svr_pet_hatch:get_hatched_pet(HatchId, RoleState#role_state.id),
    ok.

% 装配技能
learn_skill(RoleState, PetGrid, SkillGrid, SkillId) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(PetGrid, PetBag, undefined),
    #{stat := PetStat} = Pet,
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    CostItems = learn_skill_check(Pet, SkillGrid, SkillId),
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_LEARN_SKILL),
    Skills = maps:get(skills, Pet),
    SkillsN = lists:keystore(SkillGrid, 1, Skills, {SkillGrid, SkillId, 1}),
    PetN = maps:put(skills, SkillsN, Pet),
    PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, PetGrid, PetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}),
    ?TASK_EVENT(RoleState#role_state.id, learn_pet_skill),
    {ok, RoleStateN}.

% 移忘技能
forget_skill(RoleState, PetGrid, SkillGrid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(PetGrid, PetBag, undefined),
    #{stat := PetStat} = Pet,
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    Skills = maps:get(skills, Pet),
    SkillsN = case lists:keytake(SkillGrid, 1, Skills) of
        {value, _, RestSkills} -> resort_skills(RestSkills);
        _ -> throw({error, ?RC_PET_NO_SUCH_SKILL})
    end,
    PetN = maps:put(skills, SkillsN, Pet),
    PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, PetGrid, PetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}),
    ok.

% @doc 升级技能
upgrade_skill(RoleState, PetGrid, SkillGrid, StoneNum) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(PetGrid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := PetCId, stat := PetStat} = Pet,
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),

    Skills = maps:get(skills, Pet),
    Skill = lists:keyfind(SkillGrid, 1, Skills),
    Skill =/= undefined orelse throw({error, ?RC_PET_NO_SUCH_SKILL}),
    {_, SkillId, SkillLv} = Skill,
    UpgradeConf = conf_pet_skill_upgrade:get(SkillLv),
    is_map(UpgradeConf) orelse throw({error, ?RC_PET_SKILL_ALREADY_MAX_LV}),
    #{book_num := BookNum, upgrade_rate := UpgradeRateC, carry_lv := CarryLvLmt,
        stone_rate := StoneRate, stone_rate_auto := StoneRateAuto} = UpgradeConf,
    StoneRateFix = ?iif(SkillGrid =:= 0, StoneRate, StoneRateAuto),
    (UpgradeRateC > 0 orelse StoneRateFix > 0) orelse throw({error, ?RC_PET_SKILL_ALREADY_MAX_LV}),

    CarryLv = conf_pet:get_carry_lv(maps:get(cid, Pet)),
    #{quality := PetQuality} = conf_pet:get(PetCId),
    (CarryLvLmt =< CarryLv orelse PetQuality =:= ?PQ_GOD) orelse throw({error, ?RC_PET_CARRY_LV_LIMIT}),
    CostStone = case StoneNum > 0 of
        true ->
            StoneId = conf_pet_common:get(skill_stone),
            [{StoneId, StoneNum}];
        false ->
            []
    end,
    CostBook = case BookNum > 0 of
        true ->
            #{skill_book := SkillBook} = conf_pet_skill:get(SkillId),
            [{SkillBook, BookNum}];
        false ->
            []
    end,
    CostItems = [{?AST_ITEM, CostStone ++ CostBook}],
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_UPGRADE_SKILL),
    UpgradeRate = UpgradeRateC + (StoneRateFix * StoneNum),
    case util:is_bingo(UpgradeRate) of
        true ->
            ?ERROR_TOC(RoleState#role_state.id, ?RC_PET_UPGRADE_SKILL_SUCCEED),
            SkillsN = lists:keystore(SkillGrid, 1, Skills, {SkillGrid, SkillId, SkillLv + 1}),
            PetT = maps:put(skills, SkillsN, Pet),
            PetN = calc_pet_fight(PetT),
            PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, PetGrid, PetN, PetBag),
            RoleDataT = calc_max_fight_pet(RoleState, RoleData, PetN),
            set_role_data(RoleDataT#{pet_bag => PetBagN});
        false ->
            ?ERROR_TOC(RoleState#role_state.id, ?RC_PET_UPGRADE_SKILL_FAILED)
    end,
    {ok, RoleStateN}.

% @doc 珍兽继承
pet_inherit(RoleState, MaterialGrid, TargetGrid, InheritType) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    MaterialPet = maps:get(MaterialGrid, PetBag, undefined),
    TargetPet = maps:get(TargetGrid, PetBag),
    pet_inherit_check_common(MaterialPet, TargetPet),
    pet_inherit_check_with_type(MaterialPet, TargetPet, InheritType),

    CostItem = conf_pet_common:get(inherit_item),
    {TargetPetT, CostNum} = calc_inherit(MaterialPet, TargetPet, InheritType),
    CostItems = [{?AST_ITEM, [{CostItem, CostNum}]}],
    lib_role_assets:check_items_enough(RoleState, CostItems),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, CostItems, ?OPT_PET_INHERIT),
    case maps:get(star, TargetPet) >= 7 of
        true when InheritType =:= ?INHERIT_SKILL ->
            #{name := MaterialPetName} = MaterialPet,
            #{name := TargetPetName} = TargetPet,
            svr_rumor:publish(world, 21404, [RoleState#role_state.name, MaterialPetName, TargetPetName]);
        true ->
            #{name := MaterialPetName} = MaterialPet,
            #{name := TargetPetName} = TargetPet,
            svr_rumor:publish(world, 21403, [RoleState#role_state.name, MaterialPetName, TargetPetName]);
        false ->
            skip
    end,
    TargetPetN = calc_pet_fight(TargetPetT),
    #role_state{id = RoleId, sid = RoleSid} = RoleState,
    PetBagT = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_UPDATE, TargetGrid, TargetPetN, PetBag),
    RoleDataT = calc_max_fight_pet(RoleState, RoleData, TargetPetN),
    do_del_pet(RoleId, RoleSid, RoleDataT#{pet_bag => PetBagT}, MaterialGrid),
    {ok, RoleStateN}.

% @doc 珍兽改名
pet_rename(RoleState, PetGrid, NameReq) ->
    util:check_action_limit({?MODULE, pet_rename}, 5),
    Name = util:escape_varchar(NameReq),
    NameStr = binary_to_list(Name),
    lib_role_name:validate_name(NameStr),

    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(PetGrid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{stat := PetStat} = Pet,
    PetStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    PetName = unicode:characters_to_binary(Name),
    PetN = Pet#{name => PetName},
    PetBagN = store_pet(RoleState#role_state.sid, ?PET_BAG, ?PET_CHANGE_UPDATE, PetGrid, PetN, PetBag),
    set_role_data(RoleData#{pet_bag => PetBagN}),
    ok.

% @doc 激活神兽
active_god_pet(RoleState, PetCId) ->
    ActiveItems = conf_pet_god:active_items(PetCId),
    ActiveItems =/= undefined orelse throw({error, ?RC_PET_NO_SUCH_PET_GOD}),
    Cost = [{?AST_ITEM, [ActiveItems]}],
    lib_role_assets:check_items_enough(RoleState, Cost),
    #{pet_bag := PetBag} = get_role_data(),
    maps:size(PetBag) < ?PET_BAG_SIZE orelse throw({error, ?RC_PET_BAG_IS_FULL}),
    GEffectId = conf_pet_god:geffect_id(PetCId),
    GEffect = conf_goods_effect:get(GEffectId),
    active_pet_with_effect(RoleState, GEffect, false),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, Cost, ?OPT_PET_ACTIVE),
    {ok, RoleStateN}.

% @doc 神兽觉醒
god_pet_awaken(#role_state{sid = RoleSid} = RoleState, Grid) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    Pet = maps:get(Grid, PetBag, undefined),
    is_map(Pet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := PetCId, stat := Stat, awaken := Awaken, savvy_lv := SavvyLv} = Pet,
    Stat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    AwakenConf = conf_pet_god_awaken:get(PetCId, Awaken + 1),
    is_map(AwakenConf) orelse throw({error, ?RC_PET_NO_SUCH_AWAKEN_CONF}),
    #{god_piece := GodPiece, piece_num := PieceNum, need_savvy_lv := NeedSavvyLv} = AwakenConf,
    SavvyLv >= NeedSavvyLv orelse throw({error, ?RC_PET_AWAKEN_SAVVY_LMT}),
    Cost = [{?AST_ITEM, [{GodPiece, PieceNum}]}],
    lib_role_assets:check_items_enough(RoleState, Cost),
    RoleStateN = lib_role_assets:cost_items_notify(RoleState, Cost, ?OPT_PET_AWAKEN),
    #{growup_rate := GrowupRate, potential := Potential} = AwakenConf,
    PetT = Pet#{awaken => Awaken + 1, group_rate => GrowupRate, potential => Potential},
    PetN = calc_pet_fight(PetT),
    PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_NEW, Grid, PetN, PetBag),
    RoleDataT = calc_max_fight_pet(RoleState, RoleData, PetN),
    set_role_data(RoleDataT#{pet_bag => PetBagN}),
    {ok, RoleStateN}.

% @doc 获取星级Lv以上珍兽数量
get_lv_pet_num(Lv) ->
    #{pet_bag := PetBag} = get_role_data(),
    maps:fold(fun(_, Pet, Acc) ->
        #{star := Star} = Pet,
        ?iif(Star >= Lv, Acc + 1, Acc)
    end, 0, PetBag).

% @doc 获取悟性Lv以上珍兽数量
get_lv_savvy_num(Lv) ->
    #{pet_bag := PetBag} = get_role_data(),
    maps:fold(fun(_, Pet, Acc) ->
        #{savvy_lv := SavvyLv} = Pet,
        ?iif(SavvyLv >= Lv, Acc + 1, Acc)
    end, 0, PetBag).

% @doc 获取Lv以上珍兽技能数量
get_lv_skill_num(Lv) ->
    #{pet_bag := PetBag} = get_role_data(),
    maps:fold(fun(_, Pet, Acc) ->
        #{skills := Skills} = Pet,
        length([1 || {_, _, SLv} <- Skills, SLv >= Lv]) + Acc
    end, 0, PetBag).

%% Privates ---------------------------------------------

get_role_data() ->
    get(?MODULE).

set_role_data(RoleData) ->
    erlang:put(?MODULE, RoleData#{updated => true}).

init_from_db(RoleId) ->
    SQL = io_lib:format(?SQL_GET_ROLE_PETS, [RoleId]),
    RawPets = db:get_all(SQL),
    {PetBag, PetDepot, MaxFight, MaxFightName} = init_pets(RawPets),
    PetFight = case maps:find(1, PetBag) of
        {ok, #{fight := Fight, stat:=?PET_STAT_FIGHT} = FirstPet} ->
            FightPet = data_transfer:to_fight_pet(FirstPet, ?fight_pet),
            set_fight_pet(FightPet),
            Fight;
        _ ->
            0
    end,
    RoleDataT = init_role_data(RoleId),
    RoleData = RoleDataT#{
        pet_bag => PetBag, pet_depot => PetDepot, pet_fight => PetFight,
        max_pet_fight => MaxFight, max_pet_name => MaxFightName
    },
    put(?MODULE, RoleData).

init_pets(RawPets) ->
    InitFun = fun(RawPet, {TmpPetBag, TmpPetDepot, TmpFight, TmpName}) ->
        [
            Grid, PetCId, Stat, AttachId, Name, Level, Exp, Star, SavvyLv,
            GrowupLv, GrowupRate, Awaken, PotentialBin, InitAttrBin, SkillsBin,
            SellTime, SellTimes
        ] = RawPet,
        Potential = type:bitstring_to_term(PotentialBin),
        InitAttrL = type:bitstring_to_term(InitAttrBin),
        Skills = type:bitstring_to_term(SkillsBin),
        #{atk_type := AtkType} = conf_pet:get(PetCId),
        PetTitle = gen_pet_title(PetCId, Star, SavvyLv, GrowupLv, Potential),
        PetT = ?pet#{
            cid => PetCId, stat => Stat, attach_id => AttachId,
            title => PetTitle, name => Name, level => Level, exp => Exp,
            atk_type => AtkType, star => Star, savvy_lv => SavvyLv,
            growup_lv => GrowupLv, growup_rate => GrowupRate, awaken => Awaken,
            potential => Potential, init_attr => InitAttrL, skills => Skills,
            sell_time => SellTime, sell_times => SellTimes
        },
        #{bt_attr := BtAttrL} = PetT1 = calc_pet_fight(PetT),
        Pet = PetT1#{hp => util:prop_get_value(?ATTR_HP_LIM, BtAttrL, 0)},
        case Grid < ?PET_DEPOT_OFFSET of
            true ->
                Fight = maps:get(fight, Pet, 0),
                {TmpFightN, TmpNameN} = ?iif(Fight > TmpFight, {Fight, Name}, {TmpFight, TmpName}),
                TmpPetBagN = TmpPetBag#{Grid => Pet},
                {TmpPetBagN, TmpPetDepot, TmpFightN, TmpNameN};
            false ->
                DGrid = Grid - ?PET_DEPOT_OFFSET,
                TmpPetDepotN = TmpPetDepot#{DGrid => Pet},
                {TmpPetBag, TmpPetDepotN, TmpFight, TmpName}
        end
    end,
    lists:foldl(InitFun, {#{}, #{}, 0, <<"">>}, RawPets).

init_role_data(RoleId) ->
    Sql = io_lib:format(?SQL_GET_ROLE_PET_DATA, [RoleId]),
    case ?DB:get_row(Sql) of
        [InHatching, DepotSize, Lucky] ->
            ?role_pet#{in_hatching => InHatching, depot_size => DepotSize, lucky => Lucky};
        _ ->
            ?role_pet#{}
    end.

save_to_db(RoleId, #{updated := true} = RoleData) ->
    #{pet_bag := PetBag, pet_depot := PetDepot} = RoleData,
    PetListBag = maps:to_list(PetBag),
    PetListDepot = [
        {Grid + ?PET_DEPOT_OFFSET, maps:get(Grid, PetDepot)}
        || Grid <- maps:keys(PetDepot)
    ],
    MakeDbDataFun = fun({Grid, Pet}) ->
        #{
            cid := PetCId, stat := Stat, attach_id := AttachId, name := Name, level := Level,
            exp := Exp, star := Star, savvy_lv := SavvyLv, growup_lv := GrowupLv,
            growup_rate := GrowupRate, awaken := Awaken, potential := Potential,
            init_attr := InitAttrL, skills := Skills, fight := Fight,
            sell_time := SellTime, sell_times := SellTimes
        } = Pet,
        PotentialBin = type:term_to_bitstring(Potential),
        InitAttrLBin = type:term_to_bitstring(InitAttrL),
        SkillsBin = type:term_to_bitstring(Skills),
        [
            RoleId, Grid, PetCId, Stat, AttachId, Name, Level, Exp, Star, SavvyLv,
            GrowupLv, GrowupRate, Awaken, PotentialBin, InitAttrLBin, SkillsBin, Fight,
            SellTime, SellTimes
        ]
    end,
    PetDbList = lists:map(MakeDbDataFun, PetListBag ++ PetListDepot),
    db:insert_values(?SQL_SET_ROLE_PETS, ?SQL_SET_ROLE_PETS_FMT, PetDbList),
    save_role_data(RoleId, RoleData#{pet_bag => #{}, pet_depot => #{}});
save_to_db(_RoleId, _RoleData) ->
    skip.

save_role_data(RoleId, RoleData) ->
    #{in_hatching := InHatching, depot_size := DepotSize, lucky := Lucky, pet_fight := PetFight} = RoleData,
    Sql = io_lib:format(?SQL_SET_ROLE_PET_DATA, [RoleId, InHatching, DepotSize, Lucky, PetFight]),
    ?DB:execute(Sql).

check_active_effect({_, {_, _}, {_, _}} = GEffect) ->
    GEffect;
check_active_effect(_GEffect) ->
    throw({error, ?RC_PET_BAD_GOODS_EFFECT}).

gen_attr_poten(PetCId) ->
    Conf = conf_pet:get_attr_potential(PetCId),
    GenFun = fun({AttrRatio, PotenRatio}, {Idx, AccAttr, AccPoten}) ->
        {AttrMin, AttrMax, _} = util:rand_by_weight(AttrRatio, 3),
        AttrValue = util:rand(AttrMin, AttrMax),
        {PotenMin, PotenMax, _} = util:rand_by_weight(PotenRatio, 3),
        PotenValue = util:rand(PotenMin, PotenMax),
        {Idx + 1, [{Idx, AttrValue} | AccAttr], setelement(Idx, AccPoten, PotenValue)}

    end,
    {_, BaseAttrL, PetPoten} = lists:foldl(GenFun, {1, [], ?PET_INIT_POTEN}, Conf),
    {BaseAttrL, PetPoten}.

% 计算珍兽战斗属性及战力
calc_pet_fight(Pet) ->
    #{
        cid := PetCId, level := Lv, atk_type := AtkType, star := Star,
        savvy_lv := SavvyLv, growup_rate := GrowupRate, potential := Potential,
        init_attr := InitAttr, skills := Skills
    } = Pet,
    LevelAttr = conf_pet_level:get_attr(Lv, AtkType),
    BaseAttr = lib_role_attr:merge_attr([InitAttr, LevelAttr]),
    Potens = calc_pet_poten(Star, SavvyLv, Potential),
    #{quality := PetQuality} = conf_pet:get(PetCId),
    SkillSuitAttrL = case calc_skill_suit_lv(Skills, 0) of
        SuitLv when SuitLv > 0 ->
            CarryLv = conf_pet:get_carry_lv(PetCId),
            conf_pet_skill_suit:get(CarryLv, SuitLv, PetQuality, AtkType);
        _ ->
            []
    end,
    {SkillSuitBaseAttr, SkillSuitBtAttr} = lib_role_attr:split_attr(SkillSuitAttrL),
    TotalBaseAttr = lib_role_attr:merge_attr([BaseAttr, SkillSuitBaseAttr]),
    TmpBtAttr = convert_attr(Lv, GrowupRate, TotalBaseAttr, Potens),
    BtAttr = lib_role_attr:merge_attr([SkillSuitBtAttr, TmpBtAttr]),

    SkillList = [#skill{id = SkId, level = SkLv} || {_, SkId, SkLv} <- Skills],
    Fight = lib_role_attr:calc_battle_power(pet, BtAttr, SkillList),
    Pet#{potens => Potens, bt_attr => BtAttr, fight => Fight}.

% 计算珍兽资质
calc_pet_poten(Star, SavvyLv, Potential) ->
    PotenL = tuple_to_list(Potential),
    StarAddon = conf_pet_star:get_poten_addon(Star),
    SavvyAddon = conf_pet_savvy:get_poten_addon(SavvyLv),
    Factor = (10000 + StarAddon) * (10000 + SavvyAddon) / 100000000,
    NewPotenL = [trunc(Poten * Factor) || Poten <- PotenL],
    list_to_tuple(NewPotenL).

% 计算技能套装等级
calc_skill_suit_lv(Skills, SuitLv) ->
    SuitLvN = SuitLv + 1,
    case conf_pet_skill_suit_cond:get(SuitLvN) of
        {Num, Lv} ->
            MatchSkills = [S || {_, _, SkLv} = S <- Skills, SkLv >= Lv],
            case length(MatchSkills) > Num of
                true -> calc_skill_suit_lv(Skills, SuitLvN);
                false -> SuitLv
            end;
        _ -> SuitLv
    end.

% 珍兽等级、成长率、基础属性转战斗属性
convert_attr(Level, GrowupRate, BaseAttrL, Potens) ->
    AttrPairs = conf_pet_attr:get_attr_pairs(),
    [
        begin
            Poten = element(BaseAttrIdx, Potens),
            BaseAttrVal = util:prop_get_value(BaseAttrIdx, BaseAttrL, 0),
            BtAttrVal = conf_pet_attr:to_bt_attr(BtAttrIdx, Level, GrowupRate, BaseAttrVal, Poten),
            {BtAttrIdx, BtAttrVal}
        end || {BtAttrIdx, BaseAttrIdx} <- AttrPairs
    ].

resort_pet_list([]) ->
    [];
resort_pet_list([Pet]) ->
    [{1, Pet}];
resort_pet_list(PetList) ->
    SortFun = fun(#{stat := Stat1}, #{stat := Stat2}) ->
        Stat1 =:= ?PET_STAT_FIGHT orelse Stat2 =/= ?PET_STAT_FIGHT
    end,
    SortedPets = lists:sort(SortFun, PetList),
    Indexes = lists:seq(1, length(SortedPets)),
    lists:zip(Indexes, SortedPets).

% 通知客户端背包珍兽信息改变
notify_pet_change(RoleSid, ?PET_BAG, ChangeType, Pets) ->
    CltPets = data_transfer:sc_clt_pets(Pets),
    MsgRecord = #notify_pet_change{type = ChangeType, pets = CltPets},
    {ok, Bin} = prot_msg:encode_msg(41008, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin);
% 通知客户端仓库珍兽信息改变
notify_pet_change(RoleSid, ?PET_DEPOT, _ChangeType, Pets) ->
    CltDpets = data_transfer:sc_clt_dpets(Pets),
    MsgRecord = #notify_dpet_change{dpets = CltDpets},
    {ok, Bin} = prot_msg:encode_msg(41011, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).

notify_del_pet(RoleSid, Type, Grids) ->
    DelPetMsg = #notify_del_pet{type = Type, grids = Grids},
    {ok, DelPetBin} = prot_msg:encode_msg(41009, DelPetMsg),
    lib_role_send:send_to_sid(RoleSid, DelPetBin).

take_pet(RoleSid, BagType, Grid, PetMap) ->
    PetNum = maps:size(PetMap),
    if
        Grid =/= PetNum ->
            #{attach_id := AttachId} = SwitchedPet = maps:get(PetNum, PetMap),
            (BagType =:= ?PET_BAG andalso AttachId > 0) andalso
                lib_role_pet_attach:update_pet_grid(AttachId, Grid),
            notify_pet_change(RoleSid, BagType, ?PET_CHANGE_UPDATE, [{Grid, SwitchedPet}]),
            maps:put(Grid, SwitchedPet, PetMap);
        true ->
            PetMap
    end.

store_pet(RoleSid, Type, ChangeType, Grid, Pet, PetMap) ->
    notify_pet_change(RoleSid, Type, ChangeType, [{Grid, Pet}]),
    maps:put(Grid, Pet, PetMap).

del_pet_db(RoleId, ?PET_BAG, Grid) ->
    do_del_pet_db(RoleId, Grid);
del_pet_db(RoleId, ?PET_DEPOT, Grid) ->
    do_del_pet_db(RoleId, Grid + ?PET_DEPOT_OFFSET).

do_del_pet_db(RoleId, GridWithOffset) ->
    Sql = io_lib:format(?SQL_DEL_ROLE_PETS, [RoleId, GridWithOffset]),
    db:execute(Sql).

% 检测与孵化npc的距离
check_npc_distance(#role_state{role_scene = RoleScene}) ->
    NpcList = conf_pet_common:get(hatch_npc),
    lib_scene_api:is_nearby_npc(RoleScene, NpcList).

% 孵化生成珍兽
do_gen_hatched_pet(RoleState, {PetCId, GrowupLvSum, GrowupLv, GrowupRate}) ->
    #role_state{sid = RoleSid} = RoleState,
    RoleData = get_role_data(),
    #{pet_bag := PetBag, lucky := Lucky} = RoleData,
    PetGrid = maps:size(PetBag) + 1,
    PetGrid =< ?PET_BAG_SIZE orelse throw({error, ?RC_PET_BAG_IS_FULL}),
    PetBaseConf = conf_pet:get(PetCId),
    AtkType = maps:get(atk_type, PetBaseConf),

    CarryLv = conf_pet:get_carry_lv(PetCId),
    LuckyLmts = conf_pet_common:get(lucky_limits),
    LuckyLmt = util:prop_get_value(CarryLv, LuckyLmts, 1000000),
    {LuckyN, PetStar} = calc_pet_lucky_star(Lucky, LuckyLmt, CarryLv, GrowupLvSum),
    Lucky =/= LuckyN andalso do_send_hatched_lucky(RoleSid, LuckyN),
    {InitAttrL, PetPoten} = gen_attr_poten(PetCId),
    PetTitle = gen_pet_title(PetCId, 0, 0, GrowupLv, PetPoten),

    PetNameC = conf_pet:get_name(PetCId),
    PetName = unicode:characters_to_binary(PetNameC),
    PetStar >= 7 andalso svr_rumor:publish(world, 21402, [RoleState#role_state.name, PetName]),
    PetT0 = ?pet#{
        cid => PetCId, title => PetTitle, name => PetName,
        star => PetStar, atk_type => AtkType,
        growup_lv => GrowupLv, growup_rate => GrowupRate,
        potential => PetPoten, init_attr => InitAttrL
    },
    PetT1 = check_digestion_skill(PetT0),
    #{bt_attr := BtAttrL} = PetT2 = calc_pet_fight(PetT1),
    Pet = PetT2#{hp => util:prop_get_value(?ATTR_HP_LIM, BtAttrL, 0)},

    ?TASK_EVENT(?ROLE_ID, 'upgrade_pet'),
    ?TASK_EVENT(?ROLE_ID, {'hatch_pet', PetStar}),
    PetBagN = store_pet(RoleSid, ?PET_BAG, ?PET_CHANGE_NEW, PetGrid, Pet, PetBag),
    RoleDataT = calc_max_fight_pet(RoleState, RoleData, Pet),
    {ok, RoleDataT#{pet_bag => PetBagN, lucky => LuckyN}}.

% 计算孵化生成珍兽星级
calc_pet_lucky_star(Lucky, LuckyLmt, _CarryLv, _GrowupLvSum) when LuckyLmt =< Lucky ->
    LuckyStarRatio = conf_pet_common:get(lucky_star_ratio),
    {Star, _} = util:rand_by_weight(LuckyStarRatio, 2),
    {0, Star};
calc_pet_lucky_star(Lucky, _LuckyLmt, CarryLv, GrowupLvSum) ->
    StarRatio = conf_pet_star_ratio:get(GrowupLvSum),
    {Star, _} = util:rand_by_weight(StarRatio, 2),
    LuckyStar = conf_pet_common:get(lucky_star),
    LuckyGrowupLv = conf_pet_common:get(lucky_growup_lv),
    if
        Star < LuckyStar andalso LuckyGrowupLv =< GrowupLvSum ->
            LuckyValues = conf_pet_common:get(lucky_values),
            AddLucky = util:prop_get_value(CarryLv, LuckyValues, 0),
            {Lucky + AddLucky, Star};
        Star < LuckyStar ->
            {Lucky, Star};
        true ->
            {0, Star}
    end.

% 学习技能检测逻辑
learn_skill_check(Pet, SkillGrid, SkillId) ->
    #{cid := PetCId, skills := Skills, savvy_lv := SavvyLv} = Pet,
    SkillConf = conf_pet_skill:get(SkillId),
    is_map(SkillConf) orelse throw({error, ?RC_PET_NO_SUCH_SKILL}),
    #{type := Type, skill_book := SkillBook} = SkillConf,
    ?CHECK_SKILL_TYPE(Type, SkillGrid) orelse throw({error, ?RC_PET_BAD_SKILL_TYPE}),
    % ?CHECK_SKILL_FIT(AtkType, FitType) orelse throw({error, ?RC_PET_SKILL_NOT_FIT}),
    CheckFun = fun({Grid, SkId, _SkLv}, TmpSkillNum) ->
        Grid =:= SkillGrid andalso throw({error, ?RC_PET_SKILL_GRID_NOT_EMPTY}),
        SkId =:= SkillId andalso throw({error, ?RC_PET_REPEAT_SKILL}),
        ?iif(Grid > 0, TmpSkillNum + 1, TmpSkillNum)
    end,
    Grids = conf_pet_savvy:get_skill_grids(SavvyLv),
    SkillNum = lists:foldl(CheckFun, 0, Skills),
    #{quality := PetQuality} = conf_pet:get(PetCId),
    (SkillGrid =:= 0) orelse (SkillNum < Grids) orelse          % 珍兽通用判断
    (SkillNum < 6 andalso PetQuality =:= ?PQ_GOD) orelse      % 神兽额外判断
    throw({error, ?RC_PET_NO_MORE_EMPTY_SKILL_GRID}),         % 不满足所有条件
    [{?AST_ITEM, [{SkillBook, 1}]}].

pet_inherit_check_common(MaterialPet, TargetPet) ->
    is_map(MaterialPet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    is_map(TargetPet) orelse throw({error, ?RC_PET_NO_SUCH_PET}),
    #{cid := MaterialCId, star := MaterialPStar, stat := MaterialPStat} = MaterialPet,
    MaterialPStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    MaterialPStar > 0 orelse throw({error, ?RC_PET_BABY_PET_CANNOT_INHERIT}),
    #{star := TargetPStar, stat := TargetPStat} = TargetPet,
    TargetPStat =:= ?PET_STAT_REST orelse throw({error, ?RC_PET_NOT_A_REST_PET}),
    TargetPStar > 0 orelse throw({error, ?RC_PET_BABY_PET_CANNOT_INHERIT}),
    #{quality := MaterialPQuality} = conf_pet:get(MaterialCId),
    MaterialPQuality =/= ?PQ_GOD orelse throw({error, ?RC_PET_GOD_PET_CANNOT_INHERIT}).

pet_inherit_check_with_type(MaterialPet, TargetPet, ?INHERIT_SKILL) ->
    MaterialSavvy = maps:get(savvy_lv, MaterialPet),
    MaterialSkillGrids = conf_pet_savvy:get_skill_grids(MaterialSavvy),
    TargetSavvy = maps:get(savvy_lv, TargetPet),
    TargetSkillGrids = conf_pet_savvy:get_skill_grids(TargetSavvy),
    MaterialSkillGrids =< TargetSkillGrids orelse throw({error, ?RC_PET_BAD_INHERIT_SKILL});
pet_inherit_check_with_type(MaterialPet, TargetPet, InheritType) when InheritType =< ?INHERIT_BOTH ->
    MaterialSavvy = maps:get(savvy_lv, MaterialPet),
    TargetSavvy = maps:get(savvy_lv, TargetPet),
    MaterialSavvy > TargetSavvy orelse throw({error, ?RC_PET_BAD_INHERIT_SAVVY});
pet_inherit_check_with_type(_MaterialPet, _TargetPet, _IllegalType) ->
    throw({error, ?RC_FORBIDDEN_OP}).

calc_inherit(MaterialPet, TargetPet, ?INHERIT_SAVVY) ->
    MaterialSavvy = maps:get(savvy_lv, MaterialPet),
    SavvyCost = conf_pet_inherit_savvy:get_cost(MaterialSavvy),
    #{cid := PetCId, star := Star, growup_lv := GrowupLv, potential := PetPoten} = TargetPet,
    PetTitle = gen_pet_title(PetCId, Star, MaterialSavvy, GrowupLv, PetPoten),
    TargetPetN = TargetPet#{title => PetTitle, savvy_lv => MaterialSavvy},
    {TargetPetN, SavvyCost};
calc_inherit(MaterialPet, TargetPet, ?INHERIT_SKILL) ->
    MaterialSkills = maps:get(skills, MaterialPet),
    SkillCost = lists:sum([
        conf_pet_inherit_savvy:get_cost(SkillLv)
        || {_, _, SkillLv} <- MaterialSkills
    ]),
    SkillCostNum = erlang:ceil(SkillCost),
    TargetPetN = TargetPet#{skills => MaterialSkills},
    {TargetPetN, SkillCostNum};
calc_inherit(MaterialPet, TargetPet, ?INHERIT_BOTH) ->
    {TargetPetT, SavvyCost} = calc_inherit(MaterialPet, TargetPet, ?INHERIT_SAVVY),
    {TargetPetN, SkillCost} = calc_inherit(MaterialPet, TargetPetT, ?INHERIT_SKILL),
    {TargetPetN, SavvyCost + SkillCost}.

% @doc 获取当前出战的珍兽
get_current_pet() ->
    case get_fight_pet() of
        #{level := Level, hp := Hp, skill_cd := SkillCd} when Level > 0 ->
            #{pet_bag := PetBag} = get_role_data(),
            case maps:get(1, PetBag, undefined) of
                #{stat := ?PET_STAT_FIGHT} = Pet ->
                    PetHp = max(Hp, 100),
                    Pet#{hp => PetHp, skill_cd => SkillCd};
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end.

get_fighting_pet() ->
    case get_fight_pet() of
        #{level := Level, hp := Hp} = FightPet when Level > 0, Hp > 0 ->
            #{pet_bag := PetBag} = get_role_data(),
            case maps:get(1, PetBag, undefined) of
                #{stat := ?PET_STAT_FIGHT} ->
                    FightPet;
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end.

%% 更新当前出战珍兽数据(加速)
get_fight_pet() ->
    get({?MODULE, fight_pet}).

set_fight_pet(FightPet) ->
    put({?MODULE, fight_pet}, FightPet),
    FightPet.

% 珍兽数据回存
restore_fight_pet(Pet) ->
    case get_fight_pet() of
        #{level := Level, exp := Exp, hp := Hp, skill_cd := SkillCd} when Level > 0 ->
            Pet#{stat => ?PET_STAT_REST, level => Level, exp => Exp, hp => Hp, skill_cd => SkillCd};
        _ ->
            Pet#{stat => ?PET_STAT_REST}
    end.

% 珍兽数据同步
sync_fight_pet(RoleId, FightPet) ->
    #{pet_bag := PetBag} = RoleData = get_role_data(),
    case maps:get(1, PetBag, undefined) of
        #{stat := ?PET_STAT_FIGHT} = FirstPet ->
            #{exp := Exp, hp := Hp} = FightPet,
            FirstPetN = calc_pet_fight(FirstPet#{hp => Hp, exp => Exp}),
            PetBagN = store_pet(RoleId, ?PET_BAG, ?PET_CHANGE_UPDATE, 1, FirstPetN, PetBag),
            set_role_data(RoleData#{pet_bag => PetBagN});
        _ ->
            skip
    end.

% 检测领悟技能
check_digestion_skill(Pet) ->
    #{cid := PetCId, level := Level} = Pet,
    case conf_pet_skill_digestion:get(PetCId, Level) of
        undefined ->
            Pet;
        SkillId ->
            #{savvy_lv := SavvyLv, skills := Skills} = Pet,
            SkillGrids = conf_pet_savvy:get_skill_grids(SavvyLv),
            case length(Skills) < SkillGrids andalso (not lists:keymember(SkillId, 2, Skills)) of
                false ->
                    Pet;
                true ->
                    SkillsN = resort_skills([{SkillGrids, SkillId, 1} | Skills]),
                    Pet#{skills => SkillsN}
            end
    end.

resort_skills(Skills) ->
    ParFun = fun({G, _, _}) -> G =:= 0 end,
    {ManualSkill, AutoSkills} = lists:partition(ParFun, Skills),
    SortedAutoSkills = do_resort_skills(AutoSkills),
    ManualSkill ++ SortedAutoSkills.

do_resort_skills([]) ->
    [];
do_resort_skills([{_, Sk, Lv}]) ->
    [{1, Sk, Lv}];
do_resort_skills(Skills) ->
    SortFun = fun({G1, _Sk1, _Lv1}, {G2, _Sk2, _Lv2}) -> G1 < G2 end,
    SortedSkills = lists:sort(SortFun, Skills),
    Indexes = lists:seq(1, length(SortedSkills)),
    ZipFun = fun(Idx, {_, SkillId, SkillLv}) -> {Idx, SkillId, SkillLv} end,
    lists:zipwith(ZipFun, Indexes, SortedSkills).

calc_pet_level(#{level := Level, exp := Exp} = Pet, MaxLevel, AddExp, IsSync) when Level < MaxLevel andalso AddExp > 0 ->
    TotalExp = Exp + AddExp,
    UpgradeExp = conf_pet_level:upgrade_exp(Level),
    case TotalExp - UpgradeExp of
        RestExp when RestExp >= 0 ->
            calc_pet_level(Pet#{level => Level + 1, exp => 0}, MaxLevel, RestExp, true);
        _ ->
            % 2.5% 同步一次
            IsSyncN = IsSync orelse (Exp * 40 div UpgradeExp) < (TotalExp * 40 div UpgradeExp),
            {Level, TotalExp, IsSyncN}
    end;
calc_pet_level(#{level := Level}, _MaxLevel, _Exp, IsSync) ->
    {Level, 0, IsSync}.

notify_pet_level_exp(RoleId, Level, Exp, AddExp, DlAddExp) ->
    Msg = #notify_fight_pet_level_exp{
        level = Level, exp = Exp, add_exp = AddExp, dl_exp = DlAddExp
    },
    {ok, Bin} = prot_msg:encode_msg(41074, Msg),
    lib_role_send:send_to_role(RoleId, Bin).

% 二代珍兽
gen_pet_title(PetCId, PetStar, SavvyLv, GrowupLv, Potential) when PetStar > 0 ->
    STitleConf = conf_pet_common:get(savvy_title),
    [{SavvyColor, SavvyTitle}] = [{C, T} || {L, R, C, T} <- STitleConf, SavvyLv >= L, SavvyLv =< R],
    GTitleConf = conf_pet_common:get(growup_title),
    [{GrowupColor, GrowupTitle}] = [{C, T} || {G, C, T} <- GTitleConf, GrowupLv =:= G],

    PotenConf = conf_pet:get_attr_potential(PetCId),
    SumMaxPotenFun = fun({_, Ratio}, Acc) ->
        lists:max([R || {_L, R, _W} <- Ratio]) + Acc
    end,
    Poten = lists:sum(tuple_to_list(Potential)),
    MaxPoten = lists:foldl(SumMaxPotenFun, 0, PotenConf),
    PPercent = Poten * 100 / MaxPoten,
    PTitleConf = conf_pet_common:get(potential_title),
    [{PotenColor, PotenTitle}] = [{C, T} || {L, R, C, T} <- PTitleConf, PPercent > L, PPercent =< R],
    TitleStr = SavvyTitle ++ GrowupTitle ++ PotenTitle,
    Color = lists:min([SavvyColor, GrowupColor, PotenColor]),
    {Color, list_to_binary(unicode:characters_to_list(TitleStr))};
% 珍兽宝宝
gen_pet_title(_PetCId, _PetStar, _SavvyLv, _GrowupLv, _Potential) ->
    {0, <<"">>}.

do_send_hatched_lucky(RoleSid, Lucky) ->
    MsgRecord = #get_hatched_lucky_resp{lucky = Lucky},
    {ok, Bin} = prot_msg:encode_msg(41034, MsgRecord),
    lib_role_send:send_to_sid(RoleSid, Bin).

% 删除背包的珍兽
do_del_pet(RoleId, RoleSid, RoleData, Grid) ->
    #{pet_bag := PetBag} = RoleData,
    PetNum = maps:size(PetBag),
    PetBagT = take_pet(RoleSid, ?PET_BAG, Grid, PetBag),
    del_pet_db(RoleId, ?PET_BAG, PetNum),
    PetBagN = maps:remove(PetNum, PetBagT),
    set_role_data(RoleData#{pet_bag => PetBagN}),
    notify_del_pet(RoleSid, ?PET_BAG, [PetNum]).

calc_max_fight_pet(#role_state{id = RoleID, career = Career}, RoleData, Pet) ->
    #{max_pet_fight := MaxPetFight, max_pet_name := OldName} = RoleData,
    #{fight := Fight, name := Name} = Pet,
    case Fight > MaxPetFight orelse (MaxPetFight =:= Fight andalso OldName =/= Name) of
        true ->
            lib_role_rank:update_pet_rank(RoleID, Career, Fight, Name),
            RoleData#{max_pet_fight => Fight, max_pet_name => Name};
        _ ->
            RoleData
    end.

is_pets_enough2([], _PetBag) ->
    true;
is_pets_enough2([Grid | T], PetBag) ->
    case maps:get(Grid, PetBag, undefined) of
        #{stat := ?PET_STAT_REST, attach_id := 0} ->
            is_pets_enough2(T, PetBag);
        _ ->
            false
    end.

do_add_pets(_Grid, _Size, [], PetBag, Acc) ->
    {PetBag, Acc};
do_add_pets(Grid, Size, _, _PetBag, _Acc) when Grid >= Size ->
    erlang:throw({error, ?RC_PET_BAG_IS_FULL});
do_add_pets(Grid, Size, [PetBase | RestPets], PetBag, Acc) ->
    PetGrid = Grid + 1,
    Pet = maps:merge(?pet, PetBase),
    PetBagN = maps:put(PetGrid, Pet, PetBag),
    do_add_pets(PetGrid, Size, RestPets, PetBagN, [{PetGrid, Pet} | Acc]).


do_del_pets([], PetBag) ->
    PetBag;
do_del_pets([Grid | RestGrids], PetBag) ->
    do_del_pets(RestGrids, maps:remove(Grid, PetBag)).

check_god_pet_repeat(PetBag, PetDepot, PetCId) ->
    ChkFun = fun(_Grid, Pet, IsOwn) ->
        IsOwn orelse maps:get(cid, Pet) =:= PetCId
    end,
    InBag = maps:fold(ChkFun, false, PetBag),
    IsOwned = InBag orelse maps:fold(ChkFun, false, PetDepot),
    IsOwned andalso throw({error, ?RC_PET_ALREADY_ACTIVE_THIS_GOD_PET}).
