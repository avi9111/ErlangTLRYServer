%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 九月 2019 17:21
%%%-------------------------------------------------------------------
-module(test_role_prize).
-author("Administrator").
-include("proto/prot_426.hrl").
-include("svr_client.hrl").
%% API
-export([handle/3]).

%%handle(#client{cli_id = CliId} = Client, 42602, Resp) ->
%%    #sc_prize_info{} = Resp,

handle(Client, _, _) ->
    Client.
