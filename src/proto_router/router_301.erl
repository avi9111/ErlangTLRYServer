%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     活动
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_301).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_activity:do(Cmd, State, MsgRecord).
