%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     玩家查看
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_404).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, State, MsgRecord) ->
    lib_role_view:do(Cmd, State, MsgRecord).
