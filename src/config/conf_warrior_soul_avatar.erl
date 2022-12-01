%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_warrior_soul_avatar
%% @Brief  : 武魂精魄
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_warrior_soul_avatar).

-export([
    get/1,
    get_ids_by_type/1
]).

get(101) ->
    #{
        type => 1,
        attr => [{106,8}],
        conden_soul_unlock => [{}]
        
    };
get(102) ->
    #{
        type => 1,
        attr => [{106,23}],
        conden_soul_unlock => [{}]
        
    };
get(103) ->
    #{
        type => 1,
        attr => [{109,26},{103,43}],
        conden_soul_unlock => [{}]
        
    };
get(104) ->
    #{
        type => 1,
        attr => [{106,46}],
        conden_soul_unlock => [{}]
        
    };
get(201) ->
    #{
        type => 2,
        attr => [{11,300},{109,21}],
        conden_soul_unlock => [{}]
        
    };
get(202) ->
    #{
        type => 2,
        attr => [{103,108}],
        conden_soul_unlock => [{}]
        
    };
get(203) ->
    #{
        type => 2,
        attr => [{109,43},{105,60}],
        conden_soul_unlock => [{}]
        
    };
get(204) ->
    #{
        type => 2,
        attr => [{11,305}],
        conden_soul_unlock => [{}]
        
    };
get(205) ->
    #{
        type => 2,
        attr => [{12,305}],
        conden_soul_unlock => [{}]
        
    };
get(206) ->
    #{
        type => 3,
        attr => [{103,120}],
        conden_soul_unlock => [{5000,16480410}]
        
    };
get(207) ->
    #{
        type => 2,
        attr => [{109,36}],
        conden_soul_unlock => [{}]
        
    };
get(_Id) ->
    undefined.

%% @doc 获取某类型精魄id列表
%% @spec get_ids_by_type(AvatarType) -> [AvatarId].
%% AvatarType = AvatarId      :: integer()
get_ids_by_type(1) ->
    [101, 102, 103, 104];
get_ids_by_type(2) ->
    [201, 202, 203, 204, 205, 207];
get_ids_by_type(3) ->
    [206];
get_ids_by_type(_Type) ->
    [].