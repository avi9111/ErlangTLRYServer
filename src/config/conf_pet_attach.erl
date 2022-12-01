%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽附体开启
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_attach).

-export([
	get/1,
	get_name/1
]).


%% @doc 获取珍兽附体开启
%% @spec get(AttachId) -> LvLmt.
%% AttachId = LvLmt     :: integer()
get(1) -> 55;
get(2) -> 65;
get(3) -> 75;
get(4) -> 85;
get(5) -> 95;
get(_AttachId) -> undefined.


%% @doc 获取附体阵法名字
%% @spec quality_fact(Id) -> Name.
%% Id                   :: integer()
%% Name                 :: string()
get_name(1) -> <<"青龙阵">>;
get_name(2) -> <<"白虎阵">>;
get_name(3) -> <<"朱雀阵">>;
get_name(4) -> <<"玄武阵">>;
get_name(5) -> <<"麒麟阵">>;
get_name(_Id) -> <<"">>.
