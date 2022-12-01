%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_scenario
%% @Brief  : 剧情邮件
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_scenario).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        open_cond => [{4,1018}],
        quick_cond => [],
        mail => 2301,
        reward => 15001        
    };
get(2) ->
    #{
        id => 2,
        open_cond => [{4,1037}],
        quick_cond => [],
        mail => 2302,
        reward => 15002        
    };
get(3) ->
    #{
        id => 3,
        open_cond => [{4,1077}],
        quick_cond => [],
        mail => 2303,
        reward => 15003        
    };
get(4) ->
    #{
        id => 4,
        open_cond => [{4,1117}],
        quick_cond => [],
        mail => 2304,
        reward => 15004        
    };
get(5) ->
    #{
        id => 5,
        open_cond => [{4,1157}],
        quick_cond => [],
        mail => 2305,
        reward => 15005        
    };
get(6) ->
    #{
        id => 6,
        open_cond => [{4,1197}],
        quick_cond => [],
        mail => 2306,
        reward => 15006        
    };
get(7) ->
    #{
        id => 7,
        open_cond => [{4,1237}],
        quick_cond => [],
        mail => 2307,
        reward => 15007        
    };
get(8) ->
    #{
        id => 8,
        open_cond => [{4,1277}],
        quick_cond => [],
        mail => 2308,
        reward => 15008        
    };
get(9) ->
    #{
        id => 9,
        open_cond => [{1,24}],
        quick_cond => [],
        mail => 3101,
        reward => 351001        
    };
get(10) ->
    #{
        id => 10,
        open_cond => [{1,32}],
        quick_cond => [],
        mail => 3102,
        reward => 351002        
    };
get(11) ->
    #{
        id => 11,
        open_cond => [{1,38}],
        quick_cond => [],
        mail => 3103,
        reward => 351003        
    };
get(12) ->
    #{
        id => 12,
        open_cond => [{1,42}],
        quick_cond => [],
        mail => 3104,
        reward => 351004        
    };
get(13) ->
    #{
        id => 13,
        open_cond => [{1,45}],
        quick_cond => [],
        mail => 3105,
        reward => 351005        
    };
get(14) ->
    #{
        id => 14,
        open_cond => [{1,48}],
        quick_cond => [],
        mail => 3106,
        reward => 351006        
    };
get(15) ->
    #{
        id => 15,
        open_cond => [{1,50}],
        quick_cond => [],
        mail => 3107,
        reward => 351007        
    };
get(16) ->
    #{
        id => 16,
        open_cond => [{1,52}],
        quick_cond => [],
        mail => 3108,
        reward => 351008        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [].
