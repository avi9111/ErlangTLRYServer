%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     英雄谱
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_418).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_hero:do(Cmd, PS, Req).
