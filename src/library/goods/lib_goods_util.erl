%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     物品
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_goods_util).
-author("Ryuu").

-include("goods.hrl").
-include("ret_code.hrl").
-include("proto/prot_ud.hrl").

%% API
-export([
    exists/1,
    classify/1,
    gen_attr/1,
    get_name/1,
    is_equip/1,
    is_stone/1,
    is_title/1,
    bag_change/3,
    is_fashion/1,
    is_pet_egg/1,
    expire_time/1,
    occupy_room/1,
    goods_of_type/2,
    has_bind_item/2,
    has_limit_item/2,
    is_forge_equip/1,
    is_growup_skin/2,
    is_paris_equip/1,
    is_career_equip/1,
    convert_bag_info/1,
    is_channel_equip/1,
    convert_bags_info/1,
    is_pet_skill_item/1,
    convert_goods_list/1,
    convert_goods_info/1,
    is_role_skill_item/1,
    check_get_cell_item/3
]).

%% @doc 物品过期时间
expire_time(0) ->
    0;
expire_time(Time) ->
    util:ceil(Time, 3600).

%% @doc 转换单个背包信息
convert_bags_info(BagInfo) ->
    convert_bags_info(lib_goods_base:get_bag_list(BagInfo), []).

convert_bags_info([], Acc) ->
    Acc;
convert_bags_info([Bag | T], Acc) ->
    BagInfo = convert_bag_info(Bag),
    convert_bags_info(T, [BagInfo | Acc]).

convert_bag_info(Bag) ->
    #{id := BagID, name := Name, goods := Goods, cell_num := CellNum} = Bag,
    #bag_info{
        bag_id = BagID, name = Name, cell_num = CellNum,
        goods = convert_goods_list(Goods)
    }.

convert_goods_list(GoodsList) ->
    convert_goods_list(lib_goods_base:get_goods_list(GoodsList), []).

convert_goods_list([], Acc) ->
    Acc;
convert_goods_list([Goods | T], Acc) ->
    GoodsInfo = convert_goods_info(Goods),
    convert_goods_list(T, [GoodsInfo | Acc]).

convert_goods_info(Goods) ->
    #{pos := Pos, id := ID, num := Num, bind := Bind, expire := Expire, attr := Attr,
        paris := Paris, sell_time := SellTime, sell_times := SellTimes,
        effect := Effect, level := Level, exp := Exp} = Goods,
    #goods_info{
        id = ID, pos = Pos, num = Num, bind = Bind, expire = Expire, attr = Attr,
        paris = Paris, sell_time = SellTime, sell_times = SellTimes, effect = Effect,
        level = Level, exp = Exp
    }.

%% @doc 背包变化
bag_change(BagIDs, OldBag, NewBag) ->
    bag_change_(BagIDs, OldBag, NewBag, []).

bag_change_([], _OldBag, _NewBag, Acc) ->
    Acc;
bag_change_([BagID | T], OldBag, NewBag, Acc) ->
    case items_change(
        lib_goods_base:get_bag(BagID, OldBag),
        lib_goods_base:get_bag(BagID, NewBag)
    ) of
        {[], []} ->
            bag_change_(T, OldBag, NewBag, Acc);
        {CList, DList} ->
            Change = #bag_change{
                bag_id = BagID, change = convert_goods_list(CList),
                delete = DList
            },
            bag_change_(T, OldBag, NewBag, [Change | Acc])
    end.

%% @doc 背包变化
items_change(undefined, #{goods := NGoodsDict}) ->
    {util:dict_values(NGoodsDict), []};
items_change(#{goods := OGoodsDict}, undefined) ->
    {[], dict:fetch_keys(OGoodsDict)};
items_change(#{goods := OGoodsDict, cell_num := OMaxNum},
    #{goods := NGoodsDict, cell_num := NMaxNum}) ->
    MaxNum = erlang:max(OMaxNum, NMaxNum),
    items_change_(MaxNum, OGoodsDict, NGoodsDict, [], []);
items_change(_, _) ->
    {[], []}.

items_change_(0, _OGoodsDict, _NGoodsDict, CAcc, DAcc) ->
    {CAcc, DAcc};
items_change_(Pos, OGoodsDict, NGoodsDict, CAcc, DAcc) ->
    case {util:dict_find(Pos, OGoodsDict), util:dict_find(Pos, NGoodsDict)} of
        {OGoods, OGoods} ->
            items_change_(Pos - 1, OGoodsDict, NGoodsDict, CAcc, DAcc);
        {_, undefined} ->
            items_change_(Pos - 1, OGoodsDict, NGoodsDict, CAcc, [Pos | DAcc]);
        {_, Goods} ->
            items_change_(Pos - 1, OGoodsDict, NGoodsDict, [Goods | CAcc], DAcc)
    end.

%% @doc 划分道具
classify(Items) ->
    classify(Items, [], []).

classify([], ItemAcc, EquipAcc) ->
    [{?BAG_ID_ITEM, ItemAcc}, {?BAG_ID_DRAGON, EquipAcc}];
classify([Item | T], ItemAcc, EquipAcc) when is_tuple(Item) -> %% {ID, Num, ...}
    GID = erlang:element(1, Item),
    case get_cate(GID) of
        ?GOODS_CATE_ITEM -> classify(T, [Item | ItemAcc], EquipAcc);
        ?GOODS_CATE_EQUIP -> classify(T, [Item | ItemAcc], EquipAcc);
        ?GOODS_CATE_DRAGON -> classify(T, ItemAcc, [Item | EquipAcc]);
        _ -> classify(T, ItemAcc, EquipAcc)
    end;
classify([#{id := GID} = Item | T], ItemAcc, EquipAcc) ->
    case get_cate(GID) of
        ?GOODS_CATE_ITEM -> classify(T, [Item | ItemAcc], EquipAcc);
        ?GOODS_CATE_EQUIP -> classify(T, [Item | ItemAcc], EquipAcc);
        ?GOODS_CATE_DRAGON -> classify(T, ItemAcc, [Item | EquipAcc]);
        _ -> classify(T, ItemAcc, EquipAcc)
    end.

%% @doc 物品所需空间
occupy_room(Items) ->
    occupy_room(Items, 0).

occupy_room([], Acc) ->
    Acc;
occupy_room([Item | T], Acc) when is_tuple(Item) -> %% {ID, Num, ...}
    GID = erlang:element(1, Item),
    Num = erlang:element(2, Item),
    occupy_room(T, goods_room(GID, Num) + Acc);
occupy_room([#{id := GID, num := Num} | T], Acc) ->
    occupy_room(T, goods_room(GID, Num) + Acc).

goods_room(GID, Num) ->
    #{overlap := Overlap} = conf_goods:get(GID),
    erlang:ceil(Num / Overlap).

get_name(GID) ->
    #{name := Name} = conf_goods:get(GID),
    Name.

%% @doc 生成装备属性
gen_attr(Goods) ->
    #{id := Gid, attr := Attr, level := Level} = Goods,
    Conf = conf_goods:get(Gid),
    #{type := Type, sub_type := SubType} = Conf,
    Cate = get_cate(Type, SubType),
    if
        (Cate =:= ?GOODS_CATE_ITEM) orelse
            (Cate =:= ?GOODS_CATE_DRAGON andalso Level > 0) orelse
            (Cate =:= ?GOODS_CATE_EQUIP andalso Attr =/= []) orelse
            (SubType =:= ?GOODS_SUBTYPE_PARIS_SHOULDER andalso Attr =/= []) ->
            Goods;
        Cate =:= ?GOODS_CATE_DRAGON ->
            Goods#{level => 1};
        SubType =:= ?GOODS_SUBTYPE_CAREER_EQUIP ->
            Goods#{attr => gen_career_attr(Gid)};
        SubType =:= ?GOODS_SUBTYPE_FORGE_EQUIP ->
            Goods#{attr => gen_forge_attr(Gid)};
        SubType =:= ?GOODS_SUBTYPE_PARIS_SHOULDER ->
            ConfShoulder = conf_paris_shoulder:get(Gid),
            #{lv := SParis, attr := SAttr} = ConfShoulder,
            Goods#{paris => SParis, attr => SAttr};
        true ->
            Goods#{attr => []}
    end.

gen_career_attr(Gid) ->
    Conf = conf_equip_career_attr:get(Gid),
    #{attr_num := AttrNum, attr_list := AttrList} = Conf,
    List = util:rand_by_weight(AttrList, 3, AttrNum),
    lists:sort([{K, V} || {K, V, _} <- List]).

gen_forge_attr(Gid) ->
    Conf = conf_equip_forge_attr:get(Gid),
    #{attr_num := AttrNum, attr_list := AttrList} = Conf,
    {Num, _} = util:rand_by_weight(AttrNum, 2),
    List = util:rand_by_weight(AttrList, 3, Num),
    lists:sort([{K, util:rand(L, H)} || {K, {L, H}, _} <- List]).

%% @doc 是否装备
is_equip(GID) ->
    get_cate(GID) =:= ?GOODS_CATE_EQUIP.

%% @doc 是否门派（职业）装备
is_career_equip(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_EQUIP, ?GOODS_SUBTYPE_CAREER_EQUIP).

%% @doc 是否打造装备
is_forge_equip(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_EQUIP, ?GOODS_SUBTYPE_FORGE_EQUIP).

%% @doc 是否重楼装备
is_paris_equip(#{id := Gid, paris := Paris}) ->
    is_forge_equip(Gid) andalso Paris > 0.

is_channel_equip(GID) ->
    conf_channel_equip:get(GID) =/= undefined.

%% @doc 是否时装 career 和 子类型一致
is_fashion(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_FASHION).

is_title(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_TITLE).

is_growup_skin(GID, ID) ->
    goods_of_type(GID, ?GOODS_TYPE_GROWUP_SKIN, ID).

is_stone(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_MATERIAL, ?GOODS_SUBTYPE_STONE).

exists(Gid) ->
    conf_goods:get(Gid) =/= undefined.

%% @doc 是否珍兽蛋
is_pet_egg(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_PET_EGG).

is_pet_skill_item(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_MATERIAL, ?GOODS_SUBTYPE_PET_REFRESH).

is_role_skill_item(GID) ->
    goods_of_type(GID, ?GOODS_TYPE_MATERIAL, ?GOODS_SUBTYPE_ROLE_SKILL).

get_cate(GID) ->
    case conf_goods:get(GID) of
        #{type := Type, sub_type := SubType} ->
            get_cate(Type, SubType);
        _ ->
            ?GOODS_CATE_UNKNOWN
    end.

get_cate(Type, SubType) ->
    case conf_goods_cate:get({Type, SubType}) of
        #{category := Cate} ->
            Cate;
        _ ->
            case conf_goods_cate:get({Type, 0}) of
                #{category := Cate} ->
                    Cate;
                _ ->
                    ?GOODS_CATE_ITEM
            end
    end.

goods_of_type(GID, Type) ->
    case conf_goods:get(GID) of
        #{type := Type} ->
            true;
        _ ->
            false
    end.

goods_of_type(GID, Type, SubType) ->
    case conf_goods:get(GID) of
        #{type := Type, sub_type := SubType} ->
            true;
        _ ->
            false
    end.

check_get_cell_item(RoleID, BagID, Pos) ->
    Item = lib_role_goods:get_cell_item(RoleID, BagID, Pos),
    Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    Item.

%% @doc 是否有限时物品
has_limit_item(RoleID, Material) ->
    Fun = fun(#{limit := Limit}) -> Limit > 0 end,
    check_limit_item(RoleID, Fun, Material).

%% @doc 是否有绑定物品
has_bind_item(RoleID, Material) ->
    Fun = fun(#{bind := Bind}) -> Bind > 0 end,
    check_limit_item(RoleID, Fun, Material).

check_limit_item(RoleID, Fun, Material) ->
    Items = lib_role_goods:bag_statics(RoleID, ?BAG_ID_ITEM),
    has_limit_item_(Material, Fun, Items).

has_limit_item_([], _F, _Items) ->
    false;
has_limit_item_([{ItemID, _} | T], F, Items) ->
    case util:dict_find(ItemID, Items) of
        #{} = Goods ->
            case F(Goods) of
                true -> true;
                _ -> has_limit_item_(T, F, Items)
            end;
        _ ->
            has_limit_item_(T, F, Items)
    end.
