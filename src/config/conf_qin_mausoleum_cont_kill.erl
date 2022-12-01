%% -*- coding: latin-1 -*-
%%------------------------------------------------------------------------------
%% @File   : conf_qin_mausoleum_info
%% @Brief  : Mausoleum of the First Qin Emperor
%% @Author : Ryuu
%%------------------------------------------------------------------------------
-module(conf_qin_mausoleum_cont_kill).

-export([
    get/1,
    get_ids/0
]).

get(5) ->
    #{
        kill => 5,
        rumor => 30001        
    };
get(10) ->
    #{
        kill => 10,
        rumor => 30002        
    };
get(15) ->
    #{
        kill => 15,
        rumor => 30003        
    };
get(20) ->
    #{
        kill => 20,
        rumor => 30004        
    };
get(25) ->
    #{
        kill => 25,
        rumor => 30005        
    };
get(30) ->
    #{
        kill => 30,
        rumor => 30006        
    };
get(_ID) ->
    undefined.

get_ids() ->
    [5, 10, 15, 20, 25, 30].
