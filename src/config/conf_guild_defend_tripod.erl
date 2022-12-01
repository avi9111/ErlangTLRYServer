%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_defend_tripod
%% @Brief  : 帮派守卫战鼎
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_defend_tripod).

-export([
    get/2,
    get_lv_ids/1,
    get_triopd_ids/0
]).

get(GuildLv, 1) when GuildLv =< 1 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 1 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 1 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 2 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 2 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 2 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 3 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 3 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 3 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 4 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 4 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 4 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 5 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 5 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 5 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 6 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 6 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 6 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 7 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 7 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 7 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 8 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 8 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 8 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 9 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 9 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 9 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(GuildLv, 1) when GuildLv =< 999 -> 
	#{
        mon_id => 1920001,
        x => 332,
        y => 464    };
get(GuildLv, 2) when GuildLv =< 999 -> 
	#{
        mon_id => 1920101,
        x => 280,
        y => 350    };
get(GuildLv, 3) when GuildLv =< 999 -> 
	#{
        mon_id => 1920201,
        x => 400,
        y => 350    };
get(_GuildLv, _ID) ->
    undefined.

get_lv_ids(GuildLv) when GuildLv =< 1 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 2 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 3 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 4 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 5 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 6 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 7 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 8 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 9 ->
    [1, 2, 3];
get_lv_ids(GuildLv) when GuildLv =< 999 ->
    [1, 2, 3];
get_lv_ids(_) ->
    [].

get_triopd_ids() ->
	[1920001, 1920101, 1920201].