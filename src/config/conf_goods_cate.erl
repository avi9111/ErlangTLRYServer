%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_goods_cate
%% @Brief  : 物品分类
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_goods_cate).

-export([
    get/1,
    get_ids/0
]).

get({10, 0}) ->
    #{
        type => 10,
        subtype => 0,
        name => <<"装备">>,
        category => 2        
    };
get({11, 0}) ->
    #{
        type => 11,
        subtype => 0,
        name => <<"丹药">>,
        category => 1        
    };
get({15, 0}) ->
    #{
        type => 15,
        subtype => 0,
        name => <<"礼包宝箱">>,
        category => 1        
    };
get({16, 0}) ->
    #{
        type => 16,
        subtype => 0,
        name => <<"材料道具">>,
        category => 1        
    };
get({17, 0}) ->
    #{
        type => 17,
        subtype => 0,
        name => <<"战骑">>,
        category => 2        
    };
get({18, 0}) ->
    #{
        type => 18,
        subtype => 0,
        name => <<"翅膀">>,
        category => 2        
    };
get({19, 0}) ->
    #{
        type => 19,
        subtype => 0,
        name => <<"神器">>,
        category => 2        
    };
get({20, 0}) ->
    #{
        type => 20,
        subtype => 0,
        name => <<"附体">>,
        category => 2        
    };
get({21, 0}) ->
    #{
        type => 21,
        subtype => 0,
        name => <<"悟性">>,
        category => 2        
    };
get({22, 0}) ->
    #{
        type => 22,
        subtype => 0,
        name => <<"背饰">>,
        category => 2        
    };
get({23, 0}) ->
    #{
        type => 23,
        subtype => 0,
        name => <<"名号">>,
        category => 2        
    };
get({24, 0}) ->
    #{
        type => 24,
        subtype => 0,
        name => <<"小师妹">>,
        category => 2        
    };
get({25, 0}) ->
    #{
        type => 25,
        subtype => 0,
        name => <<"魅力">>,
        category => 2        
    };
get({26, 0}) ->
    #{
        type => 26,
        subtype => 0,
        name => <<"灵器">>,
        category => 2        
    };
get({27, 0}) ->
    #{
        type => 27,
        subtype => 0,
        name => <<"发簪">>,
        category => 2        
    };
get({28, 0}) ->
    #{
        type => 28,
        subtype => 0,
        name => <<"腰佩">>,
        category => 2        
    };
get({29, 0}) ->
    #{
        type => 29,
        subtype => 0,
        name => <<"展示道具">>,
        category => 1        
    };
get({30, 0}) ->
    #{
        type => 30,
        subtype => 0,
        name => <<"称号">>,
        category => 1        
    };
get({31, 0}) ->
    #{
        type => 31,
        subtype => 0,
        name => <<"时装">>,
        category => 1        
    };
get({32, 0}) ->
    #{
        type => 32,
        subtype => 0,
        name => <<"皮肤">>,
        category => 1        
    };
get({33, 0}) ->
    #{
        type => 33,
        subtype => 0,
        name => <<"珍兽蛋">>,
        category => 1        
    };
get({34, 0}) ->
    #{
        type => 34,
        subtype => 0,
        name => <<"侠客">>,
        category => 1        
    };
get({35, 0}) ->
    #{
        type => 35,
        subtype => 0,
        name => <<"藏宝图">>,
        category => 1        
    };
get({38, 0}) ->
    #{
        type => 38,
        subtype => 0,
        name => <<"外观道具">>,
        category => 1        
    };
get({39, 0}) ->
    #{
        type => 39,
        subtype => 0,
        name => <<"龙元">>,
        category => 3        
    };
get({40, 0}) ->
    #{
        type => 40,
        subtype => 0,
        name => <<"烟花">>,
        category => 1        
    };
get({41, 1}) ->
    #{
        type => 41,
        subtype => 1,
        name => <<"变身道具（备用）">>,
        category => 1        
    };
get({42, 0}) ->
    #{
        type => 42,
        subtype => 0,
        name => <<"激活码">>,
        category => 1        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{10, 0}, {11, 0}, {15, 0}, {16, 0}, {17, 0}, {18, 0}, {19, 0}, {20, 0}, {21, 0}, {22, 0}, {23, 0}, {24, 0}, {25, 0}, {26, 0}, {27, 0}, {28, 0}, {29, 0}, {30, 0}, {31, 0}, {32, 0}, {33, 0}, {34, 0}, {35, 0}, {38, 0}, {39, 0}, {40, 0}, {41, 1}, {42, 0}].
