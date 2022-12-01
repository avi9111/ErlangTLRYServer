%%-------------------------------------------------------
%% @File     : svr_client_recv
%% @Brief    : 压测客户端 socket托管进程
%% @Author   : cablsbs
%% @Date     : 2019-3-1
%%-------------------------------------------------------
-module(svr_client_recv).

-include("role.hrl").
-include("ret_code.hrl").
-include("proto/prot_900.hrl").
-include("proto/prot_901.hrl").

-export([
    start_link/3,
    init/3
]).


-define(TCP_LEN_HEADER, 9).                 % TCP消息头长度
-define(TCP_TIMEOUT_RECV, 3000).            % TCP接收消息超时时间
-define(TCP_TIMEOUT_HEART_BEAT, 10800).     % TCP心跳包超时时间
-define(TCP_MAXNUM_HEART_BEAT_TIMEOUT, 5).  % TCP心跳包超时次数 (5分钟心跳超时，服务端才做退出逻辑)
-define(PROTO_HEART_BEAT, 90009).           % TCP心跳包协议号

-define(CMD_MAXNUM_TOTAL_PER_SEC, 100).     % 每秒最大请求次数
-define(CMD_MAXNUM_PER_SEC, 14).            % 相同命令每秒次数

-record(client, {
    cli_id = 0,
    role_id = 0,
    socket = undefined,
    accname = "",
    timeout_total_num = 0
}).


%% Apis -------------------------------------------------
% @doc 启动 svr_client_recv
start_link(CliId, Socket, Accname) ->
    {ok, proc_lib:spawn_link(?MODULE, init, [CliId, Socket, Accname])}.

% @doc 初始化
init(CliId, Socket, Accname) ->
    process_flag(trap_exit, true),
    receive
        {ok, Socket} ->
            Client = #client{cli_id = CliId, socket = Socket, accname = Accname},
            read_loop(Client)
    end.


%% Privates ---------------------------------------------
-ifdef(async_net).

% @doc 异步接收消息
read_loop(Client) ->
    #client{socket = Socket} = Client,
    Ref0 = async_recv(Socket, ?TCP_LEN_HEADER, ?TCP_TIMEOUT_HEART_BEAT),
    % ?ERROR("Client: ~p, Socket: ~p, Ref0: ~p", [Client, Socket, Ref0]),
    receive
    % 接收到协议请求
        {inet_async, Socket, Ref0, {ok, <<Len:32, Cmd:32, ZipFlag:8>>}} ->
            % ?ERROR("Len: ~p, Cmd: ~p", [Len, Cmd]),
            case Len - ?TCP_LEN_HEADER of
                BodyLen when BodyLen > 0 ->
                    % ?ERROR("BodyLen: ~p", [BodyLen]),
                    Ref1 = async_recv(Socket, BodyLen, ?TCP_TIMEOUT_RECV),
                    receive
                        {inet_async, Socket, Ref1, {ok, Binary}} ->
                            BinaryFix = prot_util:unzip_bin(Binary, ZipFlag),
                            forward(Client, Cmd, BinaryFix);
                        Other ->
                            recv_error(Client, ?LINE, Other)
                    end;
                BodyLen when BodyLen =:= 0 ->
                    % ?ERROR("BodyLen: ~p", [BodyLen]),
                    forward(Client, Cmd, <<>>);
                _BodyLen ->
                    % ?ERROR("BodyLen: ~p", [_BodyLen]),
                    recv_error(Client, ?LINE, "error package")
            end;
        {inet_async, Socket, Ref0, {error, timeout}} ->
            % 接收超时
            % ?ERROR("timeout"),
            case Client#client.timeout_total_num >= ?TCP_MAXNUM_HEART_BEAT_TIMEOUT of
                true ->
                    recv_error(Client, ?LINE, timeout);
                false ->
                    read_loop(Client#client{timeout_total_num = Client#client.timeout_total_num + 1})
            end;
        {inet_async, Socket, Ref0, {error, closed}} ->
            % tcp 连接关闭
            recv_error(Client, ?LINE, closed);
        {'EXIT', _Port, Reason} ->
            % 进程退出
            recv_error(Client, ?LINE, Reason);
        Other ->
            % 接收到格式错误请求
            recv_error(Client, ?LINE, Other)
    end.

% @doc 异步接收
async_recv(Socket, Len, Timeout) when is_port(Socket) ->
    % ?ERROR("Len: ~p", [Len]),
    case prim_inet:async_recv(Socket, Len, Timeout) of
        {ok, Ref} ->
            Ref;
        {error, Reason} ->
            % ?ERROR("async recv error: ~p", [Reason]),
            throw({Reason});
        Result ->
            % ?ERROR("async recv Result: ~p", [Result]),
            throw({Result})
    end.

-else.

% @doc 同步接收消息
read_loop(Client) ->
    #client{socket = Socket} = Client,
    case gen_tcp:recv(Socket, 6, ?TCP_TIMEOUT_HEART_BEAT) of
        {ok, <<Len:16, Cmd:32>>} ->
            BodyLen = Len - ?TCP_LEN_HEADER,
            case BodyLen > 0 of
                true ->
                    case gen_tcp:recv(Socket, BodyLen, ?TCP_TIMEOUT_RECV) of
                        {ok, Binary} -> forward(Client, Cmd, Binary);
                        Other -> logout(Client, 0, ?LINE, Other)
                    end;
                false when BodyLen =:= 0 ->
                    forward(Client, Cmd, <<>>);
                false ->
                    logout(Client, 0, ?LINE, "error packet")
            end;
        {error, timeout} ->
            % 接收超时
            case Client#client.timeout_total_num >= ?TCP_MAXNUM_HEART_BEAT_TIMEOUT of
                true -> enter_hanging(Client, timeout);
                false -> read_loop(Client#client{timeout_total_num = Client#client.timeout_total_num + 1})
            end;
        {error, closed} ->
            % 用户断开
            enter_hanging(Client, closed);
        Other ->
            % 接收到格式错误请求等
            logout(Client, 0, ?LINE, Other)
    end.

-endif.


% @doc 解析消息
forward(Client, Cmd, Binary) ->
    case validate(Cmd, Client) of
        {ok, Client1} ->
            case prot_msg:decode_msg(Cmd, Binary) of
                {ok, Data} ->
                    prot_debug:print_recv_prots(Client#client.accname, Client#client.role_id, Cmd, Data),
                    handle(Client1, Cmd, Data);
                _ ->
                    ?ERROR("decode fail, handle Cmd: ~p, Binary: ~p", [Cmd, Binary]),
                    recv_error(Client, ?LINE, "error package")
            end;
        {false, Client1} ->
            % ?ERROR("validate msg from Accname: ~p fail ! Cmd: ~p, Binary: ~p", [Client#client.accname, Cmd, Binary]),
            read_loop(Client1)
    end.

%% @doc 处理消息
% 登陆验证结果
handle(#client{cli_id = CliId} = Client, 90001, #role_login_check_resp{res = LoginChkRet}) ->
    case LoginChkRet of
        ?RC_SUCCEED ->
            svr_client:send_heart_beat(CliId),
            svr_client:login(CliId),
            read_loop(Client);
        _ ->
            svr_client:logout(CliId)
    end;
% 心跳包返回
handle(#client{cli_id = CliId} = Client, 90010, #heart_beat_resp{}) ->
    svr_client:info_after(CliId, 'send_heart_beat', 10000),
    read_loop(Client);
% 场景信息返回
handle(#client{cli_id = CliId} = Client, 90101, #role_enter_scene_info_resp{scene_id = SceneId}) ->
    svr_client:load_scene(CliId, SceneId),
    read_loop(Client);
% 登陆返回
handle(#client{cli_id = CliId} = Client, 90011, #select_role_login_resp{result = Result}) ->
    case Result of
        ?RC_SUCCEED ->
            svr_client:enter_scene_info(CliId),
            read_loop(Client);
        _ ->
            svr_client:logout(CliId)
    end;
% 创角返回
handle(#client{cli_id = CliId} = Client, 90007, #role_create_resp{result = Result}) ->
    case Result of
        ?RC_SUCCEED ->
            svr_client:login(CliId),
            read_loop(Client);
        _ ->
            svr_client:logout(CliId)
    end;
% 其他 TODO
handle(Client, _Cmd, _Data) ->
    read_loop(Client).

% @doc 检查请求有效性
validate(_Cmd, Client) ->
    {ok, Client}.

recv_error(#client{cli_id = CliId}, Line, Error) ->
    ?ERROR("CliId: ~p recv error from server, Line: ~p, Error: ~p", [CliId, Line, Error]),
    Error =/= closed andalso svr_client:logout(CliId).
