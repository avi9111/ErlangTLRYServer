%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_anqi_param
%% @Brief  : 暗器品阶系数
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_anqi_param).

-export([
    get/1
]).

get(Lv) when Lv >= 100, Lv < 150 ->
    #{
        level => 100,
        param1 => 0,
        param2 => 1280        
    };
get(Lv) when Lv >= 150, Lv < 300 ->
    #{
        level => 150,
        param1 => 64000,
        param2 => 1150        
    };
get(Lv) when Lv >= 300, Lv < 500 ->
    #{
        level => 300,
        param1 => 236500,
        param2 => 1030        
    };
get(Lv) when Lv >= 500, Lv < 800 ->
    #{
        level => 500,
        param1 => 442500,
        param2 => 720        
    };
get(Lv) when Lv >= 800, Lv < 1200 ->
    #{
        level => 800,
        param1 => 658500,
        param2 => 300        
    };
get(Lv) when Lv >= 1200, Lv < 1500 ->
    #{
        level => 1200,
        param1 => 778500,
        param2 => 210        
    };
get(Lv) when Lv >= 1500, Lv < 2000 ->
    #{
        level => 1500,
        param1 => 841500,
        param2 => 175        
    };
get(Lv) when Lv >= 2000, Lv < 3000 ->
    #{
        level => 2000,
        param1 => 929000,
        param2 => 150        
    };
get(Lv) when Lv >= 3000, Lv < 4000 ->
    #{
        level => 3000,
        param1 => 1079000,
        param2 => 135        
    };
get(Lv) when Lv >= 4000, Lv < 5000 ->
    #{
        level => 4000,
        param1 => 1214000,
        param2 => 125        
    };
get(Lv) when Lv >= 5000, Lv < 6000 ->
    #{
        level => 5000,
        param1 => 1339000,
        param2 => 120        
    };
get(Lv) when Lv >= 6000, Lv < 7000 ->
    #{
        level => 6000,
        param1 => 1459000,
        param2 => 110        
    };
get(Lv) when Lv >= 7000, Lv < 8000 ->
    #{
        level => 7000,
        param1 => 1569000,
        param2 => 85        
    };
get(Lv) when Lv >= 8000, Lv < 8500 ->
    #{
        level => 8000,
        param1 => 1654000,
        param2 => 65        
    };
get(Lv) when Lv >= 8500, Lv < 99999 ->
    #{
        level => 8500,
        param1 => 1686500,
        param2 => 60        
    };
get(_Level) ->
    undefined.