%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_rank
%% @Brief  : 排行榜配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_rank).

-export([
    get/1,
    get_ids/0
]).

get(1001) ->
    #{
        id => 1001,
        name => <<"等级排名">>,
        type => 1,
        cap => 100,
        refresh => 60        
    };
get(1002) ->
    #{
        id => 1002,
        name => <<"战力排名">>,
        type => 1,
        cap => 100,
        refresh => 60        
    };
get(1003) ->
    #{
        id => 1003,
        name => <<"珍兽排名">>,
        type => 1,
        cap => 100,
        refresh => 60        
    };
get(1004) ->
    #{
        id => 1004,
        name => <<"英雄试炼">>,
        type => 1,
        cap => 100,
        refresh => 60        
    };
get(2001) ->
    #{
        id => 2001,
        name => <<"丐帮">>,
        type => 2,
        cap => 100,
        refresh => 60        
    };
get(2002) ->
    #{
        id => 2002,
        name => <<"逍遥">>,
        type => 2,
        cap => 100,
        refresh => 60        
    };
get(2003) ->
    #{
        id => 2003,
        name => <<"峨眉">>,
        type => 2,
        cap => 100,
        refresh => 60        
    };
get(2004) ->
    #{
        id => 2004,
        name => <<"天山">>,
        type => 2,
        cap => 100,
        refresh => 60        
    };
get(3001) ->
    #{
        id => 3001,
        name => <<"帽子">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3002) ->
    #{
        id => 3002,
        name => <<"衣服">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3003) ->
    #{
        id => 3003,
        name => <<"护肩">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3004) ->
    #{
        id => 3004,
        name => <<"鞋子">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3005) ->
    #{
        id => 3005,
        name => <<"护腕">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3006) ->
    #{
        id => 3006,
        name => <<"项链">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3007) ->
    #{
        id => 3007,
        name => <<"戒指">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(3008) ->
    #{
        id => 3008,
        name => <<"护符">>,
        type => 3,
        cap => 100,
        refresh => 60        
    };
get(4001) ->
    #{
        id => 4001,
        name => <<"战斗力">>,
        type => 4,
        cap => 30,
        refresh => 60        
    };
get(4002) ->
    #{
        id => 4002,
        name => <<"七日活跃">>,
        type => 4,
        cap => 30,
        refresh => 1440        
    };
get(4003) ->
    #{
        id => 4003,
        name => <<"武林盟主">>,
        type => 4,
        cap => 30,
        refresh => 0        
    };
get(5001) ->
    #{
        id => 5001,
        name => <<"恩爱值">>,
        type => 5,
        cap => 100,
        refresh => 60        
    };
get(9001) ->
    #{
        id => 9001,
        name => <<"武林盟主 - 个人">>,
        type => 9,
        cap => 9999,
        refresh => 0        
    };
get(9002) ->
    #{
        id => 9002,
        name => <<"武林禁地 - 帮派">>,
        type => 9,
        cap => 9999,
        refresh => 1200        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1001, 1002, 1003, 1004, 2001, 2002, 2003, 2004, 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 4001, 4002, 4003, 5001, 9001, 9002].
