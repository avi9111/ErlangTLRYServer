%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      杀气惩罚
%% @author      cablsbs
%%----------------------------------
-module(conf_murderous_punish).

-export([
	exp_punish/2
]).


%% @doc 获取杀气惩罚配置
%% @spec exp_punish(Exp, Muderous) -> ExpN.
%% Exp = ExpN = Muderous    :: integer()
exp_punish(Exp, Murderous) when Murderous =< 0 ->
    trunc(Exp * 1);
exp_punish(Exp, Murderous) when Murderous =< 1 ->
    trunc(Exp * 0.95);
exp_punish(Exp, Murderous) when Murderous =< 2 ->
    trunc(Exp * 0.92);
exp_punish(Exp, Murderous) when Murderous =< 3 ->
    trunc(Exp * 0.9);
exp_punish(Exp, Murderous) when Murderous =< 4 ->
    trunc(Exp * 0.85);
exp_punish(Exp, Murderous) when Murderous =< 5 ->
    trunc(Exp * 0.8);
exp_punish(Exp, _) ->
    trunc(Exp * 0.8).
