%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      运镖押金
%% @author      cablsbs
%%----------------------------------
-module(conf_guild_carry_foregift).

-include("log.hrl").

-export([
	get/2
]).


%% @doc 获取运镖押金
%% @spec get(Quality, Level) -> Coin.
%% Quality = Level  :: integer()
%% Coin             :: integer()
get(1, Level) ->
    if
        Level =< 10 -> 100000;
        Level =< 20 -> 100000;
        Level =< 30 -> 100000;
        Level =< 999 -> 100000;
        true -> 100000
    end;
get(2, Level) ->
    if
        Level =< 10 -> 100000;
        Level =< 20 -> 100000;
        Level =< 30 -> 100000;
        Level =< 999 -> 100000;
        true -> 100000
    end;
get(3, Level) ->
    if
        Level =< 10 -> 100000;
        Level =< 20 -> 100000;
        Level =< 30 -> 100000;
        Level =< 999 -> 100000;
        true -> 100000
    end;
get(4, Level) ->
    if
        Level =< 10 -> 100000;
        Level =< 20 -> 100000;
        Level =< 30 -> 100000;
        Level =< 999 -> 100000;
        true -> 100000
    end;
get(Quality, Level) ->
    ?ERROR_FUNC_CALL([Quality, Level]),
    undefined.

