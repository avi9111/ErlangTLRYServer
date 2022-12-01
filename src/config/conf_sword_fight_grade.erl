%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sword_fight_grade
%% @Brief  : 华山论剑段位奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_sword_fight_grade).

-export([
    get/1
]).

get(Prestige) when Prestige >= 10 andalso Prestige =< 49 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 50 andalso Prestige =< 99 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 100 andalso Prestige =< 149 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 150 andalso Prestige =< 199 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 200 andalso Prestige =< 249 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 250 andalso Prestige =< 289 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 290 andalso Prestige =< 319 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 320 andalso Prestige =< 349 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(Prestige) when Prestige >= 350 andalso Prestige =< 9999 -> [{1,1004},{2,1004},{3,1004},{4,1004}];
get(_Prestige) -> undefined.