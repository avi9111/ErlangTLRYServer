%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽放生经验配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_free).

-export([
	free_conf/2
]).


%% @doc 获取升级所需经验
%% @spec free_conf(CarryLv, GrowupRate) -> ExpBase.
%% CarryLv = GrowupRate = ExpBase   :: integer()
free_conf(5, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(25, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(45, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(65, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(75, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(85, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(95, GrowupRate) ->
    if
        1 =< GrowupRate andalso GrowupRate =< 1000 -> 10000;
        1001 =< GrowupRate andalso GrowupRate =< 2000 -> 12000;
        2001 =< GrowupRate andalso GrowupRate =< 3000 -> 14000;
        true -> 14000
    end;
free_conf(_CarryLv, _GrowupRate) -> 0.
