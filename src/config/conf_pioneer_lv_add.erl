%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_pioneer_lv_add
%% @Brief  : 先锋等级
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_pioneer_lv_add).

-export([
    get/1,
    get_ids/0
]).

get({Level, Diff}) when Level =< 25, Diff >= 999 ->
    0;
get({Level, Diff}) when Level =< 25, Diff >= 50 ->
    0;
get({Level, Diff}) when Level =< 25, Diff >= 10 ->
    0;
get({Level, Diff}) when Level =< 25, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 29, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 29, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 29, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 29, Diff >= 70 ->
    1.11;
get({Level, Diff}) when Level =< 29, Diff >= 60 ->
    1.05;
get({Level, Diff}) when Level =< 29, Diff >= 50 ->
    0.99;
get({Level, Diff}) when Level =< 29, Diff >= 40 ->
    0.93;
get({Level, Diff}) when Level =< 29, Diff >= 30 ->
    0.87;
get({Level, Diff}) when Level =< 29, Diff >= 20 ->
    0.81;
get({Level, Diff}) when Level =< 29, Diff >= 19 ->
    0.76;
get({Level, Diff}) when Level =< 29, Diff >= 18 ->
    0.71;
get({Level, Diff}) when Level =< 29, Diff >= 17 ->
    0.66;
get({Level, Diff}) when Level =< 29, Diff >= 16 ->
    0.61;
get({Level, Diff}) when Level =< 29, Diff >= 15 ->
    0.56;
get({Level, Diff}) when Level =< 29, Diff >= 14 ->
    0.51;
get({Level, Diff}) when Level =< 29, Diff >= 13 ->
    0.46;
get({Level, Diff}) when Level =< 29, Diff >= 12 ->
    0.41;
get({Level, Diff}) when Level =< 29, Diff >= 11 ->
    0.36;
get({Level, Diff}) when Level =< 29, Diff >= 10 ->
    0.3;
get({Level, Diff}) when Level =< 29, Diff >= 9 ->
    0.25;
get({Level, Diff}) when Level =< 29, Diff >= 8 ->
    0.19;
get({Level, Diff}) when Level =< 29, Diff >= 7 ->
    0.15;
get({Level, Diff}) when Level =< 29, Diff >= 6 ->
    0.1;
get({Level, Diff}) when Level =< 29, Diff >= 5 ->
    0.05;
get({Level, Diff}) when Level =< 29, Diff >= 4 ->
    0;
get({Level, Diff}) when Level =< 29, Diff >= 3 ->
    0;
get({Level, Diff}) when Level =< 29, Diff >= 2 ->
    0;
get({Level, Diff}) when Level =< 29, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 49, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 49, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 49, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 49, Diff >= 70 ->
    1.17;
get({Level, Diff}) when Level =< 49, Diff >= 60 ->
    1.11;
get({Level, Diff}) when Level =< 49, Diff >= 50 ->
    1.05;
get({Level, Diff}) when Level =< 49, Diff >= 40 ->
    0.99;
get({Level, Diff}) when Level =< 49, Diff >= 30 ->
    0.93;
get({Level, Diff}) when Level =< 49, Diff >= 20 ->
    0.87;
get({Level, Diff}) when Level =< 49, Diff >= 19 ->
    0.81;
get({Level, Diff}) when Level =< 49, Diff >= 18 ->
    0.76;
get({Level, Diff}) when Level =< 49, Diff >= 17 ->
    0.71;
get({Level, Diff}) when Level =< 49, Diff >= 16 ->
    0.66;
get({Level, Diff}) when Level =< 49, Diff >= 15 ->
    0.61;
get({Level, Diff}) when Level =< 49, Diff >= 14 ->
    0.56;
get({Level, Diff}) when Level =< 49, Diff >= 13 ->
    0.51;
get({Level, Diff}) when Level =< 49, Diff >= 12 ->
    0.46;
get({Level, Diff}) when Level =< 49, Diff >= 11 ->
    0.41;
get({Level, Diff}) when Level =< 49, Diff >= 10 ->
    0.36;
get({Level, Diff}) when Level =< 49, Diff >= 9 ->
    0.31;
get({Level, Diff}) when Level =< 49, Diff >= 8 ->
    0.25;
get({Level, Diff}) when Level =< 49, Diff >= 7 ->
    0.19;
get({Level, Diff}) when Level =< 49, Diff >= 6 ->
    0.13;
get({Level, Diff}) when Level =< 49, Diff >= 5 ->
    0.07;
get({Level, Diff}) when Level =< 49, Diff >= 4 ->
    0;
get({Level, Diff}) when Level =< 49, Diff >= 3 ->
    0;
get({Level, Diff}) when Level =< 49, Diff >= 2 ->
    0;
get({Level, Diff}) when Level =< 49, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 59, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 70 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 60 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 50 ->
    1.17;
get({Level, Diff}) when Level =< 59, Diff >= 40 ->
    1.11;
get({Level, Diff}) when Level =< 59, Diff >= 30 ->
    1.11;
get({Level, Diff}) when Level =< 59, Diff >= 20 ->
    1.11;
get({Level, Diff}) when Level =< 59, Diff >= 19 ->
    1.05;
get({Level, Diff}) when Level =< 59, Diff >= 18 ->
    0.99;
get({Level, Diff}) when Level =< 59, Diff >= 17 ->
    0.94;
get({Level, Diff}) when Level =< 59, Diff >= 16 ->
    0.89;
get({Level, Diff}) when Level =< 59, Diff >= 15 ->
    0.84;
get({Level, Diff}) when Level =< 59, Diff >= 14 ->
    0.79;
get({Level, Diff}) when Level =< 59, Diff >= 13 ->
    0.74;
get({Level, Diff}) when Level =< 59, Diff >= 12 ->
    0.69;
get({Level, Diff}) when Level =< 59, Diff >= 11 ->
    0.6;
get({Level, Diff}) when Level =< 59, Diff >= 10 ->
    0.52;
get({Level, Diff}) when Level =< 59, Diff >= 9 ->
    0.44;
get({Level, Diff}) when Level =< 59, Diff >= 8 ->
    0.36;
get({Level, Diff}) when Level =< 59, Diff >= 7 ->
    0.28;
get({Level, Diff}) when Level =< 59, Diff >= 6 ->
    0.2;
get({Level, Diff}) when Level =< 59, Diff >= 5 ->
    0.12;
get({Level, Diff}) when Level =< 59, Diff >= 4 ->
    0;
get({Level, Diff}) when Level =< 59, Diff >= 3 ->
    0;
get({Level, Diff}) when Level =< 59, Diff >= 2 ->
    0;
get({Level, Diff}) when Level =< 59, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 69, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 70 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 60 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 50 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 40 ->
    1.17;
get({Level, Diff}) when Level =< 69, Diff >= 30 ->
    1.11;
get({Level, Diff}) when Level =< 69, Diff >= 20 ->
    1.11;
get({Level, Diff}) when Level =< 69, Diff >= 19 ->
    1.11;
get({Level, Diff}) when Level =< 69, Diff >= 18 ->
    1.05;
get({Level, Diff}) when Level =< 69, Diff >= 17 ->
    0.99;
get({Level, Diff}) when Level =< 69, Diff >= 16 ->
    0.94;
get({Level, Diff}) when Level =< 69, Diff >= 15 ->
    0.89;
get({Level, Diff}) when Level =< 69, Diff >= 14 ->
    0.84;
get({Level, Diff}) when Level =< 69, Diff >= 13 ->
    0.79;
get({Level, Diff}) when Level =< 69, Diff >= 12 ->
    0.74;
get({Level, Diff}) when Level =< 69, Diff >= 11 ->
    0.69;
get({Level, Diff}) when Level =< 69, Diff >= 10 ->
    0.64;
get({Level, Diff}) when Level =< 69, Diff >= 9 ->
    0.59;
get({Level, Diff}) when Level =< 69, Diff >= 8 ->
    0.5;
get({Level, Diff}) when Level =< 69, Diff >= 7 ->
    0.41;
get({Level, Diff}) when Level =< 69, Diff >= 6 ->
    0.32;
get({Level, Diff}) when Level =< 69, Diff >= 5 ->
    0.23;
get({Level, Diff}) when Level =< 69, Diff >= 4 ->
    0.14;
get({Level, Diff}) when Level =< 69, Diff >= 3 ->
    0;
get({Level, Diff}) when Level =< 69, Diff >= 2 ->
    0;
get({Level, Diff}) when Level =< 69, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 79, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 70 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 60 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 50 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 40 ->
    1.17;
get({Level, Diff}) when Level =< 79, Diff >= 30 ->
    1.11;
get({Level, Diff}) when Level =< 79, Diff >= 20 ->
    1.11;
get({Level, Diff}) when Level =< 79, Diff >= 19 ->
    1.11;
get({Level, Diff}) when Level =< 79, Diff >= 18 ->
    1.05;
get({Level, Diff}) when Level =< 79, Diff >= 17 ->
    0.99;
get({Level, Diff}) when Level =< 79, Diff >= 16 ->
    0.94;
get({Level, Diff}) when Level =< 79, Diff >= 15 ->
    0.89;
get({Level, Diff}) when Level =< 79, Diff >= 14 ->
    0.84;
get({Level, Diff}) when Level =< 79, Diff >= 13 ->
    0.79;
get({Level, Diff}) when Level =< 79, Diff >= 12 ->
    0.74;
get({Level, Diff}) when Level =< 79, Diff >= 11 ->
    0.69;
get({Level, Diff}) when Level =< 79, Diff >= 10 ->
    0.64;
get({Level, Diff}) when Level =< 79, Diff >= 9 ->
    0.59;
get({Level, Diff}) when Level =< 79, Diff >= 8 ->
    0.54;
get({Level, Diff}) when Level =< 79, Diff >= 7 ->
    0.49;
get({Level, Diff}) when Level =< 79, Diff >= 6 ->
    0.44;
get({Level, Diff}) when Level =< 79, Diff >= 5 ->
    0.39;
get({Level, Diff}) when Level =< 79, Diff >= 4 ->
    0.28;
get({Level, Diff}) when Level =< 79, Diff >= 3 ->
    0.16;
get({Level, Diff}) when Level =< 79, Diff >= 2 ->
    0;
get({Level, Diff}) when Level =< 79, Diff >= 1 ->
    0;
get({Level, Diff}) when Level =< 999, Diff >= 999 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 100 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 90 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 80 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 70 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 60 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 50 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 40 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 30 ->
    1.17;
get({Level, Diff}) when Level =< 999, Diff >= 20 ->
    1.11;
get({Level, Diff}) when Level =< 999, Diff >= 19 ->
    1.11;
get({Level, Diff}) when Level =< 999, Diff >= 18 ->
    1.11;
get({Level, Diff}) when Level =< 999, Diff >= 17 ->
    1.05;
get({Level, Diff}) when Level =< 999, Diff >= 16 ->
    0.99;
get({Level, Diff}) when Level =< 999, Diff >= 15 ->
    0.94;
get({Level, Diff}) when Level =< 999, Diff >= 14 ->
    0.89;
get({Level, Diff}) when Level =< 999, Diff >= 13 ->
    0.84;
get({Level, Diff}) when Level =< 999, Diff >= 12 ->
    0.79;
get({Level, Diff}) when Level =< 999, Diff >= 11 ->
    0.74;
get({Level, Diff}) when Level =< 999, Diff >= 10 ->
    0.69;
get({Level, Diff}) when Level =< 999, Diff >= 9 ->
    0.64;
get({Level, Diff}) when Level =< 999, Diff >= 8 ->
    0.59;
get({Level, Diff}) when Level =< 999, Diff >= 7 ->
    0.54;
get({Level, Diff}) when Level =< 999, Diff >= 6 ->
    0.49;
get({Level, Diff}) when Level =< 999, Diff >= 5 ->
    0.44;
get({Level, Diff}) when Level =< 999, Diff >= 4 ->
    0.39;
get({Level, Diff}) when Level =< 999, Diff >= 3 ->
    0.28;
get({Level, Diff}) when Level =< 999, Diff >= 2 ->
    0.16;
get({Level, Diff}) when Level =< 999, Diff >= 1 ->
    0;
get(_ID) ->
    0.

get_ids() ->
    [{25, 1}, {25, 10}, {25, 50}, {25, 999}, {29, 1}, {29, 2}, {29, 3}, {29, 4}, {29, 5}, {29, 6}, {29, 7}, {29, 8}, {29, 9}, {29, 10}, {29, 11}, {29, 12}, {29, 13}, {29, 14}, {29, 15}, {29, 16}, {29, 17}, {29, 18}, {29, 19}, {29, 20}, {29, 30}, {29, 40}, {29, 50}, {29, 60}, {29, 70}, {29, 80}, {29, 90}, {29, 100}, {49, 1}, {49, 2}, {49, 3}, {49, 4}, {49, 5}, {49, 6}, {49, 7}, {49, 8}, {49, 9}, {49, 10}, {49, 11}, {49, 12}, {49, 13}, {49, 14}, {49, 15}, {49, 16}, {49, 17}, {49, 18}, {49, 19}, {49, 20}, {49, 30}, {49, 40}, {49, 50}, {49, 60}, {49, 70}, {49, 80}, {49, 90}, {49, 100}, {59, 1}, {59, 2}, {59, 3}, {59, 4}, {59, 5}, {59, 6}, {59, 7}, {59, 8}, {59, 9}, {59, 10}, {59, 11}, {59, 12}, {59, 13}, {59, 14}, {59, 15}, {59, 16}, {59, 17}, {59, 18}, {59, 19}, {59, 20}, {59, 30}, {59, 40}, {59, 50}, {59, 60}, {59, 70}, {59, 80}, {59, 90}, {59, 100}, {69, 1}, {69, 2}, {69, 3}, {69, 4}, {69, 5}, {69, 6}, {69, 7}, {69, 8}, {69, 9}, {69, 10}, {69, 11}, {69, 12}, {69, 13}, {69, 14}, {69, 15}, {69, 16}, {69, 17}, {69, 18}, {69, 19}, {69, 20}, {69, 30}, {69, 40}, {69, 50}, {69, 60}, {69, 70}, {69, 80}, {69, 90}, {69, 100}, {79, 1}, {79, 2}, {79, 3}, {79, 4}, {79, 5}, {79, 6}, {79, 7}, {79, 8}, {79, 9}, {79, 10}, {79, 11}, {79, 12}, {79, 13}, {79, 14}, {79, 15}, {79, 16}, {79, 17}, {79, 18}, {79, 19}, {79, 20}, {79, 30}, {79, 40}, {79, 50}, {79, 60}, {79, 70}, {79, 80}, {79, 90}, {79, 100}, {999, 1}, {999, 2}, {999, 3}, {999, 4}, {999, 5}, {999, 6}, {999, 7}, {999, 8}, {999, 9}, {999, 10}, {999, 11}, {999, 12}, {999, 13}, {999, 14}, {999, 15}, {999, 16}, {999, 17}, {999, 18}, {999, 19}, {999, 20}, {999, 30}, {999, 40}, {999, 50}, {999, 60}, {999, 70}, {999, 80}, {999, 90}, {999, 100}, {999, 999}].
