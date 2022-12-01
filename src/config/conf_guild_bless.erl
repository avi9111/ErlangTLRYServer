%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_bless
%% @Brief  : 帮派守卫战怪物
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_bless).

-export([
    get/1
]).

get(1) -> 
    #{
        cost_funds => 2000000,
        mul => 2    };
get(2) -> 
    #{
        cost_funds => 7200000,
        mul => 2    };
get(3) -> 
    #{
        cost_funds => 12000000,
        mul => 3    };
get(4) -> 
    #{
        cost_funds => 12000000,
        mul => 3    };
get(5) -> 
    #{
        cost_funds => 12000000,
        mul => 3    };
get(_ID) -> 
    undefined.