%%% -----------------------------------------------------
%%% @author Ryuu
%%% @copyright (C) 2018, Nemo
%%% @doc
%%%     配置
%%% @end
%%% -----------------------------------------------------
-module(config).
-author("Ryuu").

-include("common.hrl").

%% API
-export([
    can_miji/0,
    is_release/0,
    get_string/1,
    get_ticket/0,
    get_server_num/0,
    get_server_name/0,
    get_server_ip/0,
    get_server_port/0,
    get_sys_config/1,
    get_sys_config/2,

    is_close_test/0,
    get_close_test_ip/0,
    get_close_test_time/0,
    get_close_test_white/0,
    get_test_ip/0,
    get_test_server_id/0,
    get_test_port/0
]).

%% Apis -------------------------------------------------
% @doc 获取开秘籍标志位
can_miji() ->
    case application:get_env(?APP_NAME, miji) of
        {ok, CanMiJi} -> CanMiJi;
        _ -> false
    end.

% @doc 是否测试环境
is_release() ->
    case application:get_env(?APP_NAME, release) of
        {ok, true} -> true;
        _ -> false
    end.

% @doc 获取字符串
get_string(Key) ->
    get_string(Key, <<"">>).

% @doc 私钥
get_ticket() ->
    case application:get_env(?APP_NAME, ticket) of
        {ok, Ticket} -> Ticket;
        _ -> "ticket"
    end.

% @doc 获取当前服id
get_server_num() ->
    case application:get_env(?APP_NAME, server_num) of
        {ok, ServerNum} when is_integer(ServerNum) ->
            ServerNum;
        _ ->
            ?DEFAULT_SERVER_NUM
    end.

% @doc 获取当前服名
get_server_name() ->
    case application:get_env(?APP_NAME, server_name) of
        {ok, ServerName} ->
            ServerName;
        _ ->
            ?DEFAULT_SERVER_NAME
    end.

% @doc 获取当前服ip
get_server_ip() ->
    case application:get_env(?APP_NAME, server_ip) of
        {ok, ServerIp} ->
            ServerIp;
        _ ->
            ?DEFAULT_SERVER_IP
    end.

% @doc 获取当前服端口号
get_server_port() ->
    % case application:get_env(?APP_NAME, server_port) of
    %     {ok, ServerPort} when is_integer(ServerPort) ->
    %         ServerPort;
    %     _ ->
    %         ?DEFAULT_SERVER_PORT
    % end.
    8002.
% @doc 获取通用配置
get_sys_config(Key) ->
    get_sys_config(Key, undefined).

% @doc 获取通用配置(带默认值)
get_sys_config(Key, Default) ->
    case conf_sys_config:get(Key) of
        #{value := Value} ->
            Value;
        _ ->
            Default
    end.


% @doc 获取内测开关
is_close_test() ->
    case application:get_env(?APP_NAME, close_test) of
        {ok, CloseTest} -> CloseTest;
        _ -> false
    end.

% @doc 获取内测Ip列表
get_close_test_ip() ->
    case application:get_env(?APP_NAME, close_test_ip) of
        {ok, IpList} -> IpList;
        _ -> []
    end.

% @doc 获取内测开启时间
get_close_test_time() ->
    case application:get_env(?APP_NAME, close_test_time) of
        {ok, TimeStamp} -> TimeStamp;
        _ -> 0
    end.

% @doc 获取内测白名单开关
get_close_test_white() ->
    case application:get_env(?APP_NAME, close_test_white) of
        {ok, IsWhite} -> IsWhite;
        _ -> false
    end.

get_test_ip() ->
    case application:get_env(?APP_NAME, test_ip) of
        {ok, TestIp} -> TestIp;
        _ -> config:get_server_ip()
    end.

get_test_port() ->
    case application:get_env(?APP_NAME, test_port) of
        {ok, TestPort} -> TestPort;
        _ -> config:get_server_port()
    end.

get_test_server_id() ->
    case application:get_env(?APP_NAME, test_server_id) of
        {ok, Id} -> Id;
        _ -> config:get_server_num()
    end.

%% Privates ---------------------------------------------
get_string(Key, Default) ->
    case conf_string:get(Key) of
        #{string := Str} ->
            Str;
        _ ->
            Default
    end.
