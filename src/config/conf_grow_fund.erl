%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_grow_fund
%% @Brief  : 成长基金
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_grow_fund).

-export([
    get/2,
    get_grades/0,
    get_grade_ids/1
]).

get(11, 1) -> 
	#{
        level => 30,
        bgold => 600    };
get(11, 2) -> 
	#{
        level => 35,
        bgold => 600    };
get(11, 3) -> 
	#{
        level => 40,
        bgold => 600    };
get(11, 4) -> 
	#{
        level => 45,
        bgold => 600    };
get(11, 5) -> 
	#{
        level => 50,
        bgold => 800    };
get(11, 6) -> 
	#{
        level => 55,
        bgold => 800    };
get(11, 7) -> 
	#{
        level => 60,
        bgold => 800    };
get(11, 8) -> 
	#{
        level => 65,
        bgold => 800    };
get(11, 9) -> 
	#{
        level => 70,
        bgold => 1288    };
get(12, 1) -> 
	#{
        level => 73,
        bgold => 800    };
get(12, 2) -> 
	#{
        level => 75,
        bgold => 800    };
get(12, 3) -> 
	#{
        level => 78,
        bgold => 800    };
get(12, 4) -> 
	#{
        level => 80,
        bgold => 1200    };
get(12, 5) -> 
	#{
        level => 82,
        bgold => 1200    };
get(12, 6) -> 
	#{
        level => 84,
        bgold => 1200    };
get(12, 7) -> 
	#{
        level => 85,
        bgold => 1400    };
get(12, 8) -> 
	#{
        level => 87,
        bgold => 1400    };
get(12, 9) -> 
	#{
        level => 89,
        bgold => 1600    };
get(13, 1) -> 
	#{
        level => 90,
        bgold => 1400    };
get(13, 2) -> 
	#{
        level => 92,
        bgold => 1400    };
get(13, 3) -> 
	#{
        level => 93,
        bgold => 1400    };
get(13, 4) -> 
	#{
        level => 94,
        bgold => 1800    };
get(13, 5) -> 
	#{
        level => 95,
        bgold => 1800    };
get(13, 6) -> 
	#{
        level => 96,
        bgold => 1800    };
get(13, 7) -> 
	#{
        level => 97,
        bgold => 2200    };
get(13, 8) -> 
	#{
        level => 98,
        bgold => 2200    };
get(13, 9) -> 
	#{
        level => 99,
        bgold => 2888    };
get(_Grade, _ID) ->
    undefined.

get_grades() ->
	[11, 12, 13].

get_grade_ids(11) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9];
get_grade_ids(12) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9];
get_grade_ids(13) ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9];
get_grade_ids(_) ->
    [].