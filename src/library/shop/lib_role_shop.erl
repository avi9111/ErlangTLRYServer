%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     商店
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_shop).
-author("Ryuu").

-include("role.hrl").
-include("shop.hrl").
-include("goods.hrl").
-include("guild.hrl").
-include("common.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_206.hrl").

%% API
-export([
    do/3,
    init/1,
    save/1,
    event/2,
    cross_day/1,
    send_info/1,
    get_price/2,
    handle_info/2,
    get_role_data/1,
    check_get_price/2
]).

handle_info(_Info, _PS) ->
    ignore.

event(PS, {timer, ?TIMER_DEFAULT}) ->
    save_(PS);
event(_, _) ->
    ignore.

do(20601, PS, _Req) ->
    send_info(PS);
do(20603, PS, #cs_shop_buy{cate_id = CateID, item_id = ItemID, num = Num}) ->
    buy_item(PS, CateID, ItemID, Num);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 跨天操作
cross_day(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    cross_day(RoleID, RoleData).

cross_day(RoleID, RoleData) ->
    #{items := Items, time := Time} = RoleData,
    case time:is_today(Time) of
        false ->
            {CDate, _} = erlang:localtime(),
            {RDate, _} = time:unixtime_to_localtime(Time),
            CWeek = calendar:iso_week_number(RDate) =/= calendar:iso_week_number(CDate),
            CMonth = erlang:setelement(3, RDate, 0) =/= erlang:setelement(3, CDate, 0),
            NewItems = reset_items(util:dict_values(Items), CWeek, CMonth, dict:new()),
            NewData = RoleData#{items => NewItems, time => time:unixtime()},
            update_role_data(RoleID, NewData),
            NewData;
        _ ->
            RoleData
    end.

reset_items([], _CWeek, _CMonth, Acc) ->
    Acc;
reset_items([#{key := Key} = Item | T], CWeek, CMonth, Acc) ->
    case conf_shop_item:get(Key) of
        #{limit_type := LimitType} when LimitType =:= ?SHOP_LIMIT_DAY
            orelse (LimitType =:= ?SHOP_LIMIT_WEEK andalso CWeek)
            orelse (LimitType =:= ?SHOP_LIMIT_MONTH andalso CMonth) ->
%%            NewItem = Item#{num => 0},
            reset_items(T, CWeek, CMonth, Acc);
        _ ->
            reset_items(T, CWeek, CMonth, dict:store(Key, Item, Acc))
    end.

%% @doc 获取商店信息
send_info(PS) ->
    #role_state{id = RoleID} = PS,
    RoleData = get_role_data(RoleID),
    #{items := ItemsDict} = RoleData,
    Rec = #sc_shop_info{
        items = convert_items(util:dict_values(ItemsDict), [])
    },
    {ok, Bin} = prot_msg:encode_msg(20602, Rec),
    lib_role_send:send_to_role(PS, Bin).

convert_items([], Acc) ->
    Acc;
convert_items([#{key := Key, num := Num} | T], Acc) ->
    case conf_shop_item:get(Key) of
        #{limit_num := LimitNum, cate_id := CateID, item_id := ID} when LimitNum > 0 ->
            convert_items(T, [{CateID, ID, Num} | Acc]);
        _ ->
            convert_items(T, Acc)
    end.

%% @doc 购买商店物品
buy_item(PS, CateID, ItemID, Num) ->
    case catch check_buy_item(PS, CateID, ItemID, Num) of
        {ok, RoleID, RoleData, Costs, Rewards, LeftNum, Log, ShopID} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_SHOP_BUY_ITEM),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_SHOP_BUY_ITEM),
            update_role_data(RoleID, RoleData),
            ?LOG(io_lib:format(?SQL_LOG_ROLE_SHOP, Log)),
            Rec = #sc_shop_buy{cate_id = CateID, item_id = ItemID, left = LeftNum},
            {ok, Bin} = prot_msg:encode_msg(20604, Rec),
            lib_role_send:send_to_role(PS, Bin),
            ?TASK_EVENT(RoleID, {buy_item, ShopID, ItemID, Num}),
            {ok, PS2};
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_buy_item(PS, CateID, ItemID, Num) ->
    Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #role_state{id = RoleID} = PS,
    TagID = CateID div 10,
    ItemKey = {TagID, ItemID},
    ItemConf = conf_shop_item:get(ItemKey),
    ItemConf =/= undefined orelse erlang:throw({error, ?RC_SHOP_ITEM_NOT_FOUND}),
    #{shop_id := ShopID, tag_id := _TagID, price := Price, price_type := PriceTypeI,
        conds := Conds, limit_num := LimitNum} = ItemConf,
    PriceTypeS = conf_shop:get_price_type(ShopID),
    PriceTypeS =/= undefined orelse erlang:throw({error, ?RC_SHOP_NOT_EXISTS}),
    PriceType = ?iif(PriceTypeI > 0, PriceTypeI, PriceTypeS),
    Costs0 = [{PriceType, Price * Num}],
    Costs = ?iif(PriceType > 255, [{?AST_ITEM, Costs0}], Costs0),
    lib_role_assets:check_items_enough(PS, Costs),
    RoleData = get_role_data(RoleID),
    #{items := Items} = RoleData,
    Item = util:dict_find(ItemKey, Items, ?shop_item#{key => ItemKey, id => ItemID}),
    check_limits(Conds, PS),
    if
        LimitNum =:= 0 ->
            LeftNum = 0, NewItems = Items;
        true ->
            #{num := CurNum} = Item,
            CurNum + Num =< LimitNum orelse erlang:throw({error, ?RC_SHOP_ITEM_NUM_LIMIT}),
            NewNum = CurNum + Num,
            LeftNum = erlang:max(LimitNum - NewNum, 0),
            NewItem = Item#{num => NewNum},
            NewItems = dict:store(ItemKey, NewItem, Items)
    end,
    Rewards = [{?AST_ITEM, [?goods_basic#{id => ItemID, num => Num, bind => ?GOODS_BIND}]}],
    lib_role_assets:check_can_add_items(PS, Rewards),
    NewData = RoleData#{items => NewItems},
    Log = [RoleID, ShopID, TagID, CateID, ItemID, Num, time:unixtime()],
    {ok, RoleID, NewData, Costs, Rewards, LeftNum, Log, ShopID}.

check_limits([], _PS) ->
    ok;
check_limits([Cond | T], PS) ->
    check_limit(Cond, PS),
    check_limits(T, PS).

check_limit({?SHOP_COND_DUNG_TIMES, Type, Times}, PS) ->
    lib_role_dungeon:type_dung_fin_times(PS#role_state.id, Type) >= Times
        orelse erlang:throw({error, ?RC_SHOP_DUNG_TIMES_LIMIT});
check_limit({?SHOP_COND_DUNG_WAVE, DungID, Level, Wave}, PS) ->
    lib_role_dungeon:is_passed(PS#role_state.id, DungID, Level, Wave)
        orelse erlang:throw({error, ?RC_SHOP_DUNG_WAVE_LIMIT});
check_limit({?SHOP_COND_GUILD_LV, Lv}, PS) ->
    lib_guild:get_guild_level(PS#role_state.guild_id) >= Lv
        orelse erlang:throw({error, ?RC_SHOP_GUILD_LV_LIMIT});
check_limit({?SHOP_COND_GUILD_BUILD, TreasureLv}, PS) ->
    lib_guild:get_build_lv(PS#role_state.guild_id, ?GUILD_BUILD_TREASURE) >= TreasureLv
        orelse erlang:throw({error, ?RC_SHOP_TREASURE_LV_NOT_ENOUGH});
check_limit({?SHOP_COND_HIS_MONEY, ?AST_LOVE_VALUE, Money}, PS) ->
    lib_role_marriage:get_his_love(PS#role_state.id) >= Money orelse
        erlang:throw({error, ?RC_SHOP_HISTORY_MONEY_LIMIT});
check_limit({?SHOP_COND_HIS_MONEY, Type, Money}, PS) ->
    lib_role_money:get_his_money(PS, Type) >= Money orelse
        erlang:throw({error, ?RC_SHOP_HISTORY_MONEY_LIMIT});
check_limit({?SHOP_COND_MARRIED, _V}, PS) ->
    lib_marriage:is_married(PS#role_state.id) orelse
        erlang:throw({error, ?RC_SHOP_ROLE_NOT_MARRIED});
check_limit({?SHOP_COND_MENTOR_MARK, MarkNeed}, PS) ->
    lib_mentor:get_tudi_mark(PS#role_state.id) >= MarkNeed orelse
        erlang:throw({error, ?RC_SHOP_LACK_OF_MENTOR_MARK});
check_limit(_Cond, _PS) ->
    erlang:throw({error, ?RC_SHOP_COND_NOT_SUPPORT}).

check_get_price(ShopID, ItemID) ->
    case get_price(ShopID, ItemID) of
        Price when is_integer(Price) -> Price;
        _ -> erlang:throw({error, ?RC_SHOP_CAN_NOT_GET_RPICE})
    end.

get_price(ShopID, ItemID) ->
    case lists:keyfind(ShopID, 1, conf_shop_item:get_item_cate(ItemID)) of
        {_, TagID, _} ->
            #{price := Price} = conf_shop_item:get({TagID, ItemID}),
            Price;
        _ ->
            undefined
    end.

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------

%% @doc 初始化
init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_SHOP_DATA, [RoleID]),
    case db:get_row(SQL) of
        [DbItems, Time] ->
            Items = type:convert_db_field(list, DbItems, []),
            RoleData = ?role_shop#{
                role_id => RoleID, items => init_shop_items(Items, dict:new()),
                time => Time
            };
        _ ->
            RoleData = ?role_shop#{role_id => RoleID, time => time:unixtime()}
    end,
    set_role_data(RoleID, RoleData),
    cross_day(RoleID, RoleData),
    ok.

init_shop_items([], Acc) ->
    Acc;
init_shop_items([Item | T], Acc) ->
    #{key := Key} = Item,
    init_shop_items(T, dict:store(Key, Item, Acc)).

%% @doc 下线持久化
save(PS) ->
    save_(PS).

save_(PS) ->
    #role_state{id = RoleID} = PS,
    case erlang:get({?MODULE, role_data}) of
        #{updated := true} = RoleData ->
            save_role_data(RoleID, RoleData);
        _ ->
            ignore
    end.

save_role_data(RoleID, RoleData) ->
    #{items := Items0, time := Time} = RoleData,
    DbItems = type:term_to_bitstring(util:dict_values(Items0)),
    SQL = io_lib:format(?SQL_SET_SHOP_DATA, [RoleID, DbItems, Time]),
    db:execute(SQL),
    NewData = RoleData#{updated => false},
    set_role_data(RoleID, NewData).

get_role_data(RoleID) ->
    case erlang:get({?MODULE, role_data}) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?role_shop#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    NewData = RoleData#{updated => true},
    set_role_data(RoleID, NewData).

set_role_data(_RoleID, RoleData) ->
    erlang:put({?MODULE, role_data}, RoleData).
