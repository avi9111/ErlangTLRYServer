%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 九月 2019 17:26
%%%-------------------------------------------------------------------
-module(test_default).
-author("Administrator").

%% API
-export([handle/3]).

handle(Client, _Cmd, R) ->
    io:format("Module:[~p], Line:[~p],  R...........:~p~n", [?MODULE, ?LINE, R]),
    Client.