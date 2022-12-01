%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_senior_name
%% @Brief  : 结拜辈分名称
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_senior_name).

-export([
    get/1
]).

get(1) ->
    #{
        name => <<"老大">>,
        male_old => <<"大哥">>,
        male_young => <<"无">>,
        female_old => <<"大姐">>,
        female_young => <<"无">>
        
    };
get(2) ->
    #{
        name => <<"老二">>,
        male_old => <<"二哥">>,
        male_young => <<"二弟">>,
        female_old => <<"二姐">>,
        female_young => <<"二妹">>
        
    };
get(3) ->
    #{
        name => <<"老三">>,
        male_old => <<"三哥">>,
        male_young => <<"三弟">>,
        female_old => <<"三姐">>,
        female_young => <<"三妹">>
        
    };
get(4) ->
    #{
        name => <<"老四">>,
        male_old => <<"四哥">>,
        male_young => <<"四弟">>,
        female_old => <<"四姐">>,
        female_young => <<"四妹">>
        
    };
get(5) ->
    #{
        name => <<"老五">>,
        male_old => <<"无">>,
        male_young => <<"五弟">>,
        female_old => <<"无">>,
        female_young => <<"五妹">>
        
    };
get(_SeniorId) ->
    undefined.