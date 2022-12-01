%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_society_tag
%% @Brief  : 江湖之路任务
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_society_task).

-export([
    get/1,
    get_ids/0,
    get_by_day/1
]).

get(1) ->
    #{
        id => 1,
        tag => 1,
        day => 1,
        star => 1,
        total => 20,
        reward => 289001,
        finish_cond => [{1,20,[]}]
    };
get(2) ->
    #{
        id => 2,
        tag => 1,
        day => 1,
        star => 1,
        total => 10,
        reward => 289002,
        finish_cond => [{16,10,[]}]
    };
get(3) ->
    #{
        id => 3,
        tag => 1,
        day => 1,
        star => 1,
        total => 1,
        reward => 289003,
        finish_cond => [{11,1,[550,10]}]
    };
get(4) ->
    #{
        id => 4,
        tag => 1,
        day => 1,
        star => 1,
        total => 5,
        reward => 289004,
        finish_cond => [{3,5,[]}]
    };
get(5) ->
    #{
        id => 5,
        tag => 1,
        day => 1,
        star => 2,
        total => 10,
        reward => 289006,
        finish_cond => [{19,10,[3,16010001]}]
    };
get(6) ->
    #{
        id => 6,
        tag => 1,
        day => 1,
        star => 1,
        total => 1,
        reward => 289007,
        finish_cond => [{17,1,[1200]}]
    };
get(7) ->
    #{
        id => 7,
        tag => 1,
        day => 1,
        star => 1,
        total => 1,
        reward => 289008,
        finish_cond => [{25,1,[]}]
    };
get(8) ->
    #{
        id => 8,
        tag => 1,
        day => 1,
        star => 1,
        total => 1,
        reward => 289009,
        finish_cond => [{17,1,[700]}]
    };
get(9) ->
    #{
        id => 9,
        tag => 1,
        day => 1,
        star => 1,
        total => 2,
        reward => 289010,
        finish_cond => [{26,2,[]}]
    };
get(10) ->
    #{
        id => 10,
        tag => 1,
        day => 1,
        star => 1,
        total => 20,
        reward => 289011,
        finish_cond => [{27,20,[]}]
    };
get(11) ->
    #{
        id => 11,
        tag => 1,
        day => 1,
        star => 1,
        total => 10,
        reward => 289012,
        finish_cond => [{28,10,[]}]
    };
get(12) ->
    #{
        id => 12,
        tag => 1,
        day => 1,
        star => 1,
        total => 10,
        reward => 289013,
        finish_cond => [{29,10,[]}]
    };
get(13) ->
    #{
        id => 13,
        tag => 1,
        day => 1,
        star => 2,
        total => 8,
        reward => 289014,
        finish_cond => [{5,8,[25]}]
    };
get(14) ->
    #{
        id => 14,
        tag => 1,
        day => 1,
        star => 1,
        total => 4,
        reward => 289015,
        finish_cond => [{30,4,[30]}]
    };
get(15) ->
    #{
        id => 15,
        tag => 2,
        day => 2,
        star => 1,
        total => 30,
        reward => 289101,
        finish_cond => [{1,30,[]}]
    };
get(16) ->
    #{
        id => 16,
        tag => 2,
        day => 2,
        star => 2,
        total => 50,
        reward => 289102,
        finish_cond => [{10,50,[70101,0]}]
    };
get(17) ->
    #{
        id => 17,
        tag => 2,
        day => 2,
        star => 1,
        total => 30,
        reward => 289105,
        finish_cond => [{19,30,[3,16010001]}]
    };
get(18) ->
    #{
        id => 18,
        tag => 2,
        day => 2,
        star => 1,
        total => 5,
        reward => 289107,
        finish_cond => [{19,5,[3,16400001]}]
    };
get(19) ->
    #{
        id => 19,
        tag => 2,
        day => 2,
        star => 2,
        total => 2,
        reward => 289108,
        finish_cond => [{17,2,[800]}]
    };
get(20) ->
    #{
        id => 20,
        tag => 2,
        day => 2,
        star => 1,
        total => 8,
        reward => 289109,
        finish_cond => [{5,8,[35]}]
    };
get(21) ->
    #{
        id => 21,
        tag => 2,
        day => 2,
        star => 2,
        total => 100,
        reward => 289110,
        finish_cond => [{10,100,[70001,0]}]
    };
get(22) ->
    #{
        id => 22,
        tag => 2,
        day => 2,
        star => 1,
        total => 4,
        reward => 289111,
        finish_cond => [{30,4,[37]}]
    };
get(23) ->
    #{
        id => 23,
        tag => 2,
        day => 2,
        star => 1,
        total => 2,
        reward => 289112,
        finish_cond => [{24,2,[]}]
    };
get(24) ->
    #{
        id => 24,
        tag => 2,
        day => 2,
        star => 2,
        total => 1,
        reward => 289113,
        finish_cond => [{20,1,[2]}]
    };
get(25) ->
    #{
        id => 25,
        tag => 2,
        day => 2,
        star => 2,
        total => 1,
        reward => 289114,
        finish_cond => [{38,1,[14]}]
    };
get(26) ->
    #{
        id => 26,
        tag => 3,
        day => 3,
        star => 1,
        total => 2,
        reward => 289201,
        finish_cond => [{22,2,[]}]
    };
get(27) ->
    #{
        id => 27,
        tag => 3,
        day => 3,
        star => 1,
        total => 100,
        reward => 289202,
        finish_cond => [{18,100,[]}]
    };
get(28) ->
    #{
        id => 28,
        tag => 3,
        day => 3,
        star => 3,
        total => 1,
        reward => 289203,
        finish_cond => [{31,1,[]}]
    };
get(29) ->
    #{
        id => 29,
        tag => 3,
        day => 3,
        star => 1,
        total => 10,
        reward => 289204,
        finish_cond => [{19,10,[3,16250101]}]
    };
get(30) ->
    #{
        id => 30,
        tag => 3,
        day => 3,
        star => 1,
        total => 1,
        reward => 289205,
        finish_cond => [{11,1,[550,20]}]
    };
get(31) ->
    #{
        id => 31,
        tag => 3,
        day => 3,
        star => 1,
        total => 2,
        reward => 289206,
        finish_cond => [{35,2,[]}]
    };
get(32) ->
    #{
        id => 32,
        tag => 3,
        day => 3,
        star => 1,
        total => 4,
        reward => 289207,
        finish_cond => [{32,4,[]}]
    };
get(33) ->
    #{
        id => 33,
        tag => 3,
        day => 3,
        star => 1,
        total => 2,
        reward => 289208,
        finish_cond => [{33,2,[]}]
    };
get(34) ->
    #{
        id => 34,
        tag => 3,
        day => 3,
        star => 1,
        total => 40,
        reward => 289209,
        finish_cond => [{1,40,[]}]
    };
get(35) ->
    #{
        id => 35,
        tag => 3,
        day => 3,
        star => 2,
        total => 2,
        reward => 289210,
        finish_cond => [{34,2,[]}]
    };
get(36) ->
    #{
        id => 36,
        tag => 3,
        day => 3,
        star => 1,
        total => 1,
        reward => 289211,
        finish_cond => [{38,1,[15]}]
    };
get(37) ->
    #{
        id => 37,
        tag => 4,
        day => 4,
        star => 3,
        total => 1,
        reward => 289301,
        finish_cond => [{19,1,[2,16041002]}]
    };
get(38) ->
    #{
        id => 38,
        tag => 4,
        day => 4,
        star => 2,
        total => 2000,
        reward => 289302,
        finish_cond => [{23,2000,[]}]
    };
get(39) ->
    #{
        id => 39,
        tag => 4,
        day => 4,
        star => 5,
        total => 10,
        reward => 289303,
        finish_cond => [{7,10,[2]}]
    };
get(40) ->
    #{
        id => 40,
        tag => 4,
        day => 4,
        star => 2,
        total => 1,
        reward => 289304,
        finish_cond => [{36,1,[4]}]
    };
get(41) ->
    #{
        id => 41,
        tag => 4,
        day => 4,
        star => 3,
        total => 1,
        reward => 289305,
        finish_cond => [{21,1,[7]}]
    };
get(42) ->
    #{
        id => 42,
        tag => 4,
        day => 4,
        star => 2,
        total => 4,
        reward => 289306,
        finish_cond => [{22,4,[]}]
    };
get(43) ->
    #{
        id => 43,
        tag => 4,
        day => 4,
        star => 2,
        total => 1,
        reward => 289309,
        finish_cond => [{39,1,[100000]}]
    };
get(44) ->
    #{
        id => 44,
        tag => 4,
        day => 4,
        star => 3,
        total => 8,
        reward => 289310,
        finish_cond => [{5,8,[45]}]
    };
get(45) ->
    #{
        id => 45,
        tag => 4,
        day => 4,
        star => 2,
        total => 1,
        reward => 289311,
        finish_cond => [{38,1,[16]}]
    };
get(46) ->
    #{
        id => 46,
        tag => 5,
        day => 5,
        star => 8,
        total => 5,
        reward => 289401,
        finish_cond => [{20,5,[5]}]
    };
get(47) ->
    #{
        id => 47,
        tag => 5,
        day => 5,
        star => 10,
        total => 10,
        reward => 289402,
        finish_cond => [{7,10,[5]}]
    };
get(48) ->
    #{
        id => 48,
        tag => 5,
        day => 5,
        star => 2,
        total => 10,
        reward => 289403,
        finish_cond => [{24,10,[]}]
    };
get(49) ->
    #{
        id => 49,
        tag => 5,
        day => 5,
        star => 2,
        total => 6,
        reward => 289404,
        finish_cond => [{37,6,[]}]
    };
get(50) ->
    #{
        id => 50,
        tag => 5,
        day => 5,
        star => 2,
        total => 1,
        reward => 289405,
        finish_cond => [{17,1,[900]}]
    };
get(51) ->
    #{
        id => 51,
        tag => 5,
        day => 5,
        star => 2,
        total => 50,
        reward => 289406,
        finish_cond => [{1,50,[]}]
    };
get(52) ->
    #{
        id => 52,
        tag => 5,
        day => 5,
        star => 2,
        total => 9,
        reward => 289407,
        finish_cond => [{5,9,[45]}]
    };
get(53) ->
    #{
        id => 53,
        tag => 5,
        day => 5,
        star => 2,
        total => 1,
        reward => 289409,
        finish_cond => [{11,1,[550,30]}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53].

get_by_day(1) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
get_by_day(2) ->
    [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25];
get_by_day(3) ->
    [26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36];
get_by_day(4) ->
    [37, 38, 39, 40, 41, 42, 43, 44, 45];
get_by_day(5) ->
    [46, 47, 48, 49, 50, 51, 52, 53];
get_by_day(_) ->
    [].
