%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_grow_fund_info
%% @Brief  : 成长基金信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_grow_fund_info).

-export([
    get/1
]).

get(11) -> 
	#{
        rmb => 88,
        gold => 880    };
get(12) -> 
	#{
        rmb => 128,
        gold => 1280    };
get(13) -> 
	#{
        rmb => 168,
        gold => 1680    };
get(_Grade) ->
    undefined.