%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_equip_stone
%% @Brief  : 宝石配置
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_equip_stone).

-export([
    get/1,
    get_ids/0,
    get_by_type/1
]).

get(16041001) ->
    #{
        id => 16041001,
        type => 1,
        level => 1,
        next => 16041002,
        fight => 85,
        cost_num => 5,
        rune_num => 0,
        attr => [{1,512}]
    };
get(16041002) ->
    #{
        id => 16041002,
        type => 1,
        level => 2,
        next => 16041003,
        fight => 182,
        cost_num => 5,
        rune_num => 0,
        attr => [{1,1092}]
    };
get(16041003) ->
    #{
        id => 16041003,
        type => 1,
        level => 3,
        next => 16041004,
        fight => 335,
        cost_num => 5,
        rune_num => 0,
        attr => [{1,2013}]
    };
get(16041004) ->
    #{
        id => 16041004,
        type => 1,
        level => 4,
        next => 16041005,
        fight => 656,
        cost_num => 5,
        rune_num => 0,
        attr => [{1,4596}]
    };
get(16041005) ->
    #{
        id => 16041005,
        type => 1,
        level => 5,
        next => 16041006,
        fight => 1444,
        cost_num => 3,
        rune_num => 1,
        attr => [{1,8663}]
    };
get(16041006) ->
    #{
        id => 16041006,
        type => 1,
        level => 6,
        next => 16041007,
        fight => 2461,
        cost_num => 3,
        rune_num => 4,
        attr => [{1,14769}]
    };
get(16041007) ->
    #{
        id => 16041007,
        type => 1,
        level => 7,
        next => 0,
        fight => 3564,
        cost_num => 0,
        rune_num => 0,
        attr => [{1,21385}]
    };
get(16042001) ->
    #{
        id => 16042001,
        type => 2,
        level => 1,
        next => 16042002,
        fight => 80,
        cost_num => 5,
        rune_num => 0,
        attr => [{10,11}]
    };
get(16042002) ->
    #{
        id => 16042002,
        type => 2,
        level => 2,
        next => 16042003,
        fight => 176,
        cost_num => 5,
        rune_num => 0,
        attr => [{10,23}]
    };
get(16042003) ->
    #{
        id => 16042003,
        type => 2,
        level => 3,
        next => 16042004,
        fight => 334,
        cost_num => 5,
        rune_num => 0,
        attr => [{10,41}]
    };
get(16042004) ->
    #{
        id => 16042004,
        type => 2,
        level => 4,
        next => 16042005,
        fight => 709,
        cost_num => 5,
        rune_num => 0,
        attr => [{10,87}]
    };
get(16042005) ->
    #{
        id => 16042005,
        type => 2,
        level => 5,
        next => 16042006,
        fight => 1437,
        cost_num => 3,
        rune_num => 1,
        attr => [{10,177}]
    };
get(16042006) ->
    #{
        id => 16042006,
        type => 2,
        level => 6,
        next => 16042007,
        fight => 2454,
        cost_num => 3,
        rune_num => 4,
        attr => [{10,301}]
    };
get(16042007) ->
    #{
        id => 16042007,
        type => 2,
        level => 7,
        next => 0,
        fight => 3561,
        cost_num => 0,
        rune_num => 0,
        attr => [{10,435}]
    };
get(16043001) ->
    #{
        id => 16043001,
        type => 3,
        level => 1,
        next => 16043002,
        fight => 86,
        cost_num => 5,
        rune_num => 0,
        attr => [{11,8}]
    };
get(16043002) ->
    #{
        id => 16043002,
        type => 3,
        level => 2,
        next => 16043003,
        fight => 174,
        cost_num => 5,
        rune_num => 0,
        attr => [{11,18}]
    };
get(16043003) ->
    #{
        id => 16043003,
        type => 3,
        level => 3,
        next => 16043004,
        fight => 331,
        cost_num => 5,
        rune_num => 0,
        attr => [{11,32}]
    };
get(16043004) ->
    #{
        id => 16043004,
        type => 3,
        level => 4,
        next => 16043005,
        fight => 723,
        cost_num => 5,
        rune_num => 0,
        attr => [{11,66}]
    };
get(16043005) ->
    #{
        id => 16043005,
        type => 3,
        level => 5,
        next => 16043006,
        fight => 1447,
        cost_num => 3,
        rune_num => 1,
        attr => [{11,136}]
    };
get(16043006) ->
    #{
        id => 16043006,
        type => 3,
        level => 6,
        next => 16043007,
        fight => 2474,
        cost_num => 3,
        rune_num => 4,
        attr => [{11,231}]
    };
get(16043007) ->
    #{
        id => 16043007,
        type => 3,
        level => 7,
        next => 0,
        fight => 3577,
        cost_num => 0,
        rune_num => 0,
        attr => [{11,335}]
    };
get(16044001) ->
    #{
        id => 16044001,
        type => 4,
        level => 1,
        next => 16044002,
        fight => 86,
        cost_num => 5,
        rune_num => 0,
        attr => [{9,42}]
    };
get(16044002) ->
    #{
        id => 16044002,
        type => 4,
        level => 2,
        next => 16044003,
        fight => 186,
        cost_num => 5,
        rune_num => 0,
        attr => [{9,89}]
    };
get(16044003) ->
    #{
        id => 16044003,
        type => 4,
        level => 3,
        next => 16044004,
        fight => 342,
        cost_num => 5,
        rune_num => 0,
        attr => [{9,164}]
    };
get(16044004) ->
    #{
        id => 16044004,
        type => 4,
        level => 4,
        next => 16044005,
        fight => 728,
        cost_num => 5,
        rune_num => 0,
        attr => [{9,347}]
    };
get(16044005) ->
    #{
        id => 16044005,
        type => 4,
        level => 5,
        next => 16044006,
        fight => 1478,
        cost_num => 3,
        rune_num => 1,
        attr => [{9,705}]
    };
get(16044006) ->
    #{
        id => 16044006,
        type => 4,
        level => 6,
        next => 16044007,
        fight => 2520,
        cost_num => 3,
        rune_num => 4,
        attr => [{9,1201}]
    };
get(16044007) ->
    #{
        id => 16044007,
        type => 4,
        level => 7,
        next => 0,
        fight => 3650,
        cost_num => 0,
        rune_num => 0,
        attr => [{9,1739}]
    };
get(16045001) ->
    #{
        id => 16045001,
        type => 50,
        level => 1,
        next => 16045002,
        fight => 80,
        cost_num => 5,
        rune_num => 0,
        attr => [{21,9}]
    };
get(16045002) ->
    #{
        id => 16045002,
        type => 50,
        level => 2,
        next => 16045003,
        fight => 174,
        cost_num => 5,
        rune_num => 0,
        attr => [{21,19}]
    };
get(16045003) ->
    #{
        id => 16045003,
        type => 50,
        level => 3,
        next => 16045004,
        fight => 330,
        cost_num => 5,
        rune_num => 0,
        attr => [{21,34}]
    };
get(16045004) ->
    #{
        id => 16045004,
        type => 50,
        level => 4,
        next => 16045005,
        fight => 702,
        cost_num => 5,
        rune_num => 0,
        attr => [{21,72}]
    };
get(16045005) ->
    #{
        id => 16045005,
        type => 50,
        level => 5,
        next => 16045006,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{21,145}]
    };
get(16045006) ->
    #{
        id => 16045006,
        type => 50,
        level => 6,
        next => 16045007,
        fight => 2452,
        cost_num => 3,
        rune_num => 4,
        attr => [{21,247}]
    };
get(16045007) ->
    #{
        id => 16045007,
        type => 50,
        level => 7,
        next => 0,
        fight => 3558,
        cost_num => 0,
        rune_num => 0,
        attr => [{21,357}]
    };
get(16045101) ->
    #{
        id => 16045101,
        type => 51,
        level => 1,
        next => 16045102,
        fight => 80,
        cost_num => 5,
        rune_num => 0,
        attr => [{22,9}]
    };
get(16045102) ->
    #{
        id => 16045102,
        type => 51,
        level => 2,
        next => 16045103,
        fight => 174,
        cost_num => 5,
        rune_num => 0,
        attr => [{22,19}]
    };
get(16045103) ->
    #{
        id => 16045103,
        type => 51,
        level => 3,
        next => 16045104,
        fight => 330,
        cost_num => 5,
        rune_num => 0,
        attr => [{22,34}]
    };
get(16045104) ->
    #{
        id => 16045104,
        type => 51,
        level => 4,
        next => 16045105,
        fight => 702,
        cost_num => 5,
        rune_num => 0,
        attr => [{22,72}]
    };
get(16045105) ->
    #{
        id => 16045105,
        type => 51,
        level => 5,
        next => 16045106,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{22,145}]
    };
get(16045106) ->
    #{
        id => 16045106,
        type => 51,
        level => 6,
        next => 16045107,
        fight => 2452,
        cost_num => 3,
        rune_num => 4,
        attr => [{22,247}]
    };
get(16045107) ->
    #{
        id => 16045107,
        type => 51,
        level => 7,
        next => 0,
        fight => 3558,
        cost_num => 0,
        rune_num => 0,
        attr => [{22,357}]
    };
get(16045201) ->
    #{
        id => 16045201,
        type => 52,
        level => 1,
        next => 16045202,
        fight => 80,
        cost_num => 5,
        rune_num => 0,
        attr => [{23,9}]
    };
get(16045202) ->
    #{
        id => 16045202,
        type => 52,
        level => 2,
        next => 16045203,
        fight => 174,
        cost_num => 5,
        rune_num => 0,
        attr => [{23,19}]
    };
get(16045203) ->
    #{
        id => 16045203,
        type => 52,
        level => 3,
        next => 16045204,
        fight => 330,
        cost_num => 5,
        rune_num => 0,
        attr => [{23,34}]
    };
get(16045204) ->
    #{
        id => 16045204,
        type => 52,
        level => 4,
        next => 16045205,
        fight => 702,
        cost_num => 5,
        rune_num => 0,
        attr => [{23,72}]
    };
get(16045205) ->
    #{
        id => 16045205,
        type => 52,
        level => 5,
        next => 16045206,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{23,145}]
    };
get(16045206) ->
    #{
        id => 16045206,
        type => 52,
        level => 6,
        next => 16045207,
        fight => 2452,
        cost_num => 3,
        rune_num => 4,
        attr => [{23,247}]
    };
get(16045207) ->
    #{
        id => 16045207,
        type => 52,
        level => 7,
        next => 0,
        fight => 3558,
        cost_num => 0,
        rune_num => 0,
        attr => [{23,357}]
    };
get(16045301) ->
    #{
        id => 16045301,
        type => 53,
        level => 1,
        next => 16045302,
        fight => 80,
        cost_num => 5,
        rune_num => 0,
        attr => [{24,9}]
    };
get(16045302) ->
    #{
        id => 16045302,
        type => 53,
        level => 2,
        next => 16045303,
        fight => 174,
        cost_num => 5,
        rune_num => 0,
        attr => [{24,19}]
    };
get(16045303) ->
    #{
        id => 16045303,
        type => 53,
        level => 3,
        next => 16045304,
        fight => 330,
        cost_num => 5,
        rune_num => 0,
        attr => [{24,34}]
    };
get(16045304) ->
    #{
        id => 16045304,
        type => 53,
        level => 4,
        next => 16045305,
        fight => 702,
        cost_num => 5,
        rune_num => 0,
        attr => [{24,72}]
    };
get(16045305) ->
    #{
        id => 16045305,
        type => 53,
        level => 5,
        next => 16045306,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{24,145}]
    };
get(16045306) ->
    #{
        id => 16045306,
        type => 53,
        level => 6,
        next => 16045307,
        fight => 2452,
        cost_num => 3,
        rune_num => 4,
        attr => [{24,247}]
    };
get(16045307) ->
    #{
        id => 16045307,
        type => 53,
        level => 7,
        next => 0,
        fight => 3558,
        cost_num => 0,
        rune_num => 0,
        attr => [{24,357}]
    };
get(16046001) ->
    #{
        id => 16046001,
        type => 60,
        level => 1,
        next => 16046002,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{25,4}]
    };
get(16046002) ->
    #{
        id => 16046002,
        type => 60,
        level => 2,
        next => 16046003,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{25,8}]
    };
get(16046003) ->
    #{
        id => 16046003,
        type => 60,
        level => 3,
        next => 16046004,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{25,14}]
    };
get(16046004) ->
    #{
        id => 16046004,
        type => 60,
        level => 4,
        next => 16046005,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{25,29}]
    };
get(16046005) ->
    #{
        id => 16046005,
        type => 60,
        level => 5,
        next => 16046006,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{25,58}]
    };
get(16046006) ->
    #{
        id => 16046006,
        type => 60,
        level => 6,
        next => 16046007,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{25,99}]
    };
get(16046007) ->
    #{
        id => 16046007,
        type => 60,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{25,143}]
    };
get(16046101) ->
    #{
        id => 16046101,
        type => 61,
        level => 1,
        next => 16046102,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{26,4}]
    };
get(16046102) ->
    #{
        id => 16046102,
        type => 61,
        level => 2,
        next => 16046103,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{26,8}]
    };
get(16046103) ->
    #{
        id => 16046103,
        type => 61,
        level => 3,
        next => 16046104,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{26,14}]
    };
get(16046104) ->
    #{
        id => 16046104,
        type => 61,
        level => 4,
        next => 16046105,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{26,29}]
    };
get(16046105) ->
    #{
        id => 16046105,
        type => 61,
        level => 5,
        next => 16046106,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{26,58}]
    };
get(16046106) ->
    #{
        id => 16046106,
        type => 61,
        level => 6,
        next => 16046107,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{26,99}]
    };
get(16046107) ->
    #{
        id => 16046107,
        type => 61,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{26,143}]
    };
get(16046201) ->
    #{
        id => 16046201,
        type => 62,
        level => 1,
        next => 16046202,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{27,4}]
    };
get(16046202) ->
    #{
        id => 16046202,
        type => 62,
        level => 2,
        next => 16046203,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{27,8}]
    };
get(16046203) ->
    #{
        id => 16046203,
        type => 62,
        level => 3,
        next => 16046204,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{27,14}]
    };
get(16046204) ->
    #{
        id => 16046204,
        type => 62,
        level => 4,
        next => 16046205,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{27,29}]
    };
get(16046205) ->
    #{
        id => 16046205,
        type => 62,
        level => 5,
        next => 16046206,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{27,58}]
    };
get(16046206) ->
    #{
        id => 16046206,
        type => 62,
        level => 6,
        next => 16046207,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{27,99}]
    };
get(16046207) ->
    #{
        id => 16046207,
        type => 62,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{27,143}]
    };
get(16046301) ->
    #{
        id => 16046301,
        type => 63,
        level => 1,
        next => 16046302,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{28,4}]
    };
get(16046302) ->
    #{
        id => 16046302,
        type => 63,
        level => 2,
        next => 16046303,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{28,8}]
    };
get(16046303) ->
    #{
        id => 16046303,
        type => 63,
        level => 3,
        next => 16046304,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{28,14}]
    };
get(16046304) ->
    #{
        id => 16046304,
        type => 63,
        level => 4,
        next => 16046305,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{28,29}]
    };
get(16046305) ->
    #{
        id => 16046305,
        type => 63,
        level => 5,
        next => 16046306,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{28,58}]
    };
get(16046306) ->
    #{
        id => 16046306,
        type => 63,
        level => 6,
        next => 16046307,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{28,99}]
    };
get(16046307) ->
    #{
        id => 16046307,
        type => 63,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{28,143}]
    };
get(16047001) ->
    #{
        id => 16047001,
        type => 70,
        level => 1,
        next => 16047002,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{29,4}]
    };
get(16047002) ->
    #{
        id => 16047002,
        type => 70,
        level => 2,
        next => 16047003,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{29,8}]
    };
get(16047003) ->
    #{
        id => 16047003,
        type => 70,
        level => 3,
        next => 16047004,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{29,14}]
    };
get(16047004) ->
    #{
        id => 16047004,
        type => 70,
        level => 4,
        next => 16047005,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{29,29}]
    };
get(16047005) ->
    #{
        id => 16047005,
        type => 70,
        level => 5,
        next => 16047006,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{29,58}]
    };
get(16047006) ->
    #{
        id => 16047006,
        type => 70,
        level => 6,
        next => 16047007,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{29,99}]
    };
get(16047007) ->
    #{
        id => 16047007,
        type => 70,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{29,143}]
    };
get(16047101) ->
    #{
        id => 16047101,
        type => 71,
        level => 1,
        next => 16047102,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{30,4}]
    };
get(16047102) ->
    #{
        id => 16047102,
        type => 71,
        level => 2,
        next => 16047103,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{30,8}]
    };
get(16047103) ->
    #{
        id => 16047103,
        type => 71,
        level => 3,
        next => 16047104,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{30,14}]
    };
get(16047104) ->
    #{
        id => 16047104,
        type => 71,
        level => 4,
        next => 16047105,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{30,29}]
    };
get(16047105) ->
    #{
        id => 16047105,
        type => 71,
        level => 5,
        next => 16047106,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{30,58}]
    };
get(16047106) ->
    #{
        id => 16047106,
        type => 71,
        level => 6,
        next => 16047107,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{30,99}]
    };
get(16047107) ->
    #{
        id => 16047107,
        type => 71,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{30,143}]
    };
get(16047201) ->
    #{
        id => 16047201,
        type => 72,
        level => 1,
        next => 16047202,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{31,4}]
    };
get(16047202) ->
    #{
        id => 16047202,
        type => 72,
        level => 2,
        next => 16047203,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{31,8}]
    };
get(16047203) ->
    #{
        id => 16047203,
        type => 72,
        level => 3,
        next => 16047204,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{31,14}]
    };
get(16047204) ->
    #{
        id => 16047204,
        type => 72,
        level => 4,
        next => 16047205,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{31,29}]
    };
get(16047205) ->
    #{
        id => 16047205,
        type => 72,
        level => 5,
        next => 16047206,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{31,58}]
    };
get(16047206) ->
    #{
        id => 16047206,
        type => 72,
        level => 6,
        next => 16047207,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{31,99}]
    };
get(16047207) ->
    #{
        id => 16047207,
        type => 72,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{31,143}]
    };
get(16047301) ->
    #{
        id => 16047301,
        type => 73,
        level => 1,
        next => 16047302,
        fight => 70,
        cost_num => 5,
        rune_num => 0,
        attr => [{32,4}]
    };
get(16047302) ->
    #{
        id => 16047302,
        type => 73,
        level => 2,
        next => 16047303,
        fight => 164,
        cost_num => 5,
        rune_num => 0,
        attr => [{32,8}]
    };
get(16047303) ->
    #{
        id => 16047303,
        type => 73,
        level => 3,
        next => 16047304,
        fight => 320,
        cost_num => 5,
        rune_num => 0,
        attr => [{32,14}]
    };
get(16047304) ->
    #{
        id => 16047304,
        type => 73,
        level => 4,
        next => 16047305,
        fight => 697,
        cost_num => 5,
        rune_num => 0,
        attr => [{32,29}]
    };
get(16047305) ->
    #{
        id => 16047305,
        type => 73,
        level => 5,
        next => 16047306,
        fight => 1438,
        cost_num => 3,
        rune_num => 1,
        attr => [{32,58}]
    };
get(16047306) ->
    #{
        id => 16047306,
        type => 73,
        level => 6,
        next => 16047307,
        fight => 2447,
        cost_num => 3,
        rune_num => 4,
        attr => [{32,99}]
    };
get(16047307) ->
    #{
        id => 16047307,
        type => 73,
        level => 7,
        next => 0,
        fight => 3553,
        cost_num => 0,
        rune_num => 0,
        attr => [{32,143}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [16041001, 16041002, 16041003, 16041004, 16041005, 16041006, 16041007, 16042001, 16042002, 16042003, 16042004, 16042005, 16042006, 16042007, 16043001, 16043002, 16043003, 16043004, 16043005, 16043006, 16043007, 16044001, 16044002, 16044003, 16044004, 16044005, 16044006, 16044007, 16045001, 16045002, 16045003, 16045004, 16045005, 16045006, 16045007, 16045101, 16045102, 16045103, 16045104, 16045105, 16045106, 16045107, 16045201, 16045202, 16045203, 16045204, 16045205, 16045206, 16045207, 16045301, 16045302, 16045303, 16045304, 16045305, 16045306, 16045307, 16046001, 16046002, 16046003, 16046004, 16046005, 16046006, 16046007, 16046101, 16046102, 16046103, 16046104, 16046105, 16046106, 16046107, 16046201, 16046202, 16046203, 16046204, 16046205, 16046206, 16046207, 16046301, 16046302, 16046303, 16046304, 16046305, 16046306, 16046307, 16047001, 16047002, 16047003, 16047004, 16047005, 16047006, 16047007, 16047101, 16047102, 16047103, 16047104, 16047105, 16047106, 16047107, 16047201, 16047202, 16047203, 16047204, 16047205, 16047206, 16047207, 16047301, 16047302, 16047303, 16047304, 16047305, 16047306, 16047307].

get_by_type(1) ->
    [16041001, 16041002, 16041003, 16041004, 16041005, 16041006, 16041007];
get_by_type(2) ->
    [16042001, 16042002, 16042003, 16042004, 16042005, 16042006, 16042007];
get_by_type(3) ->
    [16043001, 16043002, 16043003, 16043004, 16043005, 16043006, 16043007];
get_by_type(4) ->
    [16044001, 16044002, 16044003, 16044004, 16044005, 16044006, 16044007];
get_by_type(50) ->
    [16045001, 16045002, 16045003, 16045004, 16045005, 16045006, 16045007];
get_by_type(51) ->
    [16045101, 16045102, 16045103, 16045104, 16045105, 16045106, 16045107];
get_by_type(52) ->
    [16045201, 16045202, 16045203, 16045204, 16045205, 16045206, 16045207];
get_by_type(53) ->
    [16045301, 16045302, 16045303, 16045304, 16045305, 16045306, 16045307];
get_by_type(60) ->
    [16046001, 16046002, 16046003, 16046004, 16046005, 16046006, 16046007];
get_by_type(61) ->
    [16046101, 16046102, 16046103, 16046104, 16046105, 16046106, 16046107];
get_by_type(62) ->
    [16046201, 16046202, 16046203, 16046204, 16046205, 16046206, 16046207];
get_by_type(63) ->
    [16046301, 16046302, 16046303, 16046304, 16046305, 16046306, 16046307];
get_by_type(70) ->
    [16047001, 16047002, 16047003, 16047004, 16047005, 16047006, 16047007];
get_by_type(71) ->
    [16047101, 16047102, 16047103, 16047104, 16047105, 16047106, 16047107];
get_by_type(72) ->
    [16047201, 16047202, 16047203, 16047204, 16047205, 16047206, 16047207];
get_by_type(73) ->
    [16047301, 16047302, 16047303, 16047304, 16047305, 16047306, 16047307];
get_by_type(_) ->
    [].
