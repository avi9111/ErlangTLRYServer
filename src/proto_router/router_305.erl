%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%     等级礼包
%%% @end
%%% ----------------------------------------------------------------------------
-module(router_305).
-author("Ryuu").

%% API
-export([
    do/3
]).

do(Cmd, PS, Req) ->
    lib_role_lv_gift:do(Cmd, PS, Req).
