%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_level
%% @Brief  : 帮派等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_guild_level).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        level => 1,
        skill_lv => 20        
    };
get(2) ->
    #{
        level => 2,
        skill_lv => 40        
    };
get(3) ->
    #{
        level => 3,
        skill_lv => 60        
    };
get(4) ->
    #{
        level => 4,
        skill_lv => 80        
    };
get(5) ->
    #{
        level => 5,
        skill_lv => 100        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].
