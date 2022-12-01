%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     拍卖行
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_auction).
-author("Ryuu").

-include("timer.hrl").
-include("assets.hrl").
-include("common.hrl").
-include("auction.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_308.hrl").

%% API
-export([
    bid/1,
    info/0,
    init/0,
    loop/1,
    get_log/3,
    auction/5,
    get_info/2,
    get_item/3,
    permanent/0,
    get_auction_log/1,
    get_auction_info/1
]).

%% @doc info
info() ->
    [
    ].

%% @doc init
init() ->
    svr_timer:register(?TIMER_MIN),
    timer:send_interval(?HALF_HOUR * 1000, self(), interval_save),
    List = db:get_all(?SQL_GET_AUCTION),
    Fun = fun([ID, Type, Scope, Target, DbItems, StartTime, EndTime, DbRoles]) ->
        Items = init_items(type:convert_db_field(list, DbItems, []), []),
        Roles = type:convert_db_field(list, DbRoles, []),
        Auction = ?auction#{
            id => ID, type => Type, scope => Scope, target => Target, items => Items,
            start_time => StartTime, end_time => EndTime, roles => Roles,
            state => ?AUCTION_ONGOING
        },
        set_auction_info(ID, Auction)
    end,
    lists:foreach(Fun, List),
    load_log(),
    ok.

load_log() ->
    SQL = io_lib:format(?SQL_GET_AUCTION_LOG, [?AUCTION_LOG_NUM]),
    List = db:get_all(SQL),
    Fun = fun([Scope, Target, Time, Cid, Price, Deal], Acc) ->
        dict:append({Scope, Target}, {Time, Cid, Price, Deal}, Acc)
    end,
    Dict = lists:foldl(Fun, dict:new(), List),
    dict:map(fun(Scope, Logs) -> set_auction_log(Scope, Logs) end, Dict),
    ok.

%% @doc 保存
permanent() ->
    List = ets:foldl(fun({AuctionID, _}, Acc) ->
        Auction = get_auction_info(AuctionID),
        #{id := ID, type := Type, scope := Scope, target := Target, items := Items,
            start_time := StartTime, end_time := EndTime, roles := Roles,
            state := State} = Auction,
        DbItems = type:term_to_bitstring(Items),
        DbRoles = type:term_to_bitstring(Roles),
        [[ID, Type, Scope, Target, DbItems, StartTime, EndTime, DbRoles, State] | Acc]
    end, [], ?ETS_AUCTION_U),
    db:insert_values(?SQL_SET_AUCTION2, ?SQL_SET_AUCTION3, List),
    util:cls_ets(?ETS_AUCTION_U),
    ok.

%% @doc 上架拍卖
auction(Type, Scope, Target, Roles, IDList) ->
    AID = svr_generator:gen_auction_id(),
    Items = make_items(IDList, AID, Scope, []),
    {StartTime, EndTime} = get_auction_time(Scope),
    Auction = ?auction#{
        id => AID, type => Type, scope => Scope, target => Target, items => Items,
        start_time => StartTime, end_time => EndTime, roles => Roles,
        state => ?AUCTION_ONGOING
    },
    update_auction_info(AID, Auction),
    ok.

make_items([], _AID, _Scope, Acc) ->
    Acc;
make_items([ID | T], AID, Scope, Acc) ->
    Conf = conf_auction_item:get(ID),
    UID = svr_generator:gen_auction_id(),
    Item = ?auction_item#{
        aid => AID, uid => UID, cid => ID, state => ?AUCTION_ONGOING
    },
    make_items(T, AID, Scope, [init_price(Item, Conf, Scope) | Acc]).

%% -----------------------------------------------------------------------------
%% 玩家请求
%% -----------------------------------------------------------------------------

%% @doc 获取信息
get_info(RoleID, GuildID) ->
    [RoleID, GuildID].

%% @doc get auction log
get_log(RoleID, Scope, Target) ->
    Logs = if
        Scope =:= ?AUCTION_SCOPE_GUILD ->
            lib_auction:get_auction_log({?AUCTION_SCOPE_GUILD, Target});
        Scope =:= ?AUCTION_SCOPE_WORLD ->
            lib_auction:get_auction_log({?AUCTION_SCOPE_WORLD, 0});
        true ->
            []
    end,
    Rec = #sc_auction_logs{type = Scope, logs = Logs},
    {ok, Bin} = prot_msg:encode_msg(30804, Rec),
    lib_role_send:send_to_role(RoleID, Bin).

%% @doc get auction item info
get_item(RoleID, AID, UID) ->
    case catch check_get_item(RoleID, AID, UID) of
        {ok, CPrice, Bid, BidRole, State} ->
            Rec = #sc_auction_item{
                aid = AID, uid = UID, price = CPrice, bid = Bid,
                top = BidRole, state = State
            },
            {ok, Bin} = prot_msg:encode_msg(30808, Rec),
            lib_role_send:send_to_role(RoleID, Bin);
        {error, Code} ->
            Code
    end.

check_get_item(RoleID, AID, UID) ->
    Auction = get_auction_info(AID),
    Auction =/= undefined orelse erlang:throw({error, ?RC_AUCTION_NO_SUCH_AUCTION}),
    #{items := Items} = UID,
    Item = map:keyfind(UID, uid, Items),
    Item =/= undefined orelse erlang:throw({error, ?RC_AUCTION_ITEM_NOT_FOUND}),
    #{state := State, bidders := Bidders, price := CPrice, bid_role := BidRole} = Item,
    {SGold, Gold} = util:prop_get_value(RoleID, Bidders, {0, 0}),
    {ok, CPrice, SGold + Gold, BidRole, State}.

%% @doc 拍卖
bid(Args) ->
    case catch check_bid(Args) of
        {ok, AID, Auction, Item, Gold} ->
            update_auction_info(AID, Auction),
            notify_item(Auction, Item),
            is_complete(Auction) andalso settle_up(Auction),
            {ok, Gold};
        {error, Code} ->
            {error, Code}
    end.

check_bid(Args) ->
    [RoleID, GuildID, JoinTime, AID, UID, BType, SGold, Gold] = Args,
    Auction = get_auction_info(AID),
    Auction =/= undefined orelse erlang:throw({error, ?RC_AUCTION_NO_SUCH_AUCTION}),
    #{items := Items, scope := Scope, target := Target, state := AState} = Auction,
    AState =:= ?AUCTION_ONGOING orelse erlang:throw({error, ?RC_AUCTION_COMPLETE}),
    if
        Scope =:= ?AUCTION_SCOPE_GUILD ->
            Target =:= GuildID orelse erlang:throw({error, ?RC_AUCTION_NO_PRIVILEGE}),
            Now = time:unixtime(),
            Now - JoinTime > ?AUCTION_JOIN_GUILD_CD orelse erlang:throw({error, ?RC_AUCTION_JOIN_GUILD_CD});
        true ->
            next
    end,
    Item = map:keyfind(UID, uid, Items),
    Item =/= undefined orelse erlang:throw({error, ?RC_AUCTION_ITEM_NOT_FOUND}),
    #{cid := CID, state := IState, bidders := Bidders, price := CPrice} = Item,
    IState =/= ?AUCTION_FINISH orelse erlang:throw({error, ?RC_AUCTION_ITEM_SOLD}),
    Conf = conf_auction_item:get(CID),
    Conf =/= undefined orelse erlang:throw({error, ?RC_AUCTION_NO_ITEM_CONF}),
    #{inc_price := APrice, now_price := NowPrice} = Conf,
    {CSGold, CGold} = util:prop_get_value(RoleID, Bidders, {0, 0}),
    if
        BType =:= ?AUCTION_BID_NOW -> TPrice = NowPrice;
        true -> TPrice = erlang:min(CPrice + APrice, NowPrice)
    end,
    NeedGold = TPrice - (CSGold + CGold),
    (SGold + Gold) >= NeedGold orelse erlang:throw({error, ?RC_GOLD_LIMIT}),
    if
        BType =:= ?AUCTION_BID_NOW orelse TPrice >= NowPrice ->
            Deal = ?iif(BType =:= ?AUCTION_BID_NOW, ?AUCTION_DEAL_NOW, ?AUCTION_DEAL_BID),
            NewItem = settle_up_item(Auction, Item#{
                bid_role => RoleID, price => NowPrice
            }, Conf, Deal);
        true ->
            {ASGold, AGold} = ?iif(SGold >= NeedGold, {NeedGold, 0}, {SGold, NeedGold - SGold}),
            NewBidders = util:prop_store(RoleID, {CSGold + ASGold, CGold + AGold}, Bidders),
            NewItem = Item#{price => TPrice, bidders => NewBidders, bid_role => RoleID}
    end,
    NewItems = map:keystore(UID, uid, Items, NewItem),
    NewAuction = Auction#{items => NewItems},
    {ok, AID, NewAuction, NewItem, NeedGold}.

%% -----------------------------------------------------------------------------
%% loop
%% -----------------------------------------------------------------------------

%% @doc loop
loop(Now) ->
    Fun = fun({_, Auction}, Acc) ->
        #{end_time := EndTime, state := State} = Auction,
        case EndTime =< Now of
            true when State =/= ?AUCTION_FINISH ->
                [Auction | Acc];
            _ ->
                Acc
        end
    end,
    AList = ets:foldl(Fun, [], ?ETS_AUCTION),
    [begin handle_abortive(Auction) end || Auction <- AList],
    ok.

handle_abortive(#{scope := Scope} = Auction) when Scope =:= ?AUCTION_SCOPE_GUILD ->
    #{id := ID, items := Items} = Auction,
    Fun = fun(Item, {AAcc, FAcc}) ->
        #{cid := CID, state := State, bid_role := BID} = Item,
        Conf = conf_auction_item:get(CID),
        if
            State =:= ?AUCTION_ONGOING andalso BID =:= 0 ->
                {[Item | AAcc], FAcc};
            State =:= ?AUCTION_ONGOING ->
                NewItem = settle_up_item(Auction, Item, Conf, ?AUCTION_DEAL_BID),
                {AAcc, [NewItem | FAcc]};
            true ->
                {AAcc, [Item | FAcc]}
        end
    end,
    {AList, FList} = lists:foldl(Fun, {[], []}, Items),
    NewAuction0 = Auction#{items => AList ++ FList},
    case AList of
        [] ->
            settle_up(NewAuction0);
        _ ->
            {StartTime, EndTime} = get_auction_time(?AUCTION_SCOPE_WORLD),
            NewAuction = NewAuction0#{
                scope => ?AUCTION_SCOPE_WORLD, target => 0, start_time => StartTime,
                end_time => EndTime, items => re_init_price(AList, ?AUCTION_SCOPE_WORLD, FList)
            },
            update_auction_info(ID, NewAuction)
    end;
handle_abortive(Auction) ->
    settle_up(Auction).

%% @doc settle up
settle_up(Auction) ->
    #{id := ID, type := Type, items := Items, roles := Roles} = Auction,
    {NewItems, Bonus} = settle_up_items(Items, Auction, [], 0),
    NewAuction = Auction#{items => NewItems, state => ?AUCTION_FINISH},
    update_auction_info(ID, NewAuction),
    BonusMail = config:get_sys_config(auction_bonus_mail),
    Source = conf_auction_type:get_name(Type),
    MinNum = config:get_sys_config(auction_bonus_min_num),
    RoleNum = erlang:length(Roles),
    DivNum = erlang:max(MinNum, RoleNum),
    MaxBonus = config:get_sys_config(auction_bonus_max_bonus),
    [begin
        RBonus = erlang:min(MaxBonus, erlang:floor(Bonus * Ratio / DivNum)),
        Reward = [{?AST_BGOLD, RBonus}],
        svr_mail:sys2p(RID, BonusMail, [Source], Reward, ?OPT_AUCTION_BONUS)
    end || {RID, Ratio} <- Roles],
    ok.

settle_up_items([], _Type, ItemAcc, BonusAcc) ->
    {ItemAcc, BonusAcc};
settle_up_items([Item | T], Auction, ItemAcc, BonusAcc) ->
    #{cid := CID, state := State, price := Price, bid_role := BID, deal := Deal0} = Item,
    Conf = conf_auction_item:get(CID),
    #{price := OrigPrice, now_price := NowPrice} = Conf,
    if
        State =:= ?AUCTION_ONGOING andalso BID =:= 0 ->
            Ratio = config:get_sys_config(auction_bonus_abort_ratio),
            Bonus = erlang:floor(OrigPrice * Ratio),
            Deal = ?AUCTION_DEAL_SYS;
        State =:= ?AUCTION_ONGOING ->
            settle_up_item(Auction, Item, Conf, ?AUCTION_DEAL_BID),
            Bonus = erlang:floor(Price * conf_auction_ratio:get(Price / NowPrice)),
            Deal = ?AUCTION_DEAL_BID;
        Deal0 =:= ?AUCTION_DEAL_NOW ->
            Bonus = erlang:floor(Price * config:get_sys_config(auction_bonus_now_ratio)),
            Deal = Deal0;
        true ->
            Bonus = erlang:floor(Price * conf_auction_ratio:get(Price / NowPrice)),
            Deal = Deal0
    end,
    NewItem = Item#{state => ?AUCTION_FINISH, deal => Deal},
    settle_up_items(T, Auction, [NewItem | ItemAcc], Bonus + BonusAcc).

settle_up_item(Auction, Item, Conf, DealType) ->
    #{item := {ItemID, Num}} = Conf,
    #{bid_role := BID, bidders := Roles, price := Price} = Item,
    #{type := Type, scope := Scope, target := Target} = Auction,
    Reward = [{?AST_ITEM, [{ItemID, Num}]}],
    Source = conf_auction_type:get_name(Type),
    ItemName = lib_goods_util:get_name(ItemID),
    RewardMail = reward_mail(DealType),
    svr_mail:sys2p(BID, RewardMail, [Source, Price, ItemName, Num], Reward, ?OPT_AUCTION_REWARD),
    ReturnMail = config:get_sys_config(auction_return_mail),
    [begin
        svr_mail:sys2p(RID, ReturnMail, [Source], [{?AST_SGOLD, SGold}, {?AST_GOLD, Gold}], ?OPT_AUCTION_RETURN)
    end || {RID, {SGold, Gold}} <- Roles, RID =/= BID],
    log_settle_up(Scope, Target, Item, DealType, ItemID, Num),
    Item#{state => ?AUCTION_FINISH, deal => DealType}.

log_settle_up(Scope, Target, Item, DealType, ItemID, Num) ->
    Now = time:unixtime(),
    #{aid := AID, uid := UID, cid := CID, bid_role := BID, price := Price} = Item,
    ?LOG(io_lib:format(?SQL_SET_AUCTION_LOG, [
        AID, UID, CID, ItemID, Num, BID, Scope, Target, Price, DealType, Now
    ])),
    add_auction_log({Scope, Target}, {Now, CID, Price, DealType}),
    ok.

%% -----------------------------------------------------------------------------

%% @doc notify item update
notify_item(Auction, Item) ->
    #{aid := AID, uid := UID, price := Price, bid_role := BidRole,
        bidders := _Bidders, state := State} = Item,
    Rec = #sc_auction_item_notify{
        aid = AID, uid = UID, price = Price, state = State, top = BidRole
    },
    {ok, Bin} = prot_msg:encode_msg(30809, Rec),
    broadcast_auction(Auction, Bin).

broadcast_auction(Auction, Bin) ->
    #{scope := Scope, target := Target} = Auction,
    if
        Scope =:= ?AUCTION_SCOPE_GUILD ->
            lib_guild:broadcast(Target, Bin);
        Scope =:= ?AUCTION_SCOPE_WORLD ->
            svr_role_agent:broadcast(Bin);
        true ->
            ignore
    end.

%% -----------------------------------------------------------------------------

init_items([], Acc) ->
    Acc;
init_items([Item | T], Acc) ->
    init_items(T, [maps:merge(?auction_item, Item) | Acc]).

re_init_price([], _Scope, Acc) ->
    Acc;
re_init_price([Item | T], Scope, Acc) ->
    #{cid := CID} = Item,
    Conf = conf_auction_item:get(CID),
    NewItem = init_price(Item, Conf, Scope),
    re_init_price(T, Scope, [NewItem | Acc]).

init_price(Item, Conf, Scope) ->
    #{price := Price, value_rates := ValueRates, value_price := ValuePrice} = Conf,
    Rate = util:prop_get_value(Scope, ValueRates, 0),
    case Rate > 0 andalso util:is_bingo(Rate) of
        true ->
            Item#{value => 1, price => ValuePrice};
        _ ->
            Item#{value => 0, price => Price}
    end.

is_complete(Auction) ->
    #{items := Items} = Auction,
    [1 || #{state := FState} <- Items, FState =/= ?AUCTION_FINISH] =:= [].

get_auction_time(Scope) ->
    Now = time:unixtime(),
    LastTime = get_last_time(Scope),
    {Now, Now + LastTime}.

get_last_time(?AUCTION_SCOPE_GUILD) ->
    ?AUCTION_TIME_GUILD;
get_last_time(?AUCTION_SCOPE_WORLD) ->
    ?AUCTION_TIME_WORLD;
get_last_time(_) ->
    3600.

reward_mail(?AUCTION_DEAL_NOW) ->
    config:get_sys_config(auction_reward_mail_now);
reward_mail(?AUCTION_DEAL_BID) ->
    config:get_sys_config(auction_reward_mail_bid);
reward_mail(_) ->
    0.

%% -----------------------------------------------------------------------------
%% 拍卖数据
%% -----------------------------------------------------------------------------

get_auction_info(ID) ->
    util:get_ets(?ETS_AUCTION, ID).

update_auction_info(ID, Info) ->
    util:put_ets(?ETS_AUCTION_U, ID, 1),
    set_auction_info(ID, Info).

set_auction_info(ID, Info) ->
    util:put_ets(?ETS_AUCTION, ID, Info).

add_auction_log(Scope, Log) ->
    Logs = get_auction_log(Scope),
    NewLogs = util:sublist([Log | Logs], 1, ?AUCTION_LOG_NUM),
    set_auction_log(Scope, NewLogs).

get_auction_log(Scope) ->
    case util:get_ets(?ETS_AUCTION_LOG, Scope) of
        Logs when is_list(Logs) ->
            Logs;
        _ ->
            []
    end.

set_auction_log(Scope, Logs) ->
    util:put_ets(?ETS_AUCTION_LOG, Scope, Logs).
