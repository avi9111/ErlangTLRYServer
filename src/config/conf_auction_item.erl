%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_auction_item
%% @Brief  : 拍卖物品
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_auction_item).

-export([
    get/1,
    get_ids/0
]).

get(1) ->
    #{
        id => 1,
        item => {16450003,1},
        value => 0,
        price => 2000,
        inc_price => 400,
        now_price => 4000,
        value_price => 1200,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(2) ->
    #{
        id => 2,
        item => {16450002,1},
        value => 0,
        price => 1000,
        inc_price => 200,
        now_price => 2000,
        value_price => 600,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(3) ->
    #{
        id => 3,
        item => {16450001,1},
        value => 0,
        price => 150,
        inc_price => 30,
        now_price => 300,
        value_price => 90,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(4) ->
    #{
        id => 4,
        item => {16260001,1},
        value => 0,
        price => 2000,
        inc_price => 400,
        now_price => 4000,
        value_price => 1200,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(5) ->
    #{
        id => 5,
        item => {16400002,1},
        value => 0,
        price => 250,
        inc_price => 50,
        now_price => 500,
        value_price => 150,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(6) ->
    #{
        id => 6,
        item => {16280001,1},
        value => 0,
        price => 380,
        inc_price => 76,
        now_price => 760,
        value_price => 228,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(7) ->
    #{
        id => 7,
        item => {16280002,1},
        value => 0,
        price => 480,
        inc_price => 96,
        now_price => 960,
        value_price => 288,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(8) ->
    #{
        id => 8,
        item => {16280003,1},
        value => 0,
        price => 590,
        inc_price => 118,
        now_price => 1180,
        value_price => 354,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(9) ->
    #{
        id => 9,
        item => {15012001,1},
        value => 0,
        price => 3800,
        inc_price => 760,
        now_price => 7600,
        value_price => 2280,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(10) ->
    #{
        id => 10,
        item => {15012002,1},
        value => 0,
        price => 4800,
        inc_price => 960,
        now_price => 9600,
        value_price => 2880,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(11) ->
    #{
        id => 11,
        item => {15012003,1},
        value => 0,
        price => 5900,
        inc_price => 1180,
        now_price => 11800,
        value_price => 3540,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(101) ->
    #{
        id => 101,
        item => {16270001,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(102) ->
    #{
        id => 102,
        item => {16270002,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(103) ->
    #{
        id => 103,
        item => {16270003,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(104) ->
    #{
        id => 104,
        item => {16270004,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(105) ->
    #{
        id => 105,
        item => {16270005,1},
        value => 0,
        price => 100,
        inc_price => 20,
        now_price => 200,
        value_price => 60,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(106) ->
    #{
        id => 106,
        item => {16270006,1},
        value => 0,
        price => 100,
        inc_price => 20,
        now_price => 200,
        value_price => 60,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(107) ->
    #{
        id => 107,
        item => {16270007,1},
        value => 0,
        price => 100,
        inc_price => 20,
        now_price => 200,
        value_price => 60,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(108) ->
    #{
        id => 108,
        item => {16270008,1},
        value => 0,
        price => 100,
        inc_price => 20,
        now_price => 200,
        value_price => 60,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(109) ->
    #{
        id => 109,
        item => {16270009,1},
        value => 0,
        price => 150,
        inc_price => 30,
        now_price => 300,
        value_price => 90,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(110) ->
    #{
        id => 110,
        item => {16270010,1},
        value => 0,
        price => 150,
        inc_price => 30,
        now_price => 300,
        value_price => 90,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(111) ->
    #{
        id => 111,
        item => {16270011,1},
        value => 0,
        price => 150,
        inc_price => 30,
        now_price => 300,
        value_price => 90,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(112) ->
    #{
        id => 112,
        item => {16270012,1},
        value => 0,
        price => 150,
        inc_price => 30,
        now_price => 300,
        value_price => 90,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(113) ->
    #{
        id => 113,
        item => {16270013,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(114) ->
    #{
        id => 114,
        item => {16270014,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(115) ->
    #{
        id => 115,
        item => {16270015,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(116) ->
    #{
        id => 116,
        item => {16270016,1},
        value => 0,
        price => 200,
        inc_price => 40,
        now_price => 400,
        value_price => 120,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(201) ->
    #{
        id => 201,
        item => {35000001,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(202) ->
    #{
        id => 202,
        item => {35000002,1},
        value => 0,
        price => 300,
        inc_price => 60,
        now_price => 600,
        value_price => 180,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(203) ->
    #{
        id => 203,
        item => {35000003,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(204) ->
    #{
        id => 204,
        item => {35000004,1},
        value => 0,
        price => 300,
        inc_price => 60,
        now_price => 600,
        value_price => 180,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(205) ->
    #{
        id => 205,
        item => {35000005,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(206) ->
    #{
        id => 206,
        item => {35000006,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(207) ->
    #{
        id => 207,
        item => {35000007,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(208) ->
    #{
        id => 208,
        item => {35000008,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(209) ->
    #{
        id => 209,
        item => {35000009,1},
        value => 0,
        price => 300,
        inc_price => 60,
        now_price => 600,
        value_price => 180,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(210) ->
    #{
        id => 210,
        item => {35000010,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(211) ->
    #{
        id => 211,
        item => {35000011,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(212) ->
    #{
        id => 212,
        item => {35000012,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(213) ->
    #{
        id => 213,
        item => {35000013,1},
        value => 0,
        price => 400,
        inc_price => 80,
        now_price => 800,
        value_price => 240,
        value_rates => [{1, 4000}, {2, 6000}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213].
