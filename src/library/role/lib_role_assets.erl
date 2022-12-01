%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家财富操作统一接口
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_assets).
-author("Ryuu").

-include("role.hrl").
-include("goods.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_204.hrl").
-compile(export_all).
-export([
    do/3,
    add_items/3,
    fmt_items/1,
    get_items/2,
    mul_items/2,
    send_info/1,
    asset_item/1,
    cost_items/3,
    handle_info/2,
    valid_items/1,
    format_items/1,
    can_add_items/2,
    convert_items/1,
    async_add_items/3,
    is_items_enough/2,
    is_items_enough/3,
    merge_add_items/1,
    add_items_notify/3,
    merge_cost_items/1,
    cost_items_notify/3,
    cost_items_notify/4,
    check_items_enough/2,
    check_items_enough/3,
    check_can_add_items/2
]).

async_add_items(RoleID, Items, OpType) ->
    lib_role:mod_info(RoleID, ?MODULE, {add_items, Items, OpType}).

handle_info({add_items, Items, OpType}, RoleState) ->
    add_items_notify(RoleState, Items, OpType);
handle_info(_Info, _RoleState) ->
    ok.

do(20401, PS, _Req) ->
    send_info(PS);
do(20405, PS, #cs_assets_exchange{id = ID, val = Val}) ->
    exchange(PS, ID, Val);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 资产信息
send_info(PS) ->
    #role_state{assets = Assets, assets_his = AssetsHis} = PS,
    Fun1 = fun(K, V, Acc) -> [{lib_role_money:field_id(K), V} | Acc] end,
    Moneys1 = maps:fold(Fun1, [], Assets),
    Fun2 = fun(K, V, Acc) -> [{255 - lib_role_money:field_id(K), V} | Acc] end,
    Moneys2 = maps:fold(Fun2, Moneys1, AssetsHis),
    Rec = #sc_assets_info{moneys = Moneys2},
    {ok, Bin} = prot_msg:encode_msg(20402, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% @doc
exchange(PS, ID, Val) ->
    case catch check_exchange(PS, ID, Val) of
        {ok, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MONEY_EXC),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_MONEY_EXC),
            Rec = #sc_assets_exchange{id = ID, val = Val},
            {ok, Bin} = prot_msg:encode_msg(20406, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_exchange(PS, ID, Val) ->
    Conf = conf_money_exchange:get(ID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_ASSETS_NO_EXCHANGE_CONF}),
    Val > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{stype := SType, ttype := TType, ratio := Ratio} = Conf,
    Ratio > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    TVal = erlang:floor(Val * Ratio),
    Costs = [{SType, Val}],
    lib_role_assets:check_items_enough(PS, Costs),
    Rewards = [{TType, TVal}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    {ok, Costs, Rewards}.

%% -----------------------------------------------------------------------------
%% 物品判断
%% -----------------------------------------------------------------------------

%% @doc 通用判断物品、资源是否足够
is_items_enough(PS, Items) when is_list(Items) ->
    is_items_enough(PS, Items, []).

is_items_enough(PS, Items, Opts) when is_list(Items) ->
    case catch check_items_enough(PS, Items, Opts) of
        true -> true;
        _ -> false
    end.

%% @doc [异常]
check_items_enough(PS, Items) ->
    check_items_enough(PS, Items, []).

check_items_enough(PS, Items, Opts) ->
    NewItems = merge_cost_items(Items),
    check_items_enough_(NewItems, PS, Opts).

check_items_enough_([], _PS, _Opts) ->
    true;
check_items_enough_([Item | T], PS, Opts) ->
    case is_item_enough(Item, PS, Opts) of
        {true, _} ->
            check_items_enough_(T, PS, Opts);
        {false, Code} ->
            erlang:throw({error, Code})
    end.

%% @doc 注意：这里添加的类型必须有对应的cost_item/3
%%is_item_enough({?AST_EXP, Exp}, PS) ->
%%    {PS#role_state.exp >= Exp, ?RC_EXP_LIMIT};
is_item_enough({Type, Amount}, _PS, _Opts) when Amount < 0, ?AST_IS_NUMERIC(Type) ->
    {false, ?RC_INVALID_ARGS};
is_item_enough({Type, 0}, _PS, _Opts) when ?AST_IS_NUMERIC(Type) ->
    {true, ?RC_SUCCEED};
is_item_enough({?AST_EXP, Amount}, PS, _Opts) ->
    {lib_role_level:is_exp_enough(PS, Amount), ?RC_EXP_LIMIT};
is_item_enough({Type, Amount}, PS, _Opts) when ?AST_IS_MONEY(Type) ->
    {lib_role_money:is_enough_money(PS, Type, Amount), lib_role_money:ret_code(Type)};
is_item_enough({?AST_ITEM, GoodsList}, PS, Opts) ->
    {lib_role_goods:is_items_enough(PS, GoodsList, Opts), ?RC_GOODS_ITEM_NOT_ENOUGH};
is_item_enough({?AST_ITEM_C, GoodsList}, PS, _Opts) ->
    {lib_role_goods:is_cell_items_enough(PS, ?BAG_ID_ITEM, GoodsList), ?RC_GOODS_ITEM_NOT_ENOUGH};
is_item_enough({?AST_DRAGON_C, GoodsList}, PS, _Opts) ->
    {lib_role_goods:is_cell_items_enough(PS, ?BAG_ID_DRAGON, GoodsList), ?RC_GOODS_ITEM_NOT_ENOUGH};
is_item_enough({?AST_PET_C, List}, _PS, _Opts) ->
    {lib_role_pet:is_pets_enough(List), ?RC_PET_NOT_ENOUGH};
is_item_enough(_ItemType, _PS, _Opts) ->
    {false, ?RC_RES_NOT_ENOUGH}.

%% @doc 是否可以添加物品 [背包有格子限制, 数值类型上限]
can_add_items(PS, Items) ->
    case catch check_can_add_items(PS, Items) of
        true -> true;
        _ -> false
    end.

check_can_add_items(PS, Items0) ->
    Items = merge_add_items(Items0),
    can_add_items_(Items, PS).

can_add_items_([], _PS) ->
    true;
can_add_items_([Item | T], PS) ->
    case can_add_item(Item, PS) of
        true ->
            can_add_items_(T, PS);
        {_, Code} ->
            erlang:throw({error, Code})
    end.

can_add_item({Type, Amount}, PS) when ?AST_IS_MONEY(Type) ->
    Amount >= 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    lib_role_money:get_money(PS, Type) + Amount < ?INT32_MAX orelse erlang:throw({error, ?RC_MONEY_EXCEED}),
    true;
can_add_item({?AST_EXP, _Amount}, _PS) ->
    true;
can_add_item({?AST_ITEM, GoodsList}, PS) ->
    lib_role_goods:is_room_enough(PS#role_state.id, GoodsList) orelse erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM}),
    true;
can_add_item({?AST_PET, List}, _PS) ->
    lib_role_pet:is_room_enough(List) orelse erlang:throw({error, ?RC_PET_BAG_ROOM_NOT_ENOUGH}),
    true;
can_add_item({?AST_PET_EXP, _Amount}, _PS) ->
    true;
can_add_item(_ItemType, _PS) ->
    {false, ?RC_RES_CAN_NOT_ADD}.

%% -----------------------------------------------------------------------------
%% 扣除物品
%% -----------------------------------------------------------------------------

%% @doc 通用扣除物品并通知
cost_items_notify(PS, Items, OpType) ->
    cost_items_notify(PS, Items, OpType, []).

cost_items_notify(PS, Items, OpType, Opts) ->
    NewPS = cost_items(PS, Items, OpType, Opts),
    notify_items_change(NewPS, Items),
    NewPS.

%% @doc 通用扣除物品（需要先判断物品是否足够）
cost_items(PS, Items, OpType) ->
    cost_items(PS, Items, OpType, []).

cost_items(PS, Items, OpType, Opts) when is_list(Items) ->
    NewItems = merge_cost_items(Items),
    cost_items2(NewItems, PS, OpType, Opts).

cost_items2([], PS, _OpType, _Opts) ->
    PS;
cost_items2([Item | L], PS, OpType, Opts) ->
    case cost_item(Item, PS, OpType, Opts) of
        NewPS when is_record(NewPS, role_state) ->
            cost_items2(L, NewPS, OpType, Opts);
        {ok, NewPS} when is_record(NewPS, role_state) ->
            cost_items2(L, NewPS, OpType, Opts);
        _ ->
            cost_items2(L, PS, OpType, Opts)
    end.

cost_item({?AST_EXP, Amount}, PS, OpType, _Opts) ->
    lib_role_level:cost_exp(PS, Amount, OpType);
cost_item({Type, 0}, PS, _OpType, _Opts) when ?AST_IS_MONEY(Type) ->
    PS;
cost_item({Type, Amount}, PS, OpType, _Opts) when ?AST_IS_MONEY(Type) ->
    lib_role_money:cost_money(PS, Type, Amount, OpType);
cost_item({?AST_ITEM, GoodsList}, PS, OpType, Opts) ->
    lib_role_goods:del_items(PS, GoodsList, OpType, Opts);
cost_item({?AST_ITEM_C, GoodsList}, PS, OpType, _Opts) ->
    lib_role_goods:del_cell_items(PS, ?BAG_ID_ITEM, GoodsList, OpType);
cost_item({?AST_DRAGON_C, GoodsList}, PS, OpType, _Opts) ->
    lib_role_goods:del_cell_items(PS, ?BAG_ID_DRAGON, GoodsList, OpType);
cost_item({?AST_PET_C, List}, PS, OpType, _Opts) ->
    lib_role_pet:del_pets(PS, List, OpType);
cost_item(ItemType, _PS, _OpType, _Opts) ->
    erlang:error({not_support_type, ItemType}).

%% -----------------------------------------------------------------------------

%% @doc 合并物品或货币 [合并扣除物品]
merge_cost_items(Items) ->
    merge_cost_items(Items, []).

merge_cost_items([], Acc) ->
    Acc;
merge_cost_items([Item | T], Acc) ->
    NewAcc = merge_cost_item(Item, Acc),
    merge_cost_items(T, NewAcc).

merge_cost_item({ItemType, Val}, Acc) when ?AST_IS_NUMERIC(ItemType) ->
    util:prop_increase(ItemType, Acc, Val);
merge_cost_item({ItemType, Goods}, Acc) when ?AST_ITEM_LIKE(ItemType) ->
    OldGList = util:prop_get_value(ItemType, Acc, []),
    util:prop_store(ItemType, merge_goods(Goods, OldGList), Acc);
merge_cost_item({ItemType, Val}, Acc) when ?AST_PET_LIKE(ItemType) ->
    NewList = Val ++ util:prop_get_value(ItemType, Acc, []),
    util:prop_store(ItemType, NewList, Acc).

merge_goods([], GList) ->
    GList;
merge_goods([GInfo | L], GList) ->
    NewGList = merge_goods2(GInfo, GList),
    merge_goods(L, NewGList).
merge_goods2({GTypeId, Num}, GList) ->
    util:prop_increase(GTypeId, GList, Num).

%% -----------------------------------------------------------------------------
%% 增加物品
%% -----------------------------------------------------------------------------

%% @doc 通用增加物品，并通知前端变化
add_items_notify(PS, [], _OpType) ->
    PS;
add_items_notify(PS, Items, OpType) ->
    PS1 = add_items(PS, Items, OpType),
    notify_items_change(PS1, Items),
    PS1.

add_items(PS, Items, OpType) ->
    add_items_(Items, PS, OpType).

add_items_([], PS, _OpType) ->
    PS;
add_items_([Item | T], PS, OpType) ->
    case add_item(Item, PS, OpType) of
        NewPS when is_record(NewPS, role_state) ->
            add_items_(T, NewPS, OpType);
        {ok, NewPS} when is_record(NewPS, role_state) ->
            add_items_(T, NewPS, OpType);
        _ ->
            add_items_(T, PS, OpType)
    end.

add_item({?AST_EXP, Exp}, PS, OpType) ->
    lib_role_level:add_exp(PS, Exp, OpType);
add_item({Type, Amount}, PS, OpType) when ?AST_IS_MONEY(Type) ->
    lib_role_money:add_money(PS, Type, Amount, OpType);
add_item({?AST_ITEM, Items}, PS, OpType) ->
    lib_role_goods:add_items(PS#role_state.id, Items, OpType);
add_item({?AST_PET, Pets}, PS, OpType) ->
    lib_role_pet:add_pets(PS, Pets, OpType);
add_item({?AST_PET_EXP, Exp}, PS, OpType) ->
    lib_role_pet:add_pet_exp(PS, Exp, OpType);
add_item(_Item, PS, _OpType) ->
    PS.

%% -----------------------------------------------------------------------------

%% @doc 合并物品或货币 [合并增加物品]
merge_add_items(Goods) ->
    merge_add_items(Goods, []).

merge_add_items([], RetList) ->
    RetList;
merge_add_items([[] | L], RetList) ->
    merge_add_items(L, RetList);
merge_add_items([H | L], RetList) when is_list(H) ->
    merge_add_items(L, merge_add_items(H, RetList));
merge_add_items([{Type, Value} | L], RetList) ->
    merge_add_items(L, merge_add_item(Type, Value, RetList)).

merge_add_item(_Type, [], RetList) ->
    RetList;
merge_add_item(Type, Value, RetList) when ?AST_IS_NUMERIC(Type) ->
    util:prop_increase(Type, RetList, Value);
merge_add_item(Type, Value, Acc) when ?AST_ITEM_LIKE(Type) ->
    List = util:prop_get_value(Type, Acc, []),
    util:prop_store(Type, Value ++ List, Acc);
merge_add_item(Type, Value, Acc) when ?AST_PET_LIKE(Type) ->
    List = util:prop_get_value(Type, Acc, []),
    util:prop_store(Type, Value ++ List, Acc);
merge_add_item(Type, Value, Acc) ->
    ?ERROR("merge_add_item error can't handler type ~p, value ~p", [Type, Value]),
    erlang:throw({error, ?RC_INVALID_ARGS}),
    Acc.

%% -----------------------------------------------------------------------------
%% 物品增益
%% -----------------------------------------------------------------------------

%% @doc 。。物品
mul_items(Items, 1) ->
    Items;
mul_items(_Items, 0) ->
    [];
mul_items(Items, Mul) ->
    mul_items(Items, Mul, []).

mul_items(_, 0, Acc) ->
    Acc;
mul_items([], _Mul, Acc) ->
    Acc;
mul_items([{Type, Value} | T], Mul, Acc) when ?AST_IS_NUMERIC(Type) ->
    mul_items(T, Mul, [{Type, erlang:floor(Value * Mul)} | Acc]);
mul_items([{Type, GoodsList} | T], Mul, Acc) when ?AST_ITEM_LIKE(Type), is_list(GoodsList) ->
    mul_items(T, Mul, [{Type, mul_goods(GoodsList, erlang:floor(Mul), [])} | Acc]);
mul_items([_ | T], Mul, Acc) -> %% !
    mul_items(T, Mul, Acc).

mul_goods(_, 0, Acc) ->
    Acc;
mul_goods([], _Mul, Acc) ->
    Acc;
mul_goods([{TypeID, Num} | T], Mul, Acc) ->
    mul_goods(T, Mul, [{TypeID, Num * Mul} | Acc]);
mul_goods([{TypeID, Num, Bind} | T], Mul, Acc) ->
    mul_goods(T, Mul, [{TypeID, Num * Mul, Bind} | Acc]);
mul_goods([{TypeID, Num, Bind, Expire} | T], Mul, Acc) ->
    mul_goods(T, Mul, [{TypeID, Num * Mul, Bind, Expire} | Acc]);
mul_goods([#{num := Num} = Goods | T], Mul, Acc) ->
    mul_goods(T, Mul, [Goods#{num => Num * Mul} | Acc]);
mul_goods([_ | T], Mul, Acc) -> %% !
    mul_goods(T, Mul, Acc).

%% -----------------------------------------------------------------------------
%% 物品格式化（字符串表示）
%% -----------------------------------------------------------------------------

%% @doc 格式化物品列表
format_items(Items) ->
    fmt_items(Items).

fmt_items(Items) ->
    implode(", ", fmt_items(Items, []), []).

fmt_items([], Acc) ->
    lists:reverse(Acc);
fmt_items([{?AST_ITEM, Goods} | T], Acc) ->
    NewAcc = fmt_goods_list(Goods, Acc),
    fmt_items(T, NewAcc);
fmt_items([_ | T], Acc) ->
    fmt_items(T, Acc).

%%fmt_goods_list(List) ->
%%    NewList = fmt_goods_list(List, []),
%%    implode(", ", NewList, []).

fmt_goods_list([], Acc) ->
    lists:reverse(Acc);
fmt_goods_list([{GTypeID, GNum, _Bind, _ExpireTime} | T], Acc) ->
    fmt_goods_list(T, [format_goods(GTypeID, GNum) | Acc]);
fmt_goods_list([{GTypeID, GNum, _Bind} | T], Acc) when GTypeID > 0 ->
    fmt_goods_list(T, [format_goods(GTypeID, GNum) | Acc]);
fmt_goods_list([{GTypeID, GNum} | T], Acc) when GTypeID > 0 ->
    fmt_goods_list(T, [format_goods(GTypeID, GNum) | Acc]);
fmt_goods_list([#{id := GTypeID, num := GNum} | T], Acc) when GTypeID > 0 ->
    fmt_goods_list(T, [format_goods(GTypeID, GNum) | Acc]);
fmt_goods_list([_ | T], Acc) ->
    fmt_goods_list(T, Acc).

format_goods(GTypeID, GNum) ->
    #{name := Name} = conf_goods:get(GTypeID),
    NameStr = erlang:binary_to_list(Name),
    list_to_binary(lists:concat([NameStr, "x", GNum])).

implode(_S, [], Acc) ->
    lists:reverse(Acc);
implode(S, [E | T], []) ->
    implode(S, T, [E]);
implode(S, [E | T], Acc) ->
    implode(S, T, [E, S] ++ Acc).

%% -----------------------------------------------------------------------------
%% 转换物品结构（前端结构） TODO 暂时不要使用，{TypeID, ID, Num} or {Gid, Num} or #item{} ?
%% -----------------------------------------------------------------------------

%% @doc 转换物品结构
convert_items(Items) ->
    convert_items(Items, []).

convert_items([], Acc) ->
    Acc;
convert_items([{Type, Num} | T], Acc) when ?AST_IS_NUMERIC(Type) ->
    convert_items(T, [{Type, 0, Num} | Acc]);
convert_items([{Type, Goods} | T], Acc) when ?AST_ITEM_LIKE(Type) ->
    convert_items(T, convert_goods(Goods, Acc));
convert_items([_ | T], Acc) ->
    convert_items(T, Acc).

convert_goods([], Acc) ->
    Acc;
convert_goods([{TypeID, Num} | T], Acc) ->
    convert_goods(T, [{?AST_ITEM, TypeID, Num} | Acc]);
convert_goods([{TypeID, Num, _Bind} | T], Acc) ->
    convert_goods(T, [{?AST_ITEM, TypeID, Num} | Acc]);
convert_goods([{TypeID, Num, _Bind, _ExpireTime} | T], Acc) ->
    convert_goods(T, [{?AST_ITEM, TypeID, Num} | Acc]);
convert_goods([#{id := TypeID, num := Num} | T], Acc) ->
    convert_goods(T, [{?AST_ITEM, TypeID, Num} | Acc]);
convert_goods([_ | T], Acc) ->
    convert_goods(T, Acc).

%% @doc 掉落类型对应的前端显示物品 {Type0, ID, Num} => {ID1, Num}
%%asset_item(?DROP_EXP) -> % 经验
%%    16500013;
asset_item(_DropType) ->
    0.

%% -----------------------------------------------------------------------------
%% 物品变化通知
%% -----------------------------------------------------------------------------

%% @doc 通知货币变化
notify_items_change(PS, Items) ->
    List = get_items(PS, Items),
    List =/= [] andalso begin
        Rec = #sc_assets_change{changes = List},
        {ok, Bin} = prot_msg:encode_msg(20403, Rec),
        lib_role_send:send_to_role(PS, Bin)
    end.

get_items(PS, Items) ->
    Types = filter_types(Items),
    lists:foldl(fun(Type, Acc) ->
        get_item(Type, PS) ++ Acc
    end, [], Types).

filter_types([]) ->
    [];
filter_types(Type) when is_integer(Type) ->
    [Type];
filter_types(Items) when is_list(Items) ->
    Types = lists:map(fun filter_type/1, Items),
    UTypes = lists:usort(Types),
    [Type || Type <- UTypes, Type =/= 0].

filter_type(Type) when is_integer(Type) ->
    Type;
filter_type({Type, _}) when is_integer(Type) ->
    Type;
filter_type(_) ->
    0.

get_item(?AST_SGOLD_F, PS) ->
    get_item(?AST_SGOLD, PS) ++ get_item(?AST_GOLD, PS);
get_item(?AST_BGOLD_F, PS) ->
    get_item(?AST_BGOLD, PS) ++ get_item(?AST_SGOLD_F, PS);
get_item(Type, PS) when ?AST_IS_MONEY(Type) ->
    [{Type, lib_role_money:get_money(PS, Type)},
        {255 - Type, lib_role_money:get_his_money(PS, Type)}];
get_item(_Type, _PS) ->
    [].

%% -----------------------------------------------------------------------------
%% 物品检验 [邮件接口]
%% -----------------------------------------------------------------------------

%% @doc 判断并过滤合适的物品
valid_items(Items) when is_list(Items) ->
    lists:filter(fun valid_item/1, Items).

valid_item({Type, Amount}) when ?AST_IS_MONEY(Type) andalso Amount > 0 ->
    true;
valid_item({Type, Goods}) when ?AST_ITEM_LIKE(Type) andalso is_list(Goods) ->
    valid_goods(Goods);
valid_item({_Type, _Num}) ->
    false.

valid_goods([]) ->
    true;
valid_goods([{TypeID, Num} | T])
    when is_integer(TypeID), is_integer(Num) ->
    valid_goods(T);
valid_goods([{TypeID, Num, _Bind} | T]) when is_integer(TypeID), is_integer(Num) ->
    valid_goods(T);
valid_goods([{TypeID, Num, _Bind, _Expire} | T]) when is_integer(TypeID), is_integer(Num) ->
    valid_goods(T);
valid_goods([GoodsInfo | T]) when is_map(GoodsInfo) ->
    valid_goods(T);
valid_goods([_Unknown | _T]) ->
    false.

%% -----------------------------------------------------------------------------
