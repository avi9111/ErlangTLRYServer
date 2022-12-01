%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc        202
%%%
%%% @end
%%% Created : 25. 九月 2019 21:54
%%%-------------------------------------------------------------------
-module(test_equip).
-author("Administrator").
-include("svr_client.hrl").
%% API

-export([handle/3]).


handle(Client, 20201, #sc_equip_info{equips = Equips}) ->
    #client{ets = Ets} = Client,
    ets:insert(Ets, {'equip', Equips}),
    Client;
handle(Client, _, _) ->
    Client.

