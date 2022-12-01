%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_artifact_base
%% @Brief  : 神器
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_artifact_base).

-export([
    get/1
]).

get(101) ->
    #{
    	name => "拓落孤影",
        career_id => 1,
        lv => 32,
        skill => [19010101],
        attr => [{5,121},{6,121},{24,98},{1,1973},{9,128},{10,32},{11,24}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,1}],
        part1_upper => {24,20},
        part2_upper => {1,1150},
        part3_upper => {9,80},
        part4_upper => {10,15},
        part5_upper => {11,20},
        part1_once_add => {24,4},
        part2_once_add => {1,230},
        part3_once_add => {9,16},
        part4_once_add => {10,3},
        part5_once_add => {11,4},
        suc_rate => 100    };
get(102) ->
    #{
    	name => "长空伏龙",
        career_id => 1,
        lv => 42,
        skill => [19010102],
        attr => [{5,154},{6,154},{32,27},{24,125},{1,2509},{9,163},{10,40},{11,31}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,2}],
        part1_upper => {24,40},
        part2_upper => {1,2320},
        part3_upper => {9,160},
        part4_upper => {10,30},
        part5_upper => {11,40},
        part1_once_add => {24,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,3},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(103) ->
    #{
    	name => "忘忧销魂",
        career_id => 1,
        lv => 52,
        skill => [19010103],
        attr => [{5,217},{6,217},{32,39},{24,176},{1,3524},{9,229},{10,57},{11,44},{101,31}],
        upgrade_source => [{16400002,5}],
        part_source => [{16400001,5}],
        part1_upper => {24,100},
        part2_upper => {1,5800},
        part3_upper => {9,400},
        part4_upper => {10,80},
        part5_upper => {11,100},
        part1_once_add => {24,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(104) ->
    #{
    	name => "灭世狼烟",
        career_id => 1,
        lv => 62,
        skill => [19010104],
        attr => [{5,250},{6,250},{32,45},{24,202},{1,4051},{9,263},{10,65},{11,50},{101,35},{103,89}],
        upgrade_source => [{16400002,20}],
        part_source => [{16400001,10}],
        part1_upper => {24,150},
        part2_upper => {1,8700},
        part3_upper => {9,600},
        part4_upper => {10,120},
        part5_upper => {11,150},
        part1_once_add => {24,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(105) ->
    #{
    	name => "裂天鬼破",
        career_id => 1,
        lv => 72,
        skill => [19010105],
        attr => [{5,341},{6,341},{32,61},{24,276},{1,5475},{9,359},{10,89},{11,69},{101,48},{103,121}],
        upgrade_source => [{16400002,40}],
        part_source => [{16400001,15}],
        part1_upper => {24,300},
        part2_upper => {1,17500},
        part3_upper => {9,1200},
        part4_upper => {10,250},
        part5_upper => {11,300},
        part1_once_add => {24,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(106) ->
    #{
    	name => "承影诸天",
        career_id => 1,
        lv => 82,
        skill => [19010106],
        attr => [{5,443},{6,443},{32,79},{24,359},{1,7183},{9,467},{10,116},{11,89},{101,63},{103,158}],
        upgrade_source => [{16400002,80}],
        part_source => [{16400001,20}],
        part1_upper => {24,540},
        part2_upper => {1,31500},
        part3_upper => {9,2160},
        part4_upper => {10,450},
        part5_upper => {11,540},
        part1_once_add => {24,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(107) ->
    #{
    	name => "龙破沧溟",
        career_id => 1,
        lv => 92,
        skill => [19010107],
        attr => [{5,568},{6,568},{32,102},{24,461},{1,9231},{9,600},{10,149},{11,114},{101,81},{103,203}],
        upgrade_source => [{16400002,160}],
        part_source => [{16400001,30}],
        part1_upper => {24,840},
        part2_upper => {1,49200},
        part3_upper => {9,3360},
        part4_upper => {10,720},
        part5_upper => {11,840},
        part1_once_add => {24,7},
        part2_once_add => {1,410},
        part3_once_add => {9,28},
        part4_once_add => {10,6},
        part5_once_add => {11,7},
        suc_rate => 100    };
get(201) ->
    #{
    	name => "紫焰惊云",
        career_id => 2,
        lv => 32,
        skill => [19010201],
        attr => [{5,121},{6,121},{22,98},{1,1973},{9,128},{10,32},{11,24}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,1}],
        part1_upper => {22,20},
        part2_upper => {1,1150},
        part3_upper => {9,80},
        part4_upper => {10,15},
        part5_upper => {11,20},
        part1_once_add => {22,4},
        part2_once_add => {1,230},
        part3_once_add => {9,16},
        part4_once_add => {10,3},
        part5_once_add => {11,4},
        suc_rate => 100    };
get(202) ->
    #{
    	name => "乾坤凤鸣",
        career_id => 2,
        lv => 42,
        skill => [19010202],
        attr => [{5,154},{6,154},{30,27},{22,125},{1,2509},{9,163},{10,40},{11,31}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,2}],
        part1_upper => {22,40},
        part2_upper => {1,2320},
        part3_upper => {9,160},
        part4_upper => {10,30},
        part5_upper => {11,40},
        part1_once_add => {22,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,3},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(203) ->
    #{
    	name => "天雷真火",
        career_id => 2,
        lv => 52,
        skill => [19010203],
        attr => [{5,217},{6,217},{30,39},{22,176},{1,3524},{9,229},{10,57},{11,44},{102,31}],
        upgrade_source => [{16400002,5}],
        part_source => [{16400001,5}],
        part1_upper => {22,100},
        part2_upper => {1,5800},
        part3_upper => {9,400},
        part4_upper => {10,80},
        part5_upper => {11,100},
        part1_once_add => {22,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(204) ->
    #{
    	name => "北冥鲲羽",
        career_id => 2,
        lv => 62,
        skill => [19010204],
        attr => [{5,250},{6,250},{30,45},{22,202},{1,4051},{9,263},{10,65},{11,50},{102,35},{103,89}],
        upgrade_source => [{16400002,20}],
        part_source => [{16400001,10}],
        part1_upper => {22,150},
        part2_upper => {1,8700},
        part3_upper => {9,600},
        part4_upper => {10,120},
        part5_upper => {11,150},
        part1_once_add => {22,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(205) ->
    #{
    	name => "太古飘翎",
        career_id => 2,
        lv => 72,
        skill => [19010205],
        attr => [{5,341},{6,341},{30,61},{22,276},{1,5475},{9,359},{10,89},{11,69},{102,48},{103,121}],
        upgrade_source => [{16400002,40}],
        part_source => [{16400001,15}],
        part1_upper => {22,300},
        part2_upper => {1,17500},
        part3_upper => {9,1200},
        part4_upper => {10,250},
        part5_upper => {11,300},
        part1_once_add => {22,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(206) ->
    #{
    	name => "鸣鸿碎霜",
        career_id => 2,
        lv => 82,
        skill => [19010206],
        attr => [{5,443},{6,443},{30,79},{22,359},{1,7183},{9,467},{10,116},{11,89},{102,63},{103,158}],
        upgrade_source => [{16400002,80}],
        part_source => [{16400001,20}],
        part1_upper => {22,540},
        part2_upper => {1,31500},
        part3_upper => {9,2160},
        part4_upper => {10,450},
        part5_upper => {11,540},
        part1_once_add => {22,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(207) ->
    #{
    	name => "孔雀擘天",
        career_id => 2,
        lv => 92,
        skill => [19010207],
        attr => [{5,568},{6,568},{30,102},{22,461},{1,9231},{9,600},{10,149},{11,114},{102,81},{103,203}],
        upgrade_source => [{16400002,160}],
        part_source => [{16400001,30}],
        part1_upper => {22,840},
        part2_upper => {1,49200},
        part3_upper => {9,3360},
        part4_upper => {10,720},
        part5_upper => {11,840},
        part1_once_add => {22,7},
        part2_once_add => {1,410},
        part3_once_add => {9,28},
        part4_once_add => {10,6},
        part5_once_add => {11,7},
        suc_rate => 100    };
get(301) ->
    #{
    	name => "月华飞尘",
        career_id => 3,
        lv => 32,
        skill => [19010301],
        attr => [{5,121},{6,121},{23,98},{1,1973},{9,128},{10,32},{11,24}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,1}],
        part1_upper => {23,20},
        part2_upper => {1,1150},
        part3_upper => {9,80},
        part4_upper => {10,15},
        part5_upper => {11,20},
        part1_once_add => {23,4},
        part2_once_add => {1,230},
        part3_once_add => {9,16},
        part4_once_add => {10,3},
        part5_once_add => {11,4},
        suc_rate => 100    };
get(302) ->
    #{
    	name => "梅殇无痕",
        career_id => 3,
        lv => 42,
        skill => [19010302],
        attr => [{5,154},{6,154},{31,27},{23,125},{1,2509},{9,163},{10,40},{11,31}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,2}],
        part1_upper => {23,40},
        part2_upper => {1,2320},
        part3_upper => {9,160},
        part4_upper => {10,30},
        part5_upper => {11,40},
        part1_once_add => {23,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,3},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(303) ->
    #{
    	name => "含光弄影",
        career_id => 3,
        lv => 52,
        skill => [19010303],
        attr => [{5,217},{6,217},{31,39},{23,176},{1,3524},{9,229},{10,57},{11,44},{102,31}],
        upgrade_source => [{16400002,5}],
        part_source => [{16400001,5}],
        part1_upper => {23,100},
        part2_upper => {1,5800},
        part3_upper => {9,400},
        part4_upper => {10,80},
        part5_upper => {11,100},
        part1_once_add => {23,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(304) ->
    #{
    	name => "百卉倾城",
        career_id => 3,
        lv => 62,
        skill => [19010304],
        attr => [{5,250},{6,250},{31,45},{23,202},{1,4051},{9,263},{10,65},{11,50},{102,35},{103,89}],
        upgrade_source => [{16400002,20}],
        part_source => [{16400001,10}],
        part1_upper => {23,150},
        part2_upper => {1,8700},
        part3_upper => {9,600},
        part4_upper => {10,120},
        part5_upper => {11,150},
        part1_once_add => {23,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(305) ->
    #{
    	name => "荼蘼苍穹",
        career_id => 3,
        lv => 72,
        skill => [19010305],
        attr => [{5,341},{6,341},{31,61},{23,276},{1,5475},{9,359},{10,89},{11,69},{102,48},{103,121}],
        upgrade_source => [{16400002,40}],
        part_source => [{16400001,15}],
        part1_upper => {23,300},
        part2_upper => {1,17500},
        part3_upper => {9,1200},
        part4_upper => {10,250},
        part5_upper => {11,300},
        part1_once_add => {23,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(306) ->
    #{
    	name => "神女行云",
        career_id => 3,
        lv => 82,
        skill => [19010306],
        attr => [{5,443},{6,443},{31,79},{23,359},{1,7183},{9,467},{10,116},{11,89},{102,63},{103,158}],
        upgrade_source => [{16400002,80}],
        part_source => [{16400001,20}],
        part1_upper => {23,540},
        part2_upper => {1,31500},
        part3_upper => {9,2160},
        part4_upper => {10,450},
        part5_upper => {11,540},
        part1_once_add => {23,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(307) ->
    #{
    	name => "凤凰来仪",
        career_id => 3,
        lv => 92,
        skill => [19010307],
        attr => [{5,568},{6,568},{31,102},{23,461},{1,9231},{9,600},{10,149},{11,114},{102,81},{103,203}],
        upgrade_source => [{16400002,160}],
        part_source => [{16400001,30}],
        part1_upper => {23,840},
        part2_upper => {1,49200},
        part3_upper => {9,3360},
        part4_upper => {10,720},
        part5_upper => {11,840},
        part1_once_add => {23,7},
        part2_once_add => {1,410},
        part3_once_add => {9,28},
        part4_once_add => {10,6},
        part5_once_add => {11,7},
        suc_rate => 100    };
get(401) ->
    #{
    	name => "断情残踪",
        career_id => 4,
        lv => 32,
        skill => [19010401],
        attr => [{5,121},{6,121},{21,98},{1,1973},{9,128},{10,32},{11,24}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,1}],
        part1_upper => {21,20},
        part2_upper => {1,1150},
        part3_upper => {9,80},
        part4_upper => {10,15},
        part5_upper => {11,20},
        part1_once_add => {21,4},
        part2_once_add => {1,230},
        part3_once_add => {9,16},
        part4_once_add => {10,3},
        part5_once_add => {11,4},
        suc_rate => 100    };
get(402) ->
    #{
    	name => "绝情裂影",
        career_id => 4,
        lv => 42,
        skill => [19010402],
        attr => [{5,154},{6,154},{29,27},{21,125},{1,2509},{9,163},{10,40},{11,31}],
        upgrade_source => [{16400002,3}],
        part_source => [{16400001,2}],
        part1_upper => {21,40},
        part2_upper => {1,2320},
        part3_upper => {9,160},
        part4_upper => {10,30},
        part5_upper => {11,40},
        part1_once_add => {21,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,3},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(403) ->
    #{
    	name => "斩情饮雪",
        career_id => 4,
        lv => 52,
        skill => [19010403],
        attr => [{5,217},{6,217},{29,39},{21,176},{1,3524},{9,229},{10,57},{11,44},{101,31}],
        upgrade_source => [{16400002,5}],
        part_source => [{16400001,5}],
        part1_upper => {21,100},
        part2_upper => {1,5800},
        part3_upper => {9,400},
        part4_upper => {10,80},
        part5_upper => {11,100},
        part1_once_add => {21,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(404) ->
    #{
    	name => "神影渺绝",
        career_id => 4,
        lv => 62,
        skill => [19010404],
        attr => [{5,250},{6,250},{29,45},{21,202},{1,4051},{9,263},{10,65},{11,50},{101,35},{103,89}],
        upgrade_source => [{16400002,20}],
        part_source => [{16400001,10}],
        part1_upper => {21,150},
        part2_upper => {1,8700},
        part3_upper => {9,600},
        part4_upper => {10,120},
        part5_upper => {11,150},
        part1_once_add => {21,5},
        part2_once_add => {1,290},
        part3_once_add => {9,20},
        part4_once_add => {10,4},
        part5_once_add => {11,5},
        suc_rate => 100    };
get(405) ->
    #{
    	name => "无相绝踪",
        career_id => 4,
        lv => 72,
        skill => [19010405],
        attr => [{5,341},{6,341},{29,61},{21,276},{1,5475},{9,359},{10,89},{11,69},{101,48},{103,121}],
        upgrade_source => [{16400002,40}],
        part_source => [{16400001,15}],
        part1_upper => {21,300},
        part2_upper => {1,17500},
        part3_upper => {9,1200},
        part4_upper => {10,250},
        part5_upper => {11,300},
        part1_once_add => {21,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(406) ->
    #{
    	name => "落影星痕",
        career_id => 4,
        lv => 82,
        skill => [19010406],
        attr => [{5,443},{6,443},{29,79},{21,359},{1,7183},{9,467},{10,116},{11,89},{101,63},{103,158}],
        upgrade_source => [{16400002,80}],
        part_source => [{16400001,20}],
        part1_upper => {21,540},
        part2_upper => {1,31500},
        part3_upper => {9,2160},
        part4_upper => {10,450},
        part5_upper => {11,540},
        part1_once_add => {21,6},
        part2_once_add => {1,350},
        part3_once_add => {9,24},
        part4_once_add => {10,5},
        part5_once_add => {11,6},
        suc_rate => 100    };
get(407) ->
    #{
    	name => "魔罗绝引",
        career_id => 4,
        lv => 92,
        skill => [19010407],
        attr => [{5,568},{6,568},{29,102},{21,461},{1,9231},{9,600},{10,149},{11,114},{101,81},{103,203}],
        upgrade_source => [{16400002,160}],
        part_source => [{16400001,30}],
        part1_upper => {21,840},
        part2_upper => {1,49200},
        part3_upper => {9,3360},
        part4_upper => {10,720},
        part5_upper => {11,840},
        part1_once_add => {21,7},
        part2_once_add => {1,410},
        part3_once_add => {9,28},
        part4_once_add => {10,6},
        part5_once_add => {11,7},
        suc_rate => 100    };
get(_Id) ->
    undefined.