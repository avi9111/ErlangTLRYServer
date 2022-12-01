%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     邮件
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_403).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_mail:do(Cmd, State, MsgRecord).
