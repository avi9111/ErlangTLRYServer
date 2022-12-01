%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     物品 [仅操作背包的函数]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_goods_base).
-author("Ryuu").

-include("goods.hrl").
-include("ret_code.hrl").

-export([
    get_bag/2,
    set_bag/3,
    init_bags/2,
    get_bag_room/2,
    add_bag_items/4,
    check_get_bag/2,
    del_bag_items/5,
    get_goods_list/1,
    clean_bag_items/3,
    clear_bag_items/3,
    empty_bag_items/3,
    extend_bag_cell/4,
    bag_item_statics/2,
    get_bag_cell_item/3,
    del_bag_cell_items/4,
    get_bag_cell_items/3,
    set_bag_cell_items/4,
    is_bag_room_enough/3,
    transfer_bag_items/5,
    is_bag_items_enough/4,
    get_bag_items_by_ids/3,
    is_bag_cell_items_enough/3
]).

-export([
    get_bag_list/1,
    make_bag_dict/1
]).

%% API
-export([
    get_room/1,
    add_items/3,
    del_items/4,
    init_items/1,
    clean_items/2,
    clear_items/2,
    empty_items/2,
    extend_cell/3,
    item_statics/1,
    get_cell_item/2,
    is_items_enough/3
]).

%% cell [按格子]
-export([
    del_cell_items/3,
    is_cell_items_enough/2
]).

add_bag_items(Bags, BagID, Items, OpType) ->
    set_bag(BagID, add_items(check_get_bag(BagID, Bags), Items, OpType), Bags).

del_bag_items(Bags, BagID, Items, OpType, Opt) ->
    set_bag(BagID, del_items(check_get_bag(BagID, Bags), Items, OpType, Opt), Bags).

is_bag_items_enough(Bags, BagID, Items, Opt) ->
    is_items_enough(check_get_bag(BagID, Bags), Items, Opt).

del_bag_cell_items(Bags, BagID, Items, OpType) ->
    set_bag(BagID, del_cell_items(check_get_bag(BagID, Bags), Items, OpType), Bags).

set_bag_cell_items(Bags, BagID, Items, OpType) ->
    set_bag(BagID, set_cell_items(check_get_bag(BagID, Bags), Items, OpType), Bags).

is_bag_cell_items_enough(Bags, BagID, Items) ->
    is_cell_items_enough(check_get_bag(BagID, Bags), Items).

get_bag_cell_item(Bags, BagID, Pos) ->
    get_cell_item(check_get_bag(BagID, Bags), Pos).

get_bag_cell_items(Bags, BagID, Poses) ->
    get_cell_items(check_get_bag(BagID, Bags), Poses).

get_bag_items_by_ids(Bags, BagID, Types) ->
    get_items_by_ids(check_get_bag(BagID, Bags), Types).

empty_bag_items(Bags, BagID, OpType) ->
    set_bag(BagID, empty_items(check_get_bag(BagID, Bags), OpType), Bags).

clean_bag_items(Bags, BagID, OpType) ->
    set_bag(BagID, clean_items(check_get_bag(BagID, Bags), OpType), Bags).

clear_bag_items(Bags, BagID, OpType) ->
    set_bag(BagID, clear_items(check_get_bag(BagID, Bags), OpType), Bags).

extend_bag_cell(Bags, BagID, NewNum, OpType) ->
    set_bag(BagID, extend_cell(check_get_bag(BagID, Bags), NewNum, OpType), Bags).

bag_item_statics(Bags, BagID) ->
    item_statics(check_get_bag(BagID, Bags)).

is_bag_room_enough(Bags, BagID, Num) ->
    is_room_enough(check_get_bag(BagID, Bags), Num).

get_bag_room(Bags, BagID) ->
    get_room(check_get_bag(BagID, Bags)).

transfer_bag_items(RoleBag, SrcID, DstID, Cell, OpType) ->
    SrcID =/= DstID orelse erlang:throw({error, ?RC_GOODS_TRANSFER_SAME_BAG}),
    SrcBag = check_get_bag(SrcID, RoleBag),
    DstBag = check_get_bag(DstID, RoleBag),
    Opts = #{add => true},
    case Cell > 0 of
        true -> Cells = [Cell];
        _ -> Cells = dict:fetch_keys(maps:get(goods, SrcBag))
    end,
    Now = time:unixtime(),
    {NSrcBag, NDstBag} = transfer_items(Cells, SrcBag, DstBag, Opts, OpType, Now),
    set_bag(DstID, NDstBag, set_bag(SrcID, NSrcBag, RoleBag)).

%% =============================================================================
%% 背包操作
%% 注意：
%% 1. 物品必须在外层合并，必须传入背包数据
%% 2. 方法可能抛出异常，必须在外层判断是否足够
%% =============================================================================

%% @doc 初始化背包
init_bags(Rows, BagIDs) ->
    init_bags(Rows, dict:new(), sets:from_list(BagIDs)).

init_bags([], Bags, Acc) ->
    init_empty_bags(sets:to_list(Acc), Bags);
init_bags([[BagID, Name, DbGoods, CellNum] | T], Bags, Acc) ->
    GoodsDict = init_items(type:convert_db_field(list, DbGoods, [])),
    Bag = ?bag#{id => BagID, name => Name, goods => GoodsDict, cell_num => CellNum},
    init_bags(T, dict:store(BagID, Bag, Bags), sets:del_element(BagID, Acc)).

init_empty_bags([], Bags) ->
    Bags;
init_empty_bags([BagID | T], Bags) ->
    Conf = conf_bag:get(BagID),
    #{init_size := Size, name := Name} = Conf,
    Bag = ?bag#{id => BagID, name => Name, cell_num => Size},
    init_empty_bags(T, dict:store(BagID, Bag, Bags)).

init_items(Items) ->
    init_items_(Items, dict:new()).

init_items_([], Acc) ->
    Acc;
init_items_([Goods0 | T], Acc) ->
    #{pos := Pos} = Goods0,
    Goods = maps:merge(?bag_goods, Goods0),
    init_items_(T, dict:store(Pos, Goods, Acc)).

%% @doc 添加物品
add_items(RoleBag, Items, OpType) ->
    add_items_(Items, RoleBag, OpType, time:unixtime()).

add_items_([], RoleBag, _OpType, _Now) ->
    RoleBag;
add_items_([Goods | T], RoleBag, OpType, Now) ->
    GoodsInfo = convert_goods_basic(Goods),
    {ok, NewBag} = add_item(GoodsInfo, RoleBag, OpType, Now),
    add_items_(T, NewBag, OpType, Now).

add_item(GoodsInfo, RoleBag, OpType, Now) ->
    #{id := Gid, num := Num} = GoodsInfo,
    ConfGoods = conf_goods:get(Gid),
    #{overlap := Overlap} = ConfGoods,
    #{goods := GoodsDict, logs := Logs, cell_num := MaxNum} = RoleBag,
    {NotFull, Empty, _NotEmpty} = split_for_add(MaxNum, GoodsDict, Overlap, GoodsInfo),
    NotFull =:= [] andalso Empty =:= [] andalso erlang:throw({error, ?RC_STORAGE_NOT_ENOUGH}),
    NewGoodsDict = add_item_(NotFull, Empty, GoodsInfo, Overlap, GoodsDict),
    Log = ?bag_op#{op => ?BAG_OP_ADD, gid => Gid, num => Num, time => Now, opt => OpType},
    NewBag = RoleBag#{goods => NewGoodsDict, logs => [Log | Logs]},
    {ok, NewBag}.

split_for_add(Pos, GoodsDict, Overlap, GoodsInfo) ->
    split_for_add(Pos, GoodsDict, Overlap, GoodsInfo, [], [], dict:new()).

split_for_add(0, _GoodsDict, _Overlap, _GoodsInfo, NotFullAcc, EmptyAcc, NotEmpty) ->
    {sort_for_add(NotFullAcc), EmptyAcc, NotEmpty};
split_for_add(Pos, GoodsDict, Overlap, GoodsInfo, NotFullAcc, EmptyAcc, NotEmpty) ->
    case util:dict_find(Pos, GoodsDict) of
        #{num := GNum} = Goods ->
            case GNum < Overlap andalso can_merge(Goods, GoodsInfo) of
                true ->
                    split_for_add(Pos - 1, GoodsDict, Overlap, GoodsInfo, [Goods | NotFullAcc], EmptyAcc, NotEmpty);
                _ ->
                    split_for_add(Pos - 1, GoodsDict, Overlap, GoodsInfo, NotFullAcc, EmptyAcc, dict:store(Pos, Goods, NotEmpty))
            end;
        _ ->
            split_for_add(Pos - 1, GoodsDict, Overlap, GoodsInfo, NotFullAcc, [Pos | EmptyAcc], NotEmpty)
    end.

sort_for_add(GoodsList) ->
    GoodsList.

add_item_(_NotFull, _Empty, #{num := 0}, _Overlap, Acc) ->
    Acc;
add_item_([], [], _GoodsInfo, _Overlap, _Acc) ->
    erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM});
add_item_([Goods | T], Empty, #{num := Num} = GoodsInfo, Overlap, Acc) ->
    #{pos := Pos, num := CurNum} = Goods,
    AddNum = erlang:min(Overlap - CurNum, Num),
    NewGoods = Goods#{num => CurNum + AddNum},
    add_item_(T, Empty, GoodsInfo#{num => Num - AddNum}, Overlap, dict:store(Pos, NewGoods, Acc));
add_item_([], [Pos | T], #{num := Num} = GoodsInfo, Overlap, Acc) ->
    GNum = erlang:min(Overlap, Num),
    Goods = maps:merge(?bag_goods, GoodsInfo#{pos => Pos, num => GNum}),
    add_item_([], T, GoodsInfo#{num => Num - GNum}, Overlap, dict:store(Pos, Goods, Acc)).

%% @doc 删除物品 [按类型]
del_items(RoleBag, Items, OpType, Opt) ->
    Items1 = merge_items(Items),
    del_items_(Items1, RoleBag, OpType, Opt, time:unixtime()).

del_items_([], RoleBag, _OpType, _Opt, _Now) ->
    RoleBag;
del_items_([{Gid, Num} | T], RoleBag, OpType, Opt, Now) ->
    {ok, NewBag} = del_item(RoleBag, Gid, Num, OpType, Opt, Now),
    del_items_(T, NewBag, OpType, Opt, Now).

del_item(RoleBag, Gid, Num, OpType, Opt, Now) ->
    #{goods := GoodsDict, logs := Logs, cell_num := MaxNum} = RoleBag,
    Exists = split_for_del(MaxNum, GoodsDict, Gid, Opt, Now, []),
    NewGoodsDict = del_item_(Exists, Num, GoodsDict),
    Log = ?bag_op#{op => ?BAG_OP_DEL, gid => Gid, num => Num, time => Now, opt => OpType},
    NewBag = RoleBag#{goods => NewGoodsDict, logs => [Log | Logs]},
    {ok, NewBag}.

split_for_del(0, _GoodsDict, _GID, _Opt, _Now, Acc) ->
    sort_for_del(Acc);
split_for_del(Pos, GoodsDict, Gid, Opt, Now, Acc) ->
    case util:dict_find(Pos, GoodsDict) of
        #{id := Gid, expire := Expire} = Goods when Expire =:= 0 orelse Expire > Now ->
            case satisfy_opt(Goods, Opt) of
                true ->
                    split_for_del(Pos - 1, GoodsDict, Gid, Opt, Now, [Goods | Acc]);
                _ ->
                    split_for_del(Pos - 1, GoodsDict, Gid, Opt, Now, Acc)
            end;
        _ ->
            split_for_del(Pos - 1, GoodsDict, Gid, Opt, Now, Acc)
    end.

%% 扣除优先级：限时、绑定、不绑定 耗时。。。
sort_for_del(GoodsList) ->
    Fun = fun(Goods1, Goods2) ->
        #{expire := Exp1, bind := Bind1, pos := Pos1} = Goods1,
        #{expire := Exp2, bind := Bind2, pos := Pos2} = Goods2,
        if
            Exp1 > 0 andalso Exp2 > 0 -> Exp1 < Exp2;
            Exp1 > 0 -> true;
            Exp2 > 0 -> false;
            Bind1 > 0 -> true;
            Bind2 > 0 -> false;
            Pos1 > Pos2 -> true;
            true -> false
        end
    end,
    lists:sort(Fun, GoodsList).

del_item_(_, 0, GoodsDict) ->
    GoodsDict;
del_item_([], _Num, _GoodsDict) ->
    erlang:throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH});
del_item_([Goods | T], Num, GoodsDict) ->
    #{pos := Pos, num := CNum} = Goods,
    case Num >= CNum of
        true ->
            del_item_(T, Num - CNum, dict:erase(Pos, GoodsDict));
        _ ->
            del_item_(T, 0, dict:store(Pos, Goods#{num => CNum - Num}, GoodsDict))
    end.

%% @doc 判断物品是否足够
is_items_enough(RoleBag, Items, Opt) ->
    Now = time:unixtime(),
    Items1 = merge_items(Items),
    #{goods := GoodsDict} = RoleBag,
    is_items_enough_(Items1, util:dict_values(GoodsDict), Opt, Now).

is_items_enough_([], _GoodsList, _Opt, _Now) ->
    true;
is_items_enough_([{Gid, Num} | T], GoodsList, Opt, Now) ->
    case is_item_enough_(GoodsList, Gid, Num, Opt, Now, []) of
        {true, GoodsList1} ->
            is_items_enough_(T, GoodsList1, Opt, Now);
        _ ->
            false
    end.

is_item_enough_(_, _GID, 0, _Opt, _Now, Acc) ->
    {true, Acc};
is_item_enough_([], _GID, _Num, _Opt, _Now, _Acc) ->
    false;
is_item_enough_([Goods | T], Gid, Num, Opt, Now, Acc) ->
    case satisfy_opt(Goods, Opt)
        andalso Goods of
        #{expire := Expire} when Expire =/= 0 andalso Expire =< Now ->
            is_item_enough_(T, Gid, Num, Opt, Now, Acc);
        #{id := Gid, num := CNum} when CNum >= Num ->
            {true, T ++ Acc};
        #{id := Gid, num := CNum} ->
            is_item_enough_(T, Gid, Num - CNum, Opt, Now, Acc);
        _ ->
            is_item_enough_(T, Gid, Num, Opt, Now, [Goods | Acc])
    end.

%% @doc 删除物品 [按格子]
del_cell_items(RoleBag, Items, OpType) ->
    Now = time:unixtime(),
    Items1 = merge_items(Items),
    del_cell_items_(Items1, RoleBag, OpType, Now).

del_cell_items_([], RoleBag, _OpType, _Now) ->
    RoleBag;
del_cell_items_([{Pos, Num} | T], RoleBag, OpType, Now) ->
    {ok, NewBag} = del_cell_item(RoleBag, Pos, Num, OpType, Now),
    del_cell_items_(T, NewBag, OpType, Now).

del_cell_item(RoleBag, Pos, Num, OpType, Now) ->
    #{goods := GoodsDict, logs := Logs} = RoleBag,
    {NewGoodsDict, Gid} = del_cell_item_(Pos, GoodsDict, Num, Now),
    Log = ?bag_op#{op => ?BAG_OP_DEL, gid => Gid, num => Num, time => Now, opt => OpType},
    NewBag = RoleBag#{goods => NewGoodsDict, logs => [Log | Logs]},
    {ok, NewBag}.

del_cell_item_(Pos, GoodsDict, Num, Now) when is_integer(Pos) ->
    del_cell_item_(util:dict_find(Pos, GoodsDict), GoodsDict, Num, Now);
del_cell_item_(#{expire := Expire}, _GoodsDict, _Num, Now) when Expire =/= 0 andalso Expire =< Now ->
    erlang:throw({error, ?RC_GOODS_TIME_EXPIRED});
del_cell_item_(#{pos := Pos, num := CNum, id := Gid} = Goods, GoodsDict, Num, _Now) when CNum > Num ->
    {dict:store(Pos, Goods#{num => CNum - Num}, GoodsDict), Gid};
del_cell_item_(#{pos := Pos, num := CNum, id := Gid}, GoodsDict, Num, _Now) when CNum =:= Num ->
    {dict:erase(Pos, GoodsDict), Gid};
del_cell_item_(#{}, _GoodsDict, _Num, _Now) ->
    erlang:throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH});
del_cell_item_(_, _GoodsDict, _Num, _Now) ->
    erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}).

%% @doc 删除物品 [按格子]
set_cell_items(RoleBag, Items, OpType) ->
    Now = time:unixtime(),
    set_cell_items_(Items, RoleBag, OpType, Now).

set_cell_items_([], RoleBag, _OpType, _Now) ->
    RoleBag;
set_cell_items_([Item | T], RoleBag, OpType, Now) ->
    {ok, NewBag} = set_cell_item(RoleBag, Item, OpType, Now),
    del_cell_items_(T, NewBag, OpType, Now).

set_cell_item(RoleBag, Goods, OpType, Now) ->
    #{goods := GoodsDict, logs := Logs} = RoleBag,
    #{pos := Pos, id := Gid, num := Num} = Goods,
    Pos > 0 andalso Gid > 0 andalso Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    NewGoodsDict = dict:store(Pos, Goods, GoodsDict),
    Log = ?bag_op#{op => ?BAG_OP_SET, gid => Gid, num => Num, time => Now, opt => OpType},
    NewBag = RoleBag#{goods => NewGoodsDict, logs => [Log | Logs]},
    {ok, NewBag}.

%% @doc 判断物品是否足够
is_cell_items_enough(RoleBag, Items) ->
    Now = time:unixtime(),
    Items1 = merge_items(Items),
    #{goods := GoodsDict} = RoleBag,
    is_cell_items_enough_(Items1, GoodsDict, Now).

is_cell_items_enough_([], _GoodsDict, _Now) ->
    true;
is_cell_items_enough_([{Pos, Num} | T], GoodsDict, Now) ->
    case util:dict_find(Pos, GoodsDict) of
        #{expire := Expire} when Expire =/= 0 andalso Expire =< Now ->
            false;
        #{num := CNum} when CNum >= Num ->
            is_cell_items_enough_(T, GoodsDict, Now);
        _ ->
            false
    end.

%% @doc 获取指定格子的物品，不存在返回 undefined
get_cell_item(RoleBag, Pos) ->
    #{goods := GoodsDict} = RoleBag,
    util:dict_find(Pos, GoodsDict).

%% @doc 获取指定格子的物品，需检查是否存在 undefined 的物品
get_cell_items(RoleBag, Poses) ->
    #{goods := GoodsDict} = RoleBag,
    get_cell_items_(Poses, GoodsDict, []).

get_cell_items_([], _GoodsDict, Acc) ->
    Acc;
get_cell_items_([Pos | T], GoodsDict, Acc) ->
    Goods = util:dict_find(Pos, GoodsDict),
    get_cell_items_(T, GoodsDict, [Goods | Acc]).

get_items_by_ids(RoleBag, Types) ->
    #{goods := GoodsDict, cell_num := MaxNum} = RoleBag,
    get_items_by_ids_(MaxNum, GoodsDict, Types, []).

get_items_by_ids_(0, _GoodsDict, _IDList, Acc) ->
    Acc;
get_items_by_ids_(Pos, GoodsDict, IDList, Acc) ->
    case util:dict_find(Pos, GoodsDict) of
        #{id := Gid} = Goods ->
            case lists:member(Gid, IDList) of
                true ->
                    get_items_by_ids_(Pos - 1, GoodsDict, IDList, [Goods | Acc]);
                _ ->
                    get_items_by_ids_(Pos - 1, GoodsDict, IDList, Acc)
            end;
        _ ->
            get_items_by_ids_(Pos - 1, GoodsDict, IDList, Acc)
    end.

%% @doc 清理过期物品
clear_items(RoleBag, OpType) ->
    #{goods := GoodsDict, cell_num := MaxNum, logs := Logs} = RoleBag,
    {NewGoodsDict, NewLogs} = del_expire_items(MaxNum, GoodsDict, OpType, time:unixtime(), Logs),
    RoleBag#{goods => NewGoodsDict, logs => NewLogs}.

del_expire_items(0, GoodsDict, _OpType, _Now, Logs) ->
    {GoodsDict, Logs};
del_expire_items(Pos, GoodsDict, OpType, Now, Logs) ->
    case util:dict_find(Pos, GoodsDict) of
        #{expire := Expire, id := Gid, num := Num} when Expire =/= 0 andalso Expire =< Now ->
            Log = ?bag_op#{op => ?BAG_OP_CLE, gid => Gid, num => Num, time => Now, opt => OpType},
            del_expire_items(Pos - 1, dict:erase(Pos, GoodsDict), OpType, Now, [Log | Logs]);
        _ ->
            del_expire_items(Pos - 1, GoodsDict, OpType, Now, Logs)
    end.

%% @doc 整理背包 合并物品
clean_items(RoleBag, OpType) ->
    Now = time:unixtime(),
    #{goods := GoodsDict, logs := Logs} = RoleBag,
    SortList = sort_for_clean(util:dict_values(GoodsDict)),
    Log = ?bag_op#{op => ?BAG_OP_CLN, time => Now, opt => OpType},
    NewGoodsDict = make_goods_dict(merge_for_clean_(SortList, 1, [])),
    RoleBag#{goods => NewGoodsDict, logs => [Log | Logs]}.

sort_for_clean(GoodsList) ->
    Fun = fun(GoodsA, GoodsB) ->
        #{id := GidA, bind := BindA} = GoodsA,
        #{id := GidB, bind := BindB} = GoodsB,
        util:cmp([{GidB, GidA}, {BindB, BindA}])
    end,
    lists:sort(Fun, GoodsList).

merge_for_clean_([], _, Acc) ->
    Acc;
merge_for_clean_([Goods], Pos, Acc) ->
    [Goods#{pos => Pos} | Acc];
merge_for_clean_([GoodsA | [GoodsB | T] = L], Pos, Acc) ->
    #{id := GidA, num := NumA} = GoodsA,
    #{num := NumB} = GoodsB,
    #{overlap := Overlap} = conf_goods:get(GidA),
    case can_merge(GoodsA, GoodsB) of
        true when NumA + NumB < Overlap ->
            merge_for_clean_([GoodsA#{num => NumA + NumB} | T], Pos, Acc);
        true when NumA + NumB > Overlap ->
            merge_for_clean_([GoodsB#{num => NumA + NumB - Overlap} | T], Pos + 1, [GoodsA#{num => Overlap, pos => Pos} | Acc]);
        true ->
            merge_for_clean_(T, Pos + 1, [GoodsA#{num => Overlap, pos => Pos} | Acc]);
        _ ->
            merge_for_clean_(L, Pos + 1, [GoodsA#{pos => Pos} | Acc])
    end.

%% @doc 清空背包 [GM]
empty_items(RoleBag, OpType) ->
    Now = time:unixtime(),
    #{logs := Logs} = RoleBag,
    Log = ?bag_op#{op => ?BAG_OP_EPT, time => Now, opt => OpType},
    RoleBag#{goods => dict:new(), logs => [Log | Logs]}.

%% @doc 扩充背包
extend_cell(RoleBag, NewNum, OpType) ->
    Now = time:unixtime(),
    #{logs := Logs} = RoleBag,
    Log = ?bag_op#{op => ?BAG_OP_EXT, num => NewNum, time => Now, opt => OpType},
    RoleBag#{cell_num => NewNum, logs => [Log | Logs]}.

%% @doc 背包空间是否足够
is_room_enough(RoleBag, Num) ->
    #{goods := GoodsDict, cell_num := MaxNum} = RoleBag,
    Num + dict:size(GoodsDict) =< MaxNum.

get_room(RoleBag) ->
    #{goods := GoodsDict, cell_num := MaxNum} = RoleBag,
    erlang:max(MaxNum - dict:size(GoodsDict), 0).

%% @doc 背包数据
item_statics(RoleBag) ->
    Now = time:unixtime(),
    #{goods := GoodsDict, cell_num := MaxNum} = RoleBag,
    item_statics(MaxNum, GoodsDict, Now, dict:new()).

item_statics(0, _GoodsDict, _Now, Acc) ->
    Acc;
item_statics(Pos, GoodsDict, Now, Acc) ->
    case util:dict_find(Pos, GoodsDict) of
        #{expire := Expire} when Expire =/= 0 andalso Expire =< Now ->
            item_statics(Pos - 1, GoodsDict, Now, Acc);
        #{id := Gid, expire := Expire, num := Num} when Expire > 0 -> %% 有时间限制物品不区分是否绑定
            item_statics(Pos - 1, GoodsDict, Now, item_static(Acc, limit, Gid, Num));
        #{id := Gid, bind := ?GOODS_BIND, num := Num} ->
            item_statics(Pos - 1, GoodsDict, Now, item_static(Acc, bind, Gid, Num));
        #{id := Gid, num := Num} ->
            item_statics(Pos - 1, GoodsDict, Now, item_static(Acc, unbind, Gid, Num));
        _ ->
            item_statics(Pos - 1, GoodsDict, Now, Acc)
    end.

item_static(Dict, Type, Gid, Num) ->
    Item = util:dict_find(Gid, Dict, ?goods_static#{id => Gid}),
    #{num := ONum} = Item,
    NNum = ONum + Num,
    OTNum = maps:get(Type, Item),
    NTNum = OTNum + Num,
    NItem = maps:put(Type, NTNum, Item#{num => NNum}),
    dict:store(Gid, NItem, Dict).

transfer_items([], SrcBag, DstBag, _Opts, _OpType, _Now) ->
    {SrcBag, DstBag};
transfer_items([Pos | T], SrcBag, DstBag, Opts, OpType, Now) ->
    Item = get_cell_item(SrcBag, Pos),
    Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := Gid, num := Num} = Item,
    #{overlap := Overlap} = conf_goods:get(Gid),
    #{goods := SGoodsDict, logs := SLogs} = SrcBag,
    #{goods := DGoodsDict, logs := DLogs, cell_num := CellNum} = DstBag,
    {NSGoodsDict, NDGoodsDict, LeftNum} = transfer_items2(CellNum, SGoodsDict, DGoodsDict, Item, Overlap, Opts, []),
    Log = ?bag_op#{gid => Gid, num => Num - LeftNum, time => Now, opt => OpType},
    NewSrcBag = SrcBag#{goods => NSGoodsDict, logs => [Log#{op => ?BAG_OP_OUT} | SLogs]},
    NewDstBag = DstBag#{goods => NDGoodsDict, logs => [Log#{op => ?BAG_OP_IN} | DLogs]},
    transfer_items(T, NewSrcBag, NewDstBag, Opts, OpType, Now).

transfer_items2(0, SGoodsDict, DGoodsDict, Item, _Overlap, Opts, EmptyAcc) ->
    case maps:get(add, Opts, false) of
        true when EmptyAcc =:= [] ->
            erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM});
        true ->
            {dict:erase(maps:get(pos, Item), SGoodsDict),
                dict:store(hd(EmptyAcc), Item#{pos => hd(EmptyAcc)}, DGoodsDict), 0};
        _ ->
            {dict:store(maps:get(pos, Item), Item, SGoodsDict), DGoodsDict, maps:get(num, Item)}
    end;
transfer_items2(Pos, SGoodsDict, DGoodsDict, Item, Overlap, Opts, EmptyAcc) ->
    case util:dict_find(Pos, DGoodsDict) of
        #{num := GNum} = Goods ->
            #{num := Num, pos := IPos} = Item,
            case can_merge(Goods, Item) of
                true when GNum + Num > Overlap ->
                    transfer_items2(Pos - 1, SGoodsDict,
                        dict:store(Pos, Goods#{num => Overlap}, DGoodsDict),
                        Item#{num => GNum + Num - Overlap}, Overlap, Opts, EmptyAcc);
                true ->
                    {dict:erase(IPos, SGoodsDict),
                        dict:store(Pos, Goods#{num => GNum + Num}, DGoodsDict), 0};
                _ ->
                    transfer_items2(Pos - 1, SGoodsDict, DGoodsDict, Item, Overlap, Opts, EmptyAcc)
            end;
        _ ->
            transfer_items2(Pos - 1, SGoodsDict, DGoodsDict, Item, Overlap, Opts, [Pos | EmptyAcc])
    end.

%% -----------------------------------------------------------------------------

check_get_bag(BagID, Bags) ->
    Bag = get_bag(BagID, Bags),
    Bag =/= undefined orelse erlang:throw({error, ?RC_GOODS_BAG_NOT_FOUND}),
    Bag.

get_bag(BagID, #{bags := Bags}) ->
    get_bag(BagID, Bags);
get_bag(BagID, Bags) ->
    util:dict_find(BagID, Bags).

set_bag(BagID, Bag, #{bags := Bags} = RoleBag) ->
    RoleBag#{bags => set_bag(BagID, Bag, Bags)};
set_bag(BagID, Bag, Bags) ->
    dict:store(BagID, Bag, Bags).

get_bag_list(#{bags := Bags}) ->
    get_bag_list(Bags);
get_bag_list(Bags) when is_list(Bags) ->
    Bags;
get_bag_list(Bags) ->
    util:dict_values(Bags).

make_bag_dict(Bags) when is_list(Bags) ->
    dict:from_list([{BagID, Bag} || #{id := BagID} = Bag <- Bags]).

get_goods_list(GoodsList) when is_list(GoodsList) ->
    GoodsList;
get_goods_list(GoodsDict) ->
    util:dict_values(GoodsDict).

make_goods_dict(List) ->
    dict:from_list([{Pos, Goods} || #{pos := Pos} = Goods <- List]).

%% -----------------------------------------------------------------------------

%% @doc 转换物品，所有定义的物品数据必须转成 ?goods_basic#{}
convert_goods_basic({Gid, Num}) ->
    convert_goods_basic(?goods_basic#{id => Gid, num => Num});
convert_goods_basic({Gid, Num, Bind}) -> %% 不推荐
    convert_goods_basic(?goods_basic#{id => Gid, num => Num, bind => Bind});
convert_goods_basic({Gid, Num, Bind, Expire}) -> %% 不推荐
    convert_goods_basic(?goods_basic#{id => Gid, num => Num, bind => Bind, expire => Expire});
convert_goods_basic(#{expire := ExpTime} = GoodsBasic) when is_map(GoodsBasic) ->
    lib_goods_util:gen_attr(
        maps:merge(?goods_basic, GoodsBasic#{expire => lib_goods_util:expire_time(ExpTime)})
    );
convert_goods_basic(_) ->
    erlang:throw({error, ?RC_GOODS_NOT_SUPPORT_INFO}).

%% @doc 合并传入物品
merge_items(List) ->
    merge_items(List, []).

merge_items([], List) ->
    List;
merge_items([{Gid, Num} | T], List) ->
    NewList = util:prop_increase(Gid, List, Num),
    merge_items(T, NewList).

can_merge(Goods, GoodsInfo) ->
    map:equal(Goods, GoodsInfo, [id, expire, bind, attr, paris, sell_time, sell_times, effect, level, exp, extra]).

satisfy_opt(Goods, Opt) ->
    #{bind := Bind, expire := Expire} = Goods,
    if
        Bind =:= ?GOODS_BIND andalso Opt band ?GOODS_OPT_B =/= ?GOODS_OPT_B ->
            false;
        Bind =:= ?GOODS_UNBIND andalso Opt band ?GOODS_OPT_N =/= ?GOODS_OPT_N ->
            false;
        Expire > 0 andalso Opt band ?GOODS_OPT_T =/= ?GOODS_OPT_T ->
            false;
        true ->
            true
    end.
