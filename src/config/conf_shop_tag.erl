%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_shop_tag
%% @Brief  : 商店子商店(商店标签)
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_shop_tag).

-export([
    get/1,
    get_ids/0,
	get_shop_tags/1
]).

get(11) ->
    #{
        shop_id => 1,
        tag_id => 11        
    };
get(12) ->
    #{
        shop_id => 1,
        tag_id => 12        
    };
get(13) ->
    #{
        shop_id => 1,
        tag_id => 13        
    };
get(14) ->
    #{
        shop_id => 1,
        tag_id => 14        
    };
get(15) ->
    #{
        shop_id => 1,
        tag_id => 15        
    };
get(21) ->
    #{
        shop_id => 2,
        tag_id => 21        
    };
get(22) ->
    #{
        shop_id => 2,
        tag_id => 22        
    };
get(23) ->
    #{
        shop_id => 2,
        tag_id => 23        
    };
get(24) ->
    #{
        shop_id => 2,
        tag_id => 24        
    };
get(25) ->
    #{
        shop_id => 2,
        tag_id => 25        
    };
get(31) ->
    #{
        shop_id => 3,
        tag_id => 31        
    };
get(32) ->
    #{
        shop_id => 3,
        tag_id => 32        
    };
get(33) ->
    #{
        shop_id => 3,
        tag_id => 33        
    };
get(34) ->
    #{
        shop_id => 3,
        tag_id => 34        
    };
get(35) ->
    #{
        shop_id => 3,
        tag_id => 35        
    };
get(36) ->
    #{
        shop_id => 3,
        tag_id => 36        
    };
get(37) ->
    #{
        shop_id => 3,
        tag_id => 37        
    };
get(38) ->
    #{
        shop_id => 3,
        tag_id => 38        
    };
get(41) ->
    #{
        shop_id => 4,
        tag_id => 41        
    };
get(42) ->
    #{
        shop_id => 4,
        tag_id => 42        
    };
get(43) ->
    #{
        shop_id => 4,
        tag_id => 43        
    };
get(51) ->
    #{
        shop_id => 5,
        tag_id => 51        
    };
get(61) ->
    #{
        shop_id => 6,
        tag_id => 61        
    };
get(71) ->
    #{
        shop_id => 7,
        tag_id => 71        
    };
get(81) ->
    #{
        shop_id => 8,
        tag_id => 81        
    };
get(91) ->
    #{
        shop_id => 9,
        tag_id => 91        
    };
get(101) ->
    #{
        shop_id => 10,
        tag_id => 101        
    };
get(111) ->
    #{
        shop_id => 11,
        tag_id => 111        
    };
get(121) ->
    #{
        shop_id => 12,
        tag_id => 121        
    };
get(131) ->
    #{
        shop_id => 13,
        tag_id => 131        
    };
get(141) ->
    #{
        shop_id => 14,
        tag_id => 141        
    };
get(151) ->
    #{
        shop_id => 15,
        tag_id => 151        
    };
get(161) ->
    #{
        shop_id => 16,
        tag_id => 161        
    };
get(171) ->
    #{
        shop_id => 17,
        tag_id => 171        
    };
get(181) ->
    #{
        shop_id => 18,
        tag_id => 181        
    };
get(182) ->
    #{
        shop_id => 18,
        tag_id => 182        
    };
get(183) ->
    #{
        shop_id => 18,
        tag_id => 183        
    };
get(191) ->
    #{
        shop_id => 19,
        tag_id => 191        
    };
get(201) ->
    #{
        shop_id => 20,
        tag_id => 201        
    };
get(211) ->
    #{
        shop_id => 21,
        tag_id => 211        
    };
get(212) ->
    #{
        shop_id => 21,
        tag_id => 212        
    };
get(213) ->
    #{
        shop_id => 21,
        tag_id => 213        
    };
get(214) ->
    #{
        shop_id => 21,
        tag_id => 214        
    };
get(215) ->
    #{
        shop_id => 21,
        tag_id => 215        
    };
get(221) ->
    #{
        shop_id => 22,
        tag_id => 221        
    };
get(231) ->
    #{
        shop_id => 23,
        tag_id => 231        
    };
get(241) ->
    #{
        shop_id => 24,
        tag_id => 241        
    };
get(242) ->
    #{
        shop_id => 24,
        tag_id => 242        
    };
get(243) ->
    #{
        shop_id => 24,
        tag_id => 243        
    };
get(251) ->
    #{
        shop_id => 25,
        tag_id => 251        
    };
get(261) ->
    #{
        shop_id => 26,
        tag_id => 261        
    };
get(271) ->
    #{
        shop_id => 27,
        tag_id => 271        
    };
get(281) ->
    #{
        shop_id => 28,
        tag_id => 281        
    };
get(291) ->
    #{
        shop_id => 29,
        tag_id => 291        
    };
get(301) ->
    #{
        shop_id => 30,
        tag_id => 301        
    };
get(311) ->
    #{
        shop_id => 31,
        tag_id => 311        
    };
get(321) ->
    #{
        shop_id => 32,
        tag_id => 321        
    };
get(331) ->
    #{
        shop_id => 33,
        tag_id => 331        
    };
get(341) ->
    #{
        shop_id => 34,
        tag_id => 341        
    };
get(351) ->
    #{
        shop_id => 35,
        tag_id => 351        
    };
get(361) ->
    #{
        shop_id => 36,
        tag_id => 361        
    };
get(371) ->
    #{
        shop_id => 37,
        tag_id => 371        
    };
get(381) ->
    #{
        shop_id => 38,
        tag_id => 381        
    };
get(391) ->
    #{
        shop_id => 39,
        tag_id => 391        
    };
get(401) ->
    #{
        shop_id => 40,
        tag_id => 401        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [11, 12, 13, 14, 15, 21, 22, 23, 24, 25, 31, 32, 33, 34, 35, 36, 37, 38, 41, 42, 43, 51, 61, 71, 81, 91, 101, 111, 121, 131, 141, 151, 161, 171, 181, 182, 183, 191, 201, 211, 212, 213, 214, 215, 221, 231, 241, 242, 243, 251, 261, 271, 281, 291, 301, 311, 321, 331, 341, 351, 361, 371, 381, 391, 401].

get_shop_tags(1) ->
    [11, 12, 13, 14, 15];
get_shop_tags(2) ->
    [21, 22, 23, 24, 25];
get_shop_tags(3) ->
    [31, 32, 33, 34, 35, 36, 37, 38];
get_shop_tags(4) ->
    [41, 42, 43];
get_shop_tags(5) ->
    [51];
get_shop_tags(6) ->
    [61];
get_shop_tags(7) ->
    [71];
get_shop_tags(8) ->
    [81];
get_shop_tags(9) ->
    [91];
get_shop_tags(10) ->
    [101];
get_shop_tags(11) ->
    [111];
get_shop_tags(12) ->
    [121];
get_shop_tags(13) ->
    [131];
get_shop_tags(14) ->
    [141];
get_shop_tags(15) ->
    [151];
get_shop_tags(16) ->
    [161];
get_shop_tags(17) ->
    [171];
get_shop_tags(18) ->
    [181, 182, 183];
get_shop_tags(19) ->
    [191];
get_shop_tags(20) ->
    [201];
get_shop_tags(21) ->
    [211, 212, 213, 214, 215];
get_shop_tags(22) ->
    [221];
get_shop_tags(23) ->
    [231];
get_shop_tags(24) ->
    [241, 242, 243];
get_shop_tags(25) ->
    [251];
get_shop_tags(26) ->
    [261];
get_shop_tags(27) ->
    [271];
get_shop_tags(28) ->
    [281];
get_shop_tags(29) ->
    [291];
get_shop_tags(30) ->
    [301];
get_shop_tags(31) ->
    [311];
get_shop_tags(32) ->
    [321];
get_shop_tags(33) ->
    [331];
get_shop_tags(34) ->
    [341];
get_shop_tags(35) ->
    [351];
get_shop_tags(36) ->
    [361];
get_shop_tags(37) ->
    [371];
get_shop_tags(38) ->
    [381];
get_shop_tags(39) ->
    [391];
get_shop_tags(40) ->
    [401];
get_shop_tags(_) ->
    [].
