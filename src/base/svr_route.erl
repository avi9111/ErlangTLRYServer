%%-------------------------------------------------------
%% @File     : svr_route
%% @Brief    : 角色socket托管进程
%% @Author   : cablsbs
%% @Date     : 2018-6-16
%%-------------------------------------------------------
-module(svr_route).

-include("role.hrl").
-include("ret_code.hrl").

-export([
    start_link/0,
    init/0
]).

-define(TCP_LEN_HEADER, 6).                 % TCP消息头长度
-define(TCP_TIMEOUT_RECV, 3000).            % TCP接收消息超时时间
-define(TCP_TIMEOUT_HEART_BEAT, 10800).     % TCP心跳包超时时间
-define(TCP_MAXNUM_HEART_BEAT_TIMEOUT, 5). % TCP心跳包超时次数 (5分钟心跳超时，服务端才做退出逻辑)
-define(PROTO_HEART_BEAT, 90009).           % TCP心跳包协议号

-define(CMD_MAXNUM_TOTAL_PER_SEC, 100).     % 每秒最大请求次数
-define(CMD_MAXNUM_PER_SEC, 14).            % 相同命令每秒次数


%% Apis -------------------------------------------------
% @doc 启动 svr_route
start_link() ->
    {ok, proc_lib:spawn_link(?MODULE, init, [])}.

% @doc 初始化
init() ->
    process_flag(trap_exit, true),
    receive
        {ok, Socket} ->
            read_loop(#role{socket = Socket})
    end.


%% Privates ---------------------------------------------
-ifdef(async_net).

% @doc 异步接收消息
read_loop(Role) ->
    #role{socket = Socket} = Role,
    Ref0 = async_recv(Socket, ?TCP_LEN_HEADER, ?TCP_TIMEOUT_HEART_BEAT),
    receive
    % 接收到协议请求
        {inet_async, Socket, Ref0, {ok, <<Len:16, Cmd:32>>}} ->
            case Len - ?TCP_LEN_HEADER of
                BodyLen when BodyLen > 0 ->
                    Ref1 = async_recv(Socket, BodyLen, ?TCP_TIMEOUT_RECV),
                    receive
                        {inet_async, Socket, Ref1, {ok, Binary}} ->
                            forward(Role, Cmd, Binary);
                        Other ->
                            logout(Role, 0, ?LINE, Other)
                    end;
                BodyLen when BodyLen =:= 0 ->
                    forward(Role, Cmd, <<>>);
                _BodyLen ->
                    logout(Role, 0, ?LINE, "error package")
            end;
        {inet_async, Socket, Ref0, {error, timeout}} ->
            % 接收超时
            case Role#role.timeout_total_num >= ?TCP_MAXNUM_HEART_BEAT_TIMEOUT of
                true ->
                    ?ERROR_TOC(Role, ?RC_LINK_STATE_TIMEOUT),
                    enter_hanging(Role, timeout);
                false ->
                    read_loop(Role#role{timeout_total_num = Role#role.timeout_total_num + 1})
            end;
        {inet_async, Socket, Ref0, {error, closed}} ->
            % tcp 连接关闭
            enter_hanging(Role, closed);
        {'EXIT', _Port, Reason} ->
            % 进程退出
            logout(Role, 0, ?LINE, Reason);
        Other ->
            % 接收到格式错误请求
            logout(Role, 0, ?LINE, Other)
    end.

% @doc 异步接收
async_recv(Socket, Len, Timeout) when is_port(Socket) ->
    case prim_inet:async_recv(Socket, Len, Timeout) of
        {ok, Ref} ->
            Ref;
        {error, Reason} ->
            ?ERROR("async recv error: ~p", [Reason]),
            throw({Reason});
        Result ->
            ?ERROR("async recv Result: ~p", [Result]),
            throw({Result})
    end.

-else.

read_loop(Role) ->
% @doc 同步接收消息
    #role{socket = Socket} = Role,
    case gen_tcp:recv(Socket, 6, ?TCP_TIMEOUT_HEART_BEAT) of
        {ok, <<Len:16, Cmd:32>>} ->
            BodyLen = Len - ?TCP_LEN_HEADER,
            case BodyLen > 0 of
                true ->
                    case gen_tcp:recv(Socket, BodyLen, ?TCP_TIMEOUT_RECV) of
                        {ok, Binary} -> forward(Role, Cmd, Binary);
                        Other -> logout(Role, 0, ?LINE, Other)
                    end;
                false when BodyLen =:= 0 ->
                    forward(Role, Cmd, <<>>);
                false ->
                    logout(Role, 0, ?LINE, "error package")
            end;
        {error, timeout} ->
            % 接收超时
            case Role#role.timeout_total_num >= ?TCP_MAXNUM_HEART_BEAT_TIMEOUT of
                true -> enter_hanging(Role, timeout);
                false -> read_loop(Role#role{timeout_total_num = Role#role.timeout_total_num + 1})
            end;
        {error, closed} ->
            % 用户断开
            enter_hanging(Role, closed);
        Other ->
            % 接收到格式错误请求等
            logout(Role, 0, ?LINE, Other)
    end.

-endif.


% @doc 解析消息
forward(Role, Cmd, Binary) ->
    case validate(Cmd, Role) of
        {ok, Role1} ->
            case prot_msg:decode_msg(Cmd, Binary) of
                {ok, Data} ->
                    prot_debug:print_recv_prots(Role#role.accname, Role#role.id, Cmd, Data),
                    handle(Role1, Cmd, Data);
                _ ->
                    ?ERROR("decode fail, handle Cmd: ~p, Binary: ~p", [Cmd, Binary]),
                    ?ERROR(Role, ?RC_LINK_ERROR_PACKAGE),
                    logout(Role, 0, ?LINE, "error package")
            end;
        {false, Role1} ->
            ?ERROR("validate msg from Accname: ~p fail ! Cmd: ~p, Binary: ~p", [Role#role.accname, Cmd, Binary]),
            read_loop(Role1)
    end.

% @doc 处理消息
handle(#role{socket = Socket} = Role, Cmd, Data) when is_pid(Role#role.pid), Cmd =/= ?PROTO_HEART_BEAT ->
    case catch gen:call(Role#role.pid, '$gen_call', {'SOCKET_CMD', Socket, Cmd, Data}) of
        {ok, _Res} -> read_loop(Role);
        {'EXIT', Reason} -> logout(Role, Cmd, ?LINE, Reason)
    end;
handle(Role, Cmd, Data) ->
    RouterMod = prot_mod:get_router(Cmd),
    case catch RouterMod:do(Cmd, Role, Data) of
        {ok, Role1} ->
            read_loop(Role1);
        {ok, start, Role1} ->
            read_loop(Role1);
        Err ->
            ?ERROR("handle cmd: ~p failed !~nError: ~p", [Cmd, Err]),
            read_loop(Role)
    end.

% @doc 退出游戏
logout(#role{pid = RolePid} = Role, Cmd, Line, Reason) ->
    IsClosingSvr = util_svr:is_closing_svr(),
    if
        IsClosingSvr ->
            skip;
        is_pid(RolePid) ->
            is_process_alive(RolePid) andalso
                lib_login:logout_close(RolePid, Role#role.socket),
%%            lists:member(Reason, [closed, timeout, normal]) orelse
            lists:member(Reason, [closed, normal]) orelse
                ?ERROR("Account: ~p close ! Cmd: ~w, Line: ~w, Reason ~w, ", [Role#role.accname, Cmd, Line, Reason]),
            timer:sleep(1000);
        true ->
            skip
    end,
    supervisor:terminate_child(sup_route, self()).

% @doc 挂起(等待重连)
enter_hanging(#role{pid = RolePid}, Reason) ->
    IsClosingSvr = util_svr:is_closing_svr(),
    if
        IsClosingSvr ->
            skip;
        is_pid(RolePid) ->
            is_process_alive(RolePid) andalso svr_role:hanging(RolePid, Reason),
            timer:sleep(1000);
        true ->
            skip
    end,
    supervisor:terminate_child(sup_route, self()).


% @doc 检查请求有效性 TODO
validate(_Cmd, #role{login_flag = 0} = Role) ->
    {ok, Role};
validate(_Cmd, Role) ->
    {ok, Role#role{cmd_total_num = 0, cmd_list = []}}.
% validate(Cmd, Role) ->
%     NowTime = time:unixtime(),
%     case NowTime - Role#role.cmd_last_time > 0 of
%         % 超过1秒
%         true ->
%             {ok, Role#role{cmd_last_time = NowTime, cmd_total_num = 0, cmd_list = []}};
%         % 未超过1秒
%         false ->
%             {NewCmdlist, NewCmdNum} = case lists:keyfind(Cmd, 1, Role#role.cmd_list) of
%                 false ->
%                     {Role#role.cmd_list ++ [{Cmd, 1}], 1};
%                 {_, Num} ->
%                     NewNum = Num + 1,
%                     {lists:keyreplace(Cmd, 1, Role#role.cmd_list, {Cmd, NewNum}), NewNum}
%             end,
%             NewCmdtoTalNum = Role#role.cmd_total_num + 1,
%             case NewCmdtoTalNum > ?CMD_MAXNUM_TOTAL_PER_SEC orelse NewCmdNum > ?CMD_MAXNUM_PER_SEC of
%                 true ->
%                     {false, Role#role{cmd_total_num = NewCmdtoTalNum, cmd_list = NewCmdlist}};
%                 false ->
%                     {ok, Role#role{cmd_total_num = NewCmdtoTalNum, cmd_list = NewCmdlist}}
%             end
%     end.
