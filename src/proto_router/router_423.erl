%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     任务
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_423).

-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_task:do(Cmd, State, MsgRecord).
