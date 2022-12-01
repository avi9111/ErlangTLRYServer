%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_task_reward
%% @Brief  : 帮派任务奖励
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_task_reward).

-export([
    get/3,
    get_types/0
]).

get(Lv, 1, 1) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {171001,50},
        fix_reward => {171001,50}    };
get(Lv, 1, 2) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 1, 3) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 1, 5) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {173001,50},
        fix_reward => {173001,50}    };
get(Lv, 1, 4) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {174001,50},
        fix_reward => {174001,50}    };
get(Lv, 2, 1) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {171001,50},
        fix_reward => {171001,50}    };
get(Lv, 2, 2) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 2, 3) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 2, 5) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {173001,50},
        fix_reward => {173001,50}    };
get(Lv, 2, 4) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {174001,50},
        fix_reward => {174001,50}    };
get(Lv, 3, 1) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {171001,50},
        fix_reward => {171001,50}    };
get(Lv, 3, 2) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 3, 3) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 3, 5) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {173001,50},
        fix_reward => {173001,50}    };
get(Lv, 3, 4) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {174001,50},
        fix_reward => {174001,50}    };
get(Lv, 4, 1) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {171001,50},
        fix_reward => {171001,50}    };
get(Lv, 4, 2) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 4, 3) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 4, 5) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {173001,50},
        fix_reward => {173001,50}    };
get(Lv, 4, 4) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {174001,50},
        fix_reward => {174001,50}    };
get(Lv, 5, 1) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {171001,50},
        fix_reward => {171001,50}    };
get(Lv, 5, 2) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 5, 3) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {172001,50},
        fix_reward => {172001,50}    };
get(Lv, 5, 5) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {173001,50},
        fix_reward => {173001,50}    };
get(Lv, 5, 4) when Lv =< 10 -> 
	#{
        nor_reward => {170001,50},
        mul_reward => {174001,50},
        fix_reward => {174001,50}    };
get(Lv, 1, 1) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {171002,50},
        fix_reward => {171002,50}    };
get(Lv, 1, 2) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 1, 3) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 1, 5) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {173002,50},
        fix_reward => {173002,50}    };
get(Lv, 1, 4) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {174002,50},
        fix_reward => {174002,50}    };
get(Lv, 2, 1) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {171002,50},
        fix_reward => {171002,50}    };
get(Lv, 2, 2) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 2, 3) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 2, 5) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {173002,50},
        fix_reward => {173002,50}    };
get(Lv, 2, 4) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {174002,50},
        fix_reward => {174002,50}    };
get(Lv, 3, 1) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {171002,50},
        fix_reward => {171002,50}    };
get(Lv, 3, 2) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 3, 3) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 3, 5) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {173002,50},
        fix_reward => {173002,50}    };
get(Lv, 3, 4) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {174002,50},
        fix_reward => {174002,50}    };
get(Lv, 4, 1) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {171002,50},
        fix_reward => {171002,50}    };
get(Lv, 4, 2) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 4, 3) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 4, 5) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {173002,50},
        fix_reward => {173002,50}    };
get(Lv, 4, 4) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {174002,50},
        fix_reward => {174002,50}    };
get(Lv, 5, 1) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {171002,50},
        fix_reward => {171002,50}    };
get(Lv, 5, 2) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 5, 3) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {172002,50},
        fix_reward => {172002,50}    };
get(Lv, 5, 5) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {173002,50},
        fix_reward => {173002,50}    };
get(Lv, 5, 4) when Lv =< 11 -> 
	#{
        nor_reward => {170002,50},
        mul_reward => {174002,50},
        fix_reward => {174002,50}    };
get(Lv, 1, 1) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {171003,50},
        fix_reward => {171003,50}    };
get(Lv, 1, 2) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 1, 3) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 1, 5) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {173003,50},
        fix_reward => {173003,50}    };
get(Lv, 1, 4) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {174003,50},
        fix_reward => {174003,50}    };
get(Lv, 2, 1) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {171003,50},
        fix_reward => {171003,50}    };
get(Lv, 2, 2) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 2, 3) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 2, 5) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {173003,50},
        fix_reward => {173003,50}    };
get(Lv, 2, 4) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {174003,50},
        fix_reward => {174003,50}    };
get(Lv, 3, 1) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {171003,50},
        fix_reward => {171003,50}    };
get(Lv, 3, 2) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 3, 3) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 3, 5) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {173003,50},
        fix_reward => {173003,50}    };
get(Lv, 3, 4) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {174003,50},
        fix_reward => {174003,50}    };
get(Lv, 4, 1) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {171003,50},
        fix_reward => {171003,50}    };
get(Lv, 4, 2) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 4, 3) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 4, 5) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {173003,50},
        fix_reward => {173003,50}    };
get(Lv, 4, 4) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {174003,50},
        fix_reward => {174003,50}    };
get(Lv, 5, 1) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {171003,50},
        fix_reward => {171003,50}    };
get(Lv, 5, 2) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 5, 3) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {172003,50},
        fix_reward => {172003,50}    };
get(Lv, 5, 5) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {173003,50},
        fix_reward => {173003,50}    };
get(Lv, 5, 4) when Lv =< 12 -> 
	#{
        nor_reward => {170003,50},
        mul_reward => {174003,50},
        fix_reward => {174003,50}    };
get(Lv, 1, 1) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {171004,50},
        fix_reward => {171004,50}    };
get(Lv, 1, 2) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 1, 3) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 1, 5) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {173004,50},
        fix_reward => {173004,50}    };
get(Lv, 1, 4) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {174004,50},
        fix_reward => {174004,50}    };
get(Lv, 2, 1) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {171004,50},
        fix_reward => {171004,50}    };
get(Lv, 2, 2) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 2, 3) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 2, 5) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {173004,50},
        fix_reward => {173004,50}    };
get(Lv, 2, 4) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {174004,50},
        fix_reward => {174004,50}    };
get(Lv, 3, 1) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {171004,50},
        fix_reward => {171004,50}    };
get(Lv, 3, 2) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 3, 3) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 3, 5) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {173004,50},
        fix_reward => {173004,50}    };
get(Lv, 3, 4) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {174004,50},
        fix_reward => {174004,50}    };
get(Lv, 4, 1) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {171004,50},
        fix_reward => {171004,50}    };
get(Lv, 4, 2) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 4, 3) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 4, 5) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {173004,50},
        fix_reward => {173004,50}    };
get(Lv, 4, 4) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {174004,50},
        fix_reward => {174004,50}    };
get(Lv, 5, 1) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {171004,50},
        fix_reward => {171004,50}    };
get(Lv, 5, 2) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 5, 3) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {172004,50},
        fix_reward => {172004,50}    };
get(Lv, 5, 5) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {173004,50},
        fix_reward => {173004,50}    };
get(Lv, 5, 4) when Lv =< 13 -> 
	#{
        nor_reward => {170004,50},
        mul_reward => {174004,50},
        fix_reward => {174004,50}    };
get(Lv, 1, 1) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {171005,50},
        fix_reward => {171005,50}    };
get(Lv, 1, 2) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 1, 3) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 1, 5) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {173005,50},
        fix_reward => {173005,50}    };
get(Lv, 1, 4) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {174005,50},
        fix_reward => {174005,50}    };
get(Lv, 2, 1) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {171005,50},
        fix_reward => {171005,50}    };
get(Lv, 2, 2) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 2, 3) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 2, 5) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {173005,50},
        fix_reward => {173005,50}    };
get(Lv, 2, 4) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {174005,50},
        fix_reward => {174005,50}    };
get(Lv, 3, 1) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {171005,50},
        fix_reward => {171005,50}    };
get(Lv, 3, 2) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 3, 3) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 3, 5) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {173005,50},
        fix_reward => {173005,50}    };
get(Lv, 3, 4) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {174005,50},
        fix_reward => {174005,50}    };
get(Lv, 4, 1) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {171005,50},
        fix_reward => {171005,50}    };
get(Lv, 4, 2) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 4, 3) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 4, 5) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {173005,50},
        fix_reward => {173005,50}    };
get(Lv, 4, 4) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {174005,50},
        fix_reward => {174005,50}    };
get(Lv, 5, 1) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {171005,50},
        fix_reward => {171005,50}    };
get(Lv, 5, 2) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 5, 3) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {172005,50},
        fix_reward => {172005,50}    };
get(Lv, 5, 5) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {173005,50},
        fix_reward => {173005,50}    };
get(Lv, 5, 4) when Lv =< 14 -> 
	#{
        nor_reward => {170005,50},
        mul_reward => {174005,50},
        fix_reward => {174005,50}    };
get(Lv, 1, 1) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {171006,50},
        fix_reward => {171006,50}    };
get(Lv, 1, 2) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 1, 3) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 1, 5) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {173006,50},
        fix_reward => {173006,50}    };
get(Lv, 1, 4) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {174006,50},
        fix_reward => {174006,50}    };
get(Lv, 2, 1) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {171006,50},
        fix_reward => {171006,50}    };
get(Lv, 2, 2) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 2, 3) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 2, 5) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {173006,50},
        fix_reward => {173006,50}    };
get(Lv, 2, 4) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {174006,50},
        fix_reward => {174006,50}    };
get(Lv, 3, 1) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {171006,50},
        fix_reward => {171006,50}    };
get(Lv, 3, 2) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 3, 3) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 3, 5) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {173006,50},
        fix_reward => {173006,50}    };
get(Lv, 3, 4) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {174006,50},
        fix_reward => {174006,50}    };
get(Lv, 4, 1) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {171006,50},
        fix_reward => {171006,50}    };
get(Lv, 4, 2) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 4, 3) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 4, 5) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {173006,50},
        fix_reward => {173006,50}    };
get(Lv, 4, 4) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {174006,50},
        fix_reward => {174006,50}    };
get(Lv, 5, 1) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {171006,50},
        fix_reward => {171006,50}    };
get(Lv, 5, 2) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 5, 3) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {172006,50},
        fix_reward => {172006,50}    };
get(Lv, 5, 5) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {173006,50},
        fix_reward => {173006,50}    };
get(Lv, 5, 4) when Lv =< 15 -> 
	#{
        nor_reward => {170006,50},
        mul_reward => {174006,50},
        fix_reward => {174006,50}    };
get(Lv, 1, 1) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {171007,50},
        fix_reward => {171007,50}    };
get(Lv, 1, 2) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 1, 3) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 1, 5) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {173007,50},
        fix_reward => {173007,50}    };
get(Lv, 1, 4) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {174007,50},
        fix_reward => {174007,50}    };
get(Lv, 2, 1) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {171007,50},
        fix_reward => {171007,50}    };
get(Lv, 2, 2) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 2, 3) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 2, 5) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {173007,50},
        fix_reward => {173007,50}    };
get(Lv, 2, 4) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {174007,50},
        fix_reward => {174007,50}    };
get(Lv, 3, 1) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {171007,50},
        fix_reward => {171007,50}    };
get(Lv, 3, 2) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 3, 3) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 3, 5) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {173007,50},
        fix_reward => {173007,50}    };
get(Lv, 3, 4) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {174007,50},
        fix_reward => {174007,50}    };
get(Lv, 4, 1) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {171007,50},
        fix_reward => {171007,50}    };
get(Lv, 4, 2) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 4, 3) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 4, 5) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {173007,50},
        fix_reward => {173007,50}    };
get(Lv, 4, 4) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {174007,50},
        fix_reward => {174007,50}    };
get(Lv, 5, 1) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {171007,50},
        fix_reward => {171007,50}    };
get(Lv, 5, 2) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 5, 3) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {172007,50},
        fix_reward => {172007,50}    };
get(Lv, 5, 5) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {173007,50},
        fix_reward => {173007,50}    };
get(Lv, 5, 4) when Lv =< 16 -> 
	#{
        nor_reward => {170007,50},
        mul_reward => {174007,50},
        fix_reward => {174007,50}    };
get(Lv, 1, 1) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {171008,50},
        fix_reward => {171008,50}    };
get(Lv, 1, 2) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 1, 3) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 1, 5) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {173008,50},
        fix_reward => {173008,50}    };
get(Lv, 1, 4) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {174008,50},
        fix_reward => {174008,50}    };
get(Lv, 2, 1) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {171008,50},
        fix_reward => {171008,50}    };
get(Lv, 2, 2) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 2, 3) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 2, 5) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {173008,50},
        fix_reward => {173008,50}    };
get(Lv, 2, 4) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {174008,50},
        fix_reward => {174008,50}    };
get(Lv, 3, 1) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {171008,50},
        fix_reward => {171008,50}    };
get(Lv, 3, 2) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 3, 3) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 3, 5) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {173008,50},
        fix_reward => {173008,50}    };
get(Lv, 3, 4) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {174008,50},
        fix_reward => {174008,50}    };
get(Lv, 4, 1) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {171008,50},
        fix_reward => {171008,50}    };
get(Lv, 4, 2) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 4, 3) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 4, 5) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {173008,50},
        fix_reward => {173008,50}    };
get(Lv, 4, 4) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {174008,50},
        fix_reward => {174008,50}    };
get(Lv, 5, 1) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {171008,50},
        fix_reward => {171008,50}    };
get(Lv, 5, 2) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 5, 3) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {172008,50},
        fix_reward => {172008,50}    };
get(Lv, 5, 5) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {173008,50},
        fix_reward => {173008,50}    };
get(Lv, 5, 4) when Lv =< 17 -> 
	#{
        nor_reward => {170008,50},
        mul_reward => {174008,50},
        fix_reward => {174008,50}    };
get(Lv, 1, 1) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {171009,50},
        fix_reward => {171009,50}    };
get(Lv, 1, 2) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 1, 3) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 1, 5) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {173009,50},
        fix_reward => {173009,50}    };
get(Lv, 1, 4) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {174009,50},
        fix_reward => {174009,50}    };
get(Lv, 2, 1) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {171009,50},
        fix_reward => {171009,50}    };
get(Lv, 2, 2) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 2, 3) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 2, 5) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {173009,50},
        fix_reward => {173009,50}    };
get(Lv, 2, 4) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {174009,50},
        fix_reward => {174009,50}    };
get(Lv, 3, 1) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {171009,50},
        fix_reward => {171009,50}    };
get(Lv, 3, 2) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 3, 3) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 3, 5) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {173009,50},
        fix_reward => {173009,50}    };
get(Lv, 3, 4) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {174009,50},
        fix_reward => {174009,50}    };
get(Lv, 4, 1) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {171009,50},
        fix_reward => {171009,50}    };
get(Lv, 4, 2) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 4, 3) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 4, 5) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {173009,50},
        fix_reward => {173009,50}    };
get(Lv, 4, 4) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {174009,50},
        fix_reward => {174009,50}    };
get(Lv, 5, 1) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {171009,50},
        fix_reward => {171009,50}    };
get(Lv, 5, 2) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 5, 3) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {172009,50},
        fix_reward => {172009,50}    };
get(Lv, 5, 5) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {173009,50},
        fix_reward => {173009,50}    };
get(Lv, 5, 4) when Lv =< 18 -> 
	#{
        nor_reward => {170009,50},
        mul_reward => {174009,50},
        fix_reward => {174009,50}    };
get(Lv, 1, 1) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {171010,50},
        fix_reward => {171010,50}    };
get(Lv, 1, 2) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 1, 3) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 1, 5) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {173010,50},
        fix_reward => {173010,50}    };
get(Lv, 1, 4) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {174010,50},
        fix_reward => {174010,50}    };
get(Lv, 2, 1) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {171010,50},
        fix_reward => {171010,50}    };
get(Lv, 2, 2) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 2, 3) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 2, 5) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {173010,50},
        fix_reward => {173010,50}    };
get(Lv, 2, 4) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {174010,50},
        fix_reward => {174010,50}    };
get(Lv, 3, 1) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {171010,50},
        fix_reward => {171010,50}    };
get(Lv, 3, 2) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 3, 3) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 3, 5) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {173010,50},
        fix_reward => {173010,50}    };
get(Lv, 3, 4) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {174010,50},
        fix_reward => {174010,50}    };
get(Lv, 4, 1) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {171010,50},
        fix_reward => {171010,50}    };
get(Lv, 4, 2) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 4, 3) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 4, 5) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {173010,50},
        fix_reward => {173010,50}    };
get(Lv, 4, 4) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {174010,50},
        fix_reward => {174010,50}    };
get(Lv, 5, 1) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {171010,50},
        fix_reward => {171010,50}    };
get(Lv, 5, 2) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 5, 3) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {172010,50},
        fix_reward => {172010,50}    };
get(Lv, 5, 5) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {173010,50},
        fix_reward => {173010,50}    };
get(Lv, 5, 4) when Lv =< 19 -> 
	#{
        nor_reward => {170010,50},
        mul_reward => {174010,50},
        fix_reward => {174010,50}    };
get(Lv, 1, 1) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {171011,50},
        fix_reward => {171011,50}    };
get(Lv, 1, 2) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 1, 3) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 1, 5) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {173011,50},
        fix_reward => {173011,50}    };
get(Lv, 1, 4) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {174011,50},
        fix_reward => {174011,50}    };
get(Lv, 2, 1) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {171011,50},
        fix_reward => {171011,50}    };
get(Lv, 2, 2) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 2, 3) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 2, 5) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {173011,50},
        fix_reward => {173011,50}    };
get(Lv, 2, 4) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {174011,50},
        fix_reward => {174011,50}    };
get(Lv, 3, 1) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {171011,50},
        fix_reward => {171011,50}    };
get(Lv, 3, 2) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 3, 3) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 3, 5) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {173011,50},
        fix_reward => {173011,50}    };
get(Lv, 3, 4) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {174011,50},
        fix_reward => {174011,50}    };
get(Lv, 4, 1) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {171011,50},
        fix_reward => {171011,50}    };
get(Lv, 4, 2) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 4, 3) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 4, 5) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {173011,50},
        fix_reward => {173011,50}    };
get(Lv, 4, 4) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {174011,50},
        fix_reward => {174011,50}    };
get(Lv, 5, 1) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {171011,50},
        fix_reward => {171011,50}    };
get(Lv, 5, 2) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 5, 3) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {172011,50},
        fix_reward => {172011,50}    };
get(Lv, 5, 5) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {173011,50},
        fix_reward => {173011,50}    };
get(Lv, 5, 4) when Lv =< 20 -> 
	#{
        nor_reward => {170011,50},
        mul_reward => {174011,50},
        fix_reward => {174011,50}    };
get(Lv, 1, 1) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {171012,50},
        fix_reward => {171012,50}    };
get(Lv, 1, 2) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 1, 3) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 1, 5) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {173012,50},
        fix_reward => {173012,50}    };
get(Lv, 1, 4) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {174012,50},
        fix_reward => {174012,50}    };
get(Lv, 2, 1) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {171012,50},
        fix_reward => {171012,50}    };
get(Lv, 2, 2) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 2, 3) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 2, 5) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {173012,50},
        fix_reward => {173012,50}    };
get(Lv, 2, 4) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {174012,50},
        fix_reward => {174012,50}    };
get(Lv, 3, 1) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {171012,50},
        fix_reward => {171012,50}    };
get(Lv, 3, 2) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 3, 3) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 3, 5) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {173012,50},
        fix_reward => {173012,50}    };
get(Lv, 3, 4) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {174012,50},
        fix_reward => {174012,50}    };
get(Lv, 4, 1) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {171012,50},
        fix_reward => {171012,50}    };
get(Lv, 4, 2) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 4, 3) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 4, 5) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {173012,50},
        fix_reward => {173012,50}    };
get(Lv, 4, 4) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {174012,50},
        fix_reward => {174012,50}    };
get(Lv, 5, 1) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {171012,50},
        fix_reward => {171012,50}    };
get(Lv, 5, 2) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 5, 3) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {172012,50},
        fix_reward => {172012,50}    };
get(Lv, 5, 5) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {173012,50},
        fix_reward => {173012,50}    };
get(Lv, 5, 4) when Lv =< 21 -> 
	#{
        nor_reward => {170012,50},
        mul_reward => {174012,50},
        fix_reward => {174012,50}    };
get(Lv, 1, 1) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {171013,50},
        fix_reward => {171013,50}    };
get(Lv, 1, 2) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 1, 3) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 1, 5) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {173013,50},
        fix_reward => {173013,50}    };
get(Lv, 1, 4) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {174013,50},
        fix_reward => {174013,50}    };
get(Lv, 2, 1) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {171013,50},
        fix_reward => {171013,50}    };
get(Lv, 2, 2) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 2, 3) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 2, 5) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {173013,50},
        fix_reward => {173013,50}    };
get(Lv, 2, 4) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {174013,50},
        fix_reward => {174013,50}    };
get(Lv, 3, 1) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {171013,50},
        fix_reward => {171013,50}    };
get(Lv, 3, 2) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 3, 3) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 3, 5) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {173013,50},
        fix_reward => {173013,50}    };
get(Lv, 3, 4) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {174013,50},
        fix_reward => {174013,50}    };
get(Lv, 4, 1) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {171013,50},
        fix_reward => {171013,50}    };
get(Lv, 4, 2) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 4, 3) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 4, 5) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {173013,50},
        fix_reward => {173013,50}    };
get(Lv, 4, 4) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {174013,50},
        fix_reward => {174013,50}    };
get(Lv, 5, 1) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {171013,50},
        fix_reward => {171013,50}    };
get(Lv, 5, 2) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 5, 3) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {172013,50},
        fix_reward => {172013,50}    };
get(Lv, 5, 5) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {173013,50},
        fix_reward => {173013,50}    };
get(Lv, 5, 4) when Lv =< 22 -> 
	#{
        nor_reward => {170013,50},
        mul_reward => {174013,50},
        fix_reward => {174013,50}    };
get(Lv, 1, 1) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {171014,50},
        fix_reward => {171014,50}    };
get(Lv, 1, 2) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 1, 3) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 1, 5) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {173014,50},
        fix_reward => {173014,50}    };
get(Lv, 1, 4) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {174014,50},
        fix_reward => {174014,50}    };
get(Lv, 2, 1) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {171014,50},
        fix_reward => {171014,50}    };
get(Lv, 2, 2) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 2, 3) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 2, 5) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {173014,50},
        fix_reward => {173014,50}    };
get(Lv, 2, 4) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {174014,50},
        fix_reward => {174014,50}    };
get(Lv, 3, 1) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {171014,50},
        fix_reward => {171014,50}    };
get(Lv, 3, 2) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 3, 3) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 3, 5) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {173014,50},
        fix_reward => {173014,50}    };
get(Lv, 3, 4) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {174014,50},
        fix_reward => {174014,50}    };
get(Lv, 4, 1) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {171014,50},
        fix_reward => {171014,50}    };
get(Lv, 4, 2) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 4, 3) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 4, 5) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {173014,50},
        fix_reward => {173014,50}    };
get(Lv, 4, 4) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {174014,50},
        fix_reward => {174014,50}    };
get(Lv, 5, 1) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {171014,50},
        fix_reward => {171014,50}    };
get(Lv, 5, 2) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 5, 3) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {172014,50},
        fix_reward => {172014,50}    };
get(Lv, 5, 5) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {173014,50},
        fix_reward => {173014,50}    };
get(Lv, 5, 4) when Lv =< 23 -> 
	#{
        nor_reward => {170014,50},
        mul_reward => {174014,50},
        fix_reward => {174014,50}    };
get(Lv, 1, 1) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {171015,50},
        fix_reward => {171015,50}    };
get(Lv, 1, 2) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 1, 3) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 1, 5) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {173015,50},
        fix_reward => {173015,50}    };
get(Lv, 1, 4) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {174015,50},
        fix_reward => {174015,50}    };
get(Lv, 2, 1) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {171015,50},
        fix_reward => {171015,50}    };
get(Lv, 2, 2) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 2, 3) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 2, 5) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {173015,50},
        fix_reward => {173015,50}    };
get(Lv, 2, 4) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {174015,50},
        fix_reward => {174015,50}    };
get(Lv, 3, 1) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {171015,50},
        fix_reward => {171015,50}    };
get(Lv, 3, 2) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 3, 3) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 3, 5) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {173015,50},
        fix_reward => {173015,50}    };
get(Lv, 3, 4) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {174015,50},
        fix_reward => {174015,50}    };
get(Lv, 4, 1) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {171015,50},
        fix_reward => {171015,50}    };
get(Lv, 4, 2) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 4, 3) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 4, 5) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {173015,50},
        fix_reward => {173015,50}    };
get(Lv, 4, 4) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {174015,50},
        fix_reward => {174015,50}    };
get(Lv, 5, 1) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {171015,50},
        fix_reward => {171015,50}    };
get(Lv, 5, 2) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 5, 3) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {172015,50},
        fix_reward => {172015,50}    };
get(Lv, 5, 5) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {173015,50},
        fix_reward => {173015,50}    };
get(Lv, 5, 4) when Lv =< 24 -> 
	#{
        nor_reward => {170015,50},
        mul_reward => {174015,50},
        fix_reward => {174015,50}    };
get(Lv, 1, 1) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {171016,50},
        fix_reward => {171016,50}    };
get(Lv, 1, 2) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 1, 3) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 1, 5) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {173016,50},
        fix_reward => {173016,50}    };
get(Lv, 1, 4) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {174016,50},
        fix_reward => {174016,50}    };
get(Lv, 2, 1) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {171016,50},
        fix_reward => {171016,50}    };
get(Lv, 2, 2) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 2, 3) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 2, 5) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {173016,50},
        fix_reward => {173016,50}    };
get(Lv, 2, 4) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {174016,50},
        fix_reward => {174016,50}    };
get(Lv, 3, 1) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {171016,50},
        fix_reward => {171016,50}    };
get(Lv, 3, 2) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 3, 3) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 3, 5) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {173016,50},
        fix_reward => {173016,50}    };
get(Lv, 3, 4) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {174016,50},
        fix_reward => {174016,50}    };
get(Lv, 4, 1) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {171016,50},
        fix_reward => {171016,50}    };
get(Lv, 4, 2) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 4, 3) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 4, 5) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {173016,50},
        fix_reward => {173016,50}    };
get(Lv, 4, 4) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {174016,50},
        fix_reward => {174016,50}    };
get(Lv, 5, 1) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {171016,50},
        fix_reward => {171016,50}    };
get(Lv, 5, 2) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 5, 3) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {172016,50},
        fix_reward => {172016,50}    };
get(Lv, 5, 5) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {173016,50},
        fix_reward => {173016,50}    };
get(Lv, 5, 4) when Lv =< 25 -> 
	#{
        nor_reward => {170016,50},
        mul_reward => {174016,50},
        fix_reward => {174016,50}    };
get(Lv, 1, 1) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {171017,50},
        fix_reward => {171017,50}    };
get(Lv, 1, 2) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 1, 3) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 1, 5) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {173017,50},
        fix_reward => {173017,50}    };
get(Lv, 1, 4) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {174017,50},
        fix_reward => {174017,50}    };
get(Lv, 2, 1) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {171017,50},
        fix_reward => {171017,50}    };
get(Lv, 2, 2) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 2, 3) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 2, 5) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {173017,50},
        fix_reward => {173017,50}    };
get(Lv, 2, 4) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {174017,50},
        fix_reward => {174017,50}    };
get(Lv, 3, 1) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {171017,50},
        fix_reward => {171017,50}    };
get(Lv, 3, 2) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 3, 3) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 3, 5) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {173017,50},
        fix_reward => {173017,50}    };
get(Lv, 3, 4) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {174017,50},
        fix_reward => {174017,50}    };
get(Lv, 4, 1) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {171017,50},
        fix_reward => {171017,50}    };
get(Lv, 4, 2) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 4, 3) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 4, 5) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {173017,50},
        fix_reward => {173017,50}    };
get(Lv, 4, 4) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {174017,50},
        fix_reward => {174017,50}    };
get(Lv, 5, 1) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {171017,50},
        fix_reward => {171017,50}    };
get(Lv, 5, 2) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 5, 3) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {172017,50},
        fix_reward => {172017,50}    };
get(Lv, 5, 5) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {173017,50},
        fix_reward => {173017,50}    };
get(Lv, 5, 4) when Lv =< 26 -> 
	#{
        nor_reward => {170017,50},
        mul_reward => {174017,50},
        fix_reward => {174017,50}    };
get(Lv, 1, 1) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {171018,50},
        fix_reward => {171018,50}    };
get(Lv, 1, 2) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 1, 3) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 1, 5) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {173018,50},
        fix_reward => {173018,50}    };
get(Lv, 1, 4) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {174018,50},
        fix_reward => {174018,50}    };
get(Lv, 2, 1) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {171018,50},
        fix_reward => {171018,50}    };
get(Lv, 2, 2) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 2, 3) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 2, 5) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {173018,50},
        fix_reward => {173018,50}    };
get(Lv, 2, 4) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {174018,50},
        fix_reward => {174018,50}    };
get(Lv, 3, 1) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {171018,50},
        fix_reward => {171018,50}    };
get(Lv, 3, 2) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 3, 3) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 3, 5) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {173018,50},
        fix_reward => {173018,50}    };
get(Lv, 3, 4) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {174018,50},
        fix_reward => {174018,50}    };
get(Lv, 4, 1) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {171018,50},
        fix_reward => {171018,50}    };
get(Lv, 4, 2) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 4, 3) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 4, 5) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {173018,50},
        fix_reward => {173018,50}    };
get(Lv, 4, 4) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {174018,50},
        fix_reward => {174018,50}    };
get(Lv, 5, 1) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {171018,50},
        fix_reward => {171018,50}    };
get(Lv, 5, 2) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 5, 3) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {172018,50},
        fix_reward => {172018,50}    };
get(Lv, 5, 5) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {173018,50},
        fix_reward => {173018,50}    };
get(Lv, 5, 4) when Lv =< 27 -> 
	#{
        nor_reward => {170018,50},
        mul_reward => {174018,50},
        fix_reward => {174018,50}    };
get(Lv, 1, 1) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {171019,50},
        fix_reward => {171019,50}    };
get(Lv, 1, 2) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 1, 3) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 1, 5) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {173019,50},
        fix_reward => {173019,50}    };
get(Lv, 1, 4) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {174019,50},
        fix_reward => {174019,50}    };
get(Lv, 2, 1) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {171019,50},
        fix_reward => {171019,50}    };
get(Lv, 2, 2) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 2, 3) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 2, 5) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {173019,50},
        fix_reward => {173019,50}    };
get(Lv, 2, 4) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {174019,50},
        fix_reward => {174019,50}    };
get(Lv, 3, 1) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {171019,50},
        fix_reward => {171019,50}    };
get(Lv, 3, 2) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 3, 3) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 3, 5) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {173019,50},
        fix_reward => {173019,50}    };
get(Lv, 3, 4) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {174019,50},
        fix_reward => {174019,50}    };
get(Lv, 4, 1) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {171019,50},
        fix_reward => {171019,50}    };
get(Lv, 4, 2) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 4, 3) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 4, 5) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {173019,50},
        fix_reward => {173019,50}    };
get(Lv, 4, 4) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {174019,50},
        fix_reward => {174019,50}    };
get(Lv, 5, 1) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {171019,50},
        fix_reward => {171019,50}    };
get(Lv, 5, 2) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 5, 3) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {172019,50},
        fix_reward => {172019,50}    };
get(Lv, 5, 5) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {173019,50},
        fix_reward => {173019,50}    };
get(Lv, 5, 4) when Lv =< 28 -> 
	#{
        nor_reward => {170019,50},
        mul_reward => {174019,50},
        fix_reward => {174019,50}    };
get(Lv, 1, 1) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {171020,50},
        fix_reward => {171020,50}    };
get(Lv, 1, 2) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 1, 3) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 1, 5) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {173020,50},
        fix_reward => {173020,50}    };
get(Lv, 1, 4) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {174020,50},
        fix_reward => {174020,50}    };
get(Lv, 2, 1) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {171020,50},
        fix_reward => {171020,50}    };
get(Lv, 2, 2) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 2, 3) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 2, 5) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {173020,50},
        fix_reward => {173020,50}    };
get(Lv, 2, 4) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {174020,50},
        fix_reward => {174020,50}    };
get(Lv, 3, 1) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {171020,50},
        fix_reward => {171020,50}    };
get(Lv, 3, 2) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 3, 3) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 3, 5) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {173020,50},
        fix_reward => {173020,50}    };
get(Lv, 3, 4) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {174020,50},
        fix_reward => {174020,50}    };
get(Lv, 4, 1) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {171020,50},
        fix_reward => {171020,50}    };
get(Lv, 4, 2) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 4, 3) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 4, 5) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {173020,50},
        fix_reward => {173020,50}    };
get(Lv, 4, 4) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {174020,50},
        fix_reward => {174020,50}    };
get(Lv, 5, 1) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {171020,50},
        fix_reward => {171020,50}    };
get(Lv, 5, 2) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 5, 3) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {172020,50},
        fix_reward => {172020,50}    };
get(Lv, 5, 5) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {173020,50},
        fix_reward => {173020,50}    };
get(Lv, 5, 4) when Lv =< 29 -> 
	#{
        nor_reward => {170020,50},
        mul_reward => {174020,50},
        fix_reward => {174020,50}    };
get(Lv, 1, 1) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {171021,50},
        fix_reward => {171021,50}    };
get(Lv, 1, 2) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 1, 3) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 1, 5) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {173021,50},
        fix_reward => {173021,50}    };
get(Lv, 1, 4) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {174021,50},
        fix_reward => {174021,50}    };
get(Lv, 2, 1) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {171021,50},
        fix_reward => {171021,50}    };
get(Lv, 2, 2) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 2, 3) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 2, 5) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {173021,50},
        fix_reward => {173021,50}    };
get(Lv, 2, 4) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {174021,50},
        fix_reward => {174021,50}    };
get(Lv, 3, 1) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {171021,50},
        fix_reward => {171021,50}    };
get(Lv, 3, 2) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 3, 3) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 3, 5) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {173021,50},
        fix_reward => {173021,50}    };
get(Lv, 3, 4) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {174021,50},
        fix_reward => {174021,50}    };
get(Lv, 4, 1) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {171021,50},
        fix_reward => {171021,50}    };
get(Lv, 4, 2) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 4, 3) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 4, 5) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {173021,50},
        fix_reward => {173021,50}    };
get(Lv, 4, 4) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {174021,50},
        fix_reward => {174021,50}    };
get(Lv, 5, 1) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {171021,50},
        fix_reward => {171021,50}    };
get(Lv, 5, 2) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 5, 3) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {172021,50},
        fix_reward => {172021,50}    };
get(Lv, 5, 5) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {173021,50},
        fix_reward => {173021,50}    };
get(Lv, 5, 4) when Lv =< 30 -> 
	#{
        nor_reward => {170021,50},
        mul_reward => {174021,50},
        fix_reward => {174021,50}    };
get(Lv, 1, 1) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {171022,50},
        fix_reward => {171022,50}    };
get(Lv, 1, 2) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 1, 3) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 1, 5) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {173022,50},
        fix_reward => {173022,50}    };
get(Lv, 1, 4) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {174022,50},
        fix_reward => {174022,50}    };
get(Lv, 2, 1) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {171022,50},
        fix_reward => {171022,50}    };
get(Lv, 2, 2) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 2, 3) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 2, 5) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {173022,50},
        fix_reward => {173022,50}    };
get(Lv, 2, 4) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {174022,50},
        fix_reward => {174022,50}    };
get(Lv, 3, 1) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {171022,50},
        fix_reward => {171022,50}    };
get(Lv, 3, 2) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 3, 3) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 3, 5) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {173022,50},
        fix_reward => {173022,50}    };
get(Lv, 3, 4) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {174022,50},
        fix_reward => {174022,50}    };
get(Lv, 4, 1) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {171022,50},
        fix_reward => {171022,50}    };
get(Lv, 4, 2) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 4, 3) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 4, 5) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {173022,50},
        fix_reward => {173022,50}    };
get(Lv, 4, 4) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {174022,50},
        fix_reward => {174022,50}    };
get(Lv, 5, 1) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {171022,50},
        fix_reward => {171022,50}    };
get(Lv, 5, 2) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 5, 3) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {172022,50},
        fix_reward => {172022,50}    };
get(Lv, 5, 5) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {173022,50},
        fix_reward => {173022,50}    };
get(Lv, 5, 4) when Lv =< 31 -> 
	#{
        nor_reward => {170022,50},
        mul_reward => {174022,50},
        fix_reward => {174022,50}    };
get(Lv, 1, 1) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {171023,50},
        fix_reward => {171023,50}    };
get(Lv, 1, 2) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 1, 3) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 1, 5) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {173023,50},
        fix_reward => {173023,50}    };
get(Lv, 1, 4) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {174023,50},
        fix_reward => {174023,50}    };
get(Lv, 2, 1) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {171023,50},
        fix_reward => {171023,50}    };
get(Lv, 2, 2) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 2, 3) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 2, 5) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {173023,50},
        fix_reward => {173023,50}    };
get(Lv, 2, 4) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {174023,50},
        fix_reward => {174023,50}    };
get(Lv, 3, 1) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {171023,50},
        fix_reward => {171023,50}    };
get(Lv, 3, 2) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 3, 3) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 3, 5) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {173023,50},
        fix_reward => {173023,50}    };
get(Lv, 3, 4) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {174023,50},
        fix_reward => {174023,50}    };
get(Lv, 4, 1) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {171023,50},
        fix_reward => {171023,50}    };
get(Lv, 4, 2) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 4, 3) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 4, 5) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {173023,50},
        fix_reward => {173023,50}    };
get(Lv, 4, 4) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {174023,50},
        fix_reward => {174023,50}    };
get(Lv, 5, 1) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {171023,50},
        fix_reward => {171023,50}    };
get(Lv, 5, 2) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 5, 3) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {172023,50},
        fix_reward => {172023,50}    };
get(Lv, 5, 5) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {173023,50},
        fix_reward => {173023,50}    };
get(Lv, 5, 4) when Lv =< 32 -> 
	#{
        nor_reward => {170023,50},
        mul_reward => {174023,50},
        fix_reward => {174023,50}    };
get(Lv, 1, 1) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {171024,50},
        fix_reward => {171024,50}    };
get(Lv, 1, 2) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 1, 3) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 1, 5) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {173024,50},
        fix_reward => {173024,50}    };
get(Lv, 1, 4) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {174024,50},
        fix_reward => {174024,50}    };
get(Lv, 2, 1) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {171024,50},
        fix_reward => {171024,50}    };
get(Lv, 2, 2) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 2, 3) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 2, 5) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {173024,50},
        fix_reward => {173024,50}    };
get(Lv, 2, 4) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {174024,50},
        fix_reward => {174024,50}    };
get(Lv, 3, 1) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {171024,50},
        fix_reward => {171024,50}    };
get(Lv, 3, 2) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 3, 3) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 3, 5) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {173024,50},
        fix_reward => {173024,50}    };
get(Lv, 3, 4) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {174024,50},
        fix_reward => {174024,50}    };
get(Lv, 4, 1) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {171024,50},
        fix_reward => {171024,50}    };
get(Lv, 4, 2) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 4, 3) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 4, 5) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {173024,50},
        fix_reward => {173024,50}    };
get(Lv, 4, 4) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {174024,50},
        fix_reward => {174024,50}    };
get(Lv, 5, 1) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {171024,50},
        fix_reward => {171024,50}    };
get(Lv, 5, 2) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 5, 3) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {172024,50},
        fix_reward => {172024,50}    };
get(Lv, 5, 5) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {173024,50},
        fix_reward => {173024,50}    };
get(Lv, 5, 4) when Lv =< 33 -> 
	#{
        nor_reward => {170024,50},
        mul_reward => {174024,50},
        fix_reward => {174024,50}    };
get(Lv, 1, 1) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {171025,50},
        fix_reward => {171025,50}    };
get(Lv, 1, 2) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 1, 3) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 1, 5) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {173025,50},
        fix_reward => {173025,50}    };
get(Lv, 1, 4) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {174025,50},
        fix_reward => {174025,50}    };
get(Lv, 2, 1) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {171025,50},
        fix_reward => {171025,50}    };
get(Lv, 2, 2) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 2, 3) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 2, 5) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {173025,50},
        fix_reward => {173025,50}    };
get(Lv, 2, 4) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {174025,50},
        fix_reward => {174025,50}    };
get(Lv, 3, 1) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {171025,50},
        fix_reward => {171025,50}    };
get(Lv, 3, 2) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 3, 3) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 3, 5) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {173025,50},
        fix_reward => {173025,50}    };
get(Lv, 3, 4) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {174025,50},
        fix_reward => {174025,50}    };
get(Lv, 4, 1) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {171025,50},
        fix_reward => {171025,50}    };
get(Lv, 4, 2) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 4, 3) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 4, 5) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {173025,50},
        fix_reward => {173025,50}    };
get(Lv, 4, 4) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {174025,50},
        fix_reward => {174025,50}    };
get(Lv, 5, 1) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {171025,50},
        fix_reward => {171025,50}    };
get(Lv, 5, 2) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 5, 3) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {172025,50},
        fix_reward => {172025,50}    };
get(Lv, 5, 5) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {173025,50},
        fix_reward => {173025,50}    };
get(Lv, 5, 4) when Lv =< 34 -> 
	#{
        nor_reward => {170025,50},
        mul_reward => {174025,50},
        fix_reward => {174025,50}    };
get(Lv, 1, 1) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {171026,50},
        fix_reward => {171026,50}    };
get(Lv, 1, 2) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 1, 3) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 1, 5) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {173026,50},
        fix_reward => {173026,50}    };
get(Lv, 1, 4) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {174026,50},
        fix_reward => {174026,50}    };
get(Lv, 2, 1) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {171026,50},
        fix_reward => {171026,50}    };
get(Lv, 2, 2) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 2, 3) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 2, 5) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {173026,50},
        fix_reward => {173026,50}    };
get(Lv, 2, 4) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {174026,50},
        fix_reward => {174026,50}    };
get(Lv, 3, 1) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {171026,50},
        fix_reward => {171026,50}    };
get(Lv, 3, 2) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 3, 3) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 3, 5) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {173026,50},
        fix_reward => {173026,50}    };
get(Lv, 3, 4) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {174026,50},
        fix_reward => {174026,50}    };
get(Lv, 4, 1) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {171026,50},
        fix_reward => {171026,50}    };
get(Lv, 4, 2) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 4, 3) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 4, 5) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {173026,50},
        fix_reward => {173026,50}    };
get(Lv, 4, 4) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {174026,50},
        fix_reward => {174026,50}    };
get(Lv, 5, 1) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {171026,50},
        fix_reward => {171026,50}    };
get(Lv, 5, 2) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 5, 3) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {172026,50},
        fix_reward => {172026,50}    };
get(Lv, 5, 5) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {173026,50},
        fix_reward => {173026,50}    };
get(Lv, 5, 4) when Lv =< 35 -> 
	#{
        nor_reward => {170026,50},
        mul_reward => {174026,50},
        fix_reward => {174026,50}    };
get(Lv, 1, 1) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {171027,50},
        fix_reward => {171027,50}    };
get(Lv, 1, 2) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 1, 3) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 1, 5) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {173027,50},
        fix_reward => {173027,50}    };
get(Lv, 1, 4) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {174027,50},
        fix_reward => {174027,50}    };
get(Lv, 2, 1) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {171027,50},
        fix_reward => {171027,50}    };
get(Lv, 2, 2) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 2, 3) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 2, 5) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {173027,50},
        fix_reward => {173027,50}    };
get(Lv, 2, 4) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {174027,50},
        fix_reward => {174027,50}    };
get(Lv, 3, 1) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {171027,50},
        fix_reward => {171027,50}    };
get(Lv, 3, 2) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 3, 3) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 3, 5) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {173027,50},
        fix_reward => {173027,50}    };
get(Lv, 3, 4) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {174027,50},
        fix_reward => {174027,50}    };
get(Lv, 4, 1) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {171027,50},
        fix_reward => {171027,50}    };
get(Lv, 4, 2) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 4, 3) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 4, 5) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {173027,50},
        fix_reward => {173027,50}    };
get(Lv, 4, 4) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {174027,50},
        fix_reward => {174027,50}    };
get(Lv, 5, 1) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {171027,50},
        fix_reward => {171027,50}    };
get(Lv, 5, 2) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 5, 3) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {172027,50},
        fix_reward => {172027,50}    };
get(Lv, 5, 5) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {173027,50},
        fix_reward => {173027,50}    };
get(Lv, 5, 4) when Lv =< 36 -> 
	#{
        nor_reward => {170027,50},
        mul_reward => {174027,50},
        fix_reward => {174027,50}    };
get(Lv, 1, 1) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {171028,50},
        fix_reward => {171028,50}    };
get(Lv, 1, 2) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 1, 3) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 1, 5) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {173028,50},
        fix_reward => {173028,50}    };
get(Lv, 1, 4) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {174028,50},
        fix_reward => {174028,50}    };
get(Lv, 2, 1) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {171028,50},
        fix_reward => {171028,50}    };
get(Lv, 2, 2) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 2, 3) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 2, 5) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {173028,50},
        fix_reward => {173028,50}    };
get(Lv, 2, 4) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {174028,50},
        fix_reward => {174028,50}    };
get(Lv, 3, 1) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {171028,50},
        fix_reward => {171028,50}    };
get(Lv, 3, 2) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 3, 3) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 3, 5) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {173028,50},
        fix_reward => {173028,50}    };
get(Lv, 3, 4) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {174028,50},
        fix_reward => {174028,50}    };
get(Lv, 4, 1) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {171028,50},
        fix_reward => {171028,50}    };
get(Lv, 4, 2) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 4, 3) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 4, 5) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {173028,50},
        fix_reward => {173028,50}    };
get(Lv, 4, 4) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {174028,50},
        fix_reward => {174028,50}    };
get(Lv, 5, 1) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {171028,50},
        fix_reward => {171028,50}    };
get(Lv, 5, 2) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 5, 3) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {172028,50},
        fix_reward => {172028,50}    };
get(Lv, 5, 5) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {173028,50},
        fix_reward => {173028,50}    };
get(Lv, 5, 4) when Lv =< 37 -> 
	#{
        nor_reward => {170028,50},
        mul_reward => {174028,50},
        fix_reward => {174028,50}    };
get(Lv, 1, 1) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {171029,50},
        fix_reward => {171029,50}    };
get(Lv, 1, 2) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 1, 3) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 1, 5) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {173029,50},
        fix_reward => {173029,50}    };
get(Lv, 1, 4) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {174029,50},
        fix_reward => {174029,50}    };
get(Lv, 2, 1) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {171029,50},
        fix_reward => {171029,50}    };
get(Lv, 2, 2) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 2, 3) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 2, 5) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {173029,50},
        fix_reward => {173029,50}    };
get(Lv, 2, 4) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {174029,50},
        fix_reward => {174029,50}    };
get(Lv, 3, 1) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {171029,50},
        fix_reward => {171029,50}    };
get(Lv, 3, 2) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 3, 3) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 3, 5) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {173029,50},
        fix_reward => {173029,50}    };
get(Lv, 3, 4) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {174029,50},
        fix_reward => {174029,50}    };
get(Lv, 4, 1) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {171029,50},
        fix_reward => {171029,50}    };
get(Lv, 4, 2) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 4, 3) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 4, 5) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {173029,50},
        fix_reward => {173029,50}    };
get(Lv, 4, 4) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {174029,50},
        fix_reward => {174029,50}    };
get(Lv, 5, 1) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {171029,50},
        fix_reward => {171029,50}    };
get(Lv, 5, 2) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 5, 3) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {172029,50},
        fix_reward => {172029,50}    };
get(Lv, 5, 5) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {173029,50},
        fix_reward => {173029,50}    };
get(Lv, 5, 4) when Lv =< 38 -> 
	#{
        nor_reward => {170029,50},
        mul_reward => {174029,50},
        fix_reward => {174029,50}    };
get(Lv, 1, 1) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {171030,50},
        fix_reward => {171030,50}    };
get(Lv, 1, 2) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 1, 3) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 1, 5) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {173030,50},
        fix_reward => {173030,50}    };
get(Lv, 1, 4) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {174030,50},
        fix_reward => {174030,50}    };
get(Lv, 2, 1) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {171030,50},
        fix_reward => {171030,50}    };
get(Lv, 2, 2) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 2, 3) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 2, 5) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {173030,50},
        fix_reward => {173030,50}    };
get(Lv, 2, 4) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {174030,50},
        fix_reward => {174030,50}    };
get(Lv, 3, 1) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {171030,50},
        fix_reward => {171030,50}    };
get(Lv, 3, 2) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 3, 3) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 3, 5) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {173030,50},
        fix_reward => {173030,50}    };
get(Lv, 3, 4) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {174030,50},
        fix_reward => {174030,50}    };
get(Lv, 4, 1) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {171030,50},
        fix_reward => {171030,50}    };
get(Lv, 4, 2) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 4, 3) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 4, 5) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {173030,50},
        fix_reward => {173030,50}    };
get(Lv, 4, 4) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {174030,50},
        fix_reward => {174030,50}    };
get(Lv, 5, 1) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {171030,50},
        fix_reward => {171030,50}    };
get(Lv, 5, 2) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 5, 3) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {172030,50},
        fix_reward => {172030,50}    };
get(Lv, 5, 5) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {173030,50},
        fix_reward => {173030,50}    };
get(Lv, 5, 4) when Lv =< 39 -> 
	#{
        nor_reward => {170030,50},
        mul_reward => {174030,50},
        fix_reward => {174030,50}    };
get(Lv, 1, 1) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {171031,50},
        fix_reward => {171031,50}    };
get(Lv, 1, 2) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 1, 3) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 1, 5) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {173031,50},
        fix_reward => {173031,50}    };
get(Lv, 1, 4) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {174031,50},
        fix_reward => {174031,50}    };
get(Lv, 2, 1) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {171031,50},
        fix_reward => {171031,50}    };
get(Lv, 2, 2) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 2, 3) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 2, 5) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {173031,50},
        fix_reward => {173031,50}    };
get(Lv, 2, 4) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {174031,50},
        fix_reward => {174031,50}    };
get(Lv, 3, 1) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {171031,50},
        fix_reward => {171031,50}    };
get(Lv, 3, 2) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 3, 3) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 3, 5) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {173031,50},
        fix_reward => {173031,50}    };
get(Lv, 3, 4) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {174031,50},
        fix_reward => {174031,50}    };
get(Lv, 4, 1) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {171031,50},
        fix_reward => {171031,50}    };
get(Lv, 4, 2) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 4, 3) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 4, 5) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {173031,50},
        fix_reward => {173031,50}    };
get(Lv, 4, 4) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {174031,50},
        fix_reward => {174031,50}    };
get(Lv, 5, 1) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {171031,50},
        fix_reward => {171031,50}    };
get(Lv, 5, 2) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 5, 3) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {172031,50},
        fix_reward => {172031,50}    };
get(Lv, 5, 5) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {173031,50},
        fix_reward => {173031,50}    };
get(Lv, 5, 4) when Lv =< 40 -> 
	#{
        nor_reward => {170031,50},
        mul_reward => {174031,50},
        fix_reward => {174031,50}    };
get(Lv, 1, 1) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {171032,50},
        fix_reward => {171032,50}    };
get(Lv, 1, 2) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 1, 3) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 1, 5) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {173032,50},
        fix_reward => {173032,50}    };
get(Lv, 1, 4) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {174032,50},
        fix_reward => {174032,50}    };
get(Lv, 2, 1) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {171032,50},
        fix_reward => {171032,50}    };
get(Lv, 2, 2) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 2, 3) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 2, 5) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {173032,50},
        fix_reward => {173032,50}    };
get(Lv, 2, 4) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {174032,50},
        fix_reward => {174032,50}    };
get(Lv, 3, 1) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {171032,50},
        fix_reward => {171032,50}    };
get(Lv, 3, 2) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 3, 3) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 3, 5) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {173032,50},
        fix_reward => {173032,50}    };
get(Lv, 3, 4) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {174032,50},
        fix_reward => {174032,50}    };
get(Lv, 4, 1) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {171032,50},
        fix_reward => {171032,50}    };
get(Lv, 4, 2) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 4, 3) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 4, 5) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {173032,50},
        fix_reward => {173032,50}    };
get(Lv, 4, 4) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {174032,50},
        fix_reward => {174032,50}    };
get(Lv, 5, 1) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {171032,50},
        fix_reward => {171032,50}    };
get(Lv, 5, 2) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 5, 3) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {172032,50},
        fix_reward => {172032,50}    };
get(Lv, 5, 5) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {173032,50},
        fix_reward => {173032,50}    };
get(Lv, 5, 4) when Lv =< 41 -> 
	#{
        nor_reward => {170032,50},
        mul_reward => {174032,50},
        fix_reward => {174032,50}    };
get(Lv, 1, 1) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {171033,50},
        fix_reward => {171033,50}    };
get(Lv, 1, 2) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 1, 3) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 1, 5) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {173033,50},
        fix_reward => {173033,50}    };
get(Lv, 1, 4) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {174033,50},
        fix_reward => {174033,50}    };
get(Lv, 2, 1) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {171033,50},
        fix_reward => {171033,50}    };
get(Lv, 2, 2) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 2, 3) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 2, 5) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {173033,50},
        fix_reward => {173033,50}    };
get(Lv, 2, 4) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {174033,50},
        fix_reward => {174033,50}    };
get(Lv, 3, 1) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {171033,50},
        fix_reward => {171033,50}    };
get(Lv, 3, 2) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 3, 3) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 3, 5) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {173033,50},
        fix_reward => {173033,50}    };
get(Lv, 3, 4) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {174033,50},
        fix_reward => {174033,50}    };
get(Lv, 4, 1) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {171033,50},
        fix_reward => {171033,50}    };
get(Lv, 4, 2) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 4, 3) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 4, 5) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {173033,50},
        fix_reward => {173033,50}    };
get(Lv, 4, 4) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {174033,50},
        fix_reward => {174033,50}    };
get(Lv, 5, 1) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {171033,50},
        fix_reward => {171033,50}    };
get(Lv, 5, 2) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 5, 3) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {172033,50},
        fix_reward => {172033,50}    };
get(Lv, 5, 5) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {173033,50},
        fix_reward => {173033,50}    };
get(Lv, 5, 4) when Lv =< 42 -> 
	#{
        nor_reward => {170033,50},
        mul_reward => {174033,50},
        fix_reward => {174033,50}    };
get(Lv, 1, 1) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {171034,50},
        fix_reward => {171034,50}    };
get(Lv, 1, 2) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 1, 3) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 1, 5) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {173034,50},
        fix_reward => {173034,50}    };
get(Lv, 1, 4) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {174034,50},
        fix_reward => {174034,50}    };
get(Lv, 2, 1) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {171034,50},
        fix_reward => {171034,50}    };
get(Lv, 2, 2) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 2, 3) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 2, 5) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {173034,50},
        fix_reward => {173034,50}    };
get(Lv, 2, 4) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {174034,50},
        fix_reward => {174034,50}    };
get(Lv, 3, 1) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {171034,50},
        fix_reward => {171034,50}    };
get(Lv, 3, 2) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 3, 3) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 3, 5) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {173034,50},
        fix_reward => {173034,50}    };
get(Lv, 3, 4) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {174034,50},
        fix_reward => {174034,50}    };
get(Lv, 4, 1) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {171034,50},
        fix_reward => {171034,50}    };
get(Lv, 4, 2) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 4, 3) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 4, 5) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {173034,50},
        fix_reward => {173034,50}    };
get(Lv, 4, 4) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {174034,50},
        fix_reward => {174034,50}    };
get(Lv, 5, 1) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {171034,50},
        fix_reward => {171034,50}    };
get(Lv, 5, 2) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 5, 3) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {172034,50},
        fix_reward => {172034,50}    };
get(Lv, 5, 5) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {173034,50},
        fix_reward => {173034,50}    };
get(Lv, 5, 4) when Lv =< 43 -> 
	#{
        nor_reward => {170034,50},
        mul_reward => {174034,50},
        fix_reward => {174034,50}    };
get(Lv, 1, 1) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {171035,50},
        fix_reward => {171035,50}    };
get(Lv, 1, 2) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 1, 3) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 1, 5) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {173035,50},
        fix_reward => {173035,50}    };
get(Lv, 1, 4) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {174035,50},
        fix_reward => {174035,50}    };
get(Lv, 2, 1) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {171035,50},
        fix_reward => {171035,50}    };
get(Lv, 2, 2) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 2, 3) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 2, 5) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {173035,50},
        fix_reward => {173035,50}    };
get(Lv, 2, 4) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {174035,50},
        fix_reward => {174035,50}    };
get(Lv, 3, 1) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {171035,50},
        fix_reward => {171035,50}    };
get(Lv, 3, 2) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 3, 3) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 3, 5) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {173035,50},
        fix_reward => {173035,50}    };
get(Lv, 3, 4) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {174035,50},
        fix_reward => {174035,50}    };
get(Lv, 4, 1) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {171035,50},
        fix_reward => {171035,50}    };
get(Lv, 4, 2) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 4, 3) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 4, 5) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {173035,50},
        fix_reward => {173035,50}    };
get(Lv, 4, 4) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {174035,50},
        fix_reward => {174035,50}    };
get(Lv, 5, 1) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {171035,50},
        fix_reward => {171035,50}    };
get(Lv, 5, 2) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 5, 3) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {172035,50},
        fix_reward => {172035,50}    };
get(Lv, 5, 5) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {173035,50},
        fix_reward => {173035,50}    };
get(Lv, 5, 4) when Lv =< 44 -> 
	#{
        nor_reward => {170035,50},
        mul_reward => {174035,50},
        fix_reward => {174035,50}    };
get(Lv, 1, 1) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {171036,50},
        fix_reward => {171036,50}    };
get(Lv, 1, 2) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 1, 3) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 1, 5) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {173036,50},
        fix_reward => {173036,50}    };
get(Lv, 1, 4) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {174036,50},
        fix_reward => {174036,50}    };
get(Lv, 2, 1) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {171036,50},
        fix_reward => {171036,50}    };
get(Lv, 2, 2) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 2, 3) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 2, 5) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {173036,50},
        fix_reward => {173036,50}    };
get(Lv, 2, 4) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {174036,50},
        fix_reward => {174036,50}    };
get(Lv, 3, 1) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {171036,50},
        fix_reward => {171036,50}    };
get(Lv, 3, 2) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 3, 3) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 3, 5) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {173036,50},
        fix_reward => {173036,50}    };
get(Lv, 3, 4) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {174036,50},
        fix_reward => {174036,50}    };
get(Lv, 4, 1) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {171036,50},
        fix_reward => {171036,50}    };
get(Lv, 4, 2) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 4, 3) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 4, 5) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {173036,50},
        fix_reward => {173036,50}    };
get(Lv, 4, 4) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {174036,50},
        fix_reward => {174036,50}    };
get(Lv, 5, 1) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {171036,50},
        fix_reward => {171036,50}    };
get(Lv, 5, 2) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 5, 3) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {172036,50},
        fix_reward => {172036,50}    };
get(Lv, 5, 5) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {173036,50},
        fix_reward => {173036,50}    };
get(Lv, 5, 4) when Lv =< 45 -> 
	#{
        nor_reward => {170036,50},
        mul_reward => {174036,50},
        fix_reward => {174036,50}    };
get(Lv, 1, 1) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {171037,50},
        fix_reward => {171037,50}    };
get(Lv, 1, 2) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 1, 3) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 1, 5) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {173037,50},
        fix_reward => {173037,50}    };
get(Lv, 1, 4) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {174037,50},
        fix_reward => {174037,50}    };
get(Lv, 2, 1) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {171037,50},
        fix_reward => {171037,50}    };
get(Lv, 2, 2) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 2, 3) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 2, 5) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {173037,50},
        fix_reward => {173037,50}    };
get(Lv, 2, 4) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {174037,50},
        fix_reward => {174037,50}    };
get(Lv, 3, 1) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {171037,50},
        fix_reward => {171037,50}    };
get(Lv, 3, 2) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 3, 3) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 3, 5) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {173037,50},
        fix_reward => {173037,50}    };
get(Lv, 3, 4) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {174037,50},
        fix_reward => {174037,50}    };
get(Lv, 4, 1) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {171037,50},
        fix_reward => {171037,50}    };
get(Lv, 4, 2) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 4, 3) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 4, 5) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {173037,50},
        fix_reward => {173037,50}    };
get(Lv, 4, 4) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {174037,50},
        fix_reward => {174037,50}    };
get(Lv, 5, 1) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {171037,50},
        fix_reward => {171037,50}    };
get(Lv, 5, 2) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 5, 3) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {172037,50},
        fix_reward => {172037,50}    };
get(Lv, 5, 5) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {173037,50},
        fix_reward => {173037,50}    };
get(Lv, 5, 4) when Lv =< 46 -> 
	#{
        nor_reward => {170037,50},
        mul_reward => {174037,50},
        fix_reward => {174037,50}    };
get(Lv, 1, 1) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {171038,50},
        fix_reward => {171038,50}    };
get(Lv, 1, 2) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 1, 3) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 1, 5) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {173038,50},
        fix_reward => {173038,50}    };
get(Lv, 1, 4) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {174038,50},
        fix_reward => {174038,50}    };
get(Lv, 2, 1) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {171038,50},
        fix_reward => {171038,50}    };
get(Lv, 2, 2) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 2, 3) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 2, 5) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {173038,50},
        fix_reward => {173038,50}    };
get(Lv, 2, 4) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {174038,50},
        fix_reward => {174038,50}    };
get(Lv, 3, 1) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {171038,50},
        fix_reward => {171038,50}    };
get(Lv, 3, 2) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 3, 3) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 3, 5) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {173038,50},
        fix_reward => {173038,50}    };
get(Lv, 3, 4) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {174038,50},
        fix_reward => {174038,50}    };
get(Lv, 4, 1) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {171038,50},
        fix_reward => {171038,50}    };
get(Lv, 4, 2) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 4, 3) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 4, 5) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {173038,50},
        fix_reward => {173038,50}    };
get(Lv, 4, 4) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {174038,50},
        fix_reward => {174038,50}    };
get(Lv, 5, 1) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {171038,50},
        fix_reward => {171038,50}    };
get(Lv, 5, 2) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 5, 3) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {172038,50},
        fix_reward => {172038,50}    };
get(Lv, 5, 5) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {173038,50},
        fix_reward => {173038,50}    };
get(Lv, 5, 4) when Lv =< 47 -> 
	#{
        nor_reward => {170038,50},
        mul_reward => {174038,50},
        fix_reward => {174038,50}    };
get(Lv, 1, 1) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {171039,50},
        fix_reward => {171039,50}    };
get(Lv, 1, 2) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 1, 3) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 1, 5) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {173039,50},
        fix_reward => {173039,50}    };
get(Lv, 1, 4) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {174039,50},
        fix_reward => {174039,50}    };
get(Lv, 2, 1) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {171039,50},
        fix_reward => {171039,50}    };
get(Lv, 2, 2) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 2, 3) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 2, 5) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {173039,50},
        fix_reward => {173039,50}    };
get(Lv, 2, 4) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {174039,50},
        fix_reward => {174039,50}    };
get(Lv, 3, 1) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {171039,50},
        fix_reward => {171039,50}    };
get(Lv, 3, 2) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 3, 3) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 3, 5) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {173039,50},
        fix_reward => {173039,50}    };
get(Lv, 3, 4) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {174039,50},
        fix_reward => {174039,50}    };
get(Lv, 4, 1) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {171039,50},
        fix_reward => {171039,50}    };
get(Lv, 4, 2) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 4, 3) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 4, 5) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {173039,50},
        fix_reward => {173039,50}    };
get(Lv, 4, 4) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {174039,50},
        fix_reward => {174039,50}    };
get(Lv, 5, 1) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {171039,50},
        fix_reward => {171039,50}    };
get(Lv, 5, 2) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 5, 3) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {172039,50},
        fix_reward => {172039,50}    };
get(Lv, 5, 5) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {173039,50},
        fix_reward => {173039,50}    };
get(Lv, 5, 4) when Lv =< 48 -> 
	#{
        nor_reward => {170039,50},
        mul_reward => {174039,50},
        fix_reward => {174039,50}    };
get(Lv, 1, 1) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {171040,50},
        fix_reward => {171040,50}    };
get(Lv, 1, 2) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 1, 3) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 1, 5) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {173040,50},
        fix_reward => {173040,50}    };
get(Lv, 1, 4) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {174040,50},
        fix_reward => {174040,50}    };
get(Lv, 2, 1) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {171040,50},
        fix_reward => {171040,50}    };
get(Lv, 2, 2) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 2, 3) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 2, 5) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {173040,50},
        fix_reward => {173040,50}    };
get(Lv, 2, 4) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {174040,50},
        fix_reward => {174040,50}    };
get(Lv, 3, 1) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {171040,50},
        fix_reward => {171040,50}    };
get(Lv, 3, 2) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 3, 3) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 3, 5) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {173040,50},
        fix_reward => {173040,50}    };
get(Lv, 3, 4) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {174040,50},
        fix_reward => {174040,50}    };
get(Lv, 4, 1) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {171040,50},
        fix_reward => {171040,50}    };
get(Lv, 4, 2) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 4, 3) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 4, 5) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {173040,50},
        fix_reward => {173040,50}    };
get(Lv, 4, 4) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {174040,50},
        fix_reward => {174040,50}    };
get(Lv, 5, 1) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {171040,50},
        fix_reward => {171040,50}    };
get(Lv, 5, 2) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 5, 3) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {172040,50},
        fix_reward => {172040,50}    };
get(Lv, 5, 5) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {173040,50},
        fix_reward => {173040,50}    };
get(Lv, 5, 4) when Lv =< 49 -> 
	#{
        nor_reward => {170040,50},
        mul_reward => {174040,50},
        fix_reward => {174040,50}    };
get(Lv, 1, 1) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {171041,50},
        fix_reward => {171041,50}    };
get(Lv, 1, 2) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 1, 3) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 1, 5) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {173041,50},
        fix_reward => {173041,50}    };
get(Lv, 1, 4) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {174041,50},
        fix_reward => {174041,50}    };
get(Lv, 2, 1) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {171041,50},
        fix_reward => {171041,50}    };
get(Lv, 2, 2) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 2, 3) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 2, 5) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {173041,50},
        fix_reward => {173041,50}    };
get(Lv, 2, 4) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {174041,50},
        fix_reward => {174041,50}    };
get(Lv, 3, 1) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {171041,50},
        fix_reward => {171041,50}    };
get(Lv, 3, 2) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 3, 3) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 3, 5) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {173041,50},
        fix_reward => {173041,50}    };
get(Lv, 3, 4) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {174041,50},
        fix_reward => {174041,50}    };
get(Lv, 4, 1) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {171041,50},
        fix_reward => {171041,50}    };
get(Lv, 4, 2) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 4, 3) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 4, 5) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {173041,50},
        fix_reward => {173041,50}    };
get(Lv, 4, 4) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {174041,50},
        fix_reward => {174041,50}    };
get(Lv, 5, 1) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {171041,50},
        fix_reward => {171041,50}    };
get(Lv, 5, 2) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 5, 3) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {172041,50},
        fix_reward => {172041,50}    };
get(Lv, 5, 5) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {173041,50},
        fix_reward => {173041,50}    };
get(Lv, 5, 4) when Lv =< 50 -> 
	#{
        nor_reward => {170041,50},
        mul_reward => {174041,50},
        fix_reward => {174041,50}    };
get(Lv, 1, 1) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {171042,50},
        fix_reward => {171042,50}    };
get(Lv, 1, 2) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 1, 3) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 1, 5) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {173042,50},
        fix_reward => {173042,50}    };
get(Lv, 1, 4) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {174042,50},
        fix_reward => {174042,50}    };
get(Lv, 2, 1) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {171042,50},
        fix_reward => {171042,50}    };
get(Lv, 2, 2) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 2, 3) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 2, 5) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {173042,50},
        fix_reward => {173042,50}    };
get(Lv, 2, 4) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {174042,50},
        fix_reward => {174042,50}    };
get(Lv, 3, 1) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {171042,50},
        fix_reward => {171042,50}    };
get(Lv, 3, 2) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 3, 3) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 3, 5) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {173042,50},
        fix_reward => {173042,50}    };
get(Lv, 3, 4) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {174042,50},
        fix_reward => {174042,50}    };
get(Lv, 4, 1) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {171042,50},
        fix_reward => {171042,50}    };
get(Lv, 4, 2) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 4, 3) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 4, 5) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {173042,50},
        fix_reward => {173042,50}    };
get(Lv, 4, 4) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {174042,50},
        fix_reward => {174042,50}    };
get(Lv, 5, 1) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {171042,50},
        fix_reward => {171042,50}    };
get(Lv, 5, 2) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 5, 3) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {172042,50},
        fix_reward => {172042,50}    };
get(Lv, 5, 5) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {173042,50},
        fix_reward => {173042,50}    };
get(Lv, 5, 4) when Lv =< 51 -> 
	#{
        nor_reward => {170042,50},
        mul_reward => {174042,50},
        fix_reward => {174042,50}    };
get(Lv, 1, 1) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {171043,50},
        fix_reward => {171043,50}    };
get(Lv, 1, 2) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 1, 3) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 1, 5) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {173043,50},
        fix_reward => {173043,50}    };
get(Lv, 1, 4) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {174043,50},
        fix_reward => {174043,50}    };
get(Lv, 2, 1) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {171043,50},
        fix_reward => {171043,50}    };
get(Lv, 2, 2) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 2, 3) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 2, 5) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {173043,50},
        fix_reward => {173043,50}    };
get(Lv, 2, 4) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {174043,50},
        fix_reward => {174043,50}    };
get(Lv, 3, 1) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {171043,50},
        fix_reward => {171043,50}    };
get(Lv, 3, 2) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 3, 3) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 3, 5) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {173043,50},
        fix_reward => {173043,50}    };
get(Lv, 3, 4) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {174043,50},
        fix_reward => {174043,50}    };
get(Lv, 4, 1) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {171043,50},
        fix_reward => {171043,50}    };
get(Lv, 4, 2) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 4, 3) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 4, 5) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {173043,50},
        fix_reward => {173043,50}    };
get(Lv, 4, 4) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {174043,50},
        fix_reward => {174043,50}    };
get(Lv, 5, 1) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {171043,50},
        fix_reward => {171043,50}    };
get(Lv, 5, 2) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 5, 3) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {172043,50},
        fix_reward => {172043,50}    };
get(Lv, 5, 5) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {173043,50},
        fix_reward => {173043,50}    };
get(Lv, 5, 4) when Lv =< 52 -> 
	#{
        nor_reward => {170043,50},
        mul_reward => {174043,50},
        fix_reward => {174043,50}    };
get(Lv, 1, 1) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {171044,50},
        fix_reward => {171044,50}    };
get(Lv, 1, 2) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 1, 3) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 1, 5) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {173044,50},
        fix_reward => {173044,50}    };
get(Lv, 1, 4) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {174044,50},
        fix_reward => {174044,50}    };
get(Lv, 2, 1) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {171044,50},
        fix_reward => {171044,50}    };
get(Lv, 2, 2) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 2, 3) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 2, 5) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {173044,50},
        fix_reward => {173044,50}    };
get(Lv, 2, 4) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {174044,50},
        fix_reward => {174044,50}    };
get(Lv, 3, 1) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {171044,50},
        fix_reward => {171044,50}    };
get(Lv, 3, 2) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 3, 3) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 3, 5) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {173044,50},
        fix_reward => {173044,50}    };
get(Lv, 3, 4) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {174044,50},
        fix_reward => {174044,50}    };
get(Lv, 4, 1) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {171044,50},
        fix_reward => {171044,50}    };
get(Lv, 4, 2) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 4, 3) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 4, 5) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {173044,50},
        fix_reward => {173044,50}    };
get(Lv, 4, 4) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {174044,50},
        fix_reward => {174044,50}    };
get(Lv, 5, 1) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {171044,50},
        fix_reward => {171044,50}    };
get(Lv, 5, 2) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 5, 3) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {172044,50},
        fix_reward => {172044,50}    };
get(Lv, 5, 5) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {173044,50},
        fix_reward => {173044,50}    };
get(Lv, 5, 4) when Lv =< 53 -> 
	#{
        nor_reward => {170044,50},
        mul_reward => {174044,50},
        fix_reward => {174044,50}    };
get(Lv, 1, 1) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {171045,50},
        fix_reward => {171045,50}    };
get(Lv, 1, 2) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 1, 3) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 1, 5) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {173045,50},
        fix_reward => {173045,50}    };
get(Lv, 1, 4) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {174045,50},
        fix_reward => {174045,50}    };
get(Lv, 2, 1) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {171045,50},
        fix_reward => {171045,50}    };
get(Lv, 2, 2) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 2, 3) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 2, 5) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {173045,50},
        fix_reward => {173045,50}    };
get(Lv, 2, 4) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {174045,50},
        fix_reward => {174045,50}    };
get(Lv, 3, 1) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {171045,50},
        fix_reward => {171045,50}    };
get(Lv, 3, 2) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 3, 3) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 3, 5) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {173045,50},
        fix_reward => {173045,50}    };
get(Lv, 3, 4) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {174045,50},
        fix_reward => {174045,50}    };
get(Lv, 4, 1) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {171045,50},
        fix_reward => {171045,50}    };
get(Lv, 4, 2) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 4, 3) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 4, 5) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {173045,50},
        fix_reward => {173045,50}    };
get(Lv, 4, 4) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {174045,50},
        fix_reward => {174045,50}    };
get(Lv, 5, 1) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {171045,50},
        fix_reward => {171045,50}    };
get(Lv, 5, 2) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 5, 3) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {172045,50},
        fix_reward => {172045,50}    };
get(Lv, 5, 5) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {173045,50},
        fix_reward => {173045,50}    };
get(Lv, 5, 4) when Lv =< 54 -> 
	#{
        nor_reward => {170045,50},
        mul_reward => {174045,50},
        fix_reward => {174045,50}    };
get(Lv, 1, 1) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {171046,50},
        fix_reward => {171046,50}    };
get(Lv, 1, 2) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 1, 3) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 1, 5) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {173046,50},
        fix_reward => {173046,50}    };
get(Lv, 1, 4) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {174046,50},
        fix_reward => {174046,50}    };
get(Lv, 2, 1) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {171046,50},
        fix_reward => {171046,50}    };
get(Lv, 2, 2) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 2, 3) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 2, 5) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {173046,50},
        fix_reward => {173046,50}    };
get(Lv, 2, 4) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {174046,50},
        fix_reward => {174046,50}    };
get(Lv, 3, 1) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {171046,50},
        fix_reward => {171046,50}    };
get(Lv, 3, 2) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 3, 3) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 3, 5) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {173046,50},
        fix_reward => {173046,50}    };
get(Lv, 3, 4) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {174046,50},
        fix_reward => {174046,50}    };
get(Lv, 4, 1) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {171046,50},
        fix_reward => {171046,50}    };
get(Lv, 4, 2) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 4, 3) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 4, 5) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {173046,50},
        fix_reward => {173046,50}    };
get(Lv, 4, 4) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {174046,50},
        fix_reward => {174046,50}    };
get(Lv, 5, 1) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {171046,50},
        fix_reward => {171046,50}    };
get(Lv, 5, 2) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 5, 3) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {172046,50},
        fix_reward => {172046,50}    };
get(Lv, 5, 5) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {173046,50},
        fix_reward => {173046,50}    };
get(Lv, 5, 4) when Lv =< 55 -> 
	#{
        nor_reward => {170046,50},
        mul_reward => {174046,50},
        fix_reward => {174046,50}    };
get(Lv, 1, 1) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {171047,50},
        fix_reward => {171047,50}    };
get(Lv, 1, 2) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 1, 3) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 1, 5) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {173047,50},
        fix_reward => {173047,50}    };
get(Lv, 1, 4) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {174047,50},
        fix_reward => {174047,50}    };
get(Lv, 2, 1) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {171047,50},
        fix_reward => {171047,50}    };
get(Lv, 2, 2) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 2, 3) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 2, 5) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {173047,50},
        fix_reward => {173047,50}    };
get(Lv, 2, 4) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {174047,50},
        fix_reward => {174047,50}    };
get(Lv, 3, 1) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {171047,50},
        fix_reward => {171047,50}    };
get(Lv, 3, 2) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 3, 3) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 3, 5) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {173047,50},
        fix_reward => {173047,50}    };
get(Lv, 3, 4) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {174047,50},
        fix_reward => {174047,50}    };
get(Lv, 4, 1) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {171047,50},
        fix_reward => {171047,50}    };
get(Lv, 4, 2) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 4, 3) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 4, 5) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {173047,50},
        fix_reward => {173047,50}    };
get(Lv, 4, 4) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {174047,50},
        fix_reward => {174047,50}    };
get(Lv, 5, 1) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {171047,50},
        fix_reward => {171047,50}    };
get(Lv, 5, 2) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 5, 3) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {172047,50},
        fix_reward => {172047,50}    };
get(Lv, 5, 5) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {173047,50},
        fix_reward => {173047,50}    };
get(Lv, 5, 4) when Lv =< 56 -> 
	#{
        nor_reward => {170047,50},
        mul_reward => {174047,50},
        fix_reward => {174047,50}    };
get(Lv, 1, 1) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {171048,50},
        fix_reward => {171048,50}    };
get(Lv, 1, 2) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 1, 3) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 1, 5) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {173048,50},
        fix_reward => {173048,50}    };
get(Lv, 1, 4) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {174048,50},
        fix_reward => {174048,50}    };
get(Lv, 2, 1) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {171048,50},
        fix_reward => {171048,50}    };
get(Lv, 2, 2) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 2, 3) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 2, 5) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {173048,50},
        fix_reward => {173048,50}    };
get(Lv, 2, 4) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {174048,50},
        fix_reward => {174048,50}    };
get(Lv, 3, 1) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {171048,50},
        fix_reward => {171048,50}    };
get(Lv, 3, 2) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 3, 3) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 3, 5) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {173048,50},
        fix_reward => {173048,50}    };
get(Lv, 3, 4) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {174048,50},
        fix_reward => {174048,50}    };
get(Lv, 4, 1) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {171048,50},
        fix_reward => {171048,50}    };
get(Lv, 4, 2) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 4, 3) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 4, 5) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {173048,50},
        fix_reward => {173048,50}    };
get(Lv, 4, 4) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {174048,50},
        fix_reward => {174048,50}    };
get(Lv, 5, 1) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {171048,50},
        fix_reward => {171048,50}    };
get(Lv, 5, 2) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 5, 3) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {172048,50},
        fix_reward => {172048,50}    };
get(Lv, 5, 5) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {173048,50},
        fix_reward => {173048,50}    };
get(Lv, 5, 4) when Lv =< 57 -> 
	#{
        nor_reward => {170048,50},
        mul_reward => {174048,50},
        fix_reward => {174048,50}    };
get(Lv, 1, 1) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {171049,50},
        fix_reward => {171049,50}    };
get(Lv, 1, 2) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 1, 3) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 1, 5) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {173049,50},
        fix_reward => {173049,50}    };
get(Lv, 1, 4) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {174049,50},
        fix_reward => {174049,50}    };
get(Lv, 2, 1) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {171049,50},
        fix_reward => {171049,50}    };
get(Lv, 2, 2) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 2, 3) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 2, 5) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {173049,50},
        fix_reward => {173049,50}    };
get(Lv, 2, 4) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {174049,50},
        fix_reward => {174049,50}    };
get(Lv, 3, 1) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {171049,50},
        fix_reward => {171049,50}    };
get(Lv, 3, 2) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 3, 3) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 3, 5) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {173049,50},
        fix_reward => {173049,50}    };
get(Lv, 3, 4) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {174049,50},
        fix_reward => {174049,50}    };
get(Lv, 4, 1) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {171049,50},
        fix_reward => {171049,50}    };
get(Lv, 4, 2) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 4, 3) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 4, 5) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {173049,50},
        fix_reward => {173049,50}    };
get(Lv, 4, 4) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {174049,50},
        fix_reward => {174049,50}    };
get(Lv, 5, 1) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {171049,50},
        fix_reward => {171049,50}    };
get(Lv, 5, 2) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 5, 3) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {172049,50},
        fix_reward => {172049,50}    };
get(Lv, 5, 5) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {173049,50},
        fix_reward => {173049,50}    };
get(Lv, 5, 4) when Lv =< 58 -> 
	#{
        nor_reward => {170049,50},
        mul_reward => {174049,50},
        fix_reward => {174049,50}    };
get(Lv, 1, 1) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {171050,50},
        fix_reward => {171050,50}    };
get(Lv, 1, 2) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 1, 3) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 1, 5) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {173050,50},
        fix_reward => {173050,50}    };
get(Lv, 1, 4) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {174050,50},
        fix_reward => {174050,50}    };
get(Lv, 2, 1) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {171050,50},
        fix_reward => {171050,50}    };
get(Lv, 2, 2) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 2, 3) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 2, 5) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {173050,50},
        fix_reward => {173050,50}    };
get(Lv, 2, 4) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {174050,50},
        fix_reward => {174050,50}    };
get(Lv, 3, 1) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {171050,50},
        fix_reward => {171050,50}    };
get(Lv, 3, 2) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 3, 3) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 3, 5) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {173050,50},
        fix_reward => {173050,50}    };
get(Lv, 3, 4) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {174050,50},
        fix_reward => {174050,50}    };
get(Lv, 4, 1) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {171050,50},
        fix_reward => {171050,50}    };
get(Lv, 4, 2) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 4, 3) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 4, 5) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {173050,50},
        fix_reward => {173050,50}    };
get(Lv, 4, 4) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {174050,50},
        fix_reward => {174050,50}    };
get(Lv, 5, 1) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {171050,50},
        fix_reward => {171050,50}    };
get(Lv, 5, 2) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 5, 3) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {172050,50},
        fix_reward => {172050,50}    };
get(Lv, 5, 5) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {173050,50},
        fix_reward => {173050,50}    };
get(Lv, 5, 4) when Lv =< 59 -> 
	#{
        nor_reward => {170050,50},
        mul_reward => {174050,50},
        fix_reward => {174050,50}    };
get(Lv, 1, 1) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {171051,50},
        fix_reward => {171051,50}    };
get(Lv, 1, 2) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 1, 3) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 1, 5) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {173051,50},
        fix_reward => {173051,50}    };
get(Lv, 1, 4) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {174051,50},
        fix_reward => {174051,50}    };
get(Lv, 2, 1) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {171051,50},
        fix_reward => {171051,50}    };
get(Lv, 2, 2) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 2, 3) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 2, 5) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {173051,50},
        fix_reward => {173051,50}    };
get(Lv, 2, 4) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {174051,50},
        fix_reward => {174051,50}    };
get(Lv, 3, 1) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {171051,50},
        fix_reward => {171051,50}    };
get(Lv, 3, 2) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 3, 3) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 3, 5) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {173051,50},
        fix_reward => {173051,50}    };
get(Lv, 3, 4) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {174051,50},
        fix_reward => {174051,50}    };
get(Lv, 4, 1) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {171051,50},
        fix_reward => {171051,50}    };
get(Lv, 4, 2) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 4, 3) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 4, 5) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {173051,50},
        fix_reward => {173051,50}    };
get(Lv, 4, 4) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {174051,50},
        fix_reward => {174051,50}    };
get(Lv, 5, 1) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {171051,50},
        fix_reward => {171051,50}    };
get(Lv, 5, 2) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 5, 3) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {172051,50},
        fix_reward => {172051,50}    };
get(Lv, 5, 5) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {173051,50},
        fix_reward => {173051,50}    };
get(Lv, 5, 4) when Lv =< 60 -> 
	#{
        nor_reward => {170051,50},
        mul_reward => {174051,50},
        fix_reward => {174051,50}    };
get(Lv, 1, 1) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {171052,50},
        fix_reward => {171052,50}    };
get(Lv, 1, 2) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 1, 3) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 1, 5) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {173052,50},
        fix_reward => {173052,50}    };
get(Lv, 1, 4) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {174052,50},
        fix_reward => {174052,50}    };
get(Lv, 2, 1) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {171052,50},
        fix_reward => {171052,50}    };
get(Lv, 2, 2) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 2, 3) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 2, 5) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {173052,50},
        fix_reward => {173052,50}    };
get(Lv, 2, 4) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {174052,50},
        fix_reward => {174052,50}    };
get(Lv, 3, 1) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {171052,50},
        fix_reward => {171052,50}    };
get(Lv, 3, 2) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 3, 3) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 3, 5) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {173052,50},
        fix_reward => {173052,50}    };
get(Lv, 3, 4) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {174052,50},
        fix_reward => {174052,50}    };
get(Lv, 4, 1) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {171052,50},
        fix_reward => {171052,50}    };
get(Lv, 4, 2) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 4, 3) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 4, 5) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {173052,50},
        fix_reward => {173052,50}    };
get(Lv, 4, 4) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {174052,50},
        fix_reward => {174052,50}    };
get(Lv, 5, 1) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {171052,50},
        fix_reward => {171052,50}    };
get(Lv, 5, 2) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 5, 3) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {172052,50},
        fix_reward => {172052,50}    };
get(Lv, 5, 5) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {173052,50},
        fix_reward => {173052,50}    };
get(Lv, 5, 4) when Lv =< 61 -> 
	#{
        nor_reward => {170052,50},
        mul_reward => {174052,50},
        fix_reward => {174052,50}    };
get(Lv, 1, 1) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {171053,50},
        fix_reward => {171053,50}    };
get(Lv, 1, 2) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 1, 3) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 1, 5) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {173053,50},
        fix_reward => {173053,50}    };
get(Lv, 1, 4) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {174053,50},
        fix_reward => {174053,50}    };
get(Lv, 2, 1) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {171053,50},
        fix_reward => {171053,50}    };
get(Lv, 2, 2) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 2, 3) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 2, 5) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {173053,50},
        fix_reward => {173053,50}    };
get(Lv, 2, 4) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {174053,50},
        fix_reward => {174053,50}    };
get(Lv, 3, 1) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {171053,50},
        fix_reward => {171053,50}    };
get(Lv, 3, 2) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 3, 3) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 3, 5) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {173053,50},
        fix_reward => {173053,50}    };
get(Lv, 3, 4) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {174053,50},
        fix_reward => {174053,50}    };
get(Lv, 4, 1) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {171053,50},
        fix_reward => {171053,50}    };
get(Lv, 4, 2) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 4, 3) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 4, 5) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {173053,50},
        fix_reward => {173053,50}    };
get(Lv, 4, 4) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {174053,50},
        fix_reward => {174053,50}    };
get(Lv, 5, 1) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {171053,50},
        fix_reward => {171053,50}    };
get(Lv, 5, 2) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 5, 3) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {172053,50},
        fix_reward => {172053,50}    };
get(Lv, 5, 5) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {173053,50},
        fix_reward => {173053,50}    };
get(Lv, 5, 4) when Lv =< 62 -> 
	#{
        nor_reward => {170053,50},
        mul_reward => {174053,50},
        fix_reward => {174053,50}    };
get(Lv, 1, 1) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {171054,50},
        fix_reward => {171054,50}    };
get(Lv, 1, 2) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 1, 3) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 1, 5) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {173054,50},
        fix_reward => {173054,50}    };
get(Lv, 1, 4) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {174054,50},
        fix_reward => {174054,50}    };
get(Lv, 2, 1) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {171054,50},
        fix_reward => {171054,50}    };
get(Lv, 2, 2) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 2, 3) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 2, 5) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {173054,50},
        fix_reward => {173054,50}    };
get(Lv, 2, 4) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {174054,50},
        fix_reward => {174054,50}    };
get(Lv, 3, 1) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {171054,50},
        fix_reward => {171054,50}    };
get(Lv, 3, 2) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 3, 3) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 3, 5) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {173054,50},
        fix_reward => {173054,50}    };
get(Lv, 3, 4) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {174054,50},
        fix_reward => {174054,50}    };
get(Lv, 4, 1) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {171054,50},
        fix_reward => {171054,50}    };
get(Lv, 4, 2) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 4, 3) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 4, 5) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {173054,50},
        fix_reward => {173054,50}    };
get(Lv, 4, 4) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {174054,50},
        fix_reward => {174054,50}    };
get(Lv, 5, 1) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {171054,50},
        fix_reward => {171054,50}    };
get(Lv, 5, 2) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 5, 3) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {172054,50},
        fix_reward => {172054,50}    };
get(Lv, 5, 5) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {173054,50},
        fix_reward => {173054,50}    };
get(Lv, 5, 4) when Lv =< 63 -> 
	#{
        nor_reward => {170054,50},
        mul_reward => {174054,50},
        fix_reward => {174054,50}    };
get(Lv, 1, 1) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {171055,50},
        fix_reward => {171055,50}    };
get(Lv, 1, 2) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 1, 3) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 1, 5) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {173055,50},
        fix_reward => {173055,50}    };
get(Lv, 1, 4) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {174055,50},
        fix_reward => {174055,50}    };
get(Lv, 2, 1) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {171055,50},
        fix_reward => {171055,50}    };
get(Lv, 2, 2) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 2, 3) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 2, 5) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {173055,50},
        fix_reward => {173055,50}    };
get(Lv, 2, 4) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {174055,50},
        fix_reward => {174055,50}    };
get(Lv, 3, 1) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {171055,50},
        fix_reward => {171055,50}    };
get(Lv, 3, 2) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 3, 3) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 3, 5) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {173055,50},
        fix_reward => {173055,50}    };
get(Lv, 3, 4) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {174055,50},
        fix_reward => {174055,50}    };
get(Lv, 4, 1) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {171055,50},
        fix_reward => {171055,50}    };
get(Lv, 4, 2) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 4, 3) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 4, 5) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {173055,50},
        fix_reward => {173055,50}    };
get(Lv, 4, 4) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {174055,50},
        fix_reward => {174055,50}    };
get(Lv, 5, 1) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {171055,50},
        fix_reward => {171055,50}    };
get(Lv, 5, 2) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 5, 3) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {172055,50},
        fix_reward => {172055,50}    };
get(Lv, 5, 5) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {173055,50},
        fix_reward => {173055,50}    };
get(Lv, 5, 4) when Lv =< 64 -> 
	#{
        nor_reward => {170055,50},
        mul_reward => {174055,50},
        fix_reward => {174055,50}    };
get(Lv, 1, 1) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {171056,50},
        fix_reward => {171056,50}    };
get(Lv, 1, 2) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 1, 3) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 1, 5) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {173056,50},
        fix_reward => {173056,50}    };
get(Lv, 1, 4) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {174056,50},
        fix_reward => {174056,50}    };
get(Lv, 2, 1) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {171056,50},
        fix_reward => {171056,50}    };
get(Lv, 2, 2) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 2, 3) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 2, 5) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {173056,50},
        fix_reward => {173056,50}    };
get(Lv, 2, 4) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {174056,50},
        fix_reward => {174056,50}    };
get(Lv, 3, 1) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {171056,50},
        fix_reward => {171056,50}    };
get(Lv, 3, 2) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 3, 3) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 3, 5) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {173056,50},
        fix_reward => {173056,50}    };
get(Lv, 3, 4) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {174056,50},
        fix_reward => {174056,50}    };
get(Lv, 4, 1) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {171056,50},
        fix_reward => {171056,50}    };
get(Lv, 4, 2) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 4, 3) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 4, 5) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {173056,50},
        fix_reward => {173056,50}    };
get(Lv, 4, 4) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {174056,50},
        fix_reward => {174056,50}    };
get(Lv, 5, 1) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {171056,50},
        fix_reward => {171056,50}    };
get(Lv, 5, 2) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 5, 3) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {172056,50},
        fix_reward => {172056,50}    };
get(Lv, 5, 5) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {173056,50},
        fix_reward => {173056,50}    };
get(Lv, 5, 4) when Lv =< 65 -> 
	#{
        nor_reward => {170056,50},
        mul_reward => {174056,50},
        fix_reward => {174056,50}    };
get(Lv, 1, 1) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {171057,50},
        fix_reward => {171057,50}    };
get(Lv, 1, 2) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 1, 3) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 1, 5) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {173057,50},
        fix_reward => {173057,50}    };
get(Lv, 1, 4) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {174057,50},
        fix_reward => {174057,50}    };
get(Lv, 2, 1) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {171057,50},
        fix_reward => {171057,50}    };
get(Lv, 2, 2) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 2, 3) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 2, 5) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {173057,50},
        fix_reward => {173057,50}    };
get(Lv, 2, 4) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {174057,50},
        fix_reward => {174057,50}    };
get(Lv, 3, 1) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {171057,50},
        fix_reward => {171057,50}    };
get(Lv, 3, 2) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 3, 3) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 3, 5) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {173057,50},
        fix_reward => {173057,50}    };
get(Lv, 3, 4) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {174057,50},
        fix_reward => {174057,50}    };
get(Lv, 4, 1) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {171057,50},
        fix_reward => {171057,50}    };
get(Lv, 4, 2) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 4, 3) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 4, 5) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {173057,50},
        fix_reward => {173057,50}    };
get(Lv, 4, 4) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {174057,50},
        fix_reward => {174057,50}    };
get(Lv, 5, 1) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {171057,50},
        fix_reward => {171057,50}    };
get(Lv, 5, 2) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 5, 3) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {172057,50},
        fix_reward => {172057,50}    };
get(Lv, 5, 5) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {173057,50},
        fix_reward => {173057,50}    };
get(Lv, 5, 4) when Lv =< 66 -> 
	#{
        nor_reward => {170057,50},
        mul_reward => {174057,50},
        fix_reward => {174057,50}    };
get(Lv, 1, 1) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {171058,50},
        fix_reward => {171058,50}    };
get(Lv, 1, 2) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 1, 3) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 1, 5) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {173058,50},
        fix_reward => {173058,50}    };
get(Lv, 1, 4) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {174058,50},
        fix_reward => {174058,50}    };
get(Lv, 2, 1) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {171058,50},
        fix_reward => {171058,50}    };
get(Lv, 2, 2) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 2, 3) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 2, 5) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {173058,50},
        fix_reward => {173058,50}    };
get(Lv, 2, 4) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {174058,50},
        fix_reward => {174058,50}    };
get(Lv, 3, 1) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {171058,50},
        fix_reward => {171058,50}    };
get(Lv, 3, 2) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 3, 3) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 3, 5) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {173058,50},
        fix_reward => {173058,50}    };
get(Lv, 3, 4) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {174058,50},
        fix_reward => {174058,50}    };
get(Lv, 4, 1) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {171058,50},
        fix_reward => {171058,50}    };
get(Lv, 4, 2) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 4, 3) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 4, 5) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {173058,50},
        fix_reward => {173058,50}    };
get(Lv, 4, 4) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {174058,50},
        fix_reward => {174058,50}    };
get(Lv, 5, 1) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {171058,50},
        fix_reward => {171058,50}    };
get(Lv, 5, 2) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 5, 3) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {172058,50},
        fix_reward => {172058,50}    };
get(Lv, 5, 5) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {173058,50},
        fix_reward => {173058,50}    };
get(Lv, 5, 4) when Lv =< 67 -> 
	#{
        nor_reward => {170058,50},
        mul_reward => {174058,50},
        fix_reward => {174058,50}    };
get(Lv, 1, 1) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {171059,50},
        fix_reward => {171059,50}    };
get(Lv, 1, 2) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 1, 3) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 1, 5) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {173059,50},
        fix_reward => {173059,50}    };
get(Lv, 1, 4) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {174059,50},
        fix_reward => {174059,50}    };
get(Lv, 2, 1) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {171059,50},
        fix_reward => {171059,50}    };
get(Lv, 2, 2) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 2, 3) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 2, 5) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {173059,50},
        fix_reward => {173059,50}    };
get(Lv, 2, 4) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {174059,50},
        fix_reward => {174059,50}    };
get(Lv, 3, 1) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {171059,50},
        fix_reward => {171059,50}    };
get(Lv, 3, 2) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 3, 3) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 3, 5) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {173059,50},
        fix_reward => {173059,50}    };
get(Lv, 3, 4) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {174059,50},
        fix_reward => {174059,50}    };
get(Lv, 4, 1) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {171059,50},
        fix_reward => {171059,50}    };
get(Lv, 4, 2) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 4, 3) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 4, 5) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {173059,50},
        fix_reward => {173059,50}    };
get(Lv, 4, 4) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {174059,50},
        fix_reward => {174059,50}    };
get(Lv, 5, 1) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {171059,50},
        fix_reward => {171059,50}    };
get(Lv, 5, 2) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 5, 3) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {172059,50},
        fix_reward => {172059,50}    };
get(Lv, 5, 5) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {173059,50},
        fix_reward => {173059,50}    };
get(Lv, 5, 4) when Lv =< 68 -> 
	#{
        nor_reward => {170059,50},
        mul_reward => {174059,50},
        fix_reward => {174059,50}    };
get(Lv, 1, 1) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {171060,50},
        fix_reward => {171060,50}    };
get(Lv, 1, 2) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 1, 3) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 1, 5) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {173060,50},
        fix_reward => {173060,50}    };
get(Lv, 1, 4) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {174060,50},
        fix_reward => {174060,50}    };
get(Lv, 2, 1) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {171060,50},
        fix_reward => {171060,50}    };
get(Lv, 2, 2) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 2, 3) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 2, 5) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {173060,50},
        fix_reward => {173060,50}    };
get(Lv, 2, 4) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {174060,50},
        fix_reward => {174060,50}    };
get(Lv, 3, 1) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {171060,50},
        fix_reward => {171060,50}    };
get(Lv, 3, 2) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 3, 3) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 3, 5) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {173060,50},
        fix_reward => {173060,50}    };
get(Lv, 3, 4) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {174060,50},
        fix_reward => {174060,50}    };
get(Lv, 4, 1) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {171060,50},
        fix_reward => {171060,50}    };
get(Lv, 4, 2) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 4, 3) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 4, 5) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {173060,50},
        fix_reward => {173060,50}    };
get(Lv, 4, 4) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {174060,50},
        fix_reward => {174060,50}    };
get(Lv, 5, 1) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {171060,50},
        fix_reward => {171060,50}    };
get(Lv, 5, 2) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 5, 3) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {172060,50},
        fix_reward => {172060,50}    };
get(Lv, 5, 5) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {173060,50},
        fix_reward => {173060,50}    };
get(Lv, 5, 4) when Lv =< 69 -> 
	#{
        nor_reward => {170060,50},
        mul_reward => {174060,50},
        fix_reward => {174060,50}    };
get(Lv, 1, 1) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {171061,50},
        fix_reward => {171061,50}    };
get(Lv, 1, 2) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 1, 3) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 1, 5) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {173061,50},
        fix_reward => {173061,50}    };
get(Lv, 1, 4) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {174061,50},
        fix_reward => {174061,50}    };
get(Lv, 2, 1) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {171061,50},
        fix_reward => {171061,50}    };
get(Lv, 2, 2) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 2, 3) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 2, 5) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {173061,50},
        fix_reward => {173061,50}    };
get(Lv, 2, 4) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {174061,50},
        fix_reward => {174061,50}    };
get(Lv, 3, 1) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {171061,50},
        fix_reward => {171061,50}    };
get(Lv, 3, 2) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 3, 3) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 3, 5) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {173061,50},
        fix_reward => {173061,50}    };
get(Lv, 3, 4) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {174061,50},
        fix_reward => {174061,50}    };
get(Lv, 4, 1) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {171061,50},
        fix_reward => {171061,50}    };
get(Lv, 4, 2) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 4, 3) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 4, 5) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {173061,50},
        fix_reward => {173061,50}    };
get(Lv, 4, 4) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {174061,50},
        fix_reward => {174061,50}    };
get(Lv, 5, 1) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {171061,50},
        fix_reward => {171061,50}    };
get(Lv, 5, 2) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 5, 3) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {172061,50},
        fix_reward => {172061,50}    };
get(Lv, 5, 5) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {173061,50},
        fix_reward => {173061,50}    };
get(Lv, 5, 4) when Lv =< 70 -> 
	#{
        nor_reward => {170061,50},
        mul_reward => {174061,50},
        fix_reward => {174061,50}    };
get(Lv, 1, 1) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {171062,50},
        fix_reward => {171062,50}    };
get(Lv, 1, 2) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 1, 3) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 1, 5) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {173062,50},
        fix_reward => {173062,50}    };
get(Lv, 1, 4) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {174062,50},
        fix_reward => {174062,50}    };
get(Lv, 2, 1) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {171062,50},
        fix_reward => {171062,50}    };
get(Lv, 2, 2) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 2, 3) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 2, 5) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {173062,50},
        fix_reward => {173062,50}    };
get(Lv, 2, 4) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {174062,50},
        fix_reward => {174062,50}    };
get(Lv, 3, 1) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {171062,50},
        fix_reward => {171062,50}    };
get(Lv, 3, 2) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 3, 3) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 3, 5) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {173062,50},
        fix_reward => {173062,50}    };
get(Lv, 3, 4) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {174062,50},
        fix_reward => {174062,50}    };
get(Lv, 4, 1) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {171062,50},
        fix_reward => {171062,50}    };
get(Lv, 4, 2) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 4, 3) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 4, 5) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {173062,50},
        fix_reward => {173062,50}    };
get(Lv, 4, 4) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {174062,50},
        fix_reward => {174062,50}    };
get(Lv, 5, 1) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {171062,50},
        fix_reward => {171062,50}    };
get(Lv, 5, 2) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 5, 3) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {172062,50},
        fix_reward => {172062,50}    };
get(Lv, 5, 5) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {173062,50},
        fix_reward => {173062,50}    };
get(Lv, 5, 4) when Lv =< 71 -> 
	#{
        nor_reward => {170062,50},
        mul_reward => {174062,50},
        fix_reward => {174062,50}    };
get(Lv, 1, 1) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {171063,50},
        fix_reward => {171063,50}    };
get(Lv, 1, 2) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 1, 3) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 1, 5) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {173063,50},
        fix_reward => {173063,50}    };
get(Lv, 1, 4) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {174063,50},
        fix_reward => {174063,50}    };
get(Lv, 2, 1) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {171063,50},
        fix_reward => {171063,50}    };
get(Lv, 2, 2) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 2, 3) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 2, 5) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {173063,50},
        fix_reward => {173063,50}    };
get(Lv, 2, 4) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {174063,50},
        fix_reward => {174063,50}    };
get(Lv, 3, 1) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {171063,50},
        fix_reward => {171063,50}    };
get(Lv, 3, 2) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 3, 3) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 3, 5) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {173063,50},
        fix_reward => {173063,50}    };
get(Lv, 3, 4) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {174063,50},
        fix_reward => {174063,50}    };
get(Lv, 4, 1) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {171063,50},
        fix_reward => {171063,50}    };
get(Lv, 4, 2) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 4, 3) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 4, 5) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {173063,50},
        fix_reward => {173063,50}    };
get(Lv, 4, 4) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {174063,50},
        fix_reward => {174063,50}    };
get(Lv, 5, 1) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {171063,50},
        fix_reward => {171063,50}    };
get(Lv, 5, 2) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 5, 3) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {172063,50},
        fix_reward => {172063,50}    };
get(Lv, 5, 5) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {173063,50},
        fix_reward => {173063,50}    };
get(Lv, 5, 4) when Lv =< 72 -> 
	#{
        nor_reward => {170063,50},
        mul_reward => {174063,50},
        fix_reward => {174063,50}    };
get(Lv, 1, 1) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {171064,50},
        fix_reward => {171064,50}    };
get(Lv, 1, 2) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 1, 3) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 1, 5) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {173064,50},
        fix_reward => {173064,50}    };
get(Lv, 1, 4) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {174064,50},
        fix_reward => {174064,50}    };
get(Lv, 2, 1) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {171064,50},
        fix_reward => {171064,50}    };
get(Lv, 2, 2) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 2, 3) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 2, 5) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {173064,50},
        fix_reward => {173064,50}    };
get(Lv, 2, 4) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {174064,50},
        fix_reward => {174064,50}    };
get(Lv, 3, 1) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {171064,50},
        fix_reward => {171064,50}    };
get(Lv, 3, 2) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 3, 3) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 3, 5) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {173064,50},
        fix_reward => {173064,50}    };
get(Lv, 3, 4) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {174064,50},
        fix_reward => {174064,50}    };
get(Lv, 4, 1) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {171064,50},
        fix_reward => {171064,50}    };
get(Lv, 4, 2) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 4, 3) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 4, 5) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {173064,50},
        fix_reward => {173064,50}    };
get(Lv, 4, 4) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {174064,50},
        fix_reward => {174064,50}    };
get(Lv, 5, 1) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {171064,50},
        fix_reward => {171064,50}    };
get(Lv, 5, 2) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 5, 3) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {172064,50},
        fix_reward => {172064,50}    };
get(Lv, 5, 5) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {173064,50},
        fix_reward => {173064,50}    };
get(Lv, 5, 4) when Lv =< 73 -> 
	#{
        nor_reward => {170064,50},
        mul_reward => {174064,50},
        fix_reward => {174064,50}    };
get(Lv, 1, 1) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {171065,50},
        fix_reward => {171065,50}    };
get(Lv, 1, 2) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 1, 3) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 1, 5) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {173065,50},
        fix_reward => {173065,50}    };
get(Lv, 1, 4) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {174065,50},
        fix_reward => {174065,50}    };
get(Lv, 2, 1) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {171065,50},
        fix_reward => {171065,50}    };
get(Lv, 2, 2) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 2, 3) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 2, 5) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {173065,50},
        fix_reward => {173065,50}    };
get(Lv, 2, 4) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {174065,50},
        fix_reward => {174065,50}    };
get(Lv, 3, 1) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {171065,50},
        fix_reward => {171065,50}    };
get(Lv, 3, 2) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 3, 3) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 3, 5) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {173065,50},
        fix_reward => {173065,50}    };
get(Lv, 3, 4) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {174065,50},
        fix_reward => {174065,50}    };
get(Lv, 4, 1) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {171065,50},
        fix_reward => {171065,50}    };
get(Lv, 4, 2) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 4, 3) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 4, 5) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {173065,50},
        fix_reward => {173065,50}    };
get(Lv, 4, 4) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {174065,50},
        fix_reward => {174065,50}    };
get(Lv, 5, 1) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {171065,50},
        fix_reward => {171065,50}    };
get(Lv, 5, 2) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 5, 3) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {172065,50},
        fix_reward => {172065,50}    };
get(Lv, 5, 5) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {173065,50},
        fix_reward => {173065,50}    };
get(Lv, 5, 4) when Lv =< 74 -> 
	#{
        nor_reward => {170065,50},
        mul_reward => {174065,50},
        fix_reward => {174065,50}    };
get(Lv, 1, 1) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {171066,50},
        fix_reward => {171066,50}    };
get(Lv, 1, 2) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 1, 3) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 1, 5) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {173066,50},
        fix_reward => {173066,50}    };
get(Lv, 1, 4) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {174066,50},
        fix_reward => {174066,50}    };
get(Lv, 2, 1) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {171066,50},
        fix_reward => {171066,50}    };
get(Lv, 2, 2) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 2, 3) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 2, 5) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {173066,50},
        fix_reward => {173066,50}    };
get(Lv, 2, 4) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {174066,50},
        fix_reward => {174066,50}    };
get(Lv, 3, 1) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {171066,50},
        fix_reward => {171066,50}    };
get(Lv, 3, 2) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 3, 3) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 3, 5) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {173066,50},
        fix_reward => {173066,50}    };
get(Lv, 3, 4) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {174066,50},
        fix_reward => {174066,50}    };
get(Lv, 4, 1) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {171066,50},
        fix_reward => {171066,50}    };
get(Lv, 4, 2) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 4, 3) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 4, 5) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {173066,50},
        fix_reward => {173066,50}    };
get(Lv, 4, 4) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {174066,50},
        fix_reward => {174066,50}    };
get(Lv, 5, 1) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {171066,50},
        fix_reward => {171066,50}    };
get(Lv, 5, 2) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 5, 3) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {172066,50},
        fix_reward => {172066,50}    };
get(Lv, 5, 5) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {173066,50},
        fix_reward => {173066,50}    };
get(Lv, 5, 4) when Lv =< 75 -> 
	#{
        nor_reward => {170066,50},
        mul_reward => {174066,50},
        fix_reward => {174066,50}    };
get(Lv, 1, 1) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {171067,50},
        fix_reward => {171067,50}    };
get(Lv, 1, 2) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 1, 3) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 1, 5) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {173067,50},
        fix_reward => {173067,50}    };
get(Lv, 1, 4) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {174067,50},
        fix_reward => {174067,50}    };
get(Lv, 2, 1) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {171067,50},
        fix_reward => {171067,50}    };
get(Lv, 2, 2) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 2, 3) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 2, 5) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {173067,50},
        fix_reward => {173067,50}    };
get(Lv, 2, 4) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {174067,50},
        fix_reward => {174067,50}    };
get(Lv, 3, 1) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {171067,50},
        fix_reward => {171067,50}    };
get(Lv, 3, 2) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 3, 3) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 3, 5) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {173067,50},
        fix_reward => {173067,50}    };
get(Lv, 3, 4) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {174067,50},
        fix_reward => {174067,50}    };
get(Lv, 4, 1) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {171067,50},
        fix_reward => {171067,50}    };
get(Lv, 4, 2) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 4, 3) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 4, 5) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {173067,50},
        fix_reward => {173067,50}    };
get(Lv, 4, 4) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {174067,50},
        fix_reward => {174067,50}    };
get(Lv, 5, 1) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {171067,50},
        fix_reward => {171067,50}    };
get(Lv, 5, 2) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 5, 3) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {172067,50},
        fix_reward => {172067,50}    };
get(Lv, 5, 5) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {173067,50},
        fix_reward => {173067,50}    };
get(Lv, 5, 4) when Lv =< 76 -> 
	#{
        nor_reward => {170067,50},
        mul_reward => {174067,50},
        fix_reward => {174067,50}    };
get(Lv, 1, 1) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {171068,50},
        fix_reward => {171068,50}    };
get(Lv, 1, 2) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 1, 3) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 1, 5) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {173068,50},
        fix_reward => {173068,50}    };
get(Lv, 1, 4) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {174068,50},
        fix_reward => {174068,50}    };
get(Lv, 2, 1) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {171068,50},
        fix_reward => {171068,50}    };
get(Lv, 2, 2) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 2, 3) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 2, 5) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {173068,50},
        fix_reward => {173068,50}    };
get(Lv, 2, 4) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {174068,50},
        fix_reward => {174068,50}    };
get(Lv, 3, 1) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {171068,50},
        fix_reward => {171068,50}    };
get(Lv, 3, 2) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 3, 3) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 3, 5) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {173068,50},
        fix_reward => {173068,50}    };
get(Lv, 3, 4) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {174068,50},
        fix_reward => {174068,50}    };
get(Lv, 4, 1) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {171068,50},
        fix_reward => {171068,50}    };
get(Lv, 4, 2) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 4, 3) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 4, 5) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {173068,50},
        fix_reward => {173068,50}    };
get(Lv, 4, 4) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {174068,50},
        fix_reward => {174068,50}    };
get(Lv, 5, 1) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {171068,50},
        fix_reward => {171068,50}    };
get(Lv, 5, 2) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 5, 3) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {172068,50},
        fix_reward => {172068,50}    };
get(Lv, 5, 5) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {173068,50},
        fix_reward => {173068,50}    };
get(Lv, 5, 4) when Lv =< 77 -> 
	#{
        nor_reward => {170068,50},
        mul_reward => {174068,50},
        fix_reward => {174068,50}    };
get(Lv, 1, 1) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {171069,50},
        fix_reward => {171069,50}    };
get(Lv, 1, 2) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 1, 3) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 1, 5) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {173069,50},
        fix_reward => {173069,50}    };
get(Lv, 1, 4) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {174069,50},
        fix_reward => {174069,50}    };
get(Lv, 2, 1) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {171069,50},
        fix_reward => {171069,50}    };
get(Lv, 2, 2) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 2, 3) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 2, 5) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {173069,50},
        fix_reward => {173069,50}    };
get(Lv, 2, 4) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {174069,50},
        fix_reward => {174069,50}    };
get(Lv, 3, 1) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {171069,50},
        fix_reward => {171069,50}    };
get(Lv, 3, 2) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 3, 3) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 3, 5) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {173069,50},
        fix_reward => {173069,50}    };
get(Lv, 3, 4) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {174069,50},
        fix_reward => {174069,50}    };
get(Lv, 4, 1) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {171069,50},
        fix_reward => {171069,50}    };
get(Lv, 4, 2) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 4, 3) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 4, 5) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {173069,50},
        fix_reward => {173069,50}    };
get(Lv, 4, 4) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {174069,50},
        fix_reward => {174069,50}    };
get(Lv, 5, 1) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {171069,50},
        fix_reward => {171069,50}    };
get(Lv, 5, 2) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 5, 3) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {172069,50},
        fix_reward => {172069,50}    };
get(Lv, 5, 5) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {173069,50},
        fix_reward => {173069,50}    };
get(Lv, 5, 4) when Lv =< 78 -> 
	#{
        nor_reward => {170069,50},
        mul_reward => {174069,50},
        fix_reward => {174069,50}    };
get(Lv, 1, 1) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {171070,50},
        fix_reward => {171070,50}    };
get(Lv, 1, 2) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 1, 3) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 1, 5) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {173070,50},
        fix_reward => {173070,50}    };
get(Lv, 1, 4) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {174070,50},
        fix_reward => {174070,50}    };
get(Lv, 2, 1) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {171070,50},
        fix_reward => {171070,50}    };
get(Lv, 2, 2) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 2, 3) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 2, 5) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {173070,50},
        fix_reward => {173070,50}    };
get(Lv, 2, 4) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {174070,50},
        fix_reward => {174070,50}    };
get(Lv, 3, 1) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {171070,50},
        fix_reward => {171070,50}    };
get(Lv, 3, 2) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 3, 3) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 3, 5) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {173070,50},
        fix_reward => {173070,50}    };
get(Lv, 3, 4) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {174070,50},
        fix_reward => {174070,50}    };
get(Lv, 4, 1) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {171070,50},
        fix_reward => {171070,50}    };
get(Lv, 4, 2) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 4, 3) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 4, 5) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {173070,50},
        fix_reward => {173070,50}    };
get(Lv, 4, 4) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {174070,50},
        fix_reward => {174070,50}    };
get(Lv, 5, 1) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {171070,50},
        fix_reward => {171070,50}    };
get(Lv, 5, 2) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 5, 3) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {172070,50},
        fix_reward => {172070,50}    };
get(Lv, 5, 5) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {173070,50},
        fix_reward => {173070,50}    };
get(Lv, 5, 4) when Lv =< 79 -> 
	#{
        nor_reward => {170070,50},
        mul_reward => {174070,50},
        fix_reward => {174070,50}    };
get(Lv, 1, 1) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {171071,50},
        fix_reward => {171071,50}    };
get(Lv, 1, 2) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 1, 3) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 1, 5) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {173071,50},
        fix_reward => {173071,50}    };
get(Lv, 1, 4) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {174071,50},
        fix_reward => {174071,50}    };
get(Lv, 2, 1) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {171071,50},
        fix_reward => {171071,50}    };
get(Lv, 2, 2) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 2, 3) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 2, 5) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {173071,50},
        fix_reward => {173071,50}    };
get(Lv, 2, 4) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {174071,50},
        fix_reward => {174071,50}    };
get(Lv, 3, 1) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {171071,50},
        fix_reward => {171071,50}    };
get(Lv, 3, 2) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 3, 3) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 3, 5) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {173071,50},
        fix_reward => {173071,50}    };
get(Lv, 3, 4) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {174071,50},
        fix_reward => {174071,50}    };
get(Lv, 4, 1) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {171071,50},
        fix_reward => {171071,50}    };
get(Lv, 4, 2) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 4, 3) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 4, 5) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {173071,50},
        fix_reward => {173071,50}    };
get(Lv, 4, 4) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {174071,50},
        fix_reward => {174071,50}    };
get(Lv, 5, 1) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {171071,50},
        fix_reward => {171071,50}    };
get(Lv, 5, 2) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 5, 3) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {172071,50},
        fix_reward => {172071,50}    };
get(Lv, 5, 5) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {173071,50},
        fix_reward => {173071,50}    };
get(Lv, 5, 4) when Lv =< 80 -> 
	#{
        nor_reward => {170071,50},
        mul_reward => {174071,50},
        fix_reward => {174071,50}    };
get(Lv, 1, 1) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {171072,50},
        fix_reward => {171072,50}    };
get(Lv, 1, 2) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 1, 3) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 1, 5) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {173072,50},
        fix_reward => {173072,50}    };
get(Lv, 1, 4) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {174072,50},
        fix_reward => {174072,50}    };
get(Lv, 2, 1) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {171072,50},
        fix_reward => {171072,50}    };
get(Lv, 2, 2) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 2, 3) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 2, 5) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {173072,50},
        fix_reward => {173072,50}    };
get(Lv, 2, 4) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {174072,50},
        fix_reward => {174072,50}    };
get(Lv, 3, 1) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {171072,50},
        fix_reward => {171072,50}    };
get(Lv, 3, 2) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 3, 3) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 3, 5) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {173072,50},
        fix_reward => {173072,50}    };
get(Lv, 3, 4) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {174072,50},
        fix_reward => {174072,50}    };
get(Lv, 4, 1) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {171072,50},
        fix_reward => {171072,50}    };
get(Lv, 4, 2) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 4, 3) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 4, 5) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {173072,50},
        fix_reward => {173072,50}    };
get(Lv, 4, 4) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {174072,50},
        fix_reward => {174072,50}    };
get(Lv, 5, 1) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {171072,50},
        fix_reward => {171072,50}    };
get(Lv, 5, 2) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 5, 3) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {172072,50},
        fix_reward => {172072,50}    };
get(Lv, 5, 5) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {173072,50},
        fix_reward => {173072,50}    };
get(Lv, 5, 4) when Lv =< 81 -> 
	#{
        nor_reward => {170072,50},
        mul_reward => {174072,50},
        fix_reward => {174072,50}    };
get(Lv, 1, 1) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {171073,50},
        fix_reward => {171073,50}    };
get(Lv, 1, 2) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 1, 3) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 1, 5) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {173073,50},
        fix_reward => {173073,50}    };
get(Lv, 1, 4) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {174073,50},
        fix_reward => {174073,50}    };
get(Lv, 2, 1) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {171073,50},
        fix_reward => {171073,50}    };
get(Lv, 2, 2) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 2, 3) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 2, 5) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {173073,50},
        fix_reward => {173073,50}    };
get(Lv, 2, 4) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {174073,50},
        fix_reward => {174073,50}    };
get(Lv, 3, 1) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {171073,50},
        fix_reward => {171073,50}    };
get(Lv, 3, 2) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 3, 3) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 3, 5) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {173073,50},
        fix_reward => {173073,50}    };
get(Lv, 3, 4) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {174073,50},
        fix_reward => {174073,50}    };
get(Lv, 4, 1) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {171073,50},
        fix_reward => {171073,50}    };
get(Lv, 4, 2) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 4, 3) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 4, 5) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {173073,50},
        fix_reward => {173073,50}    };
get(Lv, 4, 4) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {174073,50},
        fix_reward => {174073,50}    };
get(Lv, 5, 1) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {171073,50},
        fix_reward => {171073,50}    };
get(Lv, 5, 2) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 5, 3) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {172073,50},
        fix_reward => {172073,50}    };
get(Lv, 5, 5) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {173073,50},
        fix_reward => {173073,50}    };
get(Lv, 5, 4) when Lv =< 82 -> 
	#{
        nor_reward => {170073,50},
        mul_reward => {174073,50},
        fix_reward => {174073,50}    };
get(Lv, 1, 1) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {171074,50},
        fix_reward => {171074,50}    };
get(Lv, 1, 2) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 1, 3) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 1, 5) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {173074,50},
        fix_reward => {173074,50}    };
get(Lv, 1, 4) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {174074,50},
        fix_reward => {174074,50}    };
get(Lv, 2, 1) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {171074,50},
        fix_reward => {171074,50}    };
get(Lv, 2, 2) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 2, 3) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 2, 5) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {173074,50},
        fix_reward => {173074,50}    };
get(Lv, 2, 4) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {174074,50},
        fix_reward => {174074,50}    };
get(Lv, 3, 1) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {171074,50},
        fix_reward => {171074,50}    };
get(Lv, 3, 2) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 3, 3) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 3, 5) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {173074,50},
        fix_reward => {173074,50}    };
get(Lv, 3, 4) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {174074,50},
        fix_reward => {174074,50}    };
get(Lv, 4, 1) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {171074,50},
        fix_reward => {171074,50}    };
get(Lv, 4, 2) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 4, 3) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 4, 5) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {173074,50},
        fix_reward => {173074,50}    };
get(Lv, 4, 4) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {174074,50},
        fix_reward => {174074,50}    };
get(Lv, 5, 1) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {171074,50},
        fix_reward => {171074,50}    };
get(Lv, 5, 2) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 5, 3) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {172074,50},
        fix_reward => {172074,50}    };
get(Lv, 5, 5) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {173074,50},
        fix_reward => {173074,50}    };
get(Lv, 5, 4) when Lv =< 83 -> 
	#{
        nor_reward => {170074,50},
        mul_reward => {174074,50},
        fix_reward => {174074,50}    };
get(Lv, 1, 1) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {171075,50},
        fix_reward => {171075,50}    };
get(Lv, 1, 2) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 1, 3) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 1, 5) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {173075,50},
        fix_reward => {173075,50}    };
get(Lv, 1, 4) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {174075,50},
        fix_reward => {174075,50}    };
get(Lv, 2, 1) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {171075,50},
        fix_reward => {171075,50}    };
get(Lv, 2, 2) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 2, 3) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 2, 5) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {173075,50},
        fix_reward => {173075,50}    };
get(Lv, 2, 4) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {174075,50},
        fix_reward => {174075,50}    };
get(Lv, 3, 1) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {171075,50},
        fix_reward => {171075,50}    };
get(Lv, 3, 2) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 3, 3) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 3, 5) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {173075,50},
        fix_reward => {173075,50}    };
get(Lv, 3, 4) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {174075,50},
        fix_reward => {174075,50}    };
get(Lv, 4, 1) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {171075,50},
        fix_reward => {171075,50}    };
get(Lv, 4, 2) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 4, 3) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 4, 5) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {173075,50},
        fix_reward => {173075,50}    };
get(Lv, 4, 4) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {174075,50},
        fix_reward => {174075,50}    };
get(Lv, 5, 1) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {171075,50},
        fix_reward => {171075,50}    };
get(Lv, 5, 2) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 5, 3) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {172075,50},
        fix_reward => {172075,50}    };
get(Lv, 5, 5) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {173075,50},
        fix_reward => {173075,50}    };
get(Lv, 5, 4) when Lv =< 84 -> 
	#{
        nor_reward => {170075,50},
        mul_reward => {174075,50},
        fix_reward => {174075,50}    };
get(Lv, 1, 1) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {171076,50},
        fix_reward => {171076,50}    };
get(Lv, 1, 2) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 1, 3) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 1, 5) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {173076,50},
        fix_reward => {173076,50}    };
get(Lv, 1, 4) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {174076,50},
        fix_reward => {174076,50}    };
get(Lv, 2, 1) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {171076,50},
        fix_reward => {171076,50}    };
get(Lv, 2, 2) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 2, 3) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 2, 5) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {173076,50},
        fix_reward => {173076,50}    };
get(Lv, 2, 4) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {174076,50},
        fix_reward => {174076,50}    };
get(Lv, 3, 1) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {171076,50},
        fix_reward => {171076,50}    };
get(Lv, 3, 2) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 3, 3) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 3, 5) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {173076,50},
        fix_reward => {173076,50}    };
get(Lv, 3, 4) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {174076,50},
        fix_reward => {174076,50}    };
get(Lv, 4, 1) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {171076,50},
        fix_reward => {171076,50}    };
get(Lv, 4, 2) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 4, 3) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 4, 5) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {173076,50},
        fix_reward => {173076,50}    };
get(Lv, 4, 4) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {174076,50},
        fix_reward => {174076,50}    };
get(Lv, 5, 1) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {171076,50},
        fix_reward => {171076,50}    };
get(Lv, 5, 2) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 5, 3) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {172076,50},
        fix_reward => {172076,50}    };
get(Lv, 5, 5) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {173076,50},
        fix_reward => {173076,50}    };
get(Lv, 5, 4) when Lv =< 85 -> 
	#{
        nor_reward => {170076,50},
        mul_reward => {174076,50},
        fix_reward => {174076,50}    };
get(Lv, 1, 1) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {171077,50},
        fix_reward => {171077,50}    };
get(Lv, 1, 2) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 1, 3) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 1, 5) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {173077,50},
        fix_reward => {173077,50}    };
get(Lv, 1, 4) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {174077,50},
        fix_reward => {174077,50}    };
get(Lv, 2, 1) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {171077,50},
        fix_reward => {171077,50}    };
get(Lv, 2, 2) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 2, 3) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 2, 5) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {173077,50},
        fix_reward => {173077,50}    };
get(Lv, 2, 4) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {174077,50},
        fix_reward => {174077,50}    };
get(Lv, 3, 1) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {171077,50},
        fix_reward => {171077,50}    };
get(Lv, 3, 2) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 3, 3) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 3, 5) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {173077,50},
        fix_reward => {173077,50}    };
get(Lv, 3, 4) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {174077,50},
        fix_reward => {174077,50}    };
get(Lv, 4, 1) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {171077,50},
        fix_reward => {171077,50}    };
get(Lv, 4, 2) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 4, 3) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 4, 5) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {173077,50},
        fix_reward => {173077,50}    };
get(Lv, 4, 4) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {174077,50},
        fix_reward => {174077,50}    };
get(Lv, 5, 1) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {171077,50},
        fix_reward => {171077,50}    };
get(Lv, 5, 2) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 5, 3) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {172077,50},
        fix_reward => {172077,50}    };
get(Lv, 5, 5) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {173077,50},
        fix_reward => {173077,50}    };
get(Lv, 5, 4) when Lv =< 86 -> 
	#{
        nor_reward => {170077,50},
        mul_reward => {174077,50},
        fix_reward => {174077,50}    };
get(Lv, 1, 1) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {171078,50},
        fix_reward => {171078,50}    };
get(Lv, 1, 2) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 1, 3) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 1, 5) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {173078,50},
        fix_reward => {173078,50}    };
get(Lv, 1, 4) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {174078,50},
        fix_reward => {174078,50}    };
get(Lv, 2, 1) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {171078,50},
        fix_reward => {171078,50}    };
get(Lv, 2, 2) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 2, 3) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 2, 5) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {173078,50},
        fix_reward => {173078,50}    };
get(Lv, 2, 4) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {174078,50},
        fix_reward => {174078,50}    };
get(Lv, 3, 1) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {171078,50},
        fix_reward => {171078,50}    };
get(Lv, 3, 2) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 3, 3) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 3, 5) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {173078,50},
        fix_reward => {173078,50}    };
get(Lv, 3, 4) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {174078,50},
        fix_reward => {174078,50}    };
get(Lv, 4, 1) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {171078,50},
        fix_reward => {171078,50}    };
get(Lv, 4, 2) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 4, 3) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 4, 5) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {173078,50},
        fix_reward => {173078,50}    };
get(Lv, 4, 4) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {174078,50},
        fix_reward => {174078,50}    };
get(Lv, 5, 1) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {171078,50},
        fix_reward => {171078,50}    };
get(Lv, 5, 2) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 5, 3) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {172078,50},
        fix_reward => {172078,50}    };
get(Lv, 5, 5) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {173078,50},
        fix_reward => {173078,50}    };
get(Lv, 5, 4) when Lv =< 87 -> 
	#{
        nor_reward => {170078,50},
        mul_reward => {174078,50},
        fix_reward => {174078,50}    };
get(Lv, 1, 1) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {171079,50},
        fix_reward => {171079,50}    };
get(Lv, 1, 2) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 1, 3) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 1, 5) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {173079,50},
        fix_reward => {173079,50}    };
get(Lv, 1, 4) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {174079,50},
        fix_reward => {174079,50}    };
get(Lv, 2, 1) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {171079,50},
        fix_reward => {171079,50}    };
get(Lv, 2, 2) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 2, 3) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 2, 5) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {173079,50},
        fix_reward => {173079,50}    };
get(Lv, 2, 4) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {174079,50},
        fix_reward => {174079,50}    };
get(Lv, 3, 1) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {171079,50},
        fix_reward => {171079,50}    };
get(Lv, 3, 2) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 3, 3) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 3, 5) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {173079,50},
        fix_reward => {173079,50}    };
get(Lv, 3, 4) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {174079,50},
        fix_reward => {174079,50}    };
get(Lv, 4, 1) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {171079,50},
        fix_reward => {171079,50}    };
get(Lv, 4, 2) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 4, 3) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 4, 5) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {173079,50},
        fix_reward => {173079,50}    };
get(Lv, 4, 4) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {174079,50},
        fix_reward => {174079,50}    };
get(Lv, 5, 1) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {171079,50},
        fix_reward => {171079,50}    };
get(Lv, 5, 2) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 5, 3) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {172079,50},
        fix_reward => {172079,50}    };
get(Lv, 5, 5) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {173079,50},
        fix_reward => {173079,50}    };
get(Lv, 5, 4) when Lv =< 88 -> 
	#{
        nor_reward => {170079,50},
        mul_reward => {174079,50},
        fix_reward => {174079,50}    };
get(Lv, 1, 1) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {171080,50},
        fix_reward => {171080,50}    };
get(Lv, 1, 2) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 1, 3) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 1, 5) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {173080,50},
        fix_reward => {173080,50}    };
get(Lv, 1, 4) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {174080,50},
        fix_reward => {174080,50}    };
get(Lv, 2, 1) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {171080,50},
        fix_reward => {171080,50}    };
get(Lv, 2, 2) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 2, 3) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 2, 5) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {173080,50},
        fix_reward => {173080,50}    };
get(Lv, 2, 4) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {174080,50},
        fix_reward => {174080,50}    };
get(Lv, 3, 1) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {171080,50},
        fix_reward => {171080,50}    };
get(Lv, 3, 2) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 3, 3) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 3, 5) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {173080,50},
        fix_reward => {173080,50}    };
get(Lv, 3, 4) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {174080,50},
        fix_reward => {174080,50}    };
get(Lv, 4, 1) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {171080,50},
        fix_reward => {171080,50}    };
get(Lv, 4, 2) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 4, 3) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 4, 5) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {173080,50},
        fix_reward => {173080,50}    };
get(Lv, 4, 4) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {174080,50},
        fix_reward => {174080,50}    };
get(Lv, 5, 1) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {171080,50},
        fix_reward => {171080,50}    };
get(Lv, 5, 2) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 5, 3) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {172080,50},
        fix_reward => {172080,50}    };
get(Lv, 5, 5) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {173080,50},
        fix_reward => {173080,50}    };
get(Lv, 5, 4) when Lv =< 89 -> 
	#{
        nor_reward => {170080,50},
        mul_reward => {174080,50},
        fix_reward => {174080,50}    };
get(Lv, 1, 1) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {171081,50},
        fix_reward => {171081,50}    };
get(Lv, 1, 2) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 1, 3) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 1, 5) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {173081,50},
        fix_reward => {173081,50}    };
get(Lv, 1, 4) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {174081,50},
        fix_reward => {174081,50}    };
get(Lv, 2, 1) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {171081,50},
        fix_reward => {171081,50}    };
get(Lv, 2, 2) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 2, 3) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 2, 5) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {173081,50},
        fix_reward => {173081,50}    };
get(Lv, 2, 4) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {174081,50},
        fix_reward => {174081,50}    };
get(Lv, 3, 1) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {171081,50},
        fix_reward => {171081,50}    };
get(Lv, 3, 2) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 3, 3) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 3, 5) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {173081,50},
        fix_reward => {173081,50}    };
get(Lv, 3, 4) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {174081,50},
        fix_reward => {174081,50}    };
get(Lv, 4, 1) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {171081,50},
        fix_reward => {171081,50}    };
get(Lv, 4, 2) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 4, 3) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 4, 5) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {173081,50},
        fix_reward => {173081,50}    };
get(Lv, 4, 4) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {174081,50},
        fix_reward => {174081,50}    };
get(Lv, 5, 1) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {171081,50},
        fix_reward => {171081,50}    };
get(Lv, 5, 2) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 5, 3) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {172081,50},
        fix_reward => {172081,50}    };
get(Lv, 5, 5) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {173081,50},
        fix_reward => {173081,50}    };
get(Lv, 5, 4) when Lv =< 90 -> 
	#{
        nor_reward => {170081,50},
        mul_reward => {174081,50},
        fix_reward => {174081,50}    };
get(Lv, 1, 1) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {171082,50},
        fix_reward => {171082,50}    };
get(Lv, 1, 2) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 1, 3) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 1, 5) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {173082,50},
        fix_reward => {173082,50}    };
get(Lv, 1, 4) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {174082,50},
        fix_reward => {174082,50}    };
get(Lv, 2, 1) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {171082,50},
        fix_reward => {171082,50}    };
get(Lv, 2, 2) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 2, 3) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 2, 5) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {173082,50},
        fix_reward => {173082,50}    };
get(Lv, 2, 4) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {174082,50},
        fix_reward => {174082,50}    };
get(Lv, 3, 1) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {171082,50},
        fix_reward => {171082,50}    };
get(Lv, 3, 2) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 3, 3) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 3, 5) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {173082,50},
        fix_reward => {173082,50}    };
get(Lv, 3, 4) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {174082,50},
        fix_reward => {174082,50}    };
get(Lv, 4, 1) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {171082,50},
        fix_reward => {171082,50}    };
get(Lv, 4, 2) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 4, 3) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 4, 5) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {173082,50},
        fix_reward => {173082,50}    };
get(Lv, 4, 4) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {174082,50},
        fix_reward => {174082,50}    };
get(Lv, 5, 1) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {171082,50},
        fix_reward => {171082,50}    };
get(Lv, 5, 2) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 5, 3) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {172082,50},
        fix_reward => {172082,50}    };
get(Lv, 5, 5) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {173082,50},
        fix_reward => {173082,50}    };
get(Lv, 5, 4) when Lv =< 91 -> 
	#{
        nor_reward => {170082,50},
        mul_reward => {174082,50},
        fix_reward => {174082,50}    };
get(Lv, 1, 1) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {171083,50},
        fix_reward => {171083,50}    };
get(Lv, 1, 2) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 1, 3) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 1, 5) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {173083,50},
        fix_reward => {173083,50}    };
get(Lv, 1, 4) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {174083,50},
        fix_reward => {174083,50}    };
get(Lv, 2, 1) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {171083,50},
        fix_reward => {171083,50}    };
get(Lv, 2, 2) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 2, 3) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 2, 5) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {173083,50},
        fix_reward => {173083,50}    };
get(Lv, 2, 4) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {174083,50},
        fix_reward => {174083,50}    };
get(Lv, 3, 1) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {171083,50},
        fix_reward => {171083,50}    };
get(Lv, 3, 2) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 3, 3) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 3, 5) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {173083,50},
        fix_reward => {173083,50}    };
get(Lv, 3, 4) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {174083,50},
        fix_reward => {174083,50}    };
get(Lv, 4, 1) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {171083,50},
        fix_reward => {171083,50}    };
get(Lv, 4, 2) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 4, 3) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 4, 5) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {173083,50},
        fix_reward => {173083,50}    };
get(Lv, 4, 4) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {174083,50},
        fix_reward => {174083,50}    };
get(Lv, 5, 1) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {171083,50},
        fix_reward => {171083,50}    };
get(Lv, 5, 2) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 5, 3) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {172083,50},
        fix_reward => {172083,50}    };
get(Lv, 5, 5) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {173083,50},
        fix_reward => {173083,50}    };
get(Lv, 5, 4) when Lv =< 92 -> 
	#{
        nor_reward => {170083,50},
        mul_reward => {174083,50},
        fix_reward => {174083,50}    };
get(Lv, 1, 1) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {171084,50},
        fix_reward => {171084,50}    };
get(Lv, 1, 2) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 1, 3) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 1, 5) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {173084,50},
        fix_reward => {173084,50}    };
get(Lv, 1, 4) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {174084,50},
        fix_reward => {174084,50}    };
get(Lv, 2, 1) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {171084,50},
        fix_reward => {171084,50}    };
get(Lv, 2, 2) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 2, 3) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 2, 5) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {173084,50},
        fix_reward => {173084,50}    };
get(Lv, 2, 4) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {174084,50},
        fix_reward => {174084,50}    };
get(Lv, 3, 1) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {171084,50},
        fix_reward => {171084,50}    };
get(Lv, 3, 2) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 3, 3) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 3, 5) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {173084,50},
        fix_reward => {173084,50}    };
get(Lv, 3, 4) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {174084,50},
        fix_reward => {174084,50}    };
get(Lv, 4, 1) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {171084,50},
        fix_reward => {171084,50}    };
get(Lv, 4, 2) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 4, 3) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 4, 5) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {173084,50},
        fix_reward => {173084,50}    };
get(Lv, 4, 4) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {174084,50},
        fix_reward => {174084,50}    };
get(Lv, 5, 1) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {171084,50},
        fix_reward => {171084,50}    };
get(Lv, 5, 2) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 5, 3) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {172084,50},
        fix_reward => {172084,50}    };
get(Lv, 5, 5) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {173084,50},
        fix_reward => {173084,50}    };
get(Lv, 5, 4) when Lv =< 93 -> 
	#{
        nor_reward => {170084,50},
        mul_reward => {174084,50},
        fix_reward => {174084,50}    };
get(Lv, 1, 1) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {171085,50},
        fix_reward => {171085,50}    };
get(Lv, 1, 2) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 1, 3) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 1, 5) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {173085,50},
        fix_reward => {173085,50}    };
get(Lv, 1, 4) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {174085,50},
        fix_reward => {174085,50}    };
get(Lv, 2, 1) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {171085,50},
        fix_reward => {171085,50}    };
get(Lv, 2, 2) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 2, 3) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 2, 5) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {173085,50},
        fix_reward => {173085,50}    };
get(Lv, 2, 4) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {174085,50},
        fix_reward => {174085,50}    };
get(Lv, 3, 1) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {171085,50},
        fix_reward => {171085,50}    };
get(Lv, 3, 2) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 3, 3) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 3, 5) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {173085,50},
        fix_reward => {173085,50}    };
get(Lv, 3, 4) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {174085,50},
        fix_reward => {174085,50}    };
get(Lv, 4, 1) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {171085,50},
        fix_reward => {171085,50}    };
get(Lv, 4, 2) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 4, 3) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 4, 5) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {173085,50},
        fix_reward => {173085,50}    };
get(Lv, 4, 4) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {174085,50},
        fix_reward => {174085,50}    };
get(Lv, 5, 1) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {171085,50},
        fix_reward => {171085,50}    };
get(Lv, 5, 2) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 5, 3) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {172085,50},
        fix_reward => {172085,50}    };
get(Lv, 5, 5) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {173085,50},
        fix_reward => {173085,50}    };
get(Lv, 5, 4) when Lv =< 94 -> 
	#{
        nor_reward => {170085,50},
        mul_reward => {174085,50},
        fix_reward => {174085,50}    };
get(Lv, 1, 1) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {171086,50},
        fix_reward => {171086,50}    };
get(Lv, 1, 2) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 1, 3) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 1, 5) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {173086,50},
        fix_reward => {173086,50}    };
get(Lv, 1, 4) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {174086,50},
        fix_reward => {174086,50}    };
get(Lv, 2, 1) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {171086,50},
        fix_reward => {171086,50}    };
get(Lv, 2, 2) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 2, 3) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 2, 5) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {173086,50},
        fix_reward => {173086,50}    };
get(Lv, 2, 4) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {174086,50},
        fix_reward => {174086,50}    };
get(Lv, 3, 1) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {171086,50},
        fix_reward => {171086,50}    };
get(Lv, 3, 2) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 3, 3) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 3, 5) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {173086,50},
        fix_reward => {173086,50}    };
get(Lv, 3, 4) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {174086,50},
        fix_reward => {174086,50}    };
get(Lv, 4, 1) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {171086,50},
        fix_reward => {171086,50}    };
get(Lv, 4, 2) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 4, 3) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 4, 5) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {173086,50},
        fix_reward => {173086,50}    };
get(Lv, 4, 4) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {174086,50},
        fix_reward => {174086,50}    };
get(Lv, 5, 1) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {171086,50},
        fix_reward => {171086,50}    };
get(Lv, 5, 2) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 5, 3) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {172086,50},
        fix_reward => {172086,50}    };
get(Lv, 5, 5) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {173086,50},
        fix_reward => {173086,50}    };
get(Lv, 5, 4) when Lv =< 95 -> 
	#{
        nor_reward => {170086,50},
        mul_reward => {174086,50},
        fix_reward => {174086,50}    };
get(Lv, 1, 1) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {171087,50},
        fix_reward => {171087,50}    };
get(Lv, 1, 2) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 1, 3) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 1, 5) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {173087,50},
        fix_reward => {173087,50}    };
get(Lv, 1, 4) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {174087,50},
        fix_reward => {174087,50}    };
get(Lv, 2, 1) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {171087,50},
        fix_reward => {171087,50}    };
get(Lv, 2, 2) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 2, 3) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 2, 5) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {173087,50},
        fix_reward => {173087,50}    };
get(Lv, 2, 4) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {174087,50},
        fix_reward => {174087,50}    };
get(Lv, 3, 1) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {171087,50},
        fix_reward => {171087,50}    };
get(Lv, 3, 2) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 3, 3) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 3, 5) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {173087,50},
        fix_reward => {173087,50}    };
get(Lv, 3, 4) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {174087,50},
        fix_reward => {174087,50}    };
get(Lv, 4, 1) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {171087,50},
        fix_reward => {171087,50}    };
get(Lv, 4, 2) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 4, 3) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 4, 5) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {173087,50},
        fix_reward => {173087,50}    };
get(Lv, 4, 4) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {174087,50},
        fix_reward => {174087,50}    };
get(Lv, 5, 1) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {171087,50},
        fix_reward => {171087,50}    };
get(Lv, 5, 2) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 5, 3) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {172087,50},
        fix_reward => {172087,50}    };
get(Lv, 5, 5) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {173087,50},
        fix_reward => {173087,50}    };
get(Lv, 5, 4) when Lv =< 96 -> 
	#{
        nor_reward => {170087,50},
        mul_reward => {174087,50},
        fix_reward => {174087,50}    };
get(Lv, 1, 1) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {171088,50},
        fix_reward => {171088,50}    };
get(Lv, 1, 2) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 1, 3) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 1, 5) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {173088,50},
        fix_reward => {173088,50}    };
get(Lv, 1, 4) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {174088,50},
        fix_reward => {174088,50}    };
get(Lv, 2, 1) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {171088,50},
        fix_reward => {171088,50}    };
get(Lv, 2, 2) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 2, 3) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 2, 5) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {173088,50},
        fix_reward => {173088,50}    };
get(Lv, 2, 4) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {174088,50},
        fix_reward => {174088,50}    };
get(Lv, 3, 1) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {171088,50},
        fix_reward => {171088,50}    };
get(Lv, 3, 2) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 3, 3) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 3, 5) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {173088,50},
        fix_reward => {173088,50}    };
get(Lv, 3, 4) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {174088,50},
        fix_reward => {174088,50}    };
get(Lv, 4, 1) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {171088,50},
        fix_reward => {171088,50}    };
get(Lv, 4, 2) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 4, 3) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 4, 5) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {173088,50},
        fix_reward => {173088,50}    };
get(Lv, 4, 4) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {174088,50},
        fix_reward => {174088,50}    };
get(Lv, 5, 1) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {171088,50},
        fix_reward => {171088,50}    };
get(Lv, 5, 2) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 5, 3) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {172088,50},
        fix_reward => {172088,50}    };
get(Lv, 5, 5) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {173088,50},
        fix_reward => {173088,50}    };
get(Lv, 5, 4) when Lv =< 97 -> 
	#{
        nor_reward => {170088,50},
        mul_reward => {174088,50},
        fix_reward => {174088,50}    };
get(Lv, 1, 1) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {171089,50},
        fix_reward => {171089,50}    };
get(Lv, 1, 2) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 1, 3) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 1, 5) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {173089,50},
        fix_reward => {173089,50}    };
get(Lv, 1, 4) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {174089,50},
        fix_reward => {174089,50}    };
get(Lv, 2, 1) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {171089,50},
        fix_reward => {171089,50}    };
get(Lv, 2, 2) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 2, 3) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 2, 5) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {173089,50},
        fix_reward => {173089,50}    };
get(Lv, 2, 4) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {174089,50},
        fix_reward => {174089,50}    };
get(Lv, 3, 1) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {171089,50},
        fix_reward => {171089,50}    };
get(Lv, 3, 2) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 3, 3) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 3, 5) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {173089,50},
        fix_reward => {173089,50}    };
get(Lv, 3, 4) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {174089,50},
        fix_reward => {174089,50}    };
get(Lv, 4, 1) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {171089,50},
        fix_reward => {171089,50}    };
get(Lv, 4, 2) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 4, 3) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 4, 5) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {173089,50},
        fix_reward => {173089,50}    };
get(Lv, 4, 4) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {174089,50},
        fix_reward => {174089,50}    };
get(Lv, 5, 1) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {171089,50},
        fix_reward => {171089,50}    };
get(Lv, 5, 2) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 5, 3) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {172089,50},
        fix_reward => {172089,50}    };
get(Lv, 5, 5) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {173089,50},
        fix_reward => {173089,50}    };
get(Lv, 5, 4) when Lv =< 98 -> 
	#{
        nor_reward => {170089,50},
        mul_reward => {174089,50},
        fix_reward => {174089,50}    };
get(Lv, 1, 1) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {171090,50},
        fix_reward => {171090,50}    };
get(Lv, 1, 2) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 1, 3) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 1, 5) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {173090,50},
        fix_reward => {173090,50}    };
get(Lv, 1, 4) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {174090,50},
        fix_reward => {174090,50}    };
get(Lv, 2, 1) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {171090,50},
        fix_reward => {171090,50}    };
get(Lv, 2, 2) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 2, 3) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 2, 5) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {173090,50},
        fix_reward => {173090,50}    };
get(Lv, 2, 4) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {174090,50},
        fix_reward => {174090,50}    };
get(Lv, 3, 1) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {171090,50},
        fix_reward => {171090,50}    };
get(Lv, 3, 2) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 3, 3) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 3, 5) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {173090,50},
        fix_reward => {173090,50}    };
get(Lv, 3, 4) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {174090,50},
        fix_reward => {174090,50}    };
get(Lv, 4, 1) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {171090,50},
        fix_reward => {171090,50}    };
get(Lv, 4, 2) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 4, 3) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 4, 5) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {173090,50},
        fix_reward => {173090,50}    };
get(Lv, 4, 4) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {174090,50},
        fix_reward => {174090,50}    };
get(Lv, 5, 1) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {171090,50},
        fix_reward => {171090,50}    };
get(Lv, 5, 2) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 5, 3) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {172090,50},
        fix_reward => {172090,50}    };
get(Lv, 5, 5) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {173090,50},
        fix_reward => {173090,50}    };
get(Lv, 5, 4) when Lv =< 999 -> 
	#{
        nor_reward => {170090,50},
        mul_reward => {174090,50},
        fix_reward => {174090,50}    };
get(_Lv, _Stage, _Type) ->
    undefined.

get_types() ->
	[1, 2, 3, 5, 4].