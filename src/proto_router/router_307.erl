%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     宋辽战争 [玩家]
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_307).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_dynasty_war:do(Cmd, PS, Req).
