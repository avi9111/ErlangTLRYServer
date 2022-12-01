%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 九月 2019 10:11
%%%-------------------------------------------------------------------
-module(test_role).
-author("Administrator").

%% API
-export([handle/3, bang_yuan/1, yuan_bao/1, cheat/2, cheat/3]).

bang_yuan(CliId) ->
    cheat(CliId, 15010006, 1).

yuan_bao(CliId) ->
    cheat(CliId, 16590207, 1).

cheat(CliId, Id, Num) ->
%%    元宝卡  15015008
%%    绑元	15010006
    Bin = prot_util:pack(lists:concat(["add", "_item_", Id, "_", Num]), string),
    svr_client:send_req(CliId, 10601, <<Bin/binary>>).

cheat(CliId, "full_hp") ->
    Bin = prot_util:pack("full_hp", string),
    svr_client:send_req(CliId, 10601, <<Bin/binary>>);
    cheat(CliId, "powerful") ->
    Bin = prot_util:pack("powerful", string),
    svr_client:send_req(CliId, 10601, <<Bin/binary>>);
cheat(CliId, "full_mp") ->
    Bin = prot_util:pack("full_mp", string),
    svr_client:send_req(CliId, 10601, <<Bin/binary>>);
cheat(CliId, Level) ->
    Bin = prot_util:pack(
        "set_lv_" ++ integer_to_list(Level), string),
    svr_client:send_req(CliId, 10601, <<Bin/binary>>).

handle(Client, _, _) ->
    Client.
