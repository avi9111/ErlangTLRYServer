%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     市场
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_market).
-author("Ryuu").

-include("pet.hrl").
-include("goods.hrl").
-include("timer.hrl").
-include("assets.hrl").
-include("common.hrl").
-include("market.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_425.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

%% API
-export([
    buy/2,
    info/0,
    init/0,
    loop/1,
    valid/1,
    follow/3,
    put_on/2,
    resale/3,
    search/4,
    get_pet/2,
    get_info/1,
    get_item/2,
    take_off/3,
    permanent/0,
    make_items/6,
    get_role_data/1,
    role_delete/1,
    get_market_item/1
]).

-export([
    stat/2,
    convert_items/2
]).

info() ->
    [
    ].

init() ->
    svr_timer:register(?TIMER_MIN),
    timer:send_interval(?HALF_HOUR * 1000, self(), interval_save),
    RoleItems = load_market_item(),
    load_role_data(RoleItems).

load_market_item() ->
    List = db:get_all(?SQL_GET_MARKET_ITEM),
    Fun = fun([Uid, Cid, Tag, Type, Name, Owner, Price, Num, Stat, StartTime, EndTime,
        DbFollower, DbProperty], Acc) ->
        Follower = type:convert_db_field(list, DbFollower, []),
        Property = type:convert_db_field(map, DbProperty, #{}),
        MarketItem = #market_item{
            uid = Uid, cid = Cid, tag = Tag, type = Type, name = Name, owner = Owner,
            price = Price, num = Num, stat = Stat, start_time = StartTime,
            end_time = EndTime, follower = Follower, property = Property
        },
        set_market_item(MarketItem),
        dict:append(Owner, Uid, Acc)
    end,
    lists:foldl(Fun, dict:new(), List).

load_role_data(RoleItems) ->
    List = db:get_all(?SQL_GET_MARKET_ROLE),
    Fun = fun([RoleID, Volume, Turnover, UseGold, _DbItems, DbFollow]) ->
%%        Items = type:convert_db_field(list, DbItems, []),
        Items = util:dict_find(RoleID, RoleItems, []),
        Follow = type:convert_db_field(list, DbFollow, []),
        RoleData = ?market_role#{
            role_id => RoleID, volume => Volume, turnover => Turnover,
            use_gold => UseGold, items => Items, follow => Follow
        },
        set_role_data(RoleID, RoleData)
    end,
    lists:foreach(Fun, List).

permanent() ->
    List1 = ets:foldl(fun({Uid, _}, Acc) ->
        MarketItem = get_market_item(Uid),
        #market_item{uid = Uid, cid = Cid, tag = Tag, type = Type, name = Name,
            owner = Owner, price = Price, num = Num, stat = Stat, start_time = StartTime,
            end_time = EndTime, follower = Follower, property = Property} = MarketItem,
        DbFollower = type:term_to_bitstring(Follower),
        DbProperty = type:term_to_bitstring(Property),
        [[Uid, Cid, Tag, Type, Name, Owner, Price, Num, Stat, StartTime, EndTime, DbFollower, DbProperty] | Acc]
    end, [], ?ETS_MARKET_ITEM_U),
    db:insert_values(?SQL_SET_MARKET_ITEM2, ?SQL_SET_MARKET_ITEM3, List1),
    util:cls_ets(?ETS_MARKET_ITEM_U),

    List2 = ets:foldl(fun({RoleID, _}, Acc) ->
        RoleData = get_role_data(RoleID),
        #{volume := Volume, turnover := Turnover, use_gold := UseGold,
            items := Items, follow := Follow} = RoleData,
        DbItems = type:term_to_bitstring(Items),
        DbFollow = type:term_to_bitstring(Follow),
        [[RoleID, Volume, Turnover, UseGold, DbItems, DbFollow] | Acc]
    end, [], ?ETS_MARKET_ROLE_U),
    db:insert_values(?SQL_SET_MARKET_ROLE2, ?SQL_SET_MARKET_ROLE3, List2),
    util:cls_ets(?ETS_MARKET_ROLE_U),
    ok.

%% -----------------------------------------------------------------------------
role_delete(RoleIDs) ->
    lists:foreach(fun(RoleID) ->
        RoleData = lib_market:get_role_data(RoleID),
        #{items := IDList} = RoleData,
        IDList =/= [] andalso [begin
            case get_market_item(Id) of
                MarketItem = #market_item{uid = Uid} ->
                    del_market_item(MarketItem),
                    ets:delete(?ETS_MARKET_ITEM_U, Uid);
                _ ->
                    ok
            end
        end || Id <- IDList],
        ets:delete(?ETS_MARKET_ROLE_U, RoleID)
    end, RoleIDs).

get_info(RoleID) ->
    RoleData = lib_market:get_role_data(RoleID),
    #{volume := Volume, turnover := TurnOver, use_gold := UseGold, items := IDList,
        follow := Follow} = RoleData,
    Rec = #sc_market_info{
        volume = Volume, turnover = TurnOver, use_gold = UseGold,
        items = convert_items(collect_items(IDList, []), RoleID),
        follow = convert_items(collect_items(Follow, []), RoleID)
    },
    {ok, Bin} = prot_msg:encode_msg(42502, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

collect_items([], Acc) ->
    Acc;
collect_items([ID | T], Acc) ->
    Item = get_market_item(ID),
    collect_items(T, [Item | Acc]).

search(RoleID, TagID, CID, Stat) ->
    Pattern = ets:fun2ms(fun(#market_item{tag = ITag, cid = IID, stat = IStat} = Item)
        when ITag =:= TagID, (CID =:= 0 orelse CID =:= IID), Stat =:= IStat -> Item
    end),
    ItemList = ets:select(?ETS_MARKET_ITEM, Pattern),
    Rec = #sc_market_search{
        tag = TagID, id = CID, stat = Stat,
        items = convert_items(merge_items(ItemList, RoleID), RoleID)
    },
    {ok, Bin} = prot_msg:encode_msg(42506, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

get_item(RoleID, ID) ->
    MarketItem = get_market_item(ID),
    case MarketItem =/= undefined of
        true ->
            Rec = #sc_market_rare_item{
                item = convert_item(MarketItem, RoleID),
                goods = convert_goods_info(MarketItem)
            },
            {ok, Bin} = prot_msg:encode_msg(42508, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        _ ->
            ?ERROR_TOC(RoleID, ?RC_MARKET_ITEM_NOT_FOUND)
    end.

get_pet(RoleID, Uid) ->
    MarketItem = get_market_item(Uid),
    case MarketItem =/= undefined of
        true ->
            Rec = #sc_market_rare_pet{
                item = convert_item(MarketItem, RoleID),
                pet = convert_pet_info(MarketItem)
            },
            {ok, Bin} = prot_msg:encode_msg(42510, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        _ ->
            ?ERROR_TOC(RoleID, ?RC_MARKET_ITEM_NOT_FOUND)
    end.

follow(RoleID, Uid, Opt) ->
    case catch check_follow(RoleID, Uid, Opt) of
        {ok, RoleID, RoleData, MarketItem} ->
            update_role_data(RoleID, RoleData),
            update_market_item(MarketItem),
            Rec = #sc_market_follow{uid = Uid, opt = Opt},
            {ok, Bin} = prot_msg:encode_msg(42512, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            ?ERROR_TOC(RoleID, Code)
    end.

check_follow(RoleID, Uid, Opt) ->
    MItem = get_market_item(Uid),
    MItem =/= undefined orelse erlang:throw({error, ?RC_MARKET_ITEM_NOT_FOUND}),
    #market_item{follower = Follower, owner = Owner} = MItem,
    RoleData = get_role_data(RoleID),
    #{follow := Follow} = RoleData,
    RoleID =/= Owner orelse erlang:throw({error, ?RC_MARKET_FOLLOW_SELF_ITEM}),
    case Opt of
        1 ->
            lists:member(RoleID, Follower) andalso erlang:throw({error, ?RC_MARKET_ALREADY_FOLLOWER}),
            MaxFollow = config:get_sys_config(market_max_follow),
            length(Follow) < MaxFollow orelse erlang:throw({error, ?RC_MARKET_MAX_FOLLOW_NUM}),
            NewFollower = [RoleID | Follower],
            NewFollow = [Uid | Follow];
        _ ->
            NewFollower = lists:delete(RoleID, Follower),
            NewFollow = lists:delete(Uid, Follow)
    end,
    NewMItem = MItem#market_item{follower = NewFollower},
    NewData = RoleData#{follow => NewFollow},
    {ok, RoleID, NewData, NewMItem}.

put_on(RoleID, Items) ->
    case catch check_put_on(RoleID, Items) of
        {ok, RoleID, RoleData} ->
            update_role_data(RoleID, RoleData),
            update_market_items(Items),
            ok;
        {error, Code} ->
            {error, Code}
    end.

check_put_on(RoleID, Items) ->
    RoleData = get_role_data(RoleID),
    #{items := ItemList, volume := Volume, turnover := Turnover} = RoleData,
    MaxNum = conf_market_level:get_limit({Turnover, Volume}),
    length(Items) + length(ItemList) =< MaxNum orelse erlang:throw({error, ?RC_MARKET_PUT_ON_NUM_LIMIT}),
    IDList = [ID || #market_item{uid = ID} <- Items],
    NewItems = IDList ++ ItemList,
    NewData = RoleData#{items => NewItems},
    {ok, RoleID, NewData}.

take_off(RoleID, Uid, Room) ->
    case catch check_take_off(RoleID, Uid, Room) of
        {ok, Item} ->
            del_market_item(Item),
            {ok, Item};
        {error, Code} ->
            {error, Code}
    end.

check_take_off(RoleID, Uid, Room) ->
    MarketItem = get_market_item(Uid),
    MarketItem =/= undefined orelse erlang:throw({error, ?RC_MARKET_ITEM_NOT_FOUND}),
    #market_item{owner = OwnerID, tag = TagID, stat = Stat} = MarketItem,
    RoleID =:= OwnerID orelse erlang:throw({error, ?RC_MARKET_NOT_OWNER}),
    Stat =/= ?MARKET_STAT_SOLD orelse erlang:throw({error, ?RC_MARKET_ITEM_SOLD}),
    Stat =/= ?MARKET_STAT_DESTROY orelse erlang:throw({error, ?RC_MARKET_ITEM_DESTROY}),
    ConfTag = conf_market_tag:get(TagID),
    #{type := Type} = ConfTag,
    check_room(Type, 1, Room),
    {ok, MarketItem}.

resale(RoleID, Uid, Coin) ->
    case catch check_resale(RoleID, Uid, Coin) of
        {ok, ItemList, Fee} ->
            [update_market_item(Item) || Item <- ItemList],
            {ok, Fee, ItemList};
        {error, Code} ->
            {error, Code}
    end.

check_resale(RoleID, Uid, Coin) ->
    RoleData = get_role_data(RoleID),
    #{items := IDList} = RoleData,
    {ItemList, Fee} = filter_expired(?iif(Uid > 0, [Uid], IDList), [], 0),
    ItemList =/= [] orelse erlang:throw({error, ?RC_MARKET_NOTHING_RESALE}),
    Coin >= Fee orelse erlang:throw({error, ?RC_COIN_LIMIT}),
    {ok, ItemList, Fee}.

filter_expired([], Acc, FAcc) ->
    {Acc, FAcc};
filter_expired([ID | T], Acc, FAcc) ->
    case get_market_item(ID) of
        #market_item{stat = ?MARKET_STAT_EXPIRE, tag = TagID, price = Price, num = Num} = Item ->
            ConfTag = conf_market_tag:get(TagID),
            valid(Item),
            {Stat, StartTime, EndTime} = stat(?MARKET_STAT_NONE, ConfTag),
            #{fee_ratio := FeeRatio, min_fee := MinFee} = ConfTag,
            Fee = erlang:max(erlang:floor(FeeRatio * Price * Num), MinFee),
            NewItem = Item#market_item{
                stat = Stat, start_time = StartTime, end_time = EndTime
            },
            filter_expired(T, [NewItem | Acc], Fee + FAcc);
        _ ->
            filter_expired(T, Acc, FAcc)
    end.

buy(RoleID, Args) ->
    case catch check_buy(RoleID, Args) of
        {ok, RoleID, RoleData, ConfTag, BuyList, Price, Costs, Log} ->
            ItemList = [Item#market_item{num = Num} || {Item, Num} <- BuyList],
            update_role_data(RoleID, RoleData),
            settle_up(BuyList, ConfTag, Price, RoleID),
            log_trade(Log),
            {ok, ItemList, Costs};
        {error, Code} ->
            {error, Code}
    end.

check_buy(RoleID, Args) ->
    #{uid := Uid, type := Type0, cid := CID0, price := Price0, num := Num,
        room := Room, assets := Assets} = Args,
    Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    case Uid > 0 of
        true ->
            MItem = get_market_item(Uid),
            MItem =/= undefined orelse erlang:throw({error, ?RC_MARKET_ITEM_NOT_FOUND}),
            ItemList = [MItem], NeedRoom = 1,
            #market_item{price = Price, tag = TagID, name = Name, owner = Owner, stat = Stat} = MItem,
            Owner =/= RoleID orelse erlang:throw({error, ?RC_MARKET_BUY_SELF_ITEM}),
            Stat =:= ?MARKET_STAT_SELLING orelse erlang:throw({error, ?RC_MARKET_ITEM_NOT_SELLING});
        _ ->
            Pattern = ets:fun2ms(fun(#market_item{type = IType, cid = IID, price = IPrice, stat = Stat, owner = Owner} = Item)
                when Type0 =:= IType, CID0 =:= IID, IPrice =:= Price0, Stat =:= ?MARKET_STAT_SELLING, Owner =/= RoleID ->
                Item
            end),
            ItemList = ets:select(?ETS_MARKET_ITEM, Pattern),
            ItemList =/= [] orelse erlang:throw({error, ?RC_MARKET_NO_SATISFY_ITEMS}),
            [#market_item{tag = TagID, name = Name} | _] = ItemList,
            #{overlap := COverlap} = conf_goods:get(CID0),
            Price = Price0, NeedRoom = erlang:ceil(Num / COverlap)
    end,
    ConfTag = conf_market_tag:get(TagID),
    #{buy_money := BuyMType, rare := Rare, type := Type} = ConfTag,
    Rare =:= 0 orelse Num =:= 1 orelse erlang:throw({error, ?RC_MARKET_BUY_RARE_NUM_LIMIT}),
    Rare =:= 1 andalso Uid =:= 0 andalso erlang:throw({error, ?RC_MARKET_BUY_RARE_TYPE_LIMIT}),
    check_room(Type, NeedRoom, Room),
    TotalPrice = erlang:floor(Price * Num),
    RoleData = get_role_data(RoleID),
    #{use_gold := UseGold} = RoleData,
    Money = lib_role_money:get_money(Assets, BuyMType),
    Money >= TotalPrice orelse erlang:throw({error, lib_role_money:ret_code(BuyMType)}),
    if
        BuyMType =:= ?AST_GOLD ->
            Limit = conf_market_limit:get(UseGold),
            Limit >= TotalPrice orelse erlang:throw({error, ?RC_MARKET_USE_GOLD_LIMIT}),
            NewUseGold = UseGold + TotalPrice;
        true ->
            NewUseGold = UseGold
    end,
    NewData = RoleData#{use_gold => NewUseGold},
    BuyList = select_items(ItemList, Num),
    Costs = [{BuyMType, TotalPrice}],
    Log = [RoleID, 1, Name, Num, BuyMType, TotalPrice, time:unixtime()],
    {ok, RoleID, NewData, ConfTag, BuyList, Price, Costs, Log}.

select_items(List, TNum) ->
    Now = time:unixtime(),
    Fun = fun(Item) ->
        #market_item{uid = Uid, start_time = StartTime, num = Num} = Item,
        Ratio = conf_market_time:get(erlang:floor((Now - StartTime) / 3600)),
        Weight = conf_market_weight:get(Num),
        {Uid, erlang:floor(Weight * Ratio), Item}
    end,
    WList = lists:sort(lists:map(Fun, List)),
    select_items2(TNum, WList, []).

select_items2(0, _WList, Acc) ->
    Acc;
select_items2(_, [], _Acc) ->
    erlang:throw({error, ?RC_MARKET_ITEM_NOT_ENOUGH});
select_items2(Num, WList, Acc) ->
    {Uid, _, Item} = util:rand_by_weight(WList, 2),
    #market_item{num = INum} = Item,
    case INum >= Num of
        true ->
            [{Item#market_item{num = INum - Num}, Num} | Acc];
        _ ->
            NewWList = lists:keydelete(Uid, 1, WList),
            select_items2(Num - INum, NewWList, [{Item#market_item{num = 0}, INum} | Acc])
    end.

settle_up(BuyList, ConfTag, Price, RoleID) ->
    Now = time:unixtime(),
    #{rare := Rare, tax_ratio := TaxRatio, sell_money := MType} = ConfTag,
    if
        Rare =:= 1 -> MailID = config:get_sys_config(market_rare_item_sold_mail);
        true -> MailID = config:get_sys_config(market_item_sold_mail)
    end,
    settle_up(BuyList, Price, RoleID, TaxRatio, MType, MailID, Now).

settle_up([], _Price, _Buyer, _TaxRatio, _MType, _MailID, _Time) ->
    ok;
settle_up([{MarketItem, Num} | T], Price, Buyer, TaxRatio, MType, MailID, Time) ->
    #market_item{uid = Uid, num = LeftNum, owner = RoleID, name = Name} = MarketItem,
    Outcome0 = Price * Num, Tax = erlang:floor(Outcome0 * TaxRatio / 100),
    Outcome = Outcome0 - Tax,
    if
        LeftNum =:= 0 ->
            NewItem = MarketItem#market_item{stat = ?MARKET_STAT_SOLD, buyer = Buyer},
            del_market_item(NewItem);
        true ->
            NewItem = MarketItem,
            update_market_item(NewItem)
    end,
    RoleID > 0 andalso begin
        Rewards = [{MType, Outcome}],
        svr_mail:sys2p(RoleID, MailID, [Name, Num, Outcome0, Tax], Rewards, ?OPT_MARKET_SELL)
    end,
    if
        RoleID > 0 andalso MType =:= ?AST_SILVER ->
            RoleData = get_role_data(RoleID),
            #{volume := Volume, turnover := Turnover} = RoleData,
            NewData = RoleData#{volume => Volume + Num, turnover => Turnover + Outcome0},
            update_role_data(RoleID, NewData);
        true ->
            ignore
    end,
    log_trade([RoleID, 2, Name, Num, MType, Outcome0, Time]),
    log_item([Uid, Buyer, Num, Time]),
    settle_up(T, Price, Buyer, TaxRatio, MType, MailID, Time).

%% -----------------------------------------------------------------------------

loop(Now) ->
    Fun = ets:fun2ms(fun(#market_item{end_time = EndTime, stat = Stat} = Item)
        when EndTime > 0, EndTime =< Now, Stat =< ?MARKET_STAT_SOLD -> Item
    end),
    [handle_expire(Item) || Item <- ets:select(?ETS_MARKET_ITEM, Fun)],
    if
        Now rem (10 * 60) =:= 0 -> auto_put_on(Now);
        true -> ignore
    end,
    ok.

handle_expire(#market_item{owner = 0, stat = Stat} = Item) when Stat >= ?MARKET_STAT_SELLING ->
    del_market_item(Item);
handle_expire(#market_item{stat = ?MARKET_STAT_EXPIRE} = MarketItem) ->
    #market_item{owner = Owner, name = Name} = MarketItem,
    Owner > 0 andalso send_remove_mail(Owner, Name),
    del_market_item(MarketItem);
handle_expire(MarketItem) ->
    #market_item{stat = CurStat, tag = TagID, uid = Uid, follower = Followers,
        owner = Owner} = MarketItem,
    ConfTag = conf_market_tag:get(TagID),
    {NewStat, StartTime, EndTime} = stat(CurStat, ConfTag),
    if
        NewStat =:= ?MARKET_STAT_EXPIRE ->
            remove_followers(Followers, Uid),
            NewFollowers = [],
            Owner > 0 andalso send_expire_mail(Owner);
        true ->
            NewFollowers = Followers
    end,
    NewMarketItem = MarketItem#market_item{
        stat = NewStat, start_time = StartTime, end_time = EndTime,
        follower = NewFollowers
    },
    update_market_item(NewMarketItem),
    refresh_item(NewMarketItem),
    ok.

send_expire_mail(Owner) ->
    ExpMail = config:get_sys_config(market_item_expire_mail),
    svr_mail:sys2p(Owner, ExpMail, [], ?OPT_MARKET_EXPIRE).

send_remove_mail(Owner, Name) ->
    ExpMail = config:get_sys_config(market_item_remove_mail),
    svr_mail:sys2p(Owner, ExpMail, [Name], [], ?OPT_MARKET_EXPIRE).

auto_put_on(Now) ->
    Fun = fun(MarketItem, Acc) ->
        #market_item{stat = Stat, num = Num, type = Type, cid = CID} = MarketItem,
        case Stat =:= ?MARKET_STAT_SELLING andalso Type =:= 1
            andalso Num > 0 of
            true -> sets:add_element(CID, Acc);
            _ -> Acc
        end
    end,
    OnSale = ets:foldl(Fun, sets:new(), ?ETS_MARKET_ITEM),
    AutoItems = conf_market_item:auto_items(),
    auto_put_on(AutoItems, Now, OnSale).

auto_put_on([], _, _) ->
    ok;
auto_put_on([ID | T], Now, OnSale) ->
    case sets:is_element(ID, OnSale) orelse
        auto_sale_today(ID, Now) of
        true ->
            auto_put_on(T, Now, OnSale);
        _ ->
            auto_sale(conf_market_item:get(ID), Now),
            auto_put_on(T, Now, OnSale)
    end.

auto_sale(ConfItem, Now) ->
    #{id := ID, tag := TagID, auto := Num, high := HighPrice} = ConfItem,
    ConfTag = conf_market_tag:get(TagID),
    Items = make_items(0, ConfTag, ID, Num, HighPrice, #{}),
    update_market_items(Items),
    set_sale_today(ID, Now),
    ok.

set_sale_today(ID, Now) ->
    util:put_ets(?ETS_MARKET, {auto_sale, ID}, Now).

auto_sale_today(ID, Now) ->
    case util:get_ets(?ETS_MARKET, {auto_sale, ID}) of
        LastTime when is_integer(LastTime) ->
            time:is_same_day(LastTime, Now);
        _ ->
            false
    end.

%% -----------------------------------------------------------------------------

merge_items(Items, RoleID) ->
    {VList, VDict} = merge_items(Items, RoleID, [], dict:new()),
    VList ++ util:dict_values(VDict).

merge_items([], _RoleID, VAcc, NAcc) ->
    {VAcc, NAcc};
merge_items([Item | T], RoleID, VAcc, NAcc) ->
    #market_item{tag = Tag, cid = CID, price = Price, num = Num, owner = Owner} = Item,
    ConfTag = conf_market_tag:get(Tag),
    #{rare := Rare, type := Type} = ConfTag,
    if
        Rare =:= 0 andalso Owner =:= RoleID ->
            merge_items(T, RoleID, VAcc, NAcc);
        Rare =:= 0 andalso Type =:= 1 ->
            case util:dict_find({Tag, CID, Price}, NAcc) of
                #market_item{num = ONum} = MItem ->
                    merge_items(T, RoleID, VAcc, dict:store({Tag, CID, Price}, MItem#market_item{num = ONum + Num}, NAcc));
                _ ->
                    merge_items(T, RoleID, VAcc, dict:store({Tag, CID, Price}, Item#market_item{uid = 0}, NAcc))
            end;
        true ->
            merge_items(T, RoleID, [Item | VAcc], NAcc)
    end.

convert_items(Items, RoleID) ->
    convert_items(Items, RoleID, []).

convert_items([], _RoleID, Acc) ->
    Acc;
convert_items([Item | T], RoleID, Acc) ->
    convert_items(T, RoleID, [convert_item(Item, RoleID) | Acc]).

convert_item(Uid, RoleID) when is_integer(Uid) ->
    convert_item(get_market_item(Uid), RoleID);
convert_item(MarketItem, RoleID) ->
    #market_item{uid = Uid, cid = ID, tag = Tag, price = Price, num = Num,
        stat = Stat, end_time = EndTime, follower = Followers} = MarketItem,
    Following = ?iif(lists:member(RoleID, Followers), 1, 0),
    #clt_market_goods{
        uid = Uid, tag = Tag, id = ID, price = Price, num = Num, stat = Stat,
        end_time = EndTime, follower = length(Followers), following = Following
    }.

convert_goods_info(MarketItem) ->
    #market_item{property = Property} = MarketItem,
    lib_goods_util:convert_goods_info(maps:merge(?bag_goods, Property)).

convert_pet_info(MarketItem) ->
    #market_item{property = Property} = MarketItem,
    data_transfer:sc_clt_pet({0, maps:merge(?pet, Property)}).

make_items(RoleID, ConfTag, CID, Num, Price, Property) ->
    {Stat, StartTime, EndTime} = lib_market:stat(?MARKET_STAT_NONE, ConfTag),
    #{id := TagID, type := Type, overlap := Overlap} = ConfTag,
    case Type < 3 of
        true -> Name = lib_goods_util:get_name(CID);
        _ -> Name = conf_pet:get_name(CID)
    end,
    make_items2(Num, [RoleID, TagID, Type, CID, Overlap, Stat, StartTime, EndTime, Name, Price, Property], []).

make_items2(0, _Args, Acc) ->
    Acc;
make_items2(Num, Args, Acc) ->
    [RoleID, TagID, Type, Gid, Overlap, Stat, StartTime, EndTime, Name, Price, Property] = Args,
    Uid = svr_generator:gen_market_id(),
    ItemNum = erlang:min(Num, Overlap),
    Item = #market_item{
        uid = Uid, cid = Gid, num = ItemNum, tag = TagID, stat = Stat,
        start_time = StartTime, end_time = EndTime, owner = RoleID,
        property = Property, price = Price, name = Name, type = Type
    },
    make_items2(Num - ItemNum, Args, [Item | Acc]).

stat(?MARKET_STAT_NONE, ConfTag) ->
    #{booking := Booking, expire := Expire} = ConfTag,
    Now = util:round(time:unixtime(), 60),
    {Stat, EndTime} = if
        Booking > 0 ->
            {?MARKET_STAT_BOOKING, Now + Booking * ?ONE_HOUR};
        true ->
            {?MARKET_STAT_SELLING, Now + Expire * ?ONE_HOUR}
    end,
    {Stat, Now, EndTime};
stat(?MARKET_STAT_BOOKING, ConfTag) ->
    #{expire := Expire} = ConfTag,
    Now = util:round(time:unixtime(), 60),
    {?MARKET_STAT_SELLING, Now, Now + Expire * ?ONE_HOUR};
stat(?MARKET_STAT_SELLING, ConfTag) ->
    #{rare := Rare} = ConfTag,
    Now = util:round(time:unixtime(), 60),
    Expire = config:get_sys_config(market_expire_time),
    case Rare of
        1 -> {?MARKET_STAT_EXPIRE, Now, 0};
        _ -> {?MARKET_STAT_EXPIRE, Now, Now + Expire * ?ONE_HOUR}
    end.

del_market_item(MarketItem) ->
    #market_item{owner = RoleID, uid = Uid, follower = Followers} = MarketItem,
    remove_followers(Followers, Uid),
    NewItem = MarketItem#market_item{
        stat = ?MARKET_STAT_DESTROY, follower = []
    },
    update_market_item(NewItem),
    if
        RoleID > 0 ->
            RoleData = get_role_data(RoleID),
            #{items := Items} = RoleData,
            NewData = RoleData#{items => lists:delete(Uid, Items)},
            update_role_data(RoleID, NewData);
        true ->
            ignore
    end,
    refresh_item(NewItem),
    ok.

remove_followers([], _Uid) ->
    [];
remove_followers([RoleID | T], Uid) ->
    RoleData = get_role_data(RoleID),
    #{follow := Follow} = RoleData,
    NewData = RoleData#{follow => lists:delete(Uid, Follow)},
    update_role_data(RoleID, NewData),
    remove_followers(T, Uid).

refresh_item(Item) ->
    #market_item{owner = Owner, follower = Follower, buyer = Buyer} = Item,
    Roles = [RID || RID <- [Owner, Buyer], RID > 0] ++ Follower,
    Rec = #sc_market_refresh_item{item = convert_item(Item, 0)},
    {ok, Bin} = prot_msg:encode_msg(42521, Rec),
    lib_role_send:broadcast(Roles, Bin).

valid(#market_item{cid = ID, type = 3}) ->
    valid(conf_market_pet:get(ID));
valid(#market_item{cid = ID}) ->
    valid(conf_market_item:get(ID));
valid(#{valid := Valid}) when Valid > 0 ->
    ok;
valid(#{type := 3}) ->
    erlang:throw({error, ?RC_MARKET_CAN_NOT_SELL_PET});
valid(_) ->
    erlang:throw({error, ?RC_MARKET_CAN_NOT_SELL_ITEM}).

check_room(Type, NeedRoom, Room) ->
    if
        Type < 3 ->
            maps:get(goods, Room, 0) >= NeedRoom orelse erlang:throw({error, ?RC_GOODS_NOT_ENOUGH_ROOM});
        true ->
            maps:get(pet, Room, 0) >= NeedRoom orelse erlang:throw({error, ?RC_PET_BAG_IS_FULL})
    end.

%% -----------------------------------------------------------------------------

log_trade([RoleID | T] = Log) ->
    ?LOG(io_lib:format(?SQL_SET_TRADE_LOG, Log)),
    lib_role:mod_info(RoleID, lib_role_market, {trade_log, T}).

log_item(Log) ->
    ?LOG(io_lib:format(?SQL_SET_MARKET_LOG, Log)).

%% -----------------------------------------------------------------------------

get_market_item(ID) ->
    case ets:lookup(?ETS_MARKET_ITEM, ID) of
        [MarketItem] ->
            MarketItem;
        _ ->
            undefined
    end.

update_market_items(ItemList) ->
    [update_market_item(Item) || Item <- ItemList].

update_market_item(MarketItem) ->
    #market_item{uid = Uid} = MarketItem,
    util:put_ets(?ETS_MARKET_ITEM_U, Uid, 1),
    set_market_item(MarketItem).

set_market_item(MarketItem) ->
    ets:insert(?ETS_MARKET_ITEM, MarketItem).

get_role_data(RoleID) ->
    case util:get_ets(?ETS_MARKET_ROLE, RoleID) of
        RoleData when is_map(RoleData) ->
            RoleData;
        _ ->
            ?market_role#{role_id => RoleID}
    end.

update_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_MARKET_ROLE_U, RoleID, 1),
    set_role_data(RoleID, RoleData).

set_role_data(RoleID, RoleData) ->
    util:put_ets(?ETS_MARKET_ROLE, RoleID, RoleData).
