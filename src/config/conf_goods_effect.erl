%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_goods_effect
%% @Brief  : 物品效果
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_goods_effect).

-export([
    conf/1,
    get/1
]).


conf(11010001) ->
    #{
        effect_type => 9,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {390,90}
    };
conf(11020001) ->
    #{
        effect_type => 10,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {100,20}
    };
conf(11030001) ->
    #{
        effect_type => 11,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {500,75}
    };
conf(15010001) ->
    #{
        effect_type => 3,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => [{1,266111},{2,266091},{3,266101},{4,266081}]
    };
conf(15010002) ->
    #{
        effect_type => 3,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => [{1,266501},{2,266502},{3,266503},{4,266504}]
    };
conf(15010003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286101
    };
conf(15010004) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286102
    };
conf(15010005) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286103
    };
conf(15010006) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286104
    };
conf(15010007) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230001
    };
conf(15010011) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230002
    };
conf(15010012) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230003
    };
conf(15010013) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230017
    };
conf(15010014) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230018
    };
conf(15010015) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230020
    };
conf(15010021) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230004
    };
conf(15010022) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230005
    };
conf(15010023) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230006
    };
conf(15010024) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230007
    };
conf(15010025) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230019
    };
conf(15010031) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230008
    };
conf(15010032) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230009
    };
conf(15010033) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230010
    };
conf(15010034) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230011
    };
conf(15010041) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230012
    };
conf(15010042) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230013
    };
conf(15010043) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230014
    };
conf(15010044) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230015
    };
conf(15010045) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 230016
    };
conf(15010051) ->
    #{
        effect_type => 3,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => [{1,270011},{2,270021},{3,270031},{4,270041}]
    };
conf(15010052) ->
    #{
        effect_type => 3,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => [{1,270012},{2,270022},{3,270032},{4,270042}]
    };
conf(15010053) ->
    #{
        effect_type => 3,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => [{1,270013},{2,270023},{3,270033},{4,270043}]
    };
conf(15010054) ->
    #{
        effect_type => 3,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => [{1,270014},{2,270024},{3,270034},{4,270044}]
    };
conf(15010055) ->
    #{
        effect_type => 3,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => [{1,270015},{2,270025},{3,270035},{4,270045}]
    };
conf(15010056) ->
    #{
        effect_type => 3,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => [{1,270016},{2,270026},{3,270036},{4,270046}]
    };
conf(15010057) ->
    #{
        effect_type => 3,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => [{1,270017},{2,270027},{3,270037},{4,270047}]
    };
conf(15010058) ->
    #{
        effect_type => 3,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => [{1,270018},{2,270028},{3,270038},{4,270048}]
    };
conf(15010060) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270100
    };
conf(15010061) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270101
    };
conf(15010062) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270102
    };
conf(15010063) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270103
    };
conf(15010064) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270104
    };
conf(15010065) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270105
    };
conf(15010066) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270106
    };
conf(15010067) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270107
    };
conf(15010068) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270108
    };
conf(15010071) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270201
    };
conf(15010072) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270202
    };
conf(15010073) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270203
    };
conf(15010074) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270204
    };
conf(15010075) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270205
    };
conf(15010076) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270206
    };
conf(15010077) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270207
    };
conf(15010078) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270208
    };
conf(15010079) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270209
    };
conf(15010080) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270210
    };
conf(15010081) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270211
    };
conf(15010082) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270212
    };
conf(15010083) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {16270009,16270010,16270011,16270012}
    };
conf(15010084) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270214
    };
conf(15010085) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270215
    };
conf(15010086) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270216
    };
conf(15010087) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {16270001,16270002,16270003,16270004}
    };
conf(15010088) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {16270005,16270006,16270007,16270008}
    };
conf(15010089) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270219
    };
conf(15010090) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270220
    };
conf(15010091) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270301
    };
conf(15010092) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270302
    };
conf(15010093) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270303
    };
conf(15010101) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270401
    };
conf(15010102) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270402
    };
conf(15010103) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220016
    };
conf(15010104) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220017
    };
conf(15010105) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220018
    };
conf(15010106) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220019
    };
conf(15010107) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220020
    };
conf(15010201) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270501
    };
conf(15010202) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270502
    };
conf(15010203) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270503
    };
conf(15010204) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270504
    };
conf(15010205) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270505
    };
conf(15010206) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270506
    };
conf(15010207) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270507
    };
conf(15010208) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270508
    };
conf(15010209) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270509
    };
conf(15010301) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270601
    };
conf(15010302) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270602
    };
conf(15010303) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270603
    };
conf(15010304) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270604
    };
conf(15010305) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270605
    };
conf(15010401) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270701
    };
conf(15010402) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270702
    };
conf(15010403) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270703
    };
conf(15010404) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270704
    };
conf(15010405) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270705
    };
conf(15010406) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270706
    };
conf(15010407) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270707
    };
conf(15010408) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270708
    };
conf(15010409) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270709
    };
conf(15010501) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270901
    };
conf(15010502) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270902
    };
conf(15010503) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270903
    };
conf(15010504) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270904
    };
conf(15010505) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270905
    };
conf(15010506) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270906
    };
conf(15010507) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270907
    };
conf(15010508) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270908
    };
conf(15010509) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270909
    };
conf(15010801) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 270001
    };
conf(15010802) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 270002
    };
conf(15010803) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 270003
    };
conf(15010804) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 270004
    };
conf(15010805) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 270005
    };
conf(15010806) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 270006
    };
conf(15010807) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 270007
    };
conf(15010808) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 270008
    };
conf(15010901) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 286201
    };
conf(15010902) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 286202
    };
conf(15010903) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 286203
    };
conf(15010904) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 286204
    };
conf(15010905) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 286205
    };
conf(15012001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 286301
    };
conf(15012002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 286302
    };
conf(15012003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 286303
    };
conf(15013001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,25}],
        max_use_num => 300,
        effect => 286401
    };
conf(15013002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,25}],
        max_use_num => 300,
        effect => 286402
    };
conf(15013003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,25}],
        max_use_num => 300,
        effect => 286403
    };
conf(15015001) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1
    };
conf(15015002) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2
    };
conf(15015003) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 3
    };
conf(15015004) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4
    };
conf(15015005) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5
    };
conf(15015006) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6
    };
conf(15015007) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 7
    };
conf(15015008) ->
    #{
        effect_type => 17,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 8
    };
conf(15016001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310001
    };
conf(15016002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310002
    };
conf(15016003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310003
    };
conf(15016101) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310101
    };
conf(15016102) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310102
    };
conf(15016103) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310103
    };
conf(15016104) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310104
    };
conf(15016105) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310105
    };
conf(15016106) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310106
    };
conf(15016107) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310107
    };
conf(15016108) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310108
    };
conf(15016109) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310109
    };
conf(15016110) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310110
    };
conf(15016111) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310111
    };
conf(15016112) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310112
    };
conf(15016113) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310113
    };
conf(15016114) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310114
    };
conf(15016201) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310201
    };
conf(15016202) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 310202
    };
conf(15017001) ->
    #{
        effect_type => 3,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => [{1,320101},{2,320102},{3,320103},{4,320104}]
    };
conf(15017002) ->
    #{
        effect_type => 3,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => [{1,320201},{2,320202},{3,320203},{4,320204}]
    };
conf(15017003) ->
    #{
        effect_type => 3,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => [{1,320301},{2,320302},{3,320303},{4,320304}]
    };
conf(15018001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 350001
    };
conf(15020001) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020002,15020003}
    };
conf(15020101) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020002,15020003,15020004}
    };
conf(15020002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270802
    };
conf(15020003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270803
    };
conf(15020004) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270804
    };
conf(15020005) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020006,15020007}
    };
conf(15020105) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020006,15020007,15020008}
    };
conf(15020006) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270806
    };
conf(15020007) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270807
    };
conf(15020008) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270808
    };
conf(15020009) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020010,15020011}
    };
conf(15020109) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020010,15020011,15020012}
    };
conf(15020010) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270810
    };
conf(15020011) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270811
    };
conf(15020012) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270812
    };
conf(15020013) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020014,15020015}
    };
conf(15020113) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => {15020014,15020015,15020016}
    };
conf(15020014) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270814
    };
conf(15020015) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270815
    };
conf(15020016) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270816
    };
conf(15020017) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270817
    };
conf(15020018) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270818
    };
conf(15020019) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270819
    };
conf(15020020) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270820
    };
conf(15020021) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270821
    };
conf(15020041) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270822
    };
conf(15020042) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270823
    };
conf(15020043) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270824
    };
conf(15020044) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270825
    };
conf(15020045) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270826
    };
conf(15020051) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270827
    };
conf(15020052) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270828
    };
conf(15020053) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270829
    };
conf(15020054) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270830
    };
conf(15020055) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 270831
    };
conf(15020031) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 293011
    };
conf(15020032) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 100,
        effect => {35000010,35000011,35000012,35000013}
    };
conf(15030001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220101
    };
conf(15030002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220102
    };
conf(15030003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220103
    };
conf(15030004) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220104
    };
conf(15030005) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220105
    };
conf(15030006) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220106
    };
conf(15030007) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220107
    };
conf(15030008) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 220108
    };
conf(31010001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1001,0}
    };
conf(31010101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1002,0}
    };
conf(31010201) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1003,0}
    };
conf(31010301) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1004,0}
    };
conf(31010401) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1005,0}
    };
conf(31010501) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1006,0}
    };
conf(31010601) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1007,0}
    };
conf(31010701) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1008,0}
    };
conf(31010801) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1009,0}
    };
conf(31010901) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1010,0}
    };
conf(31011001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1011,0}
    };
conf(31011101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1012,0}
    };
conf(31020001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1001,2592000}
    };
conf(31020101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1002,2592000}
    };
conf(31020201) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1003,2592000}
    };
conf(31020301) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1004,2592000}
    };
conf(31020401) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1005,2592000}
    };
conf(31020501) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1006,2592000}
    };
conf(31020601) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1007,2592000}
    };
conf(31020701) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1008,2592000}
    };
conf(31020801) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1009,2592000}
    };
conf(31020901) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1010,2592000}
    };
conf(31021001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1011,2592000}
    };
conf(31021101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1012,2592000}
    };
conf(31030001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1001,604800}
    };
conf(31030101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1002,604800}
    };
conf(31030201) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1003,604800}
    };
conf(31030301) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1004,604800}
    };
conf(31030401) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1005,604800}
    };
conf(31030501) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1006,604800}
    };
conf(31030601) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1007,604800}
    };
conf(31030701) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1008,604800}
    };
conf(31030801) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1009,604800}
    };
conf(31030901) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1010,604800}
    };
conf(31031001) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1011,604800}
    };
conf(31031101) ->
    #{
        effect_type => 8,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1012,604800}
    };
conf(30010001) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1001
    };
conf(30010002) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1002
    };
conf(30010003) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1003
    };
conf(30010004) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1004
    };
conf(30010005) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1005
    };
conf(30010006) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1006
    };
conf(30010007) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1007
    };
conf(30010008) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1008
    };
conf(30010009) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1009
    };
conf(30010010) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1010
    };
conf(30010011) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1011
    };
conf(30010012) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1012
    };
conf(30010013) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1013
    };
conf(30010014) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1014
    };
conf(30010015) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1015
    };
conf(30010016) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1016
    };
conf(30010017) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1017
    };
conf(30010018) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1018
    };
conf(30010019) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1019
    };
conf(30010020) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1020
    };
conf(30010021) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1021
    };
conf(30010022) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1022
    };
conf(30010023) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1023
    };
conf(30010024) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1024
    };
conf(30010025) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1025
    };
conf(30010026) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1026
    };
conf(30010027) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1027
    };
conf(30010028) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1028
    };
conf(30010029) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1029
    };
conf(30010030) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1030
    };
conf(30010101) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2001
    };
conf(30010102) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2002
    };
conf(30010103) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2003
    };
conf(30010104) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2004
    };
conf(30010105) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2005
    };
conf(30010106) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2006
    };
conf(30010107) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2007
    };
conf(30010108) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2008
    };
conf(30010109) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2009
    };
conf(30010201) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 3001
    };
conf(30010202) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 3001
    };
conf(30010203) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 3001
    };
conf(30010301) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4001
    };
conf(30010302) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4002
    };
conf(30010303) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4003
    };
conf(30010304) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4004
    };
conf(30010401) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5001
    };
conf(30010402) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5002
    };
conf(30010403) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5003
    };
conf(30010499) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5099
    };
conf(30010501) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6001
    };
conf(30010502) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6002
    };
conf(30010503) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6003
    };
conf(30010504) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6004
    };
conf(30010505) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6005
    };
conf(30010506) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6006
    };
conf(30010507) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6007
    };
conf(30010508) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6008
    };
conf(30010509) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6009
    };
conf(30010510) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6010
    };
conf(30010511) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6011
    };
conf(30010512) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6012
    };
conf(30010513) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6013
    };
conf(30010514) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6014
    };
conf(30010515) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6015
    };
conf(30010516) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6016
    };
conf(30010517) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6017
    };
conf(30010518) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6018
    };
conf(30010519) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6019
    };
conf(30010520) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6020
    };
conf(30010521) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6021
    };
conf(30010522) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6022
    };
conf(30010523) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6023
    };
conf(30010524) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6024
    };
conf(30010525) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6025
    };
conf(30010526) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6026
    };
conf(30010527) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6027
    };
conf(30010528) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6028
    };
conf(30010601) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9001
    };
conf(30010602) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9002
    };
conf(30010603) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9003
    };
conf(30010604) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9004
    };
conf(30010605) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9005
    };
conf(30010606) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9006
    };
conf(30010607) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9007
    };
conf(30010608) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9008
    };
conf(30010701) ->
    #{
        effect_type => 12,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 10001
    };
conf(33011000) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {33011002,33011001}
    };
conf(33011001) ->
    #{
        effect_type => 2,
        use_lmt => [{1,5}],
        max_use_num => 1,
        effect => {1001,{1,1},{1,1}}
    };
conf(33011002) ->
    #{
        effect_type => 2,
        use_lmt => [{1,5}],
        max_use_num => 1,
        effect => {1002,{1,1},{1,1}}
    };
conf(33011003) ->
    #{
        effect_type => 2,
        use_lmt => [{1,5}],
        max_use_num => 1,
        effect => {1003,{0,0},{1,1}}
    };
conf(33011004) ->
    #{
        effect_type => 2,
        use_lmt => [{1,5}],
        max_use_num => 1,
        effect => {1004,{0,0},{1,1}}
    };
conf(33011005) ->
    #{
        effect_type => 2,
        use_lmt => [{1,25}],
        max_use_num => 1,
        effect => {1005,{0,0},{1,1}}
    };
conf(33011006) ->
    #{
        effect_type => 2,
        use_lmt => [{1,25}],
        max_use_num => 1,
        effect => {1006,{0,0},{1,1}}
    };
conf(33011007) ->
    #{
        effect_type => 2,
        use_lmt => [{1,25}],
        max_use_num => 1,
        effect => {1007,{0,0},{1,1}}
    };
conf(33011008) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1008,{0,0},{1,1}}
    };
conf(33011009) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1009,{0,0},{1,1}}
    };
conf(33011010) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1010,{0,0},{1,1}}
    };
conf(33011011) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1011,{0,0},{1,1}}
    };
conf(33011012) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1012,{0,0},{1,1}}
    };
conf(33011013) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1013,{0,0},{1,1}}
    };
conf(33011014) ->
    #{
        effect_type => 2,
        use_lmt => [{1,5}],
        max_use_num => 1,
        effect => {1014,{0,0},{1,1}}
    };
conf(33011015) ->
    #{
        effect_type => 2,
        use_lmt => [{1,25}],
        max_use_num => 1,
        effect => {1015,{0,0},{1,1}}
    };
conf(33011016) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1016,{0,0},{1,1}}
    };
conf(33011017) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1017,{7,7},{5,5}}
    };
conf(33011018) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1018,{0,0},{1,1}}
    };
conf(33011019) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1019,{0,0},{1,1}}
    };
conf(33011020) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {1020,{0,0},{1,1}}
    };
conf(33011021) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1021,{0,0},{1,1}}
    };
conf(33011022) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1022,{0,0},{1,1}}
    };
conf(33011023) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {1023,{0,0},{1,1}}
    };
conf(33011024) ->
    #{
        effect_type => 2,
        use_lmt => [{1,75}],
        max_use_num => 1,
        effect => {1024,{0,0},{1,1}}
    };
conf(33011025) ->
    #{
        effect_type => 2,
        use_lmt => [{1,75}],
        max_use_num => 1,
        effect => {1025,{0,0},{1,1}}
    };
conf(33011026) ->
    #{
        effect_type => 2,
        use_lmt => [{1,75}],
        max_use_num => 1,
        effect => {1026,{0,0},{1,1}}
    };
conf(33011027) ->
    #{
        effect_type => 2,
        use_lmt => [{1,25}],
        max_use_num => 1,
        effect => {1015,{7,7},{5,5}}
    };
conf(33021001) ->
    #{
        effect_type => 2,
        use_lmt => [{1,45}],
        max_use_num => 1,
        effect => {2001,{9,9},{5,5}}
    };
conf(33021002) ->
    #{
        effect_type => 2,
        use_lmt => [{1,65}],
        max_use_num => 1,
        effect => {2002,{9,9},{5,5}}
    };
conf(33021003) ->
    #{
        effect_type => 2,
        use_lmt => [{1,75}],
        max_use_num => 1,
        effect => {2003,{9,9},{5,5}}
    };
conf(16410001) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1101},{2,1201},{3,1301},{4,1401}]
    };
conf(16410002) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1102},{2,1202},{3,1302},{4,1402}]
    };
conf(16410003) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1103},{2,1203},{3,1303},{4,1403}]
    };
conf(16410004) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1104},{2,1204},{3,1304},{4,1404}]
    };
conf(16410005) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1105},{2,1205},{3,1305},{4,1405}]
    };
conf(16410006) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => []
    };
conf(16410007) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => []
    };
conf(16410008) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => []
    };
conf(16410009) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1503},{2,1503},{3,1503},{4,1503}]
    };
conf(16410010) ->
    #{
        effect_type => 5,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => [{1,1504},{2,1504},{3,1504},{4,1504}]
    };
conf(32010000) ->
    #{
        effect_type => 4,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {32010001,32010002}
    };
conf(32010001) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1,0}
    };
conf(32010002) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {2,0}
    };
conf(32010003) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {3,0}
    };
conf(32010004) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {4,0}
    };
conf(32010005) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {5,0}
    };
conf(32010006) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {6,0}
    };
conf(32010007) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {7,0}
    };
conf(32010008) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {8,0}
    };
conf(32010009) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {9,0}
    };
conf(32010010) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {10,0}
    };
conf(32010011) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {11,0}
    };
conf(32020001) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1,2592000}
    };
conf(32020002) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {2,2592000}
    };
conf(32020003) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {3,2592000}
    };
conf(32020004) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {4,2592000}
    };
conf(32020005) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {5,2592000}
    };
conf(32020006) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {6,2592000}
    };
conf(32020007) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {7,2592000}
    };
conf(32020008) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {8,2592000}
    };
conf(32020009) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {9,2592000}
    };
conf(32020010) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {10,2592000}
    };
conf(32020011) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {11,2592000}
    };
conf(32030001) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1,604800}
    };
conf(32030002) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {2,604800}
    };
conf(32030003) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {3,604800}
    };
conf(32030004) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {4,604800}
    };
conf(32030005) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {5,604800}
    };
conf(32030006) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {6,604800}
    };
conf(32030007) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {7,604800}
    };
conf(32030008) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {8,604800}
    };
conf(32030009) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {9,604800}
    };
conf(32030010) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {10,604800}
    };
conf(32030011) ->
    #{
        effect_type => 6,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {11,604800}
    };
conf(16310201) ->
    #{
        effect_type => 7,
        use_lmt => [{3,1}],
        max_use_num => 1,
        effect => 1
    };
conf(16110001) ->
    #{
        effect_type => 13,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1
    };
conf(16110002) ->
    #{
        effect_type => 13,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 550000
    };
conf(16460001) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1001
    };
conf(16460002) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1002
    };
conf(16460003) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1003
    };
conf(16460010) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1010
    };
conf(16460011) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1011
    };
conf(16460012) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1012
    };
conf(16460013) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1013
    };
conf(16460014) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1014
    };
conf(16460021) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1021
    };
conf(16460022) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1022
    };
conf(16460023) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1023
    };
conf(16460024) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1024
    };
conf(16460025) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1025
    };
conf(16460026) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1026
    };
conf(16460027) ->
    #{
        effect_type => 14,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1027
    };
conf(15010421) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 280801
    };
conf(15010422) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 280802
    };
conf(15010423) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 280803
    };
conf(15010424) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 280804
    };
conf(15010425) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 280805
    };
conf(15010426) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 280806
    };
conf(15010427) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 280807
    };
conf(15010428) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 280808
    };
conf(15010429) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 280809
    };
conf(15010431) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 281801
    };
conf(15010432) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 281802
    };
conf(15010433) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 281803
    };
conf(15010434) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 281804
    };
conf(15010435) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 281805
    };
conf(15010436) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 281806
    };
conf(15010437) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 281807
    };
conf(15010438) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 281808
    };
conf(15010439) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 281809
    };
conf(15010441) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 282801
    };
conf(15010442) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 282802
    };
conf(15010443) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 282803
    };
conf(15010444) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 282804
    };
conf(15010445) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 282805
    };
conf(15010446) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 282806
    };
conf(15010447) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 282807
    };
conf(15010448) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 282808
    };
conf(15010449) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 282809
    };
conf(15010451) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 283801
    };
conf(15010452) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 283802
    };
conf(15010453) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 283803
    };
conf(15010454) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 283804
    };
conf(15010455) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 283805
    };
conf(15010456) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 283806
    };
conf(15010457) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 283807
    };
conf(15010458) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 283808
    };
conf(15010459) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 283809
    };
conf(15010521) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 280901
    };
conf(15010522) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 280902
    };
conf(15010523) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 280903
    };
conf(15010524) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 280904
    };
conf(15010525) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 280905
    };
conf(15010526) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 280906
    };
conf(15010527) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 280907
    };
conf(15010528) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 280908
    };
conf(15010529) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 280909
    };
conf(15010531) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 281901
    };
conf(15010532) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 281902
    };
conf(15010533) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 281903
    };
conf(15010534) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 281904
    };
conf(15010535) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 281905
    };
conf(15010536) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 281906
    };
conf(15010537) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 281907
    };
conf(15010538) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 281908
    };
conf(15010539) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 281909
    };
conf(15010541) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 282901
    };
conf(15010542) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 282902
    };
conf(15010543) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 282903
    };
conf(15010544) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 282904
    };
conf(15010545) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 282905
    };
conf(15010546) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 282906
    };
conf(15010547) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 282907
    };
conf(15010548) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 282908
    };
conf(15010549) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 282909
    };
conf(15010551) ->
    #{
        effect_type => 1,
        use_lmt => [{1,10}],
        max_use_num => 300,
        effect => 283901
    };
conf(15010552) ->
    #{
        effect_type => 1,
        use_lmt => [{1,20}],
        max_use_num => 300,
        effect => 283902
    };
conf(15010553) ->
    #{
        effect_type => 1,
        use_lmt => [{1,30}],
        max_use_num => 300,
        effect => 283903
    };
conf(15010554) ->
    #{
        effect_type => 1,
        use_lmt => [{1,40}],
        max_use_num => 300,
        effect => 283904
    };
conf(15010555) ->
    #{
        effect_type => 1,
        use_lmt => [{1,50}],
        max_use_num => 300,
        effect => 283905
    };
conf(15010556) ->
    #{
        effect_type => 1,
        use_lmt => [{1,60}],
        max_use_num => 300,
        effect => 283906
    };
conf(15010557) ->
    #{
        effect_type => 1,
        use_lmt => [{1,70}],
        max_use_num => 300,
        effect => 283907
    };
conf(15010558) ->
    #{
        effect_type => 1,
        use_lmt => [{1,80}],
        max_use_num => 300,
        effect => 283908
    };
conf(15010559) ->
    #{
        effect_type => 1,
        use_lmt => [{1,90}],
        max_use_num => 300,
        effect => 283909
    };
conf(15010601) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286001
    };
conf(15010602) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286002
    };
conf(15010603) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286003
    };
conf(15010604) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286004
    };
conf(15010605) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286005
    };
conf(15010606) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286006
    };
conf(15010607) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286007
    };
conf(15010608) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286008
    };
conf(15010609) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 286009
    };
conf(15011001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 132101
    };
conf(15011002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 132102
    };
conf(15011003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 132103
    };
conf(15011004) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 132104
    };
conf(15050001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 304001
    };
conf(15050002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 304002
    };
conf(15050003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 304003
    };
conf(15050004) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 304004
    };
conf(15050005) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 304005
    };
conf(15060001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 307001
    };
conf(15060002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 307002
    };
conf(15060003) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 307003
    };
conf(15070001) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 350101
    };
conf(16119001) ->
    #{
        effect_type => 13,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 1000000000
    };
conf(16119002) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 292001
    };
conf(16211001) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 1
    };
conf(16211002) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 2
    };
conf(16211003) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 3
    };
conf(16211004) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 4
    };
conf(16211005) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 5
    };
conf(16211006) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 6
    };
conf(16211007) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 7
    };
conf(16211008) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 8
    };
conf(16211009) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 9
    };
conf(16211010) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 10
    };
conf(16211011) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 11
    };
conf(16211012) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 12
    };
conf(16211013) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 13
    };
conf(16211014) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 14
    };
conf(16211015) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 15
    };
conf(16211016) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 16
    };
conf(16211017) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 17
    };
conf(16211018) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 18
    };
conf(16211019) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 19
    };
conf(16211020) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 20
    };
conf(16211021) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 21
    };
conf(16211022) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 22
    };
conf(16211023) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 23
    };
conf(16211024) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 24
    };
conf(16211025) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 25
    };
conf(16211026) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 26
    };
conf(16211027) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 27
    };
conf(16211028) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 28
    };
conf(16211029) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 29
    };
conf(16211030) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 30
    };
conf(16211031) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 31
    };
conf(16211032) ->
    #{
        effect_type => 15,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 32
    };
conf(16480401) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {101,2592000}
    };
conf(16480402) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {102,2592000}
    };
conf(16480403) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {103,2592000}
    };
conf(16480404) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {104,2592000}
    };
conf(16480405) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {201,0}
    };
conf(16480406) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {202,0}
    };
conf(16480407) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {203,0}
    };
conf(16480408) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {204,0}
    };
conf(16480409) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {205,0}
    };
conf(16480410) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {206,0}
    };
conf(16480411) ->
    #{
        effect_type => 18,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {207,0}
    };
conf(16360001) ->
    #{
        effect_type => 19,
        use_lmt => [{1,1}],
        max_use_num => 100,
        effect => 0
    };
conf(16320001) ->
    #{
        effect_type => 20,
        use_lmt => [{1,1}],
        max_use_num => 9,
        effect => 0
    };
conf(38010001) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {0,0}
    };
conf(38010002) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {101,604800}
    };
conf(38010003) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {102,604800}
    };
conf(38010004) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {103,604800}
    };
conf(38010005) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {104,604800}
    };
conf(38010006) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {105,604800}
    };
conf(38010007) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {106,604800}
    };
conf(38010008) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {107,604800}
    };
conf(38010009) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {108,604800}
    };
conf(38010010) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {109,604800}
    };
conf(38010011) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {110,604800}
    };
conf(38010012) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {111,604800}
    };
conf(38010013) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {112,604800}
    };
conf(38010014) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {113,604800}
    };
conf(38010015) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {114,604800}
    };
conf(38010016) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {115,604800}
    };
conf(38010017) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {116,604800}
    };
conf(38010018) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {117,604800}
    };
conf(38010019) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {118,604800}
    };
conf(38010020) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {119,604800}
    };
conf(38010021) ->
    #{
        effect_type => 21,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {120,604800}
    };
conf(38020001) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {0,0}
    };
conf(38020002) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {101,604800}
    };
conf(38020003) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {102,604800}
    };
conf(38020004) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {103,604800}
    };
conf(38020005) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {104,604800}
    };
conf(38020006) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {105,604800}
    };
conf(38020007) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {106,604800}
    };
conf(38020008) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {107,604800}
    };
conf(38020009) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {108,604800}
    };
conf(38020010) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {109,604800}
    };
conf(38020011) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {110,604800}
    };
conf(38020012) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {111,604800}
    };
conf(38020013) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {112,604800}
    };
conf(38020014) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {113,604800}
    };
conf(38020015) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {114,604800}
    };
conf(38020016) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {115,604800}
    };
conf(38020017) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {116,604800}
    };
conf(38020018) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {117,604800}
    };
conf(38020019) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {118,604800}
    };
conf(38020020) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {119,604800}
    };
conf(38020021) ->
    #{
        effect_type => 22,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {120,604800}
    };
conf(38030001) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 101
    };
conf(38030002) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 102
    };
conf(38030003) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 103
    };
conf(38030004) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 104
    };
conf(38030005) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 105
    };
conf(38030006) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 106
    };
conf(38030007) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 107
    };
conf(38030008) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 108
    };
conf(38030009) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 109
    };
conf(38030010) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 110
    };
conf(38030011) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 111
    };
conf(38030012) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 112
    };
conf(38030013) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 113
    };
conf(38030014) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 114
    };
conf(38030015) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 115
    };
conf(38030016) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 116
    };
conf(38030017) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 117
    };
conf(38030018) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 118
    };
conf(38030019) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 119
    };
conf(38030020) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 120
    };
conf(38040001) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 201
    };
conf(38040002) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 202
    };
conf(38040003) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 203
    };
conf(38040004) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 204
    };
conf(38040005) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 205
    };
conf(38040006) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 206
    };
conf(38040007) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 207
    };
conf(38040008) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 208
    };
conf(38040009) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 209
    };
conf(38040010) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 210
    };
conf(38040011) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 211
    };
conf(38040012) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 212
    };
conf(38040013) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 213
    };
conf(38040014) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 214
    };
conf(38040015) ->
    #{
        effect_type => 23,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => 215
    };
conf(16490201) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 306101
    };
conf(16490202) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 306102
    };
conf(41010001) ->
    #{
        effect_type => 24,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {1,30}
    };
conf(41010002) ->
    #{
        effect_type => 24,
        use_lmt => [{1,1}],
        max_use_num => 1,
        effect => {2,30}
    };
conf(16590201) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 361001
    };
%%conf(16590202) ->
%%    #{
%%        effect_type => 1,
%%        use_lmt => [{1,1}],
%%        max_use_num => 300,
%%        effect => 361002
%%    };
%%conf(16590203) ->
%%    #{
%%        effect_type => 1,
%%        use_lmt => [{1,1}],
%%        max_use_num => 300,
%%        effect => 361003
%%    };
%%conf(16590204) ->
%%    #{
%%        effect_type => 1,
%%        use_lmt => [{1,1}],
%%        max_use_num => 300,
%%        effect => 361004
%%    };
%%conf(16590205) ->
%%    #{
%%        effect_type => 1,
%%        use_lmt => [{1,1}],
%%        max_use_num => 300,
%%        effect => 361005
%%    };
%%conf(16590206) ->
%%    #{
%%        effect_type => 1,
%%        use_lmt => [{1,1}],
%%        max_use_num => 300,
%%        effect => 361006
%%    };
conf(16590207) ->
    #{
        effect_type => 1,
        use_lmt => [{1,1}],
        max_use_num => 300,
        effect => 361007
    };
conf(_ID) ->
    undefined.


get(11010001) -> {390,90};
get(11020001) -> {100,20};
get(11030001) -> {500,75};
get(15010001) -> [{1,266111},{2,266091},{3,266101},{4,266081}];
get(15010002) -> [{1,266501},{2,266502},{3,266503},{4,266504}];
get(15010003) -> 286101;
get(15010004) -> 286102;
get(15010005) -> 286103;
get(15010006) -> 286104;
get(15010007) -> 230001;
get(15010011) -> 230002;
get(15010012) -> 230003;
get(15010013) -> 230017;
get(15010014) -> 230018;
get(15010015) -> 230020;
get(15010021) -> 230004;
get(15010022) -> 230005;
get(15010023) -> 230006;
get(15010024) -> 230007;
get(15010025) -> 230019;
get(15010031) -> 230008;
get(15010032) -> 230009;
get(15010033) -> 230010;
get(15010034) -> 230011;
get(15010041) -> 230012;
get(15010042) -> 230013;
get(15010043) -> 230014;
get(15010044) -> 230015;
get(15010045) -> 230016;
get(15010051) -> [{1,270011},{2,270021},{3,270031},{4,270041}];
get(15010052) -> [{1,270012},{2,270022},{3,270032},{4,270042}];
get(15010053) -> [{1,270013},{2,270023},{3,270033},{4,270043}];
get(15010054) -> [{1,270014},{2,270024},{3,270034},{4,270044}];
get(15010055) -> [{1,270015},{2,270025},{3,270035},{4,270045}];
get(15010056) -> [{1,270016},{2,270026},{3,270036},{4,270046}];
get(15010057) -> [{1,270017},{2,270027},{3,270037},{4,270047}];
get(15010058) -> [{1,270018},{2,270028},{3,270038},{4,270048}];
get(15010060) -> 270100;
get(15010061) -> 270101;
get(15010062) -> 270102;
get(15010063) -> 270103;
get(15010064) -> 270104;
get(15010065) -> 270105;
get(15010066) -> 270106;
get(15010067) -> 270107;
get(15010068) -> 270108;
get(15010071) -> 270201;
get(15010072) -> 270202;
get(15010073) -> 270203;
get(15010074) -> 270204;
get(15010075) -> 270205;
get(15010076) -> 270206;
get(15010077) -> 270207;
get(15010078) -> 270208;
get(15010079) -> 270209;
get(15010080) -> 270210;
get(15010081) -> 270211;
get(15010082) -> 270212;
get(15010083) -> {16270009,16270010,16270011,16270012};
get(15010084) -> 270214;
get(15010085) -> 270215;
get(15010086) -> 270216;
get(15010087) -> {16270001,16270002,16270003,16270004};
get(15010088) -> {16270005,16270006,16270007,16270008};
get(15010089) -> 270219;
get(15010090) -> 270220;
get(15010091) -> 270301;
get(15010092) -> 270302;
get(15010093) -> 270303;
get(15010101) -> 270401;
get(15010102) -> 270402;
get(15010103) -> 220016;
get(15010104) -> 220017;
get(15010105) -> 220018;
get(15010106) -> 220019;
get(15010107) -> 220020;
get(15010201) -> 270501;
get(15010202) -> 270502;
get(15010203) -> 270503;
get(15010204) -> 270504;
get(15010205) -> 270505;
get(15010206) -> 270506;
get(15010207) -> 270507;
get(15010208) -> 270508;
get(15010209) -> 270509;
get(15010301) -> 270601;
get(15010302) -> 270602;
get(15010303) -> 270603;
get(15010304) -> 270604;
get(15010305) -> 270605;
get(15010401) -> 270701;
get(15010402) -> 270702;
get(15010403) -> 270703;
get(15010404) -> 270704;
get(15010405) -> 270705;
get(15010406) -> 270706;
get(15010407) -> 270707;
get(15010408) -> 270708;
get(15010409) -> 270709;
get(15010501) -> 270901;
get(15010502) -> 270902;
get(15010503) -> 270903;
get(15010504) -> 270904;
get(15010505) -> 270905;
get(15010506) -> 270906;
get(15010507) -> 270907;
get(15010508) -> 270908;
get(15010509) -> 270909;
get(15010801) -> 270001;
get(15010802) -> 270002;
get(15010803) -> 270003;
get(15010804) -> 270004;
get(15010805) -> 270005;
get(15010806) -> 270006;
get(15010807) -> 270007;
get(15010808) -> 270008;
get(15010901) -> 286201;
get(15010902) -> 286202;
get(15010903) -> 286203;
get(15010904) -> 286204;
get(15010905) -> 286205;
get(15012001) -> 286301;
get(15012002) -> 286302;
get(15012003) -> 286303;
get(15013001) -> 286401;
get(15013002) -> 286402;
get(15013003) -> 286403;
get(15015001) -> 1;
get(15015002) -> 2;
get(15015003) -> 3;
get(15015004) -> 4;
get(15015005) -> 5;
get(15015006) -> 6;
get(15015007) -> 7;
get(15015008) -> 8;
get(15016001) -> 310001;
get(15016002) -> 310002;
get(15016003) -> 310003;
get(15016101) -> 310101;
get(15016102) -> 310102;
get(15016103) -> 310103;
get(15016104) -> 310104;
get(15016105) -> 310105;
get(15016106) -> 310106;
get(15016107) -> 310107;
get(15016108) -> 310108;
get(15016109) -> 310109;
get(15016110) -> 310110;
get(15016111) -> 310111;
get(15016112) -> 310112;
get(15016113) -> 310113;
get(15016114) -> 310114;
get(15016201) -> 310201;
get(15016202) -> 310202;
get(15017001) -> [{1,320101},{2,320102},{3,320103},{4,320104}];
get(15017002) -> [{1,320201},{2,320202},{3,320203},{4,320204}];
get(15017003) -> [{1,320301},{2,320302},{3,320303},{4,320304}];
get(15018001) -> 350001;
get(15020001) -> {15020002,15020003};
get(15020101) -> {15020002,15020003,15020004};
get(15020002) -> 270802;
get(15020003) -> 270803;
get(15020004) -> 270804;
get(15020005) -> {15020006,15020007};
get(15020105) -> {15020006,15020007,15020008};
get(15020006) -> 270806;
get(15020007) -> 270807;
get(15020008) -> 270808;
get(15020009) -> {15020010,15020011};
get(15020109) -> {15020010,15020011,15020012};
get(15020010) -> 270810;
get(15020011) -> 270811;
get(15020012) -> 270812;
get(15020013) -> {15020014,15020015};
get(15020113) -> {15020014,15020015,15020016};
get(15020014) -> 270814;
get(15020015) -> 270815;
get(15020016) -> 270816;
get(15020017) -> 270817;
get(15020018) -> 270818;
get(15020019) -> 270819;
get(15020020) -> 270820;
get(15020021) -> 270821;
get(15020041) -> 270822;
get(15020042) -> 270823;
get(15020043) -> 270824;
get(15020044) -> 270825;
get(15020045) -> 270826;
get(15020051) -> 270827;
get(15020052) -> 270828;
get(15020053) -> 270829;
get(15020054) -> 270830;
get(15020055) -> 270831;
get(15020031) -> 293011;
get(15020032) -> {35000010,35000011,35000012,35000013};
get(15030001) -> 220101;
get(15030002) -> 220102;
get(15030003) -> 220103;
get(15030004) -> 220104;
get(15030005) -> 220105;
get(15030006) -> 220106;
get(15030007) -> 220107;
get(15030008) -> 220108;
get(16120001) -> 1;
get(16120002) -> 10;
get(31010001) -> {1001,0};
get(31010101) -> {1002,0};
get(31010201) -> {1003,0};
get(31010301) -> {1004,0};
get(31010401) -> {1005,0};
get(31010501) -> {1006,0};
get(31010601) -> {1007,0};
get(31010701) -> {1008,0};
get(31010801) -> {1009,0};
get(31010901) -> {1010,0};
get(31011001) -> {1011,0};
get(31011101) -> {1012,0};
get(31020001) -> {1001,2592000};
get(31020101) -> {1002,2592000};
get(31020201) -> {1003,2592000};
get(31020301) -> {1004,2592000};
get(31020401) -> {1005,2592000};
get(31020501) -> {1006,2592000};
get(31020601) -> {1007,2592000};
get(31020701) -> {1008,2592000};
get(31020801) -> {1009,2592000};
get(31020901) -> {1010,2592000};
get(31021001) -> {1011,2592000};
get(31021101) -> {1012,2592000};
get(31030001) -> {1001,604800};
get(31030101) -> {1002,604800};
get(31030201) -> {1003,604800};
get(31030301) -> {1004,604800};
get(31030401) -> {1005,604800};
get(31030501) -> {1006,604800};
get(31030601) -> {1007,604800};
get(31030701) -> {1008,604800};
get(31030801) -> {1009,604800};
get(31030901) -> {1010,604800};
get(31031001) -> {1011,604800};
get(31031101) -> {1012,604800};
get(16170101) -> 10010011;
get(16170102) -> 10010012;
get(16170103) -> 10010013;
get(16170104) -> 10010014;
get(16170105) -> 10010015;
get(16170106) -> 10010016;
get(16170107) -> 10010017;
get(16170108) -> 10010018;
get(16170201) -> 10020011;
get(16170202) -> 10020012;
get(16170203) -> 10020013;
get(16170204) -> 10020014;
get(16170205) -> 10020015;
get(16170206) -> 10020016;
get(16170207) -> 10020017;
get(16170208) -> 10020018;
get(16170301) -> 10030011;
get(16170302) -> 10030012;
get(16170303) -> 10030013;
get(16170304) -> 10030014;
get(16170305) -> 10030015;
get(16170306) -> 10030016;
get(16170307) -> 10030017;
get(16170308) -> 10030018;
get(16170401) -> 10040011;
get(16170402) -> 10040012;
get(16170403) -> 10040013;
get(16170404) -> 10040014;
get(16170405) -> 10040015;
get(16170406) -> 10040016;
get(16170407) -> 10040017;
get(16170408) -> 10040018;
get(30010001) -> 1001;
get(30010002) -> 1002;
get(30010003) -> 1003;
get(30010004) -> 1004;
get(30010005) -> 1005;
get(30010006) -> 1006;
get(30010007) -> 1007;
get(30010008) -> 1008;
get(30010009) -> 1009;
get(30010010) -> 1010;
get(30010011) -> 1011;
get(30010012) -> 1012;
get(30010013) -> 1013;
get(30010014) -> 1014;
get(30010015) -> 1015;
get(30010016) -> 1016;
get(30010017) -> 1017;
get(30010018) -> 1018;
get(30010019) -> 1019;
get(30010020) -> 1020;
get(30010021) -> 1021;
get(30010022) -> 1022;
get(30010023) -> 1023;
get(30010024) -> 1024;
get(30010025) -> 1025;
get(30010026) -> 1026;
get(30010027) -> 1027;
get(30010028) -> 1028;
get(30010029) -> 1029;
get(30010030) -> 1030;
get(30010101) -> 2001;
get(30010102) -> 2002;
get(30010103) -> 2003;
get(30010104) -> 2004;
get(30010105) -> 2005;
get(30010106) -> 2006;
get(30010107) -> 2007;
get(30010108) -> 2008;
get(30010109) -> 2009;
get(30010201) -> 3001;
get(30010202) -> 3001;
get(30010203) -> 3001;
get(30010301) -> 4001;
get(30010302) -> 4002;
get(30010303) -> 4003;
get(30010304) -> 4004;
get(30010401) -> 5001;
get(30010402) -> 5002;
get(30010403) -> 5003;
get(30010499) -> 5099;
get(30010501) -> 6001;
get(30010502) -> 6002;
get(30010503) -> 6003;
get(30010504) -> 6004;
get(30010505) -> 6005;
get(30010506) -> 6006;
get(30010507) -> 6007;
get(30010508) -> 6008;
get(30010509) -> 6009;
get(30010510) -> 6010;
get(30010511) -> 6011;
get(30010512) -> 6012;
get(30010513) -> 6013;
get(30010514) -> 6014;
get(30010515) -> 6015;
get(30010516) -> 6016;
get(30010517) -> 6017;
get(30010518) -> 6018;
get(30010519) -> 6019;
get(30010520) -> 6020;
get(30010521) -> 6021;
get(30010522) -> 6022;
get(30010523) -> 6023;
get(30010524) -> 6024;
get(30010525) -> 6025;
get(30010526) -> 6026;
get(30010527) -> 6027;
get(30010528) -> 6028;
get(30010601) -> 9001;
get(30010602) -> 9002;
get(30010603) -> 9003;
get(30010604) -> 9004;
get(30010605) -> 9005;
get(30010606) -> 9006;
get(30010607) -> 9007;
get(30010608) -> 9008;
get(30010701) -> 10001;
get(33011000) -> {33011002,33011001};
get(33011001) -> {1001,{1,1},{1,1}};
get(33011002) -> {1002,{1,1},{1,1}};
get(33011003) -> {1003,{0,0},{1,1}};
get(33011004) -> {1004,{0,0},{1,1}};
get(33011005) -> {1005,{0,0},{1,1}};
get(33011006) -> {1006,{0,0},{1,1}};
get(33011007) -> {1007,{0,0},{1,1}};
get(33011008) -> {1008,{0,0},{1,1}};
get(33011009) -> {1009,{0,0},{1,1}};
get(33011010) -> {1010,{0,0},{1,1}};
get(33011011) -> {1011,{0,0},{1,1}};
get(33011012) -> {1012,{0,0},{1,1}};
get(33011013) -> {1013,{0,0},{1,1}};
get(33011014) -> {1014,{0,0},{1,1}};
get(33011015) -> {1015,{0,0},{1,1}};
get(33011016) -> {1016,{0,0},{1,1}};
get(33011017) -> {1017,{7,7},{5,5}};
get(33011018) -> {1018,{0,0},{1,1}};
get(33011019) -> {1019,{0,0},{1,1}};
get(33011020) -> {1020,{0,0},{1,1}};
get(33011021) -> {1021,{0,0},{1,1}};
get(33011022) -> {1022,{0,0},{1,1}};
get(33011023) -> {1023,{0,0},{1,1}};
get(33011024) -> {1024,{0,0},{1,1}};
get(33011025) -> {1025,{0,0},{1,1}};
get(33011026) -> {1026,{0,0},{1,1}};
get(33021001) -> {2001,{9,9},{5,5}};
get(33021002) -> {2002,{9,9},{5,5}};
get(33021003) -> {2003,{9,9},{5,5}};
get(16410001) -> [{1,1101},{2,1201},{3,1301},{4,1401}];
get(16410002) -> [{1,1102},{2,1202},{3,1302},{4,1402}];
get(16410003) -> [{1,1103},{2,1203},{3,1303},{4,1403}];
get(16410004) -> [{1,1104},{2,1204},{3,1304},{4,1404}];
get(16410005) -> [{1,1105},{2,1205},{3,1305},{4,1405}];
get(16410006) -> [];
get(16410007) -> [];
get(16410008) -> [];
get(16410009) -> [{1,1503},{2,1503},{3,1503},{4,1503}];
get(16410010) -> [{1,1504},{2,1504},{3,1504},{4,1504}];
get(32010000) -> {32010001,32010002};
get(32010001) -> {1,0};
get(32010002) -> {2,0};
get(32010003) -> {3,0};
get(32010004) -> {4,0};
get(32010005) -> {5,0};
get(32010006) -> {6,0};
get(32010007) -> {7,0};
get(32010008) -> {8,0};
get(32010009) -> {9,0};
get(32010010) -> {10,0};
get(32010011) -> {11,0};
get(32020001) -> {1,2592000};
get(32020002) -> {2,2592000};
get(32020003) -> {3,2592000};
get(32020004) -> {4,2592000};
get(32020005) -> {5,2592000};
get(32020006) -> {6,2592000};
get(32020007) -> {7,2592000};
get(32020008) -> {8,2592000};
get(32020009) -> {9,2592000};
get(32020010) -> {10,2592000};
get(32020011) -> {11,2592000};
get(32030001) -> {1,604800};
get(32030002) -> {2,604800};
get(32030003) -> {3,604800};
get(32030004) -> {4,604800};
get(32030005) -> {5,604800};
get(32030006) -> {6,604800};
get(32030007) -> {7,604800};
get(32030008) -> {8,604800};
get(32030009) -> {9,604800};
get(32030010) -> {10,604800};
get(32030011) -> {11,604800};
get(16310201) -> 1;
get(16110001) -> 1;
get(16110002) -> 550000;
get(16460001) -> 1001;
get(16460002) -> 1002;
get(16460003) -> 1003;
get(16460010) -> 1010;
get(16460011) -> 1011;
get(16460012) -> 1012;
get(16460013) -> 1013;
get(16460014) -> 1014;
get(16460021) -> 1021;
get(16460022) -> 1022;
get(16460023) -> 1023;
get(16460024) -> 1024;
get(16460025) -> 1025;
get(16460026) -> 1026;
get(16460027) -> 1027;
get(15010421) -> 280801;
get(15010422) -> 280802;
get(15010423) -> 280803;
get(15010424) -> 280804;
get(15010425) -> 280805;
get(15010426) -> 280806;
get(15010427) -> 280807;
get(15010428) -> 280808;
get(15010429) -> 280809;
get(15010431) -> 281801;
get(15010432) -> 281802;
get(15010433) -> 281803;
get(15010434) -> 281804;
get(15010435) -> 281805;
get(15010436) -> 281806;
get(15010437) -> 281807;
get(15010438) -> 281808;
get(15010439) -> 281809;
get(15010441) -> 282801;
get(15010442) -> 282802;
get(15010443) -> 282803;
get(15010444) -> 282804;
get(15010445) -> 282805;
get(15010446) -> 282806;
get(15010447) -> 282807;
get(15010448) -> 282808;
get(15010449) -> 282809;
get(15010451) -> 283801;
get(15010452) -> 283802;
get(15010453) -> 283803;
get(15010454) -> 283804;
get(15010455) -> 283805;
get(15010456) -> 283806;
get(15010457) -> 283807;
get(15010458) -> 283808;
get(15010459) -> 283809;
get(15010521) -> 280901;
get(15010522) -> 280902;
get(15010523) -> 280903;
get(15010524) -> 280904;
get(15010525) -> 280905;
get(15010526) -> 280906;
get(15010527) -> 280907;
get(15010528) -> 280908;
get(15010529) -> 280909;
get(15010531) -> 281901;
get(15010532) -> 281902;
get(15010533) -> 281903;
get(15010534) -> 281904;
get(15010535) -> 281905;
get(15010536) -> 281906;
get(15010537) -> 281907;
get(15010538) -> 281908;
get(15010539) -> 281909;
get(15010541) -> 282901;
get(15010542) -> 282902;
get(15010543) -> 282903;
get(15010544) -> 282904;
get(15010545) -> 282905;
get(15010546) -> 282906;
get(15010547) -> 282907;
get(15010548) -> 282908;
get(15010549) -> 282909;
get(15010551) -> 283901;
get(15010552) -> 283902;
get(15010553) -> 283903;
get(15010554) -> 283904;
get(15010555) -> 283905;
get(15010556) -> 283906;
get(15010557) -> 283907;
get(15010558) -> 283908;
get(15010559) -> 283909;
get(15010601) -> 286001;
get(15010602) -> 286002;
get(15010603) -> 286003;
get(15010604) -> 286004;
get(15010605) -> 286005;
get(15010606) -> 286006;
get(15010607) -> 286007;
get(15010608) -> 286008;
get(15010609) -> 286009;
get(15011001) -> 132101;
get(15011002) -> 132102;
get(15011003) -> 132103;
get(15011004) -> 132104;
get(15050001) -> 304001;
get(15050002) -> 304002;
get(15050003) -> 304003;
get(15050004) -> 304004;
get(15050005) -> 304005;
get(15060001) -> 307001;
get(15060002) -> 307002;
get(15060003) -> 307003;
get(15070001) -> 350101;
get(16119001) -> 1000000000;
get(16119002) -> 292001;
get(16211001) -> 1;
get(16211002) -> 2;
get(16211003) -> 3;
get(16211004) -> 4;
get(16211005) -> 5;
get(16211006) -> 6;
get(16211007) -> 7;
get(16211008) -> 8;
get(16211009) -> 9;
get(16211010) -> 10;
get(16211011) -> 11;
get(16211012) -> 12;
get(16211013) -> 13;
get(16211014) -> 14;
get(16211015) -> 15;
get(16211016) -> 16;
get(16211017) -> 17;
get(16211018) -> 18;
get(16211019) -> 19;
get(16211020) -> 20;
get(16211021) -> 21;
get(16211022) -> 22;
get(16211023) -> 23;
get(16211024) -> 24;
get(16211025) -> 25;
get(16211026) -> 26;
get(16211027) -> 27;
get(16211028) -> 28;
get(16211029) -> 29;
get(16211030) -> 30;
get(16211031) -> 31;
get(16211032) -> 32;
get(16480401) -> {101,2592000};
get(16480402) -> {102,2592000};
get(16480403) -> {103,2592000};
get(16480404) -> {104,2592000};
get(16480405) -> {201,0};
get(16480406) -> {202,0};
get(16480407) -> {203,0};
get(16480408) -> {204,0};
get(16480409) -> {205,0};
get(16480410) -> {206,0};
get(16480411) -> {207,0};
get(16360001) -> 0;
get(16320001) -> 0;
get(38010001) -> {0,0};
get(38010002) -> {101,604800};
get(38010003) -> {102,604800};
get(38010004) -> {103,604800};
get(38010005) -> {104,604800};
get(38010006) -> {105,604800};
get(38010007) -> {106,604800};
get(38010008) -> {107,604800};
get(38010009) -> {108,604800};
get(38010010) -> {109,604800};
get(38010011) -> {110,604800};
get(38010012) -> {111,604800};
get(38010013) -> {112,604800};
get(38010014) -> {113,604800};
get(38010015) -> {114,604800};
get(38010016) -> {115,604800};
get(38010017) -> {116,604800};
get(38010018) -> {117,604800};
get(38010019) -> {118,604800};
get(38010020) -> {119,604800};
get(38010021) -> {120,604800};
get(38020001) -> {0,0};
get(38020002) -> {101,604800};
get(38020003) -> {102,604800};
get(38020004) -> {103,604800};
get(38020005) -> {104,604800};
get(38020006) -> {105,604800};
get(38020007) -> {106,604800};
get(38020008) -> {107,604800};
get(38020009) -> {108,604800};
get(38020010) -> {109,604800};
get(38020011) -> {110,604800};
get(38020012) -> {111,604800};
get(38020013) -> {112,604800};
get(38020014) -> {113,604800};
get(38020015) -> {114,604800};
get(38020016) -> {115,604800};
get(38020017) -> {116,604800};
get(38020018) -> {117,604800};
get(38020019) -> {118,604800};
get(38020020) -> {119,604800};
get(38020021) -> {120,604800};
get(38030001) -> 101;
get(38030002) -> 102;
get(38030003) -> 103;
get(38030004) -> 104;
get(38030005) -> 105;
get(38030006) -> 106;
get(38030007) -> 107;
get(38030008) -> 108;
get(38030009) -> 109;
get(38030010) -> 110;
get(38030011) -> 111;
get(38030012) -> 112;
get(38030013) -> 113;
get(38030014) -> 114;
get(38030015) -> 115;
get(38030016) -> 116;
get(38030017) -> 117;
get(38030018) -> 118;
get(38030019) -> 119;
get(38030020) -> 120;
get(38040001) -> 201;
get(38040002) -> 202;
get(38040003) -> 203;
get(38040004) -> 204;
get(38040005) -> 205;
get(38040006) -> 206;
get(38040007) -> 207;
get(38040008) -> 208;
get(38040009) -> 209;
get(38040010) -> 210;
get(38040011) -> 211;
get(38040012) -> 212;
get(38040013) -> 213;
get(38040014) -> 214;
get(38040015) -> 215;
get(16490201) -> 306101;
get(16490202) -> 306102;
get(41010001) -> {1,30};
get(41010002) -> {2,30};
get(_ID) -> undefined.
