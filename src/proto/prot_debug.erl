%%-------------------------------------------------------
%% @File     : prot_debug
%% @Brief    : 调试协议工具
%% @Author   : cablsbs
%% @Date     : 2018-8-27
%%-------------------------------------------------------
-module(prot_debug).

-include("log.hrl").

-export([
    print_sent_prots/1,
    print_recv_prots/4
]).


-define(WALK_PROTOS, [90200, 90201, 90202, 90307, 90308]).
-define(SYNC_OBJ_PROTOS, [90232, 90233, 90234, 90235, 90236, 90237]).
-define(SYNC_ROLE_PROTOS, [90232, 90233]).
-define(SYNC_MON_PROTOS, [90234, 90235]).
-define(REVIVE_PROTOS, [90106, 90107, 90248, 90307, 90308]).
-define(BATTLE_PROTOS, [90300, 90301, 90302, 90305]).
-define(RIVAL_PROTOS, [90114, 90115, 90116, 90117]).

%-define(IS_DEBUG_ON, 1).                                % 是否开启打印, 注释此行关闭打印
-define(DEBUG_PROT_SETS, []).                        % 协议组列表
-define(DEBUG_DETAIL_PROTS, []).                        % 协议id列表


%% Apis -------------------------------------------------

-ifdef(IS_DEBUG_ON).
%% 打印服务器发送的数据
print_sent_prots(<<Size:32, Cmd:32, ZipFlag:8, RBin/binary>>) ->
    Bytes = Size - 9,
    DataBinT = binary_part(RBin, {0, Bytes}),
    Bits = Bytes * 8,
    <<_:Bits, RestMsgBin/binary>> = RBin,
    case is_need_print(Cmd) of
        true ->
            Accname = get(accname),
            RoleId = get(role_id),
            DataBin = prot_util:unzip_bin(DataBinT, ZipFlag),
            {ok, ProtMsg} = prot_msg:decode_msg(Cmd, DataBin),
            ?DEBUG_NOMETA("~n>>>> ~p to Role ~p:~p !~nMsg: ~p~n~n", [Cmd, Accname, RoleId, ProtMsg]);
        false ->
            skip
    end,
    print_sent_prots(RestMsgBin);
print_sent_prots(<<>>) ->
    ok.

%% 打印服务器接收的数据
print_recv_prots(Accname, RoleId, Cmd, Data) ->
    case is_need_print(Cmd) of
        true when Accname =/= undefined ->
            ?DEBUG_NOMETA("~n<<<< ~p from Role ~p:~p !~nData: ~p~n~n", [Cmd, Accname, RoleId, Data]);
        true ->
            ?DEBUG_NOMETA("~n<<<< ~p from InComing Role !~nData: ~p~n~n", [Cmd, Data]);
        _ -> skip
    end.

-else.

print_sent_prots(_Bin) -> ok.
%%print_sent_prots(<<>>) -> ok;
%%print_sent_prots(<<_Size:32, Cmd:32, _ZipFlag:8, _RBin/binary>>) ->
%%    Cmd =/= 90010 andalso io:format("Module:[~p], Line:[~p],  print_sent_prots...........:~p~n", [?MODULE, ?LINE, Cmd]),
%%    ok.
%%print_recv_prots(Accname, RoleId, Cmd, Data) ->
print_recv_prots(_Accname, _RoleId, _Cmd, _Data) ->
%%    io:format("~n<<<< ~p from Role ~p:~p !~nData: ~p~n~n", [Cmd, Accname, RoleId, Data]),
%%    Cmd =/= 90009 andalso io:format("Module:[~p], Line:[~p],  print_recv_prots...........:~p~n", [?MODULE, ?LINE, Cmd]),
    ok.

-endif.


%% Privates ---------------------------------------------
-ifdef(IS_DEBUG_ON).
is_need_print(Cmd) ->
    case lists:member(Cmd, ?DEBUG_DETAIL_PROTS) of
        true -> true;
        false -> lists:member(Cmd div 100, ?DEBUG_PROT_SETS)
    end.

-endif.
