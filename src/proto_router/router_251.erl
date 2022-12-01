%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     功能开放、新手步骤
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_251).
-author("Ryuu").

-include("role.hrl").
-include("proto/prot_251.hrl").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_func:do(Cmd, PS, Req).
