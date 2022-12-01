%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_equip_forge_wheel
%% @Brief  : 装备打造转盘
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_equip_forge_wheel).

-export([
    get/1,
    get_ids/0
]).

get(RoleLv) when RoleLv >= 90 ->
    #{
        level => 90,
        score => 440,
        items => [{1,265041,1000},{2,265042,1000},{3,265043,1000},{4,265044,1000},{5,265045,1500},{6,265046,500},{7,265047,1500},{8,265048,2500}]
    };
get(RoleLv) when RoleLv >= 80 ->
    #{
        level => 80,
        score => 340,
        items => [{1,265031,1000},{2,265032,1000},{3,265033,1000},{4,265034,1000},{5,265035,1500},{6,265036,600},{7,265037,1400},{8,265038,2500}]
    };
get(RoleLv) when RoleLv >= 70 ->
    #{
        level => 70,
        score => 250,
        items => [{1,265021,1000},{2,265022,1000},{3,265023,1000},{4,265024,1000},{5,265025,1500},{6,265026,700},{7,265027,1300},{8,265028,2500}]
    };
get(RoleLv) when RoleLv >= 60 ->
    #{
        level => 60,
        score => 170,
        items => [{1,265011,1000},{2,265012,1000},{3,265013,1000},{4,265014,1000},{5,265015,1500},{6,265016,800},{7,265017,1200},{8,265018,2500}]
    };
get(RoleLv) when RoleLv >= 1 ->
    #{
        level => 1,
        score => 90,
        items => [{1,265001,1000},{2,265002,1000},{3,265003,1000},{4,265004,1000},{5,265005,1500},{6,265006,1000},{7,265007,1000},{8,265008,2500}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 60, 70, 80, 90].
