%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_kick_reason
%% @Brief  : 师徒逐出师门原因
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_kick_reason).

-export([
    get/1
]).

get(1) ->
    #{
        desc => <<"长期不在线">>
        
    };
get(2) ->
    #{
        desc => <<"成长太慢">>
        
    };
get(3) ->
    #{
        desc => <<"与师父志趣不同">>
        
    };
get(_) ->
    undefined.