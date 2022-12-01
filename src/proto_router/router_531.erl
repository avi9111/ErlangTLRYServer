%%%-------------------------------------------------------------------
%%% @author LW
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%     福利相关
%%% @end
%%% Created : 13. 十二月 2018 9:47
%%%-------------------------------------------------------------------
-module(router_531).

-include("proto/prot_531.hrl").
-include("proto/prot_506.hrl").
%% API
-export([
    do/3
]).

%% 在线奖励
do(53101, PS, _Req) ->
    lib_role_online_reward:send_info(PS);
do(53103, PS, _Req) ->
    lib_role_online_reward:pray(PS);
do(53105, PS, #cs_online_reward_get{id = ID}) ->
    lib_role_online_reward:get_reward(PS, ID);

%% 成长基金
do(53110, PS, _Req) ->
    lib_role_grow_fund:send_info(PS);
do(53112, PS, #cs_grow_fund_get{grade = Grade, id = ID}) ->
    lib_role_grow_fund:get_reward(PS, Grade, ID);
do(53144, PS, #cs_buy_fund{type = Type}) ->
    lib_role_grow_fund:buy_fund(PS, Type);

%% 每日礼包
do(53120, PS, _Req) ->
    lib_role_daily_gift:send_info(PS);
do(53122, PS, #cs_daily_gift_get{grade = Grade, id = ID}) ->
    lib_role_daily_gift:get_reward(PS, Grade, ID);

%% 历练补偿
do(53130, PS, _Req) ->
    lib_role_kill_mon_retrieve:send_info(PS);
do(53132, PS, #cs_mon_retrieve_get{type = Type}) ->
    lib_role_kill_mon_retrieve:get_retrieve(PS, Type);

%% 找回
do(53140, PS, _Req) ->
    lib_role_daily_lively:send_info(PS);
do(53142, PS, #cs_retrieve_get{type = Type, id = ID, retrieve_times = RTimes}) ->
    lib_role_daily_lively:get_retrieve(PS, ID, Type, RTimes);
do(_, _, _) ->
    skip.
