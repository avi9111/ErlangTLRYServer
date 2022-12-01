%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_question_score
%% @Brief  : 答题积分
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_question_score).

-export([
    get/1,
    get_ids/0
]).

get(LeaveTime) when LeaveTime >= 0 andalso LeaveTime < 1 -> 1;

get(LeaveTime) when LeaveTime >= 1 andalso LeaveTime < 2 -> 2;

get(LeaveTime) when LeaveTime >= 2 andalso LeaveTime < 3 -> 3;

get(LeaveTime) when LeaveTime >= 3 andalso LeaveTime < 4 -> 4;

get(LeaveTime) when LeaveTime >= 4 andalso LeaveTime < 5 -> 5;

get(LeaveTime) when LeaveTime >= 5 andalso LeaveTime < 6 -> 6;

get(LeaveTime) when LeaveTime >= 6 andalso LeaveTime < 7 -> 7;

get(LeaveTime) when LeaveTime >= 7 andalso LeaveTime < 8 -> 8;

get(LeaveTime) when LeaveTime >= 8 andalso LeaveTime < 9 -> 9;

get(LeaveTime) when LeaveTime >= 9 andalso LeaveTime < 9999 -> 10;

get(_LeaveTime) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].
