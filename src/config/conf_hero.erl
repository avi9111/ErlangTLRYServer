%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_hero
%% @Brief  : 英雄谱
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_hero).

-export([
    get/1,
    get_ids/0,
    cult_exp/1,
    skill_hero/1,
    guide_fight/2
]).

get(1) ->
    #{
        id => 1,
        name => <<"段誉">>,
        color => 5,
        legend => 1,
        card => 16211001,
        fragment => 16210001,
        cult_exp => 5,
        skills => [10010016, 10020016, 10030016, 10040016]
    };
get(2) ->
    #{
        id => 2,
        name => <<"虚竹">>,
        color => 5,
        legend => 0,
        card => 16211002,
        fragment => 16210002,
        cult_exp => 5,
        skills => [10010017, 10020017, 10030017, 10040017]
    };
get(3) ->
    #{
        id => 3,
        name => <<"乔峰">>,
        color => 5,
        legend => 0,
        card => 16211003,
        fragment => 16210003,
        cult_exp => 5,
        skills => [10010018, 10020018, 10030018, 10040018]
    };
get(4) ->
    #{
        id => 4,
        name => <<"无崖子">>,
        color => 5,
        legend => 0,
        card => 16211004,
        fragment => 16210004,
        cult_exp => 5,
        skills => [10010014, 10020014, 10030014, 10040014]
    };
get(5) ->
    #{
        id => 5,
        name => <<"李秋水">>,
        color => 5,
        legend => 0,
        card => 16211005,
        fragment => 16210005,
        cult_exp => 5,
        skills => [10010013, 10020013, 10030013, 10040013]
    };
get(6) ->
    #{
        id => 6,
        name => <<"天山童姥">>,
        color => 5,
        legend => 0,
        card => 16211006,
        fragment => 16210006,
        cult_exp => 5,
        skills => [10010012, 10020012, 10030012, 10040012]
    };
get(7) ->
    #{
        id => 7,
        name => <<"王语嫣">>,
        color => 5,
        legend => 0,
        card => 16211007,
        fragment => 16210007,
        cult_exp => 5,
        skills => [10010015, 10020015, 10030015, 10040015]
    };
get(8) ->
    #{
        id => 8,
        name => <<"慕容复">>,
        color => 5,
        legend => 0,
        card => 16211008,
        fragment => 16210008,
        cult_exp => 5,
        skills => [10010011, 10020011, 10030011, 10040011]
    };
get(9) ->
    #{
        id => 9,
        name => <<"阿朱">>,
        color => 4,
        legend => 0,
        card => 16211009,
        fragment => 16210009,
        cult_exp => 3,
        skills => [10010012, 10020012, 10030012, 10040012]
    };
get(10) ->
    #{
        id => 10,
        name => <<"段正淳">>,
        color => 4,
        legend => 0,
        card => 16211010,
        fragment => 16210010,
        cult_exp => 3,
        skills => [10010016, 10020016, 10030016, 10040016]
    };
get(11) ->
    #{
        id => 11,
        name => <<"段延庆">>,
        color => 4,
        legend => 0,
        card => 16211011,
        fragment => 16210011,
        cult_exp => 3,
        skills => [10010015, 10020015, 10030015, 10040015]
    };
get(12) ->
    #{
        id => 12,
        name => <<"慕容博">>,
        color => 4,
        legend => 0,
        card => 16211012,
        fragment => 16210012,
        cult_exp => 3,
        skills => [10010018, 10020018, 10030018, 10040018]
    };
get(13) ->
    #{
        id => 13,
        name => <<"丁春秋">>,
        color => 4,
        legend => 0,
        card => 16211013,
        fragment => 16210013,
        cult_exp => 3,
        skills => [10010014, 10020014, 10030014, 10040014]
    };
get(14) ->
    #{
        id => 14,
        name => <<"萧远山">>,
        color => 4,
        legend => 0,
        card => 16211014,
        fragment => 16210014,
        cult_exp => 3,
        skills => [10010017, 10020017, 10030017, 10040017]
    };
get(15) ->
    #{
        id => 15,
        name => <<"鸠摩智">>,
        color => 4,
        legend => 0,
        card => 16211015,
        fragment => 16210015,
        cult_exp => 3,
        skills => [10010013, 10020013, 10030013, 10040013]
    };
get(16) ->
    #{
        id => 16,
        name => <<"阿紫">>,
        color => 4,
        legend => 0,
        card => 16211016,
        fragment => 16210016,
        cult_exp => 3,
        skills => [10010011, 10020011, 10030011, 10040011]
    };
get(17) ->
    #{
        id => 17,
        name => <<"钟灵">>,
        color => 3,
        legend => 0,
        card => 16211017,
        fragment => 16210017,
        cult_exp => 3,
        skills => [10010012, 10020012, 10030012, 10040012]
    };
get(18) ->
    #{
        id => 18,
        name => <<"玄慈">>,
        color => 3,
        legend => 0,
        card => 16211018,
        fragment => 16210018,
        cult_exp => 3,
        skills => [10010017, 10020017, 10030017, 10040017]
    };
get(19) ->
    #{
        id => 19,
        name => <<"苏星河">>,
        color => 3,
        legend => 0,
        card => 16211019,
        fragment => 16210019,
        cult_exp => 3,
        skills => [10010011, 10020011, 10030011, 10040011]
    };
get(20) ->
    #{
        id => 20,
        name => <<"木婉清">>,
        color => 3,
        legend => 0,
        card => 16211020,
        fragment => 16210020,
        cult_exp => 3,
        skills => [10010013, 10020013, 10030013, 10040013]
    };
get(21) ->
    #{
        id => 21,
        name => <<"南海鳄神">>,
        color => 3,
        legend => 0,
        card => 16211021,
        fragment => 16210021,
        cult_exp => 3,
        skills => [10010016, 10020016, 10030016, 10040016]
    };
get(22) ->
    #{
        id => 22,
        name => <<"云中鹤">>,
        color => 3,
        legend => 0,
        card => 16211022,
        fragment => 16210022,
        cult_exp => 3,
        skills => [10010015, 10020015, 10030015, 10040015]
    };
get(23) ->
    #{
        id => 23,
        name => <<"叶二娘">>,
        color => 3,
        legend => 0,
        card => 16211023,
        fragment => 16210023,
        cult_exp => 3,
        skills => [10010014, 10020014, 10030014, 10040014]
    };
get(24) ->
    #{
        id => 24,
        name => <<"阮星竹">>,
        color => 3,
        legend => 0,
        card => 16211024,
        fragment => 16210024,
        cult_exp => 3,
        skills => [10010018, 10020018, 10030018, 10040018]
    };
get(25) ->
    #{
        id => 25,
        name => <<"游坦之">>,
        color => 2,
        legend => 0,
        card => 16211025,
        fragment => 16210025,
        cult_exp => 3,
        skills => [10010018, 10020018, 10030018, 10040018]
    };
get(26) ->
    #{
        id => 26,
        name => <<"阿碧">>,
        color => 2,
        legend => 0,
        card => 16211026,
        fragment => 16210026,
        cult_exp => 3,
        skills => [10010017, 10020017, 10030017, 10040017]
    };
get(27) ->
    #{
        id => 27,
        name => <<"傅思归">>,
        color => 2,
        legend => 0,
        card => 16211027,
        fragment => 16210027,
        cult_exp => 3,
        skills => [10010015, 10020015, 10030015, 10040015]
    };
get(28) ->
    #{
        id => 28,
        name => <<"褚万里">>,
        color => 2,
        legend => 0,
        card => 16211028,
        fragment => 16210028,
        cult_exp => 3,
        skills => [10010014, 10020014, 10030014, 10040014]
    };
get(29) ->
    #{
        id => 29,
        name => <<"朱丹臣">>,
        color => 2,
        legend => 0,
        card => 16211029,
        fragment => 16210029,
        cult_exp => 3,
        skills => [10010016, 10020016, 10030016, 10040016]
    };
get(30) ->
    #{
        id => 30,
        name => <<"古笃诚">>,
        color => 2,
        legend => 0,
        card => 16211030,
        fragment => 16210030,
        cult_exp => 3,
        skills => [10010013, 10020013, 10030013, 10040013]
    };
get(31) ->
    #{
        id => 31,
        name => <<"王夫人">>,
        color => 2,
        legend => 0,
        card => 16211031,
        fragment => 16210031,
        cult_exp => 3,
        skills => [10010012, 10020012, 10030012, 10040012]
    };
get(32) ->
    #{
        id => 32,
        name => <<"风波恶">>,
        color => 2,
        legend => 0,
        card => 16211032,
        fragment => 16210032,
        cult_exp => 3,
        skills => [10010011, 10020011, 10030011, 10040011]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32].

cult_exp(16210001) ->
    5;
cult_exp(16210002) ->
    5;
cult_exp(16210003) ->
    5;
cult_exp(16210004) ->
    5;
cult_exp(16210005) ->
    5;
cult_exp(16210006) ->
    5;
cult_exp(16210007) ->
    5;
cult_exp(16210008) ->
    5;
cult_exp(16210009) ->
    3;
cult_exp(16210010) ->
    3;
cult_exp(16210011) ->
    3;
cult_exp(16210012) ->
    3;
cult_exp(16210013) ->
    3;
cult_exp(16210014) ->
    3;
cult_exp(16210015) ->
    3;
cult_exp(16210016) ->
    3;
cult_exp(16210017) ->
    3;
cult_exp(16210018) ->
    3;
cult_exp(16210019) ->
    3;
cult_exp(16210020) ->
    3;
cult_exp(16210021) ->
    3;
cult_exp(16210022) ->
    3;
cult_exp(16210023) ->
    3;
cult_exp(16210024) ->
    3;
cult_exp(16210025) ->
    3;
cult_exp(16210026) ->
    3;
cult_exp(16210027) ->
    3;
cult_exp(16210028) ->
    3;
cult_exp(16210029) ->
    3;
cult_exp(16210030) ->
    3;
cult_exp(16210031) ->
    3;
cult_exp(16210032) ->
    3;
cult_exp(_ID) ->
    0.

skill_hero(10010016) ->
    [29, 21, 10, 1];
skill_hero(10020016) ->
    [29, 21, 10, 1];
skill_hero(10030016) ->
    [29, 21, 10, 1];
skill_hero(10040016) ->
    [29, 21, 10, 1];
skill_hero(10010017) ->
    [26, 18, 14, 2];
skill_hero(10020017) ->
    [26, 18, 14, 2];
skill_hero(10030017) ->
    [26, 18, 14, 2];
skill_hero(10040017) ->
    [26, 18, 14, 2];
skill_hero(10010018) ->
    [25, 24, 12, 3];
skill_hero(10020018) ->
    [25, 24, 12, 3];
skill_hero(10030018) ->
    [25, 24, 12, 3];
skill_hero(10040018) ->
    [25, 24, 12, 3];
skill_hero(10010014) ->
    [28, 23, 13, 4];
skill_hero(10020014) ->
    [28, 23, 13, 4];
skill_hero(10030014) ->
    [28, 23, 13, 4];
skill_hero(10040014) ->
    [28, 23, 13, 4];
skill_hero(10010013) ->
    [30, 20, 15, 5];
skill_hero(10020013) ->
    [30, 20, 15, 5];
skill_hero(10030013) ->
    [30, 20, 15, 5];
skill_hero(10040013) ->
    [30, 20, 15, 5];
skill_hero(10010012) ->
    [31, 17, 9, 6];
skill_hero(10020012) ->
    [31, 17, 9, 6];
skill_hero(10030012) ->
    [31, 17, 9, 6];
skill_hero(10040012) ->
    [31, 17, 9, 6];
skill_hero(10010015) ->
    [27, 22, 11, 7];
skill_hero(10020015) ->
    [27, 22, 11, 7];
skill_hero(10030015) ->
    [27, 22, 11, 7];
skill_hero(10040015) ->
    [27, 22, 11, 7];
skill_hero(10010011) ->
    [32, 19, 16, 8];
skill_hero(10020011) ->
    [32, 19, 16, 8];
skill_hero(10030011) ->
    [32, 19, 16, 8];
skill_hero(10040011) ->
    [32, 19, 16, 8];
skill_hero(_ID) ->
    [].

guide_fight(0, 0) ->
    0;
guide_fight(1, 0) ->
    2000;
guide_fight(1, 1) ->
    4000;
guide_fight(2, 0) ->
    2000;
guide_fight(2, 1) ->
    4000;
guide_fight(3, 0) ->
    2000;
guide_fight(3, 1) ->
    4000;
guide_fight(4, 0) ->
    2000;
guide_fight(4, 1) ->
    4000;
guide_fight(5, 0) ->
    2000;
guide_fight(5, 1) ->
    4000;
guide_fight(6, 0) ->
    2000;
guide_fight(6, 1) ->
    4000;
guide_fight(7, 0) ->
    2000;
guide_fight(7, 1) ->
    4000;
guide_fight(8, 0) ->
    2000;
guide_fight(8, 1) ->
    4000;
guide_fight(9, 0) ->
    2000;
guide_fight(9, 1) ->
    4000;
guide_fight(10, 0) ->
    2000;
guide_fight(10, 1) ->
    4000;
guide_fight(11, 0) ->
    2000;
guide_fight(11, 1) ->
    4000;
guide_fight(12, 0) ->
    2000;
guide_fight(12, 1) ->
    4000;
guide_fight(13, 0) ->
    2000;
guide_fight(13, 1) ->
    4000;
guide_fight(14, 0) ->
    2000;
guide_fight(14, 1) ->
    4000;
guide_fight(15, 0) ->
    2000;
guide_fight(15, 1) ->
    4000;
guide_fight(16, 0) ->
    2000;
guide_fight(16, 1) ->
    4000;
guide_fight(17, 0) ->
    2000;
guide_fight(17, 1) ->
    4000;
guide_fight(18, 0) ->
    2000;
guide_fight(18, 1) ->
    4000;
guide_fight(19, 0) ->
    2000;
guide_fight(19, 1) ->
    4000;
guide_fight(20, 0) ->
    2000;
guide_fight(20, 1) ->
    4000;
guide_fight(21, 0) ->
    2000;
guide_fight(21, 1) ->
    4000;
guide_fight(22, 0) ->
    2000;
guide_fight(22, 1) ->
    4000;
guide_fight(23, 0) ->
    2000;
guide_fight(23, 1) ->
    4000;
guide_fight(24, 0) ->
    2000;
guide_fight(24, 1) ->
    4000;
guide_fight(25, 0) ->
    2000;
guide_fight(25, 1) ->
    4000;
guide_fight(26, 0) ->
    2000;
guide_fight(26, 1) ->
    4000;
guide_fight(27, 0) ->
    2000;
guide_fight(27, 1) ->
    4000;
guide_fight(28, 0) ->
    2000;
guide_fight(28, 1) ->
    4000;
guide_fight(29, 0) ->
    2000;
guide_fight(29, 1) ->
    4000;
guide_fight(30, 0) ->
    2000;
guide_fight(30, 1) ->
    4000;
guide_fight(31, 0) ->
    2000;
guide_fight(31, 1) ->
    4000;
guide_fight(32, 0) ->
    2000;
guide_fight(32, 1) ->
    4000;
guide_fight(_ID, _Legend) ->
    0.
