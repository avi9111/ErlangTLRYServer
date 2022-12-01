%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. 11月 2019 12:28
%%%-------------------------------------------------------------------
-module(test_shop).
-author("Administrator").
-include("svr_client.hrl").
-include("proto/prot_506.hrl").
-include("proto/prot_531.hrl").

%% API
-export([wm_card/1, buy_card/3, buy_fund/2, handle/3]).

wm_card(CliID) ->
    Ets = ?to_ets(CliID),
    Bin = <<
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 50601, Bin).

buy_card(Cliid, Type, Num) ->
    Ets = ?to_ets(Cliid),
    Bin = <<
        Num:8,
        Type:8
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 50605, Bin).

buy_fund(Cliid, Type) ->
    Ets = ?to_ets(Cliid),
    Bin = <<
        Type:8
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 53144, Bin).

handle(Client, 50602, #sc_card_info{info = Info}) ->
    [begin
        ?print_return("wm_card_resp", {Type, time:unixtime_to_localtime(Time), Flag})
    end || {Type, Time, Flag} <- Info],
    Client;
handle(Client, 50603, #sc_card_change{info = Info}) ->
    ?print_return("buy_card_resp", Info),
    Client;
handle(Client, 53111, #sc_grow_fund_info{grade = Grade}) ->
    ?print_return("buy_fund_resp", Grade),
    Client;
handle(Client, _, _) ->
    Client.