%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_godweapon_collect
%% @Brief  : 神器碎片收集
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_godweapon_collect).

-export([
    get/1,
    get_lv_num/0,
    get_lv_by_cond/1
]).

get(1) ->
    #{
        award_drop => 222001,
        finish_cond => {1, 10005}        
    };
get(2) ->
    #{
        award_drop => 222002,
        finish_cond => {1, 1018}        
    };
get(3) ->
    #{
        award_drop => 222003,
        finish_cond => {1, 1038}        
    };
get(4) ->
    #{
        award_drop => 222004,
        finish_cond => {1, 1079}        
    };
get(5) ->
    #{
        award_drop => 222005,
        finish_cond => {2, 32}        
    };
get(_Lv) ->
    undefined.

get_lv_by_cond({1, 10005}) ->
    1;
get_lv_by_cond({1, 1018}) ->
    2;
get_lv_by_cond({1, 1038}) ->
    3;
get_lv_by_cond({1, 1079}) ->
    4;
get_lv_by_cond({2, RoleLv}) when RoleLv >= 32 ->
    5;
get_lv_by_cond(_Cond) ->
    0.

get_lv_num() ->
    5.