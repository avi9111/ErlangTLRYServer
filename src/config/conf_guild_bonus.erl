%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_bonus
%% @Brief  : 帮会分红
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_bonus).

-export([
    get/2,
    get_type_stages/1,
    get_types/0
]).

get(1, 1) ->
    #{
        num => 500,
        bonus => 20    };
get(1, 2) ->
    #{
        num => 750,
        bonus => 20    };
get(1, 3) ->
    #{
        num => 1000,
        bonus => 40    };
get(1, 4) ->
    #{
        num => 1250,
        bonus => 60    };
get(1, 5) ->
    #{
        num => 1500,
        bonus => 60    };
get(2, 1) ->
    #{
        num => 700,
        bonus => 40    };
get(2, 2) ->
    #{
        num => 1000,
        bonus => 40    };
get(2, 3) ->
    #{
        num => 2100,
        bonus => 60    };
get(2, 4) ->
    #{
        num => 3500,
        bonus => 80    };
get(2, 5) ->
    #{
        num => 4200,
        bonus => 80    };
get(3, 1) ->
    #{
        num => 400,
        bonus => 40    };
get(3, 2) ->
    #{
        num => 600,
        bonus => 40    };
get(3, 3) ->
    #{
        num => 1200,
        bonus => 60    };
get(3, 4) ->
    #{
        num => 2100,
        bonus => 80    };
get(3, 5) ->
    #{
        num => 2500,
        bonus => 80    };
get(4, 1) ->
    #{
        num => 50,
        bonus => 40    };
get(4, 2) ->
    #{
        num => 75,
        bonus => 40    };
get(4, 3) ->
    #{
        num => 100,
        bonus => 60    };
get(4, 4) ->
    #{
        num => 125,
        bonus => 80    };
get(4, 5) ->
    #{
        num => 150,
        bonus => 80    };
get(5, 1) ->
    #{
        num => 7,
        bonus => 40    };
get(5, 2) ->
    #{
        num => 12,
        bonus => 80    };
get(5, 3) ->
    #{
        num => 17,
        bonus => 120    };
get(5, 4) ->
    #{
        num => 26,
        bonus => 160    };
get(5, 5) ->
    #{
        num => 36,
        bonus => 200    };
get(_ID, _Lv) ->
    undefined.

get_type_stages(1) ->
    [1, 2, 3, 4, 5];
get_type_stages(2) ->
    [1, 2, 3, 4, 5];
get_type_stages(3) ->
    [1, 2, 3, 4, 5];
get_type_stages(4) ->
    [1, 2, 3, 4, 5];
get_type_stages(5) ->
    [1, 2, 3, 4, 5];
get_type_stages(_) ->
    [].


get_types() ->
	[1, 2, 3, 4, 5].