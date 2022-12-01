%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_lucky_money_info
%% @Brief  : 帮派红包信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_lucky_money_info).

-export([
    get/0
]).

get() ->
    #{
        max_times => 5,
        show_num => 15,
        expire => 1800,
        rumor => 22007        
    }.
