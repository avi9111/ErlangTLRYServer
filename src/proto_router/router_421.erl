%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     经脉夺宝
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_421).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_channel_draw:do(Cmd, PS, Req).
