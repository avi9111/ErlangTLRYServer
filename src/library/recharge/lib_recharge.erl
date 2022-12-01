%%-------------------------------------------------------
%% @File     : lib_recharge.erl
%% @Brief    : 充值逻辑
%% @Author   : cablsbs
%% @Date     : 2018-9-4
%%-------------------------------------------------------
-module(lib_recharge).

-include("role.hrl").
-include("keyvalue.hrl").
-include("recharge.hrl").
-include("op_type.hrl").

-export([
    timer_handle/0,                 %% 定时器处理订单
    handle_orders/1                  %% 角色处理充值订单
]).

-export([
    get_today_recharge/1,
    get_today_recharge_money/1,
    get_recharged_products/1,
    pay_by_goods/2
]).


%% Apis -------------------------------------------------
%% 定时器刷新时调用(通知角色进程处理自己的充值订单)
timer_handle() ->
    NeedHandleRoles = fetch_need_handle_roles(),
    [lib_role:info_role(RoleId, 'handle_orders') || [RoleId] <- NeedHandleRoles].

%% 充值
%% Return: [#role_state, 邮件数量(没用)]
handle_orders(RoleState) ->
    RoleId = RoleState#role_state.id,
    RechargedSets = get_recharged_sets(RoleId),     % 获取已充值商品数据
    PayList = fetch_unhandle_orders(RoleId),        % 取出角色所有充值待处理记录

    TransFun = fun() ->
        [StateN, AccRmbT, AccGoldT, RechargedSetsT, SingleOrderListN] =
            lists:foldl(fun handle_single_order/2, [RoleState, 0, 0, RechargedSets, []], PayList),
        {ok, StateN, AccRmbT, AccGoldT, RechargedSetsT, SingleOrderListN}
    end,
    case ?DB:transaction(TransFun) of
        {ok, RoleStateT, AddRmb, AddGold, RechargedSetsN, OrderList} ->
            % 获取已充值商品数据
            update_recharged(RoleId, RechargedSetsN),
            RoleStateN = private_handle_any(RoleStateT, AddRmb, AddGold, OrderList),
            RoleStateN;
        _Error ->
            ?ERROR("handle recharge order error ! Error: ~p~n", [_Error]),
            RoleState
    end.

%% 处理充值后的逻辑
%% Return: #role_state{}
private_handle_any(RoleState, AddRmb, AddGold, OrderList) ->
    #role_state{id = RoleId, time_data = TimeData} = RoleState,

    % 发送充值邮件
    SendMailFun = fun({Ctime, TotalGold, FirstRebateGold}) ->
        {{Y, M, D}, {H, N, _S}} = calendar:now_to_local_time(time:unixtime_to_now(Ctime)),
        {TempIdKey, Args} = case FirstRebateGold of
            0 -> {recharge_mail, [Y, M, D, H, N, TotalGold]};
            _ -> {recharge_mail_rebate, [Y, M, D, H, N, TotalGold, FirstRebateGold]}
        end,
        TempId = config:get_sys_config(TempIdKey),
        Fun = fun(Title, Content) -> {Title, io_lib:format(Content, Args)} end,
        svr_mail:sys2p(RoleId, TempId, Fun, ?OPT_RECHARGE)
    end,
    lists:foreach(SendMailFun, OrderList),

    % 更新首充时间
    FirstRechargeTime = TimeData#time_data.first_recharge,
    FirstTime = ?iif(FirstRechargeTime > 0, FirstRechargeTime, time:unixtime()),
    TimeDataN = TimeData#time_data{first_recharge = FirstTime},
    RoleStateN = RoleState#role_state{time_data = TimeDataN},

    lib_role_data:add_counter(RoleId, ?KEY_TOTAL_RECHARGE, AddGold),        % 更新充值总额
    lib_role_data:add_counter(RoleId, ?KEY_TOTAL_RMB, AddRmb),              % 更新充值RMB总额
    lib_role_daily:add_counter(RoleId, ?KEY_DAILY_RECHARGE, AddGold),       % 更新当天充值元宝
    lib_role_daily:add_counter(RoleId, ?KEY_DAILY_RECHARGE_MONEY, AddRmb),  % 更新当天充值金额
    ?EVENT(RoleId, {'recharge', AddRmb}),                                   % 充值事件
    RoleStateN.


%%% 仅限角色进程内部调用
%% @doc 获取当天的充值元宝
get_today_recharge(RoleID) ->
    lib_role_kv:get_counter(RoleID, ?KEY_DAILY_RECHARGE).

%% @doc 获取当天的充值金额
get_today_recharge_money(RoleID) ->
    lib_role_kv:get_counter(RoleID, ?KEY_DAILY_RECHARGE_MONEY).

%% @doc 获取已充值档次
get_recharged_products(RoleId) ->
    lib_role_kv:get_kv(RoleId, ?KEY_RECHARGED_PRODUCTS).


%% Privates ---------------------------------------------
%% 取出有待处理充值的所有角色
fetch_need_handle_roles() ->
    case catch ?DB:get_all(?SQL_FETCH_NEED_HANDLE_ROLE) of
        List when is_list(List) -> List;
        _ -> []
    end.

%% 获取已充值商品数据
get_recharged_sets(RoleId) ->
    case get_recharged_products(RoleId) of
        undefined -> {sets:new(), sets:new()};
        {ChargedAn, ChargedIos} -> {sets:from_list(ChargedAn), sets:from_list(ChargedIos)}
    end.

%% 更新已充值商品数据
update_recharged(RoleId, {SetAn, SetIos}) ->
    AllAn = conf_recharge:get_all_product(?OS_ANDROID),
    ChargedAnN = case length(AllAn) =< sets:size(SetAn) of
        true -> [];
        false -> sets:to_list(SetAn)
    end,

    AllIos = conf_recharge:get_all_product(?OS_IOS),
    ChargedIosN = case length(AllIos) =< sets:size(SetIos) of
        true -> [];
        false -> sets:to_list(SetIos)
    end,
    lib_role_kv:set_kv(RoleId, ?KEY_RECHARGED_PRODUCTS, {ChargedAnN, ChargedIosN}).

%% 获取玩家未处理的充值订单
fetch_unhandle_orders(RoleId) ->
    Sql = io_lib:format(?SQL_FETCH_ORDERS, [RoleId, ?ORDER_UNHANDLE]),
    case catch ?DB:get_all(Sql) of
        List when is_list(List) -> List;
        _ -> []
    end.

%% 处理单个订单逻辑
handle_single_order([Id, PayNo, Type, ProductId, Ctime], [State, AccRmb, AccGold, RechargedSets, SingleOrderList]) ->
    %% 是否购买周月卡
    IsBuyCard = lists:member(Type, [?CHARGE_TYPE_MONTH_CARD, ?CHARGE_TYPE_WEEKLY_CARD]),
    IsGrwoFund = ?IS_GROW_FUND(Type),
    IsDailyGift = ?IS_DAILY_GIFT(Type),
    case conf_recharge:get(ProductId) of
        _ when IsBuyCard orelse IsGrwoFund orelse IsDailyGift ->
            % 修改充值记录状态为已经处理
            update_order_state(Id, ?ORDER_HANDLED),
            % 给角色加元宝
            if
                IsBuyCard ->
                    #{gold := CardAddGold, rmb := Rmb} = conf_weekly_month_card:get(Type),
                    AddGold = CardAddGold,
                    GoodsList = [{?AST_GOLD, AddGold}],
                    Opt = ?OPT_WEEKLY_MONTH_CARD,
                    lib_role:mod_info(State#role_state.id, lib_weekly_month_card, {buy_card, Type});
                IsGrwoFund ->
                    #{gold := GrowAddGold, rmb := Rmb} = conf_grow_fund_info:get(Type),
                    AddGold = GrowAddGold,
                    GoodsList = [{?AST_GOLD, AddGold}],
                    Opt = ?OPT_GROW_FUND,
                    lib_role:mod_info(State#role_state.id, lib_role_grow_fund, {buy_fund, Type});
                IsDailyGift ->
                    #{gold := GiftAddGold, rmb := Rmb} = conf_daily_gift:get(Type),
                    AddGold = GiftAddGold,
                    GoodsList = [{?AST_GOLD, GiftAddGold}],
                    Opt = ?OPT_DAILY_GIFT,
                    lib_role:mod_info(State#role_state.id, lib_role_daily_gift, {buy_gift, Type})
            end,
            StateN = lib_role_assets:add_items_notify(State, GoodsList, Opt),
            % 订单列表
            SingleOrderListN = [{Ctime, AddGold, 0} | SingleOrderList],
            [StateN, AccRmb + Rmb, AccGold + AddGold, RechargedSets, SingleOrderListN];
        #{total_gold := AddGold, os := OS, rmb := Rmb, first_rebate := FirstRebate} when PayNo =/= undefined ->
            % 修改充值记录状态为已经处理
            update_order_state(Id, ?ORDER_HANDLED),

            % 首充返利
            {ChargedSetsN, FirstRebateGold} = case check_first_rebate(OS, ProductId, RechargedSets) of
                false -> {RechargedSets, 0};
                UpdatedChargedSets -> {UpdatedChargedSets, FirstRebate}
            end,

            % 给角色加元宝
            TotalGold = AddGold + FirstRebateGold,
            GoodsList = [{?AST_GOLD, TotalGold}],
            StateN = lib_role_assets:add_items_notify(State, GoodsList, ?OPT_RECHARGE),

            % 订单列表
            SingleOrderListN = [{Ctime, TotalGold, FirstRebateGold} | SingleOrderList],
            [StateN, AccRmb + Rmb, AccGold + TotalGold, ChargedSetsN, SingleOrderListN];
        _ ->
            ?ERROR("Bad Order: ~p ! Recharge Config Not Found !", [Id]),
            update_order_state(Id, ?ORDER_UNDEFINED),
            [State, AccRmb, AccGold, RechargedSets, SingleOrderList]
    end.

%% 通过道具充值
pay_by_goods(RoleState, ProductId) ->
    #role_state{id = RoleId, accname = Accname, name = Name, level = Level} = RoleState,
    case conf_recharge:get(ProductId) of
        #{gold := Gold, rmb := Rmb} ->
            Time = time:unixtime(),
            PayNo = integer_to_list(RoleId) ++ "_recharge_at_" ++ integer_to_list(Time),
            OrderArgs = [
                ?CHARGE_TYPE_GOODS, ProductId, PayNo,
                Accname, RoleId, Name, Level, Gold, Rmb, Time
            ],
            Sql = io_lib:format(?SQL_INSERT_USER_PAY, OrderArgs),
            ?DB:execute(Sql),
            ok;
        _ ->
            ?ERROR("goods recharge error ! Unknown ProductId: ~p", [ProductId]),
            {error, 252}
    end.

%% 将充值记录标识为已经完成处理
update_order_state(Id, State) ->
    SQL = io_lib:format(?SQL_UPDATE_ORDER_STATE, [State, Id]),
    ?DB:execute(SQL).

%% 检测是否符合首充返利
check_first_rebate(?OS_UNKNOWN, _ProductId, _ChargedSets) ->
    false;
check_first_rebate(OS, ProductId, ChargedSets) ->
    SubSet = element(OS, ChargedSets),
    case sets:is_element(ProductId, SubSet) of
        true ->
            false;
        false ->
            SubSetN = sets:add_element(ProductId, SubSet),
            setelement(OS, ChargedSets, SubSetN)
    end.
