%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_name_tail
%% @Brief  : 结拜名号尾库
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_name_tail).

-export([
    get/1,
    length/0
]).

get(1) ->
    #{
        name_tail => <<"圣">>
        
    };
get(2) ->
    #{
        name_tail => <<"灵">>
        
    };
get(3) ->
    #{
        name_tail => <<"蝶">>
        
    };
get(4) ->
    #{
        name_tail => <<"侠">>
        
    };
get(5) ->
    #{
        name_tail => <<"绝">>
        
    };
get(6) ->
    #{
        name_tail => <<"仙">>
        
    };
get(7) ->
    #{
        name_tail => <<"邪">>
        
    };
get(8) ->
    #{
        name_tail => <<"只">>
        
    };
get(9) ->
    #{
        name_tail => <<"宝">>
        
    };
get(10) ->
    #{
        name_tail => <<"少">>
        
    };
get(11) ->
    #{
        name_tail => <<"杰">>
        
    };
get(12) ->
    #{
        name_tail => <<"叶">>
        
    };
get(13) ->
    #{
        name_tail => <<"君">>
        
    };
get(14) ->
    #{
        name_tail => <<"王">>
        
    };
get(15) ->
    #{
        name_tail => <<"煞">>
        
    };
get(_Id) ->
    undefined.

length() ->
	15.