%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet).

-export([
	get/1,
	get_name/1,
	get_growup_id/1,
	get_carry_lv/1,
	get_attr_potential/1
]).


%% Apis ------------------------------------------------
%% @doc 获取珍兽配置
%% @spec get(PetCId) -> #{}.
get(1001) ->
    #{id => 1001, atk_type => 2, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1002) ->
    #{id => 1002, atk_type => 2, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1003) ->
    #{id => 1003, atk_type => 1, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1004) ->
    #{id => 1004, atk_type => 3, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1005) ->
    #{id => 1005, atk_type => 2, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1006) ->
    #{id => 1006, atk_type => 3, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1007) ->
    #{id => 1007, atk_type => 1, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1008) ->
    #{id => 1008, atk_type => 2, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1009) ->
    #{id => 1009, atk_type => 3, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1010) ->
    #{id => 1010, atk_type => 1, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1011) ->
    #{id => 1011, atk_type => 2, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1012) ->
    #{id => 1012, atk_type => 3, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1013) ->
    #{id => 1013, atk_type => 1, quality => 1, max_savvy_lv => 10, normal_skill => 15030001};
get(1014) ->
    #{id => 1014, atk_type => 2, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1015) ->
    #{id => 1015, atk_type => 2, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1016) ->
    #{id => 1016, atk_type => 1, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1017) ->
    #{id => 1017, atk_type => 3, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1018) ->
    #{id => 1018, atk_type => 2, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1019) ->
    #{id => 1019, atk_type => 1, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1020) ->
    #{id => 1020, atk_type => 3, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1021) ->
    #{id => 1021, atk_type => 2, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1022) ->
    #{id => 1022, atk_type => 1, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1023) ->
    #{id => 1023, atk_type => 3, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1024) ->
    #{id => 1024, atk_type => 2, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1025) ->
    #{id => 1025, atk_type => 1, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(1026) ->
    #{id => 1026, atk_type => 3, quality => 3, max_savvy_lv => 10, normal_skill => 15030001};
get(2001) ->
    #{id => 2001, atk_type => 2, quality => 2, max_savvy_lv => 10, normal_skill => 15030001};
get(2002) ->
    #{id => 2002, atk_type => 1, quality => 2, max_savvy_lv => 10, normal_skill => 15030001};
get(2003) ->
    #{id => 2003, atk_type => 3, quality => 2, max_savvy_lv => 10, normal_skill => 15030001};
get(_PetCId) ->
    undefined.


%% @doc 获取珍兽名字
get_name(1001) -> <<"蓝胖胖">>;
get_name(1002) -> <<"粉嘟嘟">>;
get_name(1003) -> <<"小狗">>;
get_name(1004) -> <<"乌龟">>;
get_name(1005) -> <<"松鼠">>;
get_name(1006) -> <<"刺猬">>;
get_name(1007) -> <<"螳螂">>;
get_name(1008) -> <<"鳄鱼">>;
get_name(1009) -> <<"鹰">>;
get_name(1010) -> <<"豹子">>;
get_name(1011) -> <<"熊">>;
get_name(1012) -> <<"猩猩">>;
get_name(1013) -> <<"駮马">>;
get_name(1014) -> <<"闪电貂">>;
get_name(1015) -> <<"小狐仙">>;
get_name(1016) -> <<"老虎">>;
get_name(1017) -> <<"熊猫">>;
get_name(1018) -> <<"丘比特">>;
get_name(1019) -> <<"呆呆牛">>;
get_name(1020) -> <<"龙龟">>;
get_name(1021) -> <<"鸳鸯宝宝">>;
get_name(1022) -> <<"百变汪仔">>;
get_name(1023) -> <<"小熊豆丁">>;
get_name(1024) -> <<"岩魂">>;
get_name(1025) -> <<"穷奇">>;
get_name(1026) -> <<"神猿">>;
get_name(2001) -> <<"太古龙魂">>;
get_name(2002) -> <<"九黎妖虎">>;
get_name(2003) -> <<"天命玄凤">>;
get_name(_PetCId) -> <<"">>.


%% @doc 获取珍兽成长配置id
get_growup_id(1001) -> 1;
get_growup_id(1002) -> 1;
get_growup_id(1003) -> 1;
get_growup_id(1004) -> 1;
get_growup_id(1005) -> 2;
get_growup_id(1006) -> 2;
get_growup_id(1007) -> 2;
get_growup_id(1008) -> 3;
get_growup_id(1009) -> 3;
get_growup_id(1010) -> 3;
get_growup_id(1011) -> 4;
get_growup_id(1012) -> 4;
get_growup_id(1013) -> 4;
get_growup_id(1014) -> 1;
get_growup_id(1015) -> 2;
get_growup_id(1016) -> 3;
get_growup_id(1017) -> 3;
get_growup_id(1018) -> 3;
get_growup_id(1019) -> 3;
get_growup_id(1020) -> 3;
get_growup_id(1021) -> 4;
get_growup_id(1022) -> 4;
get_growup_id(1023) -> 4;
get_growup_id(1024) -> 5;
get_growup_id(1025) -> 5;
get_growup_id(1026) -> 5;
get_growup_id(2001) -> 3;
get_growup_id(2002) -> 4;
get_growup_id(2003) -> 5;
get_growup_id(_PetCId) -> undefined.


%% @doc 获取珍兽携带等级
get_carry_lv(1001) -> 5;
get_carry_lv(1002) -> 5;
get_carry_lv(1003) -> 5;
get_carry_lv(1004) -> 5;
get_carry_lv(1005) -> 25;
get_carry_lv(1006) -> 25;
get_carry_lv(1007) -> 25;
get_carry_lv(1008) -> 45;
get_carry_lv(1009) -> 45;
get_carry_lv(1010) -> 45;
get_carry_lv(1011) -> 65;
get_carry_lv(1012) -> 65;
get_carry_lv(1013) -> 65;
get_carry_lv(1014) -> 5;
get_carry_lv(1015) -> 25;
get_carry_lv(1016) -> 45;
get_carry_lv(1017) -> 45;
get_carry_lv(1018) -> 45;
get_carry_lv(1019) -> 45;
get_carry_lv(1020) -> 45;
get_carry_lv(1021) -> 65;
get_carry_lv(1022) -> 65;
get_carry_lv(1023) -> 65;
get_carry_lv(1024) -> 75;
get_carry_lv(1025) -> 75;
get_carry_lv(1026) -> 75;
get_carry_lv(2001) -> 45;
get_carry_lv(2002) -> 65;
get_carry_lv(2003) -> 75;
get_carry_lv(_PetCId) -> undefined.


%% @doc 获取珍兽属性及资质权重
%% @spec get_attr_potential(PetCId) -> {Power, Anima, Energy, Concent, Method}.
get_attr_potential(1001) ->
    [
        {[{5,30,10000}],[{342,342,10000}]},
        {[{5,30,10000}],[{993,993,10000}]},
        {[{5,30,10000}],[{653,653,10000}]},
        {[{5,30,10000}],[{503,503,10000}]},
        {[{5,30,10000}],[{622,622,10000}]}
    ];
get_attr_potential(1002) ->
    [
        {[{5,30,10000}],[{342,342,10000}]},
        {[{5,30,10000}],[{993,993,10000}]},
        {[{5,30,10000}],[{653,653,10000}]},
        {[{5,30,10000}],[{503,503,10000}]},
        {[{5,30,10000}],[{622,622,10000}]}
    ];
get_attr_potential(1003) ->
    [
        {[{5,30,10000}],[{677,744,10000}]},
        {[{5,30,10000}],[{677,744,10000}]},
        {[{5,30,10000}],[{901,990,10000}]},
        {[{5,30,10000}],[{758,833,10000}]},
        {[{5,30,10000}],[{556,611,10000}]}
    ];
get_attr_potential(1004) ->
    [
        {[{5,30,10000}],[{957,1052,10000}]},
        {[{5,30,10000}],[{325,357,10000}]},
        {[{5,30,10000}],[{704,773,10000}]},
        {[{5,30,10000}],[{633,695,10000}]},
        {[{5,30,10000}],[{545,599,10000}]}
    ];
get_attr_potential(1005) ->
    [
        {[{5,30,10000}],[{356,391,10000}]},
        {[{5,30,10000}],[{1033,1135,10000}]},
        {[{5,30,10000}],[{679,746,10000}]},
        {[{5,30,10000}],[{523,574,10000}]},
        {[{5,30,10000}],[{647,711,10000}]}
    ];
get_attr_potential(1006) ->
    [
        {[{5,30,10000}],[{995,1093,10000}]},
        {[{5,30,10000}],[{338,371,10000}]},
        {[{5,30,10000}],[{732,804,10000}]},
        {[{5,30,10000}],[{658,723,10000}]},
        {[{5,30,10000}],[{567,623,10000}]}
    ];
get_attr_potential(1007) ->
    [
        {[{5,30,10000}],[{704,773,10000}]},
        {[{5,30,10000}],[{704,773,10000}]},
        {[{5,30,10000}],[{937,1030,10000}]},
        {[{5,30,10000}],[{788,866,10000}]},
        {[{5,30,10000}],[{578,635,10000}]}
    ];
get_attr_potential(1008) ->
    [
        {[{5,30,10000}],[{391,429,10000}]},
        {[{5,30,10000}],[{1136,1248,10000}]},
        {[{5,30,10000}],[{747,821,10000}]},
        {[{5,30,10000}],[{575,632,10000}]},
        {[{5,30,10000}],[{712,782,10000}]}
    ];
get_attr_potential(1009) ->
    [
        {[{5,30,10000}],[{1095,1203,10000}]},
        {[{5,30,10000}],[{372,408,10000}]},
        {[{5,30,10000}],[{805,884,10000}]},
        {[{5,30,10000}],[{724,795,10000}]},
        {[{5,30,10000}],[{623,684,10000}]}
    ];
get_attr_potential(1010) ->
    [
        {[{5,30,10000}],[{774,850,10000}]},
        {[{5,30,10000}],[{774,850,10000}]},
        {[{5,30,10000}],[{1031,1133,10000}]},
        {[{5,30,10000}],[{867,953,10000}]},
        {[{5,30,10000}],[{636,699,10000}]}
    ];
get_attr_potential(1011) ->
    [
        {[{5,30,10000}],[{431,473,10000}]},
        {[{5,30,10000}],[{1251,1375,10000}]},
        {[{5,30,10000}],[{823,904,10000}]},
        {[{5,30,10000}],[{634,696,10000}]},
        {[{5,30,10000}],[{784,861,10000}]}
    ];
get_attr_potential(1012) ->
    [
        {[{5,30,10000}],[{1206,1325,10000}]},
        {[{5,30,10000}],[{410,450,10000}]},
        {[{5,30,10000}],[{887,975,10000}]},
        {[{5,30,10000}],[{798,877,10000}]},
        {[{5,30,10000}],[{687,755,10000}]}
    ];
get_attr_potential(1013) ->
    [
        {[{5,30,10000}],[{853,937,10000}]},
        {[{5,30,10000}],[{853,937,10000}]},
        {[{5,30,10000}],[{1135,1247,10000}]},
        {[{5,30,10000}],[{955,1049,10000}]},
        {[{5,30,10000}],[{701,770,10000}]}
    ];
get_attr_potential(1014) ->
    [
        {[{5,30,10000}],[{403,443,10000}]},
        {[{5,30,10000}],[{1171,1287,10000}]},
        {[{5,30,10000}],[{770,846,10000}]},
        {[{5,30,10000}],[{593,651,10000}]},
        {[{5,30,10000}],[{733,805,10000}]}
    ];
get_attr_potential(1015) ->
    [
        {[{5,30,10000}],[{419,460,10000}]},
        {[{5,30,10000}],[{1033,1135,10000}]},
        {[{5,30,10000}],[{679,746,10000}]},
        {[{5,30,10000}],[{523,574,10000}]},
        {[{5,30,10000}],[{647,711,10000}]}
    ];
get_attr_potential(1016) ->
    [
        {[{5,30,10000}],[{913,1003,10000}]},
        {[{5,30,10000}],[{913,1003,10000}]},
        {[{5,30,10000}],[{1216,1336,10000}]},
        {[{5,30,10000}],[{1023,1124,10000}]},
        {[{5,30,10000}],[{750,824,10000}]}
    ];
get_attr_potential(1017) ->
    [
        {[{5,30,10000}],[{1292,1420,10000}]},
        {[{5,30,10000}],[{438,481,10000}]},
        {[{5,30,10000}],[{950,1044,10000}]},
        {[{5,30,10000}],[{853,937,10000}]},
        {[{5,30,10000}],[{736,809,10000}]}
    ];
get_attr_potential(1018) ->
    [
        {[{5,30,10000}],[{461,506,10000}]},
        {[{5,30,10000}],[{1340,1473,10000}]},
        {[{5,30,10000}],[{881,968,10000}]},
        {[{5,30,10000}],[{678,745,10000}]},
        {[{5,30,10000}],[{839,922,10000}]}
    ];
get_attr_potential(1019) ->
    [
        {[{5,30,10000}],[{913,1003,10000}]},
        {[{5,30,10000}],[{913,1003,10000}]},
        {[{5,30,10000}],[{1216,1336,10000}]},
        {[{5,30,10000}],[{1023,1124,10000}]},
        {[{5,30,10000}],[{750,824,10000}]}
    ];
get_attr_potential(1020) ->
    [
        {[{5,30,10000}],[{1292,1420,10000}]},
        {[{5,30,10000}],[{438,481,10000}]},
        {[{5,30,10000}],[{950,1044,10000}]},
        {[{5,30,10000}],[{853,937,10000}]},
        {[{5,30,10000}],[{736,809,10000}]}
    ];
get_attr_potential(1021) ->
    [
        {[{5,30,10000}],[{508,558,10000}]},
        {[{5,30,10000}],[{1475,1621,10000}]},
        {[{5,30,10000}],[{970,1066,10000}]},
        {[{5,30,10000}],[{747,821,10000}]},
        {[{5,30,10000}],[{924,1015,10000}]}
    ];
get_attr_potential(1022) ->
    [
        {[{5,30,10000}],[{1005,1104,10000}]},
        {[{5,30,10000}],[{1005,1104,10000}]},
        {[{5,30,10000}],[{1339,1471,10000}]},
        {[{5,30,10000}],[{1126,1237,10000}]},
        {[{5,30,10000}],[{827,909,10000}]}
    ];
get_attr_potential(1023) ->
    [
        {[{5,30,10000}],[{1423,1564,10000}]},
        {[{5,30,10000}],[{483,530,10000}]},
        {[{5,30,10000}],[{1046,1149,10000}]},
        {[{5,30,10000}],[{940,1033,10000}]},
        {[{5,30,10000}],[{810,890,10000}]}
    ];
get_attr_potential(1024) ->
    [
        {[{5,30,10000}],[{548,602,10000}]},
        {[{5,30,10000}],[{1593,1751,10000}]},
        {[{5,30,10000}],[{1047,1150,10000}]},
        {[{5,30,10000}],[{806,886,10000}]},
        {[{5,30,10000}],[{997,1095,10000}]}
    ];
get_attr_potential(1025) ->
    [
        {[{5,30,10000}],[{1085,1192,10000}]},
        {[{5,30,10000}],[{1085,1192,10000}]},
        {[{5,30,10000}],[{1446,1589,10000}]},
        {[{5,30,10000}],[{1216,1336,10000}]},
        {[{5,30,10000}],[{892,980,10000}]}
    ];
get_attr_potential(1026) ->
    [
        {[{5,30,10000}],[{1535,1687,10000}]},
        {[{5,30,10000}],[{521,572,10000}]},
        {[{5,30,10000}],[{1129,1241,10000}]},
        {[{5,30,10000}],[{1015,1115,10000}]},
        {[{5,30,10000}],[{874,960,10000}]}
    ];
get_attr_potential(2001) ->
    [
        {[{5,30,10000}],[{963,963,10000}]},
        {[{5,30,10000}],[{2799,2799,10000}]},
        {[{5,30,10000}],[{1840,1840,10000}]},
        {[{5,30,10000}],[{1417,1417,10000}]},
        {[{5,30,10000}],[{1753,1753,10000}]}
    ];
get_attr_potential(2002) ->
    [
        {[{5,30,10000}],[{2971,2971,10000}]},
        {[{5,30,10000}],[{1008,1008,10000}]},
        {[{5,30,10000}],[{2185,2185,10000}]},
        {[{5,30,10000}],[{1965,1965,10000}]},
        {[{5,30,10000}],[{1691,1691,10000}]}
    ];
get_attr_potential(2003) ->
    [
        {[{5,30,10000}],[{2268,2268,10000}]},
        {[{5,30,10000}],[{2268,2268,10000}]},
        {[{5,30,10000}],[{3019,3019,10000}]},
        {[{5,30,10000}],[{2539,2539,10000}]},
        {[{5,30,10000}],[{1863,1863,10000}]}
    ];
get_attr_potential(_PetCId) ->
    undefined.
