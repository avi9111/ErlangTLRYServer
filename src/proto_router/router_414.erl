%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     帮派
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_414).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_guild:do(Cmd, PS, Req).
