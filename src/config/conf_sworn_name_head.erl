%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_name_head
%% @Brief  : 结拜名号头库
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_name_head).

-export([
    get/1,
    length/0
]).

get(1) ->
    #{
        name_head => <<"东北">>
        
    };
get(2) ->
    #{
        name_head => <<"四海">>
        
    };
get(3) ->
    #{
        name_head => <<"江南">>
        
    };
get(4) ->
    #{
        name_head => <<"德艺">>
        
    };
get(5) ->
    #{
        name_head => <<"轮回">>
        
    };
get(6) ->
    #{
        name_head => <<"金兰">>
        
    };
get(7) ->
    #{
        name_head => <<"吉祥">>
        
    };
get(8) ->
    #{
        name_head => <<"浮沉">>
        
    };
get(9) ->
    #{
        name_head => <<"北斗">>
        
    };
get(10) ->
    #{
        name_head => <<"相守">>
        
    };
get(11) ->
    #{
        name_head => <<"逐月">>
        
    };
get(12) ->
    #{
        name_head => <<"逍遥">>
        
    };
get(13) ->
    #{
        name_head => <<"倾城">>
        
    };
get(14) ->
    #{
        name_head => <<"红尘">>
        
    };
get(15) ->
    #{
        name_head => <<"塞北">>
        
    };
get(_Id) ->
    undefined.

length() ->
	15.