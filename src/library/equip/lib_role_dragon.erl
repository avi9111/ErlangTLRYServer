%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2019, Nemo
%%% @doc
%%%     🐉纹 🐅🐕🐖
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_dragon).
-author("Ryuu").

-include("func.hrl").
-include("role.hrl").
-include("equip.hrl").
-include("goods.hrl").
-include("dragon.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_209.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    get_attr/1,
    cross_day/1,
    get_fight/1,
    send_info/1,
    view_info/1,
    get_skills/1,
    role_login/1,
    get_role_data/1,
    load_view_info/1
]).

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save(PS);
event(PS, {func_open, ?FUNC_DRAGON}) ->
    func_open(PS);
event(_, _) ->
    ignore.

do(20901, PS, _Req) ->
    send_info(PS);
do(20903, PS, _Req) ->
    level_up(PS);
do(20905, PS, _Req) ->
    refine(PS);
do(20907, PS, _Req) ->
    replace(PS);
do(20909, PS, #cs_dragon_condense{times = Times}) ->
    condense(PS, Times);
do(20911, PS, #cs_dragon_equip{pos = Pos, bag_pos = BagPos}) ->
    equip(PS, Pos, BagPos);
do(20913, PS, #cs_dragon_eat{type = Type, pos = Pos, bag_pos = BagPos}) ->
    eat(PS, Type, Pos, BagPos);
do(_Cmd, _PS, _Req) ->
    ignore.

send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{growth_lv := GrowthLv, growth_hole := GrowthHole, refine_star := RefineStar,
        refine_lv := RefineLv, refine_times := RefineTimes, refine_exp := RefineExp,
        refine_quality := RefineQuality, refine_lv_r := RefineLvR,
        refine_star_r := RefineStarR, refine_quality_r := RefineQualityR,
        items := Items, condense_state := CondenseState} = RoleData,
    Rec = #sc_dragon_info{
        items = convert_items(Items), growth_lv = GrowthLv, growth_hole = GrowthHole,
        refine_star = RefineStar, refine_lv = RefineLv, refine_exp = RefineExp,
        refine_times = RefineTimes, refine_quality = RefineQuality,
        refine_lv_r = RefineLvR, refine_star_r = RefineStarR,
        refine_quality_r = RefineQualityR, condense_state = CondenseState
    },
    {ok, Bin} = prot_msg:encode_msg(20902, Rec),
    lib_role_send:send_to_role(PS, Bin).

level_up(PS) ->
    case catch check_level_up(PS) of
        {ok, RoleID, RoleData, Costs, Rumor} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_LV_UP),
            update_role_data(RoleID, RoleData),
            #role_state{name = Name} = PS,
            #{growth_lv := GrowthLv, growth_hole := GrowthHole} = RoleData,
            Rumor > 0 andalso svr_rumor:publish(world, Rumor, [Name, ?STR(GrowthLv)]),
            Rec = #sc_dragon_level_up{
                growth_lv = GrowthLv, growth_hole = GrowthHole
            },
            {ok, Bin} = prot_msg:encode_msg(20904, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS1, RoleData);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_level_up(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{growth_lv := CurLv, growth_hole := CurHole} = RoleData,
    Conf = conf_dragon_growth:get({CurLv, CurHole}),
    {NextLv, NextHole} = next_lv(conf_dragon_growth, CurLv, CurHole),
    #{material := Material, coin := Coin, rumor := Rumor} = Conf,
    Costs = [{?AST_ITEM, Material}, {?AST_COIN, Coin}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewData = RoleData#{growth_lv => NextLv, growth_hole => NextHole},
    {ok, RoleID, NewData, Costs, Rumor}.

refine(PS) ->
    case catch check_refine(PS) of
        {ok, RoleID, RoleData, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_REFINE),
            update_role_data(RoleID, RoleData),
            #{refine_star_r := Star, refine_lv_r := Level, refine_exp := Exp,
                refine_times := RefineTimes, refine_quality_r := RefineQualityR} = RoleData,
            Rec = #sc_dragon_refine{
                refine_star_r = Star, refine_lv_r = Level, refine_exp = Exp,
                refine_times = RefineTimes, refine_quality_r = RefineQualityR
            },
            {ok, Bin} = prot_msg:encode_msg(20906, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_refine(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{refine_star_r := Star, refine_lv_r := Level, refine_exp := Exp,
        refine_times := RefineTimes} = RoleData,
    MaxTimes = config:get_sys_config(dragon_refine_week_times),
    RefineTimes < MaxTimes orelse erlang:throw({error, ?RC_DRAGON_MAX_REFINE_TIMES}),
    Conf = conf_dragon_refine:get({Star, Level}),
    Conf =/= undefined orelse erlang:throw({error, ?RC_DRAGON_NO_REFINE_CONF}),
    #{cost := Material, ratio := Ratio, add := Add, limit := Limit} = Conf,
    Costs = [{?AST_ITEM, Material}],
    lib_role_assets:check_items_enough(PS, Costs),
    {NextStar, NextLv} = next_lv(conf_dragon_refine, Star, Level),
    TempExp = Exp + Add,
    Upgrade = TempExp >= Limit orelse util:is_bingo(Ratio),
    {NewStar, NewLv, NewExp} = ?iif(Upgrade, {NextStar, NextLv, 0}, {Star, Level, TempExp}),
    Quality = refresh_quality(Conf),
    NewTimes = RefineTimes + 1,
    NewData = RoleData#{
        refine_star_r => NewStar, refine_lv_r => NewLv, refine_exp => NewExp,
        refine_quality_r => Quality, refine_times => NewTimes
    },
    {ok, RoleID, NewData, Costs}.

refresh_quality(Conf) ->
    #{quality := List} = Conf,
    refresh_quality2(List, []).

refresh_quality2([], Acc) ->
    Acc;
refresh_quality2([{ID, Low, High} | T], Acc) ->
    Val = util:rand(Low, High),
    refresh_quality2(T, [{ID, Val} | Acc]).

replace(PS) ->
    case catch check_replace(PS) of
        {ok, RoleID, RoleData} ->
            update_role_data(RoleID, RoleData),
            #{refine_star := Star, refine_lv := Level, refine_quality := RefineQuality} = RoleData,
            Rec = #sc_dragon_replace{
                refine_star = Star, refine_lv = Level,
                refine_quality = RefineQuality
            },
            {ok, Bin} = prot_msg:encode_msg(20908, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS, RoleData);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_replace(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{refine_quality_r := RefineQualityR, refine_star_r := RefineStarR,
        refine_lv_r := RefineLvR} = RoleData,
    RefineQualityR =/= [] orelse erlang:throw({error, ?RC_DRAGON_NO_REFRESH_ATTR}),
    NewData = RoleData#{
        refine_star => RefineStarR, refine_lv => RefineLvR, refine_quality => RefineQualityR,
        refine_quality_r => []
    },
    {ok, RoleID, NewData}.

condense(PS, Times) ->
    case catch check_condense(PS, Times) of
        {ok, RoleID, RoleData, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_CONDENSE),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_DRAGON_CONDENSE),
            update_role_data(RoleID, RoleData),
            #{condense_state := State} = RoleData,
            Rec = #sc_dragon_condense{
                condense_state = State,
                items = lib_role_assets:convert_items(Rewards)
            },
            {ok, Bin} = prot_msg:encode_msg(20910, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_condense(PS, Times) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{condense_state := State} = RoleData,
    lists:member(Times, [1, 10]) orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    {Serum, Coin} = config:get_sys_config(dragon_condense_cost),
    Costs = [{?AST_SERUM, Serum * Times}, {?AST_COIN, Coin * Times}],
    lib_role_assets:check_items_enough(PS, Costs),
    Room = lib_role_goods:get_bag_room(RoleID, ?BAG_ID_DRAGON),
    Room >= Times orelse erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM}),
    {NewState, Rewards} = condense(Times, State, []),
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewData = RoleData#{condense_state => NewState},
    {ok, RoleID, NewData, Costs, Rewards}.

condense(0, State, Acc) ->
    {State, Acc};
condense(Times, State, Acc) ->
    Conf = conf_dragon_state:get(State),
    Conf =/= undefined orelse erlang:throw({error, ?RC_DRAGON_NO_STATE_CONF}),
    #{ratio := Ratio, drop := DropID} = Conf,
    NewState = ?iif(util:is_bingo(Ratio), State + 1, 1),
    Rewards = lib_drop_base:get_drop_goods(DropID),
    condense(Times - 1, NewState, Rewards ++ Acc).

equip(PS, Pos, BagPos) ->
    case catch check_equip(PS, Pos, BagPos) of
        {ok, RoleID, RoleData, Costs, Rewards, Item} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_TAKE_OFF),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_DRAGON_WEAR),
            update_role_data(RoleID, RoleData),
            Rec = #sc_dragon_equip{item = convert_item(Item)},
            {ok, Bin} = prot_msg:encode_msg(20912, Rec),
            lib_role_send:send_to_role(PS, Bin),
            refresh_attr(PS2, RoleData);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_equip(PS, Pos, BagPos) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{items := Items, growth_lv := GrowthLv} = RoleData,
    ConfPos = conf_dragon_pos:get(Pos),
    ConfPos =/= undefined orelse erlang:throw({error, ?RC_DRAGON_INVALID_POS}),
    #{unlock := UnlockLv, type := PType} = ConfPos,
    GrowthLv >= UnlockLv orelse erlang:throw({error, ?RC_DRAGON_UNLOCK_LV_LIMIT}),
    Item = map:keyfind(Pos, pos, Items, ?dragon_item#{pos => Pos}),
    #{id := CurID} = Item,
    case BagPos of
        0 ->
            CurID > 0 orelse erlang:throw({error, ?RC_DRAGON_NOT_EQUIP_ITEM}),
            {NewItem, CGoods} = switch_dragon(Item, 0),
            Rewards = [{?AST_ITEM, CGoods}],
            Costs = [];
        _ ->
            Goods = lib_goods_util:check_get_cell_item(RoleID, ?BAG_ID_DRAGON, BagPos),
            check_dup(Items, Goods, Pos, PType),
            {NewItem, CGoods} = switch_dragon(Item, Goods),
            Rewards = [{?AST_ITEM, CGoods}],
            Costs = [{?AST_DRAGON_C, [{BagPos, 1}]}]
    end,
    lib_role_assets:check_items_enough(PS, Costs),
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewItems = map:keystore(Pos, pos, Items, NewItem),
    NewData = RoleData#{items => NewItems},
    {ok, RoleID, NewData, Costs, Rewards, NewItem}.

eat(PS, Type, Pos, IDList) ->
    case catch check_eat(PS, Type, Pos, IDList) of
        {equip, RoleID, RoleData, Costs, Item} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_EAT),
            update_role_data(RoleID, RoleData),
            eat_resp(PS, Type, Pos, Item),
            refresh_attr(PS1, RoleData);
        {bag, RoleID, Item, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_DRAGON_EAT),
            lib_role_goods:set_cell_items(RoleID, ?BAG_ID_DRAGON, [Item], ?OPT_DRAGON_EAT),
            eat_resp(PS, Type, Pos, Item),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

eat_resp(PS, Type, Pos, Item) ->
    #{level := Level, exp := Exp} = Item,
    Rec = #sc_dragon_eat{
        type = Type, pos = Pos, level = Level, exp = Exp
    },
    {ok, Bin} = prot_msg:encode_msg(20914, Rec),
    lib_role_send:send_to_role(PS, Bin).

check_eat(PS, Type, Pos, PosList) ->
    #role_state{id = RoleID} = PS,
    RoleData = check_get_data(RoleID),
    #{items := Items} = RoleData,
    PosList =/= [] orelse erlang:throw({error, ?RC_DRAGON_EMPTY_EAT_LIST}),
    if
        Type =:= 1 ->
            Item = map:keyfind(Pos, pos, Items, ?dragon_item);
        true ->
            Item = lib_goods_util:check_get_cell_item(RoleID, ?BAG_ID_DRAGON, Pos),
            lists:member(Pos, PosList) andalso erlang:throw({error, ?RC_DRAGON_EAT_SELF})
    end,
    GoodsList = lib_role_goods:get_cell_items(RoleID, ?BAG_ID_DRAGON, PosList),
    #{id := ID, level := Level, exp := Exp} = Item,
    ConfItem = conf_dragon_item:get(ID),
    ConfItem =/= undefined orelse erlang:throw({error, ?RC_DRAGON_NOT_ITEM}),
    #{type := IType, color := Color} = ConfItem,
    IType =/= ?DRAGON_HOKORI orelse erlang:throw({error, ?RC_DRAGON_ITEM_CAN_NOT_EAT}),
    ConfLevel = conf_dragon_level:get({Color, Level}),
    ConfNext = conf_dragon_level:get({Color, Level + 1}),
    ConfNext =/= undefined orelse erlang:throw({error, ?RC_DRAGON_MAX_LV}),
    {NewLevel, NewExp, CGoods} = eat_items(GoodsList, ConfLevel, Level, Exp, []),
    Costs = [{?AST_DRAGON_C, CGoods}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewItem = Item#{level => NewLevel, exp => NewExp},
    if
        Type =:= 1 ->
            NewItems = map:keystore(Pos, pos, Items, NewItem),
            NewData = RoleData#{items => NewItems},
            {equip, RoleID, NewData, Costs, NewItem};
        true ->
            {bag, RoleID, NewItem, Costs}
    end.

eat_items(_, #{exp := 0}, LvAcc, ExpAcc, Acc) ->
    {LvAcc, ExpAcc, Acc};
eat_items(L, #{exp := Limit} = ConfAcc, LvAcc, ExpAcc, Acc) when ExpAcc >= Limit ->
    eat_items(L, next_lv_conf(ConfAcc), LvAcc + 1, ExpAcc - Limit, Acc);
eat_items([], _ConfAcc, LvAcc, ExpAcc, Acc) ->
    {LvAcc, ExpAcc, Acc};
eat_items(_, undefined, LvAcc, ExpAcc, Acc) ->
    {LvAcc, ExpAcc, Acc};
eat_items([Item | T], ConfAcc, LvAcc, ExpAcc, Acc) ->
    #{pos := Pos, num := Num} = Item,
    EatExp = eat_exp(Item),
    #{exp := Limit} = ConfAcc,
    CNum = erlang:min(Num, erlang:ceil((Limit - ExpAcc) / EatExp)),
    TempExp = ExpAcc + CNum * EatExp,
    {NewLv, NewExp, NewConf} = ?iif(TempExp >= Limit,
        {LvAcc + 1, TempExp - Limit, next_lv_conf(ConfAcc)}, {LvAcc, TempExp, ConfAcc}),
    if
        CNum >= Num ->
            eat_items(T, NewConf, NewLv, NewExp, [{Pos, Num} | Acc]);
        true ->
            eat_items([Item#{num => Num - CNum} | T], NewConf, NewLv, NewExp, [{Pos, CNum} | Acc])
    end.

eat_exp(Item) ->
    #{id := ID, level := Level, exp := Exp} = Item,
    ConfItem = conf_dragon_item:get(ID),
    #{color := IColor, eat_exp := EExp} = ConfItem,
    IConfLevel = conf_dragon_level:get({IColor, Level}),
    #{total := Total} = IConfLevel,
    Total + Exp + EExp.

next_lv_conf(Conf) ->
    #{color := Color, level := Level} = Conf,
    conf_dragon_level:get({Color, Level + 1}).

%% -----------------------------------------------------------------------------

get_attr(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{attr := Attr} = RoleData,
    Attr.

get_fight(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{fight := Fight} = RoleData,
    Fight.

get_skills(RoleID) ->
    RoleData = get_role_data(RoleID),
    #{skills := Skills} = RoleData,
    Skills.

refresh_attr(PS, RoleData) ->
    #role_state{id = RoleID} = PS,
    NewData = set_dragon_attr(RoleData),
    update_role_data(RoleID, NewData),
    lib_role_attr:refresh_combat_power(PS).

set_dragon_attr(RoleData) ->
    #{growth_lv := GrowthLv, growth_hole := GrowthHole, refine_quality := RefineQuality,
        items := Items} = RoleData,
    {ItemAttr, Skills} = calc_item_attr(Items, [], []),
    GrowthAttr = boost(RefineQuality, calc_growth_attr(GrowthLv, GrowthHole)),
    Attr = lib_role_attr:merge_attr([
        GrowthAttr, ItemAttr
    ]),
    Fight = lib_role_attr:calc_combat_power(Attr, Skills),
    RoleData#{attr => Attr, fight => Fight, skills => Skills}.

calc_growth_attr(GrowthLv, GrowthHole) ->
    ConfGrowth = conf_dragon_growth:get({GrowthLv, GrowthHole}),
    #{attr := GrowthAttr} = ConfGrowth,
    GrowthAttr.

boost([], Acc) ->
    Acc;
boost([{ID, Val} | T], Acc) ->
    Type = conf_dragon_map:get(ID),
    case util:prop_get_value(Type, Acc) of
        CurVal when is_integer(CurVal) ->
            NewVal = erlang:floor(CurVal * (1 + (Val - 1000) * 0.001)),
            boost(T, util:prop_store(Type, NewVal, Acc));
        _ ->
            boost(T, Acc)
    end.

calc_item_attr([], AAcc, SAcc) ->
    {AAcc, lib_skill_util:make_skills(SAcc)};
calc_item_attr([Item | T], AAcc, SAcc) ->
    #{pos := Pos, id := ID, level := Level} = Item,
    ConfPos = conf_dragon_pos:get(Pos),
    #{type := Type} = ConfPos,
    if
        ID =:= 0 ->
            calc_item_attr(T, AAcc, SAcc);
        Type =:= 1 ->
            ConfItem = conf_dragon_item:get(ID),
            #{skill := SkillID} = ConfItem,
            calc_item_attr(T, AAcc, [{SkillID, Level} | SAcc]);
        true ->
            ConfAttr = conf_dragon_attr:get({ID, Level}),
            #{attr := Attr} = ConfAttr,
            calc_item_attr(T, Attr ++ AAcc, SAcc)
    end.

%% -----------------------------------------------------------------------------

next_lv(Mod, CurLv, CurHole) ->
    case Mod:get({CurLv, CurHole + 1}) of
        undefined ->
            case Mod:get({CurLv + 1, 0}) of
                undefined ->
                    erlang:throw({error, ?RC_DRAGON_MAX_LV});
                _ ->
                    {CurLv + 1, 0}
            end;
        _ ->
            {CurLv, CurHole + 1}
    end.

convert_items(Items) ->
    convert_items(Items, []).

convert_items([], Acc) ->
    Acc;
convert_items([Item | T], Acc) ->
    convert_items(T, [convert_item(Item) | Acc]).

convert_item(Item) ->
    #{pos := Pos, id := ID, level := Lv, exp := Exp} = Item,
    #dragon{pos = Pos, id = ID, level = Lv, exp = Exp}.

switch_dragon(#{id := 0}, 0) ->
    erlang:throw({error, ?RC_DRAGON_NOT_EQUIP_ITEM});
switch_dragon(Equip, 0) ->
    #{id := EID, level := ELevel, exp := EExp} = Equip,
    NewEquip = Equip#{id => 0, level => 0, exp => 0},
    NewItem = ?goods_basic#{id => EID, level => ELevel, exp => EExp, bind => ?GOODS_BIND, num => 1},
    {NewEquip, [NewItem]};
switch_dragon(Equip, Item) ->
    #{id := IID, level := ILevel, exp := IExp} = Item,
    #{id := EID, level := ELevel, exp := EExp} = Equip,
    Conf = conf_dragon_item:get(IID),
    #{type := IType} = Conf,
    IType =/= ?DRAGON_HOKORI orelse erlang:throw({error, ?RC_DRAGON_ITEM_CAN_NOT_EQUIP}),
    NewEquip = Equip#{id => IID, level => ILevel, exp => IExp},
    NewItem = ?goods_basic#{id => EID, level => ELevel, exp => EExp, bind => ?GOODS_BIND, num => 1},
    {NewEquip, ?iif(EID > 0, [NewItem], [])}.

check_dup(Items, Goods, Pos, PType) ->
    #{id := ID} = Goods,
    IType = item_type(ID),
    check_dup2(Items, IType, Pos, PType).

check_dup2([], _Type, _Pos, _PType) ->
    ok;
check_dup2([#{id := 0} | T], Type, Pos, PType) ->
    check_dup2(T, Type, Pos, PType);
check_dup2([Item | T], Type, Pos, PType) ->
    #{id := ID, pos := IPos} = Item,
    case pos_type(IPos) =:= PType
        andalso item_type(ID) =:= Type of
        true when IPos =/= Pos ->
            erlang:throw({error, ?RC_DRAGON_EQUIP_DUP});
        _ ->
            check_dup2(T, Type, Pos, PType)
    end.

item_type(ID) ->
    ConfItem = conf_dragon_item:get(ID),
    #{type := Type} = ConfItem,
    Type.

pos_type(Pos) ->
    Conf = conf_dragon_pos:get(Pos),
    #{type := Type} = Conf,
    Type.

check_get_data(RoleID) ->
    lib_role_func:is_active(RoleID, ?FUNC_DRAGON) orelse erlang:throw({error, ?RC_DRAGON_FUNC_LIMIT}),
    get_role_data(RoleID).

view_info(RoleID) when is_integer(RoleID) ->
    RoleData = get_role_data(RoleID),
    view_info(RoleData);
view_info(RoleData) ->
    #{growth_lv := GrowthLv, growth_hole := GrowthHole, refine_star := RefineStar,
        refine_lv := RefineLv, refine_exp := RefineExp, refine_quality := RefineQuality,
        items := Items} = RoleData,
    #dragon_view{
        items = convert_items(Items), growth_lv = GrowthLv, growth_hole = GrowthHole,
        refine_lv = RefineLv, refine_star = RefineStar, refine_exp = RefineExp,
        refine_quality = RefineQuality
    }.

load_view_info(RoleID) ->
    RoleData = load_role_data(RoleID),
    view_info(RoleData).

%% -----------------------------------------------------------------------------

% 加载数据
init(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = load_role_data(RoleID),
    renew_role_data(RoleID, set_dragon_attr(RoleData)),
    ok.

role_login(PS) ->
    lib_role_func:is_active(PS#role_state.id, ?FUNC_DRAGON) andalso
        lib_role_equip:add_equip(PS, ?EQUIP_POS_DRAGON, ?EQUIP_DRAGON_ID, true),
    ok.

load_role_data(RoleID) ->
    case db:get_row(io_lib:format(?SQL_GET_ROLE_DRAGON, [RoleID])) of
        [DbItems, GrowthLv, GrowthHole, RefineStar, RefineLv, RefineTimes,
            RefineExp, DbRefineQuality, RefineStarR, RefineLvR, DbRefineQualityR,
            CondenseState, Time] ->
            RefineQuality = type:convert_db_field(list, DbRefineQuality, []),
            RefineQualityR = type:convert_db_field(list, DbRefineQualityR, []),
            Items = type:convert_db_field(list, DbItems, []),
            ?role_dragon#{
                growth_lv => GrowthLv, growth_hole => GrowthHole, refine_star => RefineStar,
                refine_lv => RefineLv, refine_times => RefineTimes, refine_exp => RefineExp,
                refine_quality => RefineQuality, refine_star_r => RefineStarR,
                refine_lv_r => RefineLvR, refine_quality_r => RefineQualityR,
                items => Items, condense_state => CondenseState, time => Time,
                role_id => RoleID
            };
        _ ->
            ?role_dragon#{role_id => RoleID, time => time:unixtime()}
    end.

save(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{growth_lv := GrowthLv, growth_hole := GrowthHole, refine_star := RefineStar,
        refine_lv := RefineLv, refine_times := RefineTimes, refine_exp := RefineExp,
        refine_quality := RefineQuality, refine_star_r := RefineStarR,
        refine_lv_r := RefineLvR, refine_quality := RefineQualityR,
        items := Items, condense_state := CondenseState, time := Time} = RoleData,
    DbRefineQuality = type:term_to_bitstring(RefineQuality),
    DbRefineQualityR = type:term_to_bitstring(RefineQualityR),
    DbItems = type:term_to_bitstring(Items),
    SQL = io_lib:format(?SQL_SET_ROLE_DRAGON, [
        RoleID, DbItems, GrowthLv, GrowthHole, RefineStar, RefineLv, RefineTimes,
        RefineExp, DbRefineQuality, RefineStarR, RefineLvR, DbRefineQualityR,
        CondenseState, Time
    ]),
    db:execute(SQL),
    set_role_data(RoleID, RoleData#{updated => false}).

cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    renew_role_data(RoleID, RoleData).

renew_role_data(RoleID, RoleData) ->
    #{time := Time} = RoleData,
    Now = time:unixtime(),
    case time:is_same_week(Time, Now) of
        true ->
            set_role_data(RoleID, RoleData);
        _ ->
            update_role_data(RoleID, RoleData#{refine_times => 0})
    end.

func_open(PS) ->
    lib_role_equip:add_equip(PS, ?EQUIP_POS_DRAGON, ?EQUIP_DRAGON_ID),
    send_info(PS).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_dragon#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    set_role_data(RoleID, RoleData#{updated => true}).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData),
    RoleData.
