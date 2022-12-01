%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_achieve_cate
%% @Brief  : 成就分类
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_achieve_cate).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        cate => 1,
        name => <<"江湖">>
    };
get(2) ->
    #{
        cate => 2,
        name => <<"帮会">>
    };
get(3) ->
    #{
        cate => 3,
        name => <<"培养">>
    };
get(4) ->
    #{
        cate => 4,
        name => <<"挑战">>
    };
get(5) ->
    #{
        cate => 5,
        name => <<"活动">>
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5].
