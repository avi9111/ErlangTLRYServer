%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     装备采集 [非场景采集]
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_208).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_gather:do(Cmd, PS, Req).
