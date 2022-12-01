%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_market_tag
%% @Brief  : 商会标签
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_market_tag).

-export([
    get/1,
    get_ids/0,
    get_cate/1,
    get_by_cate/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"50级">>,
        cate => 1,
        type => 2,
        rare => 1,
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
        name => <<"60级">>,
        cate => 1,
        type => 2,
        rare => 1,
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
        name => <<"70级">>,
        cate => 1,
        type => 2,
        rare => 1,
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
        name => <<"80级">>,
        cate => 1,
        type => 2,
        rare => 1,
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
get(5) ->
    #{
        id => 5,
        name => <<"90级">>,
        cate => 1,
        type => 2,
        rare => 1,
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
get(11) ->
    #{
        id => 11,
        name => <<"45级携带">>,
        cate => 2,
        type => 3,
        rare => 1,
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
get(12) ->
    #{
        id => 12,
        name => <<"65级携带">>,
        cate => 2,
        type => 3,
        rare => 1,
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
get(13) ->
    #{
        id => 13,
        name => <<"75级携带">>,
        cate => 2,
        type => 3,
        rare => 1,
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
get(14) ->
    #{
        id => 14,
        name => <<"85级携带">>,
        cate => 2,
        type => 3,
        rare => 1,
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
get(15) ->
    #{
        id => 15,
        name => <<"95级携带">>,
        cate => 2,
        type => 3,
        rare => 1,
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
get(21) ->
    #{
        id => 21,
        name => <<"稀有道具">>,
        cate => 3,
        type => 1,
        rare => 1,
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
get(31) ->
    #{
        id => 31,
        name => <<"30级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(32) ->
    #{
        id => 32,
        name => <<"40级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(33) ->
    #{
        id => 33,
        name => <<"50级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(34) ->
    #{
        id => 34,
        name => <<"60级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(35) ->
    #{
        id => 35,
        name => <<"70级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(36) ->
    #{
        id => 36,
        name => <<"80级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(37) ->
    #{
        id => 37,
        name => <<"90级">>,
        cate => 4,
        type => 2,
        rare => 0,
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
get(41) ->
    #{
        id => 41,
        name => <<"主动技能">>,
        cate => 6,
        type => 1,
        rare => 0,
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
get(42) ->
    #{
        id => 42,
        name => <<"被动技能">>,
        cate => 6,
        type => 1,
        rare => 0,
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
get(43) ->
    #{
        id => 43,
        name => <<"珍兽内丹">>,
        cate => 7,
        type => 1,
        rare => 0,
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
get(51) ->
    #{
        id => 51,
        name => <<"人物培养">>,
        cate => 5,
        type => 1,
        rare => 0,
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
get(52) ->
    #{
        id => 52,
        name => <<"珍兽培养">>,
        cate => 5,
        type => 1,
        rare => 0,
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
get(53) ->
    #{
        id => 53,
        name => <<"神器培养">>,
        cate => 5,
        type => 1,
        rare => 0,
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
get(54) ->
    #{
        id => 54,
        name => <<"暗器培养">>,
        cate => 5,
        type => 1,
        rare => 0,
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
get(55) ->
    #{
        id => 55,
        name => <<"武魂培养">>,
        cate => 5,
        type => 1,
        rare => 0,
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
get(61) ->
    #{
        id => 61,
        name => <<"采集物">>,
        cate => 8,
        type => 1,
        rare => 0,
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
get(62) ->
    #{
        id => 62,
        name => <<"奇物">>,
        cate => 8,
        type => 1,
        rare => 0,
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
get(71) ->
    #{
        id => 71,
        name => <<"棉布">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(72) ->
    #{
        id => 72,
        name => <<"毛皮">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(73) ->
    #{
        id => 73,
        name => <<"矿石">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(74) ->
    #{
        id => 74,
        name => <<"丝线">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(80) ->
    #{
        id => 80,
        name => <<"打造图">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(81) ->
    #{
        id => 81,
        name => <<"强化打造">>,
        cate => 9,
        type => 1,
        rare => 0,
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
get(82) ->
    #{
        id => 82,
        name => <<"缝纫打造符">>,
        cate => 10,
        type => 1,
        rare => 0,
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
get(83) ->
    #{
        id => 83,
        name => <<"制甲打造符">>,
        cate => 10,
        type => 1,
        rare => 0,
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
get(84) ->
    #{
        id => 84,
        name => <<"铸造打造符">>,
        cate => 10,
        type => 1,
        rare => 0,
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
get(85) ->
    #{
        id => 85,
        name => <<"工艺打造符">>,
        cate => 10,
        type => 1,
        rare => 0,
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
    [1, 2, 3, 4, 5, 11, 12, 13, 14, 15, 21, 31, 32, 33, 34, 35, 36, 37, 41, 42, 43, 51, 52, 53, 54, 55, 61, 62, 71, 72, 73, 74, 80, 81, 82, 83, 84, 85].

get_cate(1) ->
    1;
get_cate(2) ->
    1;
get_cate(3) ->
    1;
get_cate(4) ->
    1;
get_cate(5) ->
    1;
get_cate(11) ->
    2;
get_cate(12) ->
    2;
get_cate(13) ->
    2;
get_cate(14) ->
    2;
get_cate(15) ->
    2;
get_cate(21) ->
    3;
get_cate(31) ->
    4;
get_cate(32) ->
    4;
get_cate(33) ->
    4;
get_cate(34) ->
    4;
get_cate(35) ->
    4;
get_cate(36) ->
    4;
get_cate(37) ->
    4;
get_cate(41) ->
    6;
get_cate(42) ->
    6;
get_cate(43) ->
    7;
get_cate(51) ->
    5;
get_cate(52) ->
    5;
get_cate(53) ->
    5;
get_cate(54) ->
    5;
get_cate(55) ->
    5;
get_cate(61) ->
    8;
get_cate(62) ->
    8;
get_cate(71) ->
    9;
get_cate(72) ->
    9;
get_cate(73) ->
    9;
get_cate(74) ->
    9;
get_cate(80) ->
    9;
get_cate(81) ->
    9;
get_cate(82) ->
    10;
get_cate(83) ->
    10;
get_cate(84) ->
    10;
get_cate(85) ->
    10;
get_cate(_ID) ->
    undefined.

get_by_cate(1) ->
    [1, 2, 3, 4, 5];
get_by_cate(2) ->
    [11, 12, 13, 14, 15];
get_by_cate(3) ->
    [21];
get_by_cate(4) ->
    [31, 32, 33, 34, 35, 36, 37];
get_by_cate(6) ->
    [41, 42];
get_by_cate(7) ->
    [43];
get_by_cate(5) ->
    [51, 52, 53, 54, 55];
get_by_cate(8) ->
    [61, 62];
get_by_cate(9) ->
    [71, 72, 73, 74, 80, 81];
get_by_cate(10) ->
    [82, 83, 84, 85];
get_by_cate(_) ->
    [].
