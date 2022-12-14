%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_channel_equip
%% @Brief  : 经脉装备
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_channel_equip).

-export([
    get/1,
    get_ids/0
]).

get(10031100) ->
    #{
        id => 10031100,
        name => <<"石子">>,
        heros => [],
        attr => [{21,7},{22,7},{23,7},{24,7},{109,2}],
        attr_excl => [{21,7},{22,7},{23,7},{24,7},{109,2}]
    };
get(10031200) ->
    #{
        id => 10031200,
        name => <<"白铁剑">>,
        heros => [],
        attr => [{21,22},{22,22},{23,22},{24,22},{109,6}],
        attr_excl => [{21,22},{22,22},{23,22},{24,22},{109,6}]
    };
get(10031300) ->
    #{
        id => 10031300,
        name => <<"青眉棍">>,
        heros => [],
        attr => [{21,63},{22,63},{23,63},{24,63},{109,18}],
        attr_excl => [{21,63},{22,63},{23,63},{24,63},{109,18}]
    };
get(10031400) ->
    #{
        id => 10031400,
        name => <<"暴雨梨花针">>,
        heros => [],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031401) ->
    #{
        id => 10031401,
        name => <<"厘竹鱼竿">>,
        heros => [28],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031402) ->
    #{
        id => 10031402,
        name => <<"判官笔">>,
        heros => [29],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031403) ->
    #{
        id => 10031403,
        name => <<"貂毒针">>,
        heros => [17],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031404) ->
    #{
        id => 10031404,
        name => <<"青霜剑">>,
        heros => [31,24],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031405) ->
    #{
        id => 10031405,
        name => <<"鳄鱼剪">>,
        heros => [21],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031406) ->
    #{
        id => 10031406,
        name => <<"长指钢爪">>,
        heros => [22],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031407) ->
    #{
        id => 10031407,
        name => <<"猿骨笛">>,
        heros => [19,26],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031408) ->
    #{
        id => 10031408,
        name => <<"柳叶刀">>,
        heros => [23,27,30,32],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031409) ->
    #{
        id => 10031409,
        name => <<"淬毒袖箭">>,
        heros => [20,25],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031410) ->
    #{
        id => 10031410,
        name => <<"九环锡杖">>,
        heros => [18],
        attr => [{21,151},{22,151},{23,151},{24,151},{109,43}],
        attr_excl => [{21,264},{22,264},{23,264},{24,264},{109,75}]
    };
get(10031500) ->
    #{
        id => 10031500,
        name => <<"赤霄剑">>,
        heros => [],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031501) ->
    #{
        id => 10031501,
        name => <<"古法琉璃">>,
        heros => [14,15],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031502) ->
    #{
        id => 10031502,
        name => <<"碧磷针">>,
        heros => [13,16],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031503) ->
    #{
        id => 10031503,
        name => <<"精铁细拐">>,
        heros => [11],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031504) ->
    #{
        id => 10031504,
        name => <<"碧玉萧">>,
        heros => [9],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031505) ->
    #{
        id => 10031505,
        name => <<"折花玉扇">>,
        heros => [1,10],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031506) ->
    #{
        id => 10031506,
        name => <<"君子剑">>,
        heros => [8,12],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031507) ->
    #{
        id => 10031507,
        name => <<"打狗棒">>,
        heros => [3],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031508) ->
    #{
        id => 10031508,
        name => <<"越女剑">>,
        heros => [5,7],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031509) ->
    #{
        id => 10031509,
        name => <<"白玉棋盘">>,
        heros => [4],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10031510) ->
    #{
        id => 10031510,
        name => <<"生死符">>,
        heros => [6,2],
        attr => [{21,226},{22,226},{23,226},{24,226},{109,64}],
        attr_excl => [{21,377},{22,377},{23,377},{24,377},{109,106}]
    };
get(10032100) ->
    #{
        id => 10032100,
        name => <<"木簪">>,
        heros => [],
        attr => [{103,5},{3,113},{7,27},{8,27}],
        attr_excl => [{103,5},{3,113},{7,27},{8,27}]
    };
get(10032200) ->
    #{
        id => 10032200,
        name => <<"平纹裳">>,
        heros => [],
        attr => [{103,15},{3,355},{7,84},{8,84}],
        attr_excl => [{103,15},{3,355},{7,84},{8,84}]
    };
get(10032300) ->
    #{
        id => 10032300,
        name => <<"碧水佩">>,
        heros => [],
        attr => [{103,45},{3,1016},{7,240},{8,240}],
        attr_excl => [{103,45},{3,1016},{7,240},{8,240}]
    };
get(10032400) ->
    #{
        id => 10032400,
        name => <<"点翠钗">>,
        heros => [],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032401) ->
    #{
        id => 10032401,
        name => <<"铁皮护面">>,
        heros => [25],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032402) ->
    #{
        id => 10032402,
        name => <<"竹笏">>,
        heros => [27,28,29,30],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032403) ->
    #{
        id => 10032403,
        name => <<"曼陀花">>,
        heros => [31],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032404) ->
    #{
        id => 10032404,
        name => <<"春水碧波裙">>,
        heros => [26,17],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032405) ->
    #{
        id => 10032405,
        name => <<"鳄尾鞭">>,
        heros => [21],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032406) ->
    #{
        id => 10032406,
        name => <<"夜行衣">>,
        heros => [22,32],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032407) ->
    #{
        id => 10032407,
        name => <<"逍遥游">>,
        heros => [19],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032408) ->
    #{
        id => 10032408,
        name => <<"珠花簪">>,
        heros => [24,23],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032409) ->
    #{
        id => 10032409,
        name => <<"黑玫瑰">>,
        heros => [20],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032410) ->
    #{
        id => 10032410,
        name => <<"云锦袈裟">>,
        heros => [18],
        attr => [{103,100},{3,2435},{7,575},{8,575}],
        attr_excl => [{103,175},{3,4261},{7,1006},{8,1006}]
    };
get(10032500) ->
    #{
        id => 10032500,
        name => <<"云崖锦袍">>,
        heros => [],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032501) ->
    #{
        id => 10032501,
        name => <<"银字金笺">>,
        heros => [15],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032502) ->
    #{
        id => 10032502,
        name => <<"紫金冠">>,
        heros => [10],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032503) ->
    #{
        id => 10032503,
        name => <<"神木王鼎">>,
        heros => [13,16],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032504) ->
    #{
        id => 10032504,
        name => <<"段家玉佩">>,
        heros => [10],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032505) ->
    #{
        id => 10032505,
        name => <<"软猬甲">>,
        heros => [7,9],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032506) ->
    #{
        id => 10032506,
        name => <<"乌蚕衣">>,
        heros => [3,14],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032507) ->
    #{
        id => 10032507,
        name => <<"燕国传国玉玺">>,
        heros => [8,12],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032508) ->
    #{
        id => 10032508,
        name => <<"和氏璧">>,
        heros => [1],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032509) ->
    #{
        id => 10032509,
        name => <<"雪落面纱">>,
        heros => [5],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10032510) ->
    #{
        id => 10032510,
        name => <<"七宝指环">>,
        heros => [4,6,2],
        attr => [{103,150},{3,3644},{7,860},{8,860}],
        attr_excl => [{103,250},{3,6085},{7,1436},{8,1436}]
    };
get(10033100) ->
    #{
        id => 10033100,
        name => <<"长拳">>,
        heros => [],
        attr => [{101,5},{102,5},{9,36}],
        attr_excl => [{101,5},{102,5},{9,36}]
    };
get(10033200) ->
    #{
        id => 10033200,
        name => <<"通背拳">>,
        heros => [],
        attr => [{101,15},{102,15},{9,115}],
        attr_excl => [{101,15},{102,15},{9,115}]
    };
get(10033300) ->
    #{
        id => 10033300,
        name => <<"七伤拳">>,
        heros => [],
        attr => [{101,45},{102,45},{9,331}],
        attr_excl => [{101,45},{102,45},{9,331}]
    };
get(10033400) ->
    #{
        id => 10033400,
        name => <<"巨灵神掌">>,
        heros => [],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033401) ->
    #{
        id => 10033401,
        name => <<"冰蚕毒掌">>,
        heros => [25],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033402) ->
    #{
        id => 10033402,
        name => <<"指天射鱼">>,
        heros => [28],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033403) ->
    #{
        id => 10033403,
        name => <<"落笔成兵">>,
        heros => [29],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033404) ->
    #{
        id => 10033404,
        name => <<"兰花拂穴手">>,
        heros => [26,17],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033405) ->
    #{
        id => 10033405,
        name => <<"柳絮剑法">>,
        heros => [31,24],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033406) ->
    #{
        id => 10033406,
        name => <<"鳄鱼摆尾">>,
        heros => [21],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033407) ->
    #{
        id => 10033407,
        name => <<"鹤蛇八打">>,
        heros => [22],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033408) ->
    #{
        id => 10033408,
        name => <<"柳叶刀法">>,
        heros => [23,27,30,32],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033409) ->
    #{
        id => 10033409,
        name => <<"修罗刀法">>,
        heros => [20],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033410) ->
    #{
        id => 10033410,
        name => <<"大力金刚掌">>,
        heros => [18],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033411) ->
    #{
        id => 10033411,
        name => <<"龟息功">>,
        heros => [19],
        attr => [{101,100},{102,100},{9,793}],
        attr_excl => [{101,175},{102,175},{9,1387}]
    };
get(10033500) ->
    #{
        id => 10033500,
        name => <<"九阴白骨爪">>,
        heros => [],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033501) ->
    #{
        id => 10033501,
        name => <<"火焰刀">>,
        heros => [15],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033502) ->
    #{
        id => 10033502,
        name => <<"一阳指">>,
        heros => [10,11],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033503) ->
    #{
        id => 10033503,
        name => <<"易容术">>,
        heros => [9],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033504) ->
    #{
        id => 10033504,
        name => <<"腐尸功">>,
        heros => [13,16],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033505) ->
    #{
        id => 10033505,
        name => <<"无相劫指">>,
        heros => [14,12],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033506) ->
    #{
        id => 10033506,
        name => <<"凌波微步">>,
        heros => [1],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033507) ->
    #{
        id => 10033507,
        name => <<"降龙十八掌">>,
        heros => [3],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033508) ->
    #{
        id => 10033508,
        name => <<"天山折梅手">>,
        heros => [2],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033509) ->
    #{
        id => 10033509,
        name => <<"参合指">>,
        heros => [8,7],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033510) ->
    #{
        id => 10033510,
        name => <<"北冥神功">>,
        heros => [4],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033511) ->
    #{
        id => 10033511,
        name => <<"白虹掌力">>,
        heros => [5],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10033512) ->
    #{
        id => 10033512,
        name => <<"天山六阳掌">>,
        heros => [6],
        attr => [{101,150},{102,150},{9,1186}],
        attr_excl => [{101,250},{102,250},{9,1980}]
    };
get(10034100) ->
    #{
        id => 10034100,
        name => <<"迷踪步">>,
        heros => [],
        attr => [{104,5},{105,3},{10,8}],
        attr_excl => [{104,5},{105,3},{10,8}]
    };
get(10034200) ->
    #{
        id => 10034200,
        name => <<"铁布衫">>,
        heros => [],
        attr => [{104,15},{105,9},{10,28}],
        attr_excl => [{104,15},{105,9},{10,28}]
    };
get(10034300) ->
    #{
        id => 10034300,
        name => <<"天元心法">>,
        heros => [],
        attr => [{104,45},{105,25},{10,82}],
        attr_excl => [{104,45},{105,25},{10,82}]
    };
get(10034400) ->
    #{
        id => 10034400,
        name => <<"玄女心法">>,
        heros => [],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034401) ->
    #{
        id => 10034401,
        name => <<"段氏心经">>,
        heros => [27,28,29,30],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034402) ->
    #{
        id => 10034402,
        name => <<"寒袖拂穴">>,
        heros => [31,19],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034403) ->
    #{
        id => 10034403,
        name => <<"慕容心经">>,
        heros => [26,32],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034404) ->
    #{
        id => 10034404,
        name => <<"万仇掌">>,
        heros => [17],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034405) ->
    #{
        id => 10034405,
        name => <<"落英掌">>,
        heros => [24],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034406) ->
    #{
        id => 10034406,
        name => <<"追魂鞭法">>,
        heros => [21],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034407) ->
    #{
        id => 10034407,
        name => <<"追风步">>,
        heros => [22],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034408) ->
    #{
        id => 10034408,
        name => <<"叶氏阴气">>,
        heros => [23],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034409) ->
    #{
        id => 10034409,
        name => <<"五罗轻烟掌">>,
        heros => [20],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034410) ->
    #{
        id => 10034410,
        name => <<"袈裟伏魔功">>,
        heros => [18],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034411) ->
    #{
        id => 10034411,
        name => <<"游氏内功">>,
        heros => [25],
        attr => [{104,100},{105,55},{10,198}],
        attr_excl => [{104,175},{105,96},{10,346}]
    };
get(10034500) ->
    #{
        id => 10034500,
        name => <<"吸星大法">>,
        heros => [],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034501) ->
    #{
        id => 10034501,
        name => <<"易筋经">>,
        heros => [14],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034502) ->
    #{
        id => 10034502,
        name => <<"段家剑">>,
        heros => [10],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034503) ->
    #{
        id => 10034503,
        name => <<"腹语术">>,
        heros => [11],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034504) ->
    #{
        id => 10034504,
        name => <<"化功大法">>,
        heros => [13,16],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034505) ->
    #{
        id => 10034505,
        name => <<"小无相功">>,
        heros => [4,2,5,15],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034506) ->
    #{
        id => 10034506,
        name => <<"玉女心经">>,
        heros => [7,9],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034507) ->
    #{
        id => 10034507,
        name => <<"斗转星移">>,
        heros => [8,12],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034508) ->
    #{
        id => 10034508,
        name => <<"六脉神剑">>,
        heros => [1],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034509) ->
    #{
        id => 10034509,
        name => <<"擒龙功">>,
        heros => [3],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(10034510) ->
    #{
        id => 10034510,
        name => <<"唯我独尊功">>,
        heros => [6],
        attr => [{104,150},{105,83},{10,296}],
        attr_excl => [{104,250},{105,138},{10,494}]
    };
get(_ID) ->
    undefined.

get_ids() ->
    [10031100, 10031200, 10031300, 10031400, 10031401, 10031402, 10031403, 10031404, 10031405, 10031406, 10031407, 10031408, 10031409, 10031410, 10031500, 10031501, 10031502, 10031503, 10031504, 10031505, 10031506, 10031507, 10031508, 10031509, 10031510, 10032100, 10032200, 10032300, 10032400, 10032401, 10032402, 10032403, 10032404, 10032405, 10032406, 10032407, 10032408, 10032409, 10032410, 10032500, 10032501, 10032502, 10032503, 10032504, 10032505, 10032506, 10032507, 10032508, 10032509, 10032510, 10033100, 10033200, 10033300, 10033400, 10033401, 10033402, 10033403, 10033404, 10033405, 10033406, 10033407, 10033408, 10033409, 10033410, 10033411, 10033500, 10033501, 10033502, 10033503, 10033504, 10033505, 10033506, 10033507, 10033508, 10033509, 10033510, 10033511, 10033512, 10034100, 10034200, 10034300, 10034400, 10034401, 10034402, 10034403, 10034404, 10034405, 10034406, 10034407, 10034408, 10034409, 10034410, 10034411, 10034500, 10034501, 10034502, 10034503, 10034504, 10034505, 10034506, 10034507, 10034508, 10034509, 10034510].
