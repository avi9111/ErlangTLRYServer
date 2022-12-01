%%-------------------------------------------------------
%% @File     : svr_recharge.erl
%% @Brief    : 充值进程
%% @Author   : cablsbs
%% @Date     : 2018-9-4
%%-------------------------------------------------------
-module(svr_recharge).

-behaviour(gen_server).

-include("role.hrl").
-include("op_type.hrl").
-include("recharge.hrl").

-export([
    start_link/0,
    gm_recharge/2,
    gm_buy_card/2,
    gm_buy/2
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).


-record(state, {
    timer_ref = undefined
}).


%% Apis -------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

gm_recharge(RoleState, ProductId) ->
    gen_server:cast(?MODULE, {'gm_recharge', RoleState, ProductId}).

%% 购买周卡月卡
gm_buy_card(RoleState, CardType) ->
    gen_server:cast(?MODULE, {'gm_buy_card', RoleState, CardType}).

gm_buy(RoleState, CardType) ->
    gen_server:cast(?MODULE, {'gm_buy', RoleState, CardType}).

%% Callbacks --------------------------------------------
init([]) ->
    TimerRef = start_handle_timer(?ORDER_HANDLE_START),
    {ok, #state{timer_ref = TimerRef}}.

handle_call(_Msg, _From, State) ->
    {reply, ok, State}.

handle_cast({'gm_recharge', RoleState, ProductId}, State) ->
    #role_state{id = RoleId, accname = Accname, name = Name, level = Level} = RoleState,
    case conf_recharge:get(ProductId) of
        #{gold := Gold, rmb := Rmb} ->
            Time = time:unixtime(),
            PayNo = integer_to_list(RoleId) ++ "_recharge_at_" ++ integer_to_list(Time),
            OrderArgs = [
                ?CHARGE_TYPE_GM, ProductId, PayNo,
                Accname, RoleId, Name, Level, Gold, Rmb, Time
            ],
            Sql = io_lib:format(?SQL_INSERT_USER_PAY, OrderArgs),
            ?DB:execute(Sql);
        _ ->
            ?ERROR("GM recharge error ! Unknown ProductId: ~p", [ProductId]),
            skip
    end,
    {noreply, State};
handle_cast({'gm_buy_card', RoleState, CardType}, State) ->
    #role_state{id = RoleId, accname = Accname, name = Name, level = Level} = RoleState,
    case conf_weekly_month_card:get(CardType) of
        #{gold := Gold, rmb := Rmb} ->
            Time = time:unixtime(),
            PayNo = integer_to_list(RoleId) ++ "_recharge_at_" ++ integer_to_list(Time),
            OrderArgs = [
                CardType, 0, PayNo,
                Accname, RoleId, Name, Level, Gold, Rmb, Time
            ],
            Sql = io_lib:format(?SQL_INSERT_USER_PAY, OrderArgs),
            ?DB:execute(Sql);
        _ ->
            ?ERROR("GM recharge error ! Unknown ProductId: ~p", [CardType]),
            skip
    end,
    {noreply, State};
handle_cast({'gm_buy', RoleState, Type}, State) ->
    #role_state{id = RoleId, accname = Accname, name = Name, level = Level} = RoleState,
    IsBuyCard = lists:member(Type, [?CHARGE_TYPE_MONTH_CARD, ?CHARGE_TYPE_WEEKLY_CARD]),
    IsGrwoFund = ?IS_GROW_FUND(Type),
    IsDailyGift = ?IS_DAILY_GIFT(Type),
    Conf =
        if
            IsBuyCard -> conf_weekly_month_card:get(Type);
            IsGrwoFund -> conf_grow_fund_info:get(Type);
            IsDailyGift -> conf_daily_gift:get(Type);
            true -> undefined
        end,
    case Conf of
        #{gold := Gold, rmb := Rmb} ->
            Time = time:unixtime(),
            PayNo = integer_to_list(RoleId) ++ "_recharge_at_" ++ integer_to_list(Time),
            OrderArgs = [
                Type, 0, PayNo,
                Accname, RoleId, Name, Level, Gold, Rmb, Time
            ],
            Sql = io_lib:format(?SQL_INSERT_USER_PAY, OrderArgs),
            ?DB:execute(Sql);
        _ ->
            ?ERROR("GM recharge error ! Unknown ProductId: ~p", [Type]),
            skip
    end,
    {noreply, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info('order_handle_timer', State) ->
    lib_recharge:timer_handle(),
    TimerRef = start_handle_timer(?ORDER_HANDLE_INTERVAL),
    {noreply, State#state{timer_ref = TimerRef}};

handle_info(_Msg, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.


%% Privates ---------------------------------------------
start_handle_timer(Time) ->
    erlang:send_after(Time, ?MODULE, 'order_handle_timer').
