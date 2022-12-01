%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_guild_research_info
%% @Brief  : 帮派研究信息
%% @Author : LW
%%------------------------------------------------------------------------------
-module(conf_guild_research_info).

-export([
    get/1,
    get_id_type/1,
    get_ids/0,
    get_type_ids/1
]).

get(1001) -> 
	#{
		type => 0,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 3	};
get(1002) -> 
	#{
		type => 0,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 4	};
get(1003) -> 
	#{
		type => 0,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 1	};
get(1004) -> 
	#{
		type => 0,
		need_lv => 3,
		prev => 1002,
		need_num => 0,
		cate => 1	};
get(1005) -> 
	#{
		type => 0,
		need_lv => 3,
		prev => 0,
		need_num => 0,
		cate => 1	};
get(1006) -> 
	#{
		type => 0,
		need_lv => 4,
		prev => 0,
		need_num => 4,
		cate => 1	};
get(1007) -> 
	#{
		type => 0,
		need_lv => 4,
		prev => 0,
		need_num => 4,
		cate => 2	};
get(1008) -> 
	#{
		type => 0,
		need_lv => 4,
		prev => 1003,
		need_num => 4,
		cate => 1	};
get(1009) -> 
	#{
		type => 0,
		need_lv => 4,
		prev => 0,
		need_num => 5,
		cate => 1	};
get(1010) -> 
	#{
		type => 0,
		need_lv => 5,
		prev => 1007,
		need_num => 7,
		cate => 2	};
get(2001) -> 
	#{
		type => 1,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 2	};
get(2002) -> 
	#{
		type => 1,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 4	};
get(2003) -> 
	#{
		type => 1,
		need_lv => 2,
		prev => 0,
		need_num => 0,
		cate => 3	};
get(2004) -> 
	#{
		type => 1,
		need_lv => 3,
		prev => 0,
		need_num => 2,
		cate => 2	};
get(2005) -> 
	#{
		type => 1,
		need_lv => 4,
		prev => 2001,
		need_num => 4,
		cate => 2	};
get(2006) -> 
	#{
		type => 1,
		need_lv => 4,
		prev => 0,
		need_num => 4,
		cate => 4	};
get(2007) -> 
	#{
		type => 1,
		need_lv => 4,
		prev => 2003,
		need_num => 4,
		cate => 1	};
get(2008) -> 
	#{
		type => 1,
		need_lv => 4,
		prev => 2004,
		need_num => 5,
		cate => 2	};
get(2009) -> 
	#{
		type => 1,
		need_lv => 5,
		prev => 2006,
		need_num => 7,
		cate => 2	};
get(2010) -> 
	#{
		type => 1,
		need_lv => 5,
		prev => 2007,
		need_num => 7,
		cate => 1	};
get(_ID) -> 
	undefined.

get_id_type(1001) -> 0;
get_id_type(1002) -> 0;
get_id_type(1003) -> 0;
get_id_type(1004) -> 0;
get_id_type(1005) -> 0;
get_id_type(1006) -> 0;
get_id_type(1007) -> 0;
get_id_type(1008) -> 0;
get_id_type(1009) -> 0;
get_id_type(1010) -> 0;
get_id_type(2001) -> 1;
get_id_type(2002) -> 1;
get_id_type(2003) -> 1;
get_id_type(2004) -> 1;
get_id_type(2005) -> 1;
get_id_type(2006) -> 1;
get_id_type(2007) -> 1;
get_id_type(2008) -> 1;
get_id_type(2009) -> 1;
get_id_type(2010) -> 1;
get_id_type(_ID) -> undefined.

get_ids() ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010].

get_type_ids(0) ->
    [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010];
get_type_ids(1) ->
    [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
get_type_ids(_) ->
    [].