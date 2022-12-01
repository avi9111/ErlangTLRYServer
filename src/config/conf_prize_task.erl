%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_prize_task
%% @Brief  : 武林悬赏令
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_prize_task).

-export([
    get/1,
    get_ids/0,
    get_grades/0
]).

get({Level, 1}) when Level =< 30 ->
    #{
        level => 30,
        grade => 1,
        tasks => [31021,31001],
        costs => []
    };
get({Level, 2}) when Level =< 30 ->
    #{
        level => 30,
        grade => 2,
        tasks => [31022,31002],
        costs => [{4,100000}]
    };
get({Level, 3}) when Level =< 30 ->
    #{
        level => 30,
        grade => 3,
        tasks => [31023,31003],
        costs => [{17,2000}]
    };
get({Level, 4}) when Level =< 30 ->
    #{
        level => 30,
        grade => 4,
        tasks => [31024,31004],
        costs => [{13,40}]
    };
get({Level, 5}) when Level =< 30 ->
    #{
        level => 30,
        grade => 5,
        tasks => [31025,31005],
        costs => [{13,100}]
    };
get({Level, 1}) when Level =< 50 ->
    #{
        level => 50,
        grade => 1,
        tasks => [31021,31001,31006],
        costs => []
    };
get({Level, 2}) when Level =< 50 ->
    #{
        level => 50,
        grade => 2,
        tasks => [31022,31002,31007],
        costs => [{4,100000}]
    };
get({Level, 3}) when Level =< 50 ->
    #{
        level => 50,
        grade => 3,
        tasks => [31023,31003,31008],
        costs => [{17,2000}]
    };
get({Level, 4}) when Level =< 50 ->
    #{
        level => 50,
        grade => 4,
        tasks => [31024,31004,31009],
        costs => [{13,40}]
    };
get({Level, 5}) when Level =< 50 ->
    #{
        level => 50,
        grade => 5,
        tasks => [31025,31005,31010],
        costs => [{13,100}]
    };
get({Level, 1}) when Level =< 70 ->
    #{
        level => 70,
        grade => 1,
        tasks => [31021,31001,31006,31011],
        costs => []
    };
get({Level, 2}) when Level =< 70 ->
    #{
        level => 70,
        grade => 2,
        tasks => [31022,31002,31007,31012],
        costs => [{4,100000}]
    };
get({Level, 3}) when Level =< 70 ->
    #{
        level => 70,
        grade => 3,
        tasks => [31023,31003,31008,31013],
        costs => [{17,2000}]
    };
get({Level, 4}) when Level =< 70 ->
    #{
        level => 70,
        grade => 4,
        tasks => [31024,31004,31009,31014],
        costs => [{13,40}]
    };
get({Level, 5}) when Level =< 70 ->
    #{
        level => 70,
        grade => 5,
        tasks => [31025,31005,31010,31015],
        costs => [{13,100}]
    };
get({Level, 1}) when Level =< 999 ->
    #{
        level => 999,
        grade => 1,
        tasks => [31021,31001,31006,31011,31016],
        costs => []
    };
get({Level, 2}) when Level =< 999 ->
    #{
        level => 999,
        grade => 2,
        tasks => [31022,31002,31007,31012,31017],
        costs => [{4,100000}]
    };
get({Level, 3}) when Level =< 999 ->
    #{
        level => 999,
        grade => 3,
        tasks => [31023,31003,31008,31013,31018],
        costs => [{17,2000}]
    };
get({Level, 4}) when Level =< 999 ->
    #{
        level => 999,
        grade => 4,
        tasks => [31024,31004,31009,31014,31019],
        costs => [{13,40}]
    };
get({Level, 5}) when Level =< 999 ->
    #{
        level => 999,
        grade => 5,
        tasks => [31025,31005,31010,31015,31020],
        costs => [{13,100}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{30, 1}, {30, 2}, {30, 3}, {30, 4}, {30, 5}, {50, 1}, {50, 2}, {50, 3}, {50, 4}, {50, 5}, {70, 1}, {70, 2}, {70, 3}, {70, 4}, {70, 5}, {999, 1}, {999, 2}, {999, 3}, {999, 4}, {999, 5}].

get_grades() ->
    [1, 2, 3, 4, 5].
