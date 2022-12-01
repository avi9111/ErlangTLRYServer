%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_gather_skill
%% @Brief  : 采集技能
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_gather_skill).

-export([
    get/1,
    get_ids/0,
    get_skills/0,
    get_coll_skill/1
]).

get({1, 1}) ->
    #{
        id => 1,
        level => 1,
        coll => 1101,
        item => 16240601,
        progress => 10,
        proficiency => 500,
        ratio => 3000,
        reward => 140001,
        reward_quick => 141001        
    };
get({1, 2}) ->
    #{
        id => 1,
        level => 2,
        coll => 1102,
        item => 16240611,
        progress => 10,
        proficiency => 1000,
        ratio => 3000,
        reward => 140002,
        reward_quick => 141002        
    };
get({1, 3}) ->
    #{
        id => 1,
        level => 3,
        coll => 1103,
        item => 16240621,
        progress => 10,
        proficiency => 3000,
        ratio => 3000,
        reward => 140003,
        reward_quick => 141003        
    };
get({1, 4}) ->
    #{
        id => 1,
        level => 4,
        coll => 1104,
        item => 16240631,
        progress => 10,
        proficiency => 2000,
        ratio => 3000,
        reward => 140004,
        reward_quick => 141004        
    };
get({1, 5}) ->
    #{
        id => 1,
        level => 5,
        coll => 1105,
        item => 16240631,
        progress => 10,
        proficiency => 5000,
        ratio => 3000,
        reward => 140005,
        reward_quick => 141005        
    };
get({2, 1}) ->
    #{
        id => 2,
        level => 1,
        coll => 1111,
        item => 16240602,
        progress => 10,
        proficiency => 500,
        ratio => 3000,
        reward => 140006,
        reward_quick => 141006        
    };
get({2, 2}) ->
    #{
        id => 2,
        level => 2,
        coll => 1112,
        item => 16240612,
        progress => 10,
        proficiency => 1000,
        ratio => 3000,
        reward => 140007,
        reward_quick => 141007        
    };
get({2, 3}) ->
    #{
        id => 2,
        level => 3,
        coll => 1113,
        item => 16240622,
        progress => 10,
        proficiency => 3000,
        ratio => 3000,
        reward => 140008,
        reward_quick => 141008        
    };
get({2, 4}) ->
    #{
        id => 2,
        level => 4,
        coll => 1114,
        item => 16240632,
        progress => 10,
        proficiency => 2000,
        ratio => 3000,
        reward => 140009,
        reward_quick => 141009        
    };
get({2, 5}) ->
    #{
        id => 2,
        level => 5,
        coll => 1115,
        item => 16240632,
        progress => 10,
        proficiency => 5000,
        ratio => 3000,
        reward => 140010,
        reward_quick => 141010        
    };
get({3, 1}) ->
    #{
        id => 3,
        level => 1,
        coll => 1121,
        item => 16240603,
        progress => 10,
        proficiency => 500,
        ratio => 3000,
        reward => 140011,
        reward_quick => 141011        
    };
get({3, 2}) ->
    #{
        id => 3,
        level => 2,
        coll => 1122,
        item => 16240613,
        progress => 10,
        proficiency => 1000,
        ratio => 3000,
        reward => 140012,
        reward_quick => 141012        
    };
get({3, 3}) ->
    #{
        id => 3,
        level => 3,
        coll => 1123,
        item => 16240623,
        progress => 10,
        proficiency => 3000,
        ratio => 3000,
        reward => 140013,
        reward_quick => 141013        
    };
get({3, 4}) ->
    #{
        id => 3,
        level => 4,
        coll => 1124,
        item => 16240633,
        progress => 10,
        proficiency => 2000,
        ratio => 3000,
        reward => 140014,
        reward_quick => 141014        
    };
get({3, 5}) ->
    #{
        id => 3,
        level => 5,
        coll => 1125,
        item => 16240633,
        progress => 10,
        proficiency => 5000,
        ratio => 3000,
        reward => 140015,
        reward_quick => 141015        
    };
get({4, 1}) ->
    #{
        id => 4,
        level => 1,
        coll => 1131,
        item => 16240604,
        progress => 10,
        proficiency => 500,
        ratio => 3000,
        reward => 140016,
        reward_quick => 141016        
    };
get({4, 2}) ->
    #{
        id => 4,
        level => 2,
        coll => 1132,
        item => 16240614,
        progress => 10,
        proficiency => 1000,
        ratio => 3000,
        reward => 140017,
        reward_quick => 141017        
    };
get({4, 3}) ->
    #{
        id => 4,
        level => 3,
        coll => 1133,
        item => 16240624,
        progress => 10,
        proficiency => 3000,
        ratio => 3000,
        reward => 140018,
        reward_quick => 141018        
    };
get({4, 4}) ->
    #{
        id => 4,
        level => 4,
        coll => 1134,
        item => 16240634,
        progress => 10,
        proficiency => 2000,
        ratio => 3000,
        reward => 140019,
        reward_quick => 141019        
    };
get({4, 5}) ->
    #{
        id => 4,
        level => 5,
        coll => 1135,
        item => 16240644,
        progress => 10,
        proficiency => 5000,
        ratio => 3000,
        reward => 140020,
        reward_quick => 141020        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [{1, 1}, {1, 2}, {1, 3}, {1, 4}, {1, 5}, {2, 1}, {2, 2}, {2, 3}, {2, 4}, {2, 5}, {3, 1}, {3, 2}, {3, 3}, {3, 4}, {3, 5}, {4, 1}, {4, 2}, {4, 3}, {4, 4}, {4, 5}].

get_skills() ->
    [1, 2, 3, 4].

get_coll_skill(1101) ->
    {1, 1};
get_coll_skill(1102) ->
    {1, 2};
get_coll_skill(1103) ->
    {1, 3};
get_coll_skill(1104) ->
    {1, 4};
get_coll_skill(1105) ->
    {1, 5};
get_coll_skill(1111) ->
    {2, 1};
get_coll_skill(1112) ->
    {2, 2};
get_coll_skill(1113) ->
    {2, 3};
get_coll_skill(1114) ->
    {2, 4};
get_coll_skill(1115) ->
    {2, 5};
get_coll_skill(1121) ->
    {3, 1};
get_coll_skill(1122) ->
    {3, 2};
get_coll_skill(1123) ->
    {3, 3};
get_coll_skill(1124) ->
    {3, 4};
get_coll_skill(1125) ->
    {3, 5};
get_coll_skill(1131) ->
    {4, 1};
get_coll_skill(1132) ->
    {4, 2};
get_coll_skill(1133) ->
    {4, 3};
get_coll_skill(1134) ->
    {4, 4};
get_coll_skill(1135) ->
    {4, 5};
get_coll_skill(_ID) ->
    undefined.
