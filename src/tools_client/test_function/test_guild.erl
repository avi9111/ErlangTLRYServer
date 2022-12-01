%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 10月 2019 17:42
%%%-------------------------------------------------------------------
-module(test_guild).
-author("Administrator").
-include("svr_client.hrl").
-include("../include/proto/prot_414.hrl").
%% API
-export([get_info/1, get_guild_list/1, get_apply_list/1, create_guild/1, apply_guild/2, cancel_apply/2, handle_apply/3]).
-export([handle/3]).


get_info(CliId) ->
    Ets = ?to_ets(CliId),
    Bin = <<>>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41401, Bin).

get_guild_list(CliId) ->
    Ets = ?to_ets(CliId),
    Bin = <<>>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41403, Bin).


create_guild(CliId) ->
    Ets = ?to_ets(CliId),
    Name = lists:concat(["my", util:rand(1, 500)]),
    NameBin = prot_util:pack(Name, string),
    WordBin = prot_util:pack("ttt", string),
    Bin = <<
        1:8,
        NameBin/binary,
        WordBin/binary
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41411, Bin).

get_apply_list(CliId) ->
    Ets = ?to_ets(CliId),
    Bin = <<>>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41409, Bin).

apply_guild(CliId, GuildId) ->
    Ets = ?to_ets(CliId),
    Bin = <<
        GuildId:64
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41413, Bin).

cancel_apply(CliId, GuildId) ->
    Ets = ?to_ets(CliId),
    Bin = <<
        GuildId:64
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41415, Bin).

handle_apply(CliId, RoleId, Type) ->
    Ets = ?to_ets(CliId),
    Bin = <<
        RoleId:64,
        Type:8
    >>,
    Socket = util:get_ets(Ets, 'socket'),
    recv_loop:do_send_req(Socket, 41419, Bin).

handle(Client, 41402, #sc_guild_info{guild = Guild}) ->
    ?print_return("get_info_resp", Guild),
    Client;
handle(Client, 41404, #sc_guild_list{list = GuildList}) ->
    Ids = [H#clt_guild_brief.id || H <- GuildList],
    io:format("Module:[~p], Line:[~p],  Ids...........:~p~n", [?MODULE, ?LINE, Ids]),
    ?print_return("get_guild_list_resp", Ids),
    Client;
handle(Client, 41410, #sc_guild_get_join_req{list = List}) ->
    ?print_return("get_apply_list_resp", List),
    Client;
handle(Client, 41414, #sc_guild_join_req{id = ID}) ->
    ?print_return("apply_guild_resp", ID),
    Client;
handle(Client, 41418, #sc_guild_notify_cancel_req{list = List}) ->
    ?print_return("cancel_apply_resp", List),
    Client;
handle(Client, 41420, #sc_guild_handle_req{list = List, approve = Action}) ->
    ?print_return("handle_apply_resp", {Action, List}),
    Client;
handle(Client, 41412, #sc_guild_create{id = GuildID}) ->
    ?print_return("create_guild_resp", GuildID),
    Client;
handle(Client, _, _Resp) ->
    io:format("Module:[~p], Line:[~p],  _Resp...........:~p~n", [?MODULE, ?LINE, _Resp]),
    Client.