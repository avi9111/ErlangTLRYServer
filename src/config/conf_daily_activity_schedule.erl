%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_daily_activity_schedule
%% @Brief  : 日常活动时间表
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_daily_activity_schedule).

-export([
    get/1,
    get_ids/0,
    get_act/1
]).

get(1) ->
    #{
        id => 1,
        act_id => 6001,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {14,00,0},
        end_time => {14,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(2) ->
    #{
        id => 2,
        act_id => 6001,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {21,00,0},
        end_time => {21,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(3) ->
    #{
        id => 3,
        act_id => 1005,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {20,00,0},
        end_time => {20,30,0},
        repeat => [3]
    };
get(4) ->
    #{
        id => 4,
        act_id => 1006,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {21,00,0},
        end_time => {21,35,0},
        repeat => [4]
    };
get(5) ->
    #{
        id => 5,
        act_id => 1007,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {13,30,0},
        end_time => {14,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(6) ->
    #{
        id => 6,
        act_id => 1007,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {17,30,0},
        end_time => {18,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(7) ->
    #{
        id => 7,
        act_id => 1008,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {19,00,0},
        end_time => {19,15,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(8) ->
    #{
        id => 8,
        act_id => 1009,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {11,00,0},
        end_time => {11,30,0},
        repeat => [1,4]
    };
get(9) ->
    #{
        id => 9,
        act_id => 1009,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {17,00,0},
        end_time => {17,30,0},
        repeat => [1,4]
    };
get(10) ->
    #{
        id => 10,
        act_id => 1009,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {21,30,0},
        end_time => {22,00,0},
        repeat => [1,4]
    };
get(11) ->
    #{
        id => 11,
        act_id => 1013,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {19,0,0},
        end_time => {21,15,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(12) ->
    #{
        id => 12,
        act_id => 1014,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {12,0,0},
        end_time => {14,0,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(13) ->
    #{
        id => 13,
        act_id => 1015,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {12,30,0},
        end_time => {13,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(14) ->
    #{
        id => 14,
        act_id => 1010,
        open_day => 9999,
        close_day => 0,
        open_week => 0,
        start_time => {20,00,0},
        end_time => {20,30,0},
        repeat => [6]
    };
get(15) ->
    #{
        id => 15,
        act_id => 1011,
        open_day => 9999,
        close_day => 0,
        open_week => 0,
        start_time => {20,35,0},
        end_time => {21,05,0},
        repeat => [6]
    };
get(16) ->
    #{
        id => 16,
        act_id => 1012,
        open_day => 9999,
        close_day => 0,
        open_week => 0,
        start_time => {15,59,0},
%%        start_time => {20,00,0},
        end_time => {16,30,0},
%%        end_time => {20,30,0},
        repeat => [5]
%%        repeat => [7]
    };
get(17) ->
    #{
        id => 17,
        act_id => 1014,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {18,0,0},
        end_time => {20,0,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(18) ->
    #{
        id => 18,
        act_id => 1004,
        open_day => 9999,
        close_day => 0,
        open_week => 0,
        start_time => {22,0,0},
        end_time => {22,20,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(19) ->
    #{
        id => 19,
        act_id => 1001,
        open_day => 9999,
        close_day => 0,
        open_week => 0,
        start_time => {19,30,0},
        end_time => {19,42,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(20) ->
    #{
        id => 20,
        act_id => 1007,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {21,30,0},
        end_time => {22,30,0},
        repeat => [2,3,5,6,7]
    };
get(21) ->
    #{
        id => 21,
        act_id => 1015,
        open_day => 1,
        close_day => 0,
        open_week => 0,
        start_time => {20,30,0},
        end_time => {21,30,0},
        repeat => [1,2,3,4,5,6,7]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21].

get_act(6001) ->
    [1, 2];
get_act(1005) ->
    [3];
get_act(1006) ->
    [4];
get_act(1007) ->
    [5, 6, 20];
get_act(1008) ->
    [7];
get_act(1009) ->
    [8, 9, 10];
get_act(1013) ->
    [11];
get_act(1014) ->
    [12, 17];
get_act(1015) ->
    [13, 21];
get_act(1010) ->
    [14];
get_act(1011) ->
    [15];
get_act(1012) ->
    [16];
get_act(1004) ->
    [18];
get_act(1001) ->
    [19];
get_act(_) ->
    [].
