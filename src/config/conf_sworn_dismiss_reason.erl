%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_sworn_dismiss_reason
%% @Brief  : 结拜请离理由
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_sworn_dismiss_reason).

-export([
    get/1
]).

get(1) ->
    #{
        reason => <<"长期不登录">>
        
    };
get(2) ->
    #{
        reason => <<"见利忘义">>
        
    };
get(3) ->
    #{
        reason => <<"志趣不同">>
        
    };
get(4) ->
    #{
        reason => <<"经常不一起玩">>
        
    };
get(_Id) ->
    undefined.