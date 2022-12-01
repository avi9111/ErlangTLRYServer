%%%-------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     日志模块
%%% @end
%%%-------------------------------------------------------------------
-module(log).
-author("Ryuu").

%% API
-export([
    info/2,
    debug/2,
    error/2
]).

info(F, A) ->
    lager:log(info, self(), F, A).

debug(F, A) ->
    lager:log(debug, self(), F, A).

error(F, A) ->
    lager:log(error, self(), F, A).
