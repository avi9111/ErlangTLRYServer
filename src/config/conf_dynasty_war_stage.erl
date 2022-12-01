%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_dynasty_war_stage
%% @Brief  : 宋辽战争积分阶段
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_dynasty_war_stage).

-export([
    get/1,
    get_ids/0
]).

get(0) ->
    #{
        stage => 0,
        name => <<"未初始化">>,
        zone => 0,
        span => 0,
        time => 0,
        zones => []
    };
get(1) ->
    #{
        stage => 1,
        name => <<"云中准备">>,
        zone => 0,
        span => 30,
        time => 0,
        zones => []
    };
get(2) ->
    #{
        stage => 2,
        name => <<"云中开战">>,
        zone => 1,
        span => 300,
        time => 30,
        zones => [{1, 4}]
    };
get(3) ->
    #{
        stage => 3,
        name => <<"代郡准备">>,
        zone => 0,
        span => 30,
        time => 330,
        zones => []
    };
get(4) ->
    #{
        stage => 4,
        name => <<"代郡开战">>,
        zone => 2,
        span => 300,
        time => 360,
        zones => [{2, 6}]
    };
get(5) ->
    #{
        stage => 5,
        name => <<"雁门准备">>,
        zone => 0,
        span => 30,
        time => 660,
        zones => []
    };
get(6) ->
    #{
        stage => 6,
        name => <<"雁门开战">>,
        zone => 3,
        span => 300,
        time => 690,
        zones => [{3, 8}]
    };
get(7) ->
    #{
        stage => 7,
        name => <<"战场结束">>,
        zone => 0,
        span => 0,
        time => 990,
        zones => []
    };
get(_Score) ->
    0.

get_ids() ->
    [0, 1, 2, 3, 4, 5, 6, 7].
