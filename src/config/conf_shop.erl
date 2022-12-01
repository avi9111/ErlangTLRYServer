%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_shop
%% @Brief  : 商店配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_shop).

-export([
    get/1,
    get_ids/0,
	get_price_type/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"元宝商店">>,
        price_type => 25        
    };
get(2) ->
    #{
        id => 2,
        name => <<"绑元商店">>,
        price_type => 13        
    };
get(3) ->
    #{
        id => 3,
        name => <<"银两商店">>,
        price_type => 17        
    };
get(4) ->
    #{
        id => 4,
        name => <<"神秘商店">>,
        price_type => 13        
    };
get(5) ->
    #{
        id => 5,
        name => <<"材料商店">>,
        price_type => 2        
    };
get(6) ->
    #{
        id => 6,
        name => <<"神兽商店">>,
        price_type => 2        
    };
get(7) ->
    #{
        id => 7,
        name => <<"帮会商店">>,
        price_type => 10        
    };
get(8) ->
    #{
        id => 8,
        name => <<"帮会福利">>,
        price_type => 10        
    };
get(9) ->
    #{
        id => 9,
        name => <<"竞技商店">>,
        price_type => 2        
    };
get(10) ->
    #{
        id => 10,
        name => <<"竞技福利">>,
        price_type => 2        
    };
get(11) ->
    #{
        id => 11,
        name => <<"夺宝商店">>,
        price_type => 2        
    };
get(12) ->
    #{
        id => 12,
        name => <<"随身商店">>,
        price_type => 4        
    };
get(13) ->
    #{
        id => 13,
        name => <<"1级">>,
        price_type => 12        
    };
get(14) ->
    #{
        id => 14,
        name => <<"2级">>,
        price_type => 12        
    };
get(15) ->
    #{
        id => 15,
        name => <<"3级">>,
        price_type => 12        
    };
get(16) ->
    #{
        id => 16,
        name => <<"4级">>,
        price_type => 12        
    };
get(17) ->
    #{
        id => 17,
        name => <<"5级">>,
        price_type => 12        
    };
get(18) ->
    #{
        id => 18,
        name => <<"宋辽商店">>,
        price_type => 26        
    };
get(19) ->
    #{
        id => 19,
        name => <<"许愿果商店">>,
        price_type => 19        
    };
get(20) ->
    #{
        id => 20,
        name => <<"藏宝阁">>,
        price_type => 20        
    };
get(21) ->
    #{
        id => 21,
        name => <<"积分商城">>,
        price_type => 21        
    };
get(22) ->
    #{
        id => 22,
        name => <<"桃李商店">>,
        price_type => 22        
    };
get(23) ->
    #{
        id => 23,
        name => <<"恩爱商店">>,
        price_type => 17        
    };
get(24) ->
    #{
        id => 24,
        name => <<"百炼商店">>,
        price_type => 15        
    };
get(25) ->
    #{
        id => 25,
        name => <<"侠义商店">>,
        price_type => 16        
    };
get(26) ->
    #{
        id => 26,
        name => <<"天命商店">>,
        price_type => 24        
    };
get(27) ->
    #{
        id => 27,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(28) ->
    #{
        id => 28,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(29) ->
    #{
        id => 29,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(30) ->
    #{
        id => 30,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(31) ->
    #{
        id => 31,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(32) ->
    #{
        id => 32,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(33) ->
    #{
        id => 33,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(34) ->
    #{
        id => 34,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(35) ->
    #{
        id => 35,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(36) ->
    #{
        id => 36,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(37) ->
    #{
        id => 37,
        name => <<"杂货商店">>,
        price_type => 4        
    };
get(38) ->
    #{
        id => 38,
        name => <<"太湖石兑换商店">>,
        price_type => 16160124        
    };
get(39) ->
    #{
        id => 39,
        name => <<"徒弟礼包">>,
        price_type => 2        
    };
get(40) ->
    #{
        id => 40,
        name => <<"烟花商店">>,
        price_type => 4        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40].

get_price_type(1) ->
    25;
get_price_type(2) ->
    13;
get_price_type(3) ->
    17;
get_price_type(4) ->
    13;
get_price_type(5) ->
    2;
get_price_type(6) ->
    2;
get_price_type(7) ->
    10;
get_price_type(8) ->
    10;
get_price_type(9) ->
    2;
get_price_type(10) ->
    2;
get_price_type(11) ->
    2;
get_price_type(12) ->
    4;
get_price_type(13) ->
    12;
get_price_type(14) ->
    12;
get_price_type(15) ->
    12;
get_price_type(16) ->
    12;
get_price_type(17) ->
    12;
get_price_type(18) ->
    26;
get_price_type(19) ->
    19;
get_price_type(20) ->
    20;
get_price_type(21) ->
    21;
get_price_type(22) ->
    22;
get_price_type(23) ->
    17;
get_price_type(24) ->
    15;
get_price_type(25) ->
    16;
get_price_type(26) ->
    24;
get_price_type(27) ->
    4;
get_price_type(28) ->
    4;
get_price_type(29) ->
    4;
get_price_type(30) ->
    4;
get_price_type(31) ->
    4;
get_price_type(32) ->
    4;
get_price_type(33) ->
    4;
get_price_type(34) ->
    4;
get_price_type(35) ->
    4;
get_price_type(36) ->
    4;
get_price_type(37) ->
    4;
get_price_type(38) ->
    16160124;
get_price_type(39) ->
    2;
get_price_type(40) ->
    4;
get_price_type(_) ->
    undefined.
