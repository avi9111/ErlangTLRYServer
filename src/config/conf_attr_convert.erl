%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      属性转换相关配置表
%% @author      cablsbs
%%----------------------------------

-module(conf_attr_convert).

-export([
	get_convert/1
]).


% 固定转换
-define(BASE2BT_ATTR_ADEF, [{25,1},{26,1},{27,1},{28,1}]).
-define(BASE2BT_ATTR_ADEF_RED, [{29,1},{30,1},{31,1},{32,1}]).
-define(BASE2BT_ATTR_AATT, [{21,1},{22,1},{23,1},{24,1}]).
-define(BASE2BT_ATTR_ADEF_MIN, [{33,1},{34,1},{35,1},{36,1}]).


%% @doc 获取属性战力系数
%% @spec get_convert(Career) -> Confs.
%% Career = BaseIndex   :: integer()
%% Conf                 :: [{BtIndex :: integer()}, {X, number()}]
get_convert(1) ->
    {
        [{5,5.5}],
        [{6,1.5}],
        [{1,90}],
        [{3,20},{7,4.8},{8,2.2}],
        [{9,4.5},{10,1.25},{11,0.5},{12,0.5}],
        [{5,5.5},{6,1.5},{3,20},{7,4.8},{8,2.2},{1,90},{9,4.5},{10,1.25},{11,0.5},{12,0.5}],
        ?BASE2BT_ATTR_ADEF,
        ?BASE2BT_ATTR_ADEF_RED,
        ?BASE2BT_ATTR_AATT,
        ?BASE2BT_ATTR_ADEF_MIN
    };
get_convert(2) ->
    {
        [{5,1.375}],
        [{6,5.5}],
        [{1,85}],
        [{3,35},{7,1.88},{8,4.5}],
        [{9,5},{10,1.25},{11,0.5},{12,0.375}],
        [{5,1.375},{6,5.5},{3,35},{7,1.88},{8,4.5},{1,85},{9,5},{10,1.25},{11,0.5},{12,0.375}],
        ?BASE2BT_ATTR_ADEF,
        ?BASE2BT_ATTR_ADEF_RED,
        ?BASE2BT_ATTR_AATT,
        ?BASE2BT_ATTR_ADEF_MIN
    };
get_convert(3) ->
    {
        [{5,1.5}],
        [{6,5.6}],
        [{1,85}],
        [{3,40},{7,2.2},{8,4.7}],
        [{9,4.8},{10,1.1},{11,0.5},{12,0.55}],
        [{5,1.5},{6,5.6},{3,40},{7,2.2},{8,4.7},{1,85},{9,4.8},{10,1.1},{11,0.5},{12,0.55}],
        ?BASE2BT_ATTR_ADEF,
        ?BASE2BT_ATTR_ADEF_RED,
        ?BASE2BT_ATTR_AATT,
        ?BASE2BT_ATTR_ADEF_MIN
    };
get_convert(4) ->
    {
        [{5,5.725}],
        [{6,1.5}],
        [{1,86}],
        [{3,25},{7,4.8},{8,1.8}],
        [{9,5.25},{10,1.125},{11,0.625},{12,0.375}],
        [{5,5.725},{6,1.5},{3,25},{7,4.8},{8,1.8},{1,86},{9,5.25},{10,1.125},{11,0.625},{12,0.375}],
        ?BASE2BT_ATTR_ADEF,
        ?BASE2BT_ATTR_ADEF_RED,
        ?BASE2BT_ATTR_AATT,
        ?BASE2BT_ATTR_ADEF_MIN
    };
get_convert(_Career) ->
    {
        [{5,3}],
        [{6,3}],
        [{3,20},{7,3},{8,3}],
        [{1,80}],
        [{9,5},{10,1.25},{11,0.5},{12,0.5}],
        [{5,3},{6,3},{3,20},{7,3},{8,3},{1,80},{9,5},{10,1.25},{11,0.5},{12,0.5}],
        ?BASE2BT_ATTR_ADEF,
        ?BASE2BT_ATTR_ADEF_RED,
        ?BASE2BT_ATTR_AATT,
        ?BASE2BT_ATTR_ADEF_MIN
    }.
