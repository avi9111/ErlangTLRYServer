%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     装备
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_202).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_equip:do(Cmd, PS, Req).