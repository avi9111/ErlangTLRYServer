%%% ----------------------------------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     装备
%%% @end
%%% ----------------------------------------------------------------------------
-module(lib_equip_util).
-author("Ryuu").

-include("equip.hrl").

%% API
-export([
    upgrade/1
]).

upgrade(Equips) ->
    upgrade(Equips, []).

upgrade([], Acc) ->
    Acc;
upgrade([Equip | T], Acc) ->
    NewEquip = maps:merge(?equip, Equip),
    upgrade(T, [NewEquip | Acc]).


