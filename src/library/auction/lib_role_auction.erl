%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     拍卖行
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_role_auction).
-author("Ryuu").

-include("role.hrl").
-include("auction.hrl").
-include("op_type.hrl").
-include("ret_code.hrl").
-include("proto/prot_308.hrl").

%% API
-export([
    do/3,
    handle_info/2
]).

handle_info(_Info, _PS) ->
    ignore.

do(30801, PS, _Req) ->
    send_info(PS);
do(30803, PS, #cs_auction_logs{type = Type}) ->
    get_log(PS, Type);
do(30805, PS, #cs_auction_bid{aid = AID, uid = UID, type = Type}) ->
    bid(PS, AID, UID, Type);
do(30807, PS, #cs_auction_item{aid = AID, uid = UID}) ->
    get_item(PS, AID, UID);
do(_Cmd, _PS, _Req) ->
    ignore.

%% @doc 获取拍卖行信息
send_info(PS) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    {WItems, GItems} = collect_auction(ets:first(?ETS_AUCTION), RoleID, GuildID, [], []),
    Rec = #sc_auction_info{world = WItems, guild = GItems},
    {ok, Bin} = prot_msg:encode_msg(30802, Rec),
    lib_role_send:send_to_role(PS, Bin).

collect_auction('$end_of_table', _RoleID, _GuildID, WAcc, GAcc) ->
    {WAcc, GAcc};
collect_auction(Key, RoleID, GuildID, WAcc, GAcc) ->
    Auction = lib_auction:get_auction_info(Key),
    #{id := ID, scope := Scope, target := Target, items := Items, end_time := Expire,
        state := State} = Auction,
    {NewWAcc, NewGAcc} = if
        State =:= ?AUCTION_FINISH ->
            {WAcc, GAcc};
        Scope =:= ?AUCTION_SCOPE_GUILD andalso Target =:= GuildID ->
            {WAcc, collect_items(Items, RoleID, ID, Expire, GAcc)};
        Scope =:= ?AUCTION_SCOPE_WORLD ->
            {collect_items(Items, RoleID, ID, Expire, WAcc), GAcc};
        true ->
            {WAcc, GAcc}
    end,
    collect_auction(ets:next(?ETS_AUCTION, Key), RoleID, GuildID, NewWAcc, NewGAcc).

collect_items([], _RoleID, _AID, _Expire, Acc) ->
    Acc;
collect_items([Item | T], RoleID, AID, Expire, Acc) ->
    #{uid := UID, cid := CID, price := Price, bid_role := Top, bidders := Roles,
        state := State, value := Value} = Item,
    case State =:= ?AUCTION_FINISH of
        true ->
            collect_items(T, RoleID, AID, Expire, Acc);
        _ ->
            {SGold, Gold} = util:prop_get_value(RoleID, Roles, {0, 0}),
            CItem = {AID, UID, CID, Value, Price, Expire, Top, SGold + Gold},
            collect_items(T, RoleID, AID, Expire, [CItem | Acc])
    end.

%% @doc 获取日志
get_log(PS, Scope) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    lib_auction:get_log(RoleID, Scope, GuildID).

%% @doc 竞价
bid(PS, AID, UID, Type) ->
    case catch check_bid(PS, AID, UID, Type) of
        {ok, Costs} ->
            PS1 = lib_role_assets:cost_items_notify(PS, Costs, ?OPT_AUCTION_BID),
            Rec = #sc_auction_bid{aid = AID, uid = UID, type = Type},
            {ok, Bin} = prot_msg:encode_msg(30806, Rec),
            lib_role_send:send_to_role(PS, Bin),
            PS1;
        {error, Code} ->
            ?ERROR_TOC(PS, Code)
    end.

check_bid(PS, AID, UID, Type) ->
    #role_state{id = RoleID, guild_id = GuildID} = PS,
    SGold = lib_role_money:get_money(PS, ?AST_SGOLD),
    Gold = lib_role_money:get_money(PS, ?AST_GOLD),
    JoinTime = lib_guild:get_join_time(RoleID),
    {ok, CGold} = ?MAKE_SURE(svr_auction:bid([RoleID, GuildID, JoinTime, AID, UID, Type, SGold, Gold])),
    Costs = [{?AST_SGOLD_F, CGold}],
    {ok, Costs}.

%% @doc get item info
get_item(PS, AID, UID) ->
    #role_state{id = RoleID} = PS,
    lib_auction:get_item(RoleID, AID, UID).

%% -----------------------------------------------------------------------------
%% 玩家数据
%% -----------------------------------------------------------------------------
