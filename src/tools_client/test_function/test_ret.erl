%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 10月 2019 17:59
%%%-------------------------------------------------------------------
-module(test_ret).
-author("Administrator").
-include("../include/proto/prot_105.hrl").
-include("svr_client.hrl").
%% API
-export([handle/3]).


handle(Client, 10501, #sc_general_ret_code{code = Code}) ->
    ?print_return("oper_return ", Code),
    Client;
handle(Client, 10502, #sc_general_ret_code_e{code = Code, args = Args}) ->
    ?print_return("oper_return ", {Code, Args}),
    Client;
handle(Client, _, _) ->
    Client.