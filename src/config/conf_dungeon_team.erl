%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dungeon_team
%% @Brief  : 组队关卡
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dungeon_team).

-export([
    get/1,
    get_ids/0
]).

get({700, Lv}) when Lv >= 90 ->
    #{
        id => 700,
        avg_lv => 90,
        dung_lv => 10        
    };
get({700, Lv}) when Lv >= 80 ->
    #{
        id => 700,
        avg_lv => 80,
        dung_lv => 9        
    };
get({700, Lv}) when Lv >= 70 ->
    #{
        id => 700,
        avg_lv => 70,
        dung_lv => 8        
    };
get({700, Lv}) when Lv >= 60 ->
    #{
        id => 700,
        avg_lv => 60,
        dung_lv => 7        
    };
get({700, Lv}) when Lv >= 50 ->
    #{
        id => 700,
        avg_lv => 50,
        dung_lv => 6        
    };
get({700, Lv}) when Lv >= 40 ->
    #{
        id => 700,
        avg_lv => 40,
        dung_lv => 5        
    };
get({700, Lv}) when Lv >= 30 ->
    #{
        id => 700,
        avg_lv => 30,
        dung_lv => 4        
    };
get({700, Lv}) when Lv >= 20 ->
    #{
        id => 700,
        avg_lv => 20,
        dung_lv => 3        
    };
get({700, Lv}) when Lv >= 10 ->
    #{
        id => 700,
        avg_lv => 10,
        dung_lv => 2        
    };
get({700, Lv}) when Lv >= 1 ->
    #{
        id => 700,
        avg_lv => 1,
        dung_lv => 1        
    };
get({800, Lv}) when Lv >= 90 ->
    #{
        id => 800,
        avg_lv => 90,
        dung_lv => 10        
    };
get({800, Lv}) when Lv >= 80 ->
    #{
        id => 800,
        avg_lv => 80,
        dung_lv => 9        
    };
get({800, Lv}) when Lv >= 70 ->
    #{
        id => 800,
        avg_lv => 70,
        dung_lv => 8        
    };
get({800, Lv}) when Lv >= 60 ->
    #{
        id => 800,
        avg_lv => 60,
        dung_lv => 7        
    };
get({800, Lv}) when Lv >= 50 ->
    #{
        id => 800,
        avg_lv => 50,
        dung_lv => 6        
    };
get({800, Lv}) when Lv >= 40 ->
    #{
        id => 800,
        avg_lv => 40,
        dung_lv => 5        
    };
get({800, Lv}) when Lv >= 30 ->
    #{
        id => 800,
        avg_lv => 30,
        dung_lv => 4        
    };
get({800, Lv}) when Lv >= 20 ->
    #{
        id => 800,
        avg_lv => 20,
        dung_lv => 3        
    };
get({800, Lv}) when Lv >= 10 ->
    #{
        id => 800,
        avg_lv => 10,
        dung_lv => 2        
    };
get({800, Lv}) when Lv >= 1 ->
    #{
        id => 800,
        avg_lv => 1,
        dung_lv => 1        
    };
get({900, Lv}) when Lv >= 90 ->
    #{
        id => 900,
        avg_lv => 90,
        dung_lv => 10        
    };
get({900, Lv}) when Lv >= 80 ->
    #{
        id => 900,
        avg_lv => 80,
        dung_lv => 9        
    };
get({900, Lv}) when Lv >= 70 ->
    #{
        id => 900,
        avg_lv => 70,
        dung_lv => 8        
    };
get({900, Lv}) when Lv >= 60 ->
    #{
        id => 900,
        avg_lv => 60,
        dung_lv => 7        
    };
get({900, Lv}) when Lv >= 50 ->
    #{
        id => 900,
        avg_lv => 50,
        dung_lv => 6        
    };
get({900, Lv}) when Lv >= 40 ->
    #{
        id => 900,
        avg_lv => 40,
        dung_lv => 5        
    };
get({900, Lv}) when Lv >= 30 ->
    #{
        id => 900,
        avg_lv => 30,
        dung_lv => 4        
    };
get({900, Lv}) when Lv >= 20 ->
    #{
        id => 900,
        avg_lv => 20,
        dung_lv => 3        
    };
get({900, Lv}) when Lv >= 10 ->
    #{
        id => 900,
        avg_lv => 10,
        dung_lv => 2        
    };
get({900, Lv}) when Lv >= 1 ->
    #{
        id => 900,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1000, Lv}) when Lv >= 90 ->
    #{
        id => 1000,
        avg_lv => 90,
        dung_lv => 10        
    };
get({1000, Lv}) when Lv >= 80 ->
    #{
        id => 1000,
        avg_lv => 80,
        dung_lv => 9        
    };
get({1000, Lv}) when Lv >= 70 ->
    #{
        id => 1000,
        avg_lv => 70,
        dung_lv => 8        
    };
get({1000, Lv}) when Lv >= 60 ->
    #{
        id => 1000,
        avg_lv => 60,
        dung_lv => 7        
    };
get({1000, Lv}) when Lv >= 50 ->
    #{
        id => 1000,
        avg_lv => 50,
        dung_lv => 6        
    };
get({1000, Lv}) when Lv >= 40 ->
    #{
        id => 1000,
        avg_lv => 40,
        dung_lv => 5        
    };
get({1000, Lv}) when Lv >= 30 ->
    #{
        id => 1000,
        avg_lv => 30,
        dung_lv => 4        
    };
get({1000, Lv}) when Lv >= 20 ->
    #{
        id => 1000,
        avg_lv => 20,
        dung_lv => 3        
    };
get({1000, Lv}) when Lv >= 10 ->
    #{
        id => 1000,
        avg_lv => 10,
        dung_lv => 2        
    };
get({1000, Lv}) when Lv >= 1 ->
    #{
        id => 1000,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1100, Lv}) when Lv >= 90 ->
    #{
        id => 1100,
        avg_lv => 90,
        dung_lv => 9        
    };
get({1100, Lv}) when Lv >= 80 ->
    #{
        id => 1100,
        avg_lv => 80,
        dung_lv => 8        
    };
get({1100, Lv}) when Lv >= 70 ->
    #{
        id => 1100,
        avg_lv => 70,
        dung_lv => 7        
    };
get({1100, Lv}) when Lv >= 60 ->
    #{
        id => 1100,
        avg_lv => 60,
        dung_lv => 6        
    };
get({1100, Lv}) when Lv >= 50 ->
    #{
        id => 1100,
        avg_lv => 50,
        dung_lv => 5        
    };
get({1100, Lv}) when Lv >= 40 ->
    #{
        id => 1100,
        avg_lv => 40,
        dung_lv => 4        
    };
get({1100, Lv}) when Lv >= 30 ->
    #{
        id => 1100,
        avg_lv => 30,
        dung_lv => 3        
    };
get({1100, Lv}) when Lv >= 20 ->
    #{
        id => 1100,
        avg_lv => 20,
        dung_lv => 2        
    };
get({1100, Lv}) when Lv >= 10 ->
    #{
        id => 1100,
        avg_lv => 10,
        dung_lv => 1        
    };
get({1150, Lv}) when Lv >= 90 ->
    #{
        id => 1150,
        avg_lv => 90,
        dung_lv => 9        
    };
get({1150, Lv}) when Lv >= 80 ->
    #{
        id => 1150,
        avg_lv => 80,
        dung_lv => 8        
    };
get({1150, Lv}) when Lv >= 70 ->
    #{
        id => 1150,
        avg_lv => 70,
        dung_lv => 7        
    };
get({1150, Lv}) when Lv >= 60 ->
    #{
        id => 1150,
        avg_lv => 60,
        dung_lv => 6        
    };
get({1150, Lv}) when Lv >= 50 ->
    #{
        id => 1150,
        avg_lv => 50,
        dung_lv => 5        
    };
get({1150, Lv}) when Lv >= 40 ->
    #{
        id => 1150,
        avg_lv => 40,
        dung_lv => 4        
    };
get({1150, Lv}) when Lv >= 30 ->
    #{
        id => 1150,
        avg_lv => 30,
        dung_lv => 3        
    };
get({1150, Lv}) when Lv >= 20 ->
    #{
        id => 1150,
        avg_lv => 20,
        dung_lv => 2        
    };
get({1150, Lv}) when Lv >= 10 ->
    #{
        id => 1150,
        avg_lv => 10,
        dung_lv => 1        
    };
get({1200, Lv}) when Lv >= 99 ->
    #{
        id => 1200,
        avg_lv => 99,
        dung_lv => 99        
    };
get({1200, Lv}) when Lv >= 98 ->
    #{
        id => 1200,
        avg_lv => 98,
        dung_lv => 98        
    };
get({1200, Lv}) when Lv >= 97 ->
    #{
        id => 1200,
        avg_lv => 97,
        dung_lv => 97        
    };
get({1200, Lv}) when Lv >= 96 ->
    #{
        id => 1200,
        avg_lv => 96,
        dung_lv => 96        
    };
get({1200, Lv}) when Lv >= 95 ->
    #{
        id => 1200,
        avg_lv => 95,
        dung_lv => 95        
    };
get({1200, Lv}) when Lv >= 94 ->
    #{
        id => 1200,
        avg_lv => 94,
        dung_lv => 94        
    };
get({1200, Lv}) when Lv >= 93 ->
    #{
        id => 1200,
        avg_lv => 93,
        dung_lv => 93        
    };
get({1200, Lv}) when Lv >= 92 ->
    #{
        id => 1200,
        avg_lv => 92,
        dung_lv => 92        
    };
get({1200, Lv}) when Lv >= 91 ->
    #{
        id => 1200,
        avg_lv => 91,
        dung_lv => 91        
    };
get({1200, Lv}) when Lv >= 90 ->
    #{
        id => 1200,
        avg_lv => 90,
        dung_lv => 90        
    };
get({1200, Lv}) when Lv >= 89 ->
    #{
        id => 1200,
        avg_lv => 89,
        dung_lv => 89        
    };
get({1200, Lv}) when Lv >= 88 ->
    #{
        id => 1200,
        avg_lv => 88,
        dung_lv => 88        
    };
get({1200, Lv}) when Lv >= 87 ->
    #{
        id => 1200,
        avg_lv => 87,
        dung_lv => 87        
    };
get({1200, Lv}) when Lv >= 86 ->
    #{
        id => 1200,
        avg_lv => 86,
        dung_lv => 86        
    };
get({1200, Lv}) when Lv >= 85 ->
    #{
        id => 1200,
        avg_lv => 85,
        dung_lv => 85        
    };
get({1200, Lv}) when Lv >= 84 ->
    #{
        id => 1200,
        avg_lv => 84,
        dung_lv => 84        
    };
get({1200, Lv}) when Lv >= 83 ->
    #{
        id => 1200,
        avg_lv => 83,
        dung_lv => 83        
    };
get({1200, Lv}) when Lv >= 82 ->
    #{
        id => 1200,
        avg_lv => 82,
        dung_lv => 82        
    };
get({1200, Lv}) when Lv >= 81 ->
    #{
        id => 1200,
        avg_lv => 81,
        dung_lv => 81        
    };
get({1200, Lv}) when Lv >= 80 ->
    #{
        id => 1200,
        avg_lv => 80,
        dung_lv => 80        
    };
get({1200, Lv}) when Lv >= 79 ->
    #{
        id => 1200,
        avg_lv => 79,
        dung_lv => 79        
    };
get({1200, Lv}) when Lv >= 78 ->
    #{
        id => 1200,
        avg_lv => 78,
        dung_lv => 78        
    };
get({1200, Lv}) when Lv >= 77 ->
    #{
        id => 1200,
        avg_lv => 77,
        dung_lv => 77        
    };
get({1200, Lv}) when Lv >= 76 ->
    #{
        id => 1200,
        avg_lv => 76,
        dung_lv => 76        
    };
get({1200, Lv}) when Lv >= 75 ->
    #{
        id => 1200,
        avg_lv => 75,
        dung_lv => 75        
    };
get({1200, Lv}) when Lv >= 74 ->
    #{
        id => 1200,
        avg_lv => 74,
        dung_lv => 74        
    };
get({1200, Lv}) when Lv >= 73 ->
    #{
        id => 1200,
        avg_lv => 73,
        dung_lv => 73        
    };
get({1200, Lv}) when Lv >= 72 ->
    #{
        id => 1200,
        avg_lv => 72,
        dung_lv => 72        
    };
get({1200, Lv}) when Lv >= 71 ->
    #{
        id => 1200,
        avg_lv => 71,
        dung_lv => 71        
    };
get({1200, Lv}) when Lv >= 70 ->
    #{
        id => 1200,
        avg_lv => 70,
        dung_lv => 70        
    };
get({1200, Lv}) when Lv >= 69 ->
    #{
        id => 1200,
        avg_lv => 69,
        dung_lv => 69        
    };
get({1200, Lv}) when Lv >= 68 ->
    #{
        id => 1200,
        avg_lv => 68,
        dung_lv => 68        
    };
get({1200, Lv}) when Lv >= 67 ->
    #{
        id => 1200,
        avg_lv => 67,
        dung_lv => 67        
    };
get({1200, Lv}) when Lv >= 66 ->
    #{
        id => 1200,
        avg_lv => 66,
        dung_lv => 66        
    };
get({1200, Lv}) when Lv >= 65 ->
    #{
        id => 1200,
        avg_lv => 65,
        dung_lv => 65        
    };
get({1200, Lv}) when Lv >= 64 ->
    #{
        id => 1200,
        avg_lv => 64,
        dung_lv => 64        
    };
get({1200, Lv}) when Lv >= 63 ->
    #{
        id => 1200,
        avg_lv => 63,
        dung_lv => 63        
    };
get({1200, Lv}) when Lv >= 62 ->
    #{
        id => 1200,
        avg_lv => 62,
        dung_lv => 62        
    };
get({1200, Lv}) when Lv >= 61 ->
    #{
        id => 1200,
        avg_lv => 61,
        dung_lv => 61        
    };
get({1200, Lv}) when Lv >= 60 ->
    #{
        id => 1200,
        avg_lv => 60,
        dung_lv => 60        
    };
get({1200, Lv}) when Lv >= 59 ->
    #{
        id => 1200,
        avg_lv => 59,
        dung_lv => 59        
    };
get({1200, Lv}) when Lv >= 58 ->
    #{
        id => 1200,
        avg_lv => 58,
        dung_lv => 58        
    };
get({1200, Lv}) when Lv >= 57 ->
    #{
        id => 1200,
        avg_lv => 57,
        dung_lv => 57        
    };
get({1200, Lv}) when Lv >= 56 ->
    #{
        id => 1200,
        avg_lv => 56,
        dung_lv => 56        
    };
get({1200, Lv}) when Lv >= 55 ->
    #{
        id => 1200,
        avg_lv => 55,
        dung_lv => 55        
    };
get({1200, Lv}) when Lv >= 54 ->
    #{
        id => 1200,
        avg_lv => 54,
        dung_lv => 54        
    };
get({1200, Lv}) when Lv >= 53 ->
    #{
        id => 1200,
        avg_lv => 53,
        dung_lv => 53        
    };
get({1200, Lv}) when Lv >= 52 ->
    #{
        id => 1200,
        avg_lv => 52,
        dung_lv => 52        
    };
get({1200, Lv}) when Lv >= 51 ->
    #{
        id => 1200,
        avg_lv => 51,
        dung_lv => 51        
    };
get({1200, Lv}) when Lv >= 50 ->
    #{
        id => 1200,
        avg_lv => 50,
        dung_lv => 50        
    };
get({1200, Lv}) when Lv >= 49 ->
    #{
        id => 1200,
        avg_lv => 49,
        dung_lv => 49        
    };
get({1200, Lv}) when Lv >= 48 ->
    #{
        id => 1200,
        avg_lv => 48,
        dung_lv => 48        
    };
get({1200, Lv}) when Lv >= 47 ->
    #{
        id => 1200,
        avg_lv => 47,
        dung_lv => 47        
    };
get({1200, Lv}) when Lv >= 46 ->
    #{
        id => 1200,
        avg_lv => 46,
        dung_lv => 46        
    };
get({1200, Lv}) when Lv >= 45 ->
    #{
        id => 1200,
        avg_lv => 45,
        dung_lv => 45        
    };
get({1200, Lv}) when Lv >= 44 ->
    #{
        id => 1200,
        avg_lv => 44,
        dung_lv => 44        
    };
get({1200, Lv}) when Lv >= 43 ->
    #{
        id => 1200,
        avg_lv => 43,
        dung_lv => 43        
    };
get({1200, Lv}) when Lv >= 42 ->
    #{
        id => 1200,
        avg_lv => 42,
        dung_lv => 42        
    };
get({1200, Lv}) when Lv >= 41 ->
    #{
        id => 1200,
        avg_lv => 41,
        dung_lv => 41        
    };
get({1200, Lv}) when Lv >= 40 ->
    #{
        id => 1200,
        avg_lv => 40,
        dung_lv => 40        
    };
get({1200, Lv}) when Lv >= 39 ->
    #{
        id => 1200,
        avg_lv => 39,
        dung_lv => 39        
    };
get({1200, Lv}) when Lv >= 38 ->
    #{
        id => 1200,
        avg_lv => 38,
        dung_lv => 38        
    };
get({1200, Lv}) when Lv >= 37 ->
    #{
        id => 1200,
        avg_lv => 37,
        dung_lv => 37        
    };
get({1200, Lv}) when Lv >= 36 ->
    #{
        id => 1200,
        avg_lv => 36,
        dung_lv => 36        
    };
get({1200, Lv}) when Lv >= 35 ->
    #{
        id => 1200,
        avg_lv => 35,
        dung_lv => 35        
    };
get({1200, Lv}) when Lv >= 34 ->
    #{
        id => 1200,
        avg_lv => 34,
        dung_lv => 34        
    };
get({1200, Lv}) when Lv >= 33 ->
    #{
        id => 1200,
        avg_lv => 33,
        dung_lv => 33        
    };
get({1200, Lv}) when Lv >= 32 ->
    #{
        id => 1200,
        avg_lv => 32,
        dung_lv => 32        
    };
get({1200, Lv}) when Lv >= 31 ->
    #{
        id => 1200,
        avg_lv => 31,
        dung_lv => 31        
    };
get({1200, Lv}) when Lv >= 30 ->
    #{
        id => 1200,
        avg_lv => 30,
        dung_lv => 30        
    };
get({1200, Lv}) when Lv >= 29 ->
    #{
        id => 1200,
        avg_lv => 29,
        dung_lv => 29        
    };
get({1200, Lv}) when Lv >= 28 ->
    #{
        id => 1200,
        avg_lv => 28,
        dung_lv => 28        
    };
get({1200, Lv}) when Lv >= 27 ->
    #{
        id => 1200,
        avg_lv => 27,
        dung_lv => 27        
    };
get({1200, Lv}) when Lv >= 26 ->
    #{
        id => 1200,
        avg_lv => 26,
        dung_lv => 26        
    };
get({1200, Lv}) when Lv >= 25 ->
    #{
        id => 1200,
        avg_lv => 25,
        dung_lv => 25        
    };
get({1200, Lv}) when Lv >= 24 ->
    #{
        id => 1200,
        avg_lv => 24,
        dung_lv => 24        
    };
get({1200, Lv}) when Lv >= 23 ->
    #{
        id => 1200,
        avg_lv => 23,
        dung_lv => 23        
    };
get({1200, Lv}) when Lv >= 22 ->
    #{
        id => 1200,
        avg_lv => 22,
        dung_lv => 22        
    };
get({1200, Lv}) when Lv >= 21 ->
    #{
        id => 1200,
        avg_lv => 21,
        dung_lv => 21        
    };
get({1200, Lv}) when Lv >= 20 ->
    #{
        id => 1200,
        avg_lv => 20,
        dung_lv => 20        
    };
get({1200, Lv}) when Lv >= 19 ->
    #{
        id => 1200,
        avg_lv => 19,
        dung_lv => 19        
    };
get({1200, Lv}) when Lv >= 18 ->
    #{
        id => 1200,
        avg_lv => 18,
        dung_lv => 18        
    };
get({1200, Lv}) when Lv >= 17 ->
    #{
        id => 1200,
        avg_lv => 17,
        dung_lv => 17        
    };
get({1200, Lv}) when Lv >= 16 ->
    #{
        id => 1200,
        avg_lv => 16,
        dung_lv => 16        
    };
get({1200, Lv}) when Lv >= 15 ->
    #{
        id => 1200,
        avg_lv => 15,
        dung_lv => 15        
    };
get({1200, Lv}) when Lv >= 14 ->
    #{
        id => 1200,
        avg_lv => 14,
        dung_lv => 14        
    };
get({1200, Lv}) when Lv >= 13 ->
    #{
        id => 1200,
        avg_lv => 13,
        dung_lv => 13        
    };
get({1200, Lv}) when Lv >= 12 ->
    #{
        id => 1200,
        avg_lv => 12,
        dung_lv => 12        
    };
get({1200, Lv}) when Lv >= 11 ->
    #{
        id => 1200,
        avg_lv => 11,
        dung_lv => 11        
    };
get({1200, Lv}) when Lv >= 10 ->
    #{
        id => 1200,
        avg_lv => 10,
        dung_lv => 10        
    };
get({1200, Lv}) when Lv >= 1 ->
    #{
        id => 1200,
        avg_lv => 1,
        dung_lv => 10        
    };
get({1400, Lv}) when Lv >= 90 ->
    #{
        id => 1400,
        avg_lv => 90,
        dung_lv => 3        
    };
get({1400, Lv}) when Lv >= 80 ->
    #{
        id => 1400,
        avg_lv => 80,
        dung_lv => 2        
    };
get({1400, Lv}) when Lv >= 1 ->
    #{
        id => 1400,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1500, Lv}) when Lv >= 90 ->
    #{
        id => 1500,
        avg_lv => 90,
        dung_lv => 3        
    };
get({1500, Lv}) when Lv >= 80 ->
    #{
        id => 1500,
        avg_lv => 80,
        dung_lv => 2        
    };
get({1500, Lv}) when Lv >= 1 ->
    #{
        id => 1500,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1600, Lv}) when Lv >= 90 ->
    #{
        id => 1600,
        avg_lv => 90,
        dung_lv => 3        
    };
get({1600, Lv}) when Lv >= 80 ->
    #{
        id => 1600,
        avg_lv => 80,
        dung_lv => 2        
    };
get({1600, Lv}) when Lv >= 1 ->
    #{
        id => 1600,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1700, Lv}) when Lv >= 90 ->
    #{
        id => 1700,
        avg_lv => 90,
        dung_lv => 3        
    };
get({1700, Lv}) when Lv >= 80 ->
    #{
        id => 1700,
        avg_lv => 80,
        dung_lv => 2        
    };
get({1700, Lv}) when Lv >= 1 ->
    #{
        id => 1700,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1800, Lv}) when Lv >= 90 ->
    #{
        id => 1800,
        avg_lv => 90,
        dung_lv => 10        
    };
get({1800, Lv}) when Lv >= 80 ->
    #{
        id => 1800,
        avg_lv => 80,
        dung_lv => 9        
    };
get({1800, Lv}) when Lv >= 70 ->
    #{
        id => 1800,
        avg_lv => 70,
        dung_lv => 8        
    };
get({1800, Lv}) when Lv >= 60 ->
    #{
        id => 1800,
        avg_lv => 60,
        dung_lv => 7        
    };
get({1800, Lv}) when Lv >= 50 ->
    #{
        id => 1800,
        avg_lv => 50,
        dung_lv => 6        
    };
get({1800, Lv}) when Lv >= 40 ->
    #{
        id => 1800,
        avg_lv => 40,
        dung_lv => 5        
    };
get({1800, Lv}) when Lv >= 30 ->
    #{
        id => 1800,
        avg_lv => 30,
        dung_lv => 4        
    };
get({1800, Lv}) when Lv >= 20 ->
    #{
        id => 1800,
        avg_lv => 20,
        dung_lv => 3        
    };
get({1800, Lv}) when Lv >= 10 ->
    #{
        id => 1800,
        avg_lv => 10,
        dung_lv => 2        
    };
get({1800, Lv}) when Lv >= 1 ->
    #{
        id => 1800,
        avg_lv => 1,
        dung_lv => 1        
    };
get({1900, Lv}) when Lv >= 90 ->
    #{
        id => 1900,
        avg_lv => 90,
        dung_lv => 10        
    };
get({1900, Lv}) when Lv >= 80 ->
    #{
        id => 1900,
        avg_lv => 80,
        dung_lv => 9        
    };
get({1900, Lv}) when Lv >= 70 ->
    #{
        id => 1900,
        avg_lv => 70,
        dung_lv => 8        
    };
get({1900, Lv}) when Lv >= 60 ->
    #{
        id => 1900,
        avg_lv => 60,
        dung_lv => 7        
    };
get({1900, Lv}) when Lv >= 50 ->
    #{
        id => 1900,
        avg_lv => 50,
        dung_lv => 6        
    };
get({1900, Lv}) when Lv >= 40 ->
    #{
        id => 1900,
        avg_lv => 40,
        dung_lv => 5        
    };
get({1900, Lv}) when Lv >= 30 ->
    #{
        id => 1900,
        avg_lv => 30,
        dung_lv => 4        
    };
get({1900, Lv}) when Lv >= 20 ->
    #{
        id => 1900,
        avg_lv => 20,
        dung_lv => 3        
    };
get({1900, Lv}) when Lv >= 10 ->
    #{
        id => 1900,
        avg_lv => 10,
        dung_lv => 2        
    };
get({1900, Lv}) when Lv >= 1 ->
    #{
        id => 1900,
        avg_lv => 1,
        dung_lv => 1        
    };
get({2000, Lv}) when Lv >= 90 ->
    #{
        id => 2000,
        avg_lv => 90,
        dung_lv => 10        
    };
get({2000, Lv}) when Lv >= 80 ->
    #{
        id => 2000,
        avg_lv => 80,
        dung_lv => 9        
    };
get({2000, Lv}) when Lv >= 70 ->
    #{
        id => 2000,
        avg_lv => 70,
        dung_lv => 8        
    };
get({2000, Lv}) when Lv >= 60 ->
    #{
        id => 2000,
        avg_lv => 60,
        dung_lv => 7        
    };
get({2000, Lv}) when Lv >= 50 ->
    #{
        id => 2000,
        avg_lv => 50,
        dung_lv => 6        
    };
get({2000, Lv}) when Lv >= 40 ->
    #{
        id => 2000,
        avg_lv => 40,
        dung_lv => 5        
    };
get({2000, Lv}) when Lv >= 30 ->
    #{
        id => 2000,
        avg_lv => 30,
        dung_lv => 4        
    };
get({2000, Lv}) when Lv >= 20 ->
    #{
        id => 2000,
        avg_lv => 20,
        dung_lv => 3        
    };
get({2000, Lv}) when Lv >= 10 ->
    #{
        id => 2000,
        avg_lv => 10,
        dung_lv => 2        
    };
get({2000, Lv}) when Lv >= 1 ->
    #{
        id => 2000,
        avg_lv => 1,
        dung_lv => 1        
    };
get({2100, Lv}) when Lv >= 90 ->
    #{
        id => 2100,
        avg_lv => 90,
        dung_lv => 10        
    };
get({2100, Lv}) when Lv >= 80 ->
    #{
        id => 2100,
        avg_lv => 80,
        dung_lv => 9        
    };
get({2100, Lv}) when Lv >= 70 ->
    #{
        id => 2100,
        avg_lv => 70,
        dung_lv => 8        
    };
get({2100, Lv}) when Lv >= 60 ->
    #{
        id => 2100,
        avg_lv => 60,
        dung_lv => 7        
    };
get({2100, Lv}) when Lv >= 50 ->
    #{
        id => 2100,
        avg_lv => 50,
        dung_lv => 6        
    };
get({2100, Lv}) when Lv >= 40 ->
    #{
        id => 2100,
        avg_lv => 40,
        dung_lv => 5        
    };
get({2100, Lv}) when Lv >= 30 ->
    #{
        id => 2100,
        avg_lv => 30,
        dung_lv => 4        
    };
get({2100, Lv}) when Lv >= 20 ->
    #{
        id => 2100,
        avg_lv => 20,
        dung_lv => 3        
    };
get({2100, Lv}) when Lv >= 10 ->
    #{
        id => 2100,
        avg_lv => 10,
        dung_lv => 2        
    };
get({2100, Lv}) when Lv >= 1 ->
    #{
        id => 2100,
        avg_lv => 1,
        dung_lv => 1        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{700, 1}, {700, 10}, {700, 20}, {700, 30}, {700, 40}, {700, 50}, {700, 60}, {700, 70}, {700, 80}, {700, 90}, {800, 1}, {800, 10}, {800, 20}, {800, 30}, {800, 40}, {800, 50}, {800, 60}, {800, 70}, {800, 80}, {800, 90}, {900, 1}, {900, 10}, {900, 20}, {900, 30}, {900, 40}, {900, 50}, {900, 60}, {900, 70}, {900, 80}, {900, 90}, {1000, 1}, {1000, 10}, {1000, 20}, {1000, 30}, {1000, 40}, {1000, 50}, {1000, 60}, {1000, 70}, {1000, 80}, {1000, 90}, {1100, 10}, {1100, 20}, {1100, 30}, {1100, 40}, {1100, 50}, {1100, 60}, {1100, 70}, {1100, 80}, {1100, 90}, {1150, 10}, {1150, 20}, {1150, 30}, {1150, 40}, {1150, 50}, {1150, 60}, {1150, 70}, {1150, 80}, {1150, 90}, {1200, 1}, {1200, 10}, {1200, 11}, {1200, 12}, {1200, 13}, {1200, 14}, {1200, 15}, {1200, 16}, {1200, 17}, {1200, 18}, {1200, 19}, {1200, 20}, {1200, 21}, {1200, 22}, {1200, 23}, {1200, 24}, {1200, 25}, {1200, 26}, {1200, 27}, {1200, 28}, {1200, 29}, {1200, 30}, {1200, 31}, {1200, 32}, {1200, 33}, {1200, 34}, {1200, 35}, {1200, 36}, {1200, 37}, {1200, 38}, {1200, 39}, {1200, 40}, {1200, 41}, {1200, 42}, {1200, 43}, {1200, 44}, {1200, 45}, {1200, 46}, {1200, 47}, {1200, 48}, {1200, 49}, {1200, 50}, {1200, 51}, {1200, 52}, {1200, 53}, {1200, 54}, {1200, 55}, {1200, 56}, {1200, 57}, {1200, 58}, {1200, 59}, {1200, 60}, {1200, 61}, {1200, 62}, {1200, 63}, {1200, 64}, {1200, 65}, {1200, 66}, {1200, 67}, {1200, 68}, {1200, 69}, {1200, 70}, {1200, 71}, {1200, 72}, {1200, 73}, {1200, 74}, {1200, 75}, {1200, 76}, {1200, 77}, {1200, 78}, {1200, 79}, {1200, 80}, {1200, 81}, {1200, 82}, {1200, 83}, {1200, 84}, {1200, 85}, {1200, 86}, {1200, 87}, {1200, 88}, {1200, 89}, {1200, 90}, {1200, 91}, {1200, 92}, {1200, 93}, {1200, 94}, {1200, 95}, {1200, 96}, {1200, 97}, {1200, 98}, {1200, 99}, {1400, 1}, {1400, 80}, {1400, 90}, {1500, 1}, {1500, 80}, {1500, 90}, {1600, 1}, {1600, 80}, {1600, 90}, {1700, 1}, {1700, 80}, {1700, 90}, {1800, 1}, {1800, 10}, {1800, 20}, {1800, 30}, {1800, 40}, {1800, 50}, {1800, 60}, {1800, 70}, {1800, 80}, {1800, 90}, {1900, 1}, {1900, 10}, {1900, 20}, {1900, 30}, {1900, 40}, {1900, 50}, {1900, 60}, {1900, 70}, {1900, 80}, {1900, 90}, {2000, 1}, {2000, 10}, {2000, 20}, {2000, 30}, {2000, 40}, {2000, 50}, {2000, 60}, {2000, 70}, {2000, 80}, {2000, 90}, {2100, 1}, {2100, 10}, {2100, 20}, {2100, 30}, {2100, 40}, {2100, 50}, {2100, 60}, {2100, 70}, {2100, 80}, {2100, 90}].
