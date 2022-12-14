%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_warrior_soul_refine
%% @Brief  : 武魂精铸
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_warrior_soul_refine).

-export([
    get/1
]).

get(1) ->
    #{
    	skill => [],
        attr => [{101,1},{102,1},{103,2},{104,2},{105,1}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 10000,
        fail_add => 300        
    };
get(2) ->
    #{
    	skill => [],
        attr => [{101,3},{102,3},{103,4},{104,4},{105,2}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 10000,
        fail_add => 300        
    };
get(3) ->
    #{
    	skill => [],
        attr => [{101,4},{102,4},{103,6},{104,6},{105,3}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 8000,
        fail_add => 300        
    };
get(4) ->
    #{
    	skill => [],
        attr => [{101,6},{102,6},{103,8},{104,8},{105,4}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 7000,
        fail_add => 300        
    };
get(5) ->
    #{
    	skill => [],
        attr => [{101,7},{102,7},{103,10},{104,10},{105,6}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 7000,
        fail_add => 300        
    };
get(6) ->
    #{
    	skill => [],
        attr => [{101,9},{102,9},{103,12},{104,12},{105,7}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 6000,
        fail_add => 300        
    };
get(7) ->
    #{
    	skill => [],
        attr => [{101,10},{102,10},{103,14},{104,14},{105,8}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 5000,
        fail_add => 300        
    };
get(8) ->
    #{
    	skill => [],
        attr => [{101,12},{102,12},{103,16},{104,16},{105,9}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 4000,
        fail_add => 300        
    };
get(9) ->
    #{
    	skill => [],
        attr => [{101,14},{102,14},{103,18},{104,18},{105,10}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 3000,
        fail_add => 300        
    };
get(10) ->
    #{
    	skill => [21010001],
        attr => [{101,16},{102,16},{103,20},{104,20},{105,11}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 2000,
        fail_add => 300        
    };
get(11) ->
    #{
    	skill => [],
        attr => [{101,18},{102,18},{103,22},{104,22},{105,12}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(12) ->
    #{
    	skill => [],
        attr => [{101,20},{102,20},{103,24},{104,24},{105,14}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(13) ->
    #{
    	skill => [],
        attr => [{101,22},{102,22},{103,26},{104,26},{105,15}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(14) ->
    #{
    	skill => [],
        attr => [{101,24},{102,24},{103,28},{104,28},{105,16}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(15) ->
    #{
    	skill => [],
        attr => [{101,26},{102,26},{103,30},{104,30},{105,17}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(16) ->
    #{
    	skill => [],
        attr => [{101,28},{102,28},{103,32},{104,32},{105,18}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(17) ->
    #{
    	skill => [],
        attr => [{101,30},{102,30},{103,34},{104,34},{105,19}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(18) ->
    #{
    	skill => [],
        attr => [{101,32},{102,32},{103,36},{104,36},{105,20}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(19) ->
    #{
    	skill => [],
        attr => [{101,34},{102,34},{103,38},{104,38},{105,21}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(20) ->
    #{
    	skill => [],
        attr => [{101,37},{102,37},{103,40},{104,40},{105,23}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(21) ->
    #{
    	skill => [],
        attr => [{101,39},{102,39},{103,42},{104,42},{105,24}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(22) ->
    #{
    	skill => [],
        attr => [{101,41},{102,41},{103,44},{104,44},{105,25}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(23) ->
    #{
    	skill => [],
        attr => [{101,43},{102,43},{103,47},{104,47},{105,26}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(24) ->
    #{
    	skill => [],
        attr => [{101,45},{102,45},{103,50},{104,50},{105,27}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(25) ->
    #{
    	skill => [],
        attr => [{101,47},{102,47},{103,53},{104,53},{105,29}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(26) ->
    #{
    	skill => [],
        attr => [{101,49},{102,49},{103,56},{104,56},{105,30}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(27) ->
    #{
    	skill => [],
        attr => [{101,51},{102,51},{103,59},{104,59},{105,31}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(28) ->
    #{
    	skill => [],
        attr => [{101,53},{102,53},{103,62},{104,62},{105,32}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(29) ->
    #{
    	skill => [],
        attr => [{101,55},{102,55},{103,65},{104,65},{105,33}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(30) ->
    #{
    	skill => [21010002],
        attr => [{101,58},{102,58},{103,68},{104,68},{105,34}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(31) ->
    #{
    	skill => [],
        attr => [{101,60},{102,60},{103,71},{104,71},{105,35}],
        coin_cost => 50000,
        item_cost => [{16480001,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(32) ->
    #{
    	skill => [],
        attr => [{101,62},{102,62},{103,74},{104,74},{105,37}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 8000,
        fail_add => 300        
    };
get(33) ->
    #{
    	skill => [],
        attr => [{101,64},{102,64},{103,77},{104,77},{105,39}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 7000,
        fail_add => 300        
    };
get(34) ->
    #{
    	skill => [],
        attr => [{101,66},{102,66},{103,80},{104,80},{105,41}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 6000,
        fail_add => 300        
    };
get(35) ->
    #{
    	skill => [],
        attr => [{101,68},{102,68},{103,83},{104,83},{105,43}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 5000,
        fail_add => 300        
    };
get(36) ->
    #{
    	skill => [],
        attr => [{101,70},{102,70},{103,86},{104,86},{105,45}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 4000,
        fail_add => 300        
    };
get(37) ->
    #{
    	skill => [],
        attr => [{101,72},{102,72},{103,89},{104,89},{105,47}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 3000,
        fail_add => 300        
    };
get(38) ->
    #{
    	skill => [],
        attr => [{101,74},{102,74},{103,92},{104,92},{105,49}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1999.9999999999902,
        fail_add => 300        
    };
get(39) ->
    #{
    	skill => [],
        attr => [{101,76},{102,76},{103,95},{104,95},{105,51}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(40) ->
    #{
    	skill => [],
        attr => [{101,78},{102,78},{103,98},{104,98},{105,53}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(41) ->
    #{
    	skill => [],
        attr => [{101,80},{102,80},{103,101},{104,101},{105,55}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(42) ->
    #{
    	skill => [],
        attr => [{101,82},{102,82},{103,104},{104,104},{105,57}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(43) ->
    #{
    	skill => [],
        attr => [{101,85},{102,85},{103,107},{104,107},{105,59}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(44) ->
    #{
    	skill => [],
        attr => [{101,88},{102,88},{103,110},{104,110},{105,61}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(45) ->
    #{
    	skill => [],
        attr => [{101,90},{102,90},{103,113},{104,113},{105,63}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(46) ->
    #{
    	skill => [],
        attr => [{101,93},{102,93},{103,116},{104,116},{105,65}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1500,
        fail_add => 300        
    };
get(47) ->
    #{
    	skill => [],
        attr => [{101,96},{102,96},{103,120},{104,120},{105,67}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(48) ->
    #{
    	skill => [],
        attr => [{101,100},{102,100},{103,123},{104,123},{105,68}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(49) ->
    #{
    	skill => [],
        attr => [{101,102},{102,102},{103,127},{104,127},{105,70}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(50) ->
    #{
    	skill => [21010003],
        attr => [{101,105},{102,105},{103,130},{104,130},{105,72}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(51) ->
    #{
    	skill => [],
        attr => [{101,108},{102,108},{103,134},{104,134},{105,74}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(52) ->
    #{
    	skill => [],
        attr => [{101,111},{102,111},{103,138},{104,138},{105,76}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(53) ->
    #{
    	skill => [],
        attr => [{101,113},{102,113},{103,141},{104,141},{105,79}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(54) ->
    #{
    	skill => [],
        attr => [{101,116},{102,116},{103,145},{104,145},{105,81}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(55) ->
    #{
    	skill => [],
        attr => [{101,119},{102,119},{103,149},{104,149},{105,83}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(56) ->
    #{
    	skill => [],
        attr => [{101,122},{102,122},{103,153},{104,153},{105,85}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(57) ->
    #{
    	skill => [],
        attr => [{101,125},{102,125},{103,157},{104,157},{105,87}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(58) ->
    #{
    	skill => [],
        attr => [{101,128},{102,128},{103,161},{104,161},{105,89}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(59) ->
    #{
    	skill => [],
        attr => [{101,131},{102,131},{103,165},{104,165},{105,91}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(60) ->
    #{
    	skill => [],
        attr => [{101,134},{102,134},{103,169},{104,169},{105,93}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(61) ->
    #{
    	skill => [],
        attr => [{101,137},{102,137},{103,173},{104,173},{105,95}],
        coin_cost => 50000,
        item_cost => [{16480002,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(62) ->
    #{
    	skill => [],
        attr => [{101,140},{102,140},{103,177},{104,177},{105,97}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 8000,
        fail_add => 300        
    };
get(63) ->
    #{
    	skill => [],
        attr => [{101,143},{102,143},{103,181},{104,181},{105,99}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 7000,
        fail_add => 300        
    };
get(64) ->
    #{
    	skill => [],
        attr => [{101,146},{102,146},{103,185},{104,185},{105,101}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 6000,
        fail_add => 300        
    };
get(65) ->
    #{
    	skill => [],
        attr => [{101,149},{102,149},{103,189},{104,189},{105,103}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 5000,
        fail_add => 300        
    };
get(66) ->
    #{
    	skill => [],
        attr => [{101,153},{102,153},{103,193},{104,193},{105,105}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 4000,
        fail_add => 300        
    };
get(67) ->
    #{
    	skill => [],
        attr => [{101,157},{102,157},{103,197},{104,197},{105,108}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 3000,
        fail_add => 300        
    };
get(68) ->
    #{
    	skill => [],
        attr => [{101,161},{102,161},{103,202},{104,202},{105,111}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1999.9999999999902,
        fail_add => 300        
    };
get(69) ->
    #{
    	skill => [],
        attr => [{101,165},{102,165},{103,207},{104,207},{105,114}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(70) ->
    #{
    	skill => [21010004],
        attr => [{101,169},{102,169},{103,212},{104,212},{105,117}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(71) ->
    #{
    	skill => [],
        attr => [{101,173},{102,173},{103,218},{104,218},{105,120}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(72) ->
    #{
    	skill => [],
        attr => [{101,177},{102,177},{103,224},{104,224},{105,123}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(73) ->
    #{
    	skill => [],
        attr => [{101,182},{102,182},{103,230},{104,230},{105,126}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(74) ->
    #{
    	skill => [],
        attr => [{101,187},{102,187},{103,236},{104,236},{105,129}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(75) ->
    #{
    	skill => [],
        attr => [{101,192},{102,192},{103,242},{104,242},{105,132}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(76) ->
    #{
    	skill => [],
        attr => [{101,197},{102,197},{103,248},{104,248},{105,135}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(77) ->
    #{
    	skill => [],
        attr => [{101,202},{102,202},{103,254},{104,254},{105,138}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(78) ->
    #{
    	skill => [],
        attr => [{101,207},{102,207},{103,260},{104,260},{105,141}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(79) ->
    #{
    	skill => [],
        attr => [{101,212},{102,212},{103,266},{104,266},{105,144}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(80) ->
    #{
    	skill => [],
        attr => [{101,217},{102,217},{103,272},{104,272},{105,148}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 1000,
        fail_add => 300        
    };
get(81) ->
    #{
    	skill => [],
        attr => [{101,222},{102,222},{103,278},{104,278},{105,152}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(82) ->
    #{
    	skill => [],
        attr => [{101,227},{102,227},{103,284},{104,284},{105,156}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(83) ->
    #{
    	skill => [],
        attr => [{101,232},{102,232},{103,290},{104,290},{105,160}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(84) ->
    #{
    	skill => [],
        attr => [{101,237},{102,237},{103,296},{104,296},{105,164}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(85) ->
    #{
    	skill => [],
        attr => [{101,242},{102,242},{103,303},{104,303},{105,168}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(86) ->
    #{
    	skill => [],
        attr => [{101,247},{102,247},{103,310},{104,310},{105,172}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(87) ->
    #{
    	skill => [],
        attr => [{101,253},{102,253},{103,316},{104,316},{105,176}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(88) ->
    #{
    	skill => [],
        attr => [{101,259},{102,259},{103,324},{104,324},{105,180}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(89) ->
    #{
    	skill => [],
        attr => [{101,265},{102,265},{103,331},{104,331},{105,184}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(90) ->
    #{
    	skill => [],
        attr => [{101,271},{102,271},{103,338},{104,338},{105,188}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(91) ->
    #{
    	skill => [],
        attr => [{101,277},{102,277},{103,345},{104,345},{105,192}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(92) ->
    #{
    	skill => [],
        attr => [{101,283},{102,283},{103,353},{104,353},{105,196}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(93) ->
    #{
    	skill => [],
        attr => [{101,289},{102,289},{103,360},{104,360},{105,201}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(94) ->
    #{
    	skill => [],
        attr => [{101,295},{102,295},{103,368},{104,368},{105,205}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(95) ->
    #{
    	skill => [],
        attr => [{101,301},{102,301},{103,375},{104,375},{105,209}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(96) ->
    #{
    	skill => [],
        attr => [{101,307},{102,307},{103,383},{104,383},{105,213}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(97) ->
    #{
    	skill => [],
        attr => [{101,313},{102,313},{103,390},{104,390},{105,217}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(98) ->
    #{
    	skill => [],
        attr => [{101,319},{102,319},{103,398},{104,398},{105,221}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(99) ->
    #{
    	skill => [],
        attr => [{101,325},{102,325},{103,405},{104,405},{105,225}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(100) ->
    #{
    	skill => [],
        attr => [{101,331},{102,331},{103,413},{104,413},{105,230}],
        coin_cost => 50000,
        item_cost => [{16480003,5}],
        succ_rate => 900,
        fail_add => 300        
    };
get(_Lv) ->
    undefined.