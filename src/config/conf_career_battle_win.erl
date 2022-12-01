%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_career_battle_win
%% @Brief  : 门派竞技连胜
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_career_battle_win).

-export([
    get/2
]).

get(1, 1) -> 
	#{
        get_score => 90,
        defend_get_score => 5    };
get(1, 2) -> 
	#{
        get_score => 101,
        defend_get_score => 10    };
get(1, 3) -> 
	#{
        get_score => 112,
        defend_get_score => 15    };
get(1, 4) -> 
	#{
        get_score => 124,
        defend_get_score => 20    };
get(1, 5) -> 
	#{
        get_score => 136,
        defend_get_score => 25    };
get(1, 6) -> 
	#{
        get_score => 148,
        defend_get_score => 30    };
get(1, 7) -> 
	#{
        get_score => 160,
        defend_get_score => 35    };
get(1, 8) -> 
	#{
        get_score => 172,
        defend_get_score => 40    };
get(1, 9) -> 
	#{
        get_score => 184,
        defend_get_score => 45    };
get(1, 10) -> 
	#{
        get_score => 196,
        defend_get_score => 50    };
get(2, 1) -> 
	#{
        get_score => 90,
        defend_get_score => 5    };
get(2, 2) -> 
	#{
        get_score => 101,
        defend_get_score => 10    };
get(2, 3) -> 
	#{
        get_score => 112,
        defend_get_score => 15    };
get(2, 4) -> 
	#{
        get_score => 124,
        defend_get_score => 20    };
get(2, 5) -> 
	#{
        get_score => 136,
        defend_get_score => 25    };
get(2, 6) -> 
	#{
        get_score => 148,
        defend_get_score => 30    };
get(2, 7) -> 
	#{
        get_score => 160,
        defend_get_score => 35    };
get(2, 8) -> 
	#{
        get_score => 172,
        defend_get_score => 40    };
get(2, 9) -> 
	#{
        get_score => 184,
        defend_get_score => 45    };
get(2, 10) -> 
	#{
        get_score => 196,
        defend_get_score => 50    };
get(3, 1) -> 
	#{
        get_score => 90,
        defend_get_score => 5    };
get(3, 2) -> 
	#{
        get_score => 101,
        defend_get_score => 10    };
get(3, 3) -> 
	#{
        get_score => 112,
        defend_get_score => 15    };
get(3, 4) -> 
	#{
        get_score => 124,
        defend_get_score => 20    };
get(3, 5) -> 
	#{
        get_score => 136,
        defend_get_score => 25    };
get(3, 6) -> 
	#{
        get_score => 148,
        defend_get_score => 30    };
get(3, 7) -> 
	#{
        get_score => 160,
        defend_get_score => 35    };
get(3, 8) -> 
	#{
        get_score => 172,
        defend_get_score => 40    };
get(3, 9) -> 
	#{
        get_score => 184,
        defend_get_score => 45    };
get(3, 10) -> 
	#{
        get_score => 196,
        defend_get_score => 50    };
get(4, 1) -> 
	#{
        get_score => 90,
        defend_get_score => 5    };
get(4, 2) -> 
	#{
        get_score => 101,
        defend_get_score => 10    };
get(4, 3) -> 
	#{
        get_score => 112,
        defend_get_score => 15    };
get(4, 4) -> 
	#{
        get_score => 124,
        defend_get_score => 20    };
get(4, 5) -> 
	#{
        get_score => 136,
        defend_get_score => 25    };
get(4, 6) -> 
	#{
        get_score => 148,
        defend_get_score => 30    };
get(4, 7) -> 
	#{
        get_score => 160,
        defend_get_score => 35    };
get(4, 8) -> 
	#{
        get_score => 172,
        defend_get_score => 40    };
get(4, 9) -> 
	#{
        get_score => 184,
        defend_get_score => 45    };
get(4, 10) -> 
	#{
        get_score => 196,
        defend_get_score => 50    };
get(_Grade, _Times) ->
    #{
        get_score => 0,
        defend_get_score => 0
    }.