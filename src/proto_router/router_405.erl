%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     排行榜
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_405).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_rank:do(Cmd, State, MsgRecord).
