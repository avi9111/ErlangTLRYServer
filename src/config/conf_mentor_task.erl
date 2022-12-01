%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_task
%% @Brief  : 师徒任务
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_task).

-export([
    get/1,
    get_ids_by_type/1
]).

get(1001) ->
    #{
        id => 1001,
        type => 41,
        finish_cond => [{1,30,[]}],
        mark => 5        
    };
get(1002) ->
    #{
        id => 1002,
        type => 41,
        finish_cond => [{1,40,[]}],
        mark => 5        
    };
get(1003) ->
    #{
        id => 1003,
        type => 41,
        finish_cond => [{1,50,[]}],
        mark => 10        
    };
get(1004) ->
    #{
        id => 1004,
        type => 41,
        finish_cond => [{35,1,[]}],
        mark => 10        
    };
get(1005) ->
    #{
        id => 1005,
        type => 41,
        finish_cond => [{11,1,[550,30]}],
        mark => 10        
    };
get(1006) ->
    #{
        id => 1006,
        type => 41,
        finish_cond => [{65,1,[1]}],
        mark => 5        
    };
get(1007) ->
    #{
        id => 1007,
        type => 41,
        finish_cond => [{90,1,[]}],
        mark => 5        
    };
get(1008) ->
    #{
        id => 1008,
        type => 41,
        finish_cond => [{91,1500,[]}],
        mark => 10        
    };
get(1009) ->
    #{
        id => 1009,
        type => 41,
        finish_cond => [{92,30,[]}],
        mark => 10        
    };
get(1010) ->
    #{
        id => 1010,
        type => 41,
        finish_cond => [{93,2,[1200]}],
        mark => 10        
    };
get(1011) ->
    #{
        id => 1011,
        type => 41,
        finish_cond => [{93,2,[700]}],
        mark => 10        
    };
get(1012) ->
    #{
        id => 1012,
        type => 41,
        finish_cond => [{93,2,[800]}],
        mark => 10        
    };
get(2001) ->
    #{
        id => 2001,
        type => 42,
        finish_cond => [{16,10,[]}],
        mark => 0        
    };
get(2002) ->
    #{
        id => 2002,
        type => 42,
        finish_cond => [{26,1,[]}],
        mark => 0        
    };
get(2003) ->
    #{
        id => 2003,
        type => 42,
        finish_cond => [{27,10,[]}],
        mark => 0        
    };
get(2004) ->
    #{
        id => 2004,
        type => 42,
        finish_cond => [{17,1,[700]}],
        mark => 0        
    };
get(2005) ->
    #{
        id => 2005,
        type => 42,
        finish_cond => [{17,1,[800]}],
        mark => 0        
    };
get(2006) ->
    #{
        id => 2006,
        type => 42,
        finish_cond => [{17,1,[1200]}],
        mark => 0        
    };
get(3001) ->
    #{
        id => 3001,
        type => 43,
        finish_cond => [{17,3,[700]}],
        mark => 0        
    };
get(3002) ->
    #{
        id => 3002,
        type => 43,
        finish_cond => [{17,3,[800]}],
        mark => 0        
    };
get(3003) ->
    #{
        id => 3003,
        type => 43,
        finish_cond => [{17,3,[1200]}],
        mark => 0        
    };
get(3004) ->
    #{
        id => 3004,
        type => 43,
        finish_cond => [{16,30,[]}],
        mark => 0        
    };
get(3005) ->
    #{
        id => 3005,
        type => 43,
        finish_cond => [{26,3,[]}],
        mark => 0        
    };
get(3006) ->
    #{
        id => 3006,
        type => 43,
        finish_cond => [{17,3,[900]}],
        mark => 0        
    };
get(3007) ->
    #{
        id => 3007,
        type => 43,
        finish_cond => [{29,20,[]}],
        mark => 0        
    };
get(3008) ->
    #{
        id => 3008,
        type => 43,
        finish_cond => [{32,2,[]}],
        mark => 0        
    };
get(3009) ->
    #{
        id => 3009,
        type => 43,
        finish_cond => [{33,2,[]}],
        mark => 0        
    };
get(3010) ->
    #{
        id => 3010,
        type => 43,
        finish_cond => [{43,3,[]}],
        mark => 0        
    };
get(3011) ->
    #{
        id => 3011,
        type => 43,
        finish_cond => [{44,5,[]}],
        mark => 0        
    };
get(3012) ->
    #{
        id => 3012,
        type => 43,
        finish_cond => [{25,30,[]}],
        mark => 0        
    };
get(3013) ->
    #{
        id => 3013,
        type => 43,
        finish_cond => [{35,1,[]}],
        mark => 0        
    };
get(3014) ->
    #{
        id => 3014,
        type => 43,
        finish_cond => [{94,3,[]}],
        mark => 0        
    };
get(_Id) ->
    undefined.

%% @doc 获取某类型任务ID列表
%% @spec get_ids_by_type(Type) -> [Id].
%% Type = Id      :: integer()
get_ids_by_type(41) ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012];
get_ids_by_type(42) ->
    [2001, 2002, 2003, 2004, 2005, 2006];
get_ids_by_type(43) ->
    [3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 3010, 3011, 3012, 3013, 3014];
get_ids_by_type(_Type) ->
    [].