%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     物品
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_201).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_goods:do(Cmd, State, MsgRecord).
