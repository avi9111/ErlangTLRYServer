%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_daily_welfare
%% @Brief  : 天龙福利
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_daily_welfare).

-export([
    get/1,
    get_ids/0,
    get_by_lv/1
]).

get({1, 1}) ->
    #{
        id => 1,
        level => 1,
        exp => 30,
        reward_h => 33001,
        reward_l => 40001        
    };
get({1, 2}) ->
    #{
        id => 2,
        level => 1,
        exp => 60,
        reward_h => 33002,
        reward_l => 50001        
    };
get({1, 3}) ->
    #{
        id => 3,
        level => 1,
        exp => 100,
        reward_h => 33003,
        reward_l => 60001        
    };
get({2, 1}) ->
    #{
        id => 1,
        level => 2,
        exp => 30,
        reward_h => 33001,
        reward_l => 40002        
    };
get({2, 2}) ->
    #{
        id => 2,
        level => 2,
        exp => 60,
        reward_h => 33002,
        reward_l => 50002        
    };
get({2, 3}) ->
    #{
        id => 3,
        level => 2,
        exp => 100,
        reward_h => 33003,
        reward_l => 60002        
    };
get({3, 1}) ->
    #{
        id => 1,
        level => 3,
        exp => 30,
        reward_h => 33001,
        reward_l => 40003        
    };
get({3, 2}) ->
    #{
        id => 2,
        level => 3,
        exp => 60,
        reward_h => 33002,
        reward_l => 50003        
    };
get({3, 3}) ->
    #{
        id => 3,
        level => 3,
        exp => 100,
        reward_h => 33003,
        reward_l => 60003        
    };
get({4, 1}) ->
    #{
        id => 1,
        level => 4,
        exp => 30,
        reward_h => 33001,
        reward_l => 40004        
    };
get({4, 2}) ->
    #{
        id => 2,
        level => 4,
        exp => 60,
        reward_h => 33002,
        reward_l => 50004        
    };
get({4, 3}) ->
    #{
        id => 3,
        level => 4,
        exp => 100,
        reward_h => 33003,
        reward_l => 60004        
    };
get({5, 1}) ->
    #{
        id => 1,
        level => 5,
        exp => 30,
        reward_h => 33001,
        reward_l => 40005        
    };
get({5, 2}) ->
    #{
        id => 2,
        level => 5,
        exp => 60,
        reward_h => 33002,
        reward_l => 50005        
    };
get({5, 3}) ->
    #{
        id => 3,
        level => 5,
        exp => 100,
        reward_h => 33003,
        reward_l => 60005        
    };
get({6, 1}) ->
    #{
        id => 1,
        level => 6,
        exp => 30,
        reward_h => 33001,
        reward_l => 40006        
    };
get({6, 2}) ->
    #{
        id => 2,
        level => 6,
        exp => 60,
        reward_h => 33002,
        reward_l => 50006        
    };
get({6, 3}) ->
    #{
        id => 3,
        level => 6,
        exp => 100,
        reward_h => 33003,
        reward_l => 60006        
    };
get({7, 1}) ->
    #{
        id => 1,
        level => 7,
        exp => 30,
        reward_h => 33001,
        reward_l => 40007        
    };
get({7, 2}) ->
    #{
        id => 2,
        level => 7,
        exp => 60,
        reward_h => 33002,
        reward_l => 50007        
    };
get({7, 3}) ->
    #{
        id => 3,
        level => 7,
        exp => 100,
        reward_h => 33003,
        reward_l => 60007        
    };
get({8, 1}) ->
    #{
        id => 1,
        level => 8,
        exp => 30,
        reward_h => 33001,
        reward_l => 40008        
    };
get({8, 2}) ->
    #{
        id => 2,
        level => 8,
        exp => 60,
        reward_h => 33002,
        reward_l => 50008        
    };
get({8, 3}) ->
    #{
        id => 3,
        level => 8,
        exp => 100,
        reward_h => 33003,
        reward_l => 60008        
    };
get({9, 1}) ->
    #{
        id => 1,
        level => 9,
        exp => 30,
        reward_h => 33001,
        reward_l => 40009        
    };
get({9, 2}) ->
    #{
        id => 2,
        level => 9,
        exp => 60,
        reward_h => 33002,
        reward_l => 50009        
    };
get({9, 3}) ->
    #{
        id => 3,
        level => 9,
        exp => 100,
        reward_h => 33003,
        reward_l => 60009        
    };
get({10, 1}) ->
    #{
        id => 1,
        level => 10,
        exp => 30,
        reward_h => 33001,
        reward_l => 40010        
    };
get({10, 2}) ->
    #{
        id => 2,
        level => 10,
        exp => 60,
        reward_h => 33002,
        reward_l => 50010        
    };
get({10, 3}) ->
    #{
        id => 3,
        level => 10,
        exp => 100,
        reward_h => 33003,
        reward_l => 60010        
    };
get({11, 1}) ->
    #{
        id => 1,
        level => 11,
        exp => 30,
        reward_h => 33001,
        reward_l => 40011        
    };
get({11, 2}) ->
    #{
        id => 2,
        level => 11,
        exp => 60,
        reward_h => 33002,
        reward_l => 50011        
    };
get({11, 3}) ->
    #{
        id => 3,
        level => 11,
        exp => 100,
        reward_h => 33003,
        reward_l => 60011        
    };
get({12, 1}) ->
    #{
        id => 1,
        level => 12,
        exp => 30,
        reward_h => 33001,
        reward_l => 40012        
    };
get({12, 2}) ->
    #{
        id => 2,
        level => 12,
        exp => 60,
        reward_h => 33002,
        reward_l => 50012        
    };
get({12, 3}) ->
    #{
        id => 3,
        level => 12,
        exp => 100,
        reward_h => 33003,
        reward_l => 60012        
    };
get({13, 1}) ->
    #{
        id => 1,
        level => 13,
        exp => 30,
        reward_h => 33001,
        reward_l => 40013        
    };
get({13, 2}) ->
    #{
        id => 2,
        level => 13,
        exp => 60,
        reward_h => 33002,
        reward_l => 50013        
    };
get({13, 3}) ->
    #{
        id => 3,
        level => 13,
        exp => 100,
        reward_h => 33003,
        reward_l => 60013        
    };
get({14, 1}) ->
    #{
        id => 1,
        level => 14,
        exp => 30,
        reward_h => 33001,
        reward_l => 40014        
    };
get({14, 2}) ->
    #{
        id => 2,
        level => 14,
        exp => 60,
        reward_h => 33002,
        reward_l => 50014        
    };
get({14, 3}) ->
    #{
        id => 3,
        level => 14,
        exp => 100,
        reward_h => 33003,
        reward_l => 60014        
    };
get({15, 1}) ->
    #{
        id => 1,
        level => 15,
        exp => 30,
        reward_h => 33001,
        reward_l => 40015        
    };
get({15, 2}) ->
    #{
        id => 2,
        level => 15,
        exp => 60,
        reward_h => 33002,
        reward_l => 50015        
    };
get({15, 3}) ->
    #{
        id => 3,
        level => 15,
        exp => 100,
        reward_h => 33003,
        reward_l => 60015        
    };
get({16, 1}) ->
    #{
        id => 1,
        level => 16,
        exp => 30,
        reward_h => 33001,
        reward_l => 40016        
    };
get({16, 2}) ->
    #{
        id => 2,
        level => 16,
        exp => 60,
        reward_h => 33002,
        reward_l => 50016        
    };
get({16, 3}) ->
    #{
        id => 3,
        level => 16,
        exp => 100,
        reward_h => 33003,
        reward_l => 60016        
    };
get({17, 1}) ->
    #{
        id => 1,
        level => 17,
        exp => 30,
        reward_h => 33001,
        reward_l => 40017        
    };
get({17, 2}) ->
    #{
        id => 2,
        level => 17,
        exp => 60,
        reward_h => 33002,
        reward_l => 50017        
    };
get({17, 3}) ->
    #{
        id => 3,
        level => 17,
        exp => 100,
        reward_h => 33003,
        reward_l => 60017        
    };
get({18, 1}) ->
    #{
        id => 1,
        level => 18,
        exp => 30,
        reward_h => 33001,
        reward_l => 40018        
    };
get({18, 2}) ->
    #{
        id => 2,
        level => 18,
        exp => 60,
        reward_h => 33002,
        reward_l => 50018        
    };
get({18, 3}) ->
    #{
        id => 3,
        level => 18,
        exp => 100,
        reward_h => 33003,
        reward_l => 60018        
    };
get({19, 1}) ->
    #{
        id => 1,
        level => 19,
        exp => 30,
        reward_h => 33001,
        reward_l => 40019        
    };
get({19, 2}) ->
    #{
        id => 2,
        level => 19,
        exp => 60,
        reward_h => 33002,
        reward_l => 50019        
    };
get({19, 3}) ->
    #{
        id => 3,
        level => 19,
        exp => 100,
        reward_h => 33003,
        reward_l => 60019        
    };
get({20, 1}) ->
    #{
        id => 1,
        level => 20,
        exp => 30,
        reward_h => 33001,
        reward_l => 40020        
    };
get({20, 2}) ->
    #{
        id => 2,
        level => 20,
        exp => 60,
        reward_h => 33002,
        reward_l => 50020        
    };
get({20, 3}) ->
    #{
        id => 3,
        level => 20,
        exp => 100,
        reward_h => 33003,
        reward_l => 60020        
    };
get({21, 1}) ->
    #{
        id => 1,
        level => 21,
        exp => 30,
        reward_h => 33001,
        reward_l => 40021        
    };
get({21, 2}) ->
    #{
        id => 2,
        level => 21,
        exp => 60,
        reward_h => 33002,
        reward_l => 50021        
    };
get({21, 3}) ->
    #{
        id => 3,
        level => 21,
        exp => 100,
        reward_h => 33003,
        reward_l => 60021        
    };
get({22, 1}) ->
    #{
        id => 1,
        level => 22,
        exp => 30,
        reward_h => 33001,
        reward_l => 40022        
    };
get({22, 2}) ->
    #{
        id => 2,
        level => 22,
        exp => 60,
        reward_h => 33002,
        reward_l => 50022        
    };
get({22, 3}) ->
    #{
        id => 3,
        level => 22,
        exp => 100,
        reward_h => 33003,
        reward_l => 60022        
    };
get({23, 1}) ->
    #{
        id => 1,
        level => 23,
        exp => 30,
        reward_h => 33001,
        reward_l => 40023        
    };
get({23, 2}) ->
    #{
        id => 2,
        level => 23,
        exp => 60,
        reward_h => 33002,
        reward_l => 50023        
    };
get({23, 3}) ->
    #{
        id => 3,
        level => 23,
        exp => 100,
        reward_h => 33003,
        reward_l => 60023        
    };
get({24, 1}) ->
    #{
        id => 1,
        level => 24,
        exp => 30,
        reward_h => 33001,
        reward_l => 40024        
    };
get({24, 2}) ->
    #{
        id => 2,
        level => 24,
        exp => 60,
        reward_h => 33002,
        reward_l => 50024        
    };
get({24, 3}) ->
    #{
        id => 3,
        level => 24,
        exp => 100,
        reward_h => 33003,
        reward_l => 60024        
    };
get({25, 1}) ->
    #{
        id => 1,
        level => 25,
        exp => 30,
        reward_h => 33001,
        reward_l => 40025        
    };
get({25, 2}) ->
    #{
        id => 2,
        level => 25,
        exp => 60,
        reward_h => 33002,
        reward_l => 50025        
    };
get({25, 3}) ->
    #{
        id => 3,
        level => 25,
        exp => 100,
        reward_h => 33003,
        reward_l => 60025        
    };
get({26, 1}) ->
    #{
        id => 1,
        level => 26,
        exp => 30,
        reward_h => 33001,
        reward_l => 40026        
    };
get({26, 2}) ->
    #{
        id => 2,
        level => 26,
        exp => 60,
        reward_h => 33002,
        reward_l => 50026        
    };
get({26, 3}) ->
    #{
        id => 3,
        level => 26,
        exp => 100,
        reward_h => 33003,
        reward_l => 60026        
    };
get({27, 1}) ->
    #{
        id => 1,
        level => 27,
        exp => 30,
        reward_h => 33001,
        reward_l => 40027        
    };
get({27, 2}) ->
    #{
        id => 2,
        level => 27,
        exp => 60,
        reward_h => 33002,
        reward_l => 50027        
    };
get({27, 3}) ->
    #{
        id => 3,
        level => 27,
        exp => 100,
        reward_h => 33003,
        reward_l => 60027        
    };
get({28, 1}) ->
    #{
        id => 1,
        level => 28,
        exp => 30,
        reward_h => 33001,
        reward_l => 40028        
    };
get({28, 2}) ->
    #{
        id => 2,
        level => 28,
        exp => 60,
        reward_h => 33002,
        reward_l => 50028        
    };
get({28, 3}) ->
    #{
        id => 3,
        level => 28,
        exp => 100,
        reward_h => 33003,
        reward_l => 60028        
    };
get({29, 1}) ->
    #{
        id => 1,
        level => 29,
        exp => 30,
        reward_h => 33001,
        reward_l => 40029        
    };
get({29, 2}) ->
    #{
        id => 2,
        level => 29,
        exp => 60,
        reward_h => 33002,
        reward_l => 50029        
    };
get({29, 3}) ->
    #{
        id => 3,
        level => 29,
        exp => 100,
        reward_h => 33003,
        reward_l => 60029        
    };
get({30, 1}) ->
    #{
        id => 1,
        level => 30,
        exp => 30,
        reward_h => 33001,
        reward_l => 40030        
    };
get({30, 2}) ->
    #{
        id => 2,
        level => 30,
        exp => 60,
        reward_h => 33002,
        reward_l => 50030        
    };
get({30, 3}) ->
    #{
        id => 3,
        level => 30,
        exp => 100,
        reward_h => 33003,
        reward_l => 60030        
    };
get({31, 1}) ->
    #{
        id => 1,
        level => 31,
        exp => 30,
        reward_h => 33001,
        reward_l => 40031        
    };
get({31, 2}) ->
    #{
        id => 2,
        level => 31,
        exp => 60,
        reward_h => 33002,
        reward_l => 50031        
    };
get({31, 3}) ->
    #{
        id => 3,
        level => 31,
        exp => 100,
        reward_h => 33003,
        reward_l => 60031        
    };
get({32, 1}) ->
    #{
        id => 1,
        level => 32,
        exp => 30,
        reward_h => 33001,
        reward_l => 40032        
    };
get({32, 2}) ->
    #{
        id => 2,
        level => 32,
        exp => 60,
        reward_h => 33002,
        reward_l => 50032        
    };
get({32, 3}) ->
    #{
        id => 3,
        level => 32,
        exp => 100,
        reward_h => 33003,
        reward_l => 60032        
    };
get({33, 1}) ->
    #{
        id => 1,
        level => 33,
        exp => 30,
        reward_h => 33001,
        reward_l => 40033        
    };
get({33, 2}) ->
    #{
        id => 2,
        level => 33,
        exp => 60,
        reward_h => 33002,
        reward_l => 50033        
    };
get({33, 3}) ->
    #{
        id => 3,
        level => 33,
        exp => 100,
        reward_h => 33003,
        reward_l => 60033        
    };
get({34, 1}) ->
    #{
        id => 1,
        level => 34,
        exp => 30,
        reward_h => 33001,
        reward_l => 40034        
    };
get({34, 2}) ->
    #{
        id => 2,
        level => 34,
        exp => 60,
        reward_h => 33002,
        reward_l => 50034        
    };
get({34, 3}) ->
    #{
        id => 3,
        level => 34,
        exp => 100,
        reward_h => 33003,
        reward_l => 60034        
    };
get({35, 1}) ->
    #{
        id => 1,
        level => 35,
        exp => 30,
        reward_h => 33001,
        reward_l => 40035        
    };
get({35, 2}) ->
    #{
        id => 2,
        level => 35,
        exp => 60,
        reward_h => 33002,
        reward_l => 50035        
    };
get({35, 3}) ->
    #{
        id => 3,
        level => 35,
        exp => 100,
        reward_h => 33003,
        reward_l => 60035        
    };
get({36, 1}) ->
    #{
        id => 1,
        level => 36,
        exp => 30,
        reward_h => 33001,
        reward_l => 40036        
    };
get({36, 2}) ->
    #{
        id => 2,
        level => 36,
        exp => 60,
        reward_h => 33002,
        reward_l => 50036        
    };
get({36, 3}) ->
    #{
        id => 3,
        level => 36,
        exp => 100,
        reward_h => 33003,
        reward_l => 60036        
    };
get({37, 1}) ->
    #{
        id => 1,
        level => 37,
        exp => 30,
        reward_h => 33001,
        reward_l => 40037        
    };
get({37, 2}) ->
    #{
        id => 2,
        level => 37,
        exp => 60,
        reward_h => 33002,
        reward_l => 50037        
    };
get({37, 3}) ->
    #{
        id => 3,
        level => 37,
        exp => 100,
        reward_h => 33003,
        reward_l => 60037        
    };
get({38, 1}) ->
    #{
        id => 1,
        level => 38,
        exp => 30,
        reward_h => 33001,
        reward_l => 40038        
    };
get({38, 2}) ->
    #{
        id => 2,
        level => 38,
        exp => 60,
        reward_h => 33002,
        reward_l => 50038        
    };
get({38, 3}) ->
    #{
        id => 3,
        level => 38,
        exp => 100,
        reward_h => 33003,
        reward_l => 60038        
    };
get({39, 1}) ->
    #{
        id => 1,
        level => 39,
        exp => 30,
        reward_h => 33001,
        reward_l => 40039        
    };
get({39, 2}) ->
    #{
        id => 2,
        level => 39,
        exp => 60,
        reward_h => 33002,
        reward_l => 50039        
    };
get({39, 3}) ->
    #{
        id => 3,
        level => 39,
        exp => 100,
        reward_h => 33003,
        reward_l => 60039        
    };
get({40, 1}) ->
    #{
        id => 1,
        level => 40,
        exp => 30,
        reward_h => 33001,
        reward_l => 40040        
    };
get({40, 2}) ->
    #{
        id => 2,
        level => 40,
        exp => 60,
        reward_h => 33002,
        reward_l => 50040        
    };
get({40, 3}) ->
    #{
        id => 3,
        level => 40,
        exp => 100,
        reward_h => 33003,
        reward_l => 60040        
    };
get({41, 1}) ->
    #{
        id => 1,
        level => 41,
        exp => 30,
        reward_h => 33001,
        reward_l => 40041        
    };
get({41, 2}) ->
    #{
        id => 2,
        level => 41,
        exp => 60,
        reward_h => 33002,
        reward_l => 50041        
    };
get({41, 3}) ->
    #{
        id => 3,
        level => 41,
        exp => 100,
        reward_h => 33003,
        reward_l => 60041        
    };
get({42, 1}) ->
    #{
        id => 1,
        level => 42,
        exp => 30,
        reward_h => 33001,
        reward_l => 40042        
    };
get({42, 2}) ->
    #{
        id => 2,
        level => 42,
        exp => 60,
        reward_h => 33002,
        reward_l => 50042        
    };
get({42, 3}) ->
    #{
        id => 3,
        level => 42,
        exp => 100,
        reward_h => 33003,
        reward_l => 60042        
    };
get({43, 1}) ->
    #{
        id => 1,
        level => 43,
        exp => 30,
        reward_h => 33001,
        reward_l => 40043        
    };
get({43, 2}) ->
    #{
        id => 2,
        level => 43,
        exp => 60,
        reward_h => 33002,
        reward_l => 50043        
    };
get({43, 3}) ->
    #{
        id => 3,
        level => 43,
        exp => 100,
        reward_h => 33003,
        reward_l => 60043        
    };
get({44, 1}) ->
    #{
        id => 1,
        level => 44,
        exp => 30,
        reward_h => 33001,
        reward_l => 40044        
    };
get({44, 2}) ->
    #{
        id => 2,
        level => 44,
        exp => 60,
        reward_h => 33002,
        reward_l => 50044        
    };
get({44, 3}) ->
    #{
        id => 3,
        level => 44,
        exp => 100,
        reward_h => 33003,
        reward_l => 60044        
    };
get({45, 1}) ->
    #{
        id => 1,
        level => 45,
        exp => 30,
        reward_h => 33001,
        reward_l => 40045        
    };
get({45, 2}) ->
    #{
        id => 2,
        level => 45,
        exp => 60,
        reward_h => 33002,
        reward_l => 50045        
    };
get({45, 3}) ->
    #{
        id => 3,
        level => 45,
        exp => 100,
        reward_h => 33003,
        reward_l => 60045        
    };
get({46, 1}) ->
    #{
        id => 1,
        level => 46,
        exp => 30,
        reward_h => 33001,
        reward_l => 40046        
    };
get({46, 2}) ->
    #{
        id => 2,
        level => 46,
        exp => 60,
        reward_h => 33002,
        reward_l => 50046        
    };
get({46, 3}) ->
    #{
        id => 3,
        level => 46,
        exp => 100,
        reward_h => 33003,
        reward_l => 60046        
    };
get({47, 1}) ->
    #{
        id => 1,
        level => 47,
        exp => 30,
        reward_h => 33001,
        reward_l => 40047        
    };
get({47, 2}) ->
    #{
        id => 2,
        level => 47,
        exp => 60,
        reward_h => 33002,
        reward_l => 50047        
    };
get({47, 3}) ->
    #{
        id => 3,
        level => 47,
        exp => 100,
        reward_h => 33003,
        reward_l => 60047        
    };
get({48, 1}) ->
    #{
        id => 1,
        level => 48,
        exp => 30,
        reward_h => 33001,
        reward_l => 40048        
    };
get({48, 2}) ->
    #{
        id => 2,
        level => 48,
        exp => 60,
        reward_h => 33002,
        reward_l => 50048        
    };
get({48, 3}) ->
    #{
        id => 3,
        level => 48,
        exp => 100,
        reward_h => 33003,
        reward_l => 60048        
    };
get({49, 1}) ->
    #{
        id => 1,
        level => 49,
        exp => 30,
        reward_h => 33001,
        reward_l => 40049        
    };
get({49, 2}) ->
    #{
        id => 2,
        level => 49,
        exp => 60,
        reward_h => 33002,
        reward_l => 50049        
    };
get({49, 3}) ->
    #{
        id => 3,
        level => 49,
        exp => 100,
        reward_h => 33003,
        reward_l => 60049        
    };
get({50, 1}) ->
    #{
        id => 1,
        level => 50,
        exp => 30,
        reward_h => 33001,
        reward_l => 40050        
    };
get({50, 2}) ->
    #{
        id => 2,
        level => 50,
        exp => 60,
        reward_h => 33002,
        reward_l => 50050        
    };
get({50, 3}) ->
    #{
        id => 3,
        level => 50,
        exp => 100,
        reward_h => 33003,
        reward_l => 60050        
    };
get({51, 1}) ->
    #{
        id => 1,
        level => 51,
        exp => 30,
        reward_h => 33001,
        reward_l => 40051        
    };
get({51, 2}) ->
    #{
        id => 2,
        level => 51,
        exp => 60,
        reward_h => 33002,
        reward_l => 50051        
    };
get({51, 3}) ->
    #{
        id => 3,
        level => 51,
        exp => 100,
        reward_h => 33003,
        reward_l => 60051        
    };
get({52, 1}) ->
    #{
        id => 1,
        level => 52,
        exp => 30,
        reward_h => 33001,
        reward_l => 40052        
    };
get({52, 2}) ->
    #{
        id => 2,
        level => 52,
        exp => 60,
        reward_h => 33002,
        reward_l => 50052        
    };
get({52, 3}) ->
    #{
        id => 3,
        level => 52,
        exp => 100,
        reward_h => 33003,
        reward_l => 60052        
    };
get({53, 1}) ->
    #{
        id => 1,
        level => 53,
        exp => 30,
        reward_h => 33001,
        reward_l => 40053        
    };
get({53, 2}) ->
    #{
        id => 2,
        level => 53,
        exp => 60,
        reward_h => 33002,
        reward_l => 50053        
    };
get({53, 3}) ->
    #{
        id => 3,
        level => 53,
        exp => 100,
        reward_h => 33003,
        reward_l => 60053        
    };
get({54, 1}) ->
    #{
        id => 1,
        level => 54,
        exp => 30,
        reward_h => 33001,
        reward_l => 40054        
    };
get({54, 2}) ->
    #{
        id => 2,
        level => 54,
        exp => 60,
        reward_h => 33002,
        reward_l => 50054        
    };
get({54, 3}) ->
    #{
        id => 3,
        level => 54,
        exp => 100,
        reward_h => 33003,
        reward_l => 60054        
    };
get({55, 1}) ->
    #{
        id => 1,
        level => 55,
        exp => 30,
        reward_h => 33001,
        reward_l => 40055        
    };
get({55, 2}) ->
    #{
        id => 2,
        level => 55,
        exp => 60,
        reward_h => 33002,
        reward_l => 50055        
    };
get({55, 3}) ->
    #{
        id => 3,
        level => 55,
        exp => 100,
        reward_h => 33003,
        reward_l => 60055        
    };
get({56, 1}) ->
    #{
        id => 1,
        level => 56,
        exp => 30,
        reward_h => 33001,
        reward_l => 40056        
    };
get({56, 2}) ->
    #{
        id => 2,
        level => 56,
        exp => 60,
        reward_h => 33002,
        reward_l => 50056        
    };
get({56, 3}) ->
    #{
        id => 3,
        level => 56,
        exp => 100,
        reward_h => 33003,
        reward_l => 60056        
    };
get({57, 1}) ->
    #{
        id => 1,
        level => 57,
        exp => 30,
        reward_h => 33001,
        reward_l => 40057        
    };
get({57, 2}) ->
    #{
        id => 2,
        level => 57,
        exp => 60,
        reward_h => 33002,
        reward_l => 50057        
    };
get({57, 3}) ->
    #{
        id => 3,
        level => 57,
        exp => 100,
        reward_h => 33003,
        reward_l => 60057        
    };
get({58, 1}) ->
    #{
        id => 1,
        level => 58,
        exp => 30,
        reward_h => 33001,
        reward_l => 40058        
    };
get({58, 2}) ->
    #{
        id => 2,
        level => 58,
        exp => 60,
        reward_h => 33002,
        reward_l => 50058        
    };
get({58, 3}) ->
    #{
        id => 3,
        level => 58,
        exp => 100,
        reward_h => 33003,
        reward_l => 60058        
    };
get({59, 1}) ->
    #{
        id => 1,
        level => 59,
        exp => 30,
        reward_h => 33001,
        reward_l => 40059        
    };
get({59, 2}) ->
    #{
        id => 2,
        level => 59,
        exp => 60,
        reward_h => 33002,
        reward_l => 50059        
    };
get({59, 3}) ->
    #{
        id => 3,
        level => 59,
        exp => 100,
        reward_h => 33003,
        reward_l => 60059        
    };
get({60, 1}) ->
    #{
        id => 1,
        level => 60,
        exp => 30,
        reward_h => 33001,
        reward_l => 40060        
    };
get({60, 2}) ->
    #{
        id => 2,
        level => 60,
        exp => 60,
        reward_h => 33002,
        reward_l => 50060        
    };
get({60, 3}) ->
    #{
        id => 3,
        level => 60,
        exp => 100,
        reward_h => 33003,
        reward_l => 60060        
    };
get({61, 1}) ->
    #{
        id => 1,
        level => 61,
        exp => 30,
        reward_h => 33001,
        reward_l => 40061        
    };
get({61, 2}) ->
    #{
        id => 2,
        level => 61,
        exp => 60,
        reward_h => 33002,
        reward_l => 50061        
    };
get({61, 3}) ->
    #{
        id => 3,
        level => 61,
        exp => 100,
        reward_h => 33003,
        reward_l => 60061        
    };
get({62, 1}) ->
    #{
        id => 1,
        level => 62,
        exp => 30,
        reward_h => 33001,
        reward_l => 40062        
    };
get({62, 2}) ->
    #{
        id => 2,
        level => 62,
        exp => 60,
        reward_h => 33002,
        reward_l => 50062        
    };
get({62, 3}) ->
    #{
        id => 3,
        level => 62,
        exp => 100,
        reward_h => 33003,
        reward_l => 60062        
    };
get({63, 1}) ->
    #{
        id => 1,
        level => 63,
        exp => 30,
        reward_h => 33001,
        reward_l => 40063        
    };
get({63, 2}) ->
    #{
        id => 2,
        level => 63,
        exp => 60,
        reward_h => 33002,
        reward_l => 50063        
    };
get({63, 3}) ->
    #{
        id => 3,
        level => 63,
        exp => 100,
        reward_h => 33003,
        reward_l => 60063        
    };
get({64, 1}) ->
    #{
        id => 1,
        level => 64,
        exp => 30,
        reward_h => 33001,
        reward_l => 40064        
    };
get({64, 2}) ->
    #{
        id => 2,
        level => 64,
        exp => 60,
        reward_h => 33002,
        reward_l => 50064        
    };
get({64, 3}) ->
    #{
        id => 3,
        level => 64,
        exp => 100,
        reward_h => 33003,
        reward_l => 60064        
    };
get({65, 1}) ->
    #{
        id => 1,
        level => 65,
        exp => 30,
        reward_h => 33001,
        reward_l => 40065        
    };
get({65, 2}) ->
    #{
        id => 2,
        level => 65,
        exp => 60,
        reward_h => 33002,
        reward_l => 50065        
    };
get({65, 3}) ->
    #{
        id => 3,
        level => 65,
        exp => 100,
        reward_h => 33003,
        reward_l => 60065        
    };
get({66, 1}) ->
    #{
        id => 1,
        level => 66,
        exp => 30,
        reward_h => 33001,
        reward_l => 40066        
    };
get({66, 2}) ->
    #{
        id => 2,
        level => 66,
        exp => 60,
        reward_h => 33002,
        reward_l => 50066        
    };
get({66, 3}) ->
    #{
        id => 3,
        level => 66,
        exp => 100,
        reward_h => 33003,
        reward_l => 60066        
    };
get({67, 1}) ->
    #{
        id => 1,
        level => 67,
        exp => 30,
        reward_h => 33001,
        reward_l => 40067        
    };
get({67, 2}) ->
    #{
        id => 2,
        level => 67,
        exp => 60,
        reward_h => 33002,
        reward_l => 50067        
    };
get({67, 3}) ->
    #{
        id => 3,
        level => 67,
        exp => 100,
        reward_h => 33003,
        reward_l => 60067        
    };
get({68, 1}) ->
    #{
        id => 1,
        level => 68,
        exp => 30,
        reward_h => 33001,
        reward_l => 40068        
    };
get({68, 2}) ->
    #{
        id => 2,
        level => 68,
        exp => 60,
        reward_h => 33002,
        reward_l => 50068        
    };
get({68, 3}) ->
    #{
        id => 3,
        level => 68,
        exp => 100,
        reward_h => 33003,
        reward_l => 60068        
    };
get({69, 1}) ->
    #{
        id => 1,
        level => 69,
        exp => 30,
        reward_h => 33001,
        reward_l => 40069        
    };
get({69, 2}) ->
    #{
        id => 2,
        level => 69,
        exp => 60,
        reward_h => 33002,
        reward_l => 50069        
    };
get({69, 3}) ->
    #{
        id => 3,
        level => 69,
        exp => 100,
        reward_h => 33003,
        reward_l => 60069        
    };
get({70, 1}) ->
    #{
        id => 1,
        level => 70,
        exp => 30,
        reward_h => 33001,
        reward_l => 40070        
    };
get({70, 2}) ->
    #{
        id => 2,
        level => 70,
        exp => 60,
        reward_h => 33002,
        reward_l => 50070        
    };
get({70, 3}) ->
    #{
        id => 3,
        level => 70,
        exp => 100,
        reward_h => 33003,
        reward_l => 60070        
    };
get({71, 1}) ->
    #{
        id => 1,
        level => 71,
        exp => 30,
        reward_h => 33001,
        reward_l => 40071        
    };
get({71, 2}) ->
    #{
        id => 2,
        level => 71,
        exp => 60,
        reward_h => 33002,
        reward_l => 50071        
    };
get({71, 3}) ->
    #{
        id => 3,
        level => 71,
        exp => 100,
        reward_h => 33003,
        reward_l => 60071        
    };
get({72, 1}) ->
    #{
        id => 1,
        level => 72,
        exp => 30,
        reward_h => 33001,
        reward_l => 40072        
    };
get({72, 2}) ->
    #{
        id => 2,
        level => 72,
        exp => 60,
        reward_h => 33002,
        reward_l => 50072        
    };
get({72, 3}) ->
    #{
        id => 3,
        level => 72,
        exp => 100,
        reward_h => 33003,
        reward_l => 60072        
    };
get({73, 1}) ->
    #{
        id => 1,
        level => 73,
        exp => 30,
        reward_h => 33001,
        reward_l => 40073        
    };
get({73, 2}) ->
    #{
        id => 2,
        level => 73,
        exp => 60,
        reward_h => 33002,
        reward_l => 50073        
    };
get({73, 3}) ->
    #{
        id => 3,
        level => 73,
        exp => 100,
        reward_h => 33003,
        reward_l => 60073        
    };
get({74, 1}) ->
    #{
        id => 1,
        level => 74,
        exp => 30,
        reward_h => 33001,
        reward_l => 40074        
    };
get({74, 2}) ->
    #{
        id => 2,
        level => 74,
        exp => 60,
        reward_h => 33002,
        reward_l => 50074        
    };
get({74, 3}) ->
    #{
        id => 3,
        level => 74,
        exp => 100,
        reward_h => 33003,
        reward_l => 60074        
    };
get({75, 1}) ->
    #{
        id => 1,
        level => 75,
        exp => 30,
        reward_h => 33001,
        reward_l => 40075        
    };
get({75, 2}) ->
    #{
        id => 2,
        level => 75,
        exp => 60,
        reward_h => 33002,
        reward_l => 50075        
    };
get({75, 3}) ->
    #{
        id => 3,
        level => 75,
        exp => 100,
        reward_h => 33003,
        reward_l => 60075        
    };
get({76, 1}) ->
    #{
        id => 1,
        level => 76,
        exp => 30,
        reward_h => 33001,
        reward_l => 40076        
    };
get({76, 2}) ->
    #{
        id => 2,
        level => 76,
        exp => 60,
        reward_h => 33002,
        reward_l => 50076        
    };
get({76, 3}) ->
    #{
        id => 3,
        level => 76,
        exp => 100,
        reward_h => 33003,
        reward_l => 60076        
    };
get({77, 1}) ->
    #{
        id => 1,
        level => 77,
        exp => 30,
        reward_h => 33001,
        reward_l => 40077        
    };
get({77, 2}) ->
    #{
        id => 2,
        level => 77,
        exp => 60,
        reward_h => 33002,
        reward_l => 50077        
    };
get({77, 3}) ->
    #{
        id => 3,
        level => 77,
        exp => 100,
        reward_h => 33003,
        reward_l => 60077        
    };
get({78, 1}) ->
    #{
        id => 1,
        level => 78,
        exp => 30,
        reward_h => 33001,
        reward_l => 40078        
    };
get({78, 2}) ->
    #{
        id => 2,
        level => 78,
        exp => 60,
        reward_h => 33002,
        reward_l => 50078        
    };
get({78, 3}) ->
    #{
        id => 3,
        level => 78,
        exp => 100,
        reward_h => 33003,
        reward_l => 60078        
    };
get({79, 1}) ->
    #{
        id => 1,
        level => 79,
        exp => 30,
        reward_h => 33001,
        reward_l => 40079        
    };
get({79, 2}) ->
    #{
        id => 2,
        level => 79,
        exp => 60,
        reward_h => 33002,
        reward_l => 50079        
    };
get({79, 3}) ->
    #{
        id => 3,
        level => 79,
        exp => 100,
        reward_h => 33003,
        reward_l => 60079        
    };
get({80, 1}) ->
    #{
        id => 1,
        level => 80,
        exp => 30,
        reward_h => 33001,
        reward_l => 40080        
    };
get({80, 2}) ->
    #{
        id => 2,
        level => 80,
        exp => 60,
        reward_h => 33002,
        reward_l => 50080        
    };
get({80, 3}) ->
    #{
        id => 3,
        level => 80,
        exp => 100,
        reward_h => 33003,
        reward_l => 60080        
    };
get({81, 1}) ->
    #{
        id => 1,
        level => 81,
        exp => 30,
        reward_h => 33001,
        reward_l => 40081        
    };
get({81, 2}) ->
    #{
        id => 2,
        level => 81,
        exp => 60,
        reward_h => 33002,
        reward_l => 50081        
    };
get({81, 3}) ->
    #{
        id => 3,
        level => 81,
        exp => 100,
        reward_h => 33003,
        reward_l => 60081        
    };
get({82, 1}) ->
    #{
        id => 1,
        level => 82,
        exp => 30,
        reward_h => 33001,
        reward_l => 40082        
    };
get({82, 2}) ->
    #{
        id => 2,
        level => 82,
        exp => 60,
        reward_h => 33002,
        reward_l => 50082        
    };
get({82, 3}) ->
    #{
        id => 3,
        level => 82,
        exp => 100,
        reward_h => 33003,
        reward_l => 60082        
    };
get({83, 1}) ->
    #{
        id => 1,
        level => 83,
        exp => 30,
        reward_h => 33001,
        reward_l => 40083        
    };
get({83, 2}) ->
    #{
        id => 2,
        level => 83,
        exp => 60,
        reward_h => 33002,
        reward_l => 50083        
    };
get({83, 3}) ->
    #{
        id => 3,
        level => 83,
        exp => 100,
        reward_h => 33003,
        reward_l => 60083        
    };
get({84, 1}) ->
    #{
        id => 1,
        level => 84,
        exp => 30,
        reward_h => 33001,
        reward_l => 40084        
    };
get({84, 2}) ->
    #{
        id => 2,
        level => 84,
        exp => 60,
        reward_h => 33002,
        reward_l => 50084        
    };
get({84, 3}) ->
    #{
        id => 3,
        level => 84,
        exp => 100,
        reward_h => 33003,
        reward_l => 60084        
    };
get({85, 1}) ->
    #{
        id => 1,
        level => 85,
        exp => 30,
        reward_h => 33001,
        reward_l => 40085        
    };
get({85, 2}) ->
    #{
        id => 2,
        level => 85,
        exp => 60,
        reward_h => 33002,
        reward_l => 50085        
    };
get({85, 3}) ->
    #{
        id => 3,
        level => 85,
        exp => 100,
        reward_h => 33003,
        reward_l => 60085        
    };
get({86, 1}) ->
    #{
        id => 1,
        level => 86,
        exp => 30,
        reward_h => 33001,
        reward_l => 40086        
    };
get({86, 2}) ->
    #{
        id => 2,
        level => 86,
        exp => 60,
        reward_h => 33002,
        reward_l => 50086        
    };
get({86, 3}) ->
    #{
        id => 3,
        level => 86,
        exp => 100,
        reward_h => 33003,
        reward_l => 60086        
    };
get({87, 1}) ->
    #{
        id => 1,
        level => 87,
        exp => 30,
        reward_h => 33001,
        reward_l => 40087        
    };
get({87, 2}) ->
    #{
        id => 2,
        level => 87,
        exp => 60,
        reward_h => 33002,
        reward_l => 50087        
    };
get({87, 3}) ->
    #{
        id => 3,
        level => 87,
        exp => 100,
        reward_h => 33003,
        reward_l => 60087        
    };
get({88, 1}) ->
    #{
        id => 1,
        level => 88,
        exp => 30,
        reward_h => 33001,
        reward_l => 40088        
    };
get({88, 2}) ->
    #{
        id => 2,
        level => 88,
        exp => 60,
        reward_h => 33002,
        reward_l => 50088        
    };
get({88, 3}) ->
    #{
        id => 3,
        level => 88,
        exp => 100,
        reward_h => 33003,
        reward_l => 60088        
    };
get({89, 1}) ->
    #{
        id => 1,
        level => 89,
        exp => 30,
        reward_h => 33001,
        reward_l => 40089        
    };
get({89, 2}) ->
    #{
        id => 2,
        level => 89,
        exp => 60,
        reward_h => 33002,
        reward_l => 50089        
    };
get({89, 3}) ->
    #{
        id => 3,
        level => 89,
        exp => 100,
        reward_h => 33003,
        reward_l => 60089        
    };
get({90, 1}) ->
    #{
        id => 1,
        level => 90,
        exp => 30,
        reward_h => 33001,
        reward_l => 40090        
    };
get({90, 2}) ->
    #{
        id => 2,
        level => 90,
        exp => 60,
        reward_h => 33002,
        reward_l => 50090        
    };
get({90, 3}) ->
    #{
        id => 3,
        level => 90,
        exp => 100,
        reward_h => 33003,
        reward_l => 60090        
    };
get({91, 1}) ->
    #{
        id => 1,
        level => 91,
        exp => 30,
        reward_h => 33001,
        reward_l => 40091        
    };
get({91, 2}) ->
    #{
        id => 2,
        level => 91,
        exp => 60,
        reward_h => 33002,
        reward_l => 50091        
    };
get({91, 3}) ->
    #{
        id => 3,
        level => 91,
        exp => 100,
        reward_h => 33003,
        reward_l => 60091        
    };
get({92, 1}) ->
    #{
        id => 1,
        level => 92,
        exp => 30,
        reward_h => 33001,
        reward_l => 40092        
    };
get({92, 2}) ->
    #{
        id => 2,
        level => 92,
        exp => 60,
        reward_h => 33002,
        reward_l => 50092        
    };
get({92, 3}) ->
    #{
        id => 3,
        level => 92,
        exp => 100,
        reward_h => 33003,
        reward_l => 60092        
    };
get({93, 1}) ->
    #{
        id => 1,
        level => 93,
        exp => 30,
        reward_h => 33001,
        reward_l => 40093        
    };
get({93, 2}) ->
    #{
        id => 2,
        level => 93,
        exp => 60,
        reward_h => 33002,
        reward_l => 50093        
    };
get({93, 3}) ->
    #{
        id => 3,
        level => 93,
        exp => 100,
        reward_h => 33003,
        reward_l => 60093        
    };
get({94, 1}) ->
    #{
        id => 1,
        level => 94,
        exp => 30,
        reward_h => 33001,
        reward_l => 40094        
    };
get({94, 2}) ->
    #{
        id => 2,
        level => 94,
        exp => 60,
        reward_h => 33002,
        reward_l => 50094        
    };
get({94, 3}) ->
    #{
        id => 3,
        level => 94,
        exp => 100,
        reward_h => 33003,
        reward_l => 60094        
    };
get({95, 1}) ->
    #{
        id => 1,
        level => 95,
        exp => 30,
        reward_h => 33001,
        reward_l => 40095        
    };
get({95, 2}) ->
    #{
        id => 2,
        level => 95,
        exp => 60,
        reward_h => 33002,
        reward_l => 50095        
    };
get({95, 3}) ->
    #{
        id => 3,
        level => 95,
        exp => 100,
        reward_h => 33003,
        reward_l => 60095        
    };
get({96, 1}) ->
    #{
        id => 1,
        level => 96,
        exp => 30,
        reward_h => 33001,
        reward_l => 40096        
    };
get({96, 2}) ->
    #{
        id => 2,
        level => 96,
        exp => 60,
        reward_h => 33002,
        reward_l => 50096        
    };
get({96, 3}) ->
    #{
        id => 3,
        level => 96,
        exp => 100,
        reward_h => 33003,
        reward_l => 60096        
    };
get({97, 1}) ->
    #{
        id => 1,
        level => 97,
        exp => 30,
        reward_h => 33001,
        reward_l => 40097        
    };
get({97, 2}) ->
    #{
        id => 2,
        level => 97,
        exp => 60,
        reward_h => 33002,
        reward_l => 50097        
    };
get({97, 3}) ->
    #{
        id => 3,
        level => 97,
        exp => 100,
        reward_h => 33003,
        reward_l => 60097        
    };
get({98, 1}) ->
    #{
        id => 1,
        level => 98,
        exp => 30,
        reward_h => 33001,
        reward_l => 40098        
    };
get({98, 2}) ->
    #{
        id => 2,
        level => 98,
        exp => 60,
        reward_h => 33002,
        reward_l => 50098        
    };
get({98, 3}) ->
    #{
        id => 3,
        level => 98,
        exp => 100,
        reward_h => 33003,
        reward_l => 60098        
    };
get({99, 1}) ->
    #{
        id => 1,
        level => 99,
        exp => 30,
        reward_h => 33001,
        reward_l => 40099        
    };
get({99, 2}) ->
    #{
        id => 2,
        level => 99,
        exp => 60,
        reward_h => 33002,
        reward_l => 50099        
    };
get({99, 3}) ->
    #{
        id => 3,
        level => 99,
        exp => 100,
        reward_h => 33003,
        reward_l => 60099        
    };
get({100, 1}) ->
    #{
        id => 1,
        level => 100,
        exp => 30,
        reward_h => 33001,
        reward_l => 40100        
    };
get({100, 2}) ->
    #{
        id => 2,
        level => 100,
        exp => 60,
        reward_h => 33002,
        reward_l => 50100        
    };
get({100, 3}) ->
    #{
        id => 3,
        level => 100,
        exp => 100,
        reward_h => 33003,
        reward_l => 60100        
    };
get({101, 1}) ->
    #{
        id => 1,
        level => 101,
        exp => 30,
        reward_h => 33001,
        reward_l => 40101        
    };
get({101, 2}) ->
    #{
        id => 2,
        level => 101,
        exp => 60,
        reward_h => 33002,
        reward_l => 50101        
    };
get({101, 3}) ->
    #{
        id => 3,
        level => 101,
        exp => 100,
        reward_h => 33003,
        reward_l => 60101        
    };
get({102, 1}) ->
    #{
        id => 1,
        level => 102,
        exp => 30,
        reward_h => 33001,
        reward_l => 40102        
    };
get({102, 2}) ->
    #{
        id => 2,
        level => 102,
        exp => 60,
        reward_h => 33002,
        reward_l => 50102        
    };
get({102, 3}) ->
    #{
        id => 3,
        level => 102,
        exp => 100,
        reward_h => 33003,
        reward_l => 60102        
    };
get({103, 1}) ->
    #{
        id => 1,
        level => 103,
        exp => 30,
        reward_h => 33001,
        reward_l => 40103        
    };
get({103, 2}) ->
    #{
        id => 2,
        level => 103,
        exp => 60,
        reward_h => 33002,
        reward_l => 50103        
    };
get({103, 3}) ->
    #{
        id => 3,
        level => 103,
        exp => 100,
        reward_h => 33003,
        reward_l => 60103        
    };
get({104, 1}) ->
    #{
        id => 1,
        level => 104,
        exp => 30,
        reward_h => 33001,
        reward_l => 40104        
    };
get({104, 2}) ->
    #{
        id => 2,
        level => 104,
        exp => 60,
        reward_h => 33002,
        reward_l => 50104        
    };
get({104, 3}) ->
    #{
        id => 3,
        level => 104,
        exp => 100,
        reward_h => 33003,
        reward_l => 60104        
    };
get({105, 1}) ->
    #{
        id => 1,
        level => 105,
        exp => 30,
        reward_h => 33001,
        reward_l => 40105        
    };
get({105, 2}) ->
    #{
        id => 2,
        level => 105,
        exp => 60,
        reward_h => 33002,
        reward_l => 50105        
    };
get({105, 3}) ->
    #{
        id => 3,
        level => 105,
        exp => 100,
        reward_h => 33003,
        reward_l => 60105        
    };
get({106, 1}) ->
    #{
        id => 1,
        level => 106,
        exp => 30,
        reward_h => 33001,
        reward_l => 40106        
    };
get({106, 2}) ->
    #{
        id => 2,
        level => 106,
        exp => 60,
        reward_h => 33002,
        reward_l => 50106        
    };
get({106, 3}) ->
    #{
        id => 3,
        level => 106,
        exp => 100,
        reward_h => 33003,
        reward_l => 60106        
    };
get({107, 1}) ->
    #{
        id => 1,
        level => 107,
        exp => 30,
        reward_h => 33001,
        reward_l => 40107        
    };
get({107, 2}) ->
    #{
        id => 2,
        level => 107,
        exp => 60,
        reward_h => 33002,
        reward_l => 50107        
    };
get({107, 3}) ->
    #{
        id => 3,
        level => 107,
        exp => 100,
        reward_h => 33003,
        reward_l => 60107        
    };
get({108, 1}) ->
    #{
        id => 1,
        level => 108,
        exp => 30,
        reward_h => 33001,
        reward_l => 40108        
    };
get({108, 2}) ->
    #{
        id => 2,
        level => 108,
        exp => 60,
        reward_h => 33002,
        reward_l => 50108        
    };
get({108, 3}) ->
    #{
        id => 3,
        level => 108,
        exp => 100,
        reward_h => 33003,
        reward_l => 60108        
    };
get({109, 1}) ->
    #{
        id => 1,
        level => 109,
        exp => 30,
        reward_h => 33001,
        reward_l => 40109        
    };
get({109, 2}) ->
    #{
        id => 2,
        level => 109,
        exp => 60,
        reward_h => 33002,
        reward_l => 50109        
    };
get({109, 3}) ->
    #{
        id => 3,
        level => 109,
        exp => 100,
        reward_h => 33003,
        reward_l => 60109        
    };
get({110, 1}) ->
    #{
        id => 1,
        level => 110,
        exp => 30,
        reward_h => 33001,
        reward_l => 40110        
    };
get({110, 2}) ->
    #{
        id => 2,
        level => 110,
        exp => 60,
        reward_h => 33002,
        reward_l => 50110        
    };
get({110, 3}) ->
    #{
        id => 3,
        level => 110,
        exp => 100,
        reward_h => 33003,
        reward_l => 60110        
    };
get({111, 1}) ->
    #{
        id => 1,
        level => 111,
        exp => 30,
        reward_h => 33001,
        reward_l => 40111        
    };
get({111, 2}) ->
    #{
        id => 2,
        level => 111,
        exp => 60,
        reward_h => 33002,
        reward_l => 50111        
    };
get({111, 3}) ->
    #{
        id => 3,
        level => 111,
        exp => 100,
        reward_h => 33003,
        reward_l => 60111        
    };
get({112, 1}) ->
    #{
        id => 1,
        level => 112,
        exp => 30,
        reward_h => 33001,
        reward_l => 40112        
    };
get({112, 2}) ->
    #{
        id => 2,
        level => 112,
        exp => 60,
        reward_h => 33002,
        reward_l => 50112        
    };
get({112, 3}) ->
    #{
        id => 3,
        level => 112,
        exp => 100,
        reward_h => 33003,
        reward_l => 60112        
    };
get({113, 1}) ->
    #{
        id => 1,
        level => 113,
        exp => 30,
        reward_h => 33001,
        reward_l => 40113        
    };
get({113, 2}) ->
    #{
        id => 2,
        level => 113,
        exp => 60,
        reward_h => 33002,
        reward_l => 50113        
    };
get({113, 3}) ->
    #{
        id => 3,
        level => 113,
        exp => 100,
        reward_h => 33003,
        reward_l => 60113        
    };
get({114, 1}) ->
    #{
        id => 1,
        level => 114,
        exp => 30,
        reward_h => 33001,
        reward_l => 40114        
    };
get({114, 2}) ->
    #{
        id => 2,
        level => 114,
        exp => 60,
        reward_h => 33002,
        reward_l => 50114        
    };
get({114, 3}) ->
    #{
        id => 3,
        level => 114,
        exp => 100,
        reward_h => 33003,
        reward_l => 60114        
    };
get({115, 1}) ->
    #{
        id => 1,
        level => 115,
        exp => 30,
        reward_h => 33001,
        reward_l => 40115        
    };
get({115, 2}) ->
    #{
        id => 2,
        level => 115,
        exp => 60,
        reward_h => 33002,
        reward_l => 50115        
    };
get({115, 3}) ->
    #{
        id => 3,
        level => 115,
        exp => 100,
        reward_h => 33003,
        reward_l => 60115        
    };
get({116, 1}) ->
    #{
        id => 1,
        level => 116,
        exp => 30,
        reward_h => 33001,
        reward_l => 40116        
    };
get({116, 2}) ->
    #{
        id => 2,
        level => 116,
        exp => 60,
        reward_h => 33002,
        reward_l => 50116        
    };
get({116, 3}) ->
    #{
        id => 3,
        level => 116,
        exp => 100,
        reward_h => 33003,
        reward_l => 60116        
    };
get({117, 1}) ->
    #{
        id => 1,
        level => 117,
        exp => 30,
        reward_h => 33001,
        reward_l => 40117        
    };
get({117, 2}) ->
    #{
        id => 2,
        level => 117,
        exp => 60,
        reward_h => 33002,
        reward_l => 50117        
    };
get({117, 3}) ->
    #{
        id => 3,
        level => 117,
        exp => 100,
        reward_h => 33003,
        reward_l => 60117        
    };
get({118, 1}) ->
    #{
        id => 1,
        level => 118,
        exp => 30,
        reward_h => 33001,
        reward_l => 40118        
    };
get({118, 2}) ->
    #{
        id => 2,
        level => 118,
        exp => 60,
        reward_h => 33002,
        reward_l => 50118        
    };
get({118, 3}) ->
    #{
        id => 3,
        level => 118,
        exp => 100,
        reward_h => 33003,
        reward_l => 60118        
    };
get({119, 1}) ->
    #{
        id => 1,
        level => 119,
        exp => 30,
        reward_h => 33001,
        reward_l => 40119        
    };
get({119, 2}) ->
    #{
        id => 2,
        level => 119,
        exp => 60,
        reward_h => 33002,
        reward_l => 50119        
    };
get({119, 3}) ->
    #{
        id => 3,
        level => 119,
        exp => 100,
        reward_h => 33003,
        reward_l => 60119        
    };
get({120, 1}) ->
    #{
        id => 1,
        level => 120,
        exp => 30,
        reward_h => 33001,
        reward_l => 40120        
    };
get({120, 2}) ->
    #{
        id => 2,
        level => 120,
        exp => 60,
        reward_h => 33002,
        reward_l => 50120        
    };
get({120, 3}) ->
    #{
        id => 3,
        level => 120,
        exp => 100,
        reward_h => 33003,
        reward_l => 60120        
    };
get({121, 1}) ->
    #{
        id => 1,
        level => 121,
        exp => 30,
        reward_h => 33001,
        reward_l => 40121        
    };
get({121, 2}) ->
    #{
        id => 2,
        level => 121,
        exp => 60,
        reward_h => 33002,
        reward_l => 50121        
    };
get({121, 3}) ->
    #{
        id => 3,
        level => 121,
        exp => 100,
        reward_h => 33003,
        reward_l => 60121        
    };
get({122, 1}) ->
    #{
        id => 1,
        level => 122,
        exp => 30,
        reward_h => 33001,
        reward_l => 40122        
    };
get({122, 2}) ->
    #{
        id => 2,
        level => 122,
        exp => 60,
        reward_h => 33002,
        reward_l => 50122        
    };
get({122, 3}) ->
    #{
        id => 3,
        level => 122,
        exp => 100,
        reward_h => 33003,
        reward_l => 60122        
    };
get({123, 1}) ->
    #{
        id => 1,
        level => 123,
        exp => 30,
        reward_h => 33001,
        reward_l => 40123        
    };
get({123, 2}) ->
    #{
        id => 2,
        level => 123,
        exp => 60,
        reward_h => 33002,
        reward_l => 50123        
    };
get({123, 3}) ->
    #{
        id => 3,
        level => 123,
        exp => 100,
        reward_h => 33003,
        reward_l => 60123        
    };
get({124, 1}) ->
    #{
        id => 1,
        level => 124,
        exp => 30,
        reward_h => 33001,
        reward_l => 40124        
    };
get({124, 2}) ->
    #{
        id => 2,
        level => 124,
        exp => 60,
        reward_h => 33002,
        reward_l => 50124        
    };
get({124, 3}) ->
    #{
        id => 3,
        level => 124,
        exp => 100,
        reward_h => 33003,
        reward_l => 60124        
    };
get({125, 1}) ->
    #{
        id => 1,
        level => 125,
        exp => 30,
        reward_h => 33001,
        reward_l => 40125        
    };
get({125, 2}) ->
    #{
        id => 2,
        level => 125,
        exp => 60,
        reward_h => 33002,
        reward_l => 50125        
    };
get({125, 3}) ->
    #{
        id => 3,
        level => 125,
        exp => 100,
        reward_h => 33003,
        reward_l => 60125        
    };
get({126, 1}) ->
    #{
        id => 1,
        level => 126,
        exp => 30,
        reward_h => 33001,
        reward_l => 40126        
    };
get({126, 2}) ->
    #{
        id => 2,
        level => 126,
        exp => 60,
        reward_h => 33002,
        reward_l => 50126        
    };
get({126, 3}) ->
    #{
        id => 3,
        level => 126,
        exp => 100,
        reward_h => 33003,
        reward_l => 60126        
    };
get({127, 1}) ->
    #{
        id => 1,
        level => 127,
        exp => 30,
        reward_h => 33001,
        reward_l => 40127        
    };
get({127, 2}) ->
    #{
        id => 2,
        level => 127,
        exp => 60,
        reward_h => 33002,
        reward_l => 50127        
    };
get({127, 3}) ->
    #{
        id => 3,
        level => 127,
        exp => 100,
        reward_h => 33003,
        reward_l => 60127        
    };
get({128, 1}) ->
    #{
        id => 1,
        level => 128,
        exp => 30,
        reward_h => 33001,
        reward_l => 40128        
    };
get({128, 2}) ->
    #{
        id => 2,
        level => 128,
        exp => 60,
        reward_h => 33002,
        reward_l => 50128        
    };
get({128, 3}) ->
    #{
        id => 3,
        level => 128,
        exp => 100,
        reward_h => 33003,
        reward_l => 60128        
    };
get({129, 1}) ->
    #{
        id => 1,
        level => 129,
        exp => 30,
        reward_h => 33001,
        reward_l => 40129        
    };
get({129, 2}) ->
    #{
        id => 2,
        level => 129,
        exp => 60,
        reward_h => 33002,
        reward_l => 50129        
    };
get({129, 3}) ->
    #{
        id => 3,
        level => 129,
        exp => 100,
        reward_h => 33003,
        reward_l => 60129        
    };
get({130, 1}) ->
    #{
        id => 1,
        level => 130,
        exp => 30,
        reward_h => 33001,
        reward_l => 40130        
    };
get({130, 2}) ->
    #{
        id => 2,
        level => 130,
        exp => 60,
        reward_h => 33002,
        reward_l => 50130        
    };
get({130, 3}) ->
    #{
        id => 3,
        level => 130,
        exp => 100,
        reward_h => 33003,
        reward_l => 60130        
    };
get({131, 1}) ->
    #{
        id => 1,
        level => 131,
        exp => 30,
        reward_h => 33001,
        reward_l => 40131        
    };
get({131, 2}) ->
    #{
        id => 2,
        level => 131,
        exp => 60,
        reward_h => 33002,
        reward_l => 50131        
    };
get({131, 3}) ->
    #{
        id => 3,
        level => 131,
        exp => 100,
        reward_h => 33003,
        reward_l => 60131        
    };
get({132, 1}) ->
    #{
        id => 1,
        level => 132,
        exp => 30,
        reward_h => 33001,
        reward_l => 40132        
    };
get({132, 2}) ->
    #{
        id => 2,
        level => 132,
        exp => 60,
        reward_h => 33002,
        reward_l => 50132        
    };
get({132, 3}) ->
    #{
        id => 3,
        level => 132,
        exp => 100,
        reward_h => 33003,
        reward_l => 60132        
    };
get({133, 1}) ->
    #{
        id => 1,
        level => 133,
        exp => 30,
        reward_h => 33001,
        reward_l => 40133        
    };
get({133, 2}) ->
    #{
        id => 2,
        level => 133,
        exp => 60,
        reward_h => 33002,
        reward_l => 50133        
    };
get({133, 3}) ->
    #{
        id => 3,
        level => 133,
        exp => 100,
        reward_h => 33003,
        reward_l => 60133        
    };
get({134, 1}) ->
    #{
        id => 1,
        level => 134,
        exp => 30,
        reward_h => 33001,
        reward_l => 40134        
    };
get({134, 2}) ->
    #{
        id => 2,
        level => 134,
        exp => 60,
        reward_h => 33002,
        reward_l => 50134        
    };
get({134, 3}) ->
    #{
        id => 3,
        level => 134,
        exp => 100,
        reward_h => 33003,
        reward_l => 60134        
    };
get({135, 1}) ->
    #{
        id => 1,
        level => 135,
        exp => 30,
        reward_h => 33001,
        reward_l => 40135        
    };
get({135, 2}) ->
    #{
        id => 2,
        level => 135,
        exp => 60,
        reward_h => 33002,
        reward_l => 50135        
    };
get({135, 3}) ->
    #{
        id => 3,
        level => 135,
        exp => 100,
        reward_h => 33003,
        reward_l => 60135        
    };
get({136, 1}) ->
    #{
        id => 1,
        level => 136,
        exp => 30,
        reward_h => 33001,
        reward_l => 40136        
    };
get({136, 2}) ->
    #{
        id => 2,
        level => 136,
        exp => 60,
        reward_h => 33002,
        reward_l => 50136        
    };
get({136, 3}) ->
    #{
        id => 3,
        level => 136,
        exp => 100,
        reward_h => 33003,
        reward_l => 60136        
    };
get({137, 1}) ->
    #{
        id => 1,
        level => 137,
        exp => 30,
        reward_h => 33001,
        reward_l => 40137        
    };
get({137, 2}) ->
    #{
        id => 2,
        level => 137,
        exp => 60,
        reward_h => 33002,
        reward_l => 50137        
    };
get({137, 3}) ->
    #{
        id => 3,
        level => 137,
        exp => 100,
        reward_h => 33003,
        reward_l => 60137        
    };
get({138, 1}) ->
    #{
        id => 1,
        level => 138,
        exp => 30,
        reward_h => 33001,
        reward_l => 40138        
    };
get({138, 2}) ->
    #{
        id => 2,
        level => 138,
        exp => 60,
        reward_h => 33002,
        reward_l => 50138        
    };
get({138, 3}) ->
    #{
        id => 3,
        level => 138,
        exp => 100,
        reward_h => 33003,
        reward_l => 60138        
    };
get({139, 1}) ->
    #{
        id => 1,
        level => 139,
        exp => 30,
        reward_h => 33001,
        reward_l => 40139        
    };
get({139, 2}) ->
    #{
        id => 2,
        level => 139,
        exp => 60,
        reward_h => 33002,
        reward_l => 50139        
    };
get({139, 3}) ->
    #{
        id => 3,
        level => 139,
        exp => 100,
        reward_h => 33003,
        reward_l => 60139        
    };
get({140, 1}) ->
    #{
        id => 1,
        level => 140,
        exp => 30,
        reward_h => 33001,
        reward_l => 40140        
    };
get({140, 2}) ->
    #{
        id => 2,
        level => 140,
        exp => 60,
        reward_h => 33002,
        reward_l => 50140        
    };
get({140, 3}) ->
    #{
        id => 3,
        level => 140,
        exp => 100,
        reward_h => 33003,
        reward_l => 60140        
    };
get({141, 1}) ->
    #{
        id => 1,
        level => 141,
        exp => 30,
        reward_h => 33001,
        reward_l => 40141        
    };
get({141, 2}) ->
    #{
        id => 2,
        level => 141,
        exp => 60,
        reward_h => 33002,
        reward_l => 50141        
    };
get({141, 3}) ->
    #{
        id => 3,
        level => 141,
        exp => 100,
        reward_h => 33003,
        reward_l => 60141        
    };
get({142, 1}) ->
    #{
        id => 1,
        level => 142,
        exp => 30,
        reward_h => 33001,
        reward_l => 40142        
    };
get({142, 2}) ->
    #{
        id => 2,
        level => 142,
        exp => 60,
        reward_h => 33002,
        reward_l => 50142        
    };
get({142, 3}) ->
    #{
        id => 3,
        level => 142,
        exp => 100,
        reward_h => 33003,
        reward_l => 60142        
    };
get({143, 1}) ->
    #{
        id => 1,
        level => 143,
        exp => 30,
        reward_h => 33001,
        reward_l => 40143        
    };
get({143, 2}) ->
    #{
        id => 2,
        level => 143,
        exp => 60,
        reward_h => 33002,
        reward_l => 50143        
    };
get({143, 3}) ->
    #{
        id => 3,
        level => 143,
        exp => 100,
        reward_h => 33003,
        reward_l => 60143        
    };
get({144, 1}) ->
    #{
        id => 1,
        level => 144,
        exp => 30,
        reward_h => 33001,
        reward_l => 40144        
    };
get({144, 2}) ->
    #{
        id => 2,
        level => 144,
        exp => 60,
        reward_h => 33002,
        reward_l => 50144        
    };
get({144, 3}) ->
    #{
        id => 3,
        level => 144,
        exp => 100,
        reward_h => 33003,
        reward_l => 60144        
    };
get({145, 1}) ->
    #{
        id => 1,
        level => 145,
        exp => 30,
        reward_h => 33001,
        reward_l => 40145        
    };
get({145, 2}) ->
    #{
        id => 2,
        level => 145,
        exp => 60,
        reward_h => 33002,
        reward_l => 50145        
    };
get({145, 3}) ->
    #{
        id => 3,
        level => 145,
        exp => 100,
        reward_h => 33003,
        reward_l => 60145        
    };
get({146, 1}) ->
    #{
        id => 1,
        level => 146,
        exp => 30,
        reward_h => 33001,
        reward_l => 40146        
    };
get({146, 2}) ->
    #{
        id => 2,
        level => 146,
        exp => 60,
        reward_h => 33002,
        reward_l => 50146        
    };
get({146, 3}) ->
    #{
        id => 3,
        level => 146,
        exp => 100,
        reward_h => 33003,
        reward_l => 60146        
    };
get({147, 1}) ->
    #{
        id => 1,
        level => 147,
        exp => 30,
        reward_h => 33001,
        reward_l => 40147        
    };
get({147, 2}) ->
    #{
        id => 2,
        level => 147,
        exp => 60,
        reward_h => 33002,
        reward_l => 50147        
    };
get({147, 3}) ->
    #{
        id => 3,
        level => 147,
        exp => 100,
        reward_h => 33003,
        reward_l => 60147        
    };
get({148, 1}) ->
    #{
        id => 1,
        level => 148,
        exp => 30,
        reward_h => 33001,
        reward_l => 40148        
    };
get({148, 2}) ->
    #{
        id => 2,
        level => 148,
        exp => 60,
        reward_h => 33002,
        reward_l => 50148        
    };
get({148, 3}) ->
    #{
        id => 3,
        level => 148,
        exp => 100,
        reward_h => 33003,
        reward_l => 60148        
    };
get({149, 1}) ->
    #{
        id => 1,
        level => 149,
        exp => 30,
        reward_h => 33001,
        reward_l => 40149        
    };
get({149, 2}) ->
    #{
        id => 2,
        level => 149,
        exp => 60,
        reward_h => 33002,
        reward_l => 50149        
    };
get({149, 3}) ->
    #{
        id => 3,
        level => 149,
        exp => 100,
        reward_h => 33003,
        reward_l => 60149        
    };
get({150, 1}) ->
    #{
        id => 1,
        level => 150,
        exp => 30,
        reward_h => 33001,
        reward_l => 40150        
    };
get({150, 2}) ->
    #{
        id => 2,
        level => 150,
        exp => 60,
        reward_h => 33002,
        reward_l => 50150        
    };
get({150, 3}) ->
    #{
        id => 3,
        level => 150,
        exp => 100,
        reward_h => 33003,
        reward_l => 60150        
    };
get({151, 1}) ->
    #{
        id => 1,
        level => 151,
        exp => 30,
        reward_h => 33001,
        reward_l => 40151        
    };
get({151, 2}) ->
    #{
        id => 2,
        level => 151,
        exp => 60,
        reward_h => 33002,
        reward_l => 50151        
    };
get({151, 3}) ->
    #{
        id => 3,
        level => 151,
        exp => 100,
        reward_h => 33003,
        reward_l => 60151        
    };
get({152, 1}) ->
    #{
        id => 1,
        level => 152,
        exp => 30,
        reward_h => 33001,
        reward_l => 40152        
    };
get({152, 2}) ->
    #{
        id => 2,
        level => 152,
        exp => 60,
        reward_h => 33002,
        reward_l => 50152        
    };
get({152, 3}) ->
    #{
        id => 3,
        level => 152,
        exp => 100,
        reward_h => 33003,
        reward_l => 60152        
    };
get({153, 1}) ->
    #{
        id => 1,
        level => 153,
        exp => 30,
        reward_h => 33001,
        reward_l => 40153        
    };
get({153, 2}) ->
    #{
        id => 2,
        level => 153,
        exp => 60,
        reward_h => 33002,
        reward_l => 50153        
    };
get({153, 3}) ->
    #{
        id => 3,
        level => 153,
        exp => 100,
        reward_h => 33003,
        reward_l => 60153        
    };
get({154, 1}) ->
    #{
        id => 1,
        level => 154,
        exp => 30,
        reward_h => 33001,
        reward_l => 40154        
    };
get({154, 2}) ->
    #{
        id => 2,
        level => 154,
        exp => 60,
        reward_h => 33002,
        reward_l => 50154        
    };
get({154, 3}) ->
    #{
        id => 3,
        level => 154,
        exp => 100,
        reward_h => 33003,
        reward_l => 60154        
    };
get({155, 1}) ->
    #{
        id => 1,
        level => 155,
        exp => 30,
        reward_h => 33001,
        reward_l => 40155        
    };
get({155, 2}) ->
    #{
        id => 2,
        level => 155,
        exp => 60,
        reward_h => 33002,
        reward_l => 50155        
    };
get({155, 3}) ->
    #{
        id => 3,
        level => 155,
        exp => 100,
        reward_h => 33003,
        reward_l => 60155        
    };
get({156, 1}) ->
    #{
        id => 1,
        level => 156,
        exp => 30,
        reward_h => 33001,
        reward_l => 40156        
    };
get({156, 2}) ->
    #{
        id => 2,
        level => 156,
        exp => 60,
        reward_h => 33002,
        reward_l => 50156        
    };
get({156, 3}) ->
    #{
        id => 3,
        level => 156,
        exp => 100,
        reward_h => 33003,
        reward_l => 60156        
    };
get({157, 1}) ->
    #{
        id => 1,
        level => 157,
        exp => 30,
        reward_h => 33001,
        reward_l => 40157        
    };
get({157, 2}) ->
    #{
        id => 2,
        level => 157,
        exp => 60,
        reward_h => 33002,
        reward_l => 50157        
    };
get({157, 3}) ->
    #{
        id => 3,
        level => 157,
        exp => 100,
        reward_h => 33003,
        reward_l => 60157        
    };
get({158, 1}) ->
    #{
        id => 1,
        level => 158,
        exp => 30,
        reward_h => 33001,
        reward_l => 40158        
    };
get({158, 2}) ->
    #{
        id => 2,
        level => 158,
        exp => 60,
        reward_h => 33002,
        reward_l => 50158        
    };
get({158, 3}) ->
    #{
        id => 3,
        level => 158,
        exp => 100,
        reward_h => 33003,
        reward_l => 60158        
    };
get({159, 1}) ->
    #{
        id => 1,
        level => 159,
        exp => 30,
        reward_h => 33001,
        reward_l => 40159        
    };
get({159, 2}) ->
    #{
        id => 2,
        level => 159,
        exp => 60,
        reward_h => 33002,
        reward_l => 50159        
    };
get({159, 3}) ->
    #{
        id => 3,
        level => 159,
        exp => 100,
        reward_h => 33003,
        reward_l => 60159        
    };
get({160, 1}) ->
    #{
        id => 1,
        level => 160,
        exp => 30,
        reward_h => 33001,
        reward_l => 40160        
    };
get({160, 2}) ->
    #{
        id => 2,
        level => 160,
        exp => 60,
        reward_h => 33002,
        reward_l => 50160        
    };
get({160, 3}) ->
    #{
        id => 3,
        level => 160,
        exp => 100,
        reward_h => 33003,
        reward_l => 60160        
    };
get({161, 1}) ->
    #{
        id => 1,
        level => 161,
        exp => 30,
        reward_h => 33001,
        reward_l => 40161        
    };
get({161, 2}) ->
    #{
        id => 2,
        level => 161,
        exp => 60,
        reward_h => 33002,
        reward_l => 50161        
    };
get({161, 3}) ->
    #{
        id => 3,
        level => 161,
        exp => 100,
        reward_h => 33003,
        reward_l => 60161        
    };
get({162, 1}) ->
    #{
        id => 1,
        level => 162,
        exp => 30,
        reward_h => 33001,
        reward_l => 40162        
    };
get({162, 2}) ->
    #{
        id => 2,
        level => 162,
        exp => 60,
        reward_h => 33002,
        reward_l => 50162        
    };
get({162, 3}) ->
    #{
        id => 3,
        level => 162,
        exp => 100,
        reward_h => 33003,
        reward_l => 60162        
    };
get({163, 1}) ->
    #{
        id => 1,
        level => 163,
        exp => 30,
        reward_h => 33001,
        reward_l => 40163        
    };
get({163, 2}) ->
    #{
        id => 2,
        level => 163,
        exp => 60,
        reward_h => 33002,
        reward_l => 50163        
    };
get({163, 3}) ->
    #{
        id => 3,
        level => 163,
        exp => 100,
        reward_h => 33003,
        reward_l => 60163        
    };
get({164, 1}) ->
    #{
        id => 1,
        level => 164,
        exp => 30,
        reward_h => 33001,
        reward_l => 40164        
    };
get({164, 2}) ->
    #{
        id => 2,
        level => 164,
        exp => 60,
        reward_h => 33002,
        reward_l => 50164        
    };
get({164, 3}) ->
    #{
        id => 3,
        level => 164,
        exp => 100,
        reward_h => 33003,
        reward_l => 60164        
    };
get({165, 1}) ->
    #{
        id => 1,
        level => 165,
        exp => 30,
        reward_h => 33001,
        reward_l => 40165        
    };
get({165, 2}) ->
    #{
        id => 2,
        level => 165,
        exp => 60,
        reward_h => 33002,
        reward_l => 50165        
    };
get({165, 3}) ->
    #{
        id => 3,
        level => 165,
        exp => 100,
        reward_h => 33003,
        reward_l => 60165        
    };
get({166, 1}) ->
    #{
        id => 1,
        level => 166,
        exp => 30,
        reward_h => 33001,
        reward_l => 40166        
    };
get({166, 2}) ->
    #{
        id => 2,
        level => 166,
        exp => 60,
        reward_h => 33002,
        reward_l => 50166        
    };
get({166, 3}) ->
    #{
        id => 3,
        level => 166,
        exp => 100,
        reward_h => 33003,
        reward_l => 60166        
    };
get({167, 1}) ->
    #{
        id => 1,
        level => 167,
        exp => 30,
        reward_h => 33001,
        reward_l => 40167        
    };
get({167, 2}) ->
    #{
        id => 2,
        level => 167,
        exp => 60,
        reward_h => 33002,
        reward_l => 50167        
    };
get({167, 3}) ->
    #{
        id => 3,
        level => 167,
        exp => 100,
        reward_h => 33003,
        reward_l => 60167        
    };
get({168, 1}) ->
    #{
        id => 1,
        level => 168,
        exp => 30,
        reward_h => 33001,
        reward_l => 40168        
    };
get({168, 2}) ->
    #{
        id => 2,
        level => 168,
        exp => 60,
        reward_h => 33002,
        reward_l => 50168        
    };
get({168, 3}) ->
    #{
        id => 3,
        level => 168,
        exp => 100,
        reward_h => 33003,
        reward_l => 60168        
    };
get({169, 1}) ->
    #{
        id => 1,
        level => 169,
        exp => 30,
        reward_h => 33001,
        reward_l => 40169        
    };
get({169, 2}) ->
    #{
        id => 2,
        level => 169,
        exp => 60,
        reward_h => 33002,
        reward_l => 50169        
    };
get({169, 3}) ->
    #{
        id => 3,
        level => 169,
        exp => 100,
        reward_h => 33003,
        reward_l => 60169        
    };
get({170, 1}) ->
    #{
        id => 1,
        level => 170,
        exp => 30,
        reward_h => 33001,
        reward_l => 40170        
    };
get({170, 2}) ->
    #{
        id => 2,
        level => 170,
        exp => 60,
        reward_h => 33002,
        reward_l => 50170        
    };
get({170, 3}) ->
    #{
        id => 3,
        level => 170,
        exp => 100,
        reward_h => 33003,
        reward_l => 60170        
    };
get({171, 1}) ->
    #{
        id => 1,
        level => 171,
        exp => 30,
        reward_h => 33001,
        reward_l => 40171        
    };
get({171, 2}) ->
    #{
        id => 2,
        level => 171,
        exp => 60,
        reward_h => 33002,
        reward_l => 50171        
    };
get({171, 3}) ->
    #{
        id => 3,
        level => 171,
        exp => 100,
        reward_h => 33003,
        reward_l => 60171        
    };
get({172, 1}) ->
    #{
        id => 1,
        level => 172,
        exp => 30,
        reward_h => 33001,
        reward_l => 40172        
    };
get({172, 2}) ->
    #{
        id => 2,
        level => 172,
        exp => 60,
        reward_h => 33002,
        reward_l => 50172        
    };
get({172, 3}) ->
    #{
        id => 3,
        level => 172,
        exp => 100,
        reward_h => 33003,
        reward_l => 60172        
    };
get({173, 1}) ->
    #{
        id => 1,
        level => 173,
        exp => 30,
        reward_h => 33001,
        reward_l => 40173        
    };
get({173, 2}) ->
    #{
        id => 2,
        level => 173,
        exp => 60,
        reward_h => 33002,
        reward_l => 50173        
    };
get({173, 3}) ->
    #{
        id => 3,
        level => 173,
        exp => 100,
        reward_h => 33003,
        reward_l => 60173        
    };
get({174, 1}) ->
    #{
        id => 1,
        level => 174,
        exp => 30,
        reward_h => 33001,
        reward_l => 40174        
    };
get({174, 2}) ->
    #{
        id => 2,
        level => 174,
        exp => 60,
        reward_h => 33002,
        reward_l => 50174        
    };
get({174, 3}) ->
    #{
        id => 3,
        level => 174,
        exp => 100,
        reward_h => 33003,
        reward_l => 60174        
    };
get({175, 1}) ->
    #{
        id => 1,
        level => 175,
        exp => 30,
        reward_h => 33001,
        reward_l => 40175        
    };
get({175, 2}) ->
    #{
        id => 2,
        level => 175,
        exp => 60,
        reward_h => 33002,
        reward_l => 50175        
    };
get({175, 3}) ->
    #{
        id => 3,
        level => 175,
        exp => 100,
        reward_h => 33003,
        reward_l => 60175        
    };
get({176, 1}) ->
    #{
        id => 1,
        level => 176,
        exp => 30,
        reward_h => 33001,
        reward_l => 40176        
    };
get({176, 2}) ->
    #{
        id => 2,
        level => 176,
        exp => 60,
        reward_h => 33002,
        reward_l => 50176        
    };
get({176, 3}) ->
    #{
        id => 3,
        level => 176,
        exp => 100,
        reward_h => 33003,
        reward_l => 60176        
    };
get({177, 1}) ->
    #{
        id => 1,
        level => 177,
        exp => 30,
        reward_h => 33001,
        reward_l => 40177        
    };
get({177, 2}) ->
    #{
        id => 2,
        level => 177,
        exp => 60,
        reward_h => 33002,
        reward_l => 50177        
    };
get({177, 3}) ->
    #{
        id => 3,
        level => 177,
        exp => 100,
        reward_h => 33003,
        reward_l => 60177        
    };
get({178, 1}) ->
    #{
        id => 1,
        level => 178,
        exp => 30,
        reward_h => 33001,
        reward_l => 40178        
    };
get({178, 2}) ->
    #{
        id => 2,
        level => 178,
        exp => 60,
        reward_h => 33002,
        reward_l => 50178        
    };
get({178, 3}) ->
    #{
        id => 3,
        level => 178,
        exp => 100,
        reward_h => 33003,
        reward_l => 60178        
    };
get({179, 1}) ->
    #{
        id => 1,
        level => 179,
        exp => 30,
        reward_h => 33001,
        reward_l => 40179        
    };
get({179, 2}) ->
    #{
        id => 2,
        level => 179,
        exp => 60,
        reward_h => 33002,
        reward_l => 50179        
    };
get({179, 3}) ->
    #{
        id => 3,
        level => 179,
        exp => 100,
        reward_h => 33003,
        reward_l => 60179        
    };
get({180, 1}) ->
    #{
        id => 1,
        level => 180,
        exp => 30,
        reward_h => 33001,
        reward_l => 40180        
    };
get({180, 2}) ->
    #{
        id => 2,
        level => 180,
        exp => 60,
        reward_h => 33002,
        reward_l => 50180        
    };
get({180, 3}) ->
    #{
        id => 3,
        level => 180,
        exp => 100,
        reward_h => 33003,
        reward_l => 60180        
    };
get({181, 1}) ->
    #{
        id => 1,
        level => 181,
        exp => 30,
        reward_h => 33001,
        reward_l => 40181        
    };
get({181, 2}) ->
    #{
        id => 2,
        level => 181,
        exp => 60,
        reward_h => 33002,
        reward_l => 50181        
    };
get({181, 3}) ->
    #{
        id => 3,
        level => 181,
        exp => 100,
        reward_h => 33003,
        reward_l => 60181        
    };
get({182, 1}) ->
    #{
        id => 1,
        level => 182,
        exp => 30,
        reward_h => 33001,
        reward_l => 40182        
    };
get({182, 2}) ->
    #{
        id => 2,
        level => 182,
        exp => 60,
        reward_h => 33002,
        reward_l => 50182        
    };
get({182, 3}) ->
    #{
        id => 3,
        level => 182,
        exp => 100,
        reward_h => 33003,
        reward_l => 60182        
    };
get({183, 1}) ->
    #{
        id => 1,
        level => 183,
        exp => 30,
        reward_h => 33001,
        reward_l => 40183        
    };
get({183, 2}) ->
    #{
        id => 2,
        level => 183,
        exp => 60,
        reward_h => 33002,
        reward_l => 50183        
    };
get({183, 3}) ->
    #{
        id => 3,
        level => 183,
        exp => 100,
        reward_h => 33003,
        reward_l => 60183        
    };
get({184, 1}) ->
    #{
        id => 1,
        level => 184,
        exp => 30,
        reward_h => 33001,
        reward_l => 40184        
    };
get({184, 2}) ->
    #{
        id => 2,
        level => 184,
        exp => 60,
        reward_h => 33002,
        reward_l => 50184        
    };
get({184, 3}) ->
    #{
        id => 3,
        level => 184,
        exp => 100,
        reward_h => 33003,
        reward_l => 60184        
    };
get({185, 1}) ->
    #{
        id => 1,
        level => 185,
        exp => 30,
        reward_h => 33001,
        reward_l => 40185        
    };
get({185, 2}) ->
    #{
        id => 2,
        level => 185,
        exp => 60,
        reward_h => 33002,
        reward_l => 50185        
    };
get({185, 3}) ->
    #{
        id => 3,
        level => 185,
        exp => 100,
        reward_h => 33003,
        reward_l => 60185        
    };
get({186, 1}) ->
    #{
        id => 1,
        level => 186,
        exp => 30,
        reward_h => 33001,
        reward_l => 40186        
    };
get({186, 2}) ->
    #{
        id => 2,
        level => 186,
        exp => 60,
        reward_h => 33002,
        reward_l => 50186        
    };
get({186, 3}) ->
    #{
        id => 3,
        level => 186,
        exp => 100,
        reward_h => 33003,
        reward_l => 60186        
    };
get({187, 1}) ->
    #{
        id => 1,
        level => 187,
        exp => 30,
        reward_h => 33001,
        reward_l => 40187        
    };
get({187, 2}) ->
    #{
        id => 2,
        level => 187,
        exp => 60,
        reward_h => 33002,
        reward_l => 50187        
    };
get({187, 3}) ->
    #{
        id => 3,
        level => 187,
        exp => 100,
        reward_h => 33003,
        reward_l => 60187        
    };
get({188, 1}) ->
    #{
        id => 1,
        level => 188,
        exp => 30,
        reward_h => 33001,
        reward_l => 40188        
    };
get({188, 2}) ->
    #{
        id => 2,
        level => 188,
        exp => 60,
        reward_h => 33002,
        reward_l => 50188        
    };
get({188, 3}) ->
    #{
        id => 3,
        level => 188,
        exp => 100,
        reward_h => 33003,
        reward_l => 60188        
    };
get({189, 1}) ->
    #{
        id => 1,
        level => 189,
        exp => 30,
        reward_h => 33001,
        reward_l => 40189        
    };
get({189, 2}) ->
    #{
        id => 2,
        level => 189,
        exp => 60,
        reward_h => 33002,
        reward_l => 50189        
    };
get({189, 3}) ->
    #{
        id => 3,
        level => 189,
        exp => 100,
        reward_h => 33003,
        reward_l => 60189        
    };
get({190, 1}) ->
    #{
        id => 1,
        level => 190,
        exp => 30,
        reward_h => 33001,
        reward_l => 40190        
    };
get({190, 2}) ->
    #{
        id => 2,
        level => 190,
        exp => 60,
        reward_h => 33002,
        reward_l => 50190        
    };
get({190, 3}) ->
    #{
        id => 3,
        level => 190,
        exp => 100,
        reward_h => 33003,
        reward_l => 60190        
    };
get({191, 1}) ->
    #{
        id => 1,
        level => 191,
        exp => 30,
        reward_h => 33001,
        reward_l => 40191        
    };
get({191, 2}) ->
    #{
        id => 2,
        level => 191,
        exp => 60,
        reward_h => 33002,
        reward_l => 50191        
    };
get({191, 3}) ->
    #{
        id => 3,
        level => 191,
        exp => 100,
        reward_h => 33003,
        reward_l => 60191        
    };
get({192, 1}) ->
    #{
        id => 1,
        level => 192,
        exp => 30,
        reward_h => 33001,
        reward_l => 40192        
    };
get({192, 2}) ->
    #{
        id => 2,
        level => 192,
        exp => 60,
        reward_h => 33002,
        reward_l => 50192        
    };
get({192, 3}) ->
    #{
        id => 3,
        level => 192,
        exp => 100,
        reward_h => 33003,
        reward_l => 60192        
    };
get({193, 1}) ->
    #{
        id => 1,
        level => 193,
        exp => 30,
        reward_h => 33001,
        reward_l => 40193        
    };
get({193, 2}) ->
    #{
        id => 2,
        level => 193,
        exp => 60,
        reward_h => 33002,
        reward_l => 50193        
    };
get({193, 3}) ->
    #{
        id => 3,
        level => 193,
        exp => 100,
        reward_h => 33003,
        reward_l => 60193        
    };
get({194, 1}) ->
    #{
        id => 1,
        level => 194,
        exp => 30,
        reward_h => 33001,
        reward_l => 40194        
    };
get({194, 2}) ->
    #{
        id => 2,
        level => 194,
        exp => 60,
        reward_h => 33002,
        reward_l => 50194        
    };
get({194, 3}) ->
    #{
        id => 3,
        level => 194,
        exp => 100,
        reward_h => 33003,
        reward_l => 60194        
    };
get({195, 1}) ->
    #{
        id => 1,
        level => 195,
        exp => 30,
        reward_h => 33001,
        reward_l => 40195        
    };
get({195, 2}) ->
    #{
        id => 2,
        level => 195,
        exp => 60,
        reward_h => 33002,
        reward_l => 50195        
    };
get({195, 3}) ->
    #{
        id => 3,
        level => 195,
        exp => 100,
        reward_h => 33003,
        reward_l => 60195        
    };
get({196, 1}) ->
    #{
        id => 1,
        level => 196,
        exp => 30,
        reward_h => 33001,
        reward_l => 40196        
    };
get({196, 2}) ->
    #{
        id => 2,
        level => 196,
        exp => 60,
        reward_h => 33002,
        reward_l => 50196        
    };
get({196, 3}) ->
    #{
        id => 3,
        level => 196,
        exp => 100,
        reward_h => 33003,
        reward_l => 60196        
    };
get({197, 1}) ->
    #{
        id => 1,
        level => 197,
        exp => 30,
        reward_h => 33001,
        reward_l => 40197        
    };
get({197, 2}) ->
    #{
        id => 2,
        level => 197,
        exp => 60,
        reward_h => 33002,
        reward_l => 50197        
    };
get({197, 3}) ->
    #{
        id => 3,
        level => 197,
        exp => 100,
        reward_h => 33003,
        reward_l => 60197        
    };
get({198, 1}) ->
    #{
        id => 1,
        level => 198,
        exp => 30,
        reward_h => 33001,
        reward_l => 40198        
    };
get({198, 2}) ->
    #{
        id => 2,
        level => 198,
        exp => 60,
        reward_h => 33002,
        reward_l => 50198        
    };
get({198, 3}) ->
    #{
        id => 3,
        level => 198,
        exp => 100,
        reward_h => 33003,
        reward_l => 60198        
    };
get({199, 1}) ->
    #{
        id => 1,
        level => 199,
        exp => 30,
        reward_h => 33001,
        reward_l => 40199        
    };
get({199, 2}) ->
    #{
        id => 2,
        level => 199,
        exp => 60,
        reward_h => 33002,
        reward_l => 50199        
    };
get({199, 3}) ->
    #{
        id => 3,
        level => 199,
        exp => 100,
        reward_h => 33003,
        reward_l => 60199        
    };
get({200, 1}) ->
    #{
        id => 1,
        level => 200,
        exp => 30,
        reward_h => 33001,
        reward_l => 40200        
    };
get({200, 2}) ->
    #{
        id => 2,
        level => 200,
        exp => 60,
        reward_h => 33002,
        reward_l => 50200        
    };
get({200, 3}) ->
    #{
        id => 3,
        level => 200,
        exp => 100,
        reward_h => 33003,
        reward_l => 60200        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3].

get_by_lv(1) ->
    [1, 2, 3];
get_by_lv(2) ->
    [1, 2, 3];
get_by_lv(3) ->
    [1, 2, 3];
get_by_lv(4) ->
    [1, 2, 3];
get_by_lv(5) ->
    [1, 2, 3];
get_by_lv(6) ->
    [1, 2, 3];
get_by_lv(7) ->
    [1, 2, 3];
get_by_lv(8) ->
    [1, 2, 3];
get_by_lv(9) ->
    [1, 2, 3];
get_by_lv(10) ->
    [1, 2, 3];
get_by_lv(11) ->
    [1, 2, 3];
get_by_lv(12) ->
    [1, 2, 3];
get_by_lv(13) ->
    [1, 2, 3];
get_by_lv(14) ->
    [1, 2, 3];
get_by_lv(15) ->
    [1, 2, 3];
get_by_lv(16) ->
    [1, 2, 3];
get_by_lv(17) ->
    [1, 2, 3];
get_by_lv(18) ->
    [1, 2, 3];
get_by_lv(19) ->
    [1, 2, 3];
get_by_lv(20) ->
    [1, 2, 3];
get_by_lv(21) ->
    [1, 2, 3];
get_by_lv(22) ->
    [1, 2, 3];
get_by_lv(23) ->
    [1, 2, 3];
get_by_lv(24) ->
    [1, 2, 3];
get_by_lv(25) ->
    [1, 2, 3];
get_by_lv(26) ->
    [1, 2, 3];
get_by_lv(27) ->
    [1, 2, 3];
get_by_lv(28) ->
    [1, 2, 3];
get_by_lv(29) ->
    [1, 2, 3];
get_by_lv(30) ->
    [1, 2, 3];
get_by_lv(31) ->
    [1, 2, 3];
get_by_lv(32) ->
    [1, 2, 3];
get_by_lv(33) ->
    [1, 2, 3];
get_by_lv(34) ->
    [1, 2, 3];
get_by_lv(35) ->
    [1, 2, 3];
get_by_lv(36) ->
    [1, 2, 3];
get_by_lv(37) ->
    [1, 2, 3];
get_by_lv(38) ->
    [1, 2, 3];
get_by_lv(39) ->
    [1, 2, 3];
get_by_lv(40) ->
    [1, 2, 3];
get_by_lv(41) ->
    [1, 2, 3];
get_by_lv(42) ->
    [1, 2, 3];
get_by_lv(43) ->
    [1, 2, 3];
get_by_lv(44) ->
    [1, 2, 3];
get_by_lv(45) ->
    [1, 2, 3];
get_by_lv(46) ->
    [1, 2, 3];
get_by_lv(47) ->
    [1, 2, 3];
get_by_lv(48) ->
    [1, 2, 3];
get_by_lv(49) ->
    [1, 2, 3];
get_by_lv(50) ->
    [1, 2, 3];
get_by_lv(51) ->
    [1, 2, 3];
get_by_lv(52) ->
    [1, 2, 3];
get_by_lv(53) ->
    [1, 2, 3];
get_by_lv(54) ->
    [1, 2, 3];
get_by_lv(55) ->
    [1, 2, 3];
get_by_lv(56) ->
    [1, 2, 3];
get_by_lv(57) ->
    [1, 2, 3];
get_by_lv(58) ->
    [1, 2, 3];
get_by_lv(59) ->
    [1, 2, 3];
get_by_lv(60) ->
    [1, 2, 3];
get_by_lv(61) ->
    [1, 2, 3];
get_by_lv(62) ->
    [1, 2, 3];
get_by_lv(63) ->
    [1, 2, 3];
get_by_lv(64) ->
    [1, 2, 3];
get_by_lv(65) ->
    [1, 2, 3];
get_by_lv(66) ->
    [1, 2, 3];
get_by_lv(67) ->
    [1, 2, 3];
get_by_lv(68) ->
    [1, 2, 3];
get_by_lv(69) ->
    [1, 2, 3];
get_by_lv(70) ->
    [1, 2, 3];
get_by_lv(71) ->
    [1, 2, 3];
get_by_lv(72) ->
    [1, 2, 3];
get_by_lv(73) ->
    [1, 2, 3];
get_by_lv(74) ->
    [1, 2, 3];
get_by_lv(75) ->
    [1, 2, 3];
get_by_lv(76) ->
    [1, 2, 3];
get_by_lv(77) ->
    [1, 2, 3];
get_by_lv(78) ->
    [1, 2, 3];
get_by_lv(79) ->
    [1, 2, 3];
get_by_lv(80) ->
    [1, 2, 3];
get_by_lv(81) ->
    [1, 2, 3];
get_by_lv(82) ->
    [1, 2, 3];
get_by_lv(83) ->
    [1, 2, 3];
get_by_lv(84) ->
    [1, 2, 3];
get_by_lv(85) ->
    [1, 2, 3];
get_by_lv(86) ->
    [1, 2, 3];
get_by_lv(87) ->
    [1, 2, 3];
get_by_lv(88) ->
    [1, 2, 3];
get_by_lv(89) ->
    [1, 2, 3];
get_by_lv(90) ->
    [1, 2, 3];
get_by_lv(91) ->
    [1, 2, 3];
get_by_lv(92) ->
    [1, 2, 3];
get_by_lv(93) ->
    [1, 2, 3];
get_by_lv(94) ->
    [1, 2, 3];
get_by_lv(95) ->
    [1, 2, 3];
get_by_lv(96) ->
    [1, 2, 3];
get_by_lv(97) ->
    [1, 2, 3];
get_by_lv(98) ->
    [1, 2, 3];
get_by_lv(99) ->
    [1, 2, 3];
get_by_lv(100) ->
    [1, 2, 3];
get_by_lv(101) ->
    [1, 2, 3];
get_by_lv(102) ->
    [1, 2, 3];
get_by_lv(103) ->
    [1, 2, 3];
get_by_lv(104) ->
    [1, 2, 3];
get_by_lv(105) ->
    [1, 2, 3];
get_by_lv(106) ->
    [1, 2, 3];
get_by_lv(107) ->
    [1, 2, 3];
get_by_lv(108) ->
    [1, 2, 3];
get_by_lv(109) ->
    [1, 2, 3];
get_by_lv(110) ->
    [1, 2, 3];
get_by_lv(111) ->
    [1, 2, 3];
get_by_lv(112) ->
    [1, 2, 3];
get_by_lv(113) ->
    [1, 2, 3];
get_by_lv(114) ->
    [1, 2, 3];
get_by_lv(115) ->
    [1, 2, 3];
get_by_lv(116) ->
    [1, 2, 3];
get_by_lv(117) ->
    [1, 2, 3];
get_by_lv(118) ->
    [1, 2, 3];
get_by_lv(119) ->
    [1, 2, 3];
get_by_lv(120) ->
    [1, 2, 3];
get_by_lv(121) ->
    [1, 2, 3];
get_by_lv(122) ->
    [1, 2, 3];
get_by_lv(123) ->
    [1, 2, 3];
get_by_lv(124) ->
    [1, 2, 3];
get_by_lv(125) ->
    [1, 2, 3];
get_by_lv(126) ->
    [1, 2, 3];
get_by_lv(127) ->
    [1, 2, 3];
get_by_lv(128) ->
    [1, 2, 3];
get_by_lv(129) ->
    [1, 2, 3];
get_by_lv(130) ->
    [1, 2, 3];
get_by_lv(131) ->
    [1, 2, 3];
get_by_lv(132) ->
    [1, 2, 3];
get_by_lv(133) ->
    [1, 2, 3];
get_by_lv(134) ->
    [1, 2, 3];
get_by_lv(135) ->
    [1, 2, 3];
get_by_lv(136) ->
    [1, 2, 3];
get_by_lv(137) ->
    [1, 2, 3];
get_by_lv(138) ->
    [1, 2, 3];
get_by_lv(139) ->
    [1, 2, 3];
get_by_lv(140) ->
    [1, 2, 3];
get_by_lv(141) ->
    [1, 2, 3];
get_by_lv(142) ->
    [1, 2, 3];
get_by_lv(143) ->
    [1, 2, 3];
get_by_lv(144) ->
    [1, 2, 3];
get_by_lv(145) ->
    [1, 2, 3];
get_by_lv(146) ->
    [1, 2, 3];
get_by_lv(147) ->
    [1, 2, 3];
get_by_lv(148) ->
    [1, 2, 3];
get_by_lv(149) ->
    [1, 2, 3];
get_by_lv(150) ->
    [1, 2, 3];
get_by_lv(151) ->
    [1, 2, 3];
get_by_lv(152) ->
    [1, 2, 3];
get_by_lv(153) ->
    [1, 2, 3];
get_by_lv(154) ->
    [1, 2, 3];
get_by_lv(155) ->
    [1, 2, 3];
get_by_lv(156) ->
    [1, 2, 3];
get_by_lv(157) ->
    [1, 2, 3];
get_by_lv(158) ->
    [1, 2, 3];
get_by_lv(159) ->
    [1, 2, 3];
get_by_lv(160) ->
    [1, 2, 3];
get_by_lv(161) ->
    [1, 2, 3];
get_by_lv(162) ->
    [1, 2, 3];
get_by_lv(163) ->
    [1, 2, 3];
get_by_lv(164) ->
    [1, 2, 3];
get_by_lv(165) ->
    [1, 2, 3];
get_by_lv(166) ->
    [1, 2, 3];
get_by_lv(167) ->
    [1, 2, 3];
get_by_lv(168) ->
    [1, 2, 3];
get_by_lv(169) ->
    [1, 2, 3];
get_by_lv(170) ->
    [1, 2, 3];
get_by_lv(171) ->
    [1, 2, 3];
get_by_lv(172) ->
    [1, 2, 3];
get_by_lv(173) ->
    [1, 2, 3];
get_by_lv(174) ->
    [1, 2, 3];
get_by_lv(175) ->
    [1, 2, 3];
get_by_lv(176) ->
    [1, 2, 3];
get_by_lv(177) ->
    [1, 2, 3];
get_by_lv(178) ->
    [1, 2, 3];
get_by_lv(179) ->
    [1, 2, 3];
get_by_lv(180) ->
    [1, 2, 3];
get_by_lv(181) ->
    [1, 2, 3];
get_by_lv(182) ->
    [1, 2, 3];
get_by_lv(183) ->
    [1, 2, 3];
get_by_lv(184) ->
    [1, 2, 3];
get_by_lv(185) ->
    [1, 2, 3];
get_by_lv(186) ->
    [1, 2, 3];
get_by_lv(187) ->
    [1, 2, 3];
get_by_lv(188) ->
    [1, 2, 3];
get_by_lv(189) ->
    [1, 2, 3];
get_by_lv(190) ->
    [1, 2, 3];
get_by_lv(191) ->
    [1, 2, 3];
get_by_lv(192) ->
    [1, 2, 3];
get_by_lv(193) ->
    [1, 2, 3];
get_by_lv(194) ->
    [1, 2, 3];
get_by_lv(195) ->
    [1, 2, 3];
get_by_lv(196) ->
    [1, 2, 3];
get_by_lv(197) ->
    [1, 2, 3];
get_by_lv(198) ->
    [1, 2, 3];
get_by_lv(199) ->
    [1, 2, 3];
get_by_lv(200) ->
    [1, 2, 3];
get_by_lv(_ID) ->
    [].
