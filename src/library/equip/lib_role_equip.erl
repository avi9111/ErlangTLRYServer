%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     装备 [特殊装备参照 龙纹]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_equip).
-author("Ryuu").

-include("role.hrl").
-include("shop.hrl").
-include("equip.hrl").
-include("goods.hrl").
-include("skill.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_202.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    get_attr/1,
    add_equip/3,
    add_equip/4,
    get_fight/1,
    send_info/1,
    init_equip/3,
    get_skills/1,
    handle_info/2,
    get_stren_lv/1,
    get_wear_num/1,
    get_role_equip/1,
    get_lv_stone_num/2,
    get_lv_stren_num/2,
    get_suit_stone_lv/1,
    get_total_stone_lv/1,
    get_total_stren_lv/1,
    convert_equips_info/1
]).

handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _) ->
    ignore.

do(20201, PS, _) ->
    send_info(PS);
do(20203, PS, #cs_equip_wear{cell = CPos}) ->
    wear(PS, CPos);
do(20205, PS, #cs_equip_take_off{pos = EPos}) ->
    take_off(PS, EPos);
do(20207, PS, #cs_equip_stren{pos = Pos}) ->
    stren(PS, Pos);
do(20209, PS, #cs_equip_one_key_stren{}) ->
    stren_equips(PS);
do(20211, PS, #cs_equip_inlay_stone{pos = SPos, id = ID}) ->
    inlay_stone(PS, SPos, ID);
do(20213, PS, #cs_equip_adv_stone{pos = SPos}) ->
    adv_stone(PS, SPos);
do(20215, PS, #cs_equip_inlay_paris{pos = Pos}) ->
    inlay_paris(PS, Pos);
do(20217, PS, #cs_equip_stren_paris{pos = Pos}) ->
    stren_paris(PS, Pos);
do(20219, PS, #cs_equip_strip_paris{pos = Pos}) ->
    strip_paris(PS, Pos);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取装备列表
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    Rec = #sc_equip_info{
        equips = convert_equips_info(Equips)
    },
    {ok, Bin} = prot_msg:encode_msg(20202, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_equips_info(Equips) ->
    convert_equips_info(Equips, []).

convert_equips_info([], Acc) ->
    Acc;
convert_equips_info([Equip | T], Acc) ->
    EquipInfo = convert_equip_info(Equip),
    convert_equips_info(T, [EquipInfo | Acc]).

convert_equip_info(Equip) ->
    #{pos := Pos, id := ID, stren := Stren, attr := Attr, paris := Paris,
        stones := Stones, extra := Extra} = Equip,
    #equip_info{
        pos = Pos, id = ID, stren = Stren, stones = Stones, attr = Attr,
        paris = Paris, extra = Extra
    }.

%% @doc 穿装备
wear(PS, CPos) ->
    case catch check_wear(PS, CPos) of
        {ok, RoleID, RoleEquip, Equip, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_EQUIP_WEAR),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_EQUIP_TAKE_OFF),
            update_role_equip(RoleID, RoleEquip),
            wear_resp(PS, Equip),
            refresh_attr(PS2, RoleEquip);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_wear(PS, CPos) ->
    #role_state{id = RoleID, level = RoleLv, career = RCareer} = PS,
    Item = lib_role_goods:get_cell_item(RoleID, ?BAG_ID_ITEM, CPos),
    Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := GID} = Item,
    ItemConf = conf_goods:get(GID),
    ItemConf =/= undefined orelse erlang:throw({error, ?RC_GOODS_CONF_NOT_FOUND}),
    #{pos := EPos, level := WearLv, career := NCareer} = ItemConf,
    RoleLv >= WearLv orelse erlang:throw({error, ?RC_EQUIP_WEAR_LV_LIMIT}),
    NCareer =:= 0 orelse RCareer =:= NCareer orelse erlang:throw({error, ?RC_EQUIP_CAREER_LIMIT}),
    check_equip_pos(EPos),
    {{RoleEquip, Equips, Equip}, _} = check_get_equip(RoleID, EPos),
    {NewEquip, NewItems} = switch_equip(Equip, Item),
    Costs = [{?AST_ITEM_C, [{CPos, 1}]}],
    lib_role_assets:check_items_enough(PS, Costs),
    Rewards = [{?AST_ITEM, NewItems}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewEquips = map:keystore(EPos, pos, Equips, NewEquip),
    NewRoleEquip = RoleEquip#{equips => NewEquips},
    {ok, RoleID, NewRoleEquip, NewEquip, Costs, Rewards}.

wear_resp(PS, Equip) ->
    #role_state{id = RoleID} = PS,
    Rec = #sc_equip_wear{equip = convert_equip_info(Equip)},
    {ok, Bin} = prot_msg:encode_msg(20204, Rec),
    lib_role_send:send_to_role(PS, Bin),
    ?EVENT(RoleID, 'wear_equip'),
    update_equip_rank(RoleID, PS#role_state.career, Equip).

%% @doc 脱装备
take_off(PS, EPos) ->
    case catch check_take_off(PS, EPos) of
        {ok, RoleID, RoleEquip, Equip, Rewards} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_EQUIP_TAKE_OFF),
            update_role_equip(RoleID, RoleEquip),
            Rec = #sc_equip_take_off{equip = convert_equip_info(Equip)},
            {ok, Bin} = prot_msg:encode_msg(20206, Rec),
            lib_role_send:send_to_role(PS, Bin),
            update_equip_rank(RoleID, PS#role_state.career, Equip),
            refresh_attr(remove_paris_skill(PS1), RoleEquip);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_take_off(PS, EPos) ->
    #role_state{id = RoleID} = PS,
    lists:member(EPos, ?EQUIP_POS_NORMAL) orelse erlang:throw({error, ?RC_EQUIP_CANNOT_TAKE_OFF}),
    {{RoleEquip, Equips, Equip}, _} = check_get_equip(RoleID, EPos),
    #{id := Gid} = Equip,
    Gid > 0 orelse erlang:throw({error, ?RC_EQUIP_NOT_WEAR_EQUIP}),
    {NewEquip, Items} = switch_equip(Equip, 0),
    Rewards = [{?AST_ITEM, Items}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewEquips = map:keystore(EPos, pos, Equips, NewEquip),
    NewRoleEquip = RoleEquip#{equips => NewEquips},
    {ok, RoleID, NewRoleEquip, NewEquip, Rewards}.

%% -----------------------------------------------------------------------------

%% @doc 铸造
stren(PS, EPos) ->
    case catch check_stren(PS, EPos) of
        {ok, RoleID, RoleEquip, QuenchLv, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_EQUIP_STREN),
            stren_event(RoleID, 1),
            notify_stren_resp(PS1, EPos, QuenchLv),
            case EPos of
                ?EQUIP_POS_ARTIFACT ->
                    lib_role_artifact:refresh_artifact_attr(PS1, RoleEquip);
                ?EQUIP_POS_ANQI ->
                    lib_role_anqi:refresh_anqi_attr(PS1, RoleEquip);
                ?EQUIP_POS_WARRIOR_SOUL ->
                    lib_role_warrior_soul:refresh_warrior_soul_attr(PS1, RoleEquip);
                _ ->
                    update_role_equip(RoleID, RoleEquip),
                    refresh_attr(PS1, RoleEquip)
            end;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_stren(PS, EPos) ->
    check_stren(PS, EPos, []).

check_stren(PS, EPos, CostsSrc) ->
    #role_state{id = RoleID, level = RoleLv} = PS,
    {{RoleEquip, Equips, Equip}, RoleArtifact} = check_get_equip(RoleID, EPos),
    case RoleArtifact of
        #role_artifact{stren = S_Lv} = _ -> StrenLv = S_Lv;
        #role_anqi{stren = S_Lv} = _ -> StrenLv = S_Lv;
        #role_warrior_soul{stren = S_Lv} = _ -> StrenLv = S_Lv;
        _ ->
            check_equip_opened(RoleID, Equip),
            #{stren := StrenLv} = Equip
    end,
    StrenLv < RoleLv orelse erlang:throw({error, ?RC_EQUIP_STREN_ROLE_LV_LIMIT}),
    NewStrenLv = StrenLv + 1,
    ConfQuench = conf_equip_stren:get({EPos, StrenLv}),
    ConfQuenchNext = conf_equip_stren:get({EPos, NewStrenLv}),
    ConfQuenchNext =/= undefined orelse erlang:throw({error, ?RC_EQUIP_MAX_STREN_LV}),
    #{cost := Items} = ConfQuench,
    Costs = [{?AST_ITEM, Items}],
    CostsNew = lib_role_assets:merge_cost_items(Costs ++ CostsSrc),
    lib_role_assets:check_items_enough(PS, CostsNew),
    NewRoleEquip = case RoleArtifact of
        #role_artifact{} = _ -> RoleArtifact#role_artifact{stren = NewStrenLv};
        #role_anqi{} = _ -> RoleArtifact#role_anqi{stren = NewStrenLv};
        #role_warrior_soul{} = _ -> RoleArtifact#role_warrior_soul{stren = NewStrenLv};
        _ ->
            NewEquip = Equip#{stren => NewStrenLv},
            NewEquips = map:keystore(EPos, pos, Equips, NewEquip),
            RoleEquip#{equips => NewEquips}
    end,
    {ok, RoleID, NewRoleEquip, NewStrenLv, CostsNew}.

notify_stren_resp(PS, EPos, Level) ->
    Rec = #sc_equip_stren{pos = EPos, lv = Level},
    {ok, Bin} = prot_msg:encode_msg(20208, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc 一键强化
stren_equips(PS) ->
    #role_state{id = RoleID} = PS,
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    PosList = stren_poses(Equips, RoleID, []),
    case stren_equips(PosList, PS, Equips, [], [], 0, 0) of
        {NewEquips, Costs, ChangeList, Times, Code} when Costs =/= [] ->
            Code =/= 0 andalso ?ERROR_TOC(PS, Code),
            NewRoleEquip = RoleEquip#{equips => NewEquips},
            update_role_equip(RoleID, NewRoleEquip),
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_EQUIP_STREN),
            one_key_stren_resp(PS, ChangeList),
            stren_event(RoleID, Times),
            refresh_attr(PS1, NewRoleEquip);
        {_, _, _, _, Code} ->
            Code =/= 0 andalso ?ERROR_TOC(PS, Code),
            PS
    end.

stren_poses([], _RoleID, Acc) ->
    lists:sort(Acc);
stren_poses([#{pos := Pos} = Equip | T], RoleID, Acc) ->
    case equip_opened(RoleID, Equip) of
        true -> stren_poses(T, RoleID, [Pos | Acc]);
        _ -> stren_poses(T, RoleID, Acc)
    end.

stren_equips([], _PS, EquipAcc, Costs, ChangeAcc, Times, ErrAcc) ->
    {EquipAcc, Costs, ChangeAcc, Times, ErrAcc};
stren_equips(Poses, PS, EquipAcc, Costs, ChangeAcc, Times, ErrAcc) ->
    {Pos, Equip} = filter_stren_equip(Poses, PS, EquipAcc, undefined, []),
    if
        Pos =:= ?EQUIP_POS_ARTIFACT ->
            case catch check_stren(PS, ?EQUIP_POS_ARTIFACT, Costs) of
                {ok, _, RoleArtifact, QuenchLv0, NewCosts} ->
                    NewChangeAcc = util:prop_store(?EQUIP_POS_ARTIFACT, QuenchLv0, ChangeAcc),
                    lib_role_artifact:refresh_artifact_attr(PS, RoleArtifact, true),
                    stren_equips(Poses, PS, EquipAcc, NewCosts, NewChangeAcc, Times + 1, ErrAcc);
                {error, Code} ->
                    NewErrAcc = ?iif(ErrAcc =:= 0 andalso Code =/= ?RC_ARTIFACT_NOT_OPEN, Code, ErrAcc),
                    stren_equips(lists:delete(Pos, Poses), PS, EquipAcc, Costs, ChangeAcc, Times, NewErrAcc)
            end;
        Pos =:= ?EQUIP_POS_ANQI ->
            case catch check_stren(PS, ?EQUIP_POS_ANQI, Costs) of
                {ok, _, RoleAnqi, QuenchLv, NewCosts} ->
                    NewChangeAcc = util:prop_store(?EQUIP_POS_ANQI, QuenchLv, ChangeAcc),
                    lib_role_anqi:refresh_anqi_attr(PS, RoleAnqi, true),
                    stren_equips(Poses, PS, EquipAcc, NewCosts, NewChangeAcc, Times + 1, ErrAcc);
                {error, Code} ->
                    NewErrAcc = ?iif(ErrAcc =:= 0 andalso Code =/= ?RC_ANQI_NOT_UNLOCK, Code, ErrAcc),
                    stren_equips(lists:delete(Pos, Poses), PS, EquipAcc, Costs, ChangeAcc, Times, NewErrAcc)
            end;
        Pos =:= ?EQUIP_POS_WARRIOR_SOUL ->
            case catch check_stren(PS, ?EQUIP_POS_WARRIOR_SOUL, Costs) of
                {ok, _, RoleWarriorSoul, QuenchLv, NewCosts} ->
                    NewChangeAcc = util:prop_store(?EQUIP_POS_WARRIOR_SOUL, QuenchLv, ChangeAcc),
                    lib_role_warrior_soul:refresh_warrior_soul_attr(PS, RoleWarriorSoul, true),
                    stren_equips(Poses, PS, EquipAcc, NewCosts, NewChangeAcc, Times + 1, ErrAcc);
                {error, Code} ->
                    NewErrAcc = ?iif(ErrAcc =:= 0 andalso Code =/= ?RC_WARRIOR_SOUL_NOT_OPEN, Code, ErrAcc),
                    stren_equips(lists:delete(Pos, Poses), PS, EquipAcc, Costs, ChangeAcc, Times, NewErrAcc)
            end;
        true ->
            is_map(Equip) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
            #{pos := EPos} = Equip,
            case catch stren_equip(Equip, PS, Costs) of
                {ok, NewEquip, NewCosts, NewLv} ->
                    NewEquipAcc = map:keystore(EPos, pos, EquipAcc, NewEquip),
                    NewChangeAcc = util:prop_store(EPos, NewLv, ChangeAcc),
                    stren_equips(Poses, PS, NewEquipAcc, NewCosts, NewChangeAcc, Times + 1, ErrAcc);
                {error, Code} ->
                    NewErrAcc = ?iif(ErrAcc =:= 0, Code, ErrAcc),
                    stren_equips(lists:delete(EPos, Poses), PS, EquipAcc, Costs, ChangeAcc, Times, NewErrAcc)
            end
    end.

filter_stren_equip([], _PS, _Equips, _Min, Acc) ->
    Acc;
filter_stren_equip([Pos | T], #role_state{id = RoleID} = PS, Equips, Min, Acc) ->
    RoleData = case Pos of
        ?EQUIP_POS_ARTIFACT ->
            RoleArtifact = lib_role_artifact:get_role_data(RoleID),
            RoleArtifact;
        ?EQUIP_POS_ANQI ->
            RoleAnqi = lib_role_anqi:get_role_data(RoleID),
            RoleAnqi;
        ?EQUIP_POS_WARRIOR_SOUL ->
            RoleWarriorSoul = lib_role_warrior_soul:get_role_data(RoleID),
            RoleWarriorSoul;
        _ ->
            Equip = map:keyfind(Pos, pos, Equips, ?equip#{pos => Pos}),
            Equip
    end,
    StrenLv = case RoleData of
        #{stren := S_Lv} -> S_Lv;
        #role_artifact{stren = S_Lv} = _ -> S_Lv;
        #role_anqi{stren = S_Lv} = _ -> S_Lv;
        #role_warrior_soul{stren = S_Lv} = _ -> S_Lv
    end,
    if
        Min =:= undefined orelse StrenLv < Min ->
            filter_stren_equip(T, PS, Equips, StrenLv, {Pos, RoleData});
        true ->
            filter_stren_equip(T, PS, Equips, Min, Acc)
    end.

stren_equip(Equip, PS, CostAcc) ->
    #role_state{level = RoleLv} = PS,
    #{pos := EPos, stren := StrenLv} = Equip,
    StrenLv < RoleLv orelse erlang:throw({error, ?RC_EQUIP_STREN_ROLE_LV_LIMIT}),
    Conf = conf_equip_stren:get({EPos, StrenLv}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_EQUIP_NO_STREN_CONFIG}),
    NextLv = StrenLv + 1,
    ConfNext = conf_equip_stren:get({EPos, NextLv}),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_EQUIP_MAX_STREN_LV}),
    #{cost := Items} = Conf,
    Costs = [{?AST_ITEM, Items}],
    NewCosts = lib_role_assets:merge_cost_items(Costs ++ CostAcc),
    lib_role_assets:check_items_enough(PS, NewCosts),
    NewEquip = Equip#{stren => NextLv},
    {ok, NewEquip, NewCosts, NextLv}.

one_key_stren_resp(PS, ChangeList) ->
    Rec = #sc_equip_one_key_stren{changes = ChangeList},
    {ok, Bin} = prot_msg:encode_msg(20210, Rec),
    lib_role_send:send_to_role(PS, Bin).

stren_event(RoleID, _Times) ->
    ?TASK_EVENT(RoleID, stren_equip).

%% -----------------------------------------------------------------------------

%% @doc 宝石镶嵌
inlay_stone(PS, SPos, ID) ->
    case catch check_inlay_stone(PS, SPos, ID) of
        {ok, RoleID, RoleEquip, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_STONE_INLAY),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_STONE_INLAY),
            ?TASK_EVENT(RoleID, inlay_stone),
            Rec = #sc_equip_inlay_stone{id = ID, pos = SPos},
            {ok, Bin} = prot_msg:encode_msg(20212, Rec),
            lib_role_send:send_to_role(PS, Bin),
            if
                is_record(RoleEquip, role_artifact) ->
                    lib_role_artifact:refresh_artifact_attr(PS2, RoleEquip);
                is_record(RoleEquip, role_anqi) ->
                    lib_role_anqi:refresh_anqi_attr(PS2, RoleEquip);
                is_record(RoleEquip, role_warrior_soul) ->
                    lib_role_warrior_soul:refresh_warrior_soul_attr(PS2, RoleEquip);
                true ->
                    update_role_equip(RoleID, RoleEquip),
                    refresh_attr(PS2, RoleEquip)
            end;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_inlay_stone(PS, SPos, ID) ->
    Conf = conf_equip_stone_pos:get(SPos),
    Conf =/= undefined orelse erlang:throw({error, ?RC_STONE_INVALID_POS}),
    #{pos := EPos, inlay_type := CInlayTypes} = Conf,
    #role_state{id = RoleID, career = Career} = PS,
    {{RoleEquip, Equips, Equip}, RoleArtifact} = check_get_equip(RoleID, EPos),
    Stones = case RoleArtifact of
        #role_artifact{stones = Stones_T} = _ -> Stones_T;
        #role_anqi{stones = Stones_T} = _ -> Stones_T;
        #role_warrior_soul{stones = Stones_T} = _ -> Stones_T;
        _ ->
            check_equip_opened(RoleID, Equip),
            #{stones := Stones_T} = Equip, Stones_T
    end,
    OldStone = proplists:get_value(SPos, Stones, 0),
    case OldStone > 0 of
        true ->
            Rewards = [{?AST_ITEM, [?goods_basic#{id => OldStone, num => 1, bind => ?GOODS_BIND}]}],
            lib_role_assets:check_can_add_items(PS, Rewards);
        _ ->
            Rewards = []
    end,
    {NewStones, Costs} = case ID > 0 of
        true -> %% 镶嵌
            ConfStone = conf_equip_stone:get(ID),
            ConfStone =/= undefined orelse erlang:throw({error, ?RC_STONE_NOT_STONE}),
            #{type := SType} = ConfStone,
            InlayTypes = util:prop_get_value(Career, CInlayTypes, []),
            lists:member(SType, InlayTypes) orelse erlang:throw({error, ?RC_STONE_NOT_SUPPORT_TYPE}),
            Costs1 = [{?AST_ITEM, [{ID, 1}]}],
            lib_role_assets:check_items_enough(PS, Costs1),
            NewStones1 = util:prop_store(SPos, ID, Stones),
            {NewStones1, Costs1};
        _ -> %% 摘下
            OldStone > 0 orelse erlang:throw({error, ?RC_STONE_NO_INLAY_STONE}),
            Costs1 = [],
            NewStones1 = util:prop_delete(SPos, Stones),
            {NewStones1, Costs1}
    end,
    case RoleArtifact of
        #role_artifact{} = _ ->
            NewRoleEquip = RoleArtifact#role_artifact{stones = NewStones};
        #role_anqi{} = _ ->
            NewRoleEquip = RoleArtifact#role_anqi{stones = NewStones};
        #role_warrior_soul{} = _ ->
            NewRoleEquip = RoleArtifact#role_warrior_soul{stones = NewStones};
        _ ->
            NewEquip = Equip#{stones => NewStones},
            NewRoleEquip = set_equip(RoleEquip, Equips, EPos, NewEquip)
    end,
    {ok, RoleID, NewRoleEquip, Costs, Rewards}.

%% @doc 提升宝石
adv_stone(PS, SPos) ->
    case catch check_adv_stone(PS, SPos) of
        {ok, RoleID, RoleEquip, Costs, StoneID, NextLv} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_STONE_ADV),
            ?TASK_EVENT(RoleID, inlay_stone),
            Rec = #sc_equip_adv_stone{pos = SPos, id = StoneID},
            {ok, Bin} = prot_msg:encode_msg(20214, Rec),
            lib_role_send:send_to_role(PS, Bin),
            ?TASK_EVENT(RoleID, {adv_stone, NextLv}),
            NextLv >= 4 andalso begin
                StoneRumor = config:get_sys_config(equip_stone_adv_rumor),
                StoneName = lib_goods_util:get_name(StoneID),
                svr_rumor:publish(world, StoneRumor, [PS#role_state.name, StoneName, ?STR(NextLv)])
            end,
            if
                is_record(RoleEquip, role_artifact) ->
                    lib_role_artifact:refresh_artifact_attr(PS1, RoleEquip);
                is_record(RoleEquip, role_anqi) ->
                    lib_role_anqi:refresh_anqi_attr(PS1, RoleEquip);
                is_record(RoleEquip, role_warrior_soul) ->
                    lib_role_warrior_soul:refresh_warrior_soul_attr(PS1, RoleEquip);
                true ->
                    update_role_equip(RoleID, RoleEquip),
                    refresh_attr(PS1, RoleEquip)
            end;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_adv_stone(PS, SPos) ->
    Conf = conf_equip_stone_pos:get(SPos),
    Conf =/= undefined orelse erlang:throw({error, ?RC_STONE_INVALID_POS}),
    #{pos := EPos} = Conf,
    #role_state{id = RoleID} = PS,
    {{RoleEquip, Equips, Equip}, RoleArtifact} = check_get_equip(RoleID, EPos),
    case RoleArtifact of
        #role_artifact{stones = Stones} = _ -> Stones;
        #role_anqi{stones = Stones} = _ -> Stones;
        #role_warrior_soul{stones = Stones} = _ -> Stones;
        _ ->
            check_equip_opened(RoleID, Equip),
            #{stones := Stones} = Equip
    end,
    StoneID = proplists:get_value(SPos, Stones, 0),
    StoneID > 0 orelse erlang:throw({error, ?RC_STONE_NO_INLAY_STONE}),
    StoneConf = conf_equip_stone:get(StoneID),
    #{next := NextID, type := Type, cost_num := CostNum, rune_num := RuneNum} = StoneConf,
    NextID > 0 orelse erlang:throw({error, ?RC_STONE_CAN_NOT_ADV}),
    StoneConfNext = conf_equip_stone:get(NextID),
    StoneConfNext =/= undefined orelse erlang:throw({error, ?RC_STONE_CAN_NOT_ADV}),
    #{level := NextLv} = StoneConfNext,
    Statics = lib_role_goods:bag_statics(RoleID, ?BAG_ID_ITEM),
    RuneID = config:get_sys_config(equip_stone_adv_rune),
    Price = lib_role_shop:check_get_price(?SHOP_ID_GOLD, StoneID),
    TPrice = erlang:floor((CostNum - 1) * Price),
    CItems = lists:reverse([ID || ID <- conf_equip_stone:get_by_type(Type), ID < NextID]),
    {NeedGold, StoneList} = adv_stone_costs(CItems, TPrice, Statics, []),
    RuneList = ?iif(RuneNum > 0, [{RuneID, RuneNum}], []),
    Costs = [{?AST_ITEM, RuneList ++ StoneList}, {?AST_BGOLD_F, NeedGold}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewStones = util:prop_store(SPos, NextID, Stones),
    case RoleArtifact of
        #role_artifact{} = _ ->
            NewRoleEquip = RoleArtifact#role_artifact{stones = NewStones};
        #role_anqi{} = _ ->
            NewRoleEquip = RoleArtifact#role_anqi{stones = NewStones};
        #role_warrior_soul{} = _ ->
            NewRoleEquip = RoleArtifact#role_warrior_soul{stones = NewStones};
        _ ->
            NewEquip = Equip#{stones => NewStones},
            NewRoleEquip = set_equip(RoleEquip, Equips, EPos, NewEquip)
    end,
    {ok, RoleID, NewRoleEquip, Costs, NextID, NextLv}.

adv_stone_costs([], TPrice, _Statics, ItemAcc) ->
    {TPrice, ItemAcc};
adv_stone_costs([ItemID | T], TPrice, Statics, ItemAcc) ->
    Price = lib_role_shop:check_get_price(?SHOP_ID_GOLD, ItemID),
    NNum = erlang:ceil(TPrice / Price),
    case util:dict_find(ItemID, Statics) of
        #{num := Num} when Num > NNum ->
            {0, [{ItemID, NNum} | ItemAcc]};
        #{num := Num} ->
            adv_stone_costs(T, TPrice - Price * Num, Statics, [{ItemID, Num} | ItemAcc]);
        _ ->
            adv_stone_costs(T, TPrice, Statics, ItemAcc)
    end.

%% @doc 重楼镶嵌
inlay_paris(PS, CPos) ->
    case catch check_stren_paris(PS, CPos) of
        {ok, RoleID, RoleEquip, Costs, Equip} ->
            update_role_equip(RoleID, RoleEquip),
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_PARIS_INLAY),
            Rec = #sc_equip_inlay_paris{equip = convert_equip_info(Equip)},
            {ok, Bin} = prot_msg:encode_msg(20216, Rec),
            lib_role_send:send_to_role(PS, Bin),
            send_paris_rumor(PS, Equip),
            refresh_attr(PS1, RoleEquip);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

%% @doc 重楼强化
stren_paris(PS, EPos) ->
    case catch check_stren_paris(PS, EPos) of
        {ok, RoleID, RoleEquip, Costs, Equip} ->
            update_role_equip(RoleID, RoleEquip),
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_PARIS_STREN),
            Rec = #sc_equip_stren_paris{equip = convert_equip_info(Equip)},
            {ok, Bin} = prot_msg:encode_msg(20218, Rec),
            lib_role_send:send_to_role(PS, Bin),
            send_paris_rumor(PS, Equip),
            refresh_attr(PS1, RoleEquip);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

send_paris_rumor(PS, Equip) ->
    #{id := Gid, pos := Pos} = Equip,
    Pos =:= ?EQUIP_POS_SHOULDER andalso begin
        ParisRumor = config:get_sys_config(equip_paris_shoulder_stren_rumor),
        svr_rumor:publish(world, ParisRumor, [PS#role_state.name, lib_goods_util:get_name(Gid)])
    end.

check_stren_paris(PS, EPos) ->
    check_normal_pos(EPos),
    #role_state{id = RoleID} = PS,
    {{RoleEquip, Equips, Equip}, _} = check_get_equip(RoleID, EPos),
    #{id := Gid, paris := ParisLv, attr := Attr} = Equip,
    NextLv = ParisLv + 1,
    if
        EPos =:= ?EQUIP_POS_SHOULDER ->
            ParisLv > 0 orelse erlang:throw({error, ?RC_EQUIP_NOT_PARIS_EQUIP}),
            ConfParisNext = conf_paris_shoulder:get(conf_paris_shoulder:get_by_lv(NextLv)),
            ConfParisNext =/= undefined orelse erlang:throw({error, ?RC_EQUIP_MAX_PARIS_LV}),
            #{cost := Material, id := NewGid, attr := NewAttr} = ConfParisNext;
        true ->
            lib_goods_util:is_forge_equip(Gid) orelse erlang:throw({error, ?RC_EQUIP_NOT_FORGE_EQUIP}),
            ConfParisNext = conf_equip_paris:get({EPos, NextLv}),
            ConfParisNext =/= undefined orelse erlang:throw({error, ?RC_EQUIP_MAX_PARIS_LV}),
            #{cost := Material} = ConfParisNext,
            NewGid = Gid, NewAttr = Attr
    end,
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewEquip = Equip#{id => NewGid, paris => NextLv, attr => NewAttr},
    NewRoleEquip = set_equip(RoleEquip, Equips, EPos, NewEquip),
    {ok, RoleID, NewRoleEquip, Costs, NewEquip}.

%% @doc 重楼拆卸
strip_paris(PS, CPos) ->
    case catch check_strip_paris(PS, CPos) of
        {ok, RoleID, RoleEquip, Equip, Rewards} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_PARIS_STRIP),
            update_role_equip(RoleID, RoleEquip),
            Rec = #sc_equip_strip_paris{equip = convert_equip_info(Equip)},
            {ok, Bin} = prot_msg:encode_msg(20220, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1, RoleEquip);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_strip_paris(PS, EPos) ->
    check_normal_pos(EPos),
    #role_state{id = RoleID} = PS,
    {{RoleEquip, Equips, Equip}, _} = check_get_equip(RoleID, EPos),
    #{id := Gid, paris := ParisLv} = Equip,
    Conf = conf_goods:get(Gid),
    #{pos := EPos} = Conf,
    lib_goods_util:is_paris_equip(Equip) orelse erlang:throw({error, ?RC_EQUIP_NOT_PARIS_EQUIP}),
    Items = collect_strip_item(ParisLv, EPos, []),
    Rewards = [{?AST_ITEM, Items}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewEquip = Equip#{id => 0, paris => 0},
    NewRoleEquip = set_equip(RoleEquip, Equips, EPos, NewEquip),
    {ok, RoleID, NewRoleEquip, NewEquip, Rewards}.

collect_strip_item(0, _EPos, Acc) ->
    Acc;
collect_strip_item(Lv, EPos, Acc) ->
    ConfParis = conf_equip_paris:get({EPos, Lv}),
    #{cost := Material} = ConfParis,
    collect_strip_item(Lv - 1, EPos, Material ++ Acc).

add_equip(PS, EPos, ID) ->
    add_equip(PS, EPos, ID, true).

add_equip(PS, EPos, ID, Notify) ->
    #role_state{id = RoleID} = PS,
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    Equip = map:keyfind(EPos, pos, Equips, ?equip#{pos => EPos}),
    case Equip of
        #{id := Eid} when Eid =/= ID ->
            NewEquip = Equip#{id => ID},
            NewRoleEquip = set_equip(RoleEquip, Equips, EPos, NewEquip),
            update_role_equip(RoleID, NewRoleEquip),
            Notify andalso begin
                wear_resp(PS, NewEquip),
                refresh_attr(PS, NewRoleEquip)
            end;
        _ ->
            PS
    end.

%% -----------------------------------------------------------------------------
%% 属性
%% -----------------------------------------------------------------------------

%% @doc 获取装备属性
get_attr(RoleID) ->
    RoleData = get_role_equip(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_equip(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

%% @doc
get_skills(RoleID) ->
    RoleData = get_role_equip(RoleID),
    #{skills := Skills} = RoleData,
    lib_skill_util:make_skills(Skills).

%% @doc 刷新属性 & 通知
refresh_attr(PS, RoleEquip) ->
    #role_state{id = RoleID, career = Career} = PS,
    #{skills := Skills} = RoleEquip,
    NewRoleEquip = set_equips_attr(RoleEquip, Career),
    update_role_equip(RoleID, NewRoleEquip),
    refresh_scene_skills(PS, Skills),
    lib_role_attr:refresh_combat_power(PS).

refresh_scene_skills(PS, Skills) ->
    case erlang:get({?MODULE, scene_skill}) of
        V when V =/= Skills ->
            lib_scene_api:update('mod_pskills', PS),
            erlang:put({?MODULE, scene_skill}, Skills);
        _ ->
            ignore
    end.

%% @doc 重新装备属性 [装备属性、强化套装、宝石套装属性]
set_equips_attr(RoleEquip, Career) ->
    #{role_id := RoleID, equips := Equips} = RoleEquip,
    {EquipAttr, EquipFight} = calc_equips_attr(Equips, [], 0),
    StrenSuitAttr = calc_stren_suit(RoleID, Equips, Career),
    StoneSuitAttr = calc_stone_suit(RoleID, Equips, Career),
    Skills = coll_paris_skills(Equips, []),
    SkillAttr = calc_skill_attr(Skills, []),
    Attr = lib_role_attr:merge_attr([
        EquipAttr, StrenSuitAttr, StoneSuitAttr, SkillAttr
    ]),
    Fight = lib_role_attr:calc_combat_power(Attr, []) + EquipFight,
    RoleEquip#{
        attr => Attr, fight => Fight, stren_suit => StrenSuitAttr,
        stone_suit => StoneSuitAttr, skills => lists:sort(Skills)
    }.

%% @doc 计算装备属性 [含基础、强化、宝石等]
calc_equips_attr([], AAcc, FAcc) ->
    {AAcc, FAcc};
calc_equips_attr([Equip | T], AAcc, FAcc) ->
    {Attr, Fight} = calc_equip_attr(Equip),
    calc_equips_attr(T, Attr ++ AAcc, Fight + FAcc).

calc_equip_attr(Equip) ->
    #{attr := Attr} = Equip,
    BaseAttr = calc_base_attr(Equip),
    StrenAttr = calc_stren_attr(Equip),
    {StoneAttr, StoneFight} = calc_stones_attr(Equip),
    Ratio = calc_pairs_ratio(Equip),
    {lib_role_attr:merge_attr([
        lib_role_attr:mul_attr(Attr, 1 + Ratio),
        BaseAttr, StrenAttr, StoneAttr
    ]), StoneFight}.

calc_base_attr(#{id := 0}) ->
    [];
calc_base_attr(#{id := Gid}) ->
    GoodsConf = conf_goods:get(Gid),
    #{attr := Attr} = GoodsConf,
    Attr.

calc_stren_attr(Equip) ->
    #{pos := Pos, stren := Stren} = Equip,
    Conf = conf_equip_stren:get({Pos, Stren}),
    #{attr := Attr} = Conf,
    Attr.

calc_stones_attr(Equip) ->
    #{stones := Stones} = Equip,
    calc_stones_attr(Stones, [], 0).

calc_stones_attr([], Acc, FAcc) ->
    {Acc, FAcc};
calc_stones_attr([{_, ID} | T], Acc, FAcc) ->
    Conf = conf_equip_stone:get(ID),
    #{attr := Attr, fight := Fight} = Conf,
    calc_stones_attr(T, Attr ++ Acc, Fight + FAcc).

calc_pairs_ratio(Equip) ->
    #{pos := Pos, paris := Paris} = Equip,
    case conf_equip_paris:get({Pos, Paris}) of
        #{pert := Pert} ->
            Pert / 100;
        _ ->
            0
    end.

calc_skill_attr([], AAcc) ->
    AAcc;
calc_skill_attr([{SkillID, Lv} | T], AAcc) ->
    case conf_skill:get({SkillID, Lv}) of
        #{attr := Attr} ->
            calc_skill_attr(T, Attr ++ AAcc);
        _ ->
            calc_skill_attr(T, AAcc)
    end.

coll_paris_skills([], Acc) ->
    Acc;
coll_paris_skills([Equip | T], Acc) ->
    #{pos := Pos, id := Gid, paris := Paris} = Equip,
    if
        Pos =:= ?EQUIP_POS_SHOULDER ->
            Conf = conf_paris_shoulder:get(Gid);
        true ->
            Conf = conf_equip_paris:get({Pos, Paris})
    end,
    case Conf of
        #{skill := Skills} ->
            coll_paris_skills(T, Skills ++ Acc);
        _ ->
            coll_paris_skills(T, Acc)
    end.

%% @doc 计算套装属性
calc_stren_suit(RoleID, Equips, Career) ->
    IDList = conf_equip_stren_suit:get_by_career(Career),
    calc_stren_suit2(RoleID, IDList, Equips, []).

calc_stren_suit2(_RoleID, [], _Equips, Acc) ->
    Acc;
calc_stren_suit2(RoleID, [Key | T], Equips, Acc) ->
    Conf = conf_equip_stren_suit:get(Key),
    #{lv := NeedLv, num := NeedNum, attr := Attr} = Conf,
    Num1 = ?iif(lib_role_anqi:get_anqi_stren_lv(RoleID) >= NeedLv, 1, 0),
    Num2 = ?iif(lib_role_artifact:get_artifact_stren_lv(RoleID) >= NeedLv, 1, 0),
    case length([1 || #{stren := Lv} <- Equips, Lv >= NeedLv]) + Num1 + Num2 >= NeedNum of
        true ->
            calc_stren_suit2(RoleID, T, Equips, Attr ++ Acc);
        _ ->
            calc_stren_suit2(RoleID, T, Equips, Acc)
    end.

%% @doc 宝石套装属性
calc_stone_suit(RoleID, Equips, Career) ->
    Lvs = calc_stone_suit2(Equips, []),
    IDList = conf_equip_stone_suit:get_by_career(Career),
    AnqiStones = lib_role_anqi:get_anqi_stones(RoleID),
    ArtifactStones = lib_role_artifact:get_artifact_stones(RoleID),
    Lv1 = equip_stone_lv(AnqiStones, []),
    Lv2 = equip_stone_lv(ArtifactStones, []),
    calc_stone_suit3(IDList, [Lv1, Lv2] ++ Lvs, []).

calc_stone_suit2([], Acc) ->
    Acc;
calc_stone_suit2([Equip | T], Acc) ->
    #{stones := Stones} = Equip,
    Lv = equip_stone_lv(Stones, []),
    calc_stone_suit2(T, [Lv | Acc]).

equip_stone_lv([], Acc) when length(Acc) >= ?EQUIP_STONE_NUM ->
    lists:min(Acc);
equip_stone_lv([], _) ->
    0;
equip_stone_lv([{_, StoneID} | T], Acc) ->
    #{level := Lv} = conf_equip_stone:get(StoneID),
    equip_stone_lv(T, [Lv | Acc]).

calc_stone_suit3([], _Lvs, Acc) ->
    Acc;
calc_stone_suit3([Key | T], Lvs, Acc) ->
    Conf = conf_equip_stone_suit:get(Key),
    #{lv := NeedLv, num := NeedNum, attr := Attr} = Conf,
    case length([1 || Lv <- Lvs, Lv >= NeedLv]) >= NeedNum of
        true ->
            calc_stone_suit3(T, Lvs, Attr ++ Acc);
        _ ->
            calc_stone_suit3(T, Lvs, Acc)
    end.

%% -----------------------------------------------------------------------------
%% 其它
%% -----------------------------------------------------------------------------

check_get_equip(RoleID, EPos) ->
    check_equip_pos(EPos),
    case EPos of
        ?EQUIP_POS_ARTIFACT ->
            RoleArtifact = lib_role_artifact:get_role_data(RoleID),
            RoleArtifact#role_artifact.id =/= 0 orelse erlang:throw({error, ?RC_ARTIFACT_NOT_OPEN}),
            {{[], [], []}, RoleArtifact};
        ?EQUIP_POS_ANQI ->
            RoleAnqi = lib_role_anqi:get_role_data(RoleID),
            RoleAnqi#role_anqi.id =/= 0 orelse erlang:throw({error, ?RC_ANQI_NOT_UNLOCK}),
            {{[], [], []}, RoleAnqi};
        ?EQUIP_POS_WARRIOR_SOUL ->
            RoleWarriorSoul = lib_role_warrior_soul:get_role_data(RoleID),
            RoleWarriorSoul#role_warrior_soul.lv =/= 0 orelse erlang:throw({error, ?RC_WARRIOR_SOUL_NOT_OPEN}),
            {{[], [], []}, RoleWarriorSoul};
        _ ->
            RoleEquip = get_role_equip(RoleID),
            #{equips := Equips} = RoleEquip,
            Equip = map:keyfind(EPos, pos, Equips, ?equip#{pos => EPos}),
            {{RoleEquip, Equips, Equip}, undefined}
    end.

check_equip_pos(EPos) ->
    lists:member(EPos, ?EQUIP_POS_ROLE) orelse erlang:throw({error, ?RC_EQUIP_INVALID_POS}).

set_equip(RoleEquip, Equips, EPos, Equip) ->
    NewEquips = map:keystore(EPos, pos, Equips, Equip),
    RoleEquip#{equips => NewEquips}.

check_normal_pos(EPos) ->
    lists:member(EPos, ?EQUIP_POS_NORMAL) orelse erlang:throw({error, ?RC_EQUIP_INVALID_POS}).

check_equip_opened(RoleID, Equip) ->
    equip_opened(RoleID, Equip) orelse erlang:throw({error, ?RC_EQUIP_EQUIP_NOT_OPEN}).

equip_opened(RoleID, #{pos := Pos, id := ID}) ->
    case Pos of
        ?EQUIP_POS_ARTIFACT ->
            lib_role_artifact:check_artifact_open(RoleID);
        ?EQUIP_POS_ANQI ->
            lib_role_anqi:check_anqi_open(RoleID);
        ?EQUIP_POS_WARRIOR_SOUL ->
            lib_role_warrior_soul:check_warrior_soul_open(RoleID);
        _ when Pos =< ?EQUIP_POS_RUNE ->
            true;
        _ ->
            ID > 0
    end.

%% @doc {NewEquip, Items}
switch_equip(#{id := 0}, 0) ->
    erlang:throw({error, ?RC_EQUIP_NOT_WEAR_EQUIP});
switch_equip(Equip, 0) ->
    #{id := EID, attr := EAttr, paris := EParis, extra := Extra} = Equip,
    NewEquip = Equip#{id => 0, attr => [], paris => 0},
    NewItem = ?goods_basic#{id => EID, attr => EAttr, paris => EParis, bind => ?GOODS_BIND, num => 1, extra => Extra},
    {NewEquip, [NewItem]};
switch_equip(Equip, Item) ->
    #{id := IID, attr := IAttr, paris := IParis, extra := IExtra} = Item,
    #{id := EID, attr := EAttr, paris := EParis, extra := EExtra} = Equip,
    NewEquip = Equip#{id => IID, attr => IAttr, paris => IParis, extra => IExtra},
    NewItem = ?goods_basic#{
        id => EID, attr => EAttr, paris => EParis, extra => EExtra,
        bind => ?GOODS_BIND, num => 1
    },
    {NewEquip, ?iif(EID > 0, [NewItem], [])}.

%% @doc 获取装备穿戴数量
get_wear_num(RoleID) ->
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    erlang:length([1 || #{id := ID} <- Equips, ID > 0]).

%% @doc 获取强化等级
get_stren_lv(RoleID) ->
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    #role_anqi{stren = AnQiStren} = lib_role_anqi:get_role_data(RoleID),
    #role_artifact{stren = ArtStren} = lib_role_artifact:get_role_data(RoleID),
    lists:min([StrenLv || #{stren := StrenLv} <- Equips] ++ [AnQiStren, ArtStren]).

%% @doc 获取总强化等级
get_total_stren_lv(RoleID) ->
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    #role_anqi{stren = AnQiStren} = lib_role_anqi:get_role_data(RoleID),
    #role_artifact{stren = ArtStren} = lib_role_artifact:get_role_data(RoleID),
    lists:sum([StrenLv || #{stren := StrenLv} <- Equips] ++ [AnQiStren, ArtStren]).

get_lv_stren_num(RoleID, Lv) ->
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    #role_anqi{stren = AnQiStren} = lib_role_anqi:get_role_data(RoleID),
    #role_artifact{stren = ArtStren} = lib_role_artifact:get_role_data(RoleID),
    length([1 || SLv <- [StrenLv || #{stren := StrenLv} <- Equips] ++ [AnQiStren, ArtStren], SLv >= Lv]).

get_total_stone_lv(RoleID) ->
    Fun = fun(_, ID, Acc) ->
        #{level := Lv} = conf_equip_stone:get(ID),
        Lv + Acc
    end,
    stone_fold(RoleID, Fun, 0).

get_lv_stone_num(RoleID, Lv) ->
    Fun = fun(_, ID, Acc) ->
        #{level := StoneLv} = conf_equip_stone:get(ID),
        ?iif(StoneLv >= Lv, Acc + 1, Acc)
    end,
    stone_fold(RoleID, Fun, 0).

get_suit_stone_lv(RoleID) ->
    Fun = fun(_, ID, {LvAcc, NumAcc}) ->
        #{level := StoneLv} = conf_equip_stone:get(ID),
        NewLvAcc = ?iif(StoneLv < LvAcc, StoneLv, LvAcc),
        {NewLvAcc, NumAcc + 1}
    end,
    {MinLv, Num} = stone_fold(RoleID, Fun, {999, 0}),
    MaxNum = length(conf_equip_stone_pos:get_ids()),
    ?iif(Num < MaxNum, 0, MinLv).

stone_fold(RoleID, Func, Acc) ->
    #role_anqi{stones = AnQiStones} = lib_role_anqi:get_role_data(RoleID),
    #role_artifact{stones = ArtStones} = lib_role_artifact:get_role_data(RoleID),
    RoleEquip = get_role_equip(RoleID),
    #{equips := Equips} = RoleEquip,
    stone_fold2(Equips, AnQiStones, ArtStones, Func, Acc).

stone_fold2([], AnQiStones, ArtStones, Fun, Acc) ->
    stone_fold3(ArtStones, Fun, stone_fold3(AnQiStones, Fun, Acc));
stone_fold2([Equip | T], AnQiStones, ArtStones, Fun, Acc) ->
    #{stones := Stones} = Equip,
    stone_fold2(T, AnQiStones, ArtStones, Fun, stone_fold3(Stones, Fun, Acc)).

stone_fold3([], _Fun, Acc) ->
    Acc;
stone_fold3([{Pos, ID} | T], Fun, Acc) ->
    stone_fold3(T, Fun, Fun(Pos, ID, Acc)).

remove_paris_skill(PS) ->
    #role_state{skill_list = SkillList} = PS,
    IDList = conf_skill:get_by_cate(?SKILL_CATEGORY_PARIS),
    NewList = [Skill || #skill{id = ID} = Skill <- SkillList, not lists:member(ID, IDList)],
    PS#role_state{skill_list = NewList}.

update_equip_rank(RoleID, Career, #{id := ID} = Equip) when ID > 0 ->
    #{id := ID, pos := Pos, attr := RandomAttr} = Equip,
    #{name := GoodsName} = conf_goods:get(ID),
    BaseAttr = calc_base_attr(Equip),
    Fight = lib_role_attr:calc_combat_power(BaseAttr ++ RandomAttr, []),
    lib_role_rank:update_equip_rank(Pos, RoleID, Career, Fight, GoodsName);
update_equip_rank(RoleID, _Career, #{pos := Pos}) ->
    lib_role_rank:update_equip_rank(Pos, RoleID, 0, 0, <<"">>).

%% =============================================================================
%% 玩家数据
%% =============================================================================

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID, career = Career} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_EQUIP, [RoleID]),
    List = db:get_all(SQL),
    Equips = init_equip(List, [], sets:from_list(?EQUIP_POS_ROLE)),
    RoleEquip = set_equips_attr(?role_equip#{role_id => RoleID, equips => Equips}, Career),
    set_role_equip(RoleID, RoleEquip),
    ok.

init_equip([], Acc, EAcc) ->
    init_empty_equip(sets:to_list(EAcc), Acc);
init_equip([[Pos, ID, Stren, DbStones, DbAttr, DbExtra] | T], Acc, EAcc) ->
    Stones = type:convert_db_field(list, DbStones, []),
    Attr = type:convert_db_field(list, DbAttr, []),
    Extra = type:convert_db_field(list, DbExtra, []),
    Equip = ?equip#{
        pos => Pos, id => ID, stren => Stren, stones => Stones, attr => Attr,
        extra => Extra
    },
    init_equip(T, [Equip | Acc], sets:del_element(Pos, EAcc)).

init_empty_equip([], Acc) ->
    Acc;
init_empty_equip([Pos | T], Acc) ->
    Equip = ?equip#{pos => Pos},
    init_empty_equip(T, [Equip | Acc]).

%% @doc 下线保存
save(PS) ->
    save_(PS).

%% @doc 保存
save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleEquip ->
            save_role_data(RoleID, RoleEquip);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleEquip) ->
    #{equips := Equips} = RoleEquip,
    Fun = fun(Equip) ->
        #{pos := Pos, id := ID, stren := Stren, stones := Stones, attr := Attr,
            extra := Extra} = Equip,
        DbStones = type:term_to_bitstring(Stones),
        DbAttr = type:term_to_bitstring(Attr),
        DbExtra = type:term_to_bitstring(Extra),
        [RoleID, Pos, ID, Stren, DbStones, DbAttr, DbExtra]
    end,
    db:insert_values(?SQL_SET_ROLE_EQUIP2, ?SQL_SET_ROLE_EQUIP3, Fun, Equips),
    NewRoleEquip = RoleEquip#{updated => false},
    set_role_equip(RoleID, NewRoleEquip).

get_role_equip(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleEquip when is_map(RoleEquip) ->
            RoleEquip;
        _ ->
            ?role_equip#{role_id => RoleID}
    end.

update_role_equip(RoleID, RoleEquip) ->
    NewRoleEquip = RoleEquip#{updated => true},
    set_role_equip(RoleID, NewRoleEquip).

set_role_equip(_RoleID, Equip) ->
    erlang:put({?MODULE, role_data}, Equip).
