%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 一月 2019 19:57
%%%-------------------------------------------------------------------
-module(router_537).

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_questionnaire:do(Cmd, PS, Req).
