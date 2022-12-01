%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_firework
%% @Brief  : 烟花
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_firework).

-export([
    get/1
]).

get(40010101) -> 
	#{
		type => 1,
		is_create_flyitem => 1,
		flyitem_id => [2001],
		visible_object => 1,
		hero => 52,
		charm => 52,
		info_key => yanhua_40010101,
		scene_limit => [40013],
		func_type => 1	};
get(40010102) -> 
	#{
		type => 1,
		is_create_flyitem => 1,
		flyitem_id => [2002],
		visible_object => 1,
		hero => 52,
		charm => 52,
		info_key => yanhua_40010102,
		scene_limit => [40013],
		func_type => 1	};
get(40010103) -> 
	#{
		type => 1,
		is_create_flyitem => 1,
		flyitem_id => [2003],
		visible_object => 1,
		hero => 52,
		charm => 52,
		info_key => yanhua_40010103,
		scene_limit => [40013],
		func_type => 1	};
get(40010104) -> 
	#{
		type => 2,
		is_create_flyitem => 1,
		flyitem_id => [2004],
		visible_object => 4,
		hero => 520,
		charm => 520,
		info_key => yanhua_40010104,
		scene_limit => [40013],
		func_type => 1	};
get(40010105) -> 
	#{
		type => 1,
		is_create_flyitem => 1,
		flyitem_id => [2005],
		visible_object => 1,
		hero => 52,
		charm => 52,
		info_key => yanhua_40010103,
		scene_limit => [40013],
		func_type => 1	};
get(40010106) -> 
	#{
		type => 1,
		is_create_flyitem => 1,
		flyitem_id => [2006],
		visible_object => 1,
		hero => 52,
		charm => 52,
		info_key => yanhua_40010103,
		scene_limit => [40013],
		func_type => 1	};
get(_ID) -> 
	undefined.