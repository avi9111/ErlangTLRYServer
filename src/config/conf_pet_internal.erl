%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽内丹
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_internal).

-export([
	get/1,
	get_name/1,
	material/1
]).


%% @doc 获取珍兽内丹配置
%% @spec quality_fact(DanId) -> {AttrType, QualityFact}.
%% DanId = AttrType     :: integer()
%% QualityFact          :: float()
get(1) -> {31, 1};
get(2) -> {30, 1};
get(3) -> {32, 1};
get(4) -> {29, 1};
get(5) -> {27, 1};
get(6) -> {26, 1};
get(7) -> {28, 1};
get(8) -> {25, 1};
get(9) -> {23, 1};
get(10) -> {22, 1};
get(11) -> {24, 1};
get(12) -> {21, 1};
get(13) -> {10, 1};
get(14) -> {9, 1};
get(15) -> {11, 1};
get(16) -> {1, 1};
get(_Dan) -> undefined.


%% @doc 获取珍兽内丹名字
%% @spec quality_fact(DanId) -> Name.
%% Id                   :: integer()
%% Name                 :: string()
get_name(1) -> <<"鸣玄">>;
get_name(2) -> <<"御火">>;
get_name(3) -> <<"伤毒">>;
get_name(4) -> <<"破冰">>;
get_name(5) -> <<"玄壳">>;
get_name(6) -> <<"火盾">>;
get_name(7) -> <<"毒袍">>;
get_name(8) -> <<"冰甲">>;
get_name(9) -> <<"释玄">>;
get_name(10) -> <<"焚炎">>;
get_name(11) -> <<"聚毒">>;
get_name(12) -> <<"凝冰">>;
get_name(13) -> <<"疾闪">>;
get_name(14) -> <<"精准">>;
get_name(15) -> <<"灵兽">>;
get_name(16) -> <<"沸血">>;
get_name(_Dan) -> <<"">>.


%% @doc 获取珍兽内丹材料
%% @spec material(DanId) -> GoodsId.
%% DanId = Material     :: integer()
material(1) -> 16270001;
material(2) -> 16270002;
material(3) -> 16270003;
material(4) -> 16270004;
material(5) -> 16270005;
material(6) -> 16270006;
material(7) -> 16270007;
material(8) -> 16270008;
material(9) -> 16270009;
material(10) -> 16270010;
material(11) -> 16270011;
material(12) -> 16270012;
material(13) -> 16270013;
material(14) -> 16270014;
material(15) -> 16270015;
material(16) -> 16270016;
material(_DanId) -> undefined.
