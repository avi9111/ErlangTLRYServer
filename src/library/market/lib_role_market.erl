%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     市场
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_market).
-author("Ryuu").

-include("pet.hrl").
-include("role.hrl").
-include("goods.hrl").
-include("market.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_425.hrl").

%% API
-export([
    do/3,
    init/1,
    handle_info/2
]).

do(42501, PS, _) ->
    send_info(PS);
do(42503, PS, _) ->
    get_log(PS);
do(42505, PS, #cs_market_search{id = ID, tag = Tag, stat = Stat}) ->
    search(PS, Tag, ID, Stat);
do(42507, PS, #cs_market_rare_item{uid = Uid}) ->
    get_item(PS, Uid);
do(42509, PS, #cs_market_rare_pet{uid = Uid}) ->
    get_pet(PS, Uid);
do(42511, PS, #cs_market_follow{uid = Uid, opt = Opt}) ->
    follow(PS, Uid, Opt);
do(42513, PS, #cs_market_put_on{type = Type, pos = Pos, price = Price, num = Num}) ->
    put_on(PS, Type, Pos, Price, Num);
do(42515, PS, #cs_market_take_off{uid = Uid}) ->
    take_off(PS, Uid);
do(42517, PS, #cs_market_resale{uid = Uid}) ->
    resale(PS, Uid);
do(42519, PS, #cs_market_buy{uid = Uid, type = Type, id = CID, price = Price, num = Num}) ->
    buy(PS, Uid, Type, CID, Price, Num);
do(_Cmd, _PS, _Req) ->
    ok.

handle_info({trade_log, Log}, _PS) ->
    add_trade_log(Log);
handle_info(_Info, _PS) ->
    ignore.

send_info(PS) ->
    lib_market:get_info(PS#role_state.id).
%%    svr_market:get_info(PS#role_state.id).

get_log(PS) ->
    Rec = #sc_market_log{logs = get_trade_log()},
    {ok, Bin} = prot_msg:encode_msg(42504, Rec),
    lib_role_send:send_to_role(PS, Bin).

search(PS, Tag, ID, Stat) ->
    lib_market:search(PS#role_state.id, Tag, ID, Stat).
%%    svr_market:search(PS#role_state.id, Tag, ID, Stat).

get_item(PS, Uid) ->
    lib_market:get_item(PS#role_state.id, Uid).
%%    svr_market:get_item(PS#role_state.id, Uid).

get_pet(PS, Uid) ->
    lib_market:get_pet(PS#role_state.id, Uid).
%%    svr_market:get_pet(PS#role_state.id, Uid).

follow(PS, Uid, Opt) ->
    svr_market:follow(PS#role_state.id, Uid, Opt).

put_on(PS, Type, Pos, Price, Num) ->
    case catch check_put_on(PS, Type, Pos, Price, Num) of
        {ok, Costs, Items} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARKET_PUT_ON),
            Rec = #sc_market_put_on{items = lib_market:convert_items(Items, PS#role_state.id)},
            {ok, Bin} = prot_msg:encode_msg(42514, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_put_on(PS, Type, Pos, Price, SNum) ->
    #role_state{id = RoleID} = PS,
    if
        Type =:= 1 ->
            Item = lib_role_goods:get_cell_item(RoleID, ?BAG_ID_ITEM, Pos),
            Item =/= undefined orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_FOUND}),
            #{id := Gid, num := INum, bind := Bind, expire := Expire} = Item,
            Expire =:= 0 orelse erlang:throw({error, ?RC_MARKET_SELL_LIMIT_ITEM}),
            Bind =:= 0 orelse erlang:throw({error, ?RC_MARKET_SELL_BIND_ITEM}),
            INum >= SNum orelse erlang:throw({error, ?RC_GOODS_ITEM_NOT_ENOUGH}),
            ConfMarketItem = conf_market_item:get(Gid),
            ConfMarketItem =/= undefined orelse erlang:throw({error, ?RC_MARKET_CAN_NOT_SELL_ITEM}),
            Costs0 = [{?AST_ITEM_C, [{Pos, SNum}]}];
        true ->
            Item = lib_role_pet:get_pet(Pos),
            Item =/= undefined orelse erlang:throw({error, ?RC_PET_NO_SUCH_PET}),
            #{cid := Pid, stat := PStat, attach_id := AttachID} = Item,
            PStat =:= ?PET_STAT_REST orelse erlang:throw({error, ?RC_MARKET_REST_PET_ONLY}),
            AttachID =:= 0 orelse erlang:throw({error, ?RC_MARKET_PET_ATTACHED}),
            ConfMarketItem = conf_market_pet:get(Pid),
            ConfMarketItem =/= undefined orelse erlang:throw({error, ?RC_MARKET_CAN_NOT_SELL_PET}),
            Costs0 = [{?AST_PET_C, [Pos]}]
    end,
    {ok, Fee, Items} = check_make_items(RoleID, ConfMarketItem, Item, Price, SNum),
    length(Items) > 0 orelse erlang:throw({error, ?RC_MARKET_NOTING_TO_SELL}),
    Costs = [{?AST_COIN, Fee}] ++ Costs0,
    lib_role_assets:check_items_enough(PS, Costs),
    ok = ?MAKE_SURE(svr_market:put_on(RoleID, Items)),
    {ok, Costs, Items}.

check_make_items(RoleID, ConfItem, Item, Price, Num) ->
    Num > 0 orelse erlang:throw({error, ?RC_INVALID_ARGS}),
    #{id := ID, low := Low, high := High, step := Step, tag := TagID} = ConfItem,
    lib_market:valid(ConfItem),
    Price >= Low orelse erlang:throw({error, ?RC_MARKET_LOW_PRICE_LIMIT}),
    Price =< High orelse erlang:throw({error, ?RC_MARKET_HIGH_PRICE_LIMIT}),
    if
        Step > 0 ->
            Step1 = (Price - Low) / Step,
            ValidStep = erlang:ceil(Step1) =:= erlang:floor(Step1),
            ValidStep orelse erlang:throw({error, ?RC_MARKET_NOT_STEP_PRICE});
        true ->
            ignore
    end,
    ConfTag = conf_market_tag:get(TagID),
    #{type := Type, rare := Rare, fee_ratio := FeeRatio, min_fee := MinFee, overlap := Overlap} = ConfTag,
    check_put_on_cd(Rare, Item),
    Property = extract_property(Type, Rare, Item),
    Overlap > 0 orelse erlang:throw({error, ?RC_MARKET_INVALID_OVERLAP}),
    Fee = erlang:max(erlang:floor(FeeRatio * Price * Num), MinFee),
    Items = lib_market:make_items(RoleID, ConfTag, ID, Num, Price, Property),
    {ok, Fee, Items}.

check_put_on_cd(1, Item) ->
    #{sell_time := Time, sell_times := Times} = Item,
    CoolDown = time:unixtime() - Time >= conf_market_cd:get(Times) * ?ONE_HOUR,
    CoolDown orelse erlang:throw({error, ?RC_MARKET_IN_SELL_CD}),
    ok;
check_put_on_cd(_, _) ->
    ok.

extract_property(Type, Rare, Pet) when Rare =:= 1 orelse Type =:= 2 ->
    Pet#{};
extract_property(_, _, _) ->
    #{}.

take_off(PS, Uid) ->
    case catch check_take_off(PS, Uid) of
        {ok, Rewards} ->
            PS1 = lib_role_assets:add_items_notify(PS, Rewards, ?OPT_MARKET_TAKE_OFF),
            Rec = #sc_market_take_off{uid = Uid},
            {ok, Bin} = prot_msg:encode_msg(42516, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_take_off(PS, Uid) ->
    #role_state{id = RoleID} = PS,
    {ok, Item} = ?MAKE_SURE(svr_market:take_off(RoleID, Uid, get_room(RoleID))),
    Rewards = make_reward(Item, false),
    lib_role_assets:check_can_add_items(PS, Rewards), %% already check
    {ok, Rewards}.

resale(PS, Uid) ->
    case catch check_resale(PS, Uid) of
        {ok, Costs, Items} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARKET_RESALE),
            Rec = #sc_market_resale{items = lib_market:convert_items(Items, PS#role_state.id)},
            {ok, Bin} = prot_msg:encode_msg(42518, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_resale(PS, Uid) ->
    #role_state{id = RoleID} = PS,
    Coin = lib_role_money:get_money(PS, ?AST_COIN),
    {ok, Fee, Items} = ?MAKE_SURE(svr_market:resale(RoleID, Uid, Coin)),
    Costs = [{?AST_COIN, Fee}],
    {ok, Costs, Items}.

buy(PS, Uid, Type, CID, Price, Num) ->
    case catch check_buy(PS, Uid, Type, CID, Price, Num) of
        {ok, Costs, Rewards} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_MARKET_BUY),
            PS2 = lib_role_assets:add_items_notify(PS1, Rewards, ?OPT_MARKET_BUY),
            {ok, Bin} = prot_msg:encode_msg(42520, #sc_market_buy{}),
            lib_role_send:send_to_role(PS, Bin),
            PS2;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_buy(PS, Uid, Type, CID, Price, Num) ->
    #role_state{id = RoleID, assets = Assets} = PS,
    Args = #{
        uid => Uid, type => Type, cid => CID, price => Price, num => Num,
        room => get_room(RoleID), assets => Assets
    },
    {ok, Items, Costs} = ?MAKE_SURE(svr_market:buy(RoleID, Args)),
    Rewards = make_rewards(Items, true, []),
    {ok, Costs, Rewards}.

make_rewards([], _Flag, Acc) ->
    Acc;
make_rewards([Item | T], Flag, Acc) ->
    make_rewards(T, Flag, make_reward(Item, Flag) ++ Acc).

make_reward(Item, Flag) ->
    #market_item{property = Property, cid = ID, num = Num, tag = TagID} = Item,
    ConfTag = conf_market_tag:get(TagID),
    #{rare := Rare, type := Type, bind := Bind0} = ConfTag,
    Bind = ?iif(Flag andalso Bind0 =/= 0, ?GOODS_BIND, 0),
    if
        Type =:= 3 ->
            [{?AST_PET, [set_item_cd(Flag, Property)]}];
        Rare =:= 1 ->
            [{?AST_ITEM, [maps:merge(?goods_basic, set_item_cd(Flag, Property#{id => ID, num => Num, bind => Bind}))]}];
        true ->
            [{?AST_ITEM, [?goods_basic#{id => ID, num => Num, bind => Bind}]}]
    end.

set_item_cd(false, Item) ->
    Item;
set_item_cd(true, Item) ->
    #{sell_times := SellTimes} = Item,
    Item#{sell_time => time:unixtime(), sell_times => SellTimes + 1}.

get_room(RoleID) ->
    #{goods => lib_role_goods:get_bag_room(RoleID, ?BAG_ID_ITEM),
        pet => lib_role_pet:get_bag_room()}.

%% -----------------------------------------------------------------------------

init(PS) ->
    #role_state{id = RoleID} = PS,
    SQL = io_lib:format(?SQL_GET_TRADE_LOG, [RoleID, ?MARKET_LOG_NUM]),
    List = db:get_all(SQL),
    set_trade_log(lists:map(fun list_to_tuple/1, List)).

set_trade_log(Logs) ->
    erlang:put({?MODULE, trade_log}, Logs).

get_trade_log() ->
    case erlang:get({?MODULE, trade_log}) of
        Logs when is_list(Logs) -> Logs;
        _ -> []
    end.

add_trade_log(Log) ->
    NewLogs = lists:sublist([list_to_tuple(Log) | get_trade_log()], 1, ?MARKET_LOG_NUM),
    set_trade_log(NewLogs).
