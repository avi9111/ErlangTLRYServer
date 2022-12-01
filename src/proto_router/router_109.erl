%%-------------------------------------------------------
%% @File     : router_109
%% @Brief    : vip模块协议
%% @Author   : cablsbs
%% @Date     : 2018-9-3
%%-------------------------------------------------------

-module(router_109).

-include("log.hrl").
-include("role.hrl").
-include("ret_code.hrl").
-include("keyvalue.hrl").
-include("proto/prot_109.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
%% 请求Vip数据
do(10900, State, #get_vip_info_req{}) ->
    lib_role_vip:send_info(State),
    ok;

%% 领取vip礼包
do(10902, State, #get_vip_gift_req{level = Level}) ->
    case catch lib_role_vip:get_vip_gift(State, Level) of
        {ok, StateN} ->
            Ret = #get_vip_gift_resp{ret = ?RC_SUCCEED, level = Level},
            {reply, Ret, StateN};
        {error, RetCode} ->
            ?ERROR_TOC(State#role_state.id, RetCode),
            Ret = #get_vip_gift_resp{ret = ?RC_FAILED, level = Level},
            {reply, Ret}
    end;

%% 获取充值信息
do(10940, State, #get_recharge_info_req{}) ->
    TodayRecharge = lib_recharge:get_today_recharge(State#role_state.id),
    TodayRechargeMoney = lib_recharge:get_today_recharge_money(State#role_state.id),
    {RechargedAn, RechargedIos} = case lib_recharge:get_recharged_products(State#role_state.id) of
        undefined ->
            Recharged = {[], []},
            lib_role_kv:set_kv(State#role_state.id, ?KEY_RECHARGED_PRODUCTS, Recharged),
            Recharged;
        Recharged ->
            Recharged
    end,
    Msg = #get_recharge_info_resp{
         today_recharge = TodayRecharge,
         today_recharge_money = TodayRechargeMoney,
         recharged_an = RechargedAn,
         recharged_ios = RechargedIos
    },
    {reply, Msg};

do(Cmd, State, MsgRecord) ->
    router_default:do(Cmd, State, MsgRecord).

% 领取vip礼包返回
response(10902, State, RetMsg) ->
    {ok, Bin} = prot_msg:encode_msg(10903, RetMsg),
    lib_role_send:send_to_sid(State#role_state.sid, Bin);

% 获取充值数据返回
response(10940, State, RetMsg) ->
    {ok, Bin} = prot_msg:encode_msg(10941, RetMsg),
    lib_role_send:send_to_sid(State#role_state.sid, Bin);

response(Cmd, State, MsgRecord) ->
    router_default:response(Cmd, State, MsgRecord).
