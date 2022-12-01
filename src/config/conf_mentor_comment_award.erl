%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_mentor_comment_award
%% @Brief  : 师徒师父评价奖励
%% @Author : Tom
%%------------------------------------------------------------------------------
-module(conf_mentor_comment_award).

-export([
    get/1
]).

get(1) ->
    #{
        award => [310323],
        morality_value => 120        
    };
get(2) ->
    #{
        award => [310322],
        morality_value => 110        
    };
get(3) ->
    #{
        award => [310321],
        morality_value => 100        
    };
get(_) ->
    undefined.