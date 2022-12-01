%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_exp_base
%% @Brief  : 师徒基础传功经验
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_exp_base).

-export([
    get/1
]).

get(TudiLv) when TudiLv >= 99 ->
    #{
        base_exp => 2078        
    };
get(TudiLv) when TudiLv >= 98 ->
    #{
        base_exp => 2080        
    };
get(TudiLv) when TudiLv >= 97 ->
    #{
        base_exp => 2112        
    };
get(TudiLv) when TudiLv >= 96 ->
    #{
        base_exp => 2174        
    };
get(TudiLv) when TudiLv >= 95 ->
    #{
        base_exp => 2266        
    };
get(TudiLv) when TudiLv >= 94 ->
    #{
        base_exp => 2388        
    };
get(TudiLv) when TudiLv >= 93 ->
    #{
        base_exp => 2560        
    };
get(TudiLv) when TudiLv >= 92 ->
    #{
        base_exp => 2762        
    };
get(TudiLv) when TudiLv >= 91 ->
    #{
        base_exp => 2994        
    };
get(TudiLv) when TudiLv >= 90 ->
    #{
        base_exp => 3256        
    };
get(TudiLv) when TudiLv >= 89 ->
    #{
        base_exp => 3528        
    };
get(TudiLv) when TudiLv >= 88 ->
    #{
        base_exp => 3790        
    };
get(TudiLv) when TudiLv >= 87 ->
    #{
        base_exp => 4032        
    };
get(TudiLv) when TudiLv >= 86 ->
    #{
        base_exp => 4254        
    };
get(TudiLv) when TudiLv >= 85 ->
    #{
        base_exp => 4456        
    };
get(TudiLv) when TudiLv >= 84 ->
    #{
        base_exp => 4638        
    };
get(TudiLv) when TudiLv >= 83 ->
    #{
        base_exp => 4790        
    };
get(TudiLv) when TudiLv >= 82 ->
    #{
        base_exp => 4892        
    };
get(TudiLv) when TudiLv >= 81 ->
    #{
        base_exp => 4944        
    };
get(TudiLv) when TudiLv >= 80 ->
    #{
        base_exp => 4966        
    };
get(TudiLv) when TudiLv >= 79 ->
    #{
        base_exp => 4968        
    };
get(TudiLv) when TudiLv >= 78 ->
    #{
        base_exp => 4950        
    };
get(TudiLv) when TudiLv >= 77 ->
    #{
        base_exp => 4912        
    };
get(TudiLv) when TudiLv >= 76 ->
    #{
        base_exp => 4854        
    };
get(TudiLv) when TudiLv >= 75 ->
    #{
        base_exp => 4786        
    };
get(TudiLv) when TudiLv >= 74 ->
    #{
        base_exp => 4708        
    };
get(TudiLv) when TudiLv >= 73 ->
    #{
        base_exp => 4626        
    };
get(TudiLv) when TudiLv >= 72 ->
    #{
        base_exp => 4542        
    };
get(TudiLv) when TudiLv >= 71 ->
    #{
        base_exp => 4458        
    };
get(TudiLv) when TudiLv >= 70 ->
    #{
        base_exp => 4374        
    };
get(TudiLv) when TudiLv >= 69 ->
    #{
        base_exp => 4290        
    };
get(TudiLv) when TudiLv >= 68 ->
    #{
        base_exp => 4206        
    };
get(TudiLv) when TudiLv >= 67 ->
    #{
        base_exp => 4122        
    };
get(TudiLv) when TudiLv >= 66 ->
    #{
        base_exp => 4038        
    };
get(TudiLv) when TudiLv >= 65 ->
    #{
        base_exp => 3954        
    };
get(TudiLv) when TudiLv >= 64 ->
    #{
        base_exp => 3870        
    };
get(TudiLv) when TudiLv >= 63 ->
    #{
        base_exp => 3786        
    };
get(TudiLv) when TudiLv >= 62 ->
    #{
        base_exp => 3702        
    };
get(TudiLv) when TudiLv >= 61 ->
    #{
        base_exp => 3620        
    };
get(TudiLv) when TudiLv >= 60 ->
    #{
        base_exp => 3538        
    };
get(TudiLv) when TudiLv >= 59 ->
    #{
        base_exp => 3456        
    };
get(TudiLv) when TudiLv >= 58 ->
    #{
        base_exp => 3374        
    };
get(TudiLv) when TudiLv >= 57 ->
    #{
        base_exp => 3292        
    };
get(TudiLv) when TudiLv >= 56 ->
    #{
        base_exp => 3210        
    };
get(TudiLv) when TudiLv >= 55 ->
    #{
        base_exp => 3128        
    };
get(TudiLv) when TudiLv >= 54 ->
    #{
        base_exp => 3046        
    };
get(TudiLv) when TudiLv >= 53 ->
    #{
        base_exp => 2964        
    };
get(TudiLv) when TudiLv >= 52 ->
    #{
        base_exp => 2882        
    };
get(TudiLv) when TudiLv >= 51 ->
    #{
        base_exp => 2800        
    };
get(TudiLv) when TudiLv >= 50 ->
    #{
        base_exp => 2720        
    };
get(TudiLv) when TudiLv >= 49 ->
    #{
        base_exp => 2640        
    };
get(TudiLv) when TudiLv >= 48 ->
    #{
        base_exp => 2560        
    };
get(TudiLv) when TudiLv >= 47 ->
    #{
        base_exp => 2480        
    };
get(TudiLv) when TudiLv >= 46 ->
    #{
        base_exp => 2400        
    };
get(TudiLv) when TudiLv >= 45 ->
    #{
        base_exp => 2320        
    };
get(TudiLv) when TudiLv >= 44 ->
    #{
        base_exp => 2240        
    };
get(TudiLv) when TudiLv >= 43 ->
    #{
        base_exp => 2160        
    };
get(TudiLv) when TudiLv >= 42 ->
    #{
        base_exp => 2080        
    };
get(TudiLv) when TudiLv >= 41 ->
    #{
        base_exp => 2000        
    };
get(TudiLv) when TudiLv >= 1 ->
    #{
        base_exp => 2000        
    };
get(_TudiLv) ->
    undefined.