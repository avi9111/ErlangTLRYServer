%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      职业初始配置
%% @author      cablsbs
%%----------------------------------

-module(conf_career_init).

-export([
	get_conf/2,
	get_atk_type/1,
	get_career_ids/0,
    get_career_name/1
]).


%% @doc 获取职业初始配置
%% @spec get_conf(Career, Gender) -> {Icon, FashionList, SkillList} | undefined.
%% Career = Gender  :: integer()
%% Icon             :: integer()
%% FashionList      :: [{pos :: integer(), fashion :: integer()}]
%% SkillList        :: [{id :: integer(), level :: integer()}]
get_conf(1, 1) ->
    {
        0,
        [1001],
        [{10010001,1},{10010002,1},{10010003,1},{10010011,1}]
    };
%%get_conf(1, 2) ->
%%    {
%%        0,
%%        [1001],
%%        [{10010001,1},{10010002,1},{10010003,1},{10010011,1}]
%%    };
get_conf(2, 1) ->
    {
        0,
        [1001],
        [{10020001,1},{10020002,1},{10020003,1},{10020011,1}]
    };
%%get_conf(2, 2) ->
%%    {
%%        0,
%%        [1001],
%%        [{10020001,1},{10020002,1},{10020003,1},{10020011,1}]
%%    };
%%get_conf(3, 1) ->
%%    {
%%        0,
%%        [1001],
%%        [{10030001,1},{10030002,1},{10030003,1},{10030011,1}]
%%    };
get_conf(3, 2) ->
    {
        0,
        [1001],
        [{10030001,1},{10030002,1},{10030003,1},{10030011,1}]
    };
%%get_conf(4, 1) ->
%%    {
%%        0,
%%        [1001],
%%        [{10040001,1},{10040002,1},{10040003,1},{10040011,1}]
%%    };
get_conf(4, 2) ->
    {
        0,
        [1001],
        [{10040001,1},{10040002,1},{10040003,1},{10040011,1}]
    };
get_conf(_Career, _Gender) ->
    undefined.


%% @doc 获取职业内外功类型
%% @spec get_atk_type(Career) -> AtkType.
%% Career   :: integer()
%% AtkType  :: 1 | 2 | 3
get_atk_type(1) -> 1;
get_atk_type(2) -> 2;
get_atk_type(3) -> 2;
get_atk_type(4) -> 1;
get_atk_type(_Career) -> 3.


get_career_ids() ->
	[1, 2, 3, 4].


get_career_name(1) -> <<"丐帮">>;
get_career_name(2) -> <<"逍遥">>;
get_career_name(3) -> <<"峨眉">>;
get_career_name(4) -> <<"天山">>;
get_career_name(_Career) ->
    <<"">>.