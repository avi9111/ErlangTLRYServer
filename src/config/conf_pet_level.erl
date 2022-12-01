%% -*- coding: latin-1 -*-
%%----------------------------------
%% Statements:
%% @module      珍兽等级配置
%% @author      cablsbs
%%----------------------------------
-module(conf_pet_level).

-export([
    get_attr/2,
    exp_factor/1,
    upgrade_exp/1
]).

%% @doc 获取升级所需经验
%% @spec upgrade_exp(Level) -> Exp.
%% Level = Exp  :: integer()
upgrade_exp(1) -> 12;
upgrade_exp(2) -> 32;
upgrade_exp(3) -> 68;
upgrade_exp(4) -> 120;
upgrade_exp(5) -> 191;
upgrade_exp(6) -> 284;
upgrade_exp(7) -> 400;
upgrade_exp(8) -> 543;
upgrade_exp(9) -> 716;
upgrade_exp(10) -> 922;
upgrade_exp(11) -> 1165;
upgrade_exp(12) -> 1449;
upgrade_exp(13) -> 1778;
upgrade_exp(14) -> 2158;
upgrade_exp(15) -> 2593;
upgrade_exp(16) -> 3090;
upgrade_exp(17) -> 3655;
upgrade_exp(18) -> 4295;
upgrade_exp(19) -> 4987;
upgrade_exp(20) -> 5829;
upgrade_exp(21) -> 6740;
upgrade_exp(22) -> 7761;
upgrade_exp(23) -> 8901;
upgrade_exp(24) -> 10171;
upgrade_exp(25) -> 11585;
upgrade_exp(26) -> 13813;
upgrade_exp(27) -> 16386;
upgrade_exp(28) -> 18506;
upgrade_exp(29) -> 20851;
upgrade_exp(30) -> 22374;
upgrade_exp(31) -> 23904;
upgrade_exp(32) -> 26763;
upgrade_exp(33) -> 30632;
upgrade_exp(34) -> 33365;
upgrade_exp(35) -> 37162;
upgrade_exp(36) -> 41327;
upgrade_exp(37) -> 45862;
upgrade_exp(38) -> 50892;
upgrade_exp(39) -> 54673;
upgrade_exp(40) -> 58606;
upgrade_exp(41) -> 62685;
upgrade_exp(42) -> 66901;
upgrade_exp(43) -> 71242;
upgrade_exp(44) -> 75694;
upgrade_exp(45) -> 80240;
upgrade_exp(46) -> 84859;
upgrade_exp(47) -> 89525;
upgrade_exp(48) -> 94210;
upgrade_exp(49) -> 98878;
upgrade_exp(50) -> 103491;
upgrade_exp(51) -> 108001;
upgrade_exp(52) -> 112261;
upgrade_exp(53) -> 116494;
upgrade_exp(54) -> 120348;
upgrade_exp(55) -> 134374;
upgrade_exp(56) -> 146181;
upgrade_exp(57) -> 167986;
upgrade_exp(58) -> 191835;
upgrade_exp(59) -> 221520;
upgrade_exp(60) -> 252896;
upgrade_exp(61) -> 287957;
upgrade_exp(62) -> 327082;
upgrade_exp(63) -> 370686;
upgrade_exp(64) -> 419224;
upgrade_exp(65) -> 473191;
upgrade_exp(66) -> 529812;
upgrade_exp(67) -> 599630;
upgrade_exp(68) -> 673339;
upgrade_exp(69) -> 754960;
upgrade_exp(70) -> 845261;
upgrade_exp(71) -> 945080;
upgrade_exp(72) -> 1055328;
upgrade_exp(73) -> 1176999;
upgrade_exp(74) -> 1311175;
upgrade_exp(75) -> 1459033;
upgrade_exp(76) -> 1628216;
upgrade_exp(77) -> 1801036;
upgrade_exp(78) -> 1998092;
upgrade_exp(79) -> 2214670;
upgrade_exp(80) -> 2452561;
upgrade_exp(81) -> 2713714;
upgrade_exp(82) -> 3000241;
upgrade_exp(83) -> 3314440;
upgrade_exp(84) -> 3658802;
upgrade_exp(85) -> 4036035;
upgrade_exp(86) -> 4453642;
upgrade_exp(87) -> 4901104;
upgrade_exp(88) -> 5395580;
upgrade_exp(89) -> 5936250;
upgrade_exp(90) -> 6527173;
upgrade_exp(91) -> 7172754;
upgrade_exp(92) -> 7877762;
upgrade_exp(93) -> 8647365;
upgrade_exp(94) -> 9487163;
upgrade_exp(95) -> 10403219;
upgrade_exp(96) -> 11402097;
upgrade_exp(97) -> 12490905;
upgrade_exp(98) -> 13677335;
upgrade_exp(99) -> 14969713;
upgrade_exp(100) -> 16377045;
upgrade_exp(101) -> 17909076;
upgrade_exp(102) -> 19576343;
upgrade_exp(103) -> 21390246;
upgrade_exp(104) -> 23363106;
upgrade_exp(_Star) -> 0.

exp_factor(1) ->
    1;
exp_factor(2) ->
    1.0012000000000001;
exp_factor(3) ->
    1.0024000000000002;
exp_factor(4) ->
    1.0036000000000003;
exp_factor(5) ->
    1.0048000000000004;
exp_factor(6) ->
    1.0060000000000004;
exp_factor(7) ->
    1.0072000000000005;
exp_factor(8) ->
    1.0084000000000006;
exp_factor(9) ->
    1.0096000000000007;
exp_factor(10) ->
    1.0108000000000008;
exp_factor(11) ->
    1.0120000000000009;
exp_factor(12) ->
    1.013200000000001;
exp_factor(13) ->
    1.0144000000000011;
exp_factor(14) ->
    1.0156000000000012;
exp_factor(15) ->
    1.0168000000000013;
exp_factor(16) ->
    1.0180000000000013;
exp_factor(17) ->
    1.0192000000000014;
exp_factor(18) ->
    1.0204000000000015;
exp_factor(19) ->
    1.0216000000000016;
exp_factor(20) ->
    1.0230000000000017;
exp_factor(21) ->
    1.0246000000000017;
exp_factor(22) ->
    1.0264000000000018;
exp_factor(23) ->
    1.0284000000000018;
exp_factor(24) ->
    1.0306000000000017;
exp_factor(25) ->
    1.0330000000000017;
exp_factor(26) ->
    1.0356000000000016;
exp_factor(27) ->
    1.0384000000000015;
exp_factor(28) ->
    1.0414000000000014;
exp_factor(29) ->
    1.0446000000000015;
exp_factor(30) ->
    1.0480000000000016;
exp_factor(31) ->
    1.0516000000000016;
exp_factor(32) ->
    1.0554000000000017;
exp_factor(33) ->
    1.0594000000000017;
exp_factor(34) ->
    1.0636000000000017;
exp_factor(35) ->
    1.0680000000000016;
exp_factor(36) ->
    1.0726000000000016;
exp_factor(37) ->
    1.0774000000000015;
exp_factor(38) ->
    1.0824000000000014;
exp_factor(39) ->
    1.0876000000000015;
exp_factor(40) ->
    1.0930000000000015;
exp_factor(41) ->
    1.0986000000000016;
exp_factor(42) ->
    1.1044000000000016;
exp_factor(43) ->
    1.1104000000000016;
exp_factor(44) ->
    1.1166000000000016;
exp_factor(45) ->
    1.1230000000000016;
exp_factor(46) ->
    1.1296000000000015;
exp_factor(47) ->
    1.1364000000000014;
exp_factor(48) ->
    1.1434000000000013;
exp_factor(49) ->
    1.1506000000000014;
exp_factor(50) ->
    1.1580000000000015;
exp_factor(51) ->
    1.1656000000000015;
exp_factor(52) ->
    1.1734000000000016;
exp_factor(53) ->
    1.1814000000000016;
exp_factor(54) ->
    1.1896000000000015;
exp_factor(55) ->
    1.1980000000000015;
exp_factor(56) ->
    1.2066000000000014;
exp_factor(57) ->
    1.2154000000000014;
exp_factor(58) ->
    1.2244000000000013;
exp_factor(59) ->
    1.2336000000000014;
exp_factor(60) ->
    1.2432000000000014;
exp_factor(61) ->
    1.2532000000000014;
exp_factor(62) ->
    1.2636000000000014;
exp_factor(63) ->
    1.2744000000000013;
exp_factor(64) ->
    1.2856000000000014;
exp_factor(65) ->
    1.2972000000000015;
exp_factor(66) ->
    1.3092000000000015;
exp_factor(67) ->
    1.3216000000000014;
exp_factor(68) ->
    1.3344000000000014;
exp_factor(69) ->
    1.3476000000000015;
exp_factor(70) ->
    1.3612000000000015;
exp_factor(71) ->
    1.3752000000000015;
exp_factor(72) ->
    1.3896000000000015;
exp_factor(73) ->
    1.4044000000000014;
exp_factor(74) ->
    1.4196000000000013;
exp_factor(75) ->
    1.4356000000000013;
exp_factor(76) ->
    1.4526000000000012;
exp_factor(77) ->
    1.4708000000000012;
exp_factor(78) ->
    1.4904000000000013;
exp_factor(79) ->
    1.5116000000000012;
exp_factor(80) ->
    1.5346000000000011;
exp_factor(81) ->
    1.559600000000001;
exp_factor(82) ->
    1.5868000000000009;
exp_factor(83) ->
    1.6164000000000009;
exp_factor(84) ->
    1.648600000000001;
exp_factor(85) ->
    1.6839000000000008;
exp_factor(86) ->
    1.7228000000000008;
exp_factor(87) ->
    1.7658000000000007;
exp_factor(88) ->
    1.8134000000000008;
exp_factor(89) ->
    1.8661000000000008;
exp_factor(90) ->
    1.9244000000000008;
exp_factor(91) ->
    1.9888000000000008;
exp_factor(92) ->
    2.059800000000001;
exp_factor(93) ->
    2.137900000000001;
exp_factor(94) ->
    2.2236000000000011;
exp_factor(95) ->
    2.317400000000001;
exp_factor(96) ->
    2.4198000000000008;
exp_factor(97) ->
    2.5313000000000008;
exp_factor(98) ->
    2.652400000000001;
exp_factor(99) ->
    2.7836000000000012;
exp_factor(100) ->
    2.9254000000000011;
exp_factor(101) ->
    3.0783000000000014;
exp_factor(102) ->
    3.2428000000000012;
exp_factor(103) ->
    3.4194000000000013;
exp_factor(104) ->
    3.6086000000000014;
exp_factor(_Level) ->
    0.

%% @doc 获取等级基础属性
%% @spec get_attr(Level, AtkType) -> BaseAttrL.
%% Level = Exp  :: integer()
get_attr(1, AtkType) ->
    if
        AtkType =:= 1 -> [{1,7},{2,1},{3,3},{4,3},{5,3}];
        AtkType =:= 2 -> [{1,1},{2,7},{3,3},{4,3},{5,3}];
        AtkType =:= 3 -> [{1,3},{2,3},{3,6},{4,3},{5,3}];
        true -> []
    end;
get_attr(2, AtkType) ->
    if
        AtkType =:= 1 -> [{1,14},{2,2},{3,6},{4,6},{5,6}];
        AtkType =:= 2 -> [{1,2},{2,14},{3,6},{4,6},{5,6}];
        AtkType =:= 3 -> [{1,5},{2,5},{3,12},{4,6},{5,6}];
        true -> []
    end;
get_attr(3, AtkType) ->
    if
        AtkType =:= 1 -> [{1,21},{2,3},{3,9},{4,9},{5,9}];
        AtkType =:= 2 -> [{1,3},{2,21},{3,9},{4,9},{5,9}];
        AtkType =:= 3 -> [{1,8},{2,7},{3,18},{4,9},{5,9}];
        true -> []
    end;
get_attr(4, AtkType) ->
    if
        AtkType =:= 1 -> [{1,28},{2,4},{3,12},{4,12},{5,12}];
        AtkType =:= 2 -> [{1,4},{2,28},{3,12},{4,12},{5,12}];
        AtkType =:= 3 -> [{1,10},{2,10},{3,24},{4,12},{5,12}];
        true -> []
    end;
get_attr(5, AtkType) ->
    if
        AtkType =:= 1 -> [{1,35},{2,5},{3,15},{4,15},{5,15}];
        AtkType =:= 2 -> [{1,5},{2,35},{3,15},{4,15},{5,15}];
        AtkType =:= 3 -> [{1,13},{2,12},{3,30},{4,15},{5,15}];
        true -> []
    end;
get_attr(6, AtkType) ->
    if
        AtkType =:= 1 -> [{1,42},{2,6},{3,18},{4,18},{5,18}];
        AtkType =:= 2 -> [{1,6},{2,42},{3,18},{4,18},{5,18}];
        AtkType =:= 3 -> [{1,15},{2,15},{3,36},{4,18},{5,18}];
        true -> []
    end;
get_attr(7, AtkType) ->
    if
        AtkType =:= 1 -> [{1,49},{2,7},{3,21},{4,21},{5,21}];
        AtkType =:= 2 -> [{1,7},{2,49},{3,21},{4,21},{5,21}];
        AtkType =:= 3 -> [{1,18},{2,17},{3,42},{4,21},{5,21}];
        true -> []
    end;
get_attr(8, AtkType) ->
    if
        AtkType =:= 1 -> [{1,56},{2,8},{3,24},{4,24},{5,24}];
        AtkType =:= 2 -> [{1,8},{2,56},{3,24},{4,24},{5,24}];
        AtkType =:= 3 -> [{1,20},{2,20},{3,48},{4,24},{5,24}];
        true -> []
    end;
get_attr(9, AtkType) ->
    if
        AtkType =:= 1 -> [{1,63},{2,9},{3,27},{4,27},{5,27}];
        AtkType =:= 2 -> [{1,9},{2,63},{3,27},{4,27},{5,27}];
        AtkType =:= 3 -> [{1,23},{2,22},{3,54},{4,27},{5,27}];
        true -> []
    end;
get_attr(10, AtkType) ->
    if
        AtkType =:= 1 -> [{1,70},{2,10},{3,30},{4,30},{5,30}];
        AtkType =:= 2 -> [{1,10},{2,70},{3,30},{4,30},{5,30}];
        AtkType =:= 3 -> [{1,25},{2,25},{3,60},{4,30},{5,30}];
        true -> []
    end;
get_attr(11, AtkType) ->
    if
        AtkType =:= 1 -> [{1,77},{2,11},{3,33},{4,33},{5,33}];
        AtkType =:= 2 -> [{1,11},{2,77},{3,33},{4,33},{5,33}];
        AtkType =:= 3 -> [{1,28},{2,27},{3,66},{4,33},{5,33}];
        true -> []
    end;
get_attr(12, AtkType) ->
    if
        AtkType =:= 1 -> [{1,84},{2,12},{3,36},{4,36},{5,36}];
        AtkType =:= 2 -> [{1,12},{2,84},{3,36},{4,36},{5,36}];
        AtkType =:= 3 -> [{1,30},{2,30},{3,72},{4,36},{5,36}];
        true -> []
    end;
get_attr(13, AtkType) ->
    if
        AtkType =:= 1 -> [{1,91},{2,13},{3,39},{4,39},{5,39}];
        AtkType =:= 2 -> [{1,13},{2,91},{3,39},{4,39},{5,39}];
        AtkType =:= 3 -> [{1,33},{2,32},{3,78},{4,39},{5,39}];
        true -> []
    end;
get_attr(14, AtkType) ->
    if
        AtkType =:= 1 -> [{1,98},{2,14},{3,42},{4,42},{5,42}];
        AtkType =:= 2 -> [{1,14},{2,98},{3,42},{4,42},{5,42}];
        AtkType =:= 3 -> [{1,35},{2,35},{3,84},{4,42},{5,42}];
        true -> []
    end;
get_attr(15, AtkType) ->
    if
        AtkType =:= 1 -> [{1,105},{2,15},{3,45},{4,45},{5,45}];
        AtkType =:= 2 -> [{1,15},{2,105},{3,45},{4,45},{5,45}];
        AtkType =:= 3 -> [{1,38},{2,37},{3,90},{4,45},{5,45}];
        true -> []
    end;
get_attr(16, AtkType) ->
    if
        AtkType =:= 1 -> [{1,112},{2,16},{3,48},{4,48},{5,48}];
        AtkType =:= 2 -> [{1,16},{2,112},{3,48},{4,48},{5,48}];
        AtkType =:= 3 -> [{1,40},{2,40},{3,96},{4,48},{5,48}];
        true -> []
    end;
get_attr(17, AtkType) ->
    if
        AtkType =:= 1 -> [{1,119},{2,17},{3,51},{4,51},{5,51}];
        AtkType =:= 2 -> [{1,17},{2,119},{3,51},{4,51},{5,51}];
        AtkType =:= 3 -> [{1,43},{2,42},{3,102},{4,51},{5,51}];
        true -> []
    end;
get_attr(18, AtkType) ->
    if
        AtkType =:= 1 -> [{1,126},{2,18},{3,54},{4,54},{5,54}];
        AtkType =:= 2 -> [{1,18},{2,126},{3,54},{4,54},{5,54}];
        AtkType =:= 3 -> [{1,45},{2,45},{3,108},{4,54},{5,54}];
        true -> []
    end;
get_attr(19, AtkType) ->
    if
        AtkType =:= 1 -> [{1,133},{2,19},{3,57},{4,57},{5,57}];
        AtkType =:= 2 -> [{1,19},{2,133},{3,57},{4,57},{5,57}];
        AtkType =:= 3 -> [{1,48},{2,47},{3,114},{4,57},{5,57}];
        true -> []
    end;
get_attr(20, AtkType) ->
    if
        AtkType =:= 1 -> [{1,140},{2,20},{3,60},{4,60},{5,60}];
        AtkType =:= 2 -> [{1,20},{2,140},{3,60},{4,60},{5,60}];
        AtkType =:= 3 -> [{1,50},{2,50},{3,120},{4,60},{5,60}];
        true -> []
    end;
get_attr(21, AtkType) ->
    if
        AtkType =:= 1 -> [{1,147},{2,21},{3,63},{4,63},{5,63}];
        AtkType =:= 2 -> [{1,21},{2,147},{3,63},{4,63},{5,63}];
        AtkType =:= 3 -> [{1,53},{2,52},{3,126},{4,63},{5,63}];
        true -> []
    end;
get_attr(22, AtkType) ->
    if
        AtkType =:= 1 -> [{1,154},{2,22},{3,66},{4,66},{5,66}];
        AtkType =:= 2 -> [{1,22},{2,154},{3,66},{4,66},{5,66}];
        AtkType =:= 3 -> [{1,55},{2,55},{3,132},{4,66},{5,66}];
        true -> []
    end;
get_attr(23, AtkType) ->
    if
        AtkType =:= 1 -> [{1,161},{2,23},{3,69},{4,69},{5,69}];
        AtkType =:= 2 -> [{1,23},{2,161},{3,69},{4,69},{5,69}];
        AtkType =:= 3 -> [{1,58},{2,57},{3,138},{4,69},{5,69}];
        true -> []
    end;
get_attr(24, AtkType) ->
    if
        AtkType =:= 1 -> [{1,168},{2,24},{3,72},{4,72},{5,72}];
        AtkType =:= 2 -> [{1,24},{2,168},{3,72},{4,72},{5,72}];
        AtkType =:= 3 -> [{1,60},{2,60},{3,144},{4,72},{5,72}];
        true -> []
    end;
get_attr(25, AtkType) ->
    if
        AtkType =:= 1 -> [{1,175},{2,25},{3,75},{4,75},{5,75}];
        AtkType =:= 2 -> [{1,25},{2,175},{3,75},{4,75},{5,75}];
        AtkType =:= 3 -> [{1,63},{2,62},{3,150},{4,75},{5,75}];
        true -> []
    end;
get_attr(26, AtkType) ->
    if
        AtkType =:= 1 -> [{1,182},{2,26},{3,78},{4,78},{5,78}];
        AtkType =:= 2 -> [{1,26},{2,182},{3,78},{4,78},{5,78}];
        AtkType =:= 3 -> [{1,65},{2,65},{3,156},{4,78},{5,78}];
        true -> []
    end;
get_attr(27, AtkType) ->
    if
        AtkType =:= 1 -> [{1,189},{2,27},{3,81},{4,81},{5,81}];
        AtkType =:= 2 -> [{1,27},{2,189},{3,81},{4,81},{5,81}];
        AtkType =:= 3 -> [{1,68},{2,67},{3,162},{4,81},{5,81}];
        true -> []
    end;
get_attr(28, AtkType) ->
    if
        AtkType =:= 1 -> [{1,196},{2,28},{3,84},{4,84},{5,84}];
        AtkType =:= 2 -> [{1,28},{2,196},{3,84},{4,84},{5,84}];
        AtkType =:= 3 -> [{1,70},{2,70},{3,168},{4,84},{5,84}];
        true -> []
    end;
get_attr(29, AtkType) ->
    if
        AtkType =:= 1 -> [{1,203},{2,29},{3,87},{4,87},{5,87}];
        AtkType =:= 2 -> [{1,29},{2,203},{3,87},{4,87},{5,87}];
        AtkType =:= 3 -> [{1,73},{2,72},{3,174},{4,87},{5,87}];
        true -> []
    end;
get_attr(30, AtkType) ->
    if
        AtkType =:= 1 -> [{1,210},{2,30},{3,90},{4,90},{5,90}];
        AtkType =:= 2 -> [{1,30},{2,210},{3,90},{4,90},{5,90}];
        AtkType =:= 3 -> [{1,75},{2,75},{3,180},{4,90},{5,90}];
        true -> []
    end;
get_attr(31, AtkType) ->
    if
        AtkType =:= 1 -> [{1,217},{2,31},{3,93},{4,93},{5,93}];
        AtkType =:= 2 -> [{1,31},{2,217},{3,93},{4,93},{5,93}];
        AtkType =:= 3 -> [{1,78},{2,77},{3,186},{4,93},{5,93}];
        true -> []
    end;
get_attr(32, AtkType) ->
    if
        AtkType =:= 1 -> [{1,224},{2,32},{3,96},{4,96},{5,96}];
        AtkType =:= 2 -> [{1,32},{2,224},{3,96},{4,96},{5,96}];
        AtkType =:= 3 -> [{1,80},{2,80},{3,192},{4,96},{5,96}];
        true -> []
    end;
get_attr(33, AtkType) ->
    if
        AtkType =:= 1 -> [{1,231},{2,33},{3,99},{4,99},{5,99}];
        AtkType =:= 2 -> [{1,33},{2,231},{3,99},{4,99},{5,99}];
        AtkType =:= 3 -> [{1,83},{2,82},{3,198},{4,99},{5,99}];
        true -> []
    end;
get_attr(34, AtkType) ->
    if
        AtkType =:= 1 -> [{1,238},{2,34},{3,102},{4,102},{5,102}];
        AtkType =:= 2 -> [{1,34},{2,238},{3,102},{4,102},{5,102}];
        AtkType =:= 3 -> [{1,85},{2,85},{3,204},{4,102},{5,102}];
        true -> []
    end;
get_attr(35, AtkType) ->
    if
        AtkType =:= 1 -> [{1,245},{2,35},{3,105},{4,105},{5,105}];
        AtkType =:= 2 -> [{1,35},{2,245},{3,105},{4,105},{5,105}];
        AtkType =:= 3 -> [{1,88},{2,87},{3,210},{4,105},{5,105}];
        true -> []
    end;
get_attr(36, AtkType) ->
    if
        AtkType =:= 1 -> [{1,252},{2,36},{3,108},{4,108},{5,108}];
        AtkType =:= 2 -> [{1,36},{2,252},{3,108},{4,108},{5,108}];
        AtkType =:= 3 -> [{1,90},{2,90},{3,216},{4,108},{5,108}];
        true -> []
    end;
get_attr(37, AtkType) ->
    if
        AtkType =:= 1 -> [{1,259},{2,37},{3,111},{4,111},{5,111}];
        AtkType =:= 2 -> [{1,37},{2,259},{3,111},{4,111},{5,111}];
        AtkType =:= 3 -> [{1,93},{2,92},{3,222},{4,111},{5,111}];
        true -> []
    end;
get_attr(38, AtkType) ->
    if
        AtkType =:= 1 -> [{1,266},{2,38},{3,114},{4,114},{5,114}];
        AtkType =:= 2 -> [{1,38},{2,266},{3,114},{4,114},{5,114}];
        AtkType =:= 3 -> [{1,95},{2,95},{3,228},{4,114},{5,114}];
        true -> []
    end;
get_attr(39, AtkType) ->
    if
        AtkType =:= 1 -> [{1,273},{2,39},{3,117},{4,117},{5,117}];
        AtkType =:= 2 -> [{1,39},{2,273},{3,117},{4,117},{5,117}];
        AtkType =:= 3 -> [{1,98},{2,97},{3,234},{4,117},{5,117}];
        true -> []
    end;
get_attr(40, AtkType) ->
    if
        AtkType =:= 1 -> [{1,280},{2,40},{3,120},{4,120},{5,120}];
        AtkType =:= 2 -> [{1,40},{2,280},{3,120},{4,120},{5,120}];
        AtkType =:= 3 -> [{1,100},{2,100},{3,240},{4,120},{5,120}];
        true -> []
    end;
get_attr(41, AtkType) ->
    if
        AtkType =:= 1 -> [{1,287},{2,41},{3,123},{4,123},{5,123}];
        AtkType =:= 2 -> [{1,41},{2,287},{3,123},{4,123},{5,123}];
        AtkType =:= 3 -> [{1,103},{2,102},{3,246},{4,123},{5,123}];
        true -> []
    end;
get_attr(42, AtkType) ->
    if
        AtkType =:= 1 -> [{1,294},{2,42},{3,126},{4,126},{5,126}];
        AtkType =:= 2 -> [{1,42},{2,294},{3,126},{4,126},{5,126}];
        AtkType =:= 3 -> [{1,105},{2,105},{3,252},{4,126},{5,126}];
        true -> []
    end;
get_attr(43, AtkType) ->
    if
        AtkType =:= 1 -> [{1,301},{2,43},{3,129},{4,129},{5,129}];
        AtkType =:= 2 -> [{1,43},{2,301},{3,129},{4,129},{5,129}];
        AtkType =:= 3 -> [{1,108},{2,107},{3,258},{4,129},{5,129}];
        true -> []
    end;
get_attr(44, AtkType) ->
    if
        AtkType =:= 1 -> [{1,308},{2,44},{3,132},{4,132},{5,132}];
        AtkType =:= 2 -> [{1,44},{2,308},{3,132},{4,132},{5,132}];
        AtkType =:= 3 -> [{1,110},{2,110},{3,264},{4,132},{5,132}];
        true -> []
    end;
get_attr(45, AtkType) ->
    if
        AtkType =:= 1 -> [{1,315},{2,45},{3,135},{4,135},{5,135}];
        AtkType =:= 2 -> [{1,45},{2,315},{3,135},{4,135},{5,135}];
        AtkType =:= 3 -> [{1,113},{2,112},{3,270},{4,135},{5,135}];
        true -> []
    end;
get_attr(46, AtkType) ->
    if
        AtkType =:= 1 -> [{1,322},{2,46},{3,138},{4,138},{5,138}];
        AtkType =:= 2 -> [{1,46},{2,322},{3,138},{4,138},{5,138}];
        AtkType =:= 3 -> [{1,115},{2,115},{3,276},{4,138},{5,138}];
        true -> []
    end;
get_attr(47, AtkType) ->
    if
        AtkType =:= 1 -> [{1,329},{2,47},{3,141},{4,141},{5,141}];
        AtkType =:= 2 -> [{1,47},{2,329},{3,141},{4,141},{5,141}];
        AtkType =:= 3 -> [{1,118},{2,117},{3,282},{4,141},{5,141}];
        true -> []
    end;
get_attr(48, AtkType) ->
    if
        AtkType =:= 1 -> [{1,336},{2,48},{3,144},{4,144},{5,144}];
        AtkType =:= 2 -> [{1,48},{2,336},{3,144},{4,144},{5,144}];
        AtkType =:= 3 -> [{1,120},{2,120},{3,288},{4,144},{5,144}];
        true -> []
    end;
get_attr(49, AtkType) ->
    if
        AtkType =:= 1 -> [{1,343},{2,49},{3,147},{4,147},{5,147}];
        AtkType =:= 2 -> [{1,49},{2,343},{3,147},{4,147},{5,147}];
        AtkType =:= 3 -> [{1,123},{2,122},{3,294},{4,147},{5,147}];
        true -> []
    end;
get_attr(50, AtkType) ->
    if
        AtkType =:= 1 -> [{1,350},{2,50},{3,150},{4,150},{5,150}];
        AtkType =:= 2 -> [{1,50},{2,350},{3,150},{4,150},{5,150}];
        AtkType =:= 3 -> [{1,125},{2,125},{3,300},{4,150},{5,150}];
        true -> []
    end;
get_attr(51, AtkType) ->
    if
        AtkType =:= 1 -> [{1,357},{2,51},{3,153},{4,153},{5,153}];
        AtkType =:= 2 -> [{1,51},{2,357},{3,153},{4,153},{5,153}];
        AtkType =:= 3 -> [{1,128},{2,127},{3,306},{4,153},{5,153}];
        true -> []
    end;
get_attr(52, AtkType) ->
    if
        AtkType =:= 1 -> [{1,364},{2,52},{3,156},{4,156},{5,156}];
        AtkType =:= 2 -> [{1,52},{2,364},{3,156},{4,156},{5,156}];
        AtkType =:= 3 -> [{1,130},{2,130},{3,312},{4,156},{5,156}];
        true -> []
    end;
get_attr(53, AtkType) ->
    if
        AtkType =:= 1 -> [{1,371},{2,53},{3,159},{4,159},{5,159}];
        AtkType =:= 2 -> [{1,53},{2,371},{3,159},{4,159},{5,159}];
        AtkType =:= 3 -> [{1,133},{2,132},{3,318},{4,159},{5,159}];
        true -> []
    end;
get_attr(54, AtkType) ->
    if
        AtkType =:= 1 -> [{1,378},{2,54},{3,162},{4,162},{5,162}];
        AtkType =:= 2 -> [{1,54},{2,378},{3,162},{4,162},{5,162}];
        AtkType =:= 3 -> [{1,135},{2,135},{3,324},{4,162},{5,162}];
        true -> []
    end;
get_attr(55, AtkType) ->
    if
        AtkType =:= 1 -> [{1,385},{2,55},{3,165},{4,165},{5,165}];
        AtkType =:= 2 -> [{1,55},{2,385},{3,165},{4,165},{5,165}];
        AtkType =:= 3 -> [{1,138},{2,137},{3,330},{4,165},{5,165}];
        true -> []
    end;
get_attr(56, AtkType) ->
    if
        AtkType =:= 1 -> [{1,392},{2,56},{3,168},{4,168},{5,168}];
        AtkType =:= 2 -> [{1,56},{2,392},{3,168},{4,168},{5,168}];
        AtkType =:= 3 -> [{1,140},{2,140},{3,336},{4,168},{5,168}];
        true -> []
    end;
get_attr(57, AtkType) ->
    if
        AtkType =:= 1 -> [{1,399},{2,57},{3,171},{4,171},{5,171}];
        AtkType =:= 2 -> [{1,57},{2,399},{3,171},{4,171},{5,171}];
        AtkType =:= 3 -> [{1,143},{2,142},{3,342},{4,171},{5,171}];
        true -> []
    end;
get_attr(58, AtkType) ->
    if
        AtkType =:= 1 -> [{1,406},{2,58},{3,174},{4,174},{5,174}];
        AtkType =:= 2 -> [{1,58},{2,406},{3,174},{4,174},{5,174}];
        AtkType =:= 3 -> [{1,145},{2,145},{3,348},{4,174},{5,174}];
        true -> []
    end;
get_attr(59, AtkType) ->
    if
        AtkType =:= 1 -> [{1,413},{2,59},{3,177},{4,177},{5,177}];
        AtkType =:= 2 -> [{1,59},{2,413},{3,177},{4,177},{5,177}];
        AtkType =:= 3 -> [{1,148},{2,147},{3,354},{4,177},{5,177}];
        true -> []
    end;
get_attr(60, AtkType) ->
    if
        AtkType =:= 1 -> [{1,420},{2,60},{3,180},{4,180},{5,180}];
        AtkType =:= 2 -> [{1,60},{2,420},{3,180},{4,180},{5,180}];
        AtkType =:= 3 -> [{1,150},{2,150},{3,360},{4,180},{5,180}];
        true -> []
    end;
get_attr(61, AtkType) ->
    if
        AtkType =:= 1 -> [{1,427},{2,61},{3,183},{4,183},{5,183}];
        AtkType =:= 2 -> [{1,61},{2,427},{3,183},{4,183},{5,183}];
        AtkType =:= 3 -> [{1,153},{2,152},{3,366},{4,183},{5,183}];
        true -> []
    end;
get_attr(62, AtkType) ->
    if
        AtkType =:= 1 -> [{1,434},{2,62},{3,186},{4,186},{5,186}];
        AtkType =:= 2 -> [{1,62},{2,434},{3,186},{4,186},{5,186}];
        AtkType =:= 3 -> [{1,155},{2,155},{3,372},{4,186},{5,186}];
        true -> []
    end;
get_attr(63, AtkType) ->
    if
        AtkType =:= 1 -> [{1,441},{2,63},{3,189},{4,189},{5,189}];
        AtkType =:= 2 -> [{1,63},{2,441},{3,189},{4,189},{5,189}];
        AtkType =:= 3 -> [{1,158},{2,157},{3,378},{4,189},{5,189}];
        true -> []
    end;
get_attr(64, AtkType) ->
    if
        AtkType =:= 1 -> [{1,448},{2,64},{3,192},{4,192},{5,192}];
        AtkType =:= 2 -> [{1,64},{2,448},{3,192},{4,192},{5,192}];
        AtkType =:= 3 -> [{1,160},{2,160},{3,384},{4,192},{5,192}];
        true -> []
    end;
get_attr(65, AtkType) ->
    if
        AtkType =:= 1 -> [{1,455},{2,65},{3,195},{4,195},{5,195}];
        AtkType =:= 2 -> [{1,65},{2,455},{3,195},{4,195},{5,195}];
        AtkType =:= 3 -> [{1,163},{2,162},{3,390},{4,195},{5,195}];
        true -> []
    end;
get_attr(66, AtkType) ->
    if
        AtkType =:= 1 -> [{1,462},{2,66},{3,198},{4,198},{5,198}];
        AtkType =:= 2 -> [{1,66},{2,462},{3,198},{4,198},{5,198}];
        AtkType =:= 3 -> [{1,165},{2,165},{3,396},{4,198},{5,198}];
        true -> []
    end;
get_attr(67, AtkType) ->
    if
        AtkType =:= 1 -> [{1,469},{2,67},{3,201},{4,201},{5,201}];
        AtkType =:= 2 -> [{1,67},{2,469},{3,201},{4,201},{5,201}];
        AtkType =:= 3 -> [{1,168},{2,167},{3,402},{4,201},{5,201}];
        true -> []
    end;
get_attr(68, AtkType) ->
    if
        AtkType =:= 1 -> [{1,476},{2,68},{3,204},{4,204},{5,204}];
        AtkType =:= 2 -> [{1,68},{2,476},{3,204},{4,204},{5,204}];
        AtkType =:= 3 -> [{1,170},{2,170},{3,408},{4,204},{5,204}];
        true -> []
    end;
get_attr(69, AtkType) ->
    if
        AtkType =:= 1 -> [{1,483},{2,69},{3,207},{4,207},{5,207}];
        AtkType =:= 2 -> [{1,69},{2,483},{3,207},{4,207},{5,207}];
        AtkType =:= 3 -> [{1,173},{2,172},{3,414},{4,207},{5,207}];
        true -> []
    end;
get_attr(70, AtkType) ->
    if
        AtkType =:= 1 -> [{1,490},{2,70},{3,210},{4,210},{5,210}];
        AtkType =:= 2 -> [{1,70},{2,490},{3,210},{4,210},{5,210}];
        AtkType =:= 3 -> [{1,175},{2,175},{3,420},{4,210},{5,210}];
        true -> []
    end;
get_attr(71, AtkType) ->
    if
        AtkType =:= 1 -> [{1,497},{2,71},{3,213},{4,213},{5,213}];
        AtkType =:= 2 -> [{1,71},{2,497},{3,213},{4,213},{5,213}];
        AtkType =:= 3 -> [{1,178},{2,177},{3,426},{4,213},{5,213}];
        true -> []
    end;
get_attr(72, AtkType) ->
    if
        AtkType =:= 1 -> [{1,504},{2,72},{3,216},{4,216},{5,216}];
        AtkType =:= 2 -> [{1,72},{2,504},{3,216},{4,216},{5,216}];
        AtkType =:= 3 -> [{1,180},{2,180},{3,432},{4,216},{5,216}];
        true -> []
    end;
get_attr(73, AtkType) ->
    if
        AtkType =:= 1 -> [{1,511},{2,73},{3,219},{4,219},{5,219}];
        AtkType =:= 2 -> [{1,73},{2,511},{3,219},{4,219},{5,219}];
        AtkType =:= 3 -> [{1,183},{2,182},{3,438},{4,219},{5,219}];
        true -> []
    end;
get_attr(74, AtkType) ->
    if
        AtkType =:= 1 -> [{1,518},{2,74},{3,222},{4,222},{5,222}];
        AtkType =:= 2 -> [{1,74},{2,518},{3,222},{4,222},{5,222}];
        AtkType =:= 3 -> [{1,185},{2,185},{3,444},{4,222},{5,222}];
        true -> []
    end;
get_attr(75, AtkType) ->
    if
        AtkType =:= 1 -> [{1,525},{2,75},{3,225},{4,225},{5,225}];
        AtkType =:= 2 -> [{1,75},{2,525},{3,225},{4,225},{5,225}];
        AtkType =:= 3 -> [{1,188},{2,187},{3,450},{4,225},{5,225}];
        true -> []
    end;
get_attr(76, AtkType) ->
    if
        AtkType =:= 1 -> [{1,532},{2,76},{3,228},{4,228},{5,228}];
        AtkType =:= 2 -> [{1,76},{2,532},{3,228},{4,228},{5,228}];
        AtkType =:= 3 -> [{1,190},{2,190},{3,456},{4,228},{5,228}];
        true -> []
    end;
get_attr(77, AtkType) ->
    if
        AtkType =:= 1 -> [{1,539},{2,77},{3,231},{4,231},{5,231}];
        AtkType =:= 2 -> [{1,77},{2,539},{3,231},{4,231},{5,231}];
        AtkType =:= 3 -> [{1,193},{2,192},{3,462},{4,231},{5,231}];
        true -> []
    end;
get_attr(78, AtkType) ->
    if
        AtkType =:= 1 -> [{1,546},{2,78},{3,234},{4,234},{5,234}];
        AtkType =:= 2 -> [{1,78},{2,546},{3,234},{4,234},{5,234}];
        AtkType =:= 3 -> [{1,195},{2,195},{3,468},{4,234},{5,234}];
        true -> []
    end;
get_attr(79, AtkType) ->
    if
        AtkType =:= 1 -> [{1,553},{2,79},{3,237},{4,237},{5,237}];
        AtkType =:= 2 -> [{1,79},{2,553},{3,237},{4,237},{5,237}];
        AtkType =:= 3 -> [{1,198},{2,197},{3,474},{4,237},{5,237}];
        true -> []
    end;
get_attr(80, AtkType) ->
    if
        AtkType =:= 1 -> [{1,560},{2,80},{3,240},{4,240},{5,240}];
        AtkType =:= 2 -> [{1,80},{2,560},{3,240},{4,240},{5,240}];
        AtkType =:= 3 -> [{1,200},{2,200},{3,480},{4,240},{5,240}];
        true -> []
    end;
get_attr(81, AtkType) ->
    if
        AtkType =:= 1 -> [{1,567},{2,81},{3,243},{4,243},{5,243}];
        AtkType =:= 2 -> [{1,81},{2,567},{3,243},{4,243},{5,243}];
        AtkType =:= 3 -> [{1,203},{2,202},{3,486},{4,243},{5,243}];
        true -> []
    end;
get_attr(82, AtkType) ->
    if
        AtkType =:= 1 -> [{1,574},{2,82},{3,246},{4,246},{5,246}];
        AtkType =:= 2 -> [{1,82},{2,574},{3,246},{4,246},{5,246}];
        AtkType =:= 3 -> [{1,205},{2,205},{3,492},{4,246},{5,246}];
        true -> []
    end;
get_attr(83, AtkType) ->
    if
        AtkType =:= 1 -> [{1,581},{2,83},{3,249},{4,249},{5,249}];
        AtkType =:= 2 -> [{1,83},{2,581},{3,249},{4,249},{5,249}];
        AtkType =:= 3 -> [{1,208},{2,207},{3,498},{4,249},{5,249}];
        true -> []
    end;
get_attr(84, AtkType) ->
    if
        AtkType =:= 1 -> [{1,588},{2,84},{3,252},{4,252},{5,252}];
        AtkType =:= 2 -> [{1,84},{2,588},{3,252},{4,252},{5,252}];
        AtkType =:= 3 -> [{1,210},{2,210},{3,504},{4,252},{5,252}];
        true -> []
    end;
get_attr(85, AtkType) ->
    if
        AtkType =:= 1 -> [{1,595},{2,85},{3,255},{4,255},{5,255}];
        AtkType =:= 2 -> [{1,85},{2,595},{3,255},{4,255},{5,255}];
        AtkType =:= 3 -> [{1,213},{2,212},{3,510},{4,255},{5,255}];
        true -> []
    end;
get_attr(86, AtkType) ->
    if
        AtkType =:= 1 -> [{1,602},{2,86},{3,258},{4,258},{5,258}];
        AtkType =:= 2 -> [{1,86},{2,602},{3,258},{4,258},{5,258}];
        AtkType =:= 3 -> [{1,215},{2,215},{3,516},{4,258},{5,258}];
        true -> []
    end;
get_attr(87, AtkType) ->
    if
        AtkType =:= 1 -> [{1,609},{2,87},{3,261},{4,261},{5,261}];
        AtkType =:= 2 -> [{1,87},{2,609},{3,261},{4,261},{5,261}];
        AtkType =:= 3 -> [{1,218},{2,217},{3,522},{4,261},{5,261}];
        true -> []
    end;
get_attr(88, AtkType) ->
    if
        AtkType =:= 1 -> [{1,616},{2,88},{3,264},{4,264},{5,264}];
        AtkType =:= 2 -> [{1,88},{2,616},{3,264},{4,264},{5,264}];
        AtkType =:= 3 -> [{1,220},{2,220},{3,528},{4,264},{5,264}];
        true -> []
    end;
get_attr(89, AtkType) ->
    if
        AtkType =:= 1 -> [{1,623},{2,89},{3,267},{4,267},{5,267}];
        AtkType =:= 2 -> [{1,89},{2,623},{3,267},{4,267},{5,267}];
        AtkType =:= 3 -> [{1,223},{2,222},{3,534},{4,267},{5,267}];
        true -> []
    end;
get_attr(90, AtkType) ->
    if
        AtkType =:= 1 -> [{1,630},{2,90},{3,270},{4,270},{5,270}];
        AtkType =:= 2 -> [{1,90},{2,630},{3,270},{4,270},{5,270}];
        AtkType =:= 3 -> [{1,225},{2,225},{3,540},{4,270},{5,270}];
        true -> []
    end;
get_attr(91, AtkType) ->
    if
        AtkType =:= 1 -> [{1,637},{2,91},{3,273},{4,273},{5,273}];
        AtkType =:= 2 -> [{1,91},{2,637},{3,273},{4,273},{5,273}];
        AtkType =:= 3 -> [{1,228},{2,227},{3,546},{4,273},{5,273}];
        true -> []
    end;
get_attr(92, AtkType) ->
    if
        AtkType =:= 1 -> [{1,644},{2,92},{3,276},{4,276},{5,276}];
        AtkType =:= 2 -> [{1,92},{2,644},{3,276},{4,276},{5,276}];
        AtkType =:= 3 -> [{1,230},{2,230},{3,552},{4,276},{5,276}];
        true -> []
    end;
get_attr(93, AtkType) ->
    if
        AtkType =:= 1 -> [{1,651},{2,93},{3,279},{4,279},{5,279}];
        AtkType =:= 2 -> [{1,93},{2,651},{3,279},{4,279},{5,279}];
        AtkType =:= 3 -> [{1,233},{2,232},{3,558},{4,279},{5,279}];
        true -> []
    end;
get_attr(94, AtkType) ->
    if
        AtkType =:= 1 -> [{1,658},{2,94},{3,282},{4,282},{5,282}];
        AtkType =:= 2 -> [{1,94},{2,658},{3,282},{4,282},{5,282}];
        AtkType =:= 3 -> [{1,235},{2,235},{3,564},{4,282},{5,282}];
        true -> []
    end;
get_attr(95, AtkType) ->
    if
        AtkType =:= 1 -> [{1,665},{2,95},{3,285},{4,285},{5,285}];
        AtkType =:= 2 -> [{1,95},{2,665},{3,285},{4,285},{5,285}];
        AtkType =:= 3 -> [{1,238},{2,237},{3,570},{4,285},{5,285}];
        true -> []
    end;
get_attr(96, AtkType) ->
    if
        AtkType =:= 1 -> [{1,672},{2,96},{3,288},{4,288},{5,288}];
        AtkType =:= 2 -> [{1,96},{2,672},{3,288},{4,288},{5,288}];
        AtkType =:= 3 -> [{1,240},{2,240},{3,576},{4,288},{5,288}];
        true -> []
    end;
get_attr(97, AtkType) ->
    if
        AtkType =:= 1 -> [{1,679},{2,97},{3,291},{4,291},{5,291}];
        AtkType =:= 2 -> [{1,97},{2,679},{3,291},{4,291},{5,291}];
        AtkType =:= 3 -> [{1,243},{2,242},{3,582},{4,291},{5,291}];
        true -> []
    end;
get_attr(98, AtkType) ->
    if
        AtkType =:= 1 -> [{1,686},{2,98},{3,294},{4,294},{5,294}];
        AtkType =:= 2 -> [{1,98},{2,686},{3,294},{4,294},{5,294}];
        AtkType =:= 3 -> [{1,245},{2,245},{3,588},{4,294},{5,294}];
        true -> []
    end;
get_attr(99, AtkType) ->
    if
        AtkType =:= 1 -> [{1,693},{2,99},{3,297},{4,297},{5,297}];
        AtkType =:= 2 -> [{1,99},{2,693},{3,297},{4,297},{5,297}];
        AtkType =:= 3 -> [{1,248},{2,247},{3,594},{4,297},{5,297}];
        true -> []
    end;
get_attr(100, AtkType) ->
    if
        AtkType =:= 1 -> [{1,700},{2,100},{3,300},{4,300},{5,300}];
        AtkType =:= 2 -> [{1,100},{2,700},{3,300},{4,300},{5,300}];
        AtkType =:= 3 -> [{1,250},{2,250},{3,600},{4,300},{5,300}];
        true -> []
    end;
get_attr(101, AtkType) ->
    if
        AtkType =:= 1 -> [{1,707},{2,101},{3,303},{4,303},{5,303}];
        AtkType =:= 2 -> [{1,101},{2,707},{3,303},{4,303},{5,303}];
        AtkType =:= 3 -> [{1,253},{2,252},{3,606},{4,303},{5,303}];
        true -> []
    end;
get_attr(102, AtkType) ->
    if
        AtkType =:= 1 -> [{1,714},{2,102},{3,306},{4,306},{5,306}];
        AtkType =:= 2 -> [{1,102},{2,714},{3,306},{4,306},{5,306}];
        AtkType =:= 3 -> [{1,255},{2,255},{3,612},{4,306},{5,306}];
        true -> []
    end;
get_attr(103, AtkType) ->
    if
        AtkType =:= 1 -> [{1,721},{2,103},{3,309},{4,309},{5,309}];
        AtkType =:= 2 -> [{1,103},{2,721},{3,309},{4,309},{5,309}];
        AtkType =:= 3 -> [{1,258},{2,257},{3,618},{4,309},{5,309}];
        true -> []
    end;
get_attr(104, AtkType) ->
    if
        AtkType =:= 1 -> [{1,728},{2,104},{3,312},{4,312},{5,312}];
        AtkType =:= 2 -> [{1,104},{2,728},{3,312},{4,312},{5,312}];
        AtkType =:= 3 -> [{1,260},{2,260},{3,624},{4,312},{5,312}];
        true -> []
    end;
get_attr(_Level, _AtkType) ->
    [].
