%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     物品 [玩家]
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_goods).
-author("Ryuu").

-include("role.hrl").
-include("goods.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_201.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    get_bag/2,
    add_items/3,
    clear_bag/2,
    del_items/4,
    empty_bag/2,
    send_info/1,
    bag_statics/2,
    get_bag_room/2,
    get_role_data/1,
    get_cell_item/3,
    del_cell_items/4,
    get_cell_items/3,
    set_cell_items/4,
    is_room_enough/2,
    is_items_enough/3,
    get_items_by_ids/3,
    is_cell_items_enough/3
]).

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_PS, _Event) ->
    ignore.

do(20101, PS, _) ->
    send_info(PS);
do(20103, PS, #cs_bag_clean{bag_id = BagID}) ->
    clean_bag(PS, BagID);
do(20105, PS, #cs_bag_sell_item{bag_id = BagID, poses = Poses}) ->
    sell(PS, BagID, Poses);
do(20107, PS, #cs_bag_extend_cell{bag_id = BagID, num = Num}) ->
    extend_cell(PS, BagID, Num);
do(20109, PS, #cs_bag_clear{bag_id = BagID}) ->
    clear_bag(PS, BagID);
do(20113, PS, #cs_bag_extend_bag{bag_id = BagID}) ->
    extend_bag(PS, BagID);
do(20115, PS, #cs_bag_change_name{bag_id = BagID, name = Name}) ->
    change_name(PS, BagID, Name);
do(20117, PS, #cs_bag_transfer{src_bag = SrcID, dst_bag = DstID, pos = Pos}) ->
    transfer(PS, SrcID, DstID, Pos);
do(20119, PS, #cs_bag_get_bag{bag_id = BagID}) ->
    send_bag_info(PS, BagID);
do(20141, PS, #cs_use_goods{pos = Pos, num = Num, arg = Arg}) ->
    use_goods(PS, Pos, Num, Arg);
do(_, _, _) ->
    ignore.

%% @doc 获取背包信息
send_info(PS) ->
    RoleBag = get_role_data(PS),
    Rec = #sc_bag_get_info{
        bags = lib_goods_util:convert_bags_info(RoleBag)
    },
    {ok, Bin} = prot_msg:encode_msg(20102, Rec),
    lib_role_send:send_to_role(PS, Bin).

send_bag_info(PS, BagID) ->
    RoleBag = get_role_data(PS),
    Bag = lib_goods_base:get_bag(BagID, RoleBag),
    Bag =/= undefined andalso begin
        Rec = #sc_bag_get_bag{bag = lib_goods_util:convert_bag_info(Bag)},
        {ok, Bin} = prot_msg:encode_msg(20120, Rec),
        lib_role_send:send_to_role(PS, Bin)
    end.

%% @doc 整理背包
clean_bag(PS, BagID) ->
    case catch check_clean_bag(PS, BagID) of
        {ok, RoleID, NewBag} ->
            update_role_data(RoleID, NewBag),
            Rec = #sc_bag_clean{bag_id = BagID},
            {ok, Bin} = prot_msg:encode_msg(20104, Rec),
            lib_role_send:send_to_role(PS, Bin),
            send_bag_info(PS, BagID);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_clean_bag(PS, BagID) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    NewBag = lib_goods_base:clean_bag_items(RoleBag, BagID, ?OPT_BAG_CLEAN),
    {ok, RoleID, NewBag}.

%% @doc 出售道具给系统
sell(PS, BagID, Poses) ->
    case catch check_sell(PS, BagID, Poses) of
        {ok, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_BAG_SELL),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_BAG_SELL),
            Rec = #sc_bag_sell_item{bag_id = BagID, poses = Poses},
            {ok, Bin} = prot_msg:encode_msg(20106, Rec),
            lib_role_send:send_to_role(PS, Bin),
            {ok, PS2};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_sell(PS, BagID, Poses0) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    Bag = lib_goods_base:check_get_bag(BagID, RoleBag),
    Poses = util:list_uniq(Poses0),
    Poses =/= [] orelse erlang:throw({error, ?RC_GOODS_EMPTY_SELL_LIST}),
    {CellList, Rewards} = sell_items(Poses, Bag, [], []),
    Costs = [{?AST_ITEM_C, CellList}],
    {ok, Costs, Rewards}.

sell_items([], _Bag, CAcc, RAcc) ->
    {CAcc, RAcc};
sell_items([Pos | T], Bag, CAcc, RAcc) ->
    Goods = lib_goods_base:get_cell_item(Bag, Pos),
    Goods =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
    #{id := Gid, num := Num, pos := Pos} = Goods,
    ConfGoods = conf_goods:get(Gid),
    ConfGoods =/= undefined orelse erlang:throw({error, ?RC_GOODS_CONF_NOT_FOUND}),
    #{sell := Sell, type := Cate} = ConfGoods,
    Cate =/= ?GOODS_CATE_EQUIP orelse erlang:throw({error, ?RC_GOODS_CAN_NOT_SELL}),
    Sell =/= [] orelse erlang:throw({error, ?RC_GOODS_CAN_NOT_SELL}),
    NewCAcc = [{Pos, Num} | CAcc],
    NewRAcc = lib_role_assets:merge_add_items(lists:duplicate(Num, Sell) ++ RAcc),
    sell_items(T, Bag, NewCAcc, NewRAcc).

%% @doc 扩充背包格子
extend_cell(PS, BagID, Num) ->
    case catch check_extend_cell(PS, BagID, Num) of
        {ok, RoleID, NewBag, NewCellNum, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_BAG_EXTEND),
            update_role_data(RoleID, NewBag),
            Rec = #sc_bag_extend_cell{bag_id = BagID, cell_num = NewCellNum},
            {ok, Bin} = prot_msg:encode_msg(20108, Rec),
            lib_role_send:send_to_role(PS, Bin),
            {ok, PS1};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_extend_cell(PS, BagID, Num) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    Bag = lib_goods_base:check_get_bag(BagID, RoleBag),
    #{cell_num := CellNum} = Bag,
    ConfBag = conf_bag:get(BagID),
    #{max_size := MaxSize} = ConfBag,
    Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    NewCellNum = CellNum + Num,
    NewCellNum =< MaxSize orelse erlang:throw({error, ?RC_GOODS_MAX_CELL_NUM}),
    Gold = extend_cost(CellNum + 1, CellNum + Num + 1, BagID, 0),
    Costs = [{?AST_GOLD, Gold}],
    lib_role_assets:check_items_enough(PS, Costs),
    NewRoleBag = lib_goods_base:extend_bag_cell(RoleBag, BagID, NewCellNum, ?OPT_BAG_EXTEND),
    {ok, RoleID, NewRoleBag, NewCellNum, Costs}.

extend_cost(MaxNum, MaxNum, _BagID, Acc) ->
    Acc;
extend_cost(CellNum, MaxNum, BagID, Acc) ->
    ExtConf = conf_bag_extend:get({BagID, CellNum}),
    ExtConf =/= undefined orelse erlang:throw({error, ?RC_GOODS_NO_EXT_CONF}),
    #{gold := Gold} = ExtConf,
    extend_cost(CellNum + 1, MaxNum, BagID, Gold + Acc).

%% @doc 清除过期物品
clear_bag(PS, BagID) ->
    case catch check_clear_bag(PS, BagID) of
        {ok, RoleID, OldBag, NewBag} ->
            update_role_data(RoleID, NewBag),
            Rec = #sc_bag_clear{bag_id = BagID},
            {ok, Bin} = prot_msg:encode_msg(20110, Rec),
            lib_role_send:send_to_role(PS, Bin),
            send_bag_change(PS, OldBag, NewBag);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_clear_bag(PS, BagID) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    NewBag = lib_goods_base:clear_bag_items(RoleBag, BagID, ?OPT_BAG_CLEAR),
    {ok, RoleID, RoleBag, NewBag}.

%% @doc 扩充仓库
extend_bag(PS, BagID) ->
    case catch check_extend_bag(PS, BagID) of
        {ok, RoleID, RoleBag, Bag, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_BAG_EXTEND),
            update_role_data(RoleID, RoleBag),
            Rec = #sc_bag_extend_bag{bag = lib_goods_util:convert_bag_info(Bag)},
            {ok, Bin} = prot_msg:encode_msg(20114, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_extend_bag(PS, BagID) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    Bag = lib_goods_base:get_bag(BagID, RoleBag),
    Bag =:= undefined orelse erlang:throw({error, ?RC_GOODS_BAG_ALREADY_UNLOCK}),
    Conf = conf_bag:get(BagID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_GOODS_NO_BAG_CONF}),
    #{name := Name, init_size := Size, cost := Silver} = Conf,
    NewBag = ?bag#{id => BagID, name => Name, cell_num => Size},
    NewRoleBag = lib_goods_base:set_bag(BagID, NewBag, RoleBag),
    Costs = [{?AST_SILVER, Silver}],
    lib_role_assets:check_items_enough(PS, Costs),
    {ok, RoleID, NewRoleBag, NewBag, Costs}.

%% @doc 改名
change_name(PS, BagID, Name) ->
    case catch check_change_name(PS, BagID, Name) of
        {ok, RoleID, RoleBag} ->
            update_role_data(RoleID, RoleBag),
            Rec = #sc_bag_change_name{bag_id = BagID, name = Name},
            {ok, Bin} = prot_msg:encode_msg(20116, Rec),
            lib_role_send:send_to_role(PS, Bin);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_change_name(PS, BagID, Name) ->
    util:check_name(Name),
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    Bag = lib_goods_base:get_bag(BagID, RoleBag),
    Bag =/= undefined orelse erlang:throw({error, ?RC_GOODS_BAG_NOT_FOUND}),
    NewBag = Bag#{name => Name},
    NewRoleBag = lib_goods_base:set_bag(BagID, NewBag, RoleBag),
    {ok, RoleID, NewRoleBag}.

%% @doc 一键移入、移出
transfer(PS, SrcID, DstID, Pos) ->
    case catch check_transfer(PS, SrcID, DstID, Pos) of
        {ok, RoleID, RoleBag, NewBag} ->
            update_role_data(RoleID, NewBag),
            Rec = #sc_bag_transfer{src_bag = SrcID, dst_bag = DstID, pos = Pos},
            {ok, Bin} = prot_msg:encode_msg(20118, Rec),
            lib_role_send:send_to_role(PS, Bin),
            send_bag_change(RoleID, RoleBag, NewBag);
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_transfer(PS, SrcID, DstID, Cell) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    NewRoleBag = lib_goods_base:transfer_bag_items(RoleBag, SrcID, DstID, Cell, ?OPT_BAG_TRANSFER),
    {ok, RoleID, RoleBag, NewRoleBag}.

%% @doc
use_goods(PS, Pos, Num, Arg) ->
    case catch lib_goods_use:use_goods(PS, Pos, Num, Arg) of
        {ok, NewPS} ->
            {ok, NewPS};
        {error, RetCode} ->
            ?ERROR_TOC(PS#role_state.id, RetCode)
    end.

%% @doc 清空背包
empty_bag(PS, BagID) ->
    #role_state{id = RoleID} = PS,
    RoleBag = get_role_data(RoleID),
    NewBag = lib_goods_base:empty_bag_items(RoleBag, BagID, ?OPT_BAG_CLEAR),
    update_role_data(RoleID, NewBag),
    send_bag_info(PS, BagID),
    ok.

%% @doc 背包数据
bag_statics(RoleID, BagID) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:bag_item_statics(RoleBag, BagID).

%% -----------------------------------------------------------------------------

%% @doc 获取背包
get_bag(RoleID, BagID) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:get_bag(BagID, RoleBag).

%% @doc 添加物品
add_items(RoleID, List, OpType) ->
    RoleBag = get_role_data(RoleID),
    BagItems = lib_goods_util:classify(List),
    NewBag = lists:foldl(fun({BagID, Items}, BagAcc) ->
        lib_goods_base:add_bag_items(BagAcc, BagID, Items, OpType)
    end, RoleBag, BagItems),
    update_role_data(RoleID, NewBag),
    send_bag_change(RoleID, RoleBag, NewBag).

%% @doc 删除物品
del_items(RoleID, List, OpType, Opts) ->
    RoleBag = get_role_data(RoleID),
    BagItems = lib_goods_util:classify(List),
    Opt = util:prop_get_value(goods_opt, Opts, ?GOODS_OPT_D),
    NewBag = lists:foldl(fun({BagID, Items}, BagAcc) ->
        lib_goods_base:del_bag_items(BagAcc, BagID, Items, OpType, Opt)
    end, RoleBag, BagItems),
    update_role_data(RoleID, NewBag),
    send_bag_change(RoleID, RoleBag, NewBag).

%% @doc 物品是否足够
is_items_enough(RoleID, List, Opts) ->
    RoleBag = get_role_data(RoleID),
    Opt = util:prop_get_value(goods_opt, Opts, ?GOODS_OPT_D),
    BagItems = lib_goods_util:classify(List),
    is_items_enough_(BagItems, RoleBag, Opt).

is_items_enough_([], _RoleBag, _Opt) ->
    true;
is_items_enough_([{BagID, Items} | T], RoleBag, Opt) ->
    case lib_goods_base:is_bag_items_enough(RoleBag, BagID, Items, Opt) of
        true -> is_items_enough_(T, RoleBag, Opt);
        _ -> false
    end.

%% @doc 删除物品 [按格子], {Pos, Num}
del_cell_items(RoleID, BagID, Items, OpType) ->
    RoleBag = get_role_data(RoleID),
    NewBag = lib_goods_base:del_bag_cell_items(RoleBag, BagID, Items, OpType),
    update_role_data(RoleID, NewBag),
    send_bag_change(RoleID, RoleBag, NewBag).

%% @doc [特殊用途，别乱用]
set_cell_items(RoleID, BagID, Items, OpType) ->
    RoleBag = get_role_data(RoleID),
    NewBag = lib_goods_base:set_bag_cell_items(RoleBag, BagID, Items, OpType),
    update_role_data(RoleID, NewBag),
    send_bag_change(RoleID, RoleBag, NewBag).

%% @doc 物品是否足够 [按格子]
is_cell_items_enough(RoleID, BagID, Items) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:is_bag_cell_items_enough(RoleBag, BagID, Items).

%% @doc 获取指定格子物品
%% @spec get_cell_item(RoleId, BagId, Pos) -> ?bag_goods | undefined.
get_cell_item(RoleID, BagID, Pos) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:get_bag_cell_item(RoleBag, BagID, Pos).

get_cell_items(RoleID, BagID, Poses) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:get_bag_cell_items(RoleBag, BagID, Poses).

get_items_by_ids(RoleID, BagID, Types) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:get_bag_items_by_ids(RoleBag, BagID, Types).

%% @doc 格子空间是否足够 [仅大致空间，不做叠加判断]
is_room_enough(RoleID, List) ->
    RoleBag = get_role_data(RoleID),
    BagItems = lib_goods_util:classify(List),
    is_room_enough2(BagItems, RoleBag).

is_room_enough2([], _RoleBag) ->
    true;
is_room_enough2([{BagID, Items} | T], RoleBag) ->
    NeedRoom = lib_goods_util:occupy_room(Items),
    case lib_goods_base:is_bag_room_enough(RoleBag, BagID, NeedRoom) of
        false ->
            false;
        _ ->
            is_room_enough2(T, RoleBag)
    end.

%% @doc
get_bag_room(RoleID, BagID) ->
    RoleBag = get_role_data(RoleID),
    lib_goods_base:get_bag_room(RoleBag, BagID).

%% @doc 发送背包变化
send_bag_change(PS, OldBag, NewBag) ->
    Changes = lib_goods_util:bag_change(?ROLE_BAGS, OldBag, NewBag),
    Rec = #sc_bag_change{changes = Changes},
    {ok, Bin} = prot_msg:encode_msg(20111, Rec),
    lib_role_send:send_to_role(PS, Bin).

%% =============================================================================
%% 玩家数据
%% =============================================================================

%% @doc init
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_ROLE_GOODS, [RoleID]),
    List = db:get_all(SQL),
    Bags = lib_goods_base:init_bags(List, ?INIT_BAGS),
    RoleData = ?role_bag#{role_id => RoleID, bags => Bags},
    set_role_data(RoleID, RoleData),
    ok.

%% @doc save
save(PS) ->
    save_(PS).

%% @doc save
save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    {NewBags, BagList, LogList} = save_bags(RoleData, RoleID),
    db:insert_values(?SQL_SET_ROLE_GOODS, ?SQL_SET_ROLE_GOODS2, BagList),
    db:insert_values(?SQL_SAVE_ROLE_GOODS_LOG1, ?SQL_SAVE_ROLE_GOODS_LOG2, LogList),
    NewData = RoleData#{bags => NewBags, updated => false},
    set_role_data(RoleID, NewData).

save_bags(Bags, RoleID) ->
    save_bags(lib_goods_base:get_bag_list(Bags), RoleID, dict:new(), [], []).

save_bags([], _RoleID, Bags, BagAcc, LogsAcc) ->
    {Bags, BagAcc, LogsAcc};
save_bags([Bag | T], RoleID, Bags, BagAcc, LogsAcc) ->
    #{id := BagID, name := Name, goods := GoodsDict, cell_num := CellNum, logs := Logs} = Bag,
    NewBags = dict:store(BagID, Bag#{logs => []}, Bags),
    DbGoodsList = type:term_to_bitstring(util:dict_values(GoodsDict)),
    NewBagAcc = [[RoleID, BagID, Name, DbGoodsList, CellNum] | BagAcc],
    NewLogAcc = save_bag_logs(Logs, RoleID, BagID, LogsAcc),
    save_bags(T, RoleID, NewBags, NewBagAcc, NewLogAcc).

save_bag_logs([], _RoleID, _BagID, LogAcc) ->
    LogAcc;
save_bag_logs([Log | T], RoleID, BagID, LogAcc) ->
    #{op := OpID, gid := Gid, num := Num, time := Time, opt := Opt} = Log,
    NewLogAcc = [[RoleID, BagID, OpID, Gid, Num, Time, Opt] | LogAcc],
    save_bag_logs(T, RoleID, BagID, NewLogAcc).

init_data(RoleID) ->
    ?role_bag#{role_id => RoleID}.

%% @doc 获取背包数据
get_role_data(#role_state{id = RoleID}) ->
    get_role_data(RoleID);
get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        M when is_map(M) -> M;
        _ -> init_data(RoleID)
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
