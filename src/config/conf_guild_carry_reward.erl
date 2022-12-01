%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      运镖奖励
%% @author      cablsbs
%%----------------------------------
-module(conf_guild_carry_reward).

-export([
	carry_rewards/1,
	rob_rewards/1,
	get_carry/1
]).


%% @doc 获取运镖奖励
%% @spec carry_rewards(Quality) -> {Contrib, Drop, Funds, FailFunds}.
%% Quality                              :: integer()
%% Contrib = Drop = Funds = FailFunds   :: integer()
carry_rewards(1) ->
    {60, 294001, 1750, 0};
carry_rewards(2) ->
    {72, 294002, 2100, 0};
carry_rewards(3) ->
    {90, 294003, 2625, 0};
carry_rewards(4) ->
    {120, 294004, 3500, 0};
carry_rewards(5) ->
    {0, 0, 0, 0};
carry_rewards(_Quality) ->
    undefined.


%% @doc 获取劫镖奖励
%% @spec rob_rewards(Quality) -> {Contrib, Drop, Funds}.
%% Quality                  :: integer()
%% Contrib = Drop = Funds   :: integer()
rob_rewards(1) ->
    {36, 294101, 1050};
rob_rewards(2) ->
    {43, 294102, 1260};
rob_rewards(3) ->
    {54, 294103, 1575};
rob_rewards(4) ->
    {72, 294104, 2100};
rob_rewards(5) ->
    {0, 0, 0};
rob_rewards(_Quality) ->
    undefined.


%% @doc 获取镖车
%% @spec get_carry(Quality) -> CarryId.
%% Quality = CarryId    :: integer()
get_carry(1) -> 1001;
get_carry(2) -> 1002;
get_carry(3) -> 1003;
get_carry(4) -> 1004;
get_carry(5) -> 1005;
get_carry(_Quality) -> undefined.
