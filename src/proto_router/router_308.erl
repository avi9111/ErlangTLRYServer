%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     拍卖行
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_308).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_auction:do(Cmd, PS, Req).
