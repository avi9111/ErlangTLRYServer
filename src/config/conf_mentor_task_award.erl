%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_task_award
%% @Brief  : 师徒师门任务奖励
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_task_award).

-export([
    get/1
]).

get(Lv) when Lv >= 50 ->
    #{
        mentor_award => [310532],
        tudi_award => [310432]
        
    };
get(Lv) when Lv >= 49 ->
    #{
        mentor_award => [310531],
        tudi_award => [310431]
        
    };
get(Lv) when Lv >= 48 ->
    #{
        mentor_award => [310530],
        tudi_award => [310430]
        
    };
get(Lv) when Lv >= 47 ->
    #{
        mentor_award => [310529],
        tudi_award => [310429]
        
    };
get(Lv) when Lv >= 46 ->
    #{
        mentor_award => [310528],
        tudi_award => [310428]
        
    };
get(Lv) when Lv >= 45 ->
    #{
        mentor_award => [310527],
        tudi_award => [310427]
        
    };
get(Lv) when Lv >= 44 ->
    #{
        mentor_award => [310526],
        tudi_award => [310426]
        
    };
get(Lv) when Lv >= 43 ->
    #{
        mentor_award => [310525],
        tudi_award => [310425]
        
    };
get(Lv) when Lv >= 42 ->
    #{
        mentor_award => [310524],
        tudi_award => [310424]
        
    };
get(Lv) when Lv >= 41 ->
    #{
        mentor_award => [310523],
        tudi_award => [310423]
        
    };
get(Lv) when Lv >= 40 ->
    #{
        mentor_award => [310522],
        tudi_award => [310422]
        
    };
get(Lv) when Lv >= 39 ->
    #{
        mentor_award => [310521],
        tudi_award => [310421]
        
    };
get(Lv) when Lv >= 38 ->
    #{
        mentor_award => [310520],
        tudi_award => [310420]
        
    };
get(Lv) when Lv >= 37 ->
    #{
        mentor_award => [310519],
        tudi_award => [310419]
        
    };
get(Lv) when Lv >= 36 ->
    #{
        mentor_award => [310518],
        tudi_award => [310418]
        
    };
get(Lv) when Lv >= 35 ->
    #{
        mentor_award => [310517],
        tudi_award => [310417]
        
    };
get(Lv) when Lv >= 34 ->
    #{
        mentor_award => [310516],
        tudi_award => [310416]
        
    };
get(Lv) when Lv >= 33 ->
    #{
        mentor_award => [310515],
        tudi_award => [310415]
        
    };
get(Lv) when Lv >= 32 ->
    #{
        mentor_award => [310514],
        tudi_award => [310414]
        
    };
get(Lv) when Lv >= 31 ->
    #{
        mentor_award => [310513],
        tudi_award => [310413]
        
    };
get(Lv) when Lv >= 30 ->
    #{
        mentor_award => [310512],
        tudi_award => [310412]
        
    };
get(Lv) when Lv >= 29 ->
    #{
        mentor_award => [310511],
        tudi_award => [310411]
        
    };
get(Lv) when Lv >= 28 ->
    #{
        mentor_award => [310510],
        tudi_award => [310410]
        
    };
get(Lv) when Lv >= 27 ->
    #{
        mentor_award => [310509],
        tudi_award => [310409]
        
    };
get(Lv) when Lv >= 26 ->
    #{
        mentor_award => [310508],
        tudi_award => [310408]
        
    };
get(Lv) when Lv >= 25 ->
    #{
        mentor_award => [310507],
        tudi_award => [310407]
        
    };
get(Lv) when Lv >= 24 ->
    #{
        mentor_award => [310506],
        tudi_award => [310406]
        
    };
get(Lv) when Lv >= 23 ->
    #{
        mentor_award => [310505],
        tudi_award => [310405]
        
    };
get(Lv) when Lv >= 22 ->
    #{
        mentor_award => [310504],
        tudi_award => [310404]
        
    };
get(Lv) when Lv >= 21 ->
    #{
        mentor_award => [310503],
        tudi_award => [310403]
        
    };
get(Lv) when Lv >= 20 ->
    #{
        mentor_award => [310502],
        tudi_award => [310402]
        
    };
get(Lv) when Lv >= 1 ->
    #{
        mentor_award => [310501],
        tudi_award => [310401]
        
    };
get(_) ->
    undefined.