%%-------------------------------------------------------
%% @File     : svr_client_recv
%% @Brief    : 压测客户端 socket托管进程
%% @Author   : cablsbs
%% @Date     : 2019-3-1
%%-------------------------------------------------------
-module(recv_loop).
-export([
    start_link/5,
    init/5
]).

-export([do_send_req/3, update_ets/2]).
-include("svr_client.hrl").

%% Apis -------------------------------------------------
% @doc 启动 svr_client_recv
start_link(CliId, Socket, Accname, ServerId, RoleID) ->
    {ok, proc_lib:spawn_link(?MODULE, init, [CliId, Socket, Accname, ServerId, RoleID])}.

update_ets(Ets, KV) ->
    ets:insert(Ets, KV).

% @doc 初始化
init(CliId, Socket, Accname, ServerId, RoleID) ->
    process_flag(trap_exit, true),
    receive
        {ok, Socket} ->
            Ets = ets:new(?to_ets(CliId), [named_table, public]),
            ets:insert(Ets, {'socket', Socket}),
            ets:insert(Ets, {'recv_pid', self()}),
            Client = #client{cli_id = CliId, socket = Socket, accname = Accname,
                server_id = ServerId, ets = Ets, role_id = RoleID},
            read_loop(Client)
    end.


%% Privates ---------------------------------------------
% @doc 异步接收消息
read_loop(Client) ->
    #client{socket = Socket} = Client,
    Ref0 = async_recv(Socket, ?TCP_LEN_HEADER, ?TCP_TIMEOUT_HEART_BEAT),
    receive
        {inet_async, Socket, Ref0, {ok, <<Len:32, Cmd:32, ZipFlag:8>>}} ->
            case Len - ?TCP_LEN_HEADER of
                BodyLen when BodyLen > 0 ->
                    Ref1 = async_recv(Socket, BodyLen, ?TCP_TIMEOUT_RECV),
                    receive
                        {inet_async, Socket, Ref1, {ok, Binary}} ->
                            BinaryFix = prot_util:unzip_bin(Binary, ZipFlag),
                            forward(Client, Cmd, BinaryFix);
                        Other ->
                            recv_error(Client, ?LINE, Other)
                    end;
                BodyLen when BodyLen =:= 0 ->
                    forward(Client, Cmd, <<>>);
                _BodyLen ->
                    ?ERROR("read_loop_error, Cmd :~p", [Cmd]),
                    recv_error(Client, ?LINE, "error package")
            end;
        {inet_async, Socket, Ref0, {error, timeout}} ->
            case Client#client.timeout_total_num >= ?TCP_MAXNUM_HEART_BEAT_TIMEOUT of
                true ->
                    recv_error(Client, ?LINE, timeout);
                false ->
                    read_loop(Client#client{timeout_total_num = Client#client.timeout_total_num + 1})
            end;
        {inet_async, Socket, Ref0, {error, closed}} ->
            recv_error(Client, ?LINE, closed);
        {error, Cmd, Reason} ->
            recv_error(Client, ?LINE, {Cmd, Reason});
        {'EXIT', _Port, Reason} ->
            recv_error(Client, ?LINE, Reason);
        Other ->
            % 接收到格式错误请求
            recv_error(Client, ?LINE, Other)
    end.

% @doc 异步接收
async_recv(Socket, Len, Timeout) when is_port(Socket) ->
    case prim_inet:async_recv(Socket, Len, Timeout) of
        {ok, Ref} ->
            Ref;
        {error, Reason} ->
            throw({Reason});
        Result ->
            throw({Result})
    end.


% @doc 解析消息
forward(Client, Cmd, Binary) ->
    case validate(Cmd, Client) of
        {ok, Client1} ->
            case prot_msg:decode_msg(Cmd, Binary) of
                {ok, Data} ->
                    handle(Client1, Cmd, Data);
                _ ->
                    ?ERROR("decode fail, handle Cmd: ~p, Binary: ~p", [Cmd, Binary]),
                    recv_error(Client, ?LINE, "error package")
            end;
        {false, Client1} ->
            read_loop(Client1)
    end.

% 心跳包返回
handle(#client{cli_id = CliId} = Client, 90010, #heart_beat_resp{}) ->
    svr_client:info_after(CliId, 'send_heart_beat', 10000),
    read_loop(Client);
handle(Client, Cmd, Resp) ->
    Mod = recv_lib:route(Cmd),
    case Mod:handle(Client, Cmd, Resp) of
        #client{} = ClientN ->
            read_loop(ClientN);
        _ ->
            exit({error, Cmd, Resp})
%%            throw({Cmd, Resp})
    end.


% @doc 检查请求有效性
validate(_Cmd, Client) ->
    {ok, Client}.

recv_error(#client{cli_id = CliId}, _Line, _Error) ->
%%    ?ERROR("CliId: ~p recv error from server, Line: ~p, Error: ~p, stacktrace: ~p",
%%        [CliId, Line, Error, erlang:get_stacktrace()]),
    client_trig:unregister(CliId),
    svr_client:logout(CliId).


do_send_req(Socket, ProtNum, Bin) ->
    WithHeader = with_header(ProtNum, Bin),
    gen_tcp:send(Socket, WithHeader).

with_header(ProtNum, Bin) ->
    BinSize = size(Bin),
    PackSize = BinSize + 6,
    <<PackSize:16, ProtNum:32, Bin/binary>>.