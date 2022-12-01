%%-------------------------------------------------------
%% @File     : router_default
%% @Brief    : 未定义协议组
%% @Author   : cablsbs
%% @Date     : 2018-6-11
%%-------------------------------------------------------
-module(router_default).

-include("log.hrl").

-export([
    do/3,
    response/3
]).


%% Apis -------------------------------------------------
%% 处理协议
do(Cmd, State, MsgRecord) ->
    ?ERROR("Receive unexpected Cmd: ~p, MsgRecord: ~p at Pid: ~p, State: ~p", [Cmd, self(), State, MsgRecord]),
    ok.

%% 处理协议返回
response(Cmd, State, RetData) ->
    ?ERROR("Handling unexpected response, Cmd: ~p, MsgRecord: ~p at Pid: ~p, State: ~p", [Cmd, self(), State, RetData]),
    ok.


