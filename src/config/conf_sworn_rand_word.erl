%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_rand_word
%% @Brief  : 结拜字号库
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_rand_word).

-export([
    get/1,
    length/0
]).

get(1) ->
    #{
        word => <<"汐灵">>
        
    };
get(2) ->
    #{
        word => <<"邪风">>
        
    };
get(3) ->
    #{
        word => <<"幻灵">>
        
    };
get(4) ->
    #{
        word => <<"步尘">>
        
    };
get(5) ->
    #{
        word => <<"慕君">>
        
    };
get(6) ->
    #{
        word => <<"傲世">>
        
    };
get(7) ->
    #{
        word => <<"湮尘">>
        
    };
get(8) ->
    #{
        word => <<"皓尘">>
        
    };
get(9) ->
    #{
        word => <<"灭世">>
        
    };
get(10) ->
    #{
        word => <<"汐夜">>
        
    };
get(11) ->
    #{
        word => <<"醉幻">>
        
    };
get(12) ->
    #{
        word => <<"天尘">>
        
    };
get(13) ->
    #{
        word => <<"破天">>
        
    };
get(14) ->
    #{
        word => <<"绝尘">>
        
    };
get(15) ->
    #{
        word => <<"落灵">>
        
    };
get(_Id) ->
    undefined.

length() ->
	15.