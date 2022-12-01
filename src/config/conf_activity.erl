%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_activity
%% @Brief  : 活动配置表[后端专用]
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_activity).

-export([
    get/1,
    get_ids/0,
    get_id_by_type/1
]).

get(1001) ->
    #{
        id => 1001,
        name => <<"武林盟主">>,
        type => 1,
        callback => svr_master,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(1004) ->
    #{
        id => 1004,
        name => <<"武林禁地">>,
        type => 1,
        callback => svr_world_boss_mgr,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(1005) ->
    #{
        id => 1005,
        name => <<"帮会守卫战">>,
        type => 1,
        callback => svr_guild_defend,
        callback2 => undefined,
        prepare => 2,
        finish => 0,
        cluster => false        
    };
get(1006) ->
    #{
        id => 1006,
        name => <<"门派竞技">>,
        type => 1,
        callback => svr_career_battle_mgr,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(1007) ->
    #{
        id => 1007,
        name => <<"镜湖剿匪">>,
        type => 1,
        callback => svr_lake_bandits,
        callback2 => undefined,
        prepare => 2,
        finish => 0,
        cluster => false        
    };
get(1008) ->
    #{
        id => 1008,
        name => <<"帮会行酒令">>,
        type => 1,
        callback => svr_guild_wine_act,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1009) ->
    #{
        id => 1009,
        name => <<"演武堂">>,
        type => 1,
        callback => svr_jousts_hall_lounge,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1010) ->
    #{
        id => 1010,
        name => <<"领地战">>,
        type => 1,
        callback => svr_territory_mgr,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1011) ->
    #{
        id => 1011,
        name => <<"领地战">>,
        type => 1,
        callback => svr_territory_mgr,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1012) ->
    #{
        id => 1012,
        name => <<"领地战">>,
        type => 1,
        callback => svr_territory_mgr,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1013) ->
    #{
        id => 1013,
        name => <<"帮会练功">>,
        type => 1,
        callback => svr_guild_practice,
        callback2 => undefined,
        prepare => 5,
        finish => 0,
        cluster => false        
    };
get(1014) ->
    #{
        id => 1014,
        name => <<"珍珑棋局">>,
        type => 1,
        callback => undefined,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(1015) ->
    #{
        id => 1015,
        name => <<"帮会运镖">>,
        type => 1,
        callback => undefined,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(1016) ->
    #{
        id => 1016,
        name => <<"江湖历练">>,
        type => 1,
        callback => undefined,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(2016) ->
    #{
        id => 2016,
        name => <<"开服红利">>,
        type => 2,
        callback => undefined,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => false        
    };
get(6001) ->
    #{
        id => 6001,
        name => <<"宋辽战争">>,
        type => 6,
        callback => svr_dynasty_war_mgr,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => true        
    };
get(6002) ->
    #{
        id => 6002,
        name => <<"秦皇陵">>,
        type => 6,
        callback => svr_qin_mausoleum_mgr,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => true        
    };
get(6003) ->
    #{
        id => 6003,
        name => <<"巅峰秦皇陵">>,
        type => 6,
        callback => svr_qin_mausoleum_mgr,
        callback2 => undefined,
        prepare => 0,
        finish => 0,
        cluster => true        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1001, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 2016, 6001, 6002, 6003].

get_id_by_type(1) ->
    [1001, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016];
get_id_by_type(2) ->
    [2016];
get_id_by_type(6) ->
    [6001, 6002, 6003];
get_id_by_type(_) ->
    [].
