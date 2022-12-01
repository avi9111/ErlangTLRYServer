%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_metall_reward
%% @Brief  : 帮派炼金奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_metall_reward).

-export([
    get/1
]).

get(Lv) when Lv =< 25 ->
    #{
        silver => 768,
        funds => 800        
    };
get(Lv) when Lv =< 30 ->
    #{
        silver => 798,
        funds => 800        
    };
get(Lv) when Lv =< 35 ->
    #{
        silver => 828,
        funds => 800        
    };
get(Lv) when Lv =< 40 ->
    #{
        silver => 858,
        funds => 800        
    };
get(Lv) when Lv =< 45 ->
    #{
        silver => 888,
        funds => 800        
    };
get(Lv) when Lv =< 50 ->
    #{
        silver => 918,
        funds => 800        
    };
get(Lv) when Lv =< 55 ->
    #{
        silver => 948,
        funds => 800        
    };
get(Lv) when Lv =< 60 ->
    #{
        silver => 978,
        funds => 800        
    };
get(Lv) when Lv =< 65 ->
    #{
        silver => 1008,
        funds => 800        
    };
get(Lv) when Lv =< 70 ->
    #{
        silver => 1038,
        funds => 800        
    };
get(Lv) when Lv =< 75 ->
    #{
        silver => 1068,
        funds => 800        
    };
get(Lv) when Lv =< 80 ->
    #{
        silver => 1098,
        funds => 800        
    };
get(Lv) when Lv =< 85 ->
    #{
        silver => 1128,
        funds => 800        
    };
get(Lv) when Lv =< 90 ->
    #{
        silver => 1158,
        funds => 800        
    };
get(Lv) when Lv =< 999 ->
    #{
        silver => 1188,
        funds => 800        
    };
get(_Lv) ->
    undefined.
