%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_practice
%% @Brief  : 帮会修炼
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_practice).

-export([
    get/2,
    get_id_lvs/1,
    get_ids/0
]).

get(1, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{101,0}]
    };
get(1, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{101,100}]
    };
get(1, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{101,200}]
    };
get(1, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{101,300}]
    };
get(1, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{101,400}]
    };
get(1, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{101,500}]
    };
get(1, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{101,600}]
    };
get(1, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{101,700}]
    };
get(1, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{101,800}]
    };
get(1, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{101,900}]
    };
get(1, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{101,1000}]
    };
get(1, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{101,1100}]
    };
get(1, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{101,1200}]
    };
get(1, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{101,1300}]
    };
get(1, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{101,1400}]
    };
get(1, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{101,1500}]
    };
get(1, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{101,1600}]
    };
get(1, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{101,1700}]
    };
get(1, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{101,1800}]
    };
get(1, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{101,1900}]
    };
get(1, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{101,2000}]
    };
get(1, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{101,2125}]
    };
get(1, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{101,2250}]
    };
get(1, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{101,2375}]
    };
get(1, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{101,2500}]
    };
get(1, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{101,2625}]
    };
get(1, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{101,2750}]
    };
get(1, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{101,2875}]
    };
get(1, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{101,3000}]
    };
get(1, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{101,3125}]
    };
get(1, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{101,3250}]
    };
get(1, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{101,3375}]
    };
get(1, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{101,3500}]
    };
get(1, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{101,3625}]
    };
get(1, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{101,3750}]
    };
get(1, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{101,3875}]
    };
get(1, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{101,4000}]
    };
get(1, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{101,4125}]
    };
get(1, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{101,4250}]
    };
get(1, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{101,4375}]
    };
get(1, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{101,4500}]
    };
get(1, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{101,4625}]
    };
get(1, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{101,4750}]
    };
get(1, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{101,4875}]
    };
get(1, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{101,5000}]
    };
get(1, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{101,5125}]
    };
get(1, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{101,5250}]
    };
get(1, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{101,5375}]
    };
get(1, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{101,5500}]
    };
get(1, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{101,5625}]
    };
get(1, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{101,5750}]
    };
get(1, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{101,5925}]
    };
get(1, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{101,6100}]
    };
get(1, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{101,6275}]
    };
get(1, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{101,6450}]
    };
get(1, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{101,6625}]
    };
get(1, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{101,6800}]
    };
get(1, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{101,6975}]
    };
get(1, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{101,7150}]
    };
get(1, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{101,7325}]
    };
get(1, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{101,7500}]
    };
get(1, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{101,7675}]
    };
get(1, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{101,7850}]
    };
get(1, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{101,8025}]
    };
get(1, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{101,8200}]
    };
get(1, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{101,8375}]
    };
get(1, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{101,8550}]
    };
get(1, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{101,8725}]
    };
get(1, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{101,8900}]
    };
get(1, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{101,9075}]
    };
get(1, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{101,9250}]
    };
get(1, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{101,9425}]
    };
get(1, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{101,9600}]
    };
get(1, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{101,9775}]
    };
get(1, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{101,9950}]
    };
get(1, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{101,10125}]
    };
get(1, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{101,10300}]
    };
get(1, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{101,10475}]
    };
get(1, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{101,10650}]
    };
get(1, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{101,10825}]
    };
get(1, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{101,11000}]
    };
get(1, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{101,11200}]
    };
get(1, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{101,11400}]
    };
get(1, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{101,11600}]
    };
get(1, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{101,11800}]
    };
get(1, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{101,12000}]
    };
get(1, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{101,12200}]
    };
get(1, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{101,12400}]
    };
get(1, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{101,12600}]
    };
get(1, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{101,12800}]
    };
get(1, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{101,13000}]
    };
get(1, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{101,13200}]
    };
get(1, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{101,13400}]
    };
get(1, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{101,13600}]
    };
get(1, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{101,13800}]
    };
get(1, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{101,14000}]
    };
get(1, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{101,14200}]
    };
get(1, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{101,14400}]
    };
get(1, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{101,14600}]
    };
get(1, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{101,14800}]
    };
get(1, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{101,15000}]
    };
get(1, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{101,15200}]
    };
get(1, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{101,15400}]
    };
get(1, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{101,15600}]
    };
get(1, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{101,15800}]
    };
get(1, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{101,16000}]
    };
get(1, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{101,16200}]
    };
get(1, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{101,16400}]
    };
get(1, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{101,16600}]
    };
get(1, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{101,16800}]
    };
get(1, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{101,17000}]
    };
get(1, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{101,17200}]
    };
get(1, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{101,17400}]
    };
get(1, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{101,17600}]
    };
get(1, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{101,17800}]
    };
get(1, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{101,18000}]
    };
get(1, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{101,18200}]
    };
get(1, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{101,18400}]
    };
get(1, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{101,18600}]
    };
get(1, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{101,18800}]
    };
get(1, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{101,19000}]
    };
get(2, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{102,0}]
    };
get(2, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{102,100}]
    };
get(2, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{102,200}]
    };
get(2, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{102,300}]
    };
get(2, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{102,400}]
    };
get(2, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{102,500}]
    };
get(2, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{102,600}]
    };
get(2, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{102,700}]
    };
get(2, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{102,800}]
    };
get(2, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{102,900}]
    };
get(2, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{102,1000}]
    };
get(2, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{102,1100}]
    };
get(2, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{102,1200}]
    };
get(2, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{102,1300}]
    };
get(2, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{102,1400}]
    };
get(2, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{102,1500}]
    };
get(2, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{102,1600}]
    };
get(2, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{102,1700}]
    };
get(2, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{102,1800}]
    };
get(2, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{102,1900}]
    };
get(2, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{102,2000}]
    };
get(2, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{102,2125}]
    };
get(2, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{102,2250}]
    };
get(2, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{102,2375}]
    };
get(2, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{102,2500}]
    };
get(2, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{102,2625}]
    };
get(2, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{102,2750}]
    };
get(2, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{102,2875}]
    };
get(2, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{102,3000}]
    };
get(2, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{102,3125}]
    };
get(2, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{102,3250}]
    };
get(2, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{102,3375}]
    };
get(2, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{102,3500}]
    };
get(2, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{102,3625}]
    };
get(2, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{102,3750}]
    };
get(2, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{102,3875}]
    };
get(2, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{102,4000}]
    };
get(2, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{102,4125}]
    };
get(2, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{102,4250}]
    };
get(2, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{102,4375}]
    };
get(2, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{102,4500}]
    };
get(2, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{102,4625}]
    };
get(2, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{102,4750}]
    };
get(2, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{102,4875}]
    };
get(2, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{102,5000}]
    };
get(2, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{102,5125}]
    };
get(2, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{102,5250}]
    };
get(2, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{102,5375}]
    };
get(2, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{102,5500}]
    };
get(2, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{102,5625}]
    };
get(2, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{102,5750}]
    };
get(2, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{102,5925}]
    };
get(2, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{102,6100}]
    };
get(2, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{102,6275}]
    };
get(2, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{102,6450}]
    };
get(2, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{102,6625}]
    };
get(2, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{102,6800}]
    };
get(2, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{102,6975}]
    };
get(2, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{102,7150}]
    };
get(2, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{102,7325}]
    };
get(2, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{102,7500}]
    };
get(2, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{102,7675}]
    };
get(2, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{102,7850}]
    };
get(2, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{102,8025}]
    };
get(2, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{102,8200}]
    };
get(2, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{102,8375}]
    };
get(2, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{102,8550}]
    };
get(2, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{102,8725}]
    };
get(2, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{102,8900}]
    };
get(2, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{102,9075}]
    };
get(2, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{102,9250}]
    };
get(2, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{102,9425}]
    };
get(2, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{102,9600}]
    };
get(2, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{102,9775}]
    };
get(2, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{102,9950}]
    };
get(2, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{102,10125}]
    };
get(2, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{102,10300}]
    };
get(2, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{102,10475}]
    };
get(2, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{102,10650}]
    };
get(2, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{102,10825}]
    };
get(2, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{102,11000}]
    };
get(2, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{102,11200}]
    };
get(2, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{102,11400}]
    };
get(2, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{102,11600}]
    };
get(2, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{102,11800}]
    };
get(2, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{102,12000}]
    };
get(2, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{102,12200}]
    };
get(2, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{102,12400}]
    };
get(2, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{102,12600}]
    };
get(2, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{102,12800}]
    };
get(2, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{102,13000}]
    };
get(2, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{102,13200}]
    };
get(2, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{102,13400}]
    };
get(2, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{102,13600}]
    };
get(2, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{102,13800}]
    };
get(2, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{102,14000}]
    };
get(2, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{102,14200}]
    };
get(2, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{102,14400}]
    };
get(2, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{102,14600}]
    };
get(2, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{102,14800}]
    };
get(2, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{102,15000}]
    };
get(2, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{102,15200}]
    };
get(2, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{102,15400}]
    };
get(2, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{102,15600}]
    };
get(2, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{102,15800}]
    };
get(2, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{102,16000}]
    };
get(2, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{102,16200}]
    };
get(2, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{102,16400}]
    };
get(2, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{102,16600}]
    };
get(2, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{102,16800}]
    };
get(2, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{102,17000}]
    };
get(2, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{102,17200}]
    };
get(2, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{102,17400}]
    };
get(2, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{102,17600}]
    };
get(2, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{102,17800}]
    };
get(2, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{102,18000}]
    };
get(2, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{102,18200}]
    };
get(2, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{102,18400}]
    };
get(2, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{102,18600}]
    };
get(2, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{102,18800}]
    };
get(2, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{102,19000}]
    };
get(3, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{103,0}]
    };
get(3, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{103,100}]
    };
get(3, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{103,200}]
    };
get(3, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{103,300}]
    };
get(3, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{103,400}]
    };
get(3, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{103,500}]
    };
get(3, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{103,600}]
    };
get(3, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{103,700}]
    };
get(3, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{103,800}]
    };
get(3, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{103,900}]
    };
get(3, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{103,1000}]
    };
get(3, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{103,1100}]
    };
get(3, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{103,1200}]
    };
get(3, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{103,1300}]
    };
get(3, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{103,1400}]
    };
get(3, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{103,1500}]
    };
get(3, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{103,1600}]
    };
get(3, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{103,1700}]
    };
get(3, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{103,1800}]
    };
get(3, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{103,1900}]
    };
get(3, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{103,2000}]
    };
get(3, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{103,2125}]
    };
get(3, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{103,2250}]
    };
get(3, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{103,2375}]
    };
get(3, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{103,2500}]
    };
get(3, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{103,2625}]
    };
get(3, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{103,2750}]
    };
get(3, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{103,2875}]
    };
get(3, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{103,3000}]
    };
get(3, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{103,3125}]
    };
get(3, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{103,3250}]
    };
get(3, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{103,3375}]
    };
get(3, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{103,3500}]
    };
get(3, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{103,3625}]
    };
get(3, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{103,3750}]
    };
get(3, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{103,3875}]
    };
get(3, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{103,4000}]
    };
get(3, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{103,4125}]
    };
get(3, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{103,4250}]
    };
get(3, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{103,4375}]
    };
get(3, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{103,4500}]
    };
get(3, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{103,4625}]
    };
get(3, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{103,4750}]
    };
get(3, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{103,4875}]
    };
get(3, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{103,5000}]
    };
get(3, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{103,5125}]
    };
get(3, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{103,5250}]
    };
get(3, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{103,5375}]
    };
get(3, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{103,5500}]
    };
get(3, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{103,5625}]
    };
get(3, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{103,5750}]
    };
get(3, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{103,5925}]
    };
get(3, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{103,6100}]
    };
get(3, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{103,6275}]
    };
get(3, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{103,6450}]
    };
get(3, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{103,6625}]
    };
get(3, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{103,6800}]
    };
get(3, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{103,6975}]
    };
get(3, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{103,7150}]
    };
get(3, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{103,7325}]
    };
get(3, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{103,7500}]
    };
get(3, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{103,7675}]
    };
get(3, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{103,7850}]
    };
get(3, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{103,8025}]
    };
get(3, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{103,8200}]
    };
get(3, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{103,8375}]
    };
get(3, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{103,8550}]
    };
get(3, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{103,8725}]
    };
get(3, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{103,8900}]
    };
get(3, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{103,9075}]
    };
get(3, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{103,9250}]
    };
get(3, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{103,9425}]
    };
get(3, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{103,9600}]
    };
get(3, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{103,9775}]
    };
get(3, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{103,9950}]
    };
get(3, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{103,10125}]
    };
get(3, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{103,10300}]
    };
get(3, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{103,10475}]
    };
get(3, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{103,10650}]
    };
get(3, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{103,10825}]
    };
get(3, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{103,11000}]
    };
get(3, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{103,11200}]
    };
get(3, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{103,11400}]
    };
get(3, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{103,11600}]
    };
get(3, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{103,11800}]
    };
get(3, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{103,12000}]
    };
get(3, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{103,12200}]
    };
get(3, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{103,12400}]
    };
get(3, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{103,12600}]
    };
get(3, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{103,12800}]
    };
get(3, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{103,13000}]
    };
get(3, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{103,13200}]
    };
get(3, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{103,13400}]
    };
get(3, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{103,13600}]
    };
get(3, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{103,13800}]
    };
get(3, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{103,14000}]
    };
get(3, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{103,14200}]
    };
get(3, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{103,14400}]
    };
get(3, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{103,14600}]
    };
get(3, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{103,14800}]
    };
get(3, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{103,15000}]
    };
get(3, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{103,15200}]
    };
get(3, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{103,15400}]
    };
get(3, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{103,15600}]
    };
get(3, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{103,15800}]
    };
get(3, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{103,16000}]
    };
get(3, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{103,16200}]
    };
get(3, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{103,16400}]
    };
get(3, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{103,16600}]
    };
get(3, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{103,16800}]
    };
get(3, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{103,17000}]
    };
get(3, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{103,17200}]
    };
get(3, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{103,17400}]
    };
get(3, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{103,17600}]
    };
get(3, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{103,17800}]
    };
get(3, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{103,18000}]
    };
get(3, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{103,18200}]
    };
get(3, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{103,18400}]
    };
get(3, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{103,18600}]
    };
get(3, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{103,18800}]
    };
get(3, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{103,19000}]
    };
get(4, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{104,0}]
    };
get(4, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{104,100}]
    };
get(4, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{104,200}]
    };
get(4, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{104,300}]
    };
get(4, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{104,400}]
    };
get(4, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{104,500}]
    };
get(4, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{104,600}]
    };
get(4, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{104,700}]
    };
get(4, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{104,800}]
    };
get(4, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{104,900}]
    };
get(4, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{104,1000}]
    };
get(4, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{104,1100}]
    };
get(4, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{104,1200}]
    };
get(4, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{104,1300}]
    };
get(4, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{104,1400}]
    };
get(4, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{104,1500}]
    };
get(4, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{104,1600}]
    };
get(4, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{104,1700}]
    };
get(4, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{104,1800}]
    };
get(4, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{104,1900}]
    };
get(4, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{104,2000}]
    };
get(4, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{104,2125}]
    };
get(4, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{104,2250}]
    };
get(4, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{104,2375}]
    };
get(4, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{104,2500}]
    };
get(4, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{104,2625}]
    };
get(4, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{104,2750}]
    };
get(4, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{104,2875}]
    };
get(4, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{104,3000}]
    };
get(4, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{104,3125}]
    };
get(4, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{104,3250}]
    };
get(4, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{104,3375}]
    };
get(4, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{104,3500}]
    };
get(4, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{104,3625}]
    };
get(4, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{104,3750}]
    };
get(4, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{104,3875}]
    };
get(4, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{104,4000}]
    };
get(4, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{104,4125}]
    };
get(4, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{104,4250}]
    };
get(4, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{104,4375}]
    };
get(4, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{104,4500}]
    };
get(4, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{104,4625}]
    };
get(4, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{104,4750}]
    };
get(4, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{104,4875}]
    };
get(4, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{104,5000}]
    };
get(4, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{104,5125}]
    };
get(4, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{104,5250}]
    };
get(4, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{104,5375}]
    };
get(4, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{104,5500}]
    };
get(4, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{104,5625}]
    };
get(4, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{104,5750}]
    };
get(4, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{104,5925}]
    };
get(4, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{104,6100}]
    };
get(4, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{104,6275}]
    };
get(4, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{104,6450}]
    };
get(4, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{104,6625}]
    };
get(4, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{104,6800}]
    };
get(4, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{104,6975}]
    };
get(4, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{104,7150}]
    };
get(4, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{104,7325}]
    };
get(4, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{104,7500}]
    };
get(4, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{104,7675}]
    };
get(4, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{104,7850}]
    };
get(4, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{104,8025}]
    };
get(4, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{104,8200}]
    };
get(4, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{104,8375}]
    };
get(4, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{104,8550}]
    };
get(4, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{104,8725}]
    };
get(4, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{104,8900}]
    };
get(4, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{104,9075}]
    };
get(4, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{104,9250}]
    };
get(4, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{104,9425}]
    };
get(4, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{104,9600}]
    };
get(4, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{104,9775}]
    };
get(4, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{104,9950}]
    };
get(4, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{104,10125}]
    };
get(4, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{104,10300}]
    };
get(4, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{104,10475}]
    };
get(4, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{104,10650}]
    };
get(4, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{104,10825}]
    };
get(4, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{104,11000}]
    };
get(4, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{104,11200}]
    };
get(4, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{104,11400}]
    };
get(4, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{104,11600}]
    };
get(4, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{104,11800}]
    };
get(4, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{104,12000}]
    };
get(4, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{104,12200}]
    };
get(4, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{104,12400}]
    };
get(4, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{104,12600}]
    };
get(4, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{104,12800}]
    };
get(4, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{104,13000}]
    };
get(4, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{104,13200}]
    };
get(4, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{104,13400}]
    };
get(4, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{104,13600}]
    };
get(4, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{104,13800}]
    };
get(4, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{104,14000}]
    };
get(4, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{104,14200}]
    };
get(4, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{104,14400}]
    };
get(4, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{104,14600}]
    };
get(4, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{104,14800}]
    };
get(4, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{104,15000}]
    };
get(4, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{104,15200}]
    };
get(4, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{104,15400}]
    };
get(4, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{104,15600}]
    };
get(4, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{104,15800}]
    };
get(4, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{104,16000}]
    };
get(4, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{104,16200}]
    };
get(4, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{104,16400}]
    };
get(4, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{104,16600}]
    };
get(4, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{104,16800}]
    };
get(4, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{104,17000}]
    };
get(4, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{104,17200}]
    };
get(4, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{104,17400}]
    };
get(4, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{104,17600}]
    };
get(4, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{104,17800}]
    };
get(4, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{104,18000}]
    };
get(4, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{104,18200}]
    };
get(4, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{104,18400}]
    };
get(4, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{104,18600}]
    };
get(4, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{104,18800}]
    };
get(4, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{104,19000}]
    };
get(5, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{105,0}]
    };
get(5, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{105,100}]
    };
get(5, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{105,200}]
    };
get(5, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{105,300}]
    };
get(5, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{105,400}]
    };
get(5, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{105,500}]
    };
get(5, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{105,600}]
    };
get(5, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{105,700}]
    };
get(5, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{105,800}]
    };
get(5, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{105,900}]
    };
get(5, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{105,1000}]
    };
get(5, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{105,1100}]
    };
get(5, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{105,1200}]
    };
get(5, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{105,1300}]
    };
get(5, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{105,1400}]
    };
get(5, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{105,1500}]
    };
get(5, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{105,1600}]
    };
get(5, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{105,1700}]
    };
get(5, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{105,1800}]
    };
get(5, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{105,1900}]
    };
get(5, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{105,2000}]
    };
get(5, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{105,2125}]
    };
get(5, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{105,2250}]
    };
get(5, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{105,2375}]
    };
get(5, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{105,2500}]
    };
get(5, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{105,2625}]
    };
get(5, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{105,2750}]
    };
get(5, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{105,2875}]
    };
get(5, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{105,3000}]
    };
get(5, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{105,3125}]
    };
get(5, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{105,3250}]
    };
get(5, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{105,3375}]
    };
get(5, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{105,3500}]
    };
get(5, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{105,3625}]
    };
get(5, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{105,3750}]
    };
get(5, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{105,3875}]
    };
get(5, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{105,4000}]
    };
get(5, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{105,4125}]
    };
get(5, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{105,4250}]
    };
get(5, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{105,4375}]
    };
get(5, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{105,4500}]
    };
get(5, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{105,4625}]
    };
get(5, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{105,4750}]
    };
get(5, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{105,4875}]
    };
get(5, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{105,5000}]
    };
get(5, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{105,5125}]
    };
get(5, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{105,5250}]
    };
get(5, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{105,5375}]
    };
get(5, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{105,5500}]
    };
get(5, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{105,5625}]
    };
get(5, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{105,5750}]
    };
get(5, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{105,5925}]
    };
get(5, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{105,6100}]
    };
get(5, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{105,6275}]
    };
get(5, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{105,6450}]
    };
get(5, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{105,6625}]
    };
get(5, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{105,6800}]
    };
get(5, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{105,6975}]
    };
get(5, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{105,7150}]
    };
get(5, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{105,7325}]
    };
get(5, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{105,7500}]
    };
get(5, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{105,7675}]
    };
get(5, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{105,7850}]
    };
get(5, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{105,8025}]
    };
get(5, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{105,8200}]
    };
get(5, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{105,8375}]
    };
get(5, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{105,8550}]
    };
get(5, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{105,8725}]
    };
get(5, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{105,8900}]
    };
get(5, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{105,9075}]
    };
get(5, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{105,9250}]
    };
get(5, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{105,9425}]
    };
get(5, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{105,9600}]
    };
get(5, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{105,9775}]
    };
get(5, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{105,9950}]
    };
get(5, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{105,10125}]
    };
get(5, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{105,10300}]
    };
get(5, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{105,10475}]
    };
get(5, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{105,10650}]
    };
get(5, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{105,10825}]
    };
get(5, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{105,11000}]
    };
get(5, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{105,11200}]
    };
get(5, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{105,11400}]
    };
get(5, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{105,11600}]
    };
get(5, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{105,11800}]
    };
get(5, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{105,12000}]
    };
get(5, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{105,12200}]
    };
get(5, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{105,12400}]
    };
get(5, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{105,12600}]
    };
get(5, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{105,12800}]
    };
get(5, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{105,13000}]
    };
get(5, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{105,13200}]
    };
get(5, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{105,13400}]
    };
get(5, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{105,13600}]
    };
get(5, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{105,13800}]
    };
get(5, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{105,14000}]
    };
get(5, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{105,14200}]
    };
get(5, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{105,14400}]
    };
get(5, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{105,14600}]
    };
get(5, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{105,14800}]
    };
get(5, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{105,15000}]
    };
get(5, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{105,15200}]
    };
get(5, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{105,15400}]
    };
get(5, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{105,15600}]
    };
get(5, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{105,15800}]
    };
get(5, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{105,16000}]
    };
get(5, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{105,16200}]
    };
get(5, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{105,16400}]
    };
get(5, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{105,16600}]
    };
get(5, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{105,16800}]
    };
get(5, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{105,17000}]
    };
get(5, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{105,17200}]
    };
get(5, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{105,17400}]
    };
get(5, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{105,17600}]
    };
get(5, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{105,17800}]
    };
get(5, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{105,18000}]
    };
get(5, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{105,18200}]
    };
get(5, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{105,18400}]
    };
get(5, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{105,18600}]
    };
get(5, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{105,18800}]
    };
get(5, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{105,19000}]
    };
get(6, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{1,0}]
    };
get(6, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{1,67}]
    };
get(6, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{1,133}]
    };
get(6, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{1,200}]
    };
get(6, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{1,267}]
    };
get(6, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{1,333}]
    };
get(6, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{1,400}]
    };
get(6, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{1,467}]
    };
get(6, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{1,533}]
    };
get(6, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{1,600}]
    };
get(6, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{1,667}]
    };
get(6, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{1,733}]
    };
get(6, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{1,800}]
    };
get(6, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{1,867}]
    };
get(6, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{1,933}]
    };
get(6, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{1,1000}]
    };
get(6, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{1,1067}]
    };
get(6, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{1,1133}]
    };
get(6, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{1,1200}]
    };
get(6, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{1,1267}]
    };
get(6, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{1,1333}]
    };
get(6, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{1,1417}]
    };
get(6, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{1,1500}]
    };
get(6, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{1,1583}]
    };
get(6, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{1,1667}]
    };
get(6, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{1,1750}]
    };
get(6, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{1,1833}]
    };
get(6, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{1,1917}]
    };
get(6, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{1,2000}]
    };
get(6, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{1,2083}]
    };
get(6, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{1,2167}]
    };
get(6, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{1,2250}]
    };
get(6, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{1,2333}]
    };
get(6, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{1,2417}]
    };
get(6, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{1,2500}]
    };
get(6, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{1,2583}]
    };
get(6, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{1,2667}]
    };
get(6, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{1,2750}]
    };
get(6, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{1,2833}]
    };
get(6, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{1,2917}]
    };
get(6, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{1,3000}]
    };
get(6, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{1,3100}]
    };
get(6, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{1,3200}]
    };
get(6, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{1,3300}]
    };
get(6, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{1,3400}]
    };
get(6, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{1,3500}]
    };
get(6, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{1,3600}]
    };
get(6, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{1,3700}]
    };
get(6, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{1,3800}]
    };
get(6, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{1,3900}]
    };
get(6, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{1,4000}]
    };
get(6, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{1,4100}]
    };
get(6, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{1,4200}]
    };
get(6, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{1,4300}]
    };
get(6, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{1,4400}]
    };
get(6, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{1,4500}]
    };
get(6, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{1,4600}]
    };
get(6, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{1,4700}]
    };
get(6, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{1,4800}]
    };
get(6, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{1,4900}]
    };
get(6, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{1,5000}]
    };
get(6, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{1,5117}]
    };
get(6, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{1,5234}]
    };
get(6, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{1,5351}]
    };
get(6, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{1,5468}]
    };
get(6, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{1,5585}]
    };
get(6, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{1,5702}]
    };
get(6, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{1,5819}]
    };
get(6, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{1,5936}]
    };
get(6, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{1,6053}]
    };
get(6, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{1,6170}]
    };
get(6, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{1,6287}]
    };
get(6, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{1,6404}]
    };
get(6, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{1,6521}]
    };
get(6, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{1,6638}]
    };
get(6, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{1,6755}]
    };
get(6, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{1,6872}]
    };
get(6, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{1,6989}]
    };
get(6, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{1,7106}]
    };
get(6, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{1,7223}]
    };
get(6, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{1,7340}]
    };
get(6, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{1,7473}]
    };
get(6, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{1,7606}]
    };
get(6, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{1,7739}]
    };
get(6, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{1,7872}]
    };
get(6, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{1,8005}]
    };
get(6, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{1,8138}]
    };
get(6, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{1,8271}]
    };
get(6, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{1,8404}]
    };
get(6, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{1,8537}]
    };
get(6, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{1,8670}]
    };
get(6, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{1,8803}]
    };
get(6, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{1,8936}]
    };
get(6, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{1,9069}]
    };
get(6, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{1,9202}]
    };
get(6, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{1,9335}]
    };
get(6, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{1,9468}]
    };
get(6, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{1,9601}]
    };
get(6, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{1,9734}]
    };
get(6, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{1,9867}]
    };
get(6, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{1,10000}]
    };
get(6, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{1,10133}]
    };
get(6, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{1,10267}]
    };
get(6, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{1,10400}]
    };
get(6, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{1,10533}]
    };
get(6, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{1,10667}]
    };
get(6, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{1,10800}]
    };
get(6, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{1,10933}]
    };
get(6, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{1,11067}]
    };
get(6, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{1,11200}]
    };
get(6, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{1,11333}]
    };
get(6, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{1,11467}]
    };
get(6, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{1,11600}]
    };
get(6, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{1,11733}]
    };
get(6, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{1,11867}]
    };
get(6, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{1,12000}]
    };
get(6, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{1,12133}]
    };
get(6, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{1,12267}]
    };
get(6, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{1,12400}]
    };
get(6, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{1,12533}]
    };
get(6, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{1,12667}]
    };
get(7, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{5,0},{6,0}]
    };
get(7, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{5,67},{6,67}]
    };
get(7, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{5,133},{6,133}]
    };
get(7, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{5,200},{6,200}]
    };
get(7, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{5,267},{6,267}]
    };
get(7, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{5,333},{6,333}]
    };
get(7, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{5,400},{6,400}]
    };
get(7, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{5,467},{6,467}]
    };
get(7, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{5,533},{6,533}]
    };
get(7, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{5,600},{6,600}]
    };
get(7, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{5,667},{6,667}]
    };
get(7, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{5,733},{6,733}]
    };
get(7, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{5,800},{6,800}]
    };
get(7, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{5,867},{6,867}]
    };
get(7, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{5,933},{6,933}]
    };
get(7, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{5,1000},{6,1000}]
    };
get(7, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{5,1067},{6,1067}]
    };
get(7, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{5,1133},{6,1133}]
    };
get(7, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{5,1200},{6,1200}]
    };
get(7, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{5,1267},{6,1267}]
    };
get(7, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{5,1333},{6,1333}]
    };
get(7, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{5,1417},{6,1417}]
    };
get(7, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{5,1500},{6,1500}]
    };
get(7, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{5,1583},{6,1583}]
    };
get(7, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{5,1667},{6,1667}]
    };
get(7, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{5,1750},{6,1750}]
    };
get(7, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{5,1833},{6,1833}]
    };
get(7, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{5,1917},{6,1917}]
    };
get(7, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{5,2000},{6,2000}]
    };
get(7, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{5,2083},{6,2083}]
    };
get(7, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{5,2167},{6,2167}]
    };
get(7, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{5,2250},{6,2250}]
    };
get(7, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{5,2333},{6,2333}]
    };
get(7, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{5,2417},{6,2417}]
    };
get(7, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{5,2500},{6,2500}]
    };
get(7, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{5,2583},{6,2583}]
    };
get(7, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{5,2667},{6,2667}]
    };
get(7, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{5,2750},{6,2750}]
    };
get(7, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{5,2833},{6,2833}]
    };
get(7, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{5,2917},{6,2917}]
    };
get(7, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{5,3000},{6,3000}]
    };
get(7, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{5,3100},{6,3100}]
    };
get(7, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{5,3200},{6,3200}]
    };
get(7, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{5,3300},{6,3300}]
    };
get(7, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{5,3400},{6,3400}]
    };
get(7, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{5,3500},{6,3500}]
    };
get(7, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{5,3600},{6,3600}]
    };
get(7, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{5,3700},{6,3700}]
    };
get(7, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{5,3800},{6,3800}]
    };
get(7, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{5,3900},{6,3900}]
    };
get(7, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{5,4000},{6,4000}]
    };
get(7, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{5,4100},{6,4100}]
    };
get(7, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{5,4200},{6,4200}]
    };
get(7, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{5,4300},{6,4300}]
    };
get(7, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{5,4400},{6,4400}]
    };
get(7, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{5,4500},{6,4500}]
    };
get(7, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{5,4600},{6,4600}]
    };
get(7, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{5,4700},{6,4700}]
    };
get(7, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{5,4800},{6,4800}]
    };
get(7, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{5,4900},{6,4900}]
    };
get(7, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{5,5000},{6,5000}]
    };
get(7, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{5,5117},{6,5117}]
    };
get(7, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{5,5234},{6,5234}]
    };
get(7, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{5,5351},{6,5351}]
    };
get(7, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{5,5468},{6,5468}]
    };
get(7, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{5,5585},{6,5585}]
    };
get(7, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{5,5702},{6,5702}]
    };
get(7, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{5,5819},{6,5819}]
    };
get(7, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{5,5936},{6,5936}]
    };
get(7, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{5,6053},{6,6053}]
    };
get(7, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{5,6170},{6,6170}]
    };
get(7, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{5,6287},{6,6287}]
    };
get(7, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{5,6404},{6,6404}]
    };
get(7, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{5,6521},{6,6521}]
    };
get(7, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{5,6638},{6,6638}]
    };
get(7, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{5,6755},{6,6755}]
    };
get(7, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{5,6872},{6,6872}]
    };
get(7, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{5,6989},{6,6989}]
    };
get(7, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{5,7106},{6,7106}]
    };
get(7, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{5,7223},{6,7223}]
    };
get(7, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{5,7340},{6,7340}]
    };
get(7, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{5,7473},{6,7473}]
    };
get(7, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{5,7606},{6,7606}]
    };
get(7, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{5,7739},{6,7739}]
    };
get(7, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{5,7872},{6,7872}]
    };
get(7, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{5,8005},{6,8005}]
    };
get(7, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{5,8138},{6,8138}]
    };
get(7, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{5,8271},{6,8271}]
    };
get(7, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{5,8404},{6,8404}]
    };
get(7, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{5,8537},{6,8537}]
    };
get(7, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{5,8670},{6,8670}]
    };
get(7, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{5,8803},{6,8803}]
    };
get(7, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{5,8936},{6,8936}]
    };
get(7, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{5,9069},{6,9069}]
    };
get(7, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{5,9202},{6,9202}]
    };
get(7, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{5,9335},{6,9335}]
    };
get(7, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{5,9468},{6,9468}]
    };
get(7, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{5,9601},{6,9601}]
    };
get(7, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{5,9734},{6,9734}]
    };
get(7, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{5,9867},{6,9867}]
    };
get(7, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{5,10000},{6,10000}]
    };
get(7, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{5,10133},{6,10133}]
    };
get(7, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{5,10267},{6,10267}]
    };
get(7, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{5,10400},{6,10400}]
    };
get(7, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{5,10533},{6,10533}]
    };
get(7, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{5,10667},{6,10667}]
    };
get(7, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{5,10800},{6,10800}]
    };
get(7, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{5,10933},{6,10933}]
    };
get(7, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{5,11067},{6,11067}]
    };
get(7, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{5,11200},{6,11200}]
    };
get(7, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{5,11333},{6,11333}]
    };
get(7, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{5,11467},{6,11467}]
    };
get(7, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{5,11600},{6,11600}]
    };
get(7, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{5,11733},{6,11733}]
    };
get(7, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{5,11867},{6,11867}]
    };
get(7, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{5,12000},{6,12000}]
    };
get(7, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{5,12133},{6,12133}]
    };
get(7, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{5,12267},{6,12267}]
    };
get(7, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{5,12400},{6,12400}]
    };
get(7, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{5,12533},{6,12533}]
    };
get(7, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{5,12667},{6,12667}]
    };
get(8, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{7,0},{8,0}]
    };
get(8, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{5,67},{6,67}]
    };
get(8, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{5,133},{6,133}]
    };
get(8, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{5,200},{6,200}]
    };
get(8, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{5,267},{6,267}]
    };
get(8, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{5,333},{6,333}]
    };
get(8, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{5,400},{6,400}]
    };
get(8, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{5,467},{6,467}]
    };
get(8, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{5,533},{6,533}]
    };
get(8, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{5,600},{6,600}]
    };
get(8, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{5,667},{6,667}]
    };
get(8, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{5,733},{6,733}]
    };
get(8, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{5,800},{6,800}]
    };
get(8, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{5,867},{6,867}]
    };
get(8, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{5,933},{6,933}]
    };
get(8, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{5,1000},{6,1000}]
    };
get(8, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{5,1067},{6,1067}]
    };
get(8, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{5,1133},{6,1133}]
    };
get(8, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{5,1200},{6,1200}]
    };
get(8, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{5,1267},{6,1267}]
    };
get(8, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{5,1333},{6,1333}]
    };
get(8, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{5,1417},{6,1417}]
    };
get(8, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{5,1500},{6,1500}]
    };
get(8, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{5,1583},{6,1583}]
    };
get(8, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{5,1667},{6,1667}]
    };
get(8, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{5,1750},{6,1750}]
    };
get(8, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{5,1833},{6,1833}]
    };
get(8, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{5,1917},{6,1917}]
    };
get(8, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{5,2000},{6,2000}]
    };
get(8, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{5,2083},{6,2083}]
    };
get(8, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{5,2167},{6,2167}]
    };
get(8, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{5,2250},{6,2250}]
    };
get(8, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{5,2333},{6,2333}]
    };
get(8, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{5,2417},{6,2417}]
    };
get(8, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{5,2500},{6,2500}]
    };
get(8, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{5,2583},{6,2583}]
    };
get(8, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{5,2667},{6,2667}]
    };
get(8, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{5,2750},{6,2750}]
    };
get(8, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{5,2833},{6,2833}]
    };
get(8, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{5,2917},{6,2917}]
    };
get(8, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{5,3000},{6,3000}]
    };
get(8, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{5,3100},{6,3100}]
    };
get(8, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{5,3200},{6,3200}]
    };
get(8, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{5,3300},{6,3300}]
    };
get(8, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{5,3400},{6,3400}]
    };
get(8, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{5,3500},{6,3500}]
    };
get(8, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{5,3600},{6,3600}]
    };
get(8, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{5,3700},{6,3700}]
    };
get(8, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{5,3800},{6,3800}]
    };
get(8, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{5,3900},{6,3900}]
    };
get(8, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{5,4000},{6,4000}]
    };
get(8, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{5,4100},{6,4100}]
    };
get(8, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{5,4200},{6,4200}]
    };
get(8, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{5,4300},{6,4300}]
    };
get(8, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{5,4400},{6,4400}]
    };
get(8, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{5,4500},{6,4500}]
    };
get(8, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{5,4600},{6,4600}]
    };
get(8, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{5,4700},{6,4700}]
    };
get(8, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{5,4800},{6,4800}]
    };
get(8, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{5,4900},{6,4900}]
    };
get(8, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{5,5000},{6,5000}]
    };
get(8, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{5,5117},{6,5117}]
    };
get(8, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{5,5234},{6,5234}]
    };
get(8, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{5,5351},{6,5351}]
    };
get(8, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{5,5468},{6,5468}]
    };
get(8, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{5,5585},{6,5585}]
    };
get(8, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{5,5702},{6,5702}]
    };
get(8, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{5,5819},{6,5819}]
    };
get(8, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{5,5936},{6,5936}]
    };
get(8, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{5,6053},{6,6053}]
    };
get(8, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{5,6170},{6,6170}]
    };
get(8, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{5,6287},{6,6287}]
    };
get(8, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{5,6404},{6,6404}]
    };
get(8, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{5,6521},{6,6521}]
    };
get(8, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{5,6638},{6,6638}]
    };
get(8, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{5,6755},{6,6755}]
    };
get(8, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{5,6872},{6,6872}]
    };
get(8, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{5,6989},{6,6989}]
    };
get(8, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{5,7106},{6,7106}]
    };
get(8, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{5,7223},{6,7223}]
    };
get(8, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{5,7340},{6,7340}]
    };
get(8, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{5,7473},{6,7473}]
    };
get(8, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{5,7606},{6,7606}]
    };
get(8, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{5,7739},{6,7739}]
    };
get(8, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{5,7872},{6,7872}]
    };
get(8, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{5,8005},{6,8005}]
    };
get(8, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{5,8138},{6,8138}]
    };
get(8, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{5,8271},{6,8271}]
    };
get(8, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{5,8404},{6,8404}]
    };
get(8, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{5,8537},{6,8537}]
    };
get(8, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{5,8670},{6,8670}]
    };
get(8, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{5,8803},{6,8803}]
    };
get(8, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{5,8936},{6,8936}]
    };
get(8, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{5,9069},{6,9069}]
    };
get(8, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{5,9202},{6,9202}]
    };
get(8, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{5,9335},{6,9335}]
    };
get(8, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{5,9468},{6,9468}]
    };
get(8, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{5,9601},{6,9601}]
    };
get(8, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{5,9734},{6,9734}]
    };
get(8, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{5,9867},{6,9867}]
    };
get(8, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{5,10000},{6,10000}]
    };
get(8, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{5,10133},{6,10133}]
    };
get(8, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{5,10267},{6,10267}]
    };
get(8, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{5,10400},{6,10400}]
    };
get(8, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{5,10533},{6,10533}]
    };
get(8, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{5,10667},{6,10667}]
    };
get(8, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{5,10800},{6,10800}]
    };
get(8, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{5,10933},{6,10933}]
    };
get(8, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{5,11067},{6,11067}]
    };
get(8, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{5,11200},{6,11200}]
    };
get(8, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{5,11333},{6,11333}]
    };
get(8, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{5,11467},{6,11467}]
    };
get(8, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{5,11600},{6,11600}]
    };
get(8, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{5,11733},{6,11733}]
    };
get(8, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{5,11867},{6,11867}]
    };
get(8, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{5,12000},{6,12000}]
    };
get(8, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{5,12133},{6,12133}]
    };
get(8, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{5,12267},{6,12267}]
    };
get(8, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{5,12400},{6,12400}]
    };
get(8, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{5,12533},{6,12533}]
    };
get(8, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{5,12667},{6,12667}]
    };
get(9, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{9,0}]
    };
get(9, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{9,67}]
    };
get(9, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{9,133}]
    };
get(9, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{9,200}]
    };
get(9, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{9,267}]
    };
get(9, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{9,333}]
    };
get(9, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{9,400}]
    };
get(9, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{9,467}]
    };
get(9, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{9,533}]
    };
get(9, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{9,600}]
    };
get(9, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{9,667}]
    };
get(9, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{9,733}]
    };
get(9, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{9,800}]
    };
get(9, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{9,867}]
    };
get(9, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{9,933}]
    };
get(9, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{9,1000}]
    };
get(9, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{9,1067}]
    };
get(9, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{9,1133}]
    };
get(9, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{9,1200}]
    };
get(9, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{9,1267}]
    };
get(9, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{9,1333}]
    };
get(9, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{9,1417}]
    };
get(9, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{9,1500}]
    };
get(9, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{9,1583}]
    };
get(9, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{9,1667}]
    };
get(9, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{9,1750}]
    };
get(9, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{9,1833}]
    };
get(9, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{9,1917}]
    };
get(9, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{9,2000}]
    };
get(9, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{9,2083}]
    };
get(9, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{9,2167}]
    };
get(9, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{9,2250}]
    };
get(9, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{9,2333}]
    };
get(9, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{9,2417}]
    };
get(9, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{9,2500}]
    };
get(9, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{9,2583}]
    };
get(9, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{9,2667}]
    };
get(9, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{9,2750}]
    };
get(9, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{9,2833}]
    };
get(9, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{9,2917}]
    };
get(9, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{9,3000}]
    };
get(9, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{9,3100}]
    };
get(9, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{9,3200}]
    };
get(9, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{9,3300}]
    };
get(9, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{9,3400}]
    };
get(9, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{9,3500}]
    };
get(9, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{9,3600}]
    };
get(9, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{9,3700}]
    };
get(9, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{9,3800}]
    };
get(9, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{9,3900}]
    };
get(9, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{9,4000}]
    };
get(9, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{9,4100}]
    };
get(9, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{9,4200}]
    };
get(9, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{9,4300}]
    };
get(9, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{9,4400}]
    };
get(9, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{9,4500}]
    };
get(9, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{9,4600}]
    };
get(9, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{9,4700}]
    };
get(9, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{9,4800}]
    };
get(9, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{9,4900}]
    };
get(9, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{9,5000}]
    };
get(9, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{9,5117}]
    };
get(9, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{9,5234}]
    };
get(9, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{9,5351}]
    };
get(9, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{9,5468}]
    };
get(9, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{9,5585}]
    };
get(9, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{9,5702}]
    };
get(9, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{9,5819}]
    };
get(9, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{9,5936}]
    };
get(9, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{9,6053}]
    };
get(9, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{9,6170}]
    };
get(9, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{9,6287}]
    };
get(9, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{9,6404}]
    };
get(9, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{9,6521}]
    };
get(9, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{9,6638}]
    };
get(9, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{9,6755}]
    };
get(9, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{9,6872}]
    };
get(9, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{9,6989}]
    };
get(9, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{9,7106}]
    };
get(9, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{9,7223}]
    };
get(9, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{9,7340}]
    };
get(9, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{9,7473}]
    };
get(9, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{9,7606}]
    };
get(9, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{9,7739}]
    };
get(9, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{9,7872}]
    };
get(9, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{9,8005}]
    };
get(9, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{9,8138}]
    };
get(9, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{9,8271}]
    };
get(9, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{9,8404}]
    };
get(9, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{9,8537}]
    };
get(9, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{9,8670}]
    };
get(9, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{9,8803}]
    };
get(9, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{9,8936}]
    };
get(9, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{9,9069}]
    };
get(9, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{9,9202}]
    };
get(9, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{9,9335}]
    };
get(9, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{9,9468}]
    };
get(9, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{9,9601}]
    };
get(9, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{9,9734}]
    };
get(9, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{9,9867}]
    };
get(9, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{9,10000}]
    };
get(9, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{9,10133}]
    };
get(9, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{9,10267}]
    };
get(9, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{9,10400}]
    };
get(9, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{9,10533}]
    };
get(9, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{9,10667}]
    };
get(9, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{9,10800}]
    };
get(9, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{9,10933}]
    };
get(9, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{9,11067}]
    };
get(9, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{9,11200}]
    };
get(9, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{9,11333}]
    };
get(9, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{9,11467}]
    };
get(9, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{9,11600}]
    };
get(9, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{9,11733}]
    };
get(9, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{9,11867}]
    };
get(9, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{9,12000}]
    };
get(9, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{9,12133}]
    };
get(9, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{9,12267}]
    };
get(9, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{9,12400}]
    };
get(9, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{9,12533}]
    };
get(9, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{9,12667}]
    };
get(10, 0) ->
    #{
        cost_cont => 1,
        cost_exp => 250,
        attr => [{10,0}]
    };
get(10, 1) ->
    #{
        cost_cont => 2,
        cost_exp => 510,
        attr => [{10,67}]
    };
get(10, 2) ->
    #{
        cost_cont => 2,
        cost_exp => 790,
        attr => [{10,133}]
    };
get(10, 3) ->
    #{
        cost_cont => 3,
        cost_exp => 1090,
        attr => [{10,200}]
    };
get(10, 4) ->
    #{
        cost_cont => 3,
        cost_exp => 1410,
        attr => [{10,267}]
    };
get(10, 5) ->
    #{
        cost_cont => 4,
        cost_exp => 1750,
        attr => [{10,333}]
    };
get(10, 6) ->
    #{
        cost_cont => 4,
        cost_exp => 2120,
        attr => [{10,400}]
    };
get(10, 7) ->
    #{
        cost_cont => 5,
        cost_exp => 2500,
        attr => [{10,467}]
    };
get(10, 8) ->
    #{
        cost_cont => 5,
        cost_exp => 2920,
        attr => [{10,533}]
    };
get(10, 9) ->
    #{
        cost_cont => 10,
        cost_exp => 3870,
        attr => [{10,600}]
    };
get(10, 10) ->
    #{
        cost_cont => 10,
        cost_exp => 3820,
        attr => [{10,667}]
    };
get(10, 11) ->
    #{
        cost_cont => 10,
        cost_exp => 4320,
        attr => [{10,733}]
    };
get(10, 12) ->
    #{
        cost_cont => 10,
        cost_exp => 4850,
        attr => [{10,800}]
    };
get(10, 13) ->
    #{
        cost_cont => 10,
        cost_exp => 5410,
        attr => [{10,867}]
    };
get(10, 14) ->
    #{
        cost_cont => 10,
        cost_exp => 6010,
        attr => [{10,933}]
    };
get(10, 15) ->
    #{
        cost_cont => 10,
        cost_exp => 6650,
        attr => [{10,1000}]
    };
get(10, 16) ->
    #{
        cost_cont => 11,
        cost_exp => 7330,
        attr => [{10,1067}]
    };
get(10, 17) ->
    #{
        cost_cont => 11,
        cost_exp => 8060,
        attr => [{10,1133}]
    };
get(10, 18) ->
    #{
        cost_cont => 11,
        cost_exp => 8830,
        attr => [{10,1200}]
    };
get(10, 19) ->
    #{
        cost_cont => 12,
        cost_exp => 11420,
        attr => [{10,1267}]
    };
get(10, 20) ->
    #{
        cost_cont => 12,
        cost_exp => 10240,
        attr => [{10,1333}]
    };
get(10, 21) ->
    #{
        cost_cont => 12,
        cost_exp => 11120,
        attr => [{10,1417}]
    };
get(10, 22) ->
    #{
        cost_cont => 13,
        cost_exp => 12040,
        attr => [{10,1500}]
    };
get(10, 23) ->
    #{
        cost_cont => 13,
        cost_exp => 13030,
        attr => [{10,1583}]
    };
get(10, 24) ->
    #{
        cost_cont => 14,
        cost_exp => 14070,
        attr => [{10,1667}]
    };
get(10, 25) ->
    #{
        cost_cont => 14,
        cost_exp => 15180,
        attr => [{10,1750}]
    };
get(10, 26) ->
    #{
        cost_cont => 14,
        cost_exp => 16350,
        attr => [{10,1833}]
    };
get(10, 27) ->
    #{
        cost_cont => 15,
        cost_exp => 17600,
        attr => [{10,1917}]
    };
get(10, 28) ->
    #{
        cost_cont => 16,
        cost_exp => 18920,
        attr => [{10,2000}]
    };
get(10, 29) ->
    #{
        cost_cont => 17,
        cost_exp => 24920,
        attr => [{10,2083}]
    };
get(10, 30) ->
    #{
        cost_cont => 18,
        cost_exp => 21200,
        attr => [{10,2167}]
    };
get(10, 31) ->
    #{
        cost_cont => 19,
        cost_exp => 23520,
        attr => [{10,2250}]
    };
get(10, 32) ->
    #{
        cost_cont => 20,
        cost_exp => 25930,
        attr => [{10,2333}]
    };
get(10, 33) ->
    #{
        cost_cont => 21,
        cost_exp => 28430,
        attr => [{10,2417}]
    };
get(10, 34) ->
    #{
        cost_cont => 22,
        cost_exp => 31020,
        attr => [{10,2500}]
    };
get(10, 35) ->
    #{
        cost_cont => 23,
        cost_exp => 33700,
        attr => [{10,2583}]
    };
get(10, 36) ->
    #{
        cost_cont => 24,
        cost_exp => 36470,
        attr => [{10,2667}]
    };
get(10, 37) ->
    #{
        cost_cont => 25,
        cost_exp => 39330,
        attr => [{10,2750}]
    };
get(10, 38) ->
    #{
        cost_cont => 26,
        cost_exp => 42280,
        attr => [{10,2833}]
    };
get(10, 39) ->
    #{
        cost_cont => 28,
        cost_exp => 45320,
        attr => [{10,2917}]
    };
get(10, 40) ->
    #{
        cost_cont => 30,
        cost_exp => 48450,
        attr => [{10,3000}]
    };
get(10, 41) ->
    #{
        cost_cont => 32,
        cost_exp => 51670,
        attr => [{10,3100}]
    };
get(10, 42) ->
    #{
        cost_cont => 34,
        cost_exp => 54980,
        attr => [{10,3200}]
    };
get(10, 43) ->
    #{
        cost_cont => 36,
        cost_exp => 58380,
        attr => [{10,3300}]
    };
get(10, 44) ->
    #{
        cost_cont => 38,
        cost_exp => 61870,
        attr => [{10,3400}]
    };
get(10, 45) ->
    #{
        cost_cont => 40,
        cost_exp => 65450,
        attr => [{10,3500}]
    };
get(10, 46) ->
    #{
        cost_cont => 42,
        cost_exp => 69120,
        attr => [{10,3600}]
    };
get(10, 47) ->
    #{
        cost_cont => 44,
        cost_exp => 72880,
        attr => [{10,3700}]
    };
get(10, 48) ->
    #{
        cost_cont => 46,
        cost_exp => 76730,
        attr => [{10,3800}]
    };
get(10, 49) ->
    #{
        cost_cont => 48,
        cost_exp => 86710,
        attr => [{10,3900}]
    };
get(10, 50) ->
    #{
        cost_cont => 50,
        cost_exp => 77890,
        attr => [{10,4000}]
    };
get(10, 51) ->
    #{
        cost_cont => 53,
        cost_exp => 82850,
        attr => [{10,4100}]
    };
get(10, 52) ->
    #{
        cost_cont => 55,
        cost_exp => 88120,
        attr => [{10,4200}]
    };
get(10, 53) ->
    #{
        cost_cont => 58,
        cost_exp => 93710,
        attr => [{10,4300}]
    };
get(10, 54) ->
    #{
        cost_cont => 61,
        cost_exp => 99630,
        attr => [{10,4400}]
    };
get(10, 55) ->
    #{
        cost_cont => 64,
        cost_exp => 105910,
        attr => [{10,4500}]
    };
get(10, 56) ->
    #{
        cost_cont => 68,
        cost_exp => 112580,
        attr => [{10,4600}]
    };
get(10, 57) ->
    #{
        cost_cont => 71,
        cost_exp => 119650,
        attr => [{10,4700}]
    };
get(10, 58) ->
    #{
        cost_cont => 75,
        cost_exp => 127140,
        attr => [{10,4800}]
    };
get(10, 59) ->
    #{
        cost_cont => 78,
        cost_exp => 167340,
        attr => [{10,4900}]
    };
get(10, 60) ->
    #{
        cost_cont => 82,
        cost_exp => 143520,
        attr => [{10,5000}]
    };
get(10, 61) ->
    #{
        cost_cont => 85,
        cost_exp => 155720,
        attr => [{10,5117}]
    };
get(10, 62) ->
    #{
        cost_cont => 89,
        cost_exp => 168400,
        attr => [{10,5234}]
    };
get(10, 63) ->
    #{
        cost_cont => 94,
        cost_exp => 181560,
        attr => [{10,5351}]
    };
get(10, 64) ->
    #{
        cost_cont => 98,
        cost_exp => 195200,
        attr => [{10,5468}]
    };
get(10, 65) ->
    #{
        cost_cont => 103,
        cost_exp => 209320,
        attr => [{10,5585}]
    };
get(10, 66) ->
    #{
        cost_cont => 109,
        cost_exp => 223920,
        attr => [{10,5702}]
    };
get(10, 67) ->
    #{
        cost_cont => 114,
        cost_exp => 239000,
        attr => [{10,5819}]
    };
get(10, 68) ->
    #{
        cost_cont => 120,
        cost_exp => 303380,
        attr => [{10,5936}]
    };
get(10, 69) ->
    #{
        cost_cont => 125,
        cost_exp => 264620,
        attr => [{10,6053}]
    };
get(10, 70) ->
    #{
        cost_cont => 131,
        cost_exp => 281190,
        attr => [{10,6170}]
    };
get(10, 71) ->
    #{
        cost_cont => 136,
        cost_exp => 298390,
        attr => [{10,6287}]
    };
get(10, 72) ->
    #{
        cost_cont => 142,
        cost_exp => 316220,
        attr => [{10,6404}]
    };
get(10, 73) ->
    #{
        cost_cont => 147,
        cost_exp => 334680,
        attr => [{10,6521}]
    };
get(10, 74) ->
    #{
        cost_cont => 153,
        cost_exp => 353770,
        attr => [{10,6638}]
    };
get(10, 75) ->
    #{
        cost_cont => 160,
        cost_exp => 373490,
        attr => [{10,6755}]
    };
get(10, 76) ->
    #{
        cost_cont => 166,
        cost_exp => 393840,
        attr => [{10,6872}]
    };
get(10, 77) ->
    #{
        cost_cont => 173,
        cost_exp => 414820,
        attr => [{10,6989}]
    };
get(10, 78) ->
    #{
        cost_cont => 181,
        cost_exp => 510220,
        attr => [{10,7106}]
    };
get(10, 79) ->
    #{
        cost_cont => 188,
        cost_exp => 463020,
        attr => [{10,7223}]
    };
get(10, 80) ->
    #{
        cost_cont => 196,
        cost_exp => 489310,
        attr => [{10,7340}]
    };
get(10, 81) ->
    #{
        cost_cont => 205,
        cost_exp => 516330,
        attr => [{10,7473}]
    };
get(10, 82) ->
    #{
        cost_cont => 215,
        cost_exp => 544080,
        attr => [{10,7606}]
    };
get(10, 83) ->
    #{
        cost_cont => 224,
        cost_exp => 572560,
        attr => [{10,7739}]
    };
get(10, 84) ->
    #{
        cost_cont => 234,
        cost_exp => 601770,
        attr => [{10,7872}]
    };
get(10, 85) ->
    #{
        cost_cont => 243,
        cost_exp => 631710,
        attr => [{10,8005}]
    };
get(10, 86) ->
    #{
        cost_cont => 253,
        cost_exp => 662380,
        attr => [{10,8138}]
    };
get(10, 87) ->
    #{
        cost_cont => 262,
        cost_exp => 693780,
        attr => [{10,8271}]
    };
get(10, 88) ->
    #{
        cost_cont => 272,
        cost_exp => 725910,
        attr => [{10,8404}]
    };
get(10, 89) ->
    #{
        cost_cont => 281,
        cost_exp => 834570,
        attr => [{10,8537}]
    };
get(10, 90) ->
    #{
        cost_cont => 291,
        cost_exp => 775980,
        attr => [{10,8670}]
    };
get(10, 91) ->
    #{
        cost_cont => 300,
        cost_exp => 811900,
        attr => [{10,8803}]
    };
get(10, 92) ->
    #{
        cost_cont => 310,
        cost_exp => 848550,
        attr => [{10,8936}]
    };
get(10, 93) ->
    #{
        cost_cont => 320,
        cost_exp => 885930,
        attr => [{10,9069}]
    };
get(10, 94) ->
    #{
        cost_cont => 331,
        cost_exp => 924040,
        attr => [{10,9202}]
    };
get(10, 95) ->
    #{
        cost_cont => 341,
        cost_exp => 962880,
        attr => [{10,9335}]
    };
get(10, 96) ->
    #{
        cost_cont => 353,
        cost_exp => 1002450,
        attr => [{10,9468}]
    };
get(10, 97) ->
    #{
        cost_cont => 364,
        cost_exp => 1042750,
        attr => [{10,9601}]
    };
get(10, 98) ->
    #{
        cost_cont => 376,
        cost_exp => 1083780,
        attr => [{10,9734}]
    };
get(10, 99) ->
    #{
        cost_cont => 388,
        cost_exp => 1209740,
        attr => [{10,9867}]
    };
get(10, 100) ->
    #{
        cost_cont => 396,
        cost_exp => 1139020,
        attr => [{10,10000}]
    };
get(10, 101) ->
    #{
        cost_cont => 409,
        cost_exp => 1184640,
        attr => [{10,10133}]
    };
get(10, 102) ->
    #{
        cost_cont => 423,
        cost_exp => 1231670,
        attr => [{10,10267}]
    };
get(10, 103) ->
    #{
        cost_cont => 437,
        cost_exp => 1280110,
        attr => [{10,10400}]
    };
get(10, 104) ->
    #{
        cost_cont => 452,
        cost_exp => 1329960,
        attr => [{10,10533}]
    };
get(10, 105) ->
    #{
        cost_cont => 467,
        cost_exp => 1381220,
        attr => [{10,10667}]
    };
get(10, 106) ->
    #{
        cost_cont => 483,
        cost_exp => 1433890,
        attr => [{10,10800}]
    };
get(10, 107) ->
    #{
        cost_cont => 499,
        cost_exp => 1487970,
        attr => [{10,10933}]
    };
get(10, 108) ->
    #{
        cost_cont => 516,
        cost_exp => 1543460,
        attr => [{10,11067}]
    };
get(10, 109) ->
    #{
        cost_cont => 533,
        cost_exp => 1683260,
        attr => [{10,11200}]
    };
get(10, 110) ->
    #{
        cost_cont => 551,
        cost_exp => 1594990,
        attr => [{10,11333}]
    };
get(10, 111) ->
    #{
        cost_cont => 569,
        cost_exp => 1643540,
        attr => [{10,11467}]
    };
get(10, 112) ->
    #{
        cost_cont => 588,
        cost_exp => 1694200,
        attr => [{10,11600}]
    };
get(10, 113) ->
    #{
        cost_cont => 608,
        cost_exp => 1746970,
        attr => [{10,11733}]
    };
get(10, 114) ->
    #{
        cost_cont => 629,
        cost_exp => 1801850,
        attr => [{10,11867}]
    };
get(10, 115) ->
    #{
        cost_cont => 651,
        cost_exp => 1858840,
        attr => [{10,12000}]
    };
get(10, 116) ->
    #{
        cost_cont => 674,
        cost_exp => 1917940,
        attr => [{10,12133}]
    };
get(10, 117) ->
    #{
        cost_cont => 698,
        cost_exp => 1979150,
        attr => [{10,12267}]
    };
get(10, 118) ->
    #{
        cost_cont => 722,
        cost_exp => 2042470,
        attr => [{10,12400}]
    };
get(10, 119) ->
    #{
        cost_cont => 747,
        cost_exp => 2202310,
        attr => [{10,12533}]
    };
get(10, 120) ->
    #{
        cost_cont => 0,
        cost_exp => 0,
        attr => [{10,12667}]
    };
get(_ID, _Lv) ->
    undefined.

get_id_lvs(1) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(2) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(3) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(4) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(5) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(6) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(7) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(8) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(9) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(10) ->
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120];
get_id_lvs(_) ->
    [].


get_ids() ->
	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].