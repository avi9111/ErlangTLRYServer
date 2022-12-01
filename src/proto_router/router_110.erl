%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%     游戏设置
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_110).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_setting:do(Cmd, PS, Req).
