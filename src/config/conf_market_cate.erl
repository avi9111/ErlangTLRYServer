%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_cate
%% @Brief  : 商会分类
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_cate).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        rare => 1,
        type => 2,
        name => <<"稀有装备">>,
        expire => 86,
        booking => 10,
        follow => 1,
        bind => 0,
        overlap => 1,
        fee_ratio => 10,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 2,
        sell_money => 18        
    };
get(2) ->
    #{
        id => 2,
        rare => 1,
        type => 3,
        name => <<"稀有珍兽">>,
        expire => 86,
        booking => 10,
        follow => 1,
        bind => 0,
        overlap => 1,
        fee_ratio => 10,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 2,
        sell_money => 18        
    };
get(3) ->
    #{
        id => 3,
        rare => 1,
        type => 1,
        name => <<"稀有道具">>,
        expire => 86,
        booking => 10,
        follow => 1,
        bind => 0,
        overlap => 1,
        fee_ratio => 10,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 2,
        sell_money => 18        
    };
get(4) ->
    #{
        id => 4,
        rare => 0,
        type => 2,
        name => <<"套装装备">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 1,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(5) ->
    #{
        id => 5,
        rare => 0,
        type => 1,
        name => <<"培养材料">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(6) ->
    #{
        id => 6,
        rare => 0,
        type => 1,
        name => <<"珍兽技能">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(7) ->
    #{
        id => 7,
        rare => 0,
        type => 1,
        name => <<"珍兽内丹">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(8) ->
    #{
        id => 8,
        rare => 0,
        type => 1,
        name => <<"任务道具">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(9) ->
    #{
        id => 9,
        rare => 0,
        type => 1,
        name => <<"打造材料">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(10) ->
    #{
        id => 10,
        rare => 0,
        type => 1,
        name => <<"打造符">>,
        expire => 48,
        booking => 0,
        follow => 0,
        bind => 1,
        overlap => 999,
        fee_ratio => 0.1,
        min_fee => 1000,
        tax_ratio => 10,
        buy_money => 17,
        sell_money => 17        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
