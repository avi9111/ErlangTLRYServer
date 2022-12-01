%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_team_target
%% @Brief  : 组队目标
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_team_target).

-export([
    get/1,
    get_ids/0,
    is_fill_robot/1,
    get_by_cate/1
]).

get(1) ->
    #{
        id => 1,
        name => <<"一条龙">>,
        cate => 1,
        min_num => 1,
        max_num => 5,
        level => 25,
        apply_lv => [{1,24},{25,29},{30,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(2) ->
    #{
        id => 2,
        name => <<"夺宝马贼">>,
        cate => 2,
        min_num => 1,
        max_num => 5,
        level => 20,
        apply_lv => [{1,19},{20,99}]
    };
get(3) ->
    #{
        id => 3,
        name => <<"老三环">>,
        cate => 3,
        min_num => 1,
        max_num => 5,
        level => 25,
        apply_lv => [{1,24},{25,29},{30,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(4) ->
    #{
        id => 4,
        name => <<"燕子坞">>,
        cate => 3,
        min_num => 1,
        max_num => 5,
        level => 32,
        apply_lv => [{1,31},{32,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(5) ->
    #{
        id => 5,
        name => <<"四绝庄">>,
        cate => 3,
        min_num => 1,
        max_num => 5,
        level => 50,
        apply_lv => [{1,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(6) ->
    #{
        id => 6,
        name => <<"缥缈峰">>,
        cate => 3,
        min_num => 1,
        max_num => 5,
        level => 64,
        apply_lv => [{1,63},{64,69},{70,79},{80,89},{90,99}]
    };
get(7) ->
    #{
        id => 7,
        name => <<"孵化">>,
        cate => 4,
        min_num => 1,
        max_num => 2,
        level => 99999,
        apply_lv => [{1,99}]
    };
get(8) ->
    #{
        id => 8,
        name => <<"野外">>,
        cate => 5,
        min_num => 1,
        max_num => 5,
        level => 20,
        apply_lv => [{1,19},{20,29},{30,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(9) ->
    #{
        id => 9,
        name => <<"燕王古墓">>,
        cate => 5,
        min_num => 1,
        max_num => 5,
        level => 25,
        apply_lv => [{1,24},{25,44},{45,59},{60,74},{75,89},{90,99}]
    };
get(10) ->
    #{
        id => 10,
        name => <<"秦王地宫">>,
        cate => 5,
        min_num => 1,
        max_num => 5,
        level => 30,
        apply_lv => [{1,29},{30,44},{45,59},{60,74},{75,89},{90,99}]
    };
get(11) ->
    #{
        id => 11,
        name => <<"英雄老三环">>,
        cate => 6,
        min_num => 1,
        max_num => 5,
        level => 40,
        apply_lv => [{1,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(12) ->
    #{
        id => 12,
        name => <<"英雄燕子坞">>,
        cate => 6,
        min_num => 1,
        max_num => 5,
        level => 40,
        apply_lv => [{1,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(13) ->
    #{
        id => 13,
        name => <<"英雄四绝庄">>,
        cate => 6,
        min_num => 1,
        max_num => 5,
        level => 50,
        apply_lv => [{1,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(14) ->
    #{
        id => 14,
        name => <<"英雄缥缈峰">>,
        cate => 6,
        min_num => 1,
        max_num => 5,
        level => 64,
        apply_lv => [{1,63},{64,69},{70,79},{80,89},{90,99}]
    };
get(15) ->
    #{
        id => 15,
        name => <<"珍珑棋局">>,
        cate => 7,
        min_num => 1,
        max_num => 5,
        level => 20,
        apply_lv => [{1,19},{20,29},{30,39},{40,49},{50,59},{60,69},{70,79},{80,89},{90,99}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].

is_fill_robot(1) -> 0 > 0;
is_fill_robot(2) -> 0 > 0;
is_fill_robot(3) -> 1 > 0;
is_fill_robot(4) -> 1 > 0;
is_fill_robot(5) -> 1 > 0;
is_fill_robot(6) -> 1 > 0;
is_fill_robot(7) -> 0 > 0;
is_fill_robot(8) -> 0 > 0;
is_fill_robot(9) -> 0 > 0;
is_fill_robot(10) -> 0 > 0;
is_fill_robot(11) -> 1 > 0;
is_fill_robot(12) -> 1 > 0;
is_fill_robot(13) -> 1 > 0;
is_fill_robot(14) -> 1 > 0;
is_fill_robot(15) -> 1 > 0;
is_fill_robot(_ID) -> false.

get_by_cate(1) ->
    [1];
get_by_cate(2) ->
    [2];
get_by_cate(3) ->
    [3, 4, 5, 6];
get_by_cate(4) ->
    [7];
get_by_cate(5) ->
    [8, 9, 10];
get_by_cate(6) ->
    [11, 12, 13, 14];
get_by_cate(7) ->
    [15];
get_by_cate(_) ->
    [].
