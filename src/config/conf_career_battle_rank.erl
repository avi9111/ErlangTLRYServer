%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_career_battle_rank
%% @Brief  : 门派竞技段位奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_career_battle_rank).

-export([
    get/2,
    get_grade_ids/0
]).

get(1, Rank) when Rank =< 1 andalso Rank >= 1 -> 130001;
get(1, Rank) when Rank =< 2 andalso Rank >= 2 -> 130002;
get(1, Rank) when Rank =< 3 andalso Rank >= 3 -> 130003;
get(1, Rank) when Rank =< 10 andalso Rank >= 4 -> 130004;
get(1, Rank) when Rank =< 20 andalso Rank >= 11 -> 130005;
get(1, Rank) when Rank =< 30 andalso Rank >= 21 -> 130006;
get(2, Rank) when Rank =< 1 andalso Rank >= 1 -> 130101;
get(2, Rank) when Rank =< 2 andalso Rank >= 2 -> 130102;
get(2, Rank) when Rank =< 3 andalso Rank >= 3 -> 130103;
get(2, Rank) when Rank =< 10 andalso Rank >= 4 -> 130104;
get(2, Rank) when Rank =< 20 andalso Rank >= 11 -> 130105;
get(2, Rank) when Rank =< 30 andalso Rank >= 21 -> 130106;
get(3, Rank) when Rank =< 1 andalso Rank >= 1 -> 130201;
get(3, Rank) when Rank =< 2 andalso Rank >= 2 -> 130202;
get(3, Rank) when Rank =< 3 andalso Rank >= 3 -> 130203;
get(3, Rank) when Rank =< 10 andalso Rank >= 4 -> 130204;
get(3, Rank) when Rank =< 20 andalso Rank >= 11 -> 130205;
get(3, Rank) when Rank =< 30 andalso Rank >= 21 -> 130206;
get(4, Rank) when Rank =< 1 andalso Rank >= 1 -> 130301;
get(4, Rank) when Rank =< 2 andalso Rank >= 2 -> 130302;
get(4, Rank) when Rank =< 3 andalso Rank >= 3 -> 130303;
get(4, Rank) when Rank =< 10 andalso Rank >= 4 -> 130304;
get(4, Rank) when Rank =< 20 andalso Rank >= 11 -> 130305;
get(4, Rank) when Rank =< 30 andalso Rank >= 21 -> 130306;
get(_Grade, _Rank) -> 0.


get_grade_ids() ->
	[1, 2, 3, 4].