%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_career_battle_score
%% @Brief  : 门派竞技额外积分
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_career_battle_score).

-export([
    get/2
]).

get(1, Perc) when Perc =< 100 -> 0;
get(1, Perc) when Perc =< 110 -> 30;
get(1, Perc) when Perc =< 120 -> 50;
get(1, Perc) when Perc =< 150 -> 80;
get(1, Perc) when Perc =< 180 -> 110;
get(1, Perc) when Perc =< 250 -> 150;
get(1, Perc) when Perc =< 400 -> 200;
get(1, Perc) when Perc =< 9999 -> 250;
get(2, Perc) when Perc =< 100 -> 0;
get(2, Perc) when Perc =< 110 -> 30;
get(2, Perc) when Perc =< 120 -> 50;
get(2, Perc) when Perc =< 150 -> 80;
get(2, Perc) when Perc =< 180 -> 110;
get(2, Perc) when Perc =< 250 -> 150;
get(2, Perc) when Perc =< 400 -> 200;
get(2, Perc) when Perc =< 9999 -> 250;
get(3, Perc) when Perc =< 100 -> 0;
get(3, Perc) when Perc =< 110 -> 30;
get(3, Perc) when Perc =< 120 -> 50;
get(3, Perc) when Perc =< 150 -> 80;
get(3, Perc) when Perc =< 180 -> 110;
get(3, Perc) when Perc =< 250 -> 150;
get(3, Perc) when Perc =< 400 -> 200;
get(3, Perc) when Perc =< 9999 -> 250;
get(4, Perc) when Perc =< 100 -> 0;
get(4, Perc) when Perc =< 110 -> 30;
get(4, Perc) when Perc =< 120 -> 50;
get(4, Perc) when Perc =< 150 -> 80;
get(4, Perc) when Perc =< 180 -> 110;
get(4, Perc) when Perc =< 250 -> 150;
get(4, Perc) when Perc =< 400 -> 200;
get(4, Perc) when Perc =< 9999 -> 250;
get(_Grade, _Perc) -> 0.