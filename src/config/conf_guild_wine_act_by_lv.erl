%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_wine_act_by_lv
%% @Brief  : 帮派行酒令等级相关
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_guild_wine_act_by_lv).

-export([
    get/1
]).

get(Lv) when Lv =< 10 ->
    #{
        exp => 821,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 11 ->
    #{
        exp => 824,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 12 ->
    #{
        exp => 827,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 13 ->
    #{
        exp => 829,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 14 ->
    #{
        exp => 834,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 15 ->
    #{
        exp => 837,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 16 ->
    #{
        exp => 840,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 17 ->
    #{
        exp => 842,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 18 ->
    #{
        exp => 845,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 19 ->
    #{
        exp => 850,
        dice_reward => 201001,
        dice_max_reward => 201101,
        dice_min_reward => 201201,
        comment_like_reward => 202001,
        comment_dislike_reward => 202101,
        quiz_succ_reward => 200001,
        quiz_fail_reward => 200101    };
get(Lv) when Lv =< 20 ->
    #{
        exp => 853,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 21 ->
    #{
        exp => 856,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 22 ->
    #{
        exp => 858,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 23 ->
    #{
        exp => 861,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 24 ->
    #{
        exp => 864,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 25 ->
    #{
        exp => 869,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 26 ->
    #{
        exp => 871,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 27 ->
    #{
        exp => 874,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 28 ->
    #{
        exp => 877,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 29 ->
    #{
        exp => 880,
        dice_reward => 201002,
        dice_max_reward => 201102,
        dice_min_reward => 201202,
        comment_like_reward => 202002,
        comment_dislike_reward => 202102,
        quiz_succ_reward => 200002,
        quiz_fail_reward => 200102    };
get(Lv) when Lv =< 30 ->
    #{
        exp => 887,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 31 ->
    #{
        exp => 893,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 32 ->
    #{
        exp => 899,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 33 ->
    #{
        exp => 905,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 34 ->
    #{
        exp => 912,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 35 ->
    #{
        exp => 921,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 36 ->
    #{
        exp => 929,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 37 ->
    #{
        exp => 940,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 38 ->
    #{
        exp => 948,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 39 ->
    #{
        exp => 958,
        dice_reward => 201003,
        dice_max_reward => 201103,
        dice_min_reward => 201203,
        comment_like_reward => 202003,
        comment_dislike_reward => 202103,
        quiz_succ_reward => 200003,
        quiz_fail_reward => 200103    };
get(Lv) when Lv =< 40 ->
    #{
        exp => 970,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 41 ->
    #{
        exp => 983,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 42 ->
    #{
        exp => 995,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 43 ->
    #{
        exp => 1008,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 44 ->
    #{
        exp => 1021,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 45 ->
    #{
        exp => 1037,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 46 ->
    #{
        exp => 1054,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 47 ->
    #{
        exp => 1072,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 48 ->
    #{
        exp => 1089,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 49 ->
    #{
        exp => 1106,
        dice_reward => 201004,
        dice_max_reward => 201104,
        dice_min_reward => 201204,
        comment_like_reward => 202004,
        comment_dislike_reward => 202104,
        quiz_succ_reward => 200004,
        quiz_fail_reward => 200104    };
get(Lv) when Lv =< 50 ->
    #{
        exp => 1128,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 51 ->
    #{
        exp => 1150,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 52 ->
    #{
        exp => 1172,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 53 ->
    #{
        exp => 1193,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 54 ->
    #{
        exp => 1217,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 55 ->
    #{
        exp => 1243,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 56 ->
    #{
        exp => 1269,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 57 ->
    #{
        exp => 1296,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 58 ->
    #{
        exp => 1322,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 59 ->
    #{
        exp => 1350,
        dice_reward => 201005,
        dice_max_reward => 201105,
        dice_min_reward => 201205,
        comment_like_reward => 202005,
        comment_dislike_reward => 202105,
        quiz_succ_reward => 200005,
        quiz_fail_reward => 200105    };
get(Lv) when Lv =< 60 ->
    #{
        exp => 1383,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 61 ->
    #{
        exp => 1417,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 62 ->
    #{
        exp => 1451,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 63 ->
    #{
        exp => 1485,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 64 ->
    #{
        exp => 1518,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 65 ->
    #{
        exp => 1559,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 66 ->
    #{
        exp => 1601,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 67 ->
    #{
        exp => 1641,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 68 ->
    #{
        exp => 1682,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 69 ->
    #{
        exp => 1723,
        dice_reward => 201006,
        dice_max_reward => 201106,
        dice_min_reward => 201206,
        comment_like_reward => 202006,
        comment_dislike_reward => 202106,
        quiz_succ_reward => 200006,
        quiz_fail_reward => 200106    };
get(Lv) when Lv =< 70 ->
    #{
        exp => 1773,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 71 ->
    #{
        exp => 1824,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 72 ->
    #{
        exp => 1875,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 73 ->
    #{
        exp => 1926,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 74 ->
    #{
        exp => 1976,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 75 ->
    #{
        exp => 2036,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 76 ->
    #{
        exp => 2097,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 77 ->
    #{
        exp => 2158,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 78 ->
    #{
        exp => 2217,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 79 ->
    #{
        exp => 2278,
        dice_reward => 201007,
        dice_max_reward => 201107,
        dice_min_reward => 201207,
        comment_like_reward => 202007,
        comment_dislike_reward => 202107,
        quiz_succ_reward => 200007,
        quiz_fail_reward => 200107    };
get(Lv) when Lv =< 80 ->
    #{
        exp => 2359,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 81 ->
    #{
        exp => 2442,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 82 ->
    #{
        exp => 2523,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 83 ->
    #{
        exp => 2606,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 84 ->
    #{
        exp => 2687,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 85 ->
    #{
        exp => 2790,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 86 ->
    #{
        exp => 2894,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 87 ->
    #{
        exp => 2997,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 88 ->
    #{
        exp => 3100,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 89 ->
    #{
        exp => 3205,
        dice_reward => 201008,
        dice_max_reward => 201108,
        dice_min_reward => 201208,
        comment_like_reward => 202008,
        comment_dislike_reward => 202108,
        quiz_succ_reward => 200008,
        quiz_fail_reward => 200108    };
get(Lv) when Lv =< 90 ->
    #{
        exp => 3336,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 91 ->
    #{
        exp => 3470,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 92 ->
    #{
        exp => 3603,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 93 ->
    #{
        exp => 3735,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 94 ->
    #{
        exp => 3869,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 95 ->
    #{
        exp => 4032,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 96 ->
    #{
        exp => 4196,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 97 ->
    #{
        exp => 4360,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 98 ->
    #{
        exp => 4525,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(Lv) when Lv =< 99 ->
    #{
        exp => 4689,
        dice_reward => 201009,
        dice_max_reward => 201109,
        dice_min_reward => 201209,
        comment_like_reward => 202009,
        comment_dislike_reward => 202109,
        quiz_succ_reward => 200009,
        quiz_fail_reward => 200109    };
get(_Lv) ->
    undefined.
